@implementation SPUIFTEView

- (SPUIFTEView)initWithPrivacyPresentation:(id)a3 ttr:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = _Block_copy(a3);
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  return (SPUIFTEView *)sub_22E09E058((uint64_t)sub_22E09ED1C, v7, (uint64_t)sub_22E09F048, v8);
}

- (SPUIFTEView)initWithHostedView:(id)a3
{
  id v3;
  SPUIFTEView *result;

  v3 = a3;
  result = (SPUIFTEView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
