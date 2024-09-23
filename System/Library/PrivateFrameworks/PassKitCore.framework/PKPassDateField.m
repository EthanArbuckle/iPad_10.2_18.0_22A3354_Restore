@implementation PKPassDateField

- (id)asDictionary
{
  void *v2;
  void *v3;

  -[PKPassDateField asMutableDictionary](self, "asMutableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)asMutableDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t dateStyle;
  void *v10;
  int64_t timeStyle;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKPassDateField;
  -[PKPassField asMutableDictionary](&v16, sel_asMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dateStyle = self->_dateStyle;
  if (dateStyle)
  {
    _PKEnumValueToString(dateStyle, CFSTR("PKDateStyle"), CFSTR("PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull"), v3, v4, v5, v6, v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("dateStyle"));

  }
  timeStyle = self->_timeStyle;
  if (timeStyle)
  {
    _PKEnumValueToString(timeStyle, CFSTR("PKDateStyle"), CFSTR("PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull"), v3, v4, v5, v6, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("timeStyle"));

  }
  if (self->_isRelative)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("isRelative"));

  }
  if (self->_ignoresTimeZone)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("ignoresTimeZone"));

  }
  return v8;
}

- (PKPassDateField)initWithCoder:(id)a3
{
  id v4;
  PKPassDateField *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassDateField;
  v5 = -[PKPassField initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassDateField setDateStyle:](v5, "setDateStyle:", objc_msgSend(v6, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassDateField setTimeStyle:](v5, "setTimeStyle:", objc_msgSend(v7, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isRelative"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassDateField setIsRelative:](v5, "setIsRelative:", objc_msgSend(v8, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ignoresTimeZone"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassDateField setIgnoresTimeZone:](v5, "setIgnoresTimeZone:", objc_msgSend(v9, "BOOLValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassDateField;
  v4 = a3;
  -[PKPassField encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_dateStyle, v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dateStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_timeStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("timeStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRelative);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("isRelative"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ignoresTimeZone);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ignoresTimeZone"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassDateField;
  v4 = -[PKPassField copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setDateStyle:", self->_dateStyle);
  objc_msgSend(v4, "setTimeStyle:", self->_timeStyle);
  objc_msgSend(v4, "setIsRelative:", self->_isRelative);
  objc_msgSend(v4, "setIgnoresTimeZone:", self->_ignoresTimeZone);
  return v4;
}

- (id)value
{
  NSString *value;
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  value = self->super._value;
  if (!value)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v4, "setDateStyle:", self->_dateStyle);
    objc_msgSend(v4, "setTimeStyle:", self->_timeStyle);
    objc_msgSend(v4, "setDoesRelativeDateFormatting:", self->_isRelative);
    -[PKPassField unformattedValue](self, "unformattedValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_ignoresTimeZone)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTimeZone:", v6);

    }
    objc_msgSend(v4, "stringFromDate:", v5);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->super._value;
    self->super._value = v7;

    value = self->super._value;
  }
  return value;
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

- (BOOL)isRelative
{
  return self->_isRelative;
}

- (void)setIsRelative:(BOOL)a3
{
  self->_isRelative = a3;
}

- (BOOL)ignoresTimeZone
{
  return self->_ignoresTimeZone;
}

- (void)setIgnoresTimeZone:(BOOL)a3
{
  self->_ignoresTimeZone = a3;
}

@end
