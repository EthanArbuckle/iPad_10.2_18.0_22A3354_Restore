@implementation PlaceNoteEditViewController

- (id)dismissHandler
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];
  _BYTE v7[24];

  v2 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_dismissHandler);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_dismissHandler, v7, 0, 0);
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001A8380;
  aBlock[3] = &unk_1011A8A30;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setDismissHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_1011A8A18, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1001272E4;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_dismissHandler);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10000BF74(v7, v8);
}

- (_TtC4Maps27PlaceNoteEditViewController)initWithNote:(id)a3
{
  uint64_t v3;
  unint64_t v4;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC4Maps27PlaceNoteEditViewController *)PlaceNoteEditViewController.init(note:)(v3, v4);
}

- (_TtC4Maps27PlaceNoteEditViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001AA43C();
}

- (void)viewDidLoad
{
  _TtC4Maps27PlaceNoteEditViewController *v2;

  v2 = self;
  PlaceNoteEditViewController.viewDidLoad()();

}

- (void)cancelTapped
{
  char *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  uint64_t v5;
  _TtC4Maps27PlaceNoteEditViewController *v6;
  _BYTE v7[24];

  v3 = (char *)self + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_dismissHandler;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_dismissHandler, v7, 0, 0);
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))v3;
  if (*(_QWORD *)v3)
  {
    v5 = *((_QWORD *)v3 + 1);
    v6 = self;
    sub_10000C128((uint64_t)v4, v5);
    v4(0, 0, 0);
    sub_10000BF74((uint64_t)v4, v5);

  }
}

- (void)doneTapped
{
  _TtC4Maps27PlaceNoteEditViewController *v2;

  v2 = self;
  sub_1001AA018();

}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  int64_t location;
  id v7;
  _TtC4Maps27PlaceNoteEditViewController *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  location = a4.location;
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v7, "text");
  if (v9)
  {
    v10 = v9;
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v13 = v12;

    v14 = String.count.getter(v11, v13);
    swift_bridgeObjectRelease(v13);
    if (location > 10000 && v14 >= 10001)
      return 0;
  }
  else
  {

  }
  return 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _TtC4Maps27PlaceNoteEditViewController *v12;

  v4 = a3;
  v12 = self;
  v5 = objc_msgSend(v4, "text");
  if (v5)
  {
    v6 = v5;
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = (uint64_t *)((char *)v12 + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_note);
  v11 = *(uint64_t *)((char *)&v12->super._cardPresentationController
                   + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_note);
  *v10 = v7;
  v10[1] = v9;
  swift_bridgeObjectRelease(v11);
  sub_1001A8448();

}

- (_TtC4Maps27PlaceNoteEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC4Maps27PlaceNoteEditViewController *result;

  v4 = a4;
  result = (_TtC4Maps27PlaceNoteEditViewController *)_swift_stdlib_reportUnimplementedInitializer("Maps.PlaceNoteEditViewController", 32, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(CardPresentationController **)((char *)&self->super._cardPresentationController
                                                           + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_originalNote));
  swift_bridgeObjectRelease(*(CardPresentationController **)((char *)&self->super._cardPresentationController
                                                           + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_note));
  sub_10000BF74(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_dismissHandler), *(uint64_t *)((char *)&self->super._cardPresentationController+ OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_dismissHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController____lazy_storage___modalHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController____lazy_storage___textContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController____lazy_storage___textView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_deleteSectionView));
}

@end
