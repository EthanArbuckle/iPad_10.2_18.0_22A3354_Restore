@implementation PhotosUIOneUpChromeEnvironment.SettingsObservation

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtCC15PhotosUIPrivate30PhotosUIOneUpChromeEnvironmentP33_AC95AE35C81CD1A240000623A044C1EE19SettingsObservation *v10;

  v6 = sub_1AB08D498();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1AABF17EC((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtCC15PhotosUIPrivate30PhotosUIOneUpChromeEnvironmentP33_AC95AE35C81CD1A240000623A044C1EE19SettingsObservation)init
{
  sub_1AABF1884();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
