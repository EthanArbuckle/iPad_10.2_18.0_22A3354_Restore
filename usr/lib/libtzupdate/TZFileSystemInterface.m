@implementation TZFileSystemInterface

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global);
  return (id)sharedInstance_fileSystemInterfaceShared;
}

void __39__TZFileSystemInterface_sharedInstance__block_invoke()
{
  TZFileSystemInterface *v0;
  void *v1;

  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Initializing TZFileSystemInterface shared instance..."), "+[TZFileSystemInterface sharedInstance]_block_invoke");
  v0 = objc_alloc_init(TZFileSystemInterface);
  v1 = (void *)sharedInstance_fileSystemInterfaceShared;
  sharedInstance_fileSystemInterfaceShared = (uint64_t)v0;

}

- (TZFileSystemInterface)init
{
  TZFileSystemInterface *v2;
  TZFileSystemInterface *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TZFileSystemInterface;
  v2 = -[TZFileSystemInterface init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TZFileSystemInterface cacheTZLatestDestination](v2, "cacheTZLatestDestination");
  return v3;
}

- (NSURL)currentZoneinfoLinkURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/db/timezone/zoneinfo"), 0);
}

- (NSURL)systemICUDirectoryURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/usr/share/icu"), 1);
}

- (NSURL)latestTZLinkURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/db/timezone/tz_latest"), 0);
}

- (NSURL)systemICUSchemaVersionURL
{
  NSURL *systemICUSchemaVersionURL;
  void *v4;
  NSURL *v5;
  void *v6;
  NSURL *v7;

  systemICUSchemaVersionURL = self->_systemICUSchemaVersionURL;
  if (!systemICUSchemaVersionURL)
  {
    -[TZFileSystemInterface systemICUDirectoryURL](self, "systemICUDirectoryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("icutzformat.txt"));
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();

    if (!v5 && +[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
    {
      -[TZFileSystemInterface systemICUDirectoryURL](self, "systemICUDirectoryURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s  Could not obtain ICU schema file URL at: %@"), "-[TZFileSystemInterface systemICUSchemaVersionURL]", v6);

    }
    v7 = self->_systemICUSchemaVersionURL;
    self->_systemICUSchemaVersionURL = v5;

    systemICUSchemaVersionURL = self->_systemICUSchemaVersionURL;
  }
  return systemICUSchemaVersionURL;
}

- (NSURL)dataExpansionParentURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/db/timezone/tz/"), 0);
}

- (void)cacheTZLatestDestination
{
  NSURL *v3;
  NSURL *latestLinkDestinationAtStartup;
  id v5;

  -[TZFileSystemInterface latestTZLinkURL](self, "latestTZLinkURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TZFileSystemInterface obtainDestinationOfLinkAtURL:](self, "obtainDestinationOfLinkAtURL:", v5);
  v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  latestLinkDestinationAtStartup = self->_latestLinkDestinationAtStartup;
  self->_latestLinkDestinationAtStartup = v3;

}

- (void)resetTemporaryDirectory
{
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Resetting temporary directory..."), "-[TZFileSystemInterface resetTemporaryDirectory]");
  -[TZFileSystemInterface setTemporaryDirectory:](self, "setTemporaryDirectory:", 0);
}

- (TZVersionInfo)systemVersionInfo
{
  TZVersionInfo *systemVersionInfo;
  TZVersionInfo *v4;
  TZVersionInfo *v5;

  systemVersionInfo = self->_systemVersionInfo;
  if (!systemVersionInfo)
  {
    +[TZVersionInfo versionInfoFromDefaultSystem](TZVersionInfo, "versionInfoFromDefaultSystem");
    v4 = (TZVersionInfo *)objc_claimAutoreleasedReturnValue();
    v5 = self->_systemVersionInfo;
    self->_systemVersionInfo = v4;

    systemVersionInfo = self->_systemVersionInfo;
  }
  return systemVersionInfo;
}

- (TZVersionInfo)latestVersionInfo
{
  void *v3;
  void *v4;
  void *v5;

  -[TZFileSystemInterface latestTZLinkURL](self, "latestTZLinkURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TZFileSystemInterface obtainDestinationOfLinkAtURL:](self, "obtainDestinationOfLinkAtURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TZVersionInfo versionInfoFromContainerDirectory:](TZVersionInfo, "versionInfoFromContainerDirectory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Latest versionInfo: %@"), "-[TZFileSystemInterface latestVersionInfo]", v5);
  return (TZVersionInfo *)v5;
}

- (TZVersionInfo)currentVersionInfo
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[TZFileSystemInterface currentZoneinfoLinkURL](self, "currentZoneinfoLinkURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TZFileSystemInterface obtainDestinationOfLinkAtURL:](self, "obtainDestinationOfLinkAtURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("/usr/share/zoneinfo.default"));

    if (v6)
    {
      if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
        NSLog(CFSTR("%s  Current zoneinfo is default, using system version"), "-[TZFileSystemInterface currentVersionInfo]");
      -[TZFileSystemInterface systemVersionInfo](self, "systemVersionInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByDeletingLastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
        NSLog(CFSTR("%s  Current zoneinfo is NOT the default. Using parent directory %@"), "-[TZFileSystemInterface currentVersionInfo]", v9);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[TZVersionInfo versionInfoFromContainerDirectory:](TZVersionInfo, "versionInfoFromContainerDirectory:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
    if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog(CFSTR("%s  Could not obtain current data target"), "-[TZFileSystemInterface currentVersionInfo]");
      v7 = 0;
    }
  }
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Current versionInfo: %@"), "-[TZFileSystemInterface currentVersionInfo]", v7);

  return (TZVersionInfo *)v7;
}

- (TZVersionInfo)lastInstalledVersionInfo
{
  void *v3;
  void *v4;

  -[TZFileSystemInterface latestVersionInfo](self, "latestVersionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[TZFileSystemInterface latestVersionInfo](self, "latestVersionInfo");
  else
    -[TZFileSystemInterface currentVersionInfo](self, "currentVersionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Last installed versionInfo: %@"), "-[TZFileSystemInterface lastInstalledVersionInfo]", v4);

  return (TZVersionInfo *)v4;
}

- (NSString)systemICUTZSchemaVersion
{
  NSString **p_systemICUTZSchemaVersion;
  id v3;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  id v10;

  p_systemICUTZSchemaVersion = &self->_systemICUTZSchemaVersion;
  if (self->_systemICUTZSchemaVersion)
  {
LABEL_2:
    v3 = 0;
    goto LABEL_11;
  }
  -[TZFileSystemInterface systemICUSchemaVersionURL](self, "systemICUSchemaVersionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v3 = 0;
    if (!+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
      goto LABEL_11;
    NSLog(CFSTR("%s  Could not get TZ schema of nonexistent path"), "-[TZFileSystemInterface systemICUTZSchemaVersion]");
    goto LABEL_2;
  }
  -[TZFileSystemInterface systemICUSchemaVersionURL](self, "systemICUSchemaVersionURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  +[TZUtilities stringWithContentsOfFileAtURL:error:](TZUtilities, "stringWithContentsOfFileAtURL:error:", v6, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v10;

  if (v7)
  {
    objc_storeStrong((id *)p_systemICUTZSchemaVersion, v7);
  }
  else if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog(CFSTR("%s  Could not get system ICU schema version: %@"), "-[TZFileSystemInterface systemICUTZSchemaVersion]", v3);
  }

LABEL_11:
  v8 = *p_systemICUTZSchemaVersion;

  return v8;
}

- (id)obtainDestinationOfLinkAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  id v11;

  v3 = a3;
  if (+[TZUtilities fileExistsAndIsSymbolicLinkAtURL:](TZUtilities, "fileExistsAndIsSymbolicLinkAtURL:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "destinationOfSymbolicLinkAtPath:error:", v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;

    v8 = +[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0);
    if (v6)
    {
      if (v8)
        NSLog(CFSTR("%s  Destination of link: %@"), "-[TZFileSystemInterface obtainDestinationOfLinkAtURL:]", v6);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8)
        NSLog(CFSTR("%s  Cannot get destination of link: %@"), "-[TZFileSystemInterface obtainDestinationOfLinkAtURL:]", v7);
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSURL)cachedTZDataLocation
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCachedTZDataLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSURL)latestTZDataLink
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLatestTZDataLink:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSURL)dataExpansionVersionDirectory
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDataExpansionVersionDirectory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSURL)latestLinkDestinationAtStartup
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (NSURL)temporaryDirectory
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTemporaryDirectory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong((id *)&self->_latestLinkDestinationAtStartup, 0);
  objc_storeStrong((id *)&self->_dataExpansionVersionDirectory, 0);
  objc_storeStrong((id *)&self->_latestTZDataLink, 0);
  objc_storeStrong((id *)&self->_cachedTZDataLocation, 0);
  objc_storeStrong((id *)&self->_systemVersionInfo, 0);
  objc_storeStrong((id *)&self->_lastInstalledVersionInfo, 0);
  objc_storeStrong((id *)&self->_currentVersionInfo, 0);
  objc_storeStrong((id *)&self->_latestVersionInfo, 0);
  objc_storeStrong((id *)&self->_systemICUTZSchemaVersion, 0);
  objc_storeStrong((id *)&self->_systemICUSchemaVersionURL, 0);
}

@end
