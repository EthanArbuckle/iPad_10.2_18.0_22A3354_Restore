@implementation SpringBoardUIServicesBackedSceneInteractor

- (_TtC16ScreenSharingKit42SpringBoardUIServicesBackedSceneInteractor)init
{
  return (_TtC16ScreenSharingKit42SpringBoardUIServicesBackedSceneInteractor *)sub_2458DB1C4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit42SpringBoardUIServicesBackedSceneInteractor_session));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)continuitySession:(id)a3 didUpdateContinuitySessionStep:(unint64_t)a4 reasons:(id)a5
{
  uint64_t v8;
  char *v9;
  _TtC16ScreenSharingKit42SpringBoardUIServicesBackedSceneInteractor *v10;

  v8 = sub_245956580();
  v9 = (char *)a3;
  v10 = self;
  sub_2458DCD54(v9, (uint64_t *)a4, v8);

  swift_bridgeObjectRelease();
}

- (void)continuitySession:(id)a3 didUpdateCurrentInterfaceOrientation:(int64_t)a4 supportedInterfaceOrientations:(unint64_t)a5
{
  id v8;
  _TtC16ScreenSharingKit42SpringBoardUIServicesBackedSceneInteractor *v9;

  v8 = a3;
  v9 = self;
  sub_2458DD81C((uint64_t)v8, a4, a5);

}

@end
