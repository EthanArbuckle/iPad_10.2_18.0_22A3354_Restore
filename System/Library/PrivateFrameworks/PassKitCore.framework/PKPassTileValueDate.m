@implementation PKPassTileValueDate

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *content;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int64_t v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPassTileValueDate;
  if (-[PKPassTileValue _setUpWithDictionary:](&v23, sel__setUpWithDictionary_, v4)
    && (objc_msgSend(v4, "PKStringForKey:", CFSTR("content")),
        v5 = (NSString *)objc_claimAutoreleasedReturnValue(),
        content = self->_content,
        self->_content = v5,
        content,
        self->_content))
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("dateStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    if (v7)
      v13 = (int)_PKEnumValueFromString(v7, 0, (uint64_t)CFSTR("PKDateStyle"), CFSTR("PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull"), v8, v9, v10, v11, 0);
    else
      v13 = 0;
    self->_dateStyle = v13;
    objc_msgSend(v4, "PKStringForKey:", CFSTR("timeStyle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v15;
    if (v15)
      v21 = (int)_PKEnumValueFromString(v15, 0, (uint64_t)CFSTR("PKDateStyle"), CFSTR("PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull"), v16, v17, v18, v19, 0);
    else
      v21 = 0;
    self->_timeStyle = v21;
    self->_ignoresTimeZone = objc_msgSend(v4, "PKBoolForKey:", CFSTR("ignoresTimeZone"));
    self->_isRelative = objc_msgSend(v4, "PKBoolForKey:", CFSTR("isRelative"));

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)createWithContent:(id)a3 dateStyle:(int64_t)a4
{
  return (id)objc_msgSend(a1, "createWithContent:dateStyle:timeStyle:", a3, a4, 0);
}

+ (id)createWithContent:(id)a3 timeStyle:(int64_t)a4
{
  return (id)objc_msgSend(a1, "createWithContent:dateStyle:timeStyle:", a3, 0, a4);
}

+ (id)createWithContent:(id)a3 dateStyle:(int64_t)a4 timeStyle:(int64_t)a5
{
  return (id)objc_msgSend(a1, "createWithContent:dateStyle:timeStyle:ignoresTimeZone:isRelative:", a3, a4, a5, 0, 0);
}

+ (id)createWithContent:(id)a3 dateStyle:(int64_t)a4 timeStyle:(int64_t)a5 ignoresTimeZone:(BOOL)a6 isRelative:(BOOL)a7
{
  id v12;
  id *v13;

  v12 = a3;
  if (v12)
  {
    v13 = +[PKPassTileValue _createForType:resolved:](PKPassTileValue, "_createForType:resolved:", 1, 1);
    objc_storeStrong(v13 + 4, a3);
    v13[5] = (id)a4;
    v13[6] = (id)a5;
    *((_BYTE *)v13 + 24) = a6;
    *((_BYTE *)v13 + 25) = a7;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4
{
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassTileValueDate;
  v5 = -[PKPassTileValue createResolvedValueWithBundle:privateBundle:](&v7, sel_createResolvedValueWithBundle_privateBundle_, a3, a4);
  objc_storeStrong(v5 + 4, self->_content);
  v5[5] = (id)self->_dateStyle;
  v5[6] = (id)self->_timeStyle;
  *((_BYTE *)v5 + 25) = self->_isRelative;
  *((_BYTE *)v5 + 24) = self->_ignoresTimeZone;
  return v5;
}

- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char ignoresTimeZone;
  void *v10;
  void *v11;

  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateStyle:", self->_dateStyle);
  objc_msgSend(v5, "setTimeStyle:", self->_timeStyle);
  objc_msgSend(v5, "setDoesRelativeDateFormatting:", self->_isRelative);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocale:", v6);

  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendar:", v7);

  if (self->_ignoresTimeZone)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v8);

    ignoresTimeZone = self->_ignoresTimeZone;
  }
  else
  {
    ignoresTimeZone = 0;
  }
  _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(self->_content, ignoresTimeZone, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileValueDate)initWithCoder:(id)a3
{
  id v4;
  PKPassTileValueDate *v5;
  uint64_t v6;
  NSString *content;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPassTileValueDate;
  v5 = -[PKPassTileValue initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
    v6 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dateStyle = (int)_PKEnumValueFromString(v8, 0, (uint64_t)CFSTR("PKDateStyle"), CFSTR("PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull"), v9, v10, v11, v12, 0);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeStyle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timeStyle = (int)_PKEnumValueFromString(v13, 0, (uint64_t)CFSTR("PKDateStyle"), CFSTR("PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull"), v14, v15, v16, v17, 0);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ignoresTimeZone"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ignoresTimeZone = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isRelative"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isRelative = objc_msgSend(v19, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKPassTileValueDate;
  v4 = a3;
  -[PKPassTileValue encodeWithCoder:](&v19, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_content, CFSTR("content"));
  _PKEnumValueToString(self->_dateStyle, CFSTR("PKDateStyle"), CFSTR("PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull"), v5, v6, v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("dateStyle"));

  _PKEnumValueToString(self->_timeStyle, CFSTR("PKDateStyle"), CFSTR("PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull"), v11, v12, v13, v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("timeStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ignoresTimeZone);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("ignoresTimeZone"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRelative);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("isRelative"));

}

- (unint64_t)hash
{
  NSUInteger v3;
  int64_t dateStyle;
  objc_super v6;
  id v7;
  NSUInteger v8;
  int64_t v9;
  int64_t timeStyle;
  BOOL ignoresTimeZone;
  BOOL isRelative;

  v6.receiver = self;
  v6.super_class = (Class)PKPassTileValueDate;
  v7 = -[PKPassTileValue hash](&v6, sel_hash);
  v3 = -[NSString hash](self->_content, "hash");
  dateStyle = self->_dateStyle;
  v8 = v3;
  v9 = dateStyle;
  timeStyle = self->_timeStyle;
  ignoresTimeZone = self->_ignoresTimeZone;
  isRelative = self->_isRelative;
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  id v4;
  id *v5;
  NSString *content;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  BOOL v11;
  _BOOL4 v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassTileValueDate;
  if (-[PKPassTileValue _isEqual:](&v14, sel__isEqual_, v4))
  {
    v5 = (id *)v4;
    content = self->_content;
    v7 = (NSString *)v5[4];
    v8 = content;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
      {

        goto LABEL_16;
      }
      v12 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v12)
        goto LABEL_16;
    }
    if (v5[5] == (id)self->_dateStyle
      && v5[6] == (id)self->_timeStyle
      && *((unsigned __int8 *)v5 + 24) == self->_ignoresTimeZone)
    {
      v11 = *((unsigned __int8 *)v5 + 25) == self->_isRelative;
LABEL_17:

      goto LABEL_18;
    }
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)dateStyle
{
  return self->_dateStyle;
}

- (void)setDateStyle:(int64_t)a3
{
  self->_dateStyle = a3;
}

- (int64_t)timeStyle
{
  return self->_timeStyle;
}

- (void)setTimeStyle:(int64_t)a3
{
  self->_timeStyle = a3;
}

- (BOOL)ignoresTimeZone
{
  return self->_ignoresTimeZone;
}

- (void)setIgnoresTimeZone:(BOOL)a3
{
  self->_ignoresTimeZone = a3;
}

- (BOOL)isRelative
{
  return self->_isRelative;
}

- (void)setIsRelative:(BOOL)a3
{
  self->_isRelative = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
