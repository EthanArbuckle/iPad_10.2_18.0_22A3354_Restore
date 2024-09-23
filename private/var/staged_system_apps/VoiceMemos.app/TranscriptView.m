@implementation TranscriptView

- (_TtC10VoiceMemos14TranscriptView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000F1D98();
}

- (void)didMoveToSuperview
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TranscriptView(0);
  v2 = (char *)v4.receiver;
  -[TranscriptView didMoveToSuperview](&v4, "didMoveToSuperview");
  v3 = objc_msgSend(v2, "superview", v4.receiver, v4.super_class);

  if (!v3)
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textView], "setSelectedRange:", 0, 0);

}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranscriptView(0);
  v2 = v3.receiver;
  -[TranscriptView layoutSubviews](&v3, "layoutSubviews");
  sub_1000EE384();

}

- (void)didReceiveTap:(id)a3
{
  id v4;
  _TtC10VoiceMemos14TranscriptView *v5;

  v4 = a3;
  v5 = self;
  sub_1000EF754(v4);

}

- (void)didReceivePan:(id)a3
{
  id v4;
  _TtC10VoiceMemos14TranscriptView *v5;

  v4 = a3;
  v5 = self;
  sub_1000EF940(v4);

}

- (void)searchButtonTapped
{
  void *v2;
  _TtC10VoiceMemos14TranscriptView *v3;
  _TtC10VoiceMemos14TranscriptView *v4;
  _TtC10VoiceMemos14TranscriptView *v5;
  _TtC10VoiceMemos14TranscriptView *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textView);
  v6 = self;
  v3 = (_TtC10VoiceMemos14TranscriptView *)objc_msgSend(v2, "findInteraction");
  if (v3)
  {
    v4 = v3;
    -[TranscriptView presentFindNavigatorShowingReplace:](v3, "presentFindNavigatorShowingReplace:", 0);

    v5 = v4;
  }
  else
  {
    v5 = v6;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC10VoiceMemos14TranscriptView *v5;

  v4 = a3;
  v5 = self;
  sub_1000F0300();

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _TtC10VoiceMemos14TranscriptView *v10;

  v4 = a3;
  v10 = self;
  v5 = objc_msgSend(v4, "panGestureRecognizer");
  objc_msgSend(v5, "velocityInView:", v4);
  v7 = v6;
  v9 = v8;

  sub_10001B474((Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_controller), *(_QWORD *)&v10->controller[OBJC_IVAR____TtC10VoiceMemos14TranscriptView_controller + 16]);
  sub_1000FB25C(v7, v9);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC10VoiceMemos14TranscriptView *v6;

  v5 = a3;
  v6 = self;
  sub_1000F1FAC();

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_animatedContentOffsetTarget;
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;
}

- (void)textView:(id)a3 willPresentEditMenuWithAnimator:(id)a4
{
  sub_1000F0A88(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1000F20F4);
}

- (void)textView:(id)a3 willDismissEditMenuWithAnimator:(id)a4
{
  sub_1000F0A88(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1000F2240);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC10VoiceMemos14TranscriptView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1000F0AEC(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC10VoiceMemos14TranscriptView *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1000F0C28(v6, (uint64_t)v7);

  return v9;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC10VoiceMemos14TranscriptView *v7;
  uint64_t v8;
  _TtC10VoiceMemos14TranscriptView *v9;
  unsigned __int8 v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_1000F0D78((uint64_t)a3, (uint64_t)v12);

  sub_100005440((uint64_t)v12, &qword_1001EA0E0);
  return v10 & 1;
}

- (void)selectAll:(id)a3
{
  _TtC10VoiceMemos14TranscriptView *v5;
  uint64_t v6;
  _TtC10VoiceMemos14TranscriptView *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_1000F0FF4((uint64_t)v8);

  sub_100005440((uint64_t)v8, &qword_1001EA0E0);
}

- (_TtC10VoiceMemos14TranscriptView)initWithFrame:(CGRect)a3
{
  sub_1000F116C((uint64_t)self, (uint64_t)a2, (uint64_t)"VoiceMemos.TranscriptView", 25);
}

- (void).cxx_destruct
{
  sub_1000AD368((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_viewModel);
  sub_10001B498((Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_controller));

  sub_1000F2388((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_layoutHelper);
  sub_1000A3170((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textUpdateHelper);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textBottomAnchorToLayoutMarginsBottomAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textBottomAnchorToSearchTopAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textViewTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textViewPanGestureRecognizer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_cancellables));
}

@end
