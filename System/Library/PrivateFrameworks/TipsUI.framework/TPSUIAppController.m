@implementation TPSUIAppController

+ (id)sharedInstance
{
  swift_getObjCClassMetadata();
  return static TPSUIAppController.sharedInstance()();
}

- (void)setViewNavigationCollapsed:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)viewNavigationCollapsed
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed;
  swift_beginAccess();
  return *v2;
}

- (TPSUIAppController)init
{
  return (TPSUIAppController *)TPSUIAppController.init()();
}

- (void)contentWillUpdate
{
  TPSUIAppController *v2;

  v2 = self;
  sub_20CF848B0();

}

- (id)assetConfigurationForAssets:(id)a3 language:(id)a4 sizeClass:(int64_t)a5 style:(int64_t)a6 assetFileInfoManager:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  TPSUIAppController *v16;
  id v17;

  if (a4)
  {
    v11 = sub_20CFCD118();
    v13 = v12;
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = a3;
  v15 = a7;
  v16 = self;
  v17 = sub_20CF9FE00(a3, v11, v13, a6, (uint64_t)v15);

  swift_bridgeObjectRelease();
  return v17;
}

- (id)attributedStringForIdentifier:(id)a3
{
  return sub_20CF9F5B8(self, (uint64_t)a2, (uint64_t)a3, sub_20CF9F1B0);
}

- (id)footNoteAttributedStringForIdentifier:(id)a3
{
  return sub_20CF9F5B8(self, (uint64_t)a2, (uint64_t)a3, sub_20CF9F378);
}

- (void)updateAttributedString:(id)a3 forIdentifier:(id)a4
{
  sub_20CF9F960(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))sub_20CF9F618);
}

- (void)updateFootnoteAttributedString:(id)a3 forIdentifier:(id)a4
{
  sub_20CF9F960(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))sub_20CF9F640);
}

- (void)resetAttributedStringCache
{
  TPSUIAppController *v2;

  v2 = self;
  sub_20CF9F9D4();

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (TPSUIAppController)shared
{
  if (qword_253EC63F8 != -1)
    swift_once();
  return (TPSUIAppController *)(id)qword_253EC63F0;
}

- (void)overrideWidgetWithTip:(id)a3
{
  TPSUIAppController *v5;
  TPSUIAppController *v6;
  TPSUIAppController *v7;
  id v8;

  type metadata accessor for TipsContentModel();
  v8 = a3;
  v5 = self;
  v6 = (TPSUIAppController *)static TipsContentModel.shared()();
  if (objc_msgSend((id)objc_opt_self(), sel_isInternalBuild))
  {
    v7 = (TPSUIAppController *)sub_20CFBFE98();
    -[TPSUIAppController attemptWidgetUpdateWith:](v7, sel_attemptWidgetUpdateWith_, v8);

    v5 = v6;
    v6 = v7;
  }

}

@end
