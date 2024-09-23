@implementation TTRIRemindersListBackgroundView

- (_TtC9Reminders31TTRIRemindersListBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders31TTRIRemindersListBackgroundView *)sub_1004683B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC9Reminders31TTRIRemindersListBackgroundView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders31TTRIRemindersListBackgroundView *)sub_1004685CC(v3, v4);
}

- (void)tapGestureAction:(id)a3
{
  _TtC9Reminders31TTRIRemindersListBackgroundView *v5;
  _TtC9Reminders31TTRIRemindersListBackgroundView *v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  void (*v14)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, __n128);
  __n128 v15;
  _OWORD v16[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v16);
    swift_unknownObjectRelease(a3);
    if (UIAccessibilityIsVoiceOverRunning())
      goto LABEL_7;
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v6 = self;
    if (UIAccessibilityIsVoiceOverRunning())
    {
LABEL_7:

      goto LABEL_8;
    }
  }
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders31TTRIRemindersListBackgroundView_delegate);
  if (!Strong)
    goto LABEL_7;
  v9 = Strong;
  v10 = *(_QWORD *)(Strong + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_presenter);
  v11 = *(_QWORD *)(v10 + 48);
  v12 = *(_QWORD *)(v10 + 64);
  ObjectType = swift_getObjectType(v11, v8);
  v14 = *(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, __n128))(v12 + 296);
  v15 = swift_unknownObjectRetain(v11);
  v14(1, 0, 0, ObjectType, v12, v15);

  swift_unknownObjectRelease(v9);
  swift_unknownObjectRelease(v11);
LABEL_8:
  sub_10002CAA0((uint64_t)v16);
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders31TTRIRemindersListBackgroundView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIRemindersListBackgroundView_scribbleInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIRemindersListBackgroundView_scribbleElementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIRemindersListBackgroundView_ovalLayer));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return objc_msgSend(a4, "type", a3) != (id)2;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  void (**v7)(void *, Class, uint64_t);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  Class isa;
  _TtC9Reminders31TTRIRemindersListBackgroundView *v14;
  uint64_t v15;

  v7 = (void (**)(void *, Class, uint64_t))_Block_copy(a5);
  v8 = sub_10002A750((uint64_t *)&unk_1006415A0);
  v9 = swift_allocObject(v8, 40, 7);
  *(_OWORD *)(v9 + 16) = xmmword_100521140;
  v10 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC9Reminders31TTRIRemindersListBackgroundView_scribbleElementIdentifier);
  *(_QWORD *)(v9 + 32) = v10;
  v15 = v9;
  specialized Array._endMutation()(v9);
  v11 = a3;
  v14 = self;
  v12 = NSNotFound.getter(v10);
  sub_10002A750(&qword_100660600);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v7[2](v7, isa, v12);
  swift_bridgeObjectRelease(v15);

  _Block_release(v7);
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v6;
  _TtC9Reminders31TTRIRemindersListBackgroundView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100468B4C((uint64_t)a4);
  v10 = v9;
  v12 = v11;
  v14 = v13;

  swift_unknownObjectRelease(a4);
  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  void *v9;
  id v10;
  _TtC9Reminders31TTRIRemindersListBackgroundView *v11;

  v9 = _Block_copy(a6);
  _Block_copy(v9);
  v10 = a3;
  swift_unknownObjectRetain(a4);
  v11 = self;
  sub_100468C30((uint64_t)a4, (uint64_t)v11, (void (**)(_QWORD, _QWORD))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_unknownObjectRelease(a4);
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  sub_100468A84((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, unint64_t))sub_100255E4C);
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  sub_100468A84((char *)self, (uint64_t)a2, a3, (uint64_t)a4, sub_100256510);
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 0;
}

@end
