@implementation MTAStateStoreEvent

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (MTAStateStoreEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MTAStateStoreEvent *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  float v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSIndexPath *indexPath;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MTAStateStoreEvent;
  v6 = -[MTAStateStoreEvent init](&v22, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v5), CFSTR("kMTAStateStoreEventType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v6->_eventType = (int64_t)objc_msgSend(v8, "integerValue");
    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v9), CFSTR("kMTAStateStoreEventValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v11, "floatValue");
    v6->_value = v12;
    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v13), CFSTR("kMTAStateStoreEventIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v15;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSIndexPath, v17), CFSTR("kMTAStateStoreEventIndexPath"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    indexPath = v6->_indexPath;
    v6->_indexPath = (NSIndexPath *)v19;

  }
  return v6;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t eventType;
  void *v5;
  void *v6;
  id v7;

  eventType = self->_eventType;
  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", eventType));
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("kMTAStateStoreEventType"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_value));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("kMTAStateStoreEventValue"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_identifier, CFSTR("kMTAStateStoreEventIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_indexPath, CFSTR("kMTAStateStoreEventIndexPath"));

}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("State store event: %li, identifier:%@, value: %f, indexPath: %@"), self->_eventType, self->_identifier, *(_QWORD *)&self->_value, self->_indexPath);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventWithType:(int64_t)a3 value:(double)a4
{
  return _objc_msgSend(a1, "eventWithType:identifier:value:indexPath:", a3, 0, 0, a4);
}

+ (id)eventWithType:(int64_t)a3 identifier:(id)a4 value:(double)a5 indexPath:(id)a6
{
  id v9;
  id v10;
  MTAStateStoreEvent *v11;

  v9 = a6;
  v10 = a4;
  v11 = objc_opt_new(MTAStateStoreEvent);
  -[MTAStateStoreEvent setEventType:](v11, "setEventType:", a3);
  -[MTAStateStoreEvent setValue:](v11, "setValue:", a5);
  -[MTAStateStoreEvent setIdentifier:](v11, "setIdentifier:", v10);

  -[MTAStateStoreEvent setIndexPath:](v11, "setIndexPath:", v9);
  return v11;
}

+ (id)eventWithType:(int64_t)a3
{
  return _objc_msgSend(a1, "eventWithType:value:", a3, 0.0);
}

+ (id)eventWithType:(int64_t)a3 identifier:(id)a4
{
  return _objc_msgSend(a1, "eventWithType:identifier:value:indexPath:", a3, a4, 0, 0.0);
}

+ (id)eventWithType:(int64_t)a3 indexPath:(id)a4
{
  return _objc_msgSend(a1, "eventWithType:identifier:value:indexPath:", a3, 0, a4, 0.0);
}

+ (id)blankEvent
{
  return _objc_msgSend(a1, "eventWithType:value:", 0, 0.0);
}

- (double)value
{
  return self->_value;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

@end
