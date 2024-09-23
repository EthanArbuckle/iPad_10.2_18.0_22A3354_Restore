@implementation DMDManageAppPromptPolicy

+ (id)timestampsKey
{
  return CFSTR("PromptTimestamps");
}

+ (int64_t)promptsAllowedBeforeAutomaticDenial
{
  void *v2;
  void *v3;
  int64_t v4;

  if (!+[DMDFeatureFlags isAppleInternal](DMDFeatureFlags, "isAppleInternal"))
    return 3;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("DMDMaxManagementDenialsBeforeAutomaticRefusal")));

  if (v3)
    v4 = (int64_t)objc_msgSend(v2, "integerForKey:", CFSTR("DMDMaxManagementDenialsBeforeAutomaticRefusal"));
  else
    v4 = 3;

  return v4;
}

+ (double)promptWindowInterval
{
  void *v2;
  void *v3;
  double v4;

  if (!+[DMDFeatureFlags isAppleInternal](DMDFeatureFlags, "isAppleInternal"))
    return 86400.0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("DMDManagementPromptWindowMinutes")));

  if (v3)
    v4 = (double)(uint64_t)objc_msgSend(v2, "integerForKey:", CFSTR("DMDManagementPromptWindowMinutes")) * 60.0;
  else
    v4 = 86400.0;

  return v4;
}

- (DMDManageAppPromptPolicy)init
{
  DMDManageAppPromptPolicy *v2;
  DMDManageAppPromptPolicy *v3;
  NSArray *promptTimestamps;
  double v5;
  NSDate *overrideDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMDManageAppPromptPolicy;
  v2 = -[DMDManageAppPromptPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    promptTimestamps = v2->_promptTimestamps;
    v2->_promptTimestamps = (NSArray *)&__NSArray0__struct;

    v3->_promptsAllowed = +[DMDManageAppPromptPolicy promptsAllowedBeforeAutomaticDenial](DMDManageAppPromptPolicy, "promptsAllowedBeforeAutomaticDenial");
    +[DMDManageAppPromptPolicy promptWindowInterval](DMDManageAppPromptPolicy, "promptWindowInterval");
    v3->_promptResetTimeInterval = v5;
    overrideDate = v3->_overrideDate;
    v3->_overrideDate = 0;

  }
  return v3;
}

- (BOOL)isPromptAllowedRightNow
{
  DMDManageAppPromptPolicy *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy _now](self, "_now"));
  -[DMDManageAppPromptPolicy _removePromptTimestampsOutsideIntervalEnding:](v2, "_removePromptTimestampsOutsideIntervalEnding:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy promptTimestamps](v2, "promptTimestamps"));
  v5 = objc_msgSend(v4, "count");
  LOBYTE(v2) = v5 < (id)-[DMDManageAppPromptPolicy promptsAllowed](v2, "promptsAllowed");

  return (char)v2;
}

- (void)recordNewPrompt
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy _now](self, "_now"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy promptTimestamps](self, "promptTimestamps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", v5));
  -[DMDManageAppPromptPolicy setPromptTimestamps:](self, "setPromptTimestamps:", v4);

  -[DMDManageAppPromptPolicy _removePromptTimestampsOutsideIntervalEnding:](self, "_removePromptTimestampsOutsideIntervalEnding:", v5);
}

- (id)_now
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy overrideDate](self, "overrideDate"));
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = v4;

  return v5;
}

- (void)_removePromptTimestampsOutsideIntervalEnding:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy promptTimestamps](self, "promptTimestamps", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v4, "timeIntervalSinceDate:", v11);
        if (v12 >= 0.0)
        {
          v13 = v12;
          -[DMDManageAppPromptPolicy promptResetTimeInterval](self, "promptResetTimeInterval");
          if (v13 <= v14)
            -[NSMutableArray addObject:](v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v15 = -[NSMutableArray copy](v5, "copy");
  -[DMDManageAppPromptPolicy setPromptTimestamps:](self, "setPromptTimestamps:", v15);

}

- (void)readTimestampsFromFile
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managementPromptPolicyPath](DMDPaths, "managementPromptPolicyPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v3));

  if (!v4
    || (v5 = objc_msgSend((id)objc_opt_class(self), "timestampsKey"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(v5),
        v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6)),
        v6,
        (v7 = v8) == 0))
  {
    v7 = &__NSArray0__struct;
  }
  v9 = v7;
  -[DMDManageAppPromptPolicy setPromptTimestamps:](self, "setPromptTimestamps:", v7);

}

- (void)writeTimestampsToFile
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy _timestampDataForWritingToFile](self, "_timestampDataForWritingToFile"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managementPromptPolicyPath](DMDPaths, "managementPromptPolicyPath"));
    v16 = 0;
    v4 = objc_msgSend(v2, "writeToFile:options:error:", v3, 1, &v16);
    v5 = v16;

    if ((v4 & 1) == 0)
    {
      v8 = DMFAppLog(v6, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000773BC((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);

    }
  }

}

- (id)_timestampDataForWritingToFile
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy _timestampDictionaryForWritingToFile](self, "_timestampDictionaryForWritingToFile"));
  v16 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v2, 200, 0, &v16));
  v4 = v16;
  v6 = v4;
  if (!v3)
  {
    v7 = DMFAppLog(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100077424((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  }
  return v3;
}

- (id)_timestampDictionaryForWritingToFile
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy promptTimestamps](self, "promptTimestamps"));
  v5 = objc_msgSend((id)objc_opt_class(self), "timestampsKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, v6);

  v7 = -[NSMutableDictionary copy](v3, "copy");
  return v7;
}

- (NSArray)promptTimestamps
{
  return self->_promptTimestamps;
}

- (void)setPromptTimestamps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)promptsAllowed
{
  return self->_promptsAllowed;
}

- (double)promptResetTimeInterval
{
  return self->_promptResetTimeInterval;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_promptTimestamps, 0);
}

@end
