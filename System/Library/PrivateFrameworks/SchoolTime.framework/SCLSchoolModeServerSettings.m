@implementation SCLSchoolModeServerSettings

- (void)encodeWithCoder:(id)a3
{
  SCLScheduleSettings *scheduleSettings;
  id v5;

  scheduleSettings = self->_scheduleSettings;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", scheduleSettings, CFSTR("scheduleSettings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_loaded, CFSTR("loaded"));

}

- (SCLSchoolModeServerSettings)initWithCoder:(id)a3
{
  id v4;
  SCLSchoolModeServerSettings *v5;
  uint64_t v6;
  SCLScheduleSettings *scheduleSettings;
  uint64_t v8;
  SCLState *state;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLSchoolModeServerSettings;
  v5 = -[SCLSchoolModeServerSettings init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduleSettings"));
    v6 = objc_claimAutoreleasedReturnValue();
    scheduleSettings = v5->_scheduleSettings;
    v5->_scheduleSettings = (SCLScheduleSettings *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v8 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (SCLState *)v8;

    v5->_loaded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("loaded"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSettings:", self);
}

- (SCLSchoolModeServerSettings)initWithSettings:(id)a3
{
  id v4;
  SCLSchoolModeServerSettings *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCLSchoolModeServerSettings;
  v5 = -[SCLSchoolModeServerSettings init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "scheduleSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSchoolModeServerSettings setScheduleSettings:](v5, "setScheduleSettings:", v6);

    objc_msgSend(v4, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSchoolModeServerSettings setState:](v5, "setState:", v7);

    -[SCLSchoolModeServerSettings setLoaded:](v5, "setLoaded:", objc_msgSend(v4, "isLoaded"));
  }

  return v5;
}

- (SCLScheduleSettings)scheduleSettings
{
  return self->_scheduleSettings;
}

- (void)setScheduleSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SCLState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_scheduleSettings, 0);
}

@end
