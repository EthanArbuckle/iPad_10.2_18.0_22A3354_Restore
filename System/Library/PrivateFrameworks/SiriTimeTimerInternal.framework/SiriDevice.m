@implementation SiriDevice

- (BOOL)isEqual:(id)a3
{
  SiriDevice *v4;
  SiriDevice *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2473EE6BC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = SiriDevice.isEqual(_:)((uint64_t)v8);

  sub_2473CA8F8((uint64_t)v8);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriDevice)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    v6 = sub_2473EE428();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = sub_2473EE428();
  v11 = v10;
  if (a5)
  {
    v12 = sub_2473EE428();
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  return (SiriDevice *)SiriDevice.init(identifier:display:pronunciationHint:)(v6, v8, v9, v11, v12, v14);
}

- (SiriDevice)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SiriDevice();
  return -[SiriDevice initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
