@implementation RWIProtocolRuntimeTypeLocation

- (RWIProtocolRuntimeTypeLocation)initWithTypeInformationDescriptor:(int)a3 sourceID:(id)a4 divot:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  RWIProtocolRuntimeTypeLocation *v9;
  RWIProtocolRuntimeTypeLocation *v10;
  objc_super v12;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  v9 = -[RWIProtocolJSONObject init](&v12, sel_init);
  if (v9)
  {
    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("sourceID"));
    -[RWIProtocolRuntimeTypeLocation setTypeInformationDescriptor:](v9, "setTypeInformationDescriptor:", v6);
    -[RWIProtocolRuntimeTypeLocation setSourceID:](v9, "setSourceID:", v8);
    -[RWIProtocolRuntimeTypeLocation setDivot:](v9, "setDivot:", v5);
    v10 = v9;
  }

  return v9;
}

- (void)setTypeInformationDescriptor:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("typeInformationDescriptor"));
}

- (int)typeInformationDescriptor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("typeInformationDescriptor"));
}

- (void)setSourceID:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("sourceID"));
}

- (NSString)sourceID
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("sourceID"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDivot:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("divot"));
}

- (int)divot
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("divot"));
}

@end
