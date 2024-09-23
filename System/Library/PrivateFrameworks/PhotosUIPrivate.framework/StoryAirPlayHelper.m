@implementation StoryAirPlayHelper

- (void)dealloc
{
  _TtC15PhotosUIPrivate18StoryAirPlayHelper *v2;

  v2 = self;
  sub_1AAB95448();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate18StoryAirPlayHelper_pickerViewController));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate18StoryAirPlayHelper_airPlayContainerViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate18StoryAirPlayHelper_airPlayStoryViewController));
}

- (id)contentViewControllerForAirPlayController:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate18StoryAirPlayHelper *v5;

  v4 = a3;
  v5 = self;
  sub_1AAB95870();
}

- (void)airPlayControllerScreenAvailabilityChanged:(id)a3
{
  id v5;
  _TtC15PhotosUIPrivate18StoryAirPlayHelper *v6;

  v5 = a3;
  v6 = self;
  sub_1AAB959B4(a3);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate18StoryAirPlayHelper *v5;

  v4 = a3;
  v5 = self;
  sub_1AAB95B04(v4);

}

- (_TtC15PhotosUIPrivate18StoryAirPlayHelper)init
{
  sub_1AAB95BE8();
}

@end
