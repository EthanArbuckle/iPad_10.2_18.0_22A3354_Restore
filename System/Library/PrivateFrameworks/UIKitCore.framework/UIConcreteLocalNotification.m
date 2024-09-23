@implementation UIConcreteLocalNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIConcreteLocalNotification)init
{
  UIConcreteLocalNotification *v2;
  UIConcreteLocalNotification *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIConcreteLocalNotification;
  v2 = -[UILocalNotification init](&v5, sel_init);
  v3 = v2;
  if (v2)
    UILocalNotificationCommonInit(v2);
  return v3;
}

- (UIConcreteLocalNotification)initWithCoder:(id)a3
{
  id v5;
  UIConcreteLocalNotification *v6;
  UIConcreteLocalNotification *v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *fireDate;
  uint64_t v11;
  NSTimeZone *timeZone;
  uint64_t v13;
  NSCalendar *repeatCalendar;
  uint64_t v15;
  NSString *alertBody;
  uint64_t v17;
  NSString *alertAction;
  uint64_t v19;
  NSString *alertLaunchImage;
  uint64_t v21;
  NSString *alertTitle;
  uint64_t v23;
  NSString *soundName;
  uint64_t v25;
  NSData *userInfoData;
  uint64_t v27;
  NSString *category;
  void *v29;
  id v30;
  uint64_t v31;
  CLRegion *region;
  void *v34;
  objc_super v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UILocalNotification.m"), 395, CFSTR("New properties were added so can only decode correctly if can test for keys."));

  }
  v35.receiver = self;
  v35.super_class = (Class)UIConcreteLocalNotification;
  v6 = -[UILocalNotification init](&v35, sel_init);
  v7 = v6;
  if (v6)
  {
    UILocalNotificationCommonInit(v6);
    v8 = objc_opt_class();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UILocalNotificationFireDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    fireDate = v7->fireDate;
    v7->fireDate = (NSDate *)v9;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UILocalNotificationTimeZone"));
    v11 = objc_claimAutoreleasedReturnValue();
    timeZone = v7->timeZone;
    v7->timeZone = (NSTimeZone *)v11;

    v7->repeatInterval = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_UILocalNotificationRepeatInterval"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UILocalNotificationRepeatCalendar"));
    v13 = objc_claimAutoreleasedReturnValue();
    repeatCalendar = v7->repeatCalendar;
    v7->repeatCalendar = (NSCalendar *)v13;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", v8, CFSTR("_UILocalNotificationAlertBody"));
    v15 = objc_claimAutoreleasedReturnValue();
    alertBody = v7->alertBody;
    v7->alertBody = (NSString *)v15;

    v7->hasAction = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_UILocalNotificationHasAction"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", v8, CFSTR("_UILocalNotificationAlertAction"));
    v17 = objc_claimAutoreleasedReturnValue();
    alertAction = v7->alertAction;
    v7->alertAction = (NSString *)v17;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", v8, CFSTR("_UILocalNotificationAlertLaunchImage"));
    v19 = objc_claimAutoreleasedReturnValue();
    alertLaunchImage = v7->alertLaunchImage;
    v7->alertLaunchImage = (NSString *)v19;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", v8, CFSTR("_UILocalNotificationAlertTitle"));
    v21 = objc_claimAutoreleasedReturnValue();
    alertTitle = v7->alertTitle;
    v7->alertTitle = (NSString *)v21;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", v8, CFSTR("_UILocalNotificationSoundName"));
    v23 = objc_claimAutoreleasedReturnValue();
    soundName = v7->soundName;
    v7->soundName = (NSString *)v23;

    v7->applicationIconBadgeNumber = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_UILocalNotificationApplicationIconBadgeNumber"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UILocalNotificationUserInfoData"));
    v25 = objc_claimAutoreleasedReturnValue();
    userInfoData = v7->userInfoData;
    v7->userInfoData = (NSData *)v25;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", v8, CFSTR("_UILocalNotificationCategoryKey"));
    v27 = objc_claimAutoreleasedReturnValue();
    category = v7->category;
    v7->category = (NSString *)v27;

    v7->regionTriggersOnce = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_UILocalNotificationRegionTriggersOnceKey"));
    v37 = 0;
    v38 = &v37;
    v39 = 0x2050000000;
    v29 = (void *)_MergedGlobals_1_15;
    v40 = _MergedGlobals_1_15;
    if (!_MergedGlobals_1_15)
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __getCLRegionClass_block_invoke;
      v36[3] = &unk_1E16B14C0;
      v36[4] = &v37;
      __getCLRegionClass_block_invoke((uint64_t)v36);
      v29 = (void *)v38[3];
    }
    v30 = objc_retainAutorelease(v29);
    _Block_object_dispose(&v37, 8);
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", v30, CFSTR("_UILocalNotificationRegionKey"));
    v31 = objc_claimAutoreleasedReturnValue();
    region = v7->region;
    v7->region = (CLRegion *)v31;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *fireDate;
  id v5;

  fireDate = self->fireDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fireDate, CFSTR("_UILocalNotificationFireDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->timeZone, CFSTR("_UILocalNotificationTimeZone"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->repeatInterval, CFSTR("_UILocalNotificationRepeatInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->repeatCalendar, CFSTR("_UILocalNotificationRepeatCalendar"));
  objc_msgSend(v5, "encodeObject:forKey:", self->alertBody, CFSTR("_UILocalNotificationAlertBody"));
  objc_msgSend(v5, "encodeBool:forKey:", self->hasAction, CFSTR("_UILocalNotificationHasAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->alertAction, CFSTR("_UILocalNotificationAlertAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->alertLaunchImage, CFSTR("_UILocalNotificationAlertLaunchImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->alertTitle, CFSTR("_UILocalNotificationAlertTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->soundName, CFSTR("_UILocalNotificationSoundName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->applicationIconBadgeNumber, CFSTR("_UILocalNotificationApplicationIconBadgeNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->userInfoData, CFSTR("_UILocalNotificationUserInfoData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->category, CFSTR("_UILocalNotificationCategoryKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->regionTriggersOnce, CFSTR("_UILocalNotificationRegionTriggersOnceKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->region, CFSTR("_UILocalNotificationRegionKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setFireDate:", self->fireDate);
  objc_msgSend(v4, "setTimeZone:", self->timeZone);
  objc_msgSend(v4, "setRepeatInterval:", self->repeatInterval);
  objc_msgSend(v4, "setRepeatCalendar:", self->repeatCalendar);
  objc_msgSend(v4, "setAlertBody:", self->alertBody);
  objc_msgSend(v4, "setHasAction:", self->hasAction);
  objc_msgSend(v4, "setAlertAction:", self->alertAction);
  objc_msgSend(v4, "setAlertLaunchImage:", self->alertLaunchImage);
  objc_msgSend(v4, "setAlertTitle:", self->alertTitle);
  objc_msgSend(v4, "setSoundName:", self->soundName);
  objc_msgSend(v4, "setApplicationIconBadgeNumber:", self->applicationIconBadgeNumber);
  objc_msgSend(v4, "_setUserInfoData:", self->userInfoData);
  objc_msgSend(v4, "setCategory:", self->category);
  objc_msgSend(v4, "setRegion:", self->region);
  objc_msgSend(v4, "setRegionTriggersOnce:", self->regionTriggersOnce);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSDate *fireDate;
  NSDate *v6;
  NSTimeZone *timeZone;
  NSTimeZone *v8;
  unint64_t repeatInterval;
  NSCalendar *repeatCalendar;
  NSCalendar *v11;
  NSString *alertBody;
  NSString *v13;
  int hasAction;
  NSString *alertAction;
  NSString *v16;
  NSString *alertLaunchImage;
  NSString *v18;
  NSString *alertTitle;
  NSString *v20;
  NSString *soundName;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  int v25;
  int64_t applicationIconBadgeNumber;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSString *category;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  int regionTriggersOnce;
  void *v40;
  int v41;
  BOOL v42;
  void *v44;
  void *v45;
  void *v46;
  NSString *v47;
  void *v48;
  void *v49;
  NSString *v50;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    fireDate = self->fireDate;
    objc_msgSend(v4, "fireDate");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (fireDate == v6 || -[NSDate isEqual:](fireDate, "isEqual:", v6))
    {
      timeZone = self->timeZone;
      objc_msgSend(v4, "timeZone");
      v8 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
      if ((timeZone == v8 || -[NSTimeZone isEqual:](timeZone, "isEqual:", v8))
        && (repeatInterval = self->repeatInterval, repeatInterval == objc_msgSend(v4, "repeatInterval")))
      {
        repeatCalendar = self->repeatCalendar;
        objc_msgSend(v4, "repeatCalendar");
        v11 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
        if (repeatCalendar == v11 || -[NSCalendar isEqual:](repeatCalendar, "isEqual:", v11))
        {
          alertBody = self->alertBody;
          objc_msgSend(v4, "alertBody");
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          if ((alertBody == v13 || -[NSString isEqual:](alertBody, "isEqual:", v13))
            && (hasAction = self->hasAction, hasAction == objc_msgSend(v4, "hasAction")))
          {
            alertAction = self->alertAction;
            objc_msgSend(v4, "alertAction");
            v16 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (alertAction == v16 || -[NSString isEqual:](alertAction, "isEqual:", v16))
            {
              alertLaunchImage = self->alertLaunchImage;
              objc_msgSend(v4, "alertLaunchImage");
              v18 = (NSString *)objc_claimAutoreleasedReturnValue();
              if (alertLaunchImage == v18 || -[NSString isEqual:](alertLaunchImage, "isEqual:", v18))
              {
                alertTitle = self->alertTitle;
                objc_msgSend(v4, "alertTitle");
                v20 = (NSString *)objc_claimAutoreleasedReturnValue();
                if (alertTitle == v20 || -[NSString isEqual:](alertTitle, "isEqual:", v20))
                {
                  soundName = self->soundName;
                  objc_msgSend(v4, "soundName");
                  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
                  if (soundName == v22
                    || (v23 = soundName, v24 = v22, v25 = -[NSString isEqual:](v23, "isEqual:", v22), v22 = v24, v25))
                  {
                    v50 = v22;
                    applicationIconBadgeNumber = self->applicationIconBadgeNumber;
                    if (applicationIconBadgeNumber == objc_msgSend(v4, "applicationIconBadgeNumber"))
                    {
                      -[UIConcreteLocalNotification userInfo](self, "userInfo");
                      v27 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "userInfo");
                      v28 = objc_claimAutoreleasedReturnValue();
                      v29 = (void *)v27;
                      v30 = (void *)v28;
                      v49 = v29;
                      if (v29 == (void *)v28 || objc_msgSend(v29, "isEqual:", v28))
                      {
                        v48 = v30;
                        category = self->category;
                        objc_msgSend(v4, "category");
                        v32 = (NSString *)objc_claimAutoreleasedReturnValue();
                        if (category == v32
                          || (v33 = category, v34 = v32,
                                              v35 = -[NSString isEqual:](v33, "isEqual:", v32),
                                              v32 = v34,
                                              v35))
                        {
                          v47 = v32;
                          -[CLRegion identifier](self->region, "identifier");
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v4, "region");
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v46, "identifier");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          v45 = v36;
                          if (v36 == v37 || (v44 = v37, v38 = objc_msgSend(v36, "isEqual:", v37), v37 = v44, v38))
                          {
                            regionTriggersOnce = self->regionTriggersOnce;
                            v40 = v37;
                            v41 = objc_msgSend(v4, "regionTriggersOnce");
                            v37 = v40;
                            v42 = regionTriggersOnce == v41;
                          }
                          else
                          {
                            v42 = 0;
                          }

                          v32 = v47;
                        }
                        else
                        {
                          v42 = 0;
                        }

                        v30 = v48;
                      }
                      else
                      {
                        v42 = 0;
                      }

                    }
                    else
                    {
                      v42 = 0;
                    }
                    v22 = v50;
                  }
                  else
                  {
                    v42 = 0;
                  }

                }
                else
                {
                  v42 = 0;
                }

              }
              else
              {
                v42 = 0;
              }

            }
            else
            {
              v42 = 0;
            }

          }
          else
          {
            v42 = 0;
          }

        }
        else
        {
          v42 = 0;
        }

      }
      else
      {
        v42 = 0;
      }

    }
    else
    {
      v42 = 0;
    }

  }
  else
  {
    v42 = 0;
  }

  return v42;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = self->repeatInterval + -[NSDate hash](self->fireDate, "hash");
  -[CLRegion identifier](self->region, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 + objc_msgSend(v4, "hash") + self->regionTriggersOnce;

  return v5;
}

- (int64_t)compareFireDates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSDate *fireDate;
  void *v11;
  unint64_t v12;
  unint64_t repeatInterval;
  BOOL v14;
  _BOOL8 v15;

  v4 = a3;
  v5 = v4;
  if (self->region
    || (objc_msgSend(v4, "region"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(v5, "region");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = comparePotentiallyNilObjects(v7, self->region);

  }
  else
  {
    fireDate = self->fireDate;
    objc_msgSend(v5, "fireDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = comparePotentiallyNilObjects(fireDate, v11);

    if (!v8)
    {
      v12 = objc_msgSend(v5, "repeatInterval");
      repeatInterval = self->repeatInterval;
      v14 = repeatInterval >= v12;
      v15 = repeatInterval > v12;
      if (v14)
        v8 = v15;
      else
        v8 = -1;
    }
  }

  return v8;
}

- (void)_setUserInfoData:(id)a3
{
  objc_storeStrong((id *)&self->userInfoData, a3);
}

- (void)setUserInfo:(id)a3
{
  id v4;
  NSData *userInfoData;
  NSData *v6;
  id v7;
  NSData *v8;
  NSData *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("userInfo is not an NSDictionary"), 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    }
    userInfoData = self->userInfoData;
    self->userInfoData = 0;

    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v15);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    v8 = self->userInfoData;
    self->userInfoData = v6;

    if (!self->userInfoData)
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to serialize userInfo: %@"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v14);
    }

  }
  else
  {
    v9 = self->userInfoData;
    self->userInfoData = 0;

  }
}

