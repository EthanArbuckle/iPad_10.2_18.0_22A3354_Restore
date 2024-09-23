@implementation CNVCardReadingOptions

- (CNVCardReadingOptions)init
{
  CNVCardReadingOptions *v2;
  CNVCardReadingOptions *v3;
  CNVCardReadingOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNVCardReadingOptions;
  v2 = -[CNVCardReadingOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_contactLimit = -1;
    v2->_maximumValueLength = -1;
    v2->_useConcurrentParsing = 1;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNVCardReadingOptions contactLimit](self, "contactLimit") == -1)
  {
    v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contactLimit"), CFSTR("unlimited"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CNVCardReadingOptions contactLimit](self, "contactLimit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contactLimit"), v4);

  }
  -[CNVCardReadingOptions propertiesToFetch](self, "propertiesToFetch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("propertiesToFetch"), v7);

  if (-[CNVCardReadingOptions maximumValueLength](self, "maximumValueLength") == -1)
  {
    v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("maximumValueLength"), CFSTR("unlimited"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CNVCardReadingOptions maximumValueLength](self, "maximumValueLength"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("maximumValueLength"), v9);

  }
  v12 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("useConcurrentParsing"), -[CNVCardReadingOptions useConcurrentParsing](self, "useConcurrentParsing"));
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)contactLimit
{
  return self->_contactLimit;
}

- (void)setContactLimit:(unint64_t)a3
{
  self->_contactLimit = a3;
}

- (NSArray)propertiesToFetch
{
  return self->_propertiesToFetch;
}

- (void)setPropertiesToFetch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)maximumValueLength
{
  return self->_maximumValueLength;
}

- (void)setMaximumValueLength:(unint64_t)a3
{
  self->_maximumValueLength = a3;
}

- (BOOL)useConcurrentParsing
{
  return self->_useConcurrentParsing;
}

- (void)setUseConcurrentParsing:(BOOL)a3
{
  self->_useConcurrentParsing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesToFetch, 0);
}

@end
