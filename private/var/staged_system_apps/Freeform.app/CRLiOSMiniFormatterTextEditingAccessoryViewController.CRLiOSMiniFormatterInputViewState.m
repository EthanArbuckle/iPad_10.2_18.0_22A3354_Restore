@implementation CRLiOSMiniFormatterTextEditingAccessoryViewController.CRLiOSMiniFormatterInputViewState

- (BOOL)isEqual:(id)a3
{
  _TtCC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController33CRLiOSMiniFormatterInputViewState *v5;
  uint64_t v6;
  _TtCC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController33CRLiOSMiniFormatterInputViewState *v7;
  BOOL v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_100C560CC((uint64_t)v10);

  sub_1004CB800((uint64_t)v10, &qword_1013E0230);
  return v8;
}

- (_TtCC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController33CRLiOSMiniFormatterInputViewState)init
{
  _TtCC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController33CRLiOSMiniFormatterInputViewState *result;

  result = (_TtCC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController33CRLiOSMiniFormatterInputViewState *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSMiniFormatterInputViewState", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController33CRLiOSMiniFormatterInputViewState_font));
}

@end
