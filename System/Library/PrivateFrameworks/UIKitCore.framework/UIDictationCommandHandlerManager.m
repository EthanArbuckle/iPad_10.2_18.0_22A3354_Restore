@implementation UIDictationCommandHandlerManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__UIDictationCommandHandlerManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_928 != -1)
    dispatch_once(&_MergedGlobals_928, block);
  return (id)qword_1ECD7C990;
}

uint64_t __50__UIDictationCommandHandlerManager_sharedInstance__block_invoke(uint64_t a1)
{
  UIDictationCommandHandlerManager *v2;
  void *v3;
  id SRCSCommandStringsTableClass;
  _QWORD v6[5];

  v2 = objc_alloc_init(UIDictationCommandHandlerManager);
  v3 = (void *)qword_1ECD7C990;
  qword_1ECD7C990 = (uint64_t)v2;

  SRCSCommandStringsTableClass = getSRCSCommandStringsTableClass();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__UIDictationCommandHandlerManager_sharedInstance__block_invoke_2;
  v6[3] = &__block_descriptor_40_e45___NSDictionary_24__0__NSString_8__NSString_16l;
  v6[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(SRCSCommandStringsTableClass, "setCommandStringsLoader:", v6);
}

id __50__UIDictationCommandHandlerManager_sharedInstance__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("DictationCommands_"), "stringByAppendingString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:inDirectory:", v4, CFSTR("plist"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetBaseLanguage();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("DictationCommands_"), "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:inDirectory:", v8, CFSTR("plist"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UIDictationCommandHandlerManager)init
{
  UIDictationCommandHandlerManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *commandHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDictationCommandHandlerManager;
  v2 = -[UIDictationCommandHandlerManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    commandHandlers = v2->_commandHandlers;
    v2->_commandHandlers = v3;

  }
  return v2;
}

+ (id)commandHandlerWithLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[UIDictationCommandHandlerManager sharedInstance](UIDictationCommandHandlerManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_commandHandlerWithLocale:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_commandHandlerWithLocale:(id)a3
{
  id v4;
  UIDictationCommandHandler *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_commandHandlers, "objectForKeyedSubscript:", v4);
  v5 = (UIDictationCommandHandler *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(UIDictationCommandHandler);
    v6 = (void *)objc_msgSend(objc_alloc((Class)getSRCSCommandStringsTableClass()), "initWithLocaleIdentifier:", v4);
    objc_msgSend(v6, "supportedCommandIdentifiersForTargetTypes:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      -[UIDictationCommandHandler registerCommandIdentifiers:locale:](v5, "registerCommandIdentifiers:locale:", v7, v4);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_commandHandlers, "setObject:forKeyedSubscript:", v5, v4);
    }
    else
    {

      v5 = 0;
    }

  }
  return v5;
}

- (NSMutableDictionary)commandHandlers
{
  return self->_commandHandlers;
}

- (void)setCommandHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_commandHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandHandlers, 0);
}

@end
