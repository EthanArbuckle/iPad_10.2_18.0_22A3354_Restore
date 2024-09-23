@implementation SchemaXPCEnvelope

- (NSData)_schema
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v2 = sub_245759E50();
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    v5 = v2;
    v6 = v3;
    v4 = (void *)sub_2457BAA74();
    sub_245750E8C(v5, v6);
  }
  return (NSData *)v4;
}

- (void)set_schema:(id)a3
{
  void *v3;
  _TtC4Sage17SchemaXPCEnvelope *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _TtC4Sage17SchemaXPCEnvelope *v8;

  v3 = a3;
  if (a3)
  {
    v4 = self;
    v5 = v3;
    v3 = (void *)sub_2457BAA8C();
    v7 = v6;

  }
  else
  {
    v8 = self;
    v7 = 0xF000000000000000;
  }
  sub_24575D110((uint64_t)v3, v7, &OBJC_IVAR____TtC4Sage17SchemaXPCEnvelope__schema, (uint64_t (*)(uint64_t, uint64_t))sub_245750E8C);

}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static SchemaXPCEnvelope.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static SchemaXPCEnvelope.supportsSecureCoding.setter(a3);
}

- (_TtC4Sage17SchemaXPCEnvelope)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC4Sage17SchemaXPCEnvelope *)SchemaXPCEnvelope.init(coder:)();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage17SchemaXPCEnvelope *v5;

  v4 = a3;
  v5 = self;
  SchemaXPCEnvelope.encode(with:)((NSCoder)v4);

}

- (_TtC4Sage17SchemaXPCEnvelope)init
{
  SchemaXPCEnvelope.init()();
}

- (void).cxx_destruct
{
  sub_245750E8C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Sage17SchemaXPCEnvelope__schema), *(_QWORD *)&self->_schema[OBJC_IVAR____TtC4Sage17SchemaXPCEnvelope__schema]);
}

@end
