@implementation PXContextualMemoriesSettings

- (PXContextualMemoriesSettings)init
{
  PXContextualMemoriesSettings *v2;
  PXContextualMemoriesTimeSetting *v3;
  PXContextualMemoriesTimeSetting *timeSetting;
  PXContextualMemoriesLocationSetting *v5;
  PXContextualMemoriesLocationSetting *locationSetting;
  PXContextualMemoriesPeopleSetting *v7;
  PXContextualMemoriesPeopleSetting *peopleSetting;
  uint64_t v9;
  NSArray *settings;
  objc_super v12;
  __int128 v13;
  PXContextualMemoriesPeopleSetting *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PXContextualMemoriesSettings;
  v2 = -[PXContextualMemoriesSettings init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXContextualMemoriesTimeSetting);
    timeSetting = v2->_timeSetting;
    v2->_timeSetting = v3;

    v5 = objc_alloc_init(PXContextualMemoriesLocationSetting);
    locationSetting = v2->_locationSetting;
    v2->_locationSetting = v5;

    v7 = objc_alloc_init(PXContextualMemoriesPeopleSetting);
    peopleSetting = v2->_peopleSetting;
    v2->_peopleSetting = v7;

    v13 = *(_OWORD *)&v2->_timeSetting;
    v14 = v2->_peopleSetting;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 3);
    v9 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (NSArray *)v9;

  }
  return v2;
}

- (NSDate)date
{
  return -[PXContextualMemoriesTimeSetting date](self->_timeSetting, "date");
}

- (CLLocation)location
{
  return -[PXContextualMemoriesLocationSetting location](self->_locationSetting, "location");
}

- (NSArray)peopleNames
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[PXContextualMemoriesPeopleSetting peopleNames](self->_peopleSetting, "peopleNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (NSDictionary)extraParameters
{
  return self->_extraParameters;
}

- (void)setExtraParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PXContextualMemoriesTimeSetting)timeSetting
{
  return self->_timeSetting;
}

- (PXContextualMemoriesLocationSetting)locationSetting
{
  return self->_locationSetting;
}

- (PXContextualMemoriesPeopleSetting)peopleSetting
{
  return self->_peopleSetting;
}

- (NSArray)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_peopleSetting, 0);
  objc_storeStrong((id *)&self->_locationSetting, 0);
  objc_storeStrong((id *)&self->_timeSetting, 0);
  objc_storeStrong((id *)&self->_extraParameters, 0);
}

@end
