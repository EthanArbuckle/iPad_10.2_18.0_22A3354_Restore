@implementation WFWorkflowIconDrawerContext

- (void)dealloc
{
  __CTFont *glyphTestFont;
  objc_super v4;

  CGFontRelease(self->_glyphFont);
  glyphTestFont = self->_glyphTestFont;
  if (glyphTestFont)
    CFRelease(glyphTestFont);
  if (self->_coreGlyphsCatalogs)
    WFImageEndUsingCoreGlyphsCatalogs();
  v4.receiver = self;
  v4.super_class = (Class)WFWorkflowIconDrawerContext;
  -[WFWorkflowIconDrawerContext dealloc](&v4, sel_dealloc);
}

- (NSSet)coreGlyphsCatalogs
{
  NSSet *coreGlyphsCatalogs;
  NSSet *v4;
  NSSet *v5;

  coreGlyphsCatalogs = self->_coreGlyphsCatalogs;
  if (!coreGlyphsCatalogs)
  {
    WFImageBeginUsingCoreGlyphsCatalogs();
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_coreGlyphsCatalogs;
    self->_coreGlyphsCatalogs = v4;

    coreGlyphsCatalogs = self->_coreGlyphsCatalogs;
  }
  return coreGlyphsCatalogs;
}

- (CGFont)glyphFont
{
  CGFont *result;
  void *v4;
  const __CFURL *v5;
  CGDataProviderRef v6;
  CGDataProvider *v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = self->_glyphFont;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("WorkflowGlyphs"), CFSTR("ttf"));
    v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

    v6 = CGDataProviderCreateWithURL(v5);
    if (v6)
    {
      v7 = v6;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __40__WFWorkflowIconDrawerContext_glyphFont__block_invoke;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = v6;
      v8 = (void (**)(_QWORD))_Block_copy(aBlock);
      self->_glyphFont = CGFontCreateWithDataProvider(v7);
      v8[2](v8);

      return self->_glyphFont;
    }
    else
    {
      getWFVoiceShortcutClientLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[WFWorkflowIconDrawerContext glyphFont]";
        _os_log_impl(&dword_1AF681000, v9, OS_LOG_TYPE_FAULT, "%s Couldn't load workflow glyph font data.", buf, 0xCu);
      }

      return 0;
    }
  }
  return result;
}

- (__CTFont)glyphTestFont
{
  __CTFont *result;

  result = self->_glyphTestFont;
  if (!result)
  {
    objc_msgSend((id)objc_opt_class(), "glyphTestFontSize");
    result = -[WFWorkflowIconDrawerContext newGlyphFontForSize:](self, "newGlyphFontForSize:");
    self->_glyphTestFont = result;
  }
  return result;
}

- (__CTFont)newGlyphFontForSize:(double)a3
{
  CGFont *v4;
  void *v5;
  __CTFont *result;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v4 = -[WFWorkflowIconDrawerContext glyphFont](self, "glyphFont");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v5 = getCTFontCreateWithGraphicsFontSymbolLoc_ptr;
  v13 = getCTFontCreateWithGraphicsFontSymbolLoc_ptr;
  if (!getCTFontCreateWithGraphicsFontSymbolLoc_ptr)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getCTFontCreateWithGraphicsFontSymbolLoc_block_invoke;
    v9[3] = &unk_1E5FC8858;
    v9[4] = &v10;
    __getCTFontCreateWithGraphicsFontSymbolLoc_block_invoke(v9);
    v5 = (void *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v5)
    return (__CTFont *)((uint64_t (*)(CGFont *, _QWORD, _QWORD, double))v5)(v4, 0, 0, a3);
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CTFontRef WFCTFontCreateWithGraphicsFont(CGFontRef, CGFloat, const CGAffineTransform * _Nullable, CTFontDescriptorRef _Nullable)");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("WFWorkflowIconDrawerContext.m"), 20, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreGlyphsCatalogs, 0);
}

void __40__WFWorkflowIconDrawerContext_glyphFont__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

+ (id)cachedContextOrNewContext
{
  id v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&contextLock);
  if (context)
    v3 = (id)context;
  else
    v3 = objc_alloc_init((Class)a1);
  v4 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&contextLock);
  return v4;
}

+ (double)glyphTestFontSize
{
  return 40.0;
}

@end
