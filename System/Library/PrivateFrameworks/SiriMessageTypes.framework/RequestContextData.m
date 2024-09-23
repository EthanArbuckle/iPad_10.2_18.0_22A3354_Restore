@implementation RequestContextData

+ (BOOL)supportsSecureCoding
{
  return static RequestContextData.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static RequestContextData.supportsSecureCoding.setter(a3);
}

- (_TtC16SiriMessageTypes18RequestContextData)initWithCoder:(id)a3
{
  return (_TtC16SiriMessageTypes18RequestContextData *)RequestContextData.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC16SiriMessageTypes18RequestContextData *v5;

  v4 = a3;
  v5 = self;
  sub_24697DB30();

}

- (BOOL)isEqual:(id)a3
{
  _TtC16SiriMessageTypes18RequestContextData *v4;
  _TtC16SiriMessageTypes18RequestContextData *v5;
  char v6;
  char v7;
  _OWORD v9[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2469F597C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v5 = self;
  }
  sub_24697E0B8();
  v7 = v6;

  sub_24691FF80((uint64_t)v9, &qword_2575F3AB0);
  return v7 & 1;
}

- (NSString)debugDescription
{
  _TtC16SiriMessageTypes18RequestContextData *v2;

  v2 = self;
  sub_24697E5F0();
}

- (_TtC16SiriMessageTypes18RequestContextData)init
{
  RequestContextData.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_30_1();
  sub_24691FF80((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes18RequestContextData_approximatePreviousTTSInterval, &qword_25442E9C8);
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_30_1();

}

@end
