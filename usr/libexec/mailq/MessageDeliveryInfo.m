@implementation MessageDeliveryInfo

- (MessageDeliveryInfo)init
{
  MessageDeliveryInfo *v2;
  uint64_t v3;
  NSDate *created;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MessageDeliveryInfo;
  v2 = -[MessageDeliveryInfo init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    created = v2->_created;
    v2->_created = (NSDate *)v3;

  }
  return v2;
}

- (id)encodedAsJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];

  v17[0] = CFSTR("created");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageDeliveryInfo created](self, "created"));
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v18[0] = v4;
  v17[1] = CFSTR("numberOfFailures");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MessageDeliveryInfo numberOfFailures](self, "numberOfFailures")));
  v18[1] = v5;
  v17[2] = CFSTR("failedCellularAttempts");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MessageDeliveryInfo failedCellularAttempts](self, "failedCellularAttempts")));
  v18[2] = v6;
  v17[3] = CFSTR("lastStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MessageDeliveryInfo lastStatus](self, "lastStatus")));
  v18[3] = v7;
  v17[4] = CFSTR("messageSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MessageDeliveryInfo messageSize](self, "messageSize")));
  v18[4] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 5));
  v10 = objc_msgSend(v9, "mutableCopy");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageDeliveryInfo lastAttempt](self, "lastAttempt"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageDeliveryInfo lastAttempt](self, "lastAttempt"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("lastAttempt"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v10, 0, 0));
  if (v14)
    v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v14, 4);
  else
    v15 = 0;

  return v15;
}

- (MessageDeliveryInfo)initWithJSON:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  MessageDeliveryInfo *v9;
  void *v10;
  uint64_t v11;
  NSDate *created;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MessageDeliveryInfo *v20;
  objc_super v22;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, 0));

    v8 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v22.receiver = self;
      v22.super_class = (Class)MessageDeliveryInfo;
      v9 = -[MessageDeliveryInfo init](&v22, "init");
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("created")));
        objc_msgSend(v10, "doubleValue");
        v11 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
        created = v9->_created;
        v9->_created = (NSDate *)v11;

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("numberOfFailures")));
        -[MessageDeliveryInfo setNumberOfFailures:](v9, "setNumberOfFailures:", objc_msgSend(v13, "integerValue"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("failedCellularAttempts")));
        -[MessageDeliveryInfo setFailedCellularAttempts:](v9, "setFailedCellularAttempts:", objc_msgSend(v14, "integerValue"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("lastStatus")));
        -[MessageDeliveryInfo setLastStatus:](v9, "setLastStatus:", (int)objc_msgSend(v15, "intValue"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("lastAttempt")));
        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("lastAttempt")));
          objc_msgSend(v17, "doubleValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
          -[MessageDeliveryInfo setLastAttempt:](v9, "setLastAttempt:", v18);

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("messageSize")));
        -[MessageDeliveryInfo setMessageSize:](v9, "setMessageSize:", objc_msgSend(v19, "unsignedIntegerValue"));

      }
      self = v9;
      v20 = self;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)description
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[MessageDeliveryInfo numberOfFailures](self, "numberOfFailures");
  v4 = -[MessageDeliveryInfo failedCellularAttempts](self, "failedCellularAttempts");
  v5 = MFMessageDeliveryStatusString(-[MessageDeliveryInfo lastStatus](self, "lastStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageDeliveryInfo lastAttempt](self, "lastAttempt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("numberOfFailures: %d, failedCellularAttempts: %d, lastStatus: %@, lastAttempt: %@, message size: %d bytes"), v3, v4, v6, v7, -[MessageDeliveryInfo messageSize](self, "messageSize")));

  return v8;
}

- (NSDate)created
{
  return self->_created;
}

- (int64_t)numberOfFailures
{
  return self->_numberOfFailures;
}

- (void)setNumberOfFailures:(int64_t)a3
{
  self->_numberOfFailures = a3;
}

- (int64_t)failedCellularAttempts
{
  return self->_failedCellularAttempts;
}

- (void)setFailedCellularAttempts:(int64_t)a3
{
  self->_failedCellularAttempts = a3;
}

- (int64_t)lastStatus
{
  return self->_lastStatus;
}

- (void)setLastStatus:(int64_t)a3
{
  self->_lastStatus = a3;
}

- (NSDate)lastAttempt
{
  return self->_lastAttempt;
}

- (void)setLastAttempt:(id)a3
{
  objc_storeStrong((id *)&self->_lastAttempt, a3);
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (void)setMessageSize:(unint64_t)a3
{
  self->_messageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAttempt, 0);
  objc_storeStrong((id *)&self->_created, 0);
}

@end
