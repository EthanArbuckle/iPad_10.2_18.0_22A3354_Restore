@implementation PreviewDebugOverlay

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v6;
  _TtC19PreviewsOSSupportUI19PreviewDebugOverlay *v7;
  id v8;
  id v9;

  if (a4)
    sub_22C6835E0();
  v6 = (void *)objc_opt_self();
  v9 = a3;
  v7 = self;
  v8 = objc_msgSend(v6, sel_rootSettings);
  LOBYTE(v6) = objc_msgSend(v8, sel_showDebugUI);

  *((_BYTE *)&v7->super.isa + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled) = (_BYTE)v6;
  sub_22C66BD80();
  swift_bridgeObjectRelease();

}

- (_TtC19PreviewsOSSupportUI19PreviewDebugOverlay)init
{
  _TtC19PreviewsOSSupportUI19PreviewDebugOverlay *result;

  result = (_TtC19PreviewsOSSupportUI19PreviewDebugOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay____lazy_storage___view));
}

@end
