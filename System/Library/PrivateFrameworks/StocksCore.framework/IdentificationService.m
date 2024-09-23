@implementation IdentificationService

- (_TtC10StocksCore21IdentificationService)init
{
  return (_TtC10StocksCore21IdentificationService *)sub_1ABE3653C();
}

- (void).cxx_destruct
{
  sub_1ABD3F9B0((uint64_t)self + OBJC_IVAR____TtC10StocksCore21IdentificationService_source);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10StocksCore21IdentificationService_sensitiveUserDefaults));

  swift_bridgeObjectRelease();
}

- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4
{
  id v5;
  _TtC10StocksCore21IdentificationService *v6;

  v5 = a3;
  v6 = self;
  sub_1ABE38A90(v5);

}

- (void)userInfoDidChangeAdsUserID:(id)a3 fromCloud:(BOOL)a4
{
  id v5;
  _TtC10StocksCore21IdentificationService *v6;

  v5 = a3;
  v6 = self;
  sub_1ABE38D8C(v5);

}

@end
