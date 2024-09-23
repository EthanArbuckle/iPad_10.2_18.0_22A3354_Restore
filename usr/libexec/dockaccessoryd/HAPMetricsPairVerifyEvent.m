@implementation HAPMetricsPairVerifyEvent

- (HAPMetricsPairVerifyEvent)initWithAccessory:(id)a3 forLinkType:(id)a4 durationInMS:(unint64_t)a5 reason:(id)a6 pvError:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HAPMetricsPairVerifyEvent *v16;
  uint64_t v17;
  NSString *accessoryIdentifier;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HAPMetricsPairVerifyEvent;
  v16 = -[DKMLogEvent init](&v20, "init");
  if (v16)
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    accessoryIdentifier = v16->_accessoryIdentifier;
    v16->_accessoryIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v16->_linkType, a4);
    v16->_durationInMS = a5;
    objc_storeStrong((id *)&v16->_reason, a6);
    -[DKMLogEvent setError:](v16, "setError:", v15);
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetricsPairVerifyEvent accessoryIdentifier](self, "accessoryIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetricsPairVerifyEvent linkType](self, "linkType"));
  v5 = -[HAPMetricsPairVerifyEvent durationInMS](self, "durationInMS");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetricsPairVerifyEvent reason](self, "reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DKMLogEvent error](self, "error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HAPMetricsPairVerifyEvent - Accessory Identifier: %@, linkType: %@, duration: %lu ms, reason: %@, error: %@"), v3, v4, v5, v6, v7));

  return v8;
}

- (id)eventName
{
  return CFSTR("com.apple.dockaccessoryd.pairverify");
}

- (id)serializedEvent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[HAPMetricsPairVerifyEvent durationInMS](self, "durationInMS") / 0x3E8));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("duration"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[HAPMetricsPairVerifyEvent durationInMS](self, "durationInMS")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("durationInMS"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetricsPairVerifyEvent linkType](self, "linkType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("linkType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetricsPairVerifyEvent reason](self, "reason"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("reason"));

  v8 = objc_msgSend(v3, "copy");
  return v8;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (NSNumber)linkType
{
  return self->_linkType;
}

- (unint64_t)durationInMS
{
  return self->_durationInMS;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_linkType, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
