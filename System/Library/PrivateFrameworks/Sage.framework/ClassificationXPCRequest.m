@implementation ClassificationXPCRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC4Sage24ClassificationXPCRequest)initWithCoder:(id)a3
{
  return (_TtC4Sage24ClassificationXPCRequest *)ClassificationXPCRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage24ClassificationXPCRequest *v5;

  v4 = a3;
  v5 = self;
  sub_24574D238(v4);

}

- (_TtC4Sage24ClassificationXPCRequest)init
{
  ClassificationXPCRequest.init()();
}

- (void).cxx_destruct
{
  sub_24574B880((uint64_t)self + OBJC_IVAR____TtC4Sage24ClassificationXPCRequest_request, type metadata accessor for ClassificationXPCRequest.Request);
  sub_245751414();
  sub_24575131C();
}

@end
