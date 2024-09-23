@implementation MusicInstrumentalContentView

- (MusicInstrumentalContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_DFF9AC();
}

- (void)layoutSubviews
{
  char *v2;
  char *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)_s23InstrumentalContentViewCMa();
  v2 = (char *)v16.receiver;
  -[MusicInstrumentalContentView layoutSubviews](&v16, "layoutSubviews");
  v3 = &v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds];
  v4 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds];
  v5 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds + 8];
  v6 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds + 16];
  v7 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds + 24];
  objc_msgSend(v2, "bounds", v16.receiver, v16.super_class);
  v18.origin.x = v8;
  v18.origin.y = v9;
  v18.size.width = v10;
  v18.size.height = v11;
  v17.origin.x = v4;
  v17.origin.y = v5;
  v17.size.width = v6;
  v17.size.height = v7;
  if (!CGRectEqualToRect(v17, v18))
  {
    objc_msgSend(v2, "bounds");
    *(_QWORD *)v3 = v12;
    *((_QWORD *)v3 + 1) = v13;
    *((_QWORD *)v3 + 2) = v14;
    *((_QWORD *)v3 + 3) = v15;
    sub_DFF474();
  }

}

- (MusicInstrumentalContentView)initWithFrame:(CGRect)a3
{
  MusicInstrumentalContentView *result;

  result = (MusicInstrumentalContentView *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.InstrumentalContentView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v2[544];

  memcpy(v2, (char *)self + OBJC_IVAR___MusicInstrumentalContentView_specs, 0x219uLL);
  sub_532E70((uint64_t)v2);
  swift_bridgeObjectRelease();
}

@end