- (id)userInfo
{
  NSData *userInfoData;
  void *v3;

  userInfoData = self->userInfoData;
  if (!userInfoData)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", userInfoData, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v3 = 0;
  }
  return v3;
}

- (id)description
{
  void *v3;
  __CFString *v4;
  CLRegion *region;
  const __CFString *v6;
  id v7;
  void *v8;
  int64_t repeatInterval;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSTimeZone *timeZone;
  void *v18;
  objc_super v20;
  objc_super v21;

  if (!self->region)
  {
    repeatInterval = self->repeatInterval;
    if (repeatInterval > 255)
    {
      if (repeatInterval <= 2047)
      {
        switch(repeatInterval)
        {
          case 256:
            v4 = CFSTR("NSWeekCalendarUnit");
            goto LABEL_40;
          case 512:
            v4 = CFSTR("NSCalendarUnitWeekday");
            goto LABEL_40;
          case 1024:
            v4 = CFSTR("NSCalendarUnitWeekdayOrdinal");
            goto LABEL_40;
        }
      }
      else if (repeatInterval >= 0x2000)
      {
        if (repeatInterval == 0x2000)
        {
          v4 = CFSTR("NSCalendarUnitWeekOfYear");
          goto LABEL_40;
        }
        if (repeatInterval == 0x4000)
        {
          v4 = CFSTR("NSCalendarUnitYearForWeekOfYear");
          goto LABEL_40;
        }
      }
      else
      {
        if (repeatInterval == 2048)
        {
          v4 = CFSTR("NSCalendarUnitQuarter");
          goto LABEL_40;
        }
        if (repeatInterval == 4096)
        {
          v4 = CFSTR("NSCalendarUnitWeekOfMonth");
          goto LABEL_40;
        }
      }
    }
    else if (repeatInterval <= 15)
    {
      switch(repeatInterval)
      {
        case 2:
          v4 = CFSTR("NSCalendarUnitEra");
          goto LABEL_40;
        case 4:
          v4 = CFSTR("NSCalendarUnitYear");
          goto LABEL_40;
        case 8:
          v4 = CFSTR("NSCalendarUnitMonth");
          goto LABEL_40;
      }
    }
    else if (repeatInterval > 63)
    {
      if (repeatInterval == 64)
      {
        v4 = CFSTR("NSCalendarUnitMinute");
        goto LABEL_40;
      }
      if (repeatInterval == 128)
      {
        v4 = CFSTR("NSCalendarUnitSecond");
        goto LABEL_40;
      }
    }
    else
    {
      if (repeatInterval == 16)
      {
        v4 = CFSTR("NSCalendarUnitDay");
        goto LABEL_40;
      }
      if (repeatInterval == 32)
      {
        v4 = CFSTR("NSCalendarUnitHour");
LABEL_40:
        v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v7, "setDateStyle:", 4);
        objc_msgSend(v7, "setTimeStyle:", 4);
        objc_msgSend(v7, "setTimeZone:", self->timeZone);
        objc_msgSend(v7, "stringForObjectValue:", self->fireDate);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTimeZone:", v11);

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIConcreteLocalNotification nextFireDateForLastFireDate:](self, "nextFireDateForLastFireDate:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringForObjectValue:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0CB3940];
        v20.receiver = self;
        v20.super_class = (Class)UIConcreteLocalNotification;
        -[UIConcreteLocalNotification description](&v20, sel_description);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        timeZone = self->timeZone;
        -[UIConcreteLocalNotification userInfo](self, "userInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@{fire date = %@, time zone = %@, repeat interval = %@, next fire date = %@, user info = %@}"), v16, v10, timeZone, v4, v14, v18);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_41;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->repeatInterval);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  v21.receiver = self;
  v21.super_class = (Class)UIConcreteLocalNotification;
  -[UIConcreteLocalNotification description](&v21, sel_description);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  region = self->region;
  if (self->regionTriggersOnce)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[UIConcreteLocalNotification userInfo](self, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@{region = %@, regionTriggersOnce = %@, user info = %@}"), v4, region, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:

  return v8;
}

- (id)nextFireDateForLastFireDate:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[UIConcreteLocalNotification isTriggeredByDate](self, "isTriggeredByDate"))
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = -60.0;
    if ((self->repeatInterval & 0xC0) == 0)
      v5 = -900.0;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "laterDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIConcreteLocalNotification nextFireDateAfterDate:localTimeZone:](self, "nextFireDateAfterDate:localTimeZone:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)nextFireDateAfterDate:(id)a3 localTimeZone:(id)a4
{
  id v7;
  id v8;
  unint64_t repeatInterval;
  unint64_t v10;
  uint64_t v11;
  NSDate *fireDate;
  NSDate *v13;
  NSTimeZone *timeZone;
  NSCalendar *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDate *v19;
  NSCalendar *v20;
  void *v21;
  char v22;
  NSCalendar *v23;
  void *v24;
  void *v25;
  NSDate *v26;
  NSDate *v27;
  NSDate *v28;
  uint64_t v29;
  NSDate *v30;
  NSDate *v31;
  NSDate *v32;
  double v33;
  void *v35;
  const char *v36;
  double v37;

  v7 = a3;
  v8 = a4;
  repeatInterval = self->repeatInterval;
  if (repeatInterval)
  {
    v10 = 0;
    do
    {
      v11 = qword_186681C90[v10];
      if (v10 > 9)
        break;
      ++v10;
    }
    while (v11 != repeatInterval);
    if (v11 != repeatInterval)
      goto LABEL_25;
  }
  fireDate = self->fireDate;
  if (!fireDate)
  {
    v13 = (NSDate *)v7;
    goto LABEL_46;
  }
  v13 = fireDate;
  if (v8)
  {
    timeZone = self->timeZone;
    if (timeZone)
    {
      if ((-[NSTimeZone isEqual:](timeZone, "isEqual:", v8) & 1) == 0)
      {
        v15 = self->repeatCalendar;
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v15 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
        }
        v16 = (void *)-[NSCalendar copy](v15, "copy");

        objc_msgSend(v16, "setTimeZone:", self->timeZone);
        objc_msgSend(v16, "components:fromDate:", 254, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTimeZone:", v8);
        objc_msgSend(v16, "dateFromComponents:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v13 = (NSDate *)v18;
      }
    }
  }
  -[NSDate earlierDate:](v13, "earlierDate:", v7);
  v19 = (NSDate *)objc_claimAutoreleasedReturnValue();

  if (v19 == v13)
  {
    if (self->repeatInterval)
    {
      v20 = self->repeatCalendar;
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v20 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
      }
      -[NSCalendar timeZone](v20, "timeZone");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqual:", v8);

      if ((v22 & 1) == 0)
      {
        v23 = (NSCalendar *)-[NSCalendar copy](v20, "copy");

        -[NSCalendar setTimeZone:](v23, "setTimeZone:", v8);
        v20 = v23;
      }
      if ((objc_msgSend(MEMORY[0x1E0C99D78], "_ui_smallerComponentsRelativeToComponent:", self->repeatInterval) & 0x20) != 0)
      {
        -[NSCalendar components:fromDate:](v20, "components:fromDate:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }
      -[NSCalendar components:fromDate:toDate:options:](v20, "components:fromDate:toDate:options:", self->repeatInterval, v13, v7, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {

        v27 = 0;
        goto LABEL_43;
      }
      v36 = a2;
      _nextAdjustedFireDateForPreviousDateAndComponentsWithRepeatIntervalForCalendar((uint64_t)v13, (uint64_t)v25, self->repeatInterval, v20, v24);
      v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = v26;
        -[NSDate earlierDate:](v26, "earlierDate:", v7);
        v28 = (NSDate *)objc_claimAutoreleasedReturnValue();

        if (v28 != v27)
          goto LABEL_30;
        objc_msgSend(v25, "_ui_setValue:forComponent:", objc_msgSend(v25, "_ui_valueForComponent:", self->repeatInterval) + 1, self->repeatInterval);
        _nextAdjustedFireDateForPreviousDateAndComponentsWithRepeatIntervalForCalendar((uint64_t)v13, (uint64_t)v25, self->repeatInterval, v20, v24);
        v30 = (NSDate *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          -[NSDate earlierDate:](v30, "earlierDate:", v7);
          v31 = (NSDate *)objc_claimAutoreleasedReturnValue();

          if (v31 != v30)
          {
            v27 = v30;
            goto LABEL_30;
          }
          objc_msgSend(v25, "_ui_setValue:forComponent:", objc_msgSend(v25, "_ui_valueForComponent:", self->repeatInterval) + 1, self->repeatInterval);
          _nextAdjustedFireDateForPreviousDateAndComponentsWithRepeatIntervalForCalendar((uint64_t)v13, (uint64_t)v25, self->repeatInterval, v20, v24);
          v27 = (NSDate *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            -[NSDate earlierDate:](v27, "earlierDate:", v7);
            v32 = (NSDate *)objc_claimAutoreleasedReturnValue();

            if (v32 != v27)
            {
LABEL_30:
              v37 = 0.0;
              a2 = v36;
              if (!-[NSCalendar rangeOfUnit:startDate:interval:forDate:](v20, "rangeOfUnit:startDate:interval:forDate:", self->repeatInterval, 0, &v37, v27)|| v37 >= 59.0)
              {
                goto LABEL_42;
              }
              -[NSDate dateByAddingTimeInterval:](v27, "dateByAddingTimeInterval:", 59.0 - v37);
              v29 = objc_claimAutoreleasedReturnValue();

              v27 = (NSDate *)v29;
LABEL_41:
              a2 = v36;
LABEL_42:

LABEL_43:
              v13 = v27;
              if (!v27)
                goto LABEL_46;
              goto LABEL_44;
            }
            NSLog(CFSTR("UILocalNotification: could not calculate next fire date - previous = %@ : next = %@ : repeatInterval = %lu"), v13, v27, self->repeatInterval);

          }
        }
      }
      v27 = 0;
      goto LABEL_41;
    }

LABEL_25:
    v13 = 0;
    goto LABEL_46;
  }
  if (!v13)
    goto LABEL_46;
LABEL_44:
  -[NSDate timeIntervalSinceDate:](v13, "timeIntervalSinceDate:", v7);
  if (v33 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UILocalNotification.m"), 890, CFSTR("invariant not satisfied"));

  }
LABEL_46:

  return v13;
}

- (BOOL)isValid
{
  BOOL v2;
  void *v4;
  void *v5;

  if (self->repeatInterval)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIConcreteLocalNotification nextFireDateForLastFireDate:](self, "nextFireDateForLastFireDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v5 != 0;

  return v2;
}

- (void)validate
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (self->region)
  {
    if (self->fireDate)
    {
      v2 = (void *)MEMORY[0x1E0C99DA0];
      v3 = *MEMORY[0x1E0C99778];
      v6 = CFSTR("UILocalNotification");
      v7[0] = self;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, CFSTR("UILocalNotification may not have both a region and a fireDate defined"), v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v5);
    }
  }
}

