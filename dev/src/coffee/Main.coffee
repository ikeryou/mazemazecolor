UpdateMgr   = require('./libs/mgr/UpdateMgr');
ResizeMgr   = require('./libs/mgr/ResizeMgr');
DelayMgr    = require('./libs/mgr/DelayMgr');
Utils       = require('./libs/Utils');
Contents    = require('./Contents');
Conf        = require('./Conf');


# ------------------------------------
# メイン
# ------------------------------------
class Main
  
  # ------------------------------------
  # コンストラクタ
  # ------------------------------------
  constructor: ->
    
    @_color = {
      r:255,
      g:0,
      b:0
    };
  
  
  
  # ------------------------------------
  # 初期化
  # ------------------------------------
  init: =>
    
    # app専用オブジェクト
    window.MY = {};
    
    # 定数
    MY.conf = new Conf();
    
    # ユーティリティー
    MY.u = new Utils();
    
    # リサイズ管理
    MY.resize = new ResizeMgr();
    
    # 画面更新管理
    MY.update = new UpdateMgr();
    MY.update.add(@_update);
    
    
    c = new Contents();
    c.init();
  
  
  
  # ------------------------------------
  # 更新
  # ------------------------------------
  _update: =>








$(window).ready(=>
  app = new Main();
  app.init();
  window.MY.main = app;
);