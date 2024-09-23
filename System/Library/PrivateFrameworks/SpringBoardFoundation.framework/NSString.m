@implementation NSString

void __47__NSString_SBAdditions__sb_emojiWithoutVS16Set__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("©®‼⁉™ℹ↔↕↖↗↘↙↩↪⌨⏏⏭⏮⏯⏱⏲⏸⏹⏺Ⓜ▪▫▶◀◻◼☀☁☂☃☄☎☑☘☝☠☢☣☦☪☮☯☸☹☺♀♂♟♠♣♥♦♨♻♾⚒⚔⚕⚖⚗⚙⚛⚜⚠⚧⚰⚱⛈⛏⛑⛓⛩⛰⛱⛴⛷⛸⛹✂✈✉✌✍✏✒✔✖✝✡✳✴❄❇❣❤➡⤴⤵⬅⬆⬇〰〽㊗㊙🅰🅱🅾🅿🈂🈷🌡🌤🌥🌦🌧🌨🌩🌪🌫🌬🌶🍽🎖🎗🎙🎚🎛🎞🎟🏋🏌🏍🏎🏔🏕🏖🏗🏘🏙🏚🏛🏜🏝🏞🏟🏳🏵🏷🐿👁📽🕉🕊🕯🕰🕳🕴🕵🕶🕷🕸🕹🖇🖊🖋🖌🖍🖐🖥🖨🖱🖲🖼🗂🗃🗄🗑🗒🗓🗜🗝🗞🗡🗣🗨🗯🗳🗺🛋🛍🛎🛏🛠🛡🛢🛣🛤🛥🛩🛰🛳"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sb_emojiWithoutVS16Set___emojiWithoutVS16Set;
  sb_emojiWithoutVS16Set___emojiWithoutVS16Set = v0;

}

void __55__NSString_SBAdditions___isEntirelyCharactersInScript___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;

  v2 = a1[5] - 1;
  if (v2 > 7)
    v3 = 0;
  else
    v3 = off_1E200EF48[v2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@%@]"), v3, CFSTR("[:punct:][:space:]–—[:Common:][:Inherited:]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _isEntirelyCharactersInScript____set = SBCopyCharacterUSetWithPattern(v4);
  if (!_isEntirelyCharactersInScript____set)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("NSString+SBFAdditions.m"), 109, CFSTR("uset_openPattern failed to create pattern; &s"),
      u_errorName(U_ZERO_ERROR));

  }
}

void __42__NSString_SBAdditions___isEntirelyCommon__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), CFSTR("[:punct:][:space:]–—[:Common:][:Inherited:]"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _isEntirelyCommon___charSet = SBCopyCharacterUSetWithPattern(v2);
  if (!_isEntirelyCommon___charSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSString+SBFAdditions.m"), 124, CFSTR("uset_openPattern failed to create pattern; %s"),
      u_errorName(U_ZERO_ERROR));

  }
}

@end
