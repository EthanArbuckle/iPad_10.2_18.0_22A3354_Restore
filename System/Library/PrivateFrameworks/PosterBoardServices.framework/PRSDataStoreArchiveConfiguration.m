@implementation PRSDataStoreArchiveConfiguration

+ (id)cliOptions
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = kPRSDataStoreArchiveConfigurationKeyStripScreenshots;
  v3[1] = kPRSDataStoreArchiveConfigurationKeyStripDescriptors;
  v3[2] = kPRSDataStoreArchiveConfigurationKeyStripContentsOfConfigurations;
  v3[3] = kPRSDataStoreArchiveConfigurationKeyReapNonLatestEntries;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dataStoreArchiveConfigurationFromArgs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", kPRSDataStoreArchiveConfigurationKeyStripScreenshots);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", kPRSDataStoreArchiveConfigurationKeyStripDescriptors);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", kPRSDataStoreArchiveConfigurationKeyStripContentsOfConfigurations);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", kPRSDataStoreArchiveConfigurationKeyReapNonLatestEntries);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "BOOLValue");
  objc_msgSend(v4, "setStripScreenshots:", v6);
  objc_msgSend(v4, "setStripDescriptors:", v8);
  objc_msgSend(v4, "setStripContentsOfConfigurations:", v10);
  objc_msgSend(v4, "setReapNonLatestEntries:", v12);
  return v4;
}

- (PRSDataStoreArchiveConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRSDataStoreArchiveConfiguration;
  return -[PRSDataStoreArchiveConfiguration init](&v3, sel_init);
}

- (PRSDataStoreArchiveConfiguration)initWithCoder:(id)a3
{
  id v4;
  PRSDataStoreArchiveConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PRSDataStoreArchiveConfiguration;
  v5 = -[PRSDataStoreArchiveConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_stripScreenshots = objc_msgSend(v4, "decodeBoolForKey:", kPRSDataStoreArchiveConfigurationKeyStripScreenshots);
    v5->_stripDescriptors = objc_msgSend(v4, "decodeBoolForKey:", kPRSDataStoreArchiveConfigurationKeyStripDescriptors);
    v5->_stripContentsOfConfigurations = objc_msgSend(v4, "decodeBoolForKey:", kPRSDataStoreArchiveConfigurationKeyStripContentsOfConfigurations);
    v5->_reapNonLatestEntries = objc_msgSend(v4, "decodeBoolForKey:", kPRSDataStoreArchiveConfigurationKeyReapNonLatestEntries);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 stripScreenshots;
  uint64_t v5;
  id v6;

  stripScreenshots = self->_stripScreenshots;
  v5 = kPRSDataStoreArchiveConfigurationKeyStripScreenshots;
  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", stripScreenshots, v5);
  objc_msgSend(v6, "encodeBool:forKey:", self->_stripDescriptors, kPRSDataStoreArchiveConfigurationKeyStripDescriptors);
  objc_msgSend(v6, "encodeBool:forKey:", self->_stripContentsOfConfigurations, kPRSDataStoreArchiveConfigurationKeyStripContentsOfConfigurations);
  objc_msgSend(v6, "encodeBool:forKey:", self->_reapNonLatestEntries, kPRSDataStoreArchiveConfigurationKeyReapNonLatestEntries);

}

- (id)copyWithZone:(_NSZone *)a3
{
  PRSDataStoreArchiveConfiguration *v4;

  v4 = -[PRSDataStoreArchiveConfiguration init](+[PRSDataStoreArchiveConfiguration allocWithZone:](PRSDataStoreArchiveConfiguration, "allocWithZone:", a3), "init");
  -[PRSDataStoreArchiveConfiguration setStripScreenshots:](v4, "setStripScreenshots:", self->_stripScreenshots);
  -[PRSDataStoreArchiveConfiguration setStripDescriptors:](v4, "setStripDescriptors:", self->_stripDescriptors);
  -[PRSDataStoreArchiveConfiguration setStripContentsOfConfigurations:](v4, "setStripContentsOfConfigurations:", self->_stripContentsOfConfigurations);
  -[PRSDataStoreArchiveConfiguration setReapNonLatestEntries:](v4, "setReapNonLatestEntries:", self->_reapNonLatestEntries);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PRSMutableDataStoreArchiveConfiguration *v4;

  v4 = -[PRSDataStoreArchiveConfiguration init](+[PRSMutableDataStoreArchiveConfiguration allocWithZone:](PRSMutableDataStoreArchiveConfiguration, "allocWithZone:", a3), "init");
  -[PRSDataStoreArchiveConfiguration setStripScreenshots:](v4, "setStripScreenshots:", self->_stripScreenshots);
  -[PRSDataStoreArchiveConfiguration setStripDescriptors:](v4, "setStripDescriptors:", self->_stripDescriptors);
  -[PRSDataStoreArchiveConfiguration setStripContentsOfConfigurations:](v4, "setStripContentsOfConfigurations:", self->_stripContentsOfConfigurations);
  -[PRSDataStoreArchiveConfiguration setReapNonLatestEntries:](v4, "setReapNonLatestEntries:", self->_reapNonLatestEntries);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)stripScreenshots
{
  return self->_stripScreenshots;
}

- (void)setStripScreenshots:(BOOL)a3
{
  self->_stripScreenshots = a3;
}

- (BOOL)stripDescriptors
{
  return self->_stripDescriptors;
}

- (void)setStripDescriptors:(BOOL)a3
{
  self->_stripDescriptors = a3;
}

- (BOOL)stripContentsOfConfigurations
{
  return self->_stripContentsOfConfigurations;
}

- (void)setStripContentsOfConfigurations:(BOOL)a3
{
  self->_stripContentsOfConfigurations = a3;
}

- (BOOL)reapNonLatestEntries
{
  return self->_reapNonLatestEntries;
}

- (void)setReapNonLatestEntries:(BOOL)a3
{
  self->_reapNonLatestEntries = a3;
}

@end
