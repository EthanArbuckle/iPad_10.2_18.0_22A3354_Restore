@implementation SUIBBridgedMatch

- (_NSRange)range
{
  SUIBBridgedMatch *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = sub_24744CE68();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)captured
{
  SUIBBridgedMatch *v2;
  void *v3;

  v2 = self;
  sub_24744CFD4();

  v3 = (void *)sub_24745C800();
  swift_bridgeObjectRelease();
  return v3;
}

- (SUIBBridgedMatch)init
{
  BridgedMatch.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR___SUIBBridgedMatch_match;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5968);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR___SUIBBridgedMatch_captureReference;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5A08);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
