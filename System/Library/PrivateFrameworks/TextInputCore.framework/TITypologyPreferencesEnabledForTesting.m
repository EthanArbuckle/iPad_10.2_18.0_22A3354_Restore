@implementation TITypologyPreferencesEnabledForTesting

- (TITypologyPreferencesEnabledForTesting)initWithOutputPath:(id)a3
{
  id v5;
  TITypologyPreferencesEnabledForTesting *v6;
  TITypologyPreferencesEnabledForTesting *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITypologyPreferencesEnabledForTesting;
  v6 = -[TITypologyPreferencesEnabledForTesting init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_outpath, a3);

  return v7;
}

- (BOOL)typologyLoggingEnabled
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  return TI_IS_INTERNAL_INSTALL::is_internal_install;
}

- (id)typologyDirectoryURL
{
  void *v3;
  void *v4;
  void *v5;

  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  if (TI_IS_INTERNAL_INSTALL::is_internal_install)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    -[TITypologyPreferencesEnabledForTesting outpath](self, "outpath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (int64_t)maxBytesPersistedTypologyRecords
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)maxBytesPersistedTypologyTraceLogs
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isInternalDeviceWithForcedTypologyLoggingForTesting
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  return TI_IS_INTERNAL_INSTALL::is_internal_install;
}

- (NSString)outpath
{
  return self->_outpath;
}

- (void)setOutpath:(id)a3
{
  objc_storeStrong((id *)&self->_outpath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outpath, 0);
}

@end
