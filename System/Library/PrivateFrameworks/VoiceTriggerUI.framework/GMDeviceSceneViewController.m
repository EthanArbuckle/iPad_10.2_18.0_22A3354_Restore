@implementation GMDeviceSceneViewController

- (void)viewDidLoad
{
  _TtC14VoiceTriggerUI27GMDeviceSceneViewController *v2;

  v2 = self;
  GMDeviceSceneViewController.viewDidLoad()();

}

- (_TtC14VoiceTriggerUI27GMDeviceSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_229F4B7CC();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC14VoiceTriggerUI27GMDeviceSceneViewController *)GMDeviceSceneViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC14VoiceTriggerUI27GMDeviceSceneViewController)initWithCoder:(id)a3
{
  return (_TtC14VoiceTriggerUI27GMDeviceSceneViewController *)GMDeviceSceneViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__sceneView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__cameraNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__deviceModelNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__mainLightNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__deviceDisplayLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__wallpaperBlockingLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__keyboardLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__homeIndicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__intelligentLightLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__edgeLightMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__displayCAView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__pressAndHoldEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__doubleTapEffectView));
  swift_release();
}

@end
