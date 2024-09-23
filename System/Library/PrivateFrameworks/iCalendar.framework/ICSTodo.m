@implementation ICSTodo

- (void)fixComponent
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)ICSTodo;
  -[ICSComponent fixComponent](&v29, sel_fixComponent);
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("COMPLETED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICSTodo completed](self, "completed");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("COMPLETED"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("PERCENT-COMPLETE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("PERCENT-COMPLETE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = objc_opt_isKindOfClass();

    if ((v10 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("PERCENT-COMPLETE"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DUE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ICSTodo due](self, "due");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("DUE"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("PRIORITY"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("PRIORITY"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("PRIORITY"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DURATION"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DURATION"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("DURATION"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-SORT-ORDER"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-SORT-ORDER"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "value");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v28 = objc_opt_isKindOfClass();

    if ((v28 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-SORT-ORDER"));
  }
}

+ (id)name
{
  return CFSTR("VTODO");
}

- (BOOL)validate:(id *)a3
{
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v9;
  void *v10;
  objc_super v11;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("STATUS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[ICSComponent status](self, "status");
    v7 = v6;
    if (v6 > 8 || ((1 << v6) & 0x139) == 0)
    {
      if (a3)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Invalid STATUS for VTODO."), *MEMORY[0x1E0CB2D50]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iCalendar"), 1000, v10);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      if ((v7 | 8) != 8)
        return 0;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ICSTodo;
  return -[ICSComponent validate:](&v11, sel_validate_, a3);
}

- (ICSDate)completed
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("COMPLETED"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDate *)v3;
}

- (void)setCompleted:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("COMPLETED"));
}

- (int64_t)percentComplete
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("PERCENT-COMPLETE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (void)setPercentComplete:(int64_t)a3
{
  id v4;

  if ((unint64_t)(a3 - 1) > 0x63)
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("PERCENT-COMPLETE"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5008, CFSTR("PERCENT-COMPLETE"));

  }
}

- (ICSDate)due
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DUE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDate *)v3;
}

- (void)setDue:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("DUE"));
}

- (unint64_t)x_apple_sort_order
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-SORT-ORDER"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (void)setX_apple_sort_order:(unint64_t)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5008, CFSTR("X-APPLE-SORT-ORDER"));

  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-SORT-ORDER"));
  }
}

- (void)setX_apple_activity:(id)a3
{
  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", a3, CFSTR("X-APPLE-ACTIVITY"));
}

- (NSArray)x_apple_activity
{
  return (NSArray *)-[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-ACTIVITY"));
}

- (void)setX_apple_appLinkData:(id)a3
{
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", a3, 5026, CFSTR("X-APPLE-APP-LINK-DATA"));
}

- (NSData)x_apple_appLinkData
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-APP-LINK-DATA"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (ICSDate)x_apple_alternative_due_date_for_calendar
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-ALTERNATIVE-DUE-DATE-FOR-CALENDAR"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDate *)v3;
}

- (void)setX_apple_alternative_due_date_for_calendar:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("X-APPLE-ALTERNATIVE-DUE-DATE-FOR-CALENDAR"));
}

@end
