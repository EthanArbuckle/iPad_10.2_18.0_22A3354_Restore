@implementation STUUserNotificationResultObject

- (STUUserNotificationResultObject)initWithResponseFlags:(unint64_t)a3 responseDictionary:(id)a4
{
  id v6;
  STUUserNotificationResultObject *v7;
  STUUserNotificationResultObject *v8;
  NSDictionary *v9;
  NSDictionary *responseDictionary;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STUUserNotificationResultObject;
  v7 = -[STUUserNotificationResultObject init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_responseFlags = a3;
    v9 = (NSDictionary *)objc_msgSend(v6, "copy");
    responseDictionary = v8->_responseDictionary;
    v8->_responseDictionary = v9;

  }
  return v8;
}

- (unint64_t)selectedResponse
{
  return -[STUUserNotificationResultObject responseFlags](self, "responseFlags") & 3;
}

- (unint64_t)responseFlags
{
  return self->_responseFlags;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
