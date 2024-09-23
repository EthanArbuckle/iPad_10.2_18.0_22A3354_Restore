@implementation LiveLookupManagerProxy

- (int64_t)extensionCount
{
  LiveLookupManagerProxy *v2;
  unint64_t v3;
  int64_t v4;

  v2 = self;
  v3 = sub_19A637A38();
  if (v3 >> 62)
    v4 = sub_19A637C90();
  else
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);

  swift_bridgeObjectRelease();
  return v4;
}

- (void).cxx_destruct
{
  swift_release();
}

- (LiveLookupManagerProxy)init
{
  uint64_t v3;
  LiveLookupManagerProxy *v4;
  objc_super v6;

  v3 = OBJC_IVAR___LiveLookupManagerProxy_manager;
  sub_19A637A50();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_19A637A44();

  v6.receiver = v4;
  v6.super_class = (Class)LiveLookupManagerProxy;
  return -[LiveLookupManagerProxy init](&v6, sel_init);
}

@end
