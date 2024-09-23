@implementation SCLPersistentSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLPersistentSettings)init
{
  SCLPersistentSettings *v2;
  SCLScheduleSettings *v3;
  SCLScheduleSettings *scheduleSettings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLPersistentSettings;
  v2 = -[SCLPersistentSettings init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SCLScheduleSettings);
    scheduleSettings = v2->_scheduleSettings;
    v2->_scheduleSettings = v3;

  }
  return v2;
}

- (SCLPersistentSettings)initWithCoder:(id)a3
{
  id v4;
  SCLPersistentSettings *v5;
  uint64_t v6;
  SCLScheduleSettings *scheduleSettings;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCLPersistentSettings;
  v5 = -[SCLPersistentSettings init](&v9, sel_init);
  if (v5)
  {
    v5->_manualSchoolModeEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("manualSchoolModeEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduleSettings"));
    v6 = objc_claimAutoreleasedReturnValue();
    scheduleSettings = v5->_scheduleSettings;
    v5->_scheduleSettings = (SCLScheduleSettings *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  SCLScheduleSettings *scheduleSettings;
  id v5;

  scheduleSettings = self->_scheduleSettings;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", scheduleSettings, CFSTR("scheduleSettings"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_manualSchoolModeEnabled, CFSTR("manualSchoolModeEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SCLPersistentSettings *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(SCLPersistentSettings);
  -[SCLPersistentSettings setManualSchoolModeEnabled:](v4, "setManualSchoolModeEnabled:", -[SCLPersistentSettings isManualSchoolModeEnabled](self, "isManualSchoolModeEnabled"));
  -[SCLPersistentSettings scheduleSettings](self, "scheduleSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[SCLPersistentSettings setScheduleSettings:](v4, "setScheduleSettings:", v6);

  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SCLScheduleSettings hash](self->_scheduleSettings, "hash");
  return v3 ^ -[SCLPersistentSettings isManualSchoolModeEnabled](self, "isManualSchoolModeEnabled");
}

- (BOOL)isEqual:(id)a3
{
  SCLPersistentSettings *v4;
  SCLPersistentSettings *v5;
  _BOOL4 v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (SCLPersistentSettings *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SCLPersistentSettings isManualSchoolModeEnabled](v5, "isManualSchoolModeEnabled");
      if (v6 == -[SCLPersistentSettings isManualSchoolModeEnabled](self, "isManualSchoolModeEnabled"))
      {
        -[SCLPersistentSettings scheduleSettings](v5, "scheduleSettings");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLPersistentSettings scheduleSettings](self, "scheduleSettings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9)
        {
          v7 = 1;
        }
        else
        {
          -[SCLPersistentSettings scheduleSettings](v5, "scheduleSettings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCLPersistentSettings scheduleSettings](self, "scheduleSettings");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v10, "isEqual:", v11);

        }
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (SCLScheduleSettings)scheduleSettings
{
  return self->_scheduleSettings;
}

- (void)setScheduleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleSettings, a3);
}

- (BOOL)isManualSchoolModeEnabled
{
  return self->_manualSchoolModeEnabled;
}

- (void)setManualSchoolModeEnabled:(BOOL)a3
{
  self->_manualSchoolModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleSettings, 0);
}

@end
