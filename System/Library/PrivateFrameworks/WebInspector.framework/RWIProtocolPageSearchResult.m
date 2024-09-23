@implementation RWIProtocolPageSearchResult

- (RWIProtocolPageSearchResult)initWithUrl:(id)a3 frameId:(id)a4 matchesCount:(double)a5
{
  id v8;
  id v9;
  RWIProtocolPageSearchResult *v10;
  RWIProtocolPageSearchResult *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RWIProtocolPageSearchResult;
  v10 = -[RWIProtocolJSONObject init](&v13, sel_init);
  if (v10)
  {
    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("url"));
    if (!v9)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("frameId"));
    -[RWIProtocolPageSearchResult setUrl:](v10, "setUrl:", v8);
    -[RWIProtocolPageSearchResult setFrameId:](v10, "setFrameId:", v9);
    -[RWIProtocolPageSearchResult setMatchesCount:](v10, "setMatchesCount:", a5);
    v11 = v10;
  }

  return v10;
}

- (void)setUrl:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("url"));
}

- (NSString)url
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("url"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setFrameId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("frameId"));
}

- (NSString)frameId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("frameId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setMatchesCount:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("matchesCount"), a3);
}

- (double)matchesCount
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("matchesCount"));
  return result;
}

- (void)setRequestId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("requestId"));
}

- (NSString)requestId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("requestId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
