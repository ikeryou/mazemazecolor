ColorPallet = require('./ColorPallet');


# ---------------------------------------------------
# コンテンツ
# ---------------------------------------------------
class Contents
  
  
  # -----------------------------------------------
  # コンストラクタ
  # -----------------------------------------------
  constructor: ->
    
    # カラーパレット
    @_colorPallet = [];
    
    # 背景色
    @_bgColor;
    
    
    
  # -----------------------------------------------
  # 初期化
  # -----------------------------------------------
  init: =>
    
    # 背景色
    @_bgColor = new THREE.Color();
    
    # カラーパレット
    i = 0;
    while i < 2
      c = new ColorPallet({
        id:"xColorPallet" + String(i),
        resize:false
      });
      c.init();
      @_colorPallet[i] = c;
      i++;
    
    
    
    MY.resize.add(@_resize, true);
    MY.update.add(@_update);
  
  
  
  # -----------------------------------
  # resize
  # -----------------------------------
  _resize: (w, h) =>
    
    @_colorPallet[0].setSizePos(w, ~~(h * 0.5), 0, 0);
    @_colorPallet[1].setSizePos(w, h - ~~(h * 0.5), 0, ~~(h * 0.5));
  
  
  
  # -----------------------------------
  # update
  # -----------------------------------
  _update: =>
  
    s = $(window).scrollTop();
    
    topColor = @_colorPallet[0].getColor();
    btmColor = @_colorPallet[1].getColor();
    
    minDist = MY.resize.sh() * 0.5;
    
    if s < 0
      # 下にスクロール限界突破
      # 下の色を引いていく
      rate = MY.u.map(s, 1, 0, -minDist, 0);
      @_bgColor.copy(topColor);
      @_bgColor.multiply(btmColor);
      @_bgColor.lerp(topColor, rate);
    
    if s > 0
      # 上にスクロール限界突破
      # 上の色を引いていく
      rate = MY.u.map(s, 0, 1, 0, minDist);
      @_bgColor.copy(topColor);
      @_bgColor.multiply(btmColor);
      @_bgColor.lerp(btmColor, rate);
      
    
    
    
    color = "rgb(" + ~~(@_bgColor.r*255) + "," + ~~(@_bgColor.g*255) + "," + ~~(@_bgColor.b*255) + ")";
    $("body").css({
      backgroundColor:color
    });
    
  
  








module.exports = Contents;