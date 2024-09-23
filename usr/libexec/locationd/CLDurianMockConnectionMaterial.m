@implementation CLDurianMockConnectionMaterial

- (CLDurianMockConnectionMaterial)initWithAddress:(id)a3 connectionToken:(id)a4
{
  CLDurianMockConnectionMaterial *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLDurianMockConnectionMaterial;
  v6 = -[CLDurianMockConnectionMaterial init](&v8, "init");
  if (v6)
  {
    v6->_address = (NSData *)objc_msgSend(a3, "copy");
    v6->_connectionToken = (NSData *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianMockConnectionMaterial;
  -[CLDurianMockConnectionMaterial dealloc](&v3, "dealloc");
}

- (NSData)address
{
  return self->_address;
}

- (NSData)connectionToken
{
  return self->_connectionToken;
}

- (id)commandKey
{
  return +[NSData data](NSData, "data");
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:duration:", +[NSDate date](NSDate, "date"), 1.0);
}

- (int64_t)type
{
  return 2;
}

- (NSNumber)primaryIndex
{
  return 0;
}

- (NSNumber)secondaryIndex
{
  return 0;
}

@end
