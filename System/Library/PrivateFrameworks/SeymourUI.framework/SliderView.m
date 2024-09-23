@implementation SliderView

- (int64_t)semanticContentAttribute
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SliderView();
  return -[SliderView semanticContentAttribute](&v3, sel_semanticContentAttribute);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SliderView();
  v4 = (char *)v5.receiver;
  -[SliderView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_, a3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9SeymourUI10SliderView_stackView], sel_setSemanticContentAttribute_, objc_msgSend(v4, sel_semanticContentAttribute, v5.receiver, v5.super_class));

}

- (_TtC9SeymourUI10SliderView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI10SliderView *)sub_22BA20A54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI10SliderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22BA22110();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI10SliderView *v2;

  v2 = self;
  sub_22BA21348();

}

- (void)panGestureRecognized:(id)a3
{
  id v4;
  _TtC9SeymourUI10SliderView *v5;

  v4 = a3;
  v5 = self;
  sub_22BA21674(v4);

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI10SliderView_onValueChanged));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI10SliderView____lazy_storage___panGestureRecognizer));

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI10SliderView_styleProvider);
  v4 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI10SliderView_styleProvider);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC9SeymourUI10SliderView_styleProvider));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI10SliderView_elapsedTrackWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI10SliderView_trackHeightConstraint));
}

@end
