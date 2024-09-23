@implementation PlaybackTimeControl

- (id)viewForBaselineLayout
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTimeLabel));
}

- (_TtC9SeymourUI19PlaybackTimeControl)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19PlaybackTimeControl *)sub_22B91878C();
}

- (_TtC9SeymourUI19PlaybackTimeControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B919418();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI19PlaybackTimeControl *v2;

  v2 = self;
  sub_22B917EE0();

}

- (void)tintColorDidChange
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlaybackTimeControl();
  v2 = (char *)v5.receiver;
  -[PlaybackTimeControl tintColorDidChange](&v5, sel_tintColorDidChange);
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTrackView];
  v4 = objc_msgSend(v2, sel_tintColor, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setBackgroundColor_, v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI19PlaybackTimeControl *v6;

  v5 = a3;
  v6 = self;
  sub_22B91809C((uint64_t)a3);

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTrackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_remainingTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_remainingTrackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTimeLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTrackViewWidthConstraint));
  v3 = *(void **)((char *)&self->super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_style);
  v4 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_style);
  objc_release(*(id *)((char *)&self->super.super._swiftAnimationInfo
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_style));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_trackContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_trackMask));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTimeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_remainingTimeFormatter));
}

@end
