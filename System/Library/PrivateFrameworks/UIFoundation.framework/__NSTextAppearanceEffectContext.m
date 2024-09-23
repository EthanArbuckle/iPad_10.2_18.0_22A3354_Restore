@implementation __NSTextAppearanceEffectContext

- (__NSTextAppearanceEffectContext)initWithTextEffectName:(id)a3 catalog:(id)a4 styleEffectConfiguration:(id)a5 font:(id)a6 color:(id)a7 applicationFrameworkContext:(int64_t)a8 useSimplifiedEffect:(BOOL)a9
{
  objc_class *v16;
  objc_class *v17;
  uint64_t (*v18)(void);
  __NSTextAppearanceEffectContext *v19;
  CUIStyleEffectConfiguration *v20;
  objc_super v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;

  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
  {
    v16 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", a8);
  }
  else
  {
    v16 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
  }
  v17 = v16;
  if (a8 == 2)
  {
    if (!a4)
      goto LABEL_21;
    if (!a3)
    {
      if (!a5)
        goto LABEL_21;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(a5, "backgroundType"))
        goto LABEL_21;
    }
  }
  else if (!a3 || a4)
  {
    if (!a3)
    {
LABEL_21:

      return 0;
    }
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v18 = (uint64_t (*)(void))get_UIKitGetTextEffectsCatalogSymbolLoc_ptr;
    v27 = get_UIKitGetTextEffectsCatalogSymbolLoc_ptr;
    if (!get_UIKitGetTextEffectsCatalogSymbolLoc_ptr)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __get_UIKitGetTextEffectsCatalogSymbolLoc_block_invoke;
      v23[3] = &unk_1E2604CE0;
      v23[4] = &v24;
      __get_UIKitGetTextEffectsCatalogSymbolLoc_block_invoke((uint64_t)v23);
      v18 = (uint64_t (*)(void))v25[3];
    }
    _Block_object_dispose(&v24, 8);
    if (!v18)
      -[__NSTextAppearanceEffectContext initWithTextEffectName:catalog:styleEffectConfiguration:font:color:applicationFrameworkContext:useSimplifiedEffect:].cold.1();
    a4 = (id)v18();
  }
  v22.receiver = self;
  v22.super_class = (Class)__NSTextAppearanceEffectContext;
  v19 = -[__NSTextAppearanceEffectContext init](&v22, sel_init);
  if (v19)
  {
    v19->_effectName = (NSString *)a3;
    v19->_catalog = (CUICatalog *)a4;
    if (a5)
      v20 = (CUIStyleEffectConfiguration *)objc_msgSend(a5, "copy");
    else
      v20 = (CUIStyleEffectConfiguration *)objc_alloc_init(MEMORY[0x1E0D1A6E8]);
    v19->_effectConfiguration = v20;
    v19->_font = (UIFont *)a6;
    if (!a7)
      a7 = (id)-[objc_class blackColor](v17, "blackColor");
    v19->_color = (UIColor *)a7;
    -[CUIStyleEffectConfiguration setUseSimplifiedEffect:](v19->_effectConfiguration, "setUseSimplifiedEffect:", a9);
  }
  return v19;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__NSTextAppearanceEffectContext;
  -[__NSTextAppearanceEffectContext dealloc](&v3, sel_dealloc);
}

- (void)drawGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 context:(CGContext *)a6
{
  -[CUICatalog drawGlyphs:atPositions:inContext:withFont:count:stylePresetName:styleConfiguration:foregroundColor:](self->_catalog, "drawGlyphs:atPositions:inContext:withFont:count:stylePresetName:styleConfiguration:foregroundColor:", a3, a4, a6, self->_font, a5, self->_effectName, self->_effectConfiguration, -[UIColor CGColor](self->_color, "CGColor"));
}

- (void)initWithTextEffectName:catalog:styleEffectConfiguration:font:color:applicationFrameworkContext:useSimplifiedEffect:.cold.1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CUICatalog *__UIKitGetTextEffectsCatalog(void)"), CFSTR("__NSTextAppearanceInterface.m"), 17, CFSTR("%s"), dlerror());
  __break(1u);
}

@end
