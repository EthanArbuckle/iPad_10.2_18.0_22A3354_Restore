@implementation STSEngagementConfiguration

+ (id)configurationWithDeviceEngagementType:(unint64_t)a3 dataRetrievalType:(unint64_t)a4 engagementData:(id)a5
{
  id v7;
  STSEngagementConfiguration *v8;

  v7 = a5;
  v8 = -[STSEngagementConfiguration initWithDeviceEngagementType:dataRetrievalType:engagementData:]([STSEngagementConfiguration alloc], "initWithDeviceEngagementType:dataRetrievalType:engagementData:", a3, a4, v7);

  return v8;
}

- (STSEngagementConfiguration)initWithDeviceEngagementType:(unint64_t)a3 dataRetrievalType:(unint64_t)a4 engagementData:(id)a5
{
  id v9;
  void *v10;
  STSEngagementConfiguration *v11;
  STSEngagementConfiguration *v12;
  STSEngagementConfiguration *v13;
  objc_super v15;

  v9 = a5;
  v10 = v9;
  if (a3 != 1 || v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)STSEngagementConfiguration;
    v12 = -[STSEngagementConfiguration init](&v15, sel_init);
    v13 = v12;
    if (v12)
    {
      v12->_deviceEngagementType = a3;
      v12->_dataRetrievalType = a4;
      objc_storeStrong((id *)&v12->_engagementData, a5);
    }
    self = v13;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)deviceEngagementType
{
  return self->_deviceEngagementType;
}

- (unint64_t)dataRetrievalType
{
  return self->_dataRetrievalType;
}

- (NSData)engagementData
{
  return self->_engagementData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementData, 0);
}

@end
