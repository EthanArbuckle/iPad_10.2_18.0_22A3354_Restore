@implementation SummarizationXPCRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC4Sage23SummarizationXPCRequest)initWithCoder:(id)a3
{
  return (_TtC4Sage23SummarizationXPCRequest *)SummarizationXPCRequest.init(coder:)((uint64_t)a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage23SummarizationXPCRequest *v5;

  v4 = a3;
  v5 = self;
  sub_24578A634(v4);

}

- (_TtC4Sage23SummarizationXPCRequest)init
{
  SummarizationXPCRequest.init()();
}

- (void).cxx_destruct
{
  sub_2457878A8((uint64_t)self + OBJC_IVAR____TtC4Sage23SummarizationXPCRequest_request, (void (*)(_QWORD))type metadata accessor for SummarizationXPCRequest.Request);
  sub_2457902C8();
  sub_245776CB8();
  swift_bridgeObjectRelease();
  sub_24575131C();
}

@end
