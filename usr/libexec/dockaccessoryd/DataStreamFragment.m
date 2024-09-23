@implementation DataStreamFragment

- (DataStreamFragment)initWithData:(id)a3 sequenceNumber:(id)a4 type:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  DataStreamFragment *v13;
  DataStreamFragment *v14;
  NSNumber *v15;
  NSNumber *sequenceNumber;
  NSString *v17;
  NSString *type;
  DataStreamFragment *v20;
  SEL v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure(CFSTR("data"));
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure(CFSTR("sequenceNumber"));
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v20 = (DataStreamFragment *)_HMFPreconditionFailure(CFSTR("type"));
    return (DataStreamFragment *)-[DataStreamFragment attributeDescriptions](v20, v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)DataStreamFragment;
  v13 = -[DataStreamFragment init](&v22, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_data, a3);
    v15 = (NSNumber *)objc_msgSend(v10, "copy");
    sequenceNumber = v14->_sequenceNumber;
    v14->_sequenceNumber = v15;

    v17 = (NSString *)objc_msgSend(v12, "copy");
    type = v14->_type;
    v14->_type = v17;

  }
  return v14;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[3];

  v3 = objc_alloc((Class)HMFAttributeDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragment data](self, "data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length")));
  v6 = objc_msgSend(v3, "initWithName:value:", CFSTR("Data Length"), v5);
  v7 = objc_alloc((Class)HMFAttributeDescription);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragment sequenceNumber](self, "sequenceNumber", v6));
  v9 = objc_msgSend(v7, "initWithName:value:", CFSTR("Sequence Number"), v8);
  v15[1] = v9;
  v10 = objc_alloc((Class)HMFAttributeDescription);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragment type](self, "type"));
  v12 = objc_msgSend(v10, "initWithName:value:", CFSTR("Type"), v11);
  v15[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));

  return v13;
}

- (BOOL)isInitial
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragment sequenceNumber](self, "sequenceNumber"));
  v3 = objc_msgSend(v2, "unsignedLongLongValue") == (id)1;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  v4 = a3;
  v6 = objc_opt_class(DataStreamFragment, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragment data](self, "data"));
    if (objc_msgSend(v10, "isEqualToData:", v11))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sequenceNumber"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragment sequenceNumber](self, "sequenceNumber"));
      if (objc_msgSend(v12, "isEqualToNumber:", v13))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "type"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragment type](self, "type"));
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragment data](self, "data"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragment sequenceNumber](self, "sequenceNumber"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragment type](self, "type"));
  v8 = v6 ^ (unint64_t)objc_msgSend(v7, "hash");

  return v8;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
