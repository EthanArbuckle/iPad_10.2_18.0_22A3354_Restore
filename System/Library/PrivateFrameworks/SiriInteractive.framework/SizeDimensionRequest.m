@implementation SizeDimensionRequest

- (double)minimum
{
  return SizeDimensionRequest.minimum.getter();
}

- (double)maximum
{
  return SizeDimensionRequest.maximum.getter();
}

- (int64_t)type
{
  return SizeDimensionRequest.type.getter();
}

- (_TtC15SiriInteractive20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4 type:(int64_t)a5
{
  return (_TtC15SiriInteractive20SizeDimensionRequest *)SizeDimensionRequest.init(minimum:maximum:type:)(a5, a3, a4);
}

- (_TtC15SiriInteractive20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4
{
  return (_TtC15SiriInteractive20SizeDimensionRequest *)SizeDimensionRequest.init(minimum:maximum:)();
}

- (int64_t)hash
{
  return sub_24645DF58();
}

- (BOOL)isEqual:(id)a3
{
  _TtC15SiriInteractive20SizeDimensionRequest *v4;
  _TtC15SiriInteractive20SizeDimensionRequest *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2464825FC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_24645E040((uint64_t)v8);

  sub_24645E148((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  _TtC15SiriInteractive20SizeDimensionRequest *v2;
  void *v3;

  v2 = self;
  sub_24645E250();

  v3 = (void *)sub_2464823E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  _TtC15SiriInteractive20SizeDimensionRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_24645E36C(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_246482758();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15SiriInteractive20SizeDimensionRequest *v5;

  v4 = a3;
  v5 = self;
  sub_24645E454(v4);

}

- (_TtC15SiriInteractive20SizeDimensionRequest)initWithCoder:(id)a3
{
  return (_TtC15SiriInteractive20SizeDimensionRequest *)SizeDimensionRequest.init(coder:)(a3);
}

- (_TtC15SiriInteractive20SizeDimensionRequest)initWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC15SiriInteractive20SizeDimensionRequest *)SizeDimensionRequest.init(xpcDictionary:)(a3);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  _TtC15SiriInteractive20SizeDimensionRequest *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_24645E7CC(a3);
  swift_unknownObjectRelease();

}

- (_TtC15SiriInteractive20SizeDimensionRequest)init
{
  SizeDimensionRequest.init()();
}

@end
