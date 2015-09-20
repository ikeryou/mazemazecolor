

# ------------------------------------
# 定数
# ------------------------------------
class Conf
  
  # ------------------------------------
  # コンストラクタ
  # ------------------------------------
  constructor: ->
    
    # 本番フラグ
    # -------------------------------
    @RELEASE = false;
    # -------------------------------
    
    # フラグ関連
    @FLG = {
      LOG:false, # ログ出力
      STATS:true, # Stats表示
      PARAM:true # パラメータテスト
    };
    
    # 本番フラグがtrueの場合、フラグ関連は全てfalseに
    if @RELEASE
      for key,val of @FLG
        @FLG[key] = false;
    
    # ランダム用の色
    @RAND_COLORS = [0xf1443c,0xe62364,0x9a2ead,0x663eb3,0x3f53b1,0x2a97ef,0x1ca9f0,0x1ebbd1,0x149487,0x4fad53,0x8bc151,0xccd948,0xfde84d,0xfdbf2e,0xfc9626,0xfc572e,0x775448,0x9d9d9d,0x607c89];




















module.exports = Conf;
