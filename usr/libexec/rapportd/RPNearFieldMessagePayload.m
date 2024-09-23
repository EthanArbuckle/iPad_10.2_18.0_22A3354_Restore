@implementation RPNearFieldMessagePayload

- (RPNearFieldMessagePayload)initWithType:(int64_t)a3
{
  RPNearFieldMessagePayload *v4;
  RPNearFieldMessagePayload *v5;
  RPNearFieldMessagePayload *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RPNearFieldMessagePayload;
  v4 = -[RPNearFieldMessagePayload init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = v4;
  }

  return v5;
}

- (RPNearFieldMessagePayload)initWithDictionary:(id)a3
{
  uint64_t NSNumber;
  void *v5;
  void *v6;
  id v7;
  RPNearFieldMessagePayload *v8;

  NSNumber = NSDictionaryGetNSNumber(a3, &off_10011AA88, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "integerValue");
  else
    v7 = 0;
  v8 = -[RPNearFieldMessagePayload initWithType:](self, "initWithType:", v7);

  return v8;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  _UNKNOWN **v5;
  void *v6;

  v5 = &off_10011AA88;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_type));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

@end
