@implementation ICContentInsetViewControllerConfiguration

- (NSDirectionalEdgeInsets)insets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets);
  v3 = *(double *)&self->insets[OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets];
  v4 = *(double *)&self->insets[OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets + 8];
  v5 = *(double *)&self->insets[OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets + 16];
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (BOOL)usesSafeAreaLayoutGuide
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_usesSafeAreaLayoutGuide);
}

- (double)cornerRadius
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_cornerRadius);
}

- (ICContentInsetViewControllerConfiguration)initWithInsets:(NSDirectionalEdgeInsets)a3 usesSafeAreaLayoutGuide:(BOOL)a4 cornerRadius:(double)a5
{
  objc_super v6;

  *(NSDirectionalEdgeInsets *)((char *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets) = a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_usesSafeAreaLayoutGuide) = a4;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_cornerRadius) = a5;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContentInsetViewController.Configuration();
  return -[ICContentInsetViewControllerConfiguration init](&v6, "init");
}

- (BOOL)isEqual:(id)a3
{
  ICContentInsetViewControllerConfiguration *v5;
  uint64_t v6;
  uint64_t v7;
  ICContentInsetViewControllerConfiguration *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v13;
  _BYTE v14[24];
  uint64_t v15;
  _OWORD v16[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v16, v6);
    swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v8 = self;
  }
  sub_1001F83A4((uint64_t)v16, (uint64_t)v14);
  if (!v15)
  {
    sub_1000160C8((uint64_t)v14);
    goto LABEL_8;
  }
  v9 = type metadata accessor for ContentInsetViewController.Configuration();
  if ((swift_dynamicCast(&v13, v14, (char *)&type metadata for Any + 8, v9, 6) & 1) == 0)
  {
LABEL_8:

    v11 = 0;
    goto LABEL_9;
  }
  v10 = v13;
  v11 = _s11MobileNotes26ContentInsetViewControllerC13ConfigurationC2eeoiySbAE_AEtFZ_0((uint64_t)self, (uint64_t)v13);

LABEL_9:
  sub_1000160C8((uint64_t)v16);
  return v11;
}

- (ICContentInsetViewControllerConfiguration)init
{
  ICContentInsetViewControllerConfiguration *result;

  result = (ICContentInsetViewControllerConfiguration *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.Configuration", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
