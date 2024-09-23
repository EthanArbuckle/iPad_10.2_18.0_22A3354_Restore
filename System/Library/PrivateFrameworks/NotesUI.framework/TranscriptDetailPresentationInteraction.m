@implementation TranscriptDetailPresentationInteraction

- (UIView)view
{
  return (UIView *)sub_1AC9EA30C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7NotesUI39TranscriptDetailPresentationInteraction_view);
}

- (void)setView:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC7NotesUI39TranscriptDetailPresentationInteraction_view);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)willMoveToView:(id)a3
{
  id v4;
  _TtC7NotesUI39TranscriptDetailPresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  sub_1AC9EE0AC();

}

- (void)didMoveToView:(id)a3
{
  id v5;
  _TtC7NotesUI39TranscriptDetailPresentationInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_1AC9E411C(a3);

}

- (void)tap:(id)a3
{
  id v4;
  _TtC7NotesUI39TranscriptDetailPresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, sel_state) == (id)3)
    sub_1AC9E449C();

}

- (void)pan:(id)a3
{
  id v4;
  _TtC7NotesUI39TranscriptDetailPresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, sel_state) == (id)1)
    sub_1AC9E449C();

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC7NotesUI39TranscriptDetailPresentationInteraction *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1AC9EE16C();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC7NotesUI39TranscriptDetailPresentationInteraction *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1AC9EE258();

  return v6;
}

- (_TtC7NotesUI39TranscriptDetailPresentationInteraction)init
{
  _TtC7NotesUI39TranscriptDetailPresentationInteraction *result;

  result = (_TtC7NotesUI39TranscriptDetailPresentationInteraction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1AC8FC3B8((uint64_t)self + OBJC_IVAR____TtC7NotesUI39TranscriptDetailPresentationInteraction_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NotesUI39TranscriptDetailPresentationInteraction_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NotesUI39TranscriptDetailPresentationInteraction_panGestureRecognizer));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC7NotesUI39TranscriptDetailPresentationInteraction *v5;
  char ShouldBeginySbSo09UIGestureH0CF_0;

  v4 = a3;
  v5 = self;
  ShouldBeginySbSo09UIGestureH0CF_0 = _s7NotesUI39TranscriptDetailPresentationInteractionC28gestureRecognizerShouldBeginySbSo09UIGestureH0CF_0(v4);

  return ShouldBeginySbSo09UIGestureH0CF_0 & 1;
}

@end
