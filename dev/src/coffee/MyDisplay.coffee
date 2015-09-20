DisplayTransform = require('./libs/display/DisplayTransform');
Animation        = require('./libs/animation/Animation');


# ---------------------------------------------------
# プロジェクト専用Displayクラス
# ---------------------------------------------------
class MyDisplay extends DisplayTransform
  
  
  # -----------------------------------------------
  # コンストラクタ
  # -----------------------------------------------
  constructor: (option) ->
    
    super(option);
    
    # ステージサイズ
    @_sw = 0;
    @_sh = 0;
    
    # アニメーションオブジェクト
    @_anm = [];
  
  
  
  # -----------------------------------------------
  # 初期化
  # -----------------------------------------------
  init: =>
    
    super();
    
    if (@_option.resize? && @_option.resize) || !@_option.resize?
      MY.resize.add(@_resize);
    
    if (@_option.update? && @_option.update) || !@_option.update?
      MY.update.add(@_update);
  
  
  
  # -----------------------------------------------
  # 破棄
  # -----------------------------------------------
  dispose: =>
    
    MY.resize.remove(@_resize);
    MY.update.remove(@_update);
    
    if @_anm?
      for val,i in @_anm
        val.dispose();
      @_anm = null;
    
    super();
  
  
  
  # -----------------------------------------------
  # アニメーションオブジェクトの作成
  # -----------------------------------------------
  _makeAnimation: (num) =>
    
    i = 0;
    while i < num
      @_anm.push(new Animation());
      i++;
  
  
  
  # -----------------------------------------------
  # 更新
  # -----------------------------------------------
  _update: =>
    
    if @_anm?
      for val,i in @_anm
        val.update();
  
  
  
  # -----------------------------------------------
  # リサイズ
  # -----------------------------------------------
  _resize: (w, h) =>
    
    # ステージサイズ
    @_sw = w || MY.resize.sw();
    @_sh = h || MY.resize.sh();










module.exports = MyDisplay;