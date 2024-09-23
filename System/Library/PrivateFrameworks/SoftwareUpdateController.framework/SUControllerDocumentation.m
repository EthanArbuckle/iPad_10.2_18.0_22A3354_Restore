@implementation SUControllerDocumentation

- (SUControllerDocumentation)initWithDocumentationBundleURL:(id)a3 serverAssetURL:(id)a4 serverAssetMeasurement:(id)a5 serverAssetAlgorithm:(id)a6 serverAssetChunkSize:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SUControllerDocumentation *v17;
  SUControllerDocumentation *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SUControllerDocumentation;
  v17 = -[SUControllerDocumentation init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_localBundleURL, a3);
    objc_storeStrong((id *)&v18->_serverAssetURL, a4);
    objc_storeStrong((id *)&v18->_serverAssetMeasurement, a5);
    objc_storeStrong((id *)&v18->_serverAssetAlgorithm, a6);
    v18->_serverAssetChunkSize = a7;
  }

  return v18;
}

- (SUControllerDocumentation)initWithCoder:(id)a3
{
  id v4;
  SUControllerDocumentation *v5;
  uint64_t v6;
  NSURL *localBundleURL;
  uint64_t v8;
  NSURL *serverAssetURL;
  uint64_t v10;
  NSData *serverAssetMeasurement;
  uint64_t v12;
  NSString *serverAssetAlgorithm;
  uint64_t v14;
  NSData *releaseNotesSummary;
  uint64_t v16;
  NSData *releaseNotes;
  uint64_t v18;
  NSData *licenseAgreement;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUControllerDocumentation;
  v5 = -[SUControllerDocumentation init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localBundleURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    localBundleURL = v5->_localBundleURL;
    v5->_localBundleURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverAssetURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    serverAssetURL = v5->_serverAssetURL;
    v5->_serverAssetURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverAssetMeasurement"));
    v10 = objc_claimAutoreleasedReturnValue();
    serverAssetMeasurement = v5->_serverAssetMeasurement;
    v5->_serverAssetMeasurement = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverAssetAlgorithm"));
    v12 = objc_claimAutoreleasedReturnValue();
    serverAssetAlgorithm = v5->_serverAssetAlgorithm;
    v5->_serverAssetAlgorithm = (NSString *)v12;

    v5->_serverAssetChunkSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("serverAssetChunkSize"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseNotesSummary"));
    v14 = objc_claimAutoreleasedReturnValue();
    releaseNotesSummary = v5->_releaseNotesSummary;
    v5->_releaseNotesSummary = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseNotes"));
    v16 = objc_claimAutoreleasedReturnValue();
    releaseNotes = v5->_releaseNotes;
    v5->_releaseNotes = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("licenseAgreement"));
    v18 = objc_claimAutoreleasedReturnValue();
    licenseAgreement = v5->_licenseAgreement;
    v5->_licenseAgreement = (NSData *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[SUControllerDocumentation localBundleURL](self, "localBundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localBundleURL"));

  -[SUControllerDocumentation serverAssetURL](self, "serverAssetURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serverAssetURL"));

  -[SUControllerDocumentation serverAssetMeasurement](self, "serverAssetMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serverAssetMeasurement"));

  -[SUControllerDocumentation serverAssetAlgorithm](self, "serverAssetAlgorithm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("serverAssetAlgorithm"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerDocumentation serverAssetChunkSize](self, "serverAssetChunkSize"), CFSTR("serverAssetChunkSize"));
  -[SUControllerDocumentation releaseNotesSummary](self, "releaseNotesSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("releaseNotesSummary"));

  -[SUControllerDocumentation releaseNotes](self, "releaseNotes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("releaseNotes"));

  -[SUControllerDocumentation licenseAgreement](self, "licenseAgreement");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("licenseAgreement"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)humanReadableUpdateName
{
  -[SUControllerDocumentation _loadBundleResources](self, "_loadBundleResources");
  return self->_humanReadableUpdateName;
}

- (NSData)releaseNotesSummary
{
  -[SUControllerDocumentation _loadBundleResources](self, "_loadBundleResources");
  return self->_releaseNotesSummary;
}

- (NSData)releaseNotes
{
  -[SUControllerDocumentation _loadBundleResources](self, "_loadBundleResources");
  return self->_releaseNotes;
}

- (NSData)licenseAgreement
{
  -[SUControllerDocumentation _loadBundleResources](self, "_loadBundleResources");
  return self->_licenseAgreement;
}

- (id)_resourceFromBundle:(__CFBundle *)a3 forKey:(id)a4
{
  CFURLRef v4;
  void *v5;

  v4 = CFBundleCopyResourceURL(a3, (CFStringRef)a4, CFSTR("html"), 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_loadBundleResources
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  char v8;
  const __CFAllocator *v9;
  const __CFURL *v10;
  __CFBundle *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;

  -[SUControllerDocumentation localBundleURL](self, "localBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "count"))
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("en");
    }
    v16 = (__CFString *)v6;
    -[SUControllerDocumentation currentLanguage](self, "currentLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[__CFString isEqualToString:](v16, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[SUControllerDocumentation setCurrentLanguage:](self, "setCurrentLanguage:", v16);
      -[SUControllerDocumentation setHumanReadableUpdateName:](self, "setHumanReadableUpdateName:", 0);
      -[SUControllerDocumentation setReleaseNotesSummary:](self, "setReleaseNotesSummary:", 0);
      -[SUControllerDocumentation setReleaseNotes:](self, "setReleaseNotes:", 0);
      -[SUControllerDocumentation setLicenseAgreement:](self, "setLicenseAgreement:", 0);
      v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      -[SUControllerDocumentation localBundleURL](self, "localBundleURL");
      v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v11 = CFBundleCreate(v9, v10);

      if (v11)
      {
        v12 = (__CFString *)CFBundleCopyLocalizedString(v11, CFSTR("HumanReadableUpdateName"), 0, CFSTR("documentation"));
        if ((-[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("HumanReadableUpdateName")) & 1) == 0)
          -[SUControllerDocumentation setHumanReadableUpdateName:](self, "setHumanReadableUpdateName:", v12);
        -[SUControllerDocumentation _resourceFromBundle:forKey:](self, "_resourceFromBundle:forKey:", v11, CFSTR("ReadMeSummary"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUControllerDocumentation setReleaseNotesSummary:](self, "setReleaseNotesSummary:", v13);

        -[SUControllerDocumentation _resourceFromBundle:forKey:](self, "_resourceFromBundle:forKey:", v11, CFSTR("ReadMe"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUControllerDocumentation setReleaseNotes:](self, "setReleaseNotes:", v14);

        -[SUControllerDocumentation _resourceFromBundle:forKey:](self, "_resourceFromBundle:forKey:", v11, CFSTR("License"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUControllerDocumentation setLicenseAgreement:](self, "setLicenseAgreement:", v15);

        CFRelease(v11);
      }
    }

  }
}

- (BOOL)isEqual:(id)a3
{
  SUControllerDocumentation *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (SUControllerDocumentation *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SUControllerDocumentation localBundleURL](v4, "localBundleURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUControllerDocumentation localBundleURL](self, "localBundleURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  int64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v19 = (void *)MEMORY[0x24BDD17C8];
  -[SUControllerDocumentation localBundleURL](self, "localBundleURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDocumentation serverAssetURL](self, "serverAssetURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDocumentation serverAssetMeasurement](self, "serverAssetMeasurement");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("absent");
  if (v20)
    v4 = CFSTR("present");
  else
    v4 = CFSTR("absent");
  v16 = v4;
  -[SUControllerDocumentation serverAssetAlgorithm](self, "serverAssetAlgorithm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUControllerDocumentation serverAssetChunkSize](self, "serverAssetChunkSize");
  -[SUControllerDocumentation releaseNotesSummary](self, "releaseNotesSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = CFSTR("present");
  else
    v8 = CFSTR("absent");
  -[SUControllerDocumentation releaseNotes](self, "releaseNotes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = CFSTR("present");
  else
    v10 = CFSTR("absent");
  -[SUControllerDocumentation licenseAgreement](self, "licenseAgreement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v3 = CFSTR("present");
  -[SUControllerDocumentation humanReadableUpdateName](self, "humanReadableUpdateName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDocumentation currentLanguage](self, "currentLanguage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("\nLocalBundleURL: %@\nServerAssetURL: %@\nServerAssetMeasurement: %@\nServerAssetAlgorithm: %@\nServerAssetChunkSize: %lld\nReleaseNotesSummary: %@\nReleaseNotes: %@\nLicenseAgreement: %@\nHumanReadableUpdateName: %@\ncurrentLanguage: %@\n"), v18, v17, v16, v5, v6, v8, v10, v3, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setReleaseNotesSummary:(id)a3
{
  objc_storeStrong((id *)&self->_releaseNotesSummary, a3);
}

- (void)setReleaseNotes:(id)a3
{
  objc_storeStrong((id *)&self->_releaseNotes, a3);
}

- (void)setLicenseAgreement:(id)a3
{
  objc_storeStrong((id *)&self->_licenseAgreement, a3);
}

- (void)setHumanReadableUpdateName:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadableUpdateName, a3);
}

- (NSURL)localBundleURL
{
  return self->_localBundleURL;
}

- (void)setLocalBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_localBundleURL, a3);
}

- (NSURL)serverAssetURL
{
  return self->_serverAssetURL;
}

- (void)setServerAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_serverAssetURL, a3);
}

- (NSData)serverAssetMeasurement
{
  return self->_serverAssetMeasurement;
}

- (void)setServerAssetMeasurement:(id)a3
{
  objc_storeStrong((id *)&self->_serverAssetMeasurement, a3);
}

- (NSString)serverAssetAlgorithm
{
  return self->_serverAssetAlgorithm;
}

- (void)setServerAssetAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_serverAssetAlgorithm, a3);
}

- (int64_t)serverAssetChunkSize
{
  return self->_serverAssetChunkSize;
}

- (void)setServerAssetChunkSize:(int64_t)a3
{
  self->_serverAssetChunkSize = a3;
}

- (NSString)currentLanguage
{
  return self->_currentLanguage;
}

- (void)setCurrentLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_currentLanguage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_serverAssetAlgorithm, 0);
  objc_storeStrong((id *)&self->_serverAssetMeasurement, 0);
  objc_storeStrong((id *)&self->_serverAssetURL, 0);
  objc_storeStrong((id *)&self->_localBundleURL, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_licenseAgreement, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
  objc_storeStrong((id *)&self->_releaseNotesSummary, 0);
}

@end
