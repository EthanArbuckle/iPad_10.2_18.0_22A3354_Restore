@implementation PBUIPosterWallpaperMigrationInfo

- (id)_initWithPairingType:(char)a3 lockProvider:(char)a4 homeProvider:(char)a5
{
  id result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBUIPosterWallpaperMigrationInfo;
  result = -[PBUIPosterWallpaperMigrationInfo init](&v9, sel_init);
  if (result)
  {
    *((_BYTE *)result + 8) = a3;
    *((_BYTE *)result + 9) = a4;
    *((_BYTE *)result + 10) = a5;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIStringForPosterWallpaperPairingType(self->_pairingType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIStringForPosterWallpaperMigrationProvider(self->_lockProvider);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIStringForPosterWallpaperMigrationProvider(self->_homeProvider);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p pairing=%@ lockProvider=%@ homeProvider=%@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (char)pairingType
{
  return self->_pairingType;
}

- (char)lockProvider
{
  return self->_lockProvider;
}

- (char)homeProvider
{
  return self->_homeProvider;
}

@end
