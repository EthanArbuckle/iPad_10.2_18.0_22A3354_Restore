@implementation _TIKeyboardSyncFileInstaller

- (_TIKeyboardSyncFileInstaller)initWithEntry:(id)a3
{
  id v5;
  _TIKeyboardSyncFileInstaller *v6;
  _TIKeyboardSyncFileInstaller *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TIKeyboardSyncFileInstaller;
  v6 = -[_TIKeyboardSyncFileInstaller init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entry, a3);

  return v7;
}

- (void)execute
{
  NSObject *v3;
  _KSFileEntry *entry;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_entry)
  {
    +[TILanguageModelLoaderManager dropResourcesExcludingInputModes:](TILanguageModelLoaderManager, "dropResourcesExcludingInputModes:", MEMORY[0x1E0C9AA60]);
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel)
    {
      TIOSLogFacility();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Restoring %@"), "-[_TIKeyboardSyncFileInstaller execute]", self->_entry);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v8 = v6;
        _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    entry = self->_entry;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", TI_KB_USER_DIRECTORY(), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KSFileEntry restoreToPath:](entry, "restoreToPath:", v5);

    -[_TIKeyboardSyncFileInstaller invalidate](self, "invalidate");
  }
}

- (void)invalidate
{
  _KSFileEntry *entry;

  entry = self->_entry;
  self->_entry = 0;

}

- (BOOL)valid
{
  return self->_entry != 0;
}

- (void)dealloc
{
  objc_super v3;

  -[_TIKeyboardSyncFileInstaller execute](self, "execute");
  v3.receiver = self;
  v3.super_class = (Class)_TIKeyboardSyncFileInstaller;
  -[_TIKeyboardSyncFileInstaller dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
