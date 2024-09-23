@implementation ICSAlarm

- (void)fixAlarm
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;

  -[ICSComponent trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fixAlarmTrigger");

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TRIGGER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TRIGGER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("TRIGGER"));
  }
}

+ (id)name
{
  return CFSTR("VALARM");
}

+ (int)actionFromICSString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISPLAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMAIL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROCEDURE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")))
  {
    v4 = 0;
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

+ (id)ICSStringFromAction:(int)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_1E953B158[a3];
}

+ (id)parseableDocumentFromICS:(id)a3
{
  return (id)objc_msgSend(a1, "parseableDocumentFromICS:options:", a3, 0);
}

+ (id)parseableDocumentFromICS:(id)a3 options:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ICSDocument *v9;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r"), &stru_1E953C148);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("END:VCALENDAR\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("BEGIN:VCALENDAR\n"), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(CFSTR("BEGIN:VCALENDAR\n"), "stringByAppendingString:", CFSTR("END:VCALENDAR\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = -[ICSDocument initWithICSString:options:error:]([ICSDocument alloc], "initWithICSString:options:error:", v8, a4, 0);

  return v9;
}

+ (id)createNoneAlarm
{
  ICSAlarm *v2;
  void *v3;
  ICSTrigger *v4;

  v2 = objc_alloc_init(ICSAlarm);
  -[ICSAlarm setAction:](v2, "setAction:", 0);
  +[ICSDateValue dateFromICSString:](ICSDateValue, "dateFromICSString:", CFSTR("19760401T005545Z"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICSTrigger initWithDate:]([ICSTrigger alloc], "initWithDate:", v3);
  -[ICSComponent setTrigger:](v2, "setTrigger:", v4);

  return v2;
}

- (BOOL)isNoneAlarm
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  -[ICSComponent x_apple_structured_location](self, "x_apple_structured_location");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
LABEL_4:
    v5 = 0;
    goto LABEL_5;
  }
  -[ICSAlarm x_apple_proximity](self, "x_apple_proximity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CONNECT")) & 1) != 0)
    goto LABEL_4;
  -[ICSAlarm x_apple_proximity](self, "x_apple_proximity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("DISCONNECT"));

  if ((v8 & 1) != 0)
    return 0;
  if (!-[ICSAlarm action](self, "action"))
    return 1;
  -[ICSComponent trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDurationBased");

  if ((v10 & 1) != 0)
    return 0;
  -[ICSComponent trigger](self, "trigger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "icsString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("19760401T005545Z")))
  {
    -[ICSAlarm setAction:](self, "setAction:", 0);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

LABEL_5:
  return v5;
}

- (int)action
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("ACTION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longValue");

  return v5;
}

- (void)setAction:(int)a3
{
  id v4;

  +[ICSPredefinedValue numberWithLong:](ICSActionValue, "numberWithLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5020, CFSTR("ACTION"));

}

- (NSString)x_wr_alarmuid
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ALARMUID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_wr_alarmuid:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-WR-ALARMUID"));
}

- (ICSDateTimeUTCValue)acknowledged
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("ACKNOWLEDGED"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDateTimeUTCValue *)v4;
}

- (void)setAcknowledged:(id)a3
{
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", a3, 5016, CFSTR("ACKNOWLEDGED"));
}

- (NSString)relatedTo
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RELATED-TO"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setRelatedTo:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("RELATED-TO"));
}

- (NSString)x_apple_proximity
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-PROXIMITY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_proximity:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-PROXIMITY"));
}

- (void)setX_apple_default_alarm:(BOOL)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5012, CFSTR("X-APPLE-DEFAULT-ALARM"));

  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-DEFAULT-ALARM"));
  }
}

- (BOOL)x_apple_default_alarm
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-DEFAULT-ALARM"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setX_apple_travel_default_alarm:(BOOL)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5012, CFSTR("X-APPLE-TRAVEL-DEFAULT-ALARM"));

  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-TRAVEL-DEFAULT-ALARM"));
  }
}

- (BOOL)x_apple_travel_default_alarm
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-TRAVEL-DEFAULT-ALARM"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setX_apple_local_default_alarm:(BOOL)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5012, CFSTR("X-APPLE-LOCAL-DEFAULT-ALARM"));

  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-LOCAL-DEFAULT-ALARM"));
  }
}

- (BOOL)x_apple_local_default_alarm
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-LOCAL-DEFAULT-ALARM"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (NSData)bookmark
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-BOOKMARK"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
  else
    v5 = 0;

  return (NSData *)v5;
}

- (void)setBookmark:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", v4, CFSTR("X-APPLE-BOOKMARK"));

  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-BOOKMARK"));
  }
}

@end
