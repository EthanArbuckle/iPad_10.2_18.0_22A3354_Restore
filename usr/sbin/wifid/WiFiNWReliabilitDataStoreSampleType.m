@implementation WiFiNWReliabilitDataStoreSampleType

- (id)init:(int)a3 withTimestamp:(__CFDate *)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WiFiNWReliabilitDataStoreSampleType;
  result = -[WiFiNWReliabilitDataStoreSampleType init](&v7, "init");
  *((_DWORD *)result + 2) = a3;
  *((_QWORD *)result + 2) = a4;
  return result;
}

- (int)data
{
  return self->_data;
}

- (__CFDate)timestamp
{
  return self->_timestamp;
}

@end
