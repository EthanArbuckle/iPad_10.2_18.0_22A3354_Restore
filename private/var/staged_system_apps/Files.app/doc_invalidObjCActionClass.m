@implementation doc_invalidObjCActionClass

- (void)actionNoOneImplements:(id)a3
{
  _TtC5FilesP33_C5D1CB1CA0AFEDBC7090129A90982C9D26doc_invalidObjCActionClass *v4;
  uint64_t v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    v5 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6, v5);

    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000CB4C((uint64_t)v6, &qword_100642730);
}

- (_TtC5FilesP33_C5D1CB1CA0AFEDBC7090129A90982C9D26doc_invalidObjCActionClass)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for doc_invalidObjCActionClass();
  return -[doc_invalidObjCActionClass init](&v3, "init");
}

@end
