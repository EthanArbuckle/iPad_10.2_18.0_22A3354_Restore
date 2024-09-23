@implementation SOAlarm

- (SOAlarm)initWithBuilder:(id)a3
{
  void (**v4)(id, _SOAlarmMutation *);
  SOAlarm *v5;
  SOAlarm *v6;
  _SOAlarmMutation *v7;
  void *v8;
  uint64_t v9;
  NSUUID *alarmID;
  void *v11;
  uint64_t v12;
  NSURL *alarmURL;
  void *v14;
  uint64_t v15;
  NSString *title;
  objc_super v18;

  v4 = (void (**)(id, _SOAlarmMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)SOAlarm;
  v5 = -[SOAlarm init](&v18, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_SOAlarmMutation initWithBase:]([_SOAlarmMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_SOAlarmMutation isDirty](v7, "isDirty"))
    {
      -[_SOAlarmMutation getAlarmID](v7, "getAlarmID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      alarmID = v6->_alarmID;
      v6->_alarmID = (NSUUID *)v9;

      -[_SOAlarmMutation getAlarmURL](v7, "getAlarmURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      alarmURL = v6->_alarmURL;
      v6->_alarmURL = (NSURL *)v12;

      -[_SOAlarmMutation getTitle](v7, "getTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      title = v6->_title;
      v6->_title = (NSString *)v15;

      v6->_hour = -[_SOAlarmMutation getHour](v7, "getHour");
      v6->_minute = -[_SOAlarmMutation getMinute](v7, "getMinute");
      v6->_repeatSchedule = -[_SOAlarmMutation getRepeatSchedule](v7, "getRepeatSchedule");
      v6->_isEnabled = -[_SOAlarmMutation getIsEnabled](v7, "getIsEnabled");
      v6->_isFiring = -[_SOAlarmMutation getIsFiring](v7, "getIsFiring");
    }

  }
  return v6;
}

- (SOAlarm)init
{
  return -[SOAlarm initWithBuilder:](self, "initWithBuilder:", 0);
}

- (SOAlarm)initWithAlarmID:(id)a3 alarmURL:(id)a4 title:(id)a5 hour:(unint64_t)a6 minute:(unint64_t)a7 repeatSchedule:(unint64_t)a8 isEnabled:(BOOL)a9 isFiring:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SOAlarm *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  BOOL v31;
  BOOL v32;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __88__SOAlarm_initWithAlarmID_alarmURL_title_hour_minute_repeatSchedule_isEnabled_isFiring___block_invoke;
  v24[3] = &unk_24CE75D70;
  v25 = v16;
  v26 = v17;
  v27 = v18;
  v28 = a6;
  v29 = a7;
  v30 = a8;
  v31 = a9;
  v32 = a10;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  v22 = -[SOAlarm initWithBuilder:](self, "initWithBuilder:", v24);

  return v22;
}

- (id)description
{
  return -[SOAlarm _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t minute;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  objc_super v16;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v16.receiver = self;
  v16.super_class = (Class)SOAlarm;
  -[SOAlarm description](&v16, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_OWORD *)&self->_alarmID;
  v14 = *(_OWORD *)&self->_title;
  minute = self->_minute;
  SOAlarmRepeatScheduleGetNames(self->_repeatSchedule);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("|"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("YES");
  if (self->_isEnabled)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (!self->_isFiring)
    v10 = CFSTR("NO");
  v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {alarmID = %@, alarmURL = %@, title = %@, hour = %llu, minute = %llu, repeatSchedule = %@, isEnabled = %@, isFiring = %@}"), v5, v15, v14, minute, v8, v11, v10);

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  v3 = -[NSUUID hash](self->_alarmID, "hash");
  v4 = -[NSURL hash](self->_alarmURL, "hash") ^ v3;
  v5 = v4 ^ -[NSString hash](self->_title, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_hour);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_minute);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_repeatSchedule);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 ^ v9 ^ objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEnabled);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFiring);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11 ^ v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  SOAlarm *v4;
  SOAlarm *v5;
  unint64_t hour;
  unint64_t minute;
  unint64_t repeatSchedule;
  _BOOL4 isEnabled;
  _BOOL4 isFiring;
  NSUUID *v11;
  NSUUID *alarmID;
  NSURL *v13;
  NSURL *alarmURL;
  NSString *v15;
  NSString *title;
  BOOL v17;

  v4 = (SOAlarm *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      hour = self->_hour;
      if (hour == -[SOAlarm hour](v5, "hour")
        && (minute = self->_minute, minute == -[SOAlarm minute](v5, "minute"))
        && (repeatSchedule = self->_repeatSchedule, repeatSchedule == -[SOAlarm repeatSchedule](v5, "repeatSchedule"))
        && (isEnabled = self->_isEnabled, isEnabled == -[SOAlarm isEnabled](v5, "isEnabled"))
        && (isFiring = self->_isFiring, isFiring == -[SOAlarm isFiring](v5, "isFiring")))
      {
        -[SOAlarm alarmID](v5, "alarmID");
        v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        alarmID = self->_alarmID;
        if (alarmID == v11 || -[NSUUID isEqual:](alarmID, "isEqual:", v11))
        {
          -[SOAlarm alarmURL](v5, "alarmURL");
          v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
          alarmURL = self->_alarmURL;
          if (alarmURL == v13 || -[NSURL isEqual:](alarmURL, "isEqual:", v13))
          {
            -[SOAlarm title](v5, "title");
            v15 = (NSString *)objc_claimAutoreleasedReturnValue();
            title = self->_title;
            v17 = title == v15 || -[NSString isEqual:](title, "isEqual:", v15);

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (SOAlarm)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  SOAlarm *v16;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SOAlarm::alarmID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SOAlarm::alarmURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SOAlarm::title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SOAlarm::hour"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SOAlarm::minute"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SOAlarm::repeatSchedule"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SOAlarm::isEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SOAlarm::isFiring"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v15, "BOOLValue");
  BYTE1(v18) = (_BYTE)v3;
  LOBYTE(v18) = v14;
  v16 = -[SOAlarm initWithAlarmID:alarmURL:title:hour:minute:repeatSchedule:isEnabled:isFiring:](self, "initWithAlarmID:alarmURL:title:hour:minute:repeatSchedule:isEnabled:isFiring:", v4, v5, v6, v8, v10, v12, v18);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *alarmID;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  alarmID = self->_alarmID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", alarmID, CFSTR("SOAlarm::alarmID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alarmURL, CFSTR("SOAlarm::alarmURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("SOAlarm::title"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_hour);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("SOAlarm::hour"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_minute);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("SOAlarm::minute"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_repeatSchedule);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("SOAlarm::repeatSchedule"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("SOAlarm::isEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFiring);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("SOAlarm::isFiring"));

}

- (NSUUID)alarmID
{
  return self->_alarmID;
}

- (NSURL)alarmURL
{
  return self->_alarmURL;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (unint64_t)minute
{
  return self->_minute;
}

- (unint64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isFiring
{
  return self->_isFiring;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alarmURL, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

void __88__SOAlarm_initWithAlarmID_alarmURL_title_hour_minute_repeatSchedule_isEnabled_isFiring___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAlarmID:", v3);
  objc_msgSend(v4, "setAlarmURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setTitle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setHour:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setMinute:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setRepeatSchedule:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setIsEnabled:", *(unsigned __int8 *)(a1 + 80));
  objc_msgSend(v4, "setIsFiring:", *(unsigned __int8 *)(a1 + 81));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SOAlarmMutation *);
  _SOAlarmMutation *v5;
  SOAlarm *v6;
  void *v7;
  uint64_t v8;
  NSUUID *alarmID;
  void *v10;
  uint64_t v11;
  NSURL *alarmURL;
  void *v13;
  uint64_t v14;
  NSString *title;

  v4 = (void (**)(id, _SOAlarmMutation *))a3;
  if (v4)
  {
    v5 = -[_SOAlarmMutation initWithBase:]([_SOAlarmMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_SOAlarmMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(SOAlarm);
      -[_SOAlarmMutation getAlarmID](v5, "getAlarmID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      alarmID = v6->_alarmID;
      v6->_alarmID = (NSUUID *)v8;

      -[_SOAlarmMutation getAlarmURL](v5, "getAlarmURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      alarmURL = v6->_alarmURL;
      v6->_alarmURL = (NSURL *)v11;

      -[_SOAlarmMutation getTitle](v5, "getTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      title = v6->_title;
      v6->_title = (NSString *)v14;

      v6->_hour = -[_SOAlarmMutation getHour](v5, "getHour");
      v6->_minute = -[_SOAlarmMutation getMinute](v5, "getMinute");
      v6->_repeatSchedule = -[_SOAlarmMutation getRepeatSchedule](v5, "getRepeatSchedule");
      v6->_isEnabled = -[_SOAlarmMutation getIsEnabled](v5, "getIsEnabled");
      v6->_isFiring = -[_SOAlarmMutation getIsFiring](v5, "getIsFiring");
    }
    else
    {
      v6 = (SOAlarm *)-[SOAlarm copy](self, "copy");
    }

  }
  else
  {
    v6 = (SOAlarm *)-[SOAlarm copy](self, "copy");
  }

  return v6;
}

@end
