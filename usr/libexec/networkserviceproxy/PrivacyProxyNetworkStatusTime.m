@implementation PrivacyProxyNetworkStatusTime

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  if (self)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 0);
    sub_1000418A4(v3, self->_networkStatus, CFSTR("Network Status"), 0, 14);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", self->_networkStatusStartTime, 1, 2));
    sub_1000418A4(v3, v4, CFSTR("Network Status Start Time"), 0, 14);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", self->_networkStatusEndTime, 1, 2));
    sub_1000418A4(v3, v5, CFSTR("Network Status End Time"), 0, 14);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PrivacyProxyNetworkStatusTime *v4;
  PrivacyProxyNetworkStatusTime *v5;
  NSDate *networkStatusEndTime;

  v4 = -[PrivacyProxyNetworkStatusTime init](+[PrivacyProxyNetworkStatusTime allocWithZone:](PrivacyProxyNetworkStatusTime, "allocWithZone:", a3), "init");
  v5 = v4;
  if (self)
  {
    sub_100010990((uint64_t)v4, self->_networkStatus);
    sub_10003E048((uint64_t)v5, self->_networkStatusStartTime);
    networkStatusEndTime = self->_networkStatusEndTime;
  }
  else
  {
    sub_100010990((uint64_t)v4, 0);
    sub_10003E048((uint64_t)v5, 0);
    networkStatusEndTime = 0;
  }
  sub_10000D344((uint64_t)v5, networkStatusEndTime);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PrivacyProxyNetworkStatusTime)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  PrivacyProxyNetworkStatusTime *v7;
  id v8;
  uint64_t v9;
  PrivacyProxyNetworkStatus *networkStatus;
  id v11;
  uint64_t v12;
  NSDate *networkStatusStartTime;
  id v14;
  uint64_t v15;
  NSDate *networkStatusEndTime;
  PrivacyProxyNetworkStatusTime *v17;
  uint64_t v19;
  NSObject *v20;
  uint8_t v21[16];
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PrivacyProxyNetworkStatusTime;
  v7 = -[PrivacyProxyNetworkStatusTime init](&v22, "init");
  if (v7)
  {
    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(PrivacyProxyNetworkStatus), CFSTR("PrivacyProxyNetworkStatusTimeNetworkStatus"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    networkStatus = v7->_networkStatus;
    v7->_networkStatus = (PrivacyProxyNetworkStatus *)v9;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("PrivacyProxyNetworkStatusTimeNetworkStartTime"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    networkStatusStartTime = v7->_networkStatusStartTime;
    v7->_networkStatusStartTime = (NSDate *)v12;

    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("PrivacyProxyNetworkStatusTimeNetworkEndTime"));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    networkStatusEndTime = v7->_networkStatusEndTime;
    v7->_networkStatusEndTime = (NSDate *)v15;

    v17 = v7;
  }
  else
  {
    v19 = nplog_obj(0, v5, v6);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "[super init] failed", v21, 2u);
    }

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *networkStatusEndTime;
  id v5;

  v5 = a3;
  if (self)
  {
    objc_msgSend(v5, "encodeObject:forKey:", self->_networkStatus, CFSTR("PrivacyProxyNetworkStatusTimeNetworkStatus"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_networkStatusStartTime, CFSTR("PrivacyProxyNetworkStatusTimeNetworkStartTime"));
    networkStatusEndTime = self->_networkStatusEndTime;
  }
  else
  {
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("PrivacyProxyNetworkStatusTimeNetworkStatus"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("PrivacyProxyNetworkStatusTimeNetworkStartTime"));
    networkStatusEndTime = 0;
  }
  objc_msgSend(v5, "encodeObject:forKey:", networkStatusEndTime, CFSTR("PrivacyProxyNetworkStatusTimeNetworkEndTime"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkStatusEndTime, 0);
  objc_storeStrong((id *)&self->_networkStatusStartTime, 0);
  objc_storeStrong((id *)&self->_networkStatus, 0);
}

@end