- (BOOL)isTriggeredByDate
{
  return self->fireDate != 0;
}

- (BOOL)isTriggeredByRegion
{
  return self->region != 0;
}

- (id)fireDate
{
  return self->fireDate;
}

- (void)setFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)timeZone
{
  return self->timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)repeatInterval
{
  return self->repeatInterval;
}

- (void)setRepeatInterval:(unint64_t)a3
{
  self->repeatInterval = a3;
}

- (id)repeatCalendar
{
  return self->repeatCalendar;
}

- (void)setRepeatCalendar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)alertBody
{
  return self->alertBody;
}

- (void)setAlertBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)hasAction
{
  return self->hasAction;
}

- (void)setHasAction:(BOOL)a3
{
  self->hasAction = a3;
}

- (id)alertAction
{
  return self->alertAction;
}

- (void)setAlertAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)alertLaunchImage
{
  return self->alertLaunchImage;
}

- (void)setAlertLaunchImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)soundName
{
  return self->soundName;
}

- (void)setSoundName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)applicationIconBadgeNumber
{
  return self->applicationIconBadgeNumber;
}

- (void)setApplicationIconBadgeNumber:(int64_t)a3
{
  self->applicationIconBadgeNumber = a3;
}

- (id)category
{
  return self->category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)region
{
  return self->region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)regionTriggersOnce
{
  return self->regionTriggersOnce;
}

- (void)setRegionTriggersOnce:(BOOL)a3
{
  self->regionTriggersOnce = a3;
}

- (id)alertTitle
{
  return self->alertTitle;
}

- (void)setAlertTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->category, 0);
  objc_storeStrong((id *)&self->userInfoData, 0);
  objc_storeStrong((id *)&self->soundName, 0);
  objc_storeStrong((id *)&self->alertTitle, 0);
  objc_storeStrong((id *)&self->alertLaunchImage, 0);
  objc_storeStrong((id *)&self->alertAction, 0);
  objc_storeStrong((id *)&self->alertBody, 0);
  objc_storeStrong((id *)&self->region, 0);
  objc_storeStrong((id *)&self->repeatCalendar, 0);
  objc_storeStrong((id *)&self->timeZone, 0);
  objc_storeStrong((id *)&self->fireDate, 0);
}

@end
