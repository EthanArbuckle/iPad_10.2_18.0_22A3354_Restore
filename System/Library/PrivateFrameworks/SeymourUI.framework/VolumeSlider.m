@implementation VolumeSlider

- (_TtC9SeymourUI12VolumeSlider)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI12VolumeSlider *)sub_22B165AB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI12VolumeSlider)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B166F94();
}

- (void)didMoveToWindow
{
  _TtC9SeymourUI12VolumeSlider *v2;

  v2 = self;
  sub_22B16623C();

}

- (void).cxx_destruct
{
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI12VolumeSlider_onVolumeChanged));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI12VolumeSlider_timerProvider);

  swift_unknownObjectRelease();
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  id v5;
  _TtC9SeymourUI12VolumeSlider *v6;

  v5 = a3;
  v6 = self;
  sub_22B16644C();

}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v5;
  _TtC9SeymourUI12VolumeSlider *v6;

  v5 = a3;
  v6 = self;
  sub_22B167168();

}

- (BOOL)isOnScreenForVolumeDisplay
{
  return -[VolumeSlider isHidden](self, sel_isHidden) ^ 1;
}

- (NSString)volumeAudioCategory
{
  void *v2;
  _TtC9SeymourUI12VolumeSlider *v3;
  id v4;
  void *v5;
  NSString *result;
  NSString *v7;
  void *v8;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12VolumeSlider_volumeController);
  v3 = self;
  v4 = objc_msgSend(v2, sel_dataSource);
  objc_opt_self();
  v5 = (void *)swift_dynamicCastObjCClass();
  if (!v5)
  {

    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  result = (NSString *)objc_msgSend(v5, sel_volumeAudioCategory);
  if (result)
  {
    v7 = result;
    sub_22BA8067C();

    swift_unknownObjectRelease();
LABEL_5:
    v8 = (void *)sub_22BA8064C();
    swift_bridgeObjectRelease();
    return (NSString *)v8;
  }
  __break(1u);
  return result;
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  _TtC9SeymourUI12VolumeSlider *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[VolumeSlider window](v2, sel_window);
  v4 = objc_msgSend(v3, sel_windowScene);

  return (UIWindowScene *)v4;
}

@end
