@implementation ICPushNotificationsResponse

- (ICPushNotificationsResponse)initWithResponseDictionary:(id)a3
{
  id v4;
  ICPushNotificationsResponse *v5;
  void *v6;

  v4 = a3;
  v5 = -[ICPushNotificationsResponse init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_statusCode = objc_msgSend(v6, "integerValue");

  }
  return v5;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

@end
