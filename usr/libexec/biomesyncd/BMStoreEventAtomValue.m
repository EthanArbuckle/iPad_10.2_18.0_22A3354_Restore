@implementation BMStoreEventAtomValue

- (BMStoreEventAtomValue)initWithEventData:(id)a3 dataVersion:(unsigned int)a4 dataTimestamp:(double)a5
{
  id v9;
  BMStoreEventAtomValue *v10;
  BMStoreEventAtomValue *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMStoreEventAtomValue;
  v10 = -[BMStoreEventAtomValue init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_eventData, a3);
    v11->_dataVersion = a4;
    v11->_dataTimestamp = a5;
  }

  return v11;
}

- (BMStoreEventAtomValue)initWithProto:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BMStoreEventAtomValue *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_class(BMPBStoreEventAtomValue, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      if (sub_100035A38((uint64_t)v7) && (sub_100035A98((uint64_t)v7) & 1) != 0)
      {
        v8 = sub_100036380((uint64_t)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v10 = sub_100036350((uint64_t)v7);
        self = -[BMStoreEventAtomValue initWithEventData:dataVersion:dataTimestamp:](self, "initWithEventData:dataVersion:dataTimestamp:", v9, v10, sub_100036364((uint64_t)v7));

        v11 = self;
LABEL_13:

        goto LABEL_14;
      }
      v15 = __biome_log_for_category(4);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        sub_100043120((uint64_t)self, (uint64_t)v16, v17, v18);

    }
    else
    {
      v12 = __biome_log_for_category(4);
      v7 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        sub_100043198((uint64_t)self, (uint64_t)v7, v13, v14);
    }
    v11 = 0;
    goto LABEL_13;
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (id)proto
{
  BMPBStoreEventAtomValue *v3;
  void *v4;
  double v5;

  v3 = objc_opt_new(BMPBStoreEventAtomValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEventAtomValue eventData](self, "eventData"));
  sub_100036024((uint64_t)v3, v4);

  sub_1000359E4((uint64_t)v3, -[BMStoreEventAtomValue dataVersion](self, "dataVersion"));
  -[BMStoreEventAtomValue dataTimestamp](self, "dataTimestamp");
  sub_100035A50((uint64_t)v3, v5);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *eventData;
  id v5;
  void *v6;
  id v7;

  eventData = self->_eventData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eventData, CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dataVersion));
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("dataVersion"));

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_dataTimestamp));
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("dataTimestamp"));

}

- (BMStoreEventAtomValue)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  BMStoreEventAtomValue *v6;
  id v7;
  uint64_t v8;
  NSData *eventData;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  double v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BMStoreEventAtomValue;
  v6 = -[BMStoreEventAtomValue init](&v18, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), CFSTR("data"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    eventData = v6->_eventData;
    v6->_eventData = (NSData *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v10), CFSTR("dataVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v6->_dataVersion = objc_msgSend(v12, "unsignedIntValue");

    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v13), CFSTR("dataTimestamp"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v15, "doubleValue");
    v6->_dataTimestamp = v16;

  }
  return v6;
}

- (NSData)eventData
{
  return self->_eventData;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)dataTimestamp
{
  return self->_dataTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
}

@end
