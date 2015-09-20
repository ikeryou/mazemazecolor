MyDisplay = require('./MyDisplay');
Display   = require('./libs/display/Display');


# ---------------------------------------------------
# カラーパレット
# ---------------------------------------------------
class ColorPallet extends MyDisplay
  
  
  # -----------------------------------------------
  # コンストラクタ
  # -----------------------------------------------
  constructor: (option) ->
    
    super(option);
    
    # カラー表示エリア
    @_area;
    
    # カラー
    @_color;
    
    @_isTouch = false;
    @_isDetailChangeColor = false;
    @_touchCnt = 0;
    @_ang = 0;
    @_hsl = {
      h:0,
      s:0,
      l:0
    };
    
    # タップ判定のカウント数
    @_tapCnt = 10;
    
    # ディープレスのカウント数
    @_dpCnt = 40;
    
    
    
    
  # -----------------------------------------------
  # 初期化
  # -----------------------------------------------
  init: =>
    
    super();
    
    # カラー
    @_color = new THREE.Color(); 
    
    # カラー表示エリア
    @_area = new Display();
    @_area.init();
    @add(@_area);
    
    # イベント
    @elm().bind("touchstart", @_eTouchStart).bind("touchend", @_eTouchEnd).bind("touchmove", @_eTouchMove);
    
    @_setRandColor();
  
  
  
  # -----------------------------------------------
  # イベント タッチスタート
  # -----------------------------------------------
  _eTouchStart: (e) =>
    
    @_reset();
    @_isTouch = true;
  
  
  
  # -----------------------------------------------
  # イベント タッチアップ
  # -----------------------------------------------
  _eTouchEnd: (e) =>
    
    # 短い時間のタップ
    if @_isTouch && @_touchCnt <= @_tapCnt && $(window).scrollTop() == 0
      # ランダムに色を変更
      @_setRandColor();
    
    @_reset();
  
  
  
  # -----------------------------------------------
  # イベント タッチムーブ
  # -----------------------------------------------
  _eTouchMove: (e) =>
  
  
  
  # -----------------------------------------------
  # カラー取得
  # -----------------------------------------------
  getColor: =>
    
    return @_color;
  
  
  
  # -----------------------------------------------
  # 色をランダムに変更
  # -----------------------------------------------
  _setRandColor: =>
    
    @_color.setHex(MY.u.arrRand(MY.conf.RAND_COLORS));
    @_setColor();
  
  
  
  # -----------------------------------------------
  # 色をエリアに反映
  # -----------------------------------------------
  _setColor: =>
    
    color = "rgb(" + ~~(@_color.r*255) + "," + ~~(@_color.g*255) + "," + ~~(@_color.b*255) + ")";
    @_area.bgColor(color);
    @_area.render();
  
  
  
  # -----------------------------------
  # 位置とサイズ設定
  # -----------------------------------
  setSizePos: (w, h, x, y) =>
    
    @size(w, h);
    @xy(x, y);
    @render();
    
    @_area.size(@width(), @height());
    @_area.render();
  
  
  
  # -----------------------------------------------
  # 操作初期化
  # -----------------------------------------------
  _reset: =>
  
    @_isDetailChangeColor = false;
    @_isTouch = false;
    @_touchCnt = 0;
  
  
  
  # -----------------------------------------------
  # 色詳細変更モード
  # -----------------------------------------------
  _setDetailChangeColor: =>
    
    @_isDetailChangeColor = true;
    @_hsl = @_color.getHSL();
    @_ang = MY.u.map(@_hsl.h, 270, 90, 0, 1);
  
  
  
  # -----------------------------------------------
  # 更新
  # -----------------------------------------------
  _update: =>
    
    super();
    
    if @_isTouch
      @_touchCnt++;
      
      # ディープレス判定
      if @_touchCnt == @_dpCnt
        # 色詳細変更モード
        @_setDetailChangeColor();
      
      if @_isDetailChangeColor && $(window).scrollTop() == 0
        t = MY.u.map(Math.sin(MY.u.radian(@_ang)), 0, 1, -1, 1);
        @_hsl.h += (t - @_hsl.h) * 0.2;
        @_color.setHSL(@_hsl.h, @_hsl.s, @_hsl.l);
        @_setColor();
        @_ang += 0.5;






















module.exports = ColorPallet;