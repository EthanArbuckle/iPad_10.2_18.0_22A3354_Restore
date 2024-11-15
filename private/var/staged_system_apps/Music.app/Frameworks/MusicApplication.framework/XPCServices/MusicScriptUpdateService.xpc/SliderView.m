@implementation SliderView

- (int64_t)semanticContentAttribute
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SliderView();
  return -[SliderView semanticContentAttribute](&v3, "semanticContentAttribute");
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SliderView();
  v4 = (char *)v5.receiver;
  -[SliderView setSemanticContentAttribute:](&v5, "setSemanticContentAttribute:", a3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC11MusicCoreUI10SliderView_stackView], "setSemanticContentAttribute:", objc_msgSend(v4, "semanticContentAttribute", v5.receiver, v5.super_class));

}

- (_TtC11MusicCoreUI10SliderView)initWithFrame:(CGRect)a3
{
  return (_TtC11MusicCoreUI10SliderView *)sub_10034D9B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MusicCoreUI10SliderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10034F4E4();
}

- (void)layoutSubviews
{
  _TtC11MusicCoreUI10SliderView *v2;

  v2 = self;
  SliderView.layoutSubviews()();

}

- (void)panGestureRecognized:(id)a3
{
  _TtC11MusicCoreUI10SliderView *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_10034E70C(v5);

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView_elapsedTrackWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView_trackHeightConstraint));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView____lazy_storage___panRecognizer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView_remainingTrackColor));

  sub_10003A5C8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI10SliderView_valueChangedHandler), *(_QWORD *)&self->stackView[OBJC_IVAR____TtC11MusicCoreUI10SliderView_valueChangedHandler]);
  sub_10003A5C8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI10SliderView_cancelledHandler), *(_QWORD *)&self->stackView[OBJC_IVAR____TtC11MusicCoreUI10SliderView_cancelledHandler]);
}

@end
