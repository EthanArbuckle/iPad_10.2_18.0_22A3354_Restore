@implementation TIKeyboardInputManagerIndic

- (TIKeyboardInputManagerIndic)initWithConfig:(id)a3 keyboardState:(id)a4
{
  TIKeyboardInputManagerIndic *v4;
  TIKeyboardInputManagerIndic *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManagerIndic;
  v4 = -[TIKeyboardInputManager initWithConfig:keyboardState:](&v17, sel_initWithConfig_keyboardState_, a3, a4);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4->super.m_impl + 689) = 0;
    objc_initWeak(&location, v4);
    v6 = objc_alloc(-[TIKeyboardInputManagerIndic scriptComposerClass](v5, "scriptComposerClass"));
    -[TIKeyboardInputManagerBase inputMode](v5, "inputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageWithRegion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __60__TIKeyboardInputManagerIndic_initWithConfig_keyboardState___block_invoke;
    v14 = &unk_1EA103D18;
    objc_copyWeak(&v15, &location);
    v9 = (void *)objc_msgSend(v6, "initWithLanguage:contextFetcher:", v8, &v11);
    -[TIKeyboardInputManagerIndic setScriptComposer:](v5, "setScriptComposer:", v9, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)syncToLayoutState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _BYTE v11[8];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerIndic;
  v4 = a3;
  -[TIKeyboardInputManager syncToLayoutState:](&v10, sel_syncToLayoutState_, v4);
  objc_msgSend(v4, "softwareLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  KB::String::String((KB::String *)v11, (const char *)objc_msgSend(v6, "UTF8String"));
  -[TIKeyboardInputManagerIndic setAlphabeticLayout:](self, "setAlphabeticLayout:", TI::IndicUtils::isAlphabeticLayout((KB::String *)v11));
  if (v12 && v11[6] == 1)
    free(v12);

  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageWithRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerIndic scriptComposer](self, "scriptComposer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLanguageIdentifier:", v8);

}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  return 0;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (-[TIKeyboardInputManagerIndic alphabeticLayout](self, "alphabeticLayout")
    && (objc_msgSend(v4, "isPopupVariant") & 1) == 0)
  {
    -[TIKeyboardInputManagerIndic scriptComposer](self, "scriptComposer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByComposingInput:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setString:", v7);

  }
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerIndic;
  -[TIKeyboardInputManager handleKeyboardInput:](&v10, sel_handleKeyboardInput_, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setKeyLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (-[TIKeyboardInputManagerIndic alphabeticLayout](self, "alphabeticLayout"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDC30]), "initWithCapacity:", 50);
    objc_msgSend(v5, "setUsesTwoHands:", objc_msgSend(v4, "usesTwoHands"));
    objc_msgSend(v5, "setShifted:", objc_msgSend(v4, "isShifted"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__TIKeyboardInputManagerIndic_setKeyLayout___block_invoke;
    v9[3] = &unk_1EA103D40;
    v9[4] = self;
    v10 = v5;
    v6 = v5;
    objc_msgSend(v4, "enumerateKeysUsingBlock:", v9);
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManagerIndic;
    -[TIKeyboardInputManager setKeyLayout:](&v8, sel_setKeyLayout_, v6);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerIndic;
    -[TIKeyboardInputManager setKeyLayout:](&v7, sel_setKeyLayout_, v4);
  }

}

- (id)contextualDisplayKeys
{
  void *v3;
  void *v4;

  if (-[TIKeyboardInputManagerIndic alphabeticLayout](self, "alphabeticLayout"))
  {
    -[TIKeyboardInputManagerIndic scriptComposer](self, "scriptComposer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contextualDisplayKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (Class)scriptComposerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)alphabeticLayout
{
  return *(&self->_alphabeticLayout + 1);
}

- (void)setAlphabeticLayout:(BOOL)a3
{
  *(&self->_alphabeticLayout + 1) = a3;
}

- (TIIndicScriptComposer)scriptComposer
{
  return (TIIndicScriptComposer *)objc_getProperty(self, a2, 584, 1);
}

- (void)setScriptComposer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptComposer, 0);
}

void __44__TIKeyboardInputManagerIndic_setKeyLayout___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scriptComposer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByComposingInput:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addKeyWithString:frame:", v12, a3, a4, a5, a6);
}

id __60__TIKeyboardInputManagerIndic_initWithConfig_keyboardState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextBeforeInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
