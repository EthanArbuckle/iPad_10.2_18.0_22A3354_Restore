@implementation SessionIntroSequenceView

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_22B5E4234(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_22B5E427C(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setFrame_);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_22B5E4234(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_22B5E427C(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setBounds_);
}

- (void)handlePlayPauseGesture
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC9SeymourUI24SessionIntroSequenceView *v7;
  uint64_t v8;

  v3 = sub_22BA7FE00();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_22BA7F9B0();
  sub_22BA7FDE8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

}

- (_TtC9SeymourUI24SessionIntroSequenceView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B5E4F6C();
}

- (void)didTouchDownPlayIcon:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _TtC9SeymourUI24SessionIntroSequenceView *v8;
  id v9;
  _QWORD v10[6];

  v5 = (void *)objc_opt_self();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = self;
  *(_QWORD *)(v6 + 24) = 0x3FD851EB851EB852;
  v10[4] = sub_22B5E5224;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_22B0F2EEC;
  v10[3] = &block_descriptor_13_2;
  v7 = _Block_copy(v10);
  v8 = self;
  v9 = a3;
  swift_release();
  objc_msgSend(v5, sel_animateWithDuration_animations_, v7, 0.2);
  _Block_release(v7);

}

- (void)didTouchUpInsidePlayIcon:(id)a3
{
  id v4;
  _TtC9SeymourUI24SessionIntroSequenceView *v5;

  v4 = a3;
  v5 = self;
  sub_22B5E5024();

}

- (void)didTouchUpOutsidePlayIcon:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _TtC9SeymourUI24SessionIntroSequenceView *v8;
  id v9;
  _QWORD v10[6];

  v5 = (void *)objc_opt_self();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = self;
  v10[4] = sub_22B5E4F64;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_22B0F2EEC;
  v10[3] = &block_descriptor_88;
  v7 = _Block_copy(v10);
  v8 = self;
  v9 = a3;
  swift_release();
  objc_msgSend(v5, sel_animateWithDuration_animations_, v7, 0.2);
  _Block_release(v7);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  _TtC9SeymourUI24SessionIntroSequenceView *v9;
  id v10;
  objc_super v12;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_playButtonView);
  v8 = a4;
  v9 = self;
  objc_msgSend(v7, sel_frame);
  v13.x = x;
  v13.y = y;
  if (CGRectContainsPoint(v14, v13))
  {
    v12.receiver = v9;
    v12.super_class = (Class)type metadata accessor for SessionIntroSequenceView();
    v10 = -[SessionIntroSequenceView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v8, x, y);

  }
  else
  {

    v10 = 0;
  }
  return v10;
}

- (_TtC9SeymourUI24SessionIntroSequenceView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI24SessionIntroSequenceView *result;

  result = (_TtC9SeymourUI24SessionIntroSequenceView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_countdownView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_playButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_spinnerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_playPauseGestureRecognizer));
}

@end
