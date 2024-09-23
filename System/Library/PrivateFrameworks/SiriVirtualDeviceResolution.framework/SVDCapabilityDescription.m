@implementation SVDCapabilityDescription

- (SVDCapabilityDescription)initWithKey:(id)a3 valueSet:(id)a4
{
  id v6;
  id v7;
  _TtC27SiriVirtualDeviceResolution21CapabilityDescription *v8;
  SVDCapabilityDescription *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[CapabilityDescription initWithKey:valueSet:]([_TtC27SiriVirtualDeviceResolution21CapabilityDescription alloc], "initWithKey:valueSet:", v7, v6);

  v9 = -[SVDCapabilityDescription initWithBacking:](self, "initWithBacking:", v8);
  return v9;
}

- (SVDCapabilityDescription)initWithKey:(id)a3 valueRangeWithLowerBound:(double)a4 upperBound:(double)a5
{
  id v8;
  _TtC27SiriVirtualDeviceResolution21CapabilityDescription *v9;
  SVDCapabilityDescription *v10;

  v8 = a3;
  v9 = -[CapabilityDescription initWithKey:lowerbound:upperbound:]([_TtC27SiriVirtualDeviceResolution21CapabilityDescription alloc], "initWithKey:lowerbound:upperbound:", v8, a4, a5);

  v10 = -[SVDCapabilityDescription initWithBacking:](self, "initWithBacking:", v9);
  return v10;
}

- (SVDCapabilityDescription)initWithBacking:(id)a3
{
  id v5;
  SVDCapabilityDescription *v6;
  SVDCapabilityDescription *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDCapabilityDescription;
  v6 = -[SVDCapabilityDescription init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backing, a3);

  return v7;
}

- (NSString)key
{
  return -[CapabilityDescription key](self->_backing, "key");
}

- (NSString)capabilityKey
{
  return -[CapabilityDescription capabilityKey](self->_backing, "capabilityKey");
}

- (NSSet)valueSet
{
  return -[CapabilityDescription valueSet](self->_backing, "valueSet");
}

- (NSNumber)valueRangeLowerBound
{
  return -[CapabilityDescription valueRangeLowerBound](self->_backing, "valueRangeLowerBound");
}

- (NSNumber)valueRangeUpperBound
{
  return -[CapabilityDescription valueRangeUpperBound](self->_backing, "valueRangeUpperBound");
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_backing, CFSTR("SVDCapabilityDescriptionBacking"));
}

- (SVDCapabilityDescription)initWithCoder:(id)a3
{
  id v4;
  SVDCapabilityDescription *v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution21CapabilityDescription *backing;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDCapabilityDescription;
  v5 = -[SVDCapabilityDescription init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVDCapabilityDescriptionBacking"));
    v6 = objc_claimAutoreleasedReturnValue();
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution21CapabilityDescription *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backing, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
