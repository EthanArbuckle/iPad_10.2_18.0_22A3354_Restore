@implementation SKUIGiftAmount

- (SKUIGiftAmount)initWithAmountDictionary:(id)a3
{
  id v4;
  SKUIGiftAmount *v5;
  void *v6;
  uint64_t v7;
  NSString *displayLabel;
  void *v9;
  uint64_t v10;
  NSString *partNumber;
  void *v12;
  uint64_t v13;
  NSNumber *value;
  objc_super v16;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftAmount initWithAmountDictionary:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIGiftAmount;
  v5 = -[SKUIGiftAmount init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      displayLabel = v5->_displayLabel;
      v5->_displayLabel = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("partNumber"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      partNumber = v5->_partNumber;
      v5->_partNumber = (NSString *)v10;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", objc_msgSend(v12, "integerValue"));
      value = v5->_value;
      v5->_value = (NSNumber *)v13;

    }
  }

  return v5;
}

- (id)HTTPBodyDictionary
{
  void *v3;
  NSString *partNumber;
  NSNumber *value;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", CFSTR("charity"), CFSTR("giftType"));
  partNumber = self->_partNumber;
  if (partNumber)
    objc_msgSend(v3, "setObject:forKey:", partNumber, CFSTR("partNumber"));
  value = self->_value;
  if (value)
  {
    -[NSNumber stringValue](value, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("amount"));

  }
  objc_msgSend(MEMORY[0x1E0DDC158], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("guid"));

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_displayLabel, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_partNumber, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSNumber copyWithZone:](self->_value, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (void)setDisplayLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)partNumber
{
  return self->_partNumber;
}

- (void)setPartNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_partNumber, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
}

- (void)initWithAmountDictionary:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftAmount initWithAmountDictionary:]";
}

@end
