@implementation SUICSiriLanguage

- (SUICSiriLanguage)initWithDelegate:(id)a3
{
  id v4;
  SUICSiriLanguage *v5;
  SUICSiriLanguage *v6;
  uint64_t v7;
  NSString *spokenLanguageCode;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUICSiriLanguage;
  v5 = -[SUICSiriLanguage init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_setupAssistantHasCompletedInitialRunChecked = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[SUICSiriLanguage _computeSpokenLanguageCode](v6, "_computeSpokenLanguageCode");
    v7 = objc_claimAutoreleasedReturnValue();
    spokenLanguageCode = v6->_spokenLanguageCode;
    v6->_spokenLanguageCode = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__spokenLanguageDidChange_, *MEMORY[0x1E0CFE518], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__currentLocaleDidChange_, *MEMORY[0x1E0C99720], 0);

  }
  return v6;
}

- (SUICSiriLanguage)init
{
  return -[SUICSiriLanguage initWithDelegate:](self, "initWithDelegate:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SUICSiriLanguage;
  -[SUICSiriLanguage dealloc](&v4, sel_dealloc);
}

- (void)_updateSpokenLanguageCode
{
  id v3;

  -[SUICSiriLanguage _computeSpokenLanguageCode](self, "_computeSpokenLanguageCode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUICSiriLanguage _setSpokenLanguageCode:](self, "_setSpokenLanguageCode:", v3);

}

- (void)_setSpokenLanguageCode:(id)a3
{
  NSString *v4;
  NSString *spokenLanguageCode;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_spokenLanguageCode, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    spokenLanguageCode = self->_spokenLanguageCode;
    self->_spokenLanguageCode = v4;

    -[SUICSiriLanguage _delegate](self, "_delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriLanguageSpokenLanguageCodeDidChange:", self);

  }
}

- (BOOL)_setupAssistantHasCompletedInitialRunAvailable
{
  BOOL result;

  if (self->_setupAssistantHasCompletedInitialRunChecked)
    return self->_setupAssistantHasCompletedInitialRunAvailable;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  result = SetupAssistantLibraryCore_frameworkLibrary != 0;
  self->_setupAssistantHasCompletedInitialRunAvailable = SetupAssistantLibraryCore_frameworkLibrary != 0;
  self->_setupAssistantHasCompletedInitialRunChecked = 1;
  return result;
}

- (id)_computeSpokenLanguageCode
{
  void *v3;
  void *v4;
  uint64_t (*v5)(void);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  _Unwind_Exception *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUICSiriLanguage _setupAssistantHasCompletedInitialRunAvailable](self, "_setupAssistantHasCompletedInitialRunAvailable"))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v5 = (uint64_t (*)(void))getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
    v22 = getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
    if (!getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke;
      v18[3] = &unk_1E4A55028;
      v18[4] = &v19;
      __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke((uint64_t)v18);
      v5 = (uint64_t (*)(void))v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v5)
    {
      v17 = (_Unwind_Exception *)-[SUICSiriLanguage _computeSpokenLanguageCode].cold.1();
      _Block_object_dispose(&v19, 8);
      _Unwind_Resume(v17);
    }
    if ((v5() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "count"))
      {
LABEL_20:

        return v4;
      }
      objc_msgSend(v6, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("en-GB")))
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C997B0]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AU")) & 1) == 0)
        {
LABEL_15:

LABEL_16:
          AFPreferencesSupportedLanguages();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v7);

          if (v14 && (objc_msgSend(v4, "isEqualToString:", v7) & 1) == 0)
          {
            v15 = v7;

            v4 = v15;
          }

          goto LABEL_20;
        }
        v10 = CFSTR("en-AU");
      }
      else
      {
        if ((unint64_t)objc_msgSend(v7, "length") >= 6)
        {
          objc_msgSend(v7, "substringToIndex:", 2);
          v11 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v11;
        }
        if ((unint64_t)objc_msgSend(v7, "length") > 2)
          goto LABEL_16;
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C997B0]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v7, v9);
        v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }

      v7 = (void *)v10;
      goto LABEL_15;
    }
  }
  return v4;
}

- (NSString)spokenLanguageCode
{
  return self->_spokenLanguageCode;
}

- (SUICSiriLanguageDelegate)_delegate
{
  return (SUICSiriLanguageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)setupAssistantHasCompletedInitialRunChecked
{
  return self->_setupAssistantHasCompletedInitialRunChecked;
}

- (void)setSetupAssistantHasCompletedInitialRunChecked:(BOOL)a3
{
  self->_setupAssistantHasCompletedInitialRunChecked = a3;
}

- (void)setSetupAssistantHasCompletedInitialRunAvailable:(BOOL)a3
{
  self->_setupAssistantHasCompletedInitialRunAvailable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spokenLanguageCode, 0);
}

- (uint64_t)_computeSpokenLanguageCode
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[SUICOrbView _commonInitWithFrame:].cold.1(v0);
}

@end
