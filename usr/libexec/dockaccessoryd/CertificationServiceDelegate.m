@implementation CertificationServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC14dockaccessoryd28CertificationServiceDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10009A6C4(v7);

  return v9 & 1;
}

- (_TtC14dockaccessoryd28CertificationServiceDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CertificationServiceDelegate((uint64_t)self, (uint64_t)a2);
  return -[CertificationServiceDelegate init](&v3, "init");
}

@end
