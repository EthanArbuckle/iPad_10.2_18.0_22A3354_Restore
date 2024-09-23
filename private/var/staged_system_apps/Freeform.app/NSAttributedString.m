@implementation NSAttributedString

- (id)crl_writeToFileUsingName:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSAttributedString *v15;
  NSURL *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;
  v15 = self;
  sub_1005EAAFC(v12, v14, (void *)a4, (uint64_t)v11);
  swift_bridgeObjectRelease(v14);

  URL._bridgeToObjectiveC()(v16);
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v18;
}

@end
