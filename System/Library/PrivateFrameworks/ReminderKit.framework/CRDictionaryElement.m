@implementation CRDictionaryElement

+ (id)temporaryElementWithValue:(id)a3
{
  id v3;
  CRDictionaryElement *v4;

  v3 = a3;
  v4 = -[CRDictionaryElement initWithValue:timestamp:]([CRDictionaryElement alloc], "initWithValue:timestamp:", v3, 0);

  return v4;
}

- (CRDictionaryElement)initWithValue:(id)a3
{
  id v5;
  CRDictionaryElement *v6;
  CRDictionaryElement *v7;
  CRVectorTimestamp *v8;
  CRVectorTimestamp *timestamp;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRDictionaryElement;
  v6 = -[CRDictionaryElement init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_value, a3);
    v8 = objc_alloc_init(CRVectorTimestamp);
    timestamp = v7->_timestamp;
    v7->_timestamp = v8;

  }
  return v7;
}

- (CRDictionaryElement)initWithValue:(id)a3 timestamp:(id)a4
{
  id v7;
  id v8;
  CRDictionaryElement *v9;
  CRDictionaryElement *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRDictionaryElement;
  v9 = -[CRDictionaryElement init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_value, a3);
    objc_storeStrong((id *)&v10->_timestamp, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CRDictionaryElement value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRDictionaryElement value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)mergeWith:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CRDictionaryElement timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeWith:", v5);

  -[CRDictionaryElement value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mergeWith:", v7);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDictionaryElement timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDictionaryElement value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@ %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CRDataType)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (CRVectorTimestamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
