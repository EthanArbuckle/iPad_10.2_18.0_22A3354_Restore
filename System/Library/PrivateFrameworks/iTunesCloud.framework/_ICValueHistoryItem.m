@implementation _ICValueHistoryItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithUnsignedLongLong:", self->_timestamp);
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (id)value
{
  return self->_value;
}

- (_ICValueHistoryItem)initWithValue:(id)a3 timestamp:(unint64_t)a4
{
  id v7;
  _ICValueHistoryItem *v8;
  _ICValueHistoryItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_ICValueHistoryItem;
  v8 = -[_ICValueHistoryItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a4;
    objc_storeStrong(&v8->_value, a3);
  }

  return v9;
}

- (_ICValueHistoryItem)initWithCoder:(id)a3
{
  id v4;
  _ICValueHistoryItem *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id value;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_ICValueHistoryItem;
  v5 = -[_ICValueHistoryItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timestamp = objc_msgSend(v6, "unsignedLongLongValue");
    if (ICSecureCodingGetPropertyListClasses_sPropertyListTypesOnce != -1)
      dispatch_once(&ICSecureCodingGetPropertyListClasses_sPropertyListTypesOnce, &__block_literal_global_8259);
    v7 = (id)ICSecureCodingGetPropertyListClasses_sPropertyListTypes;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (id)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  unint64_t timestamp;

  timestamp = self->_timestamp;
  return objc_msgSend(self->_value, "hash") ^ timestamp;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id value;
  id v7;
  char v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class() && self->_timestamp == v4[1])
  {
    value = self->_value;
    v7 = (id)v4[2];
    if (value == v7)
    {
      v8 = 1;
    }
    else
    {
      v8 = 0;
      if (value && v7)
        v8 = objc_msgSend(value, "isEqual:");
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
