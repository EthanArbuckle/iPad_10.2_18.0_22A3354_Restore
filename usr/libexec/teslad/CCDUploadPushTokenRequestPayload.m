@implementation CCDUploadPushTokenRequestPayload

- (id)dictionary
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CCDUploadPushTokenRequestPayload;
  v3 = -[CCDRequestPayload dictionary](&v17, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("device")));
  v7 = objc_msgSend(v6, "mutableCopy");
  v9 = v7;
  if (v7)
    v10 = v7;
  else
    v10 = (id)objc_opt_new(NSMutableDictionary, v8);
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CCDUploadPushTokenRequestPayload pushToken](self, "pushToken"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("app_push_token"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CCDUploadPushTokenRequestPayload pushTopic](self, "pushTopic"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("push_topic"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("device"));
  v15 = objc_msgSend(v5, "copy");

  return v15;
}

- (id)action
{
  return CFSTR("DeviceRegistration");
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
  objc_storeStrong((id *)&self->_pushTopic, a3);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
}

@end
