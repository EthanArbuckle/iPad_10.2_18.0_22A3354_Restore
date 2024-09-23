@implementation MusicTextContentView

- (MusicTextContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10031B7A0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicTextContentView_label), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)copy
{
  MusicTextContentView *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  char *v7[3];
  uint64_t v8;

  v2 = self;
  sub_10031AE04(v7);

  v3 = v8;
  v4 = sub_10000D900(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  sub_100011758(v7);
  return v5;
}

- (MusicTextContentView)initWithFrame:(CGRect)a3
{
  MusicTextContentView *result;

  result = (MusicTextContentView *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.TextContentView", 27, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[544];

  memcpy(v3, (char *)self + OBJC_IVAR___MusicTextContentView_specs, 0x219uLL);
  sub_10030EE2C((uint64_t)v3);
  sub_10031B4A4(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicTextContentView_content), *(_QWORD *)&self->isSelected[OBJC_IVAR___MusicTextContentView_content], self->specs[OBJC_IVAR___MusicTextContentView_content + 7]);

}

@end
