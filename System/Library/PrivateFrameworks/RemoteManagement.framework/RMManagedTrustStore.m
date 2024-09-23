@implementation RMManagedTrustStore

+ (_TtC16RemoteManagement19RMManagedTrustStore)sharedInstance
{
  if (qword_254FFC870 != -1)
    swift_once();
  return (_TtC16RemoteManagement19RMManagedTrustStore *)(id)qword_254FFCD18;
}

- (BOOL)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8
{
  return sub_21889F594(self, (uint64_t)a2, a3, a4, a5, a6, a7, (uint64_t)a8, (void (*)(uint64_t, uint64_t))sub_2188A2230);
}

- (BOOL)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8
{
  return sub_21889F594(self, (uint64_t)a2, a3, a4, a5, a6, a7, (uint64_t)a8, (void (*)(uint64_t, uint64_t))sub_2188A2834);
}

- (_TtC16RemoteManagement19RMManagedTrustStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RMManagedTrustStore();
  return -[RMManagedTrustStore init](&v3, sel_init);
}

@end
