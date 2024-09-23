@implementation BEFootnotePresenter

- (BEFootnotePresenter)init
{
  BEFootnotePresenter *result;

  result = (BEFootnotePresenter *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.FootnotePresenter", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_B760C((uint64_t)self + OBJC_IVAR___BEFootnotePresenter_router);
  sub_34488((Class *)((char *)&self->super.isa + OBJC_IVAR___BEFootnotePresenter_bookEntity));
}

- (void)footnoteViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  BEFootnotePresenter *v15;
  uint64_t v16;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v13);
  v14 = a3;
  v15 = self;
  sub_B7EA4((uint64_t)v12, (uint64_t)v15, (void (**)(_QWORD, _QWORD))v13);
  _Block_release(v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)footnoteViewController:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  BEFootnotePresenter *v14;
  uint64_t v15;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  v14 = self;
  sub_B7FB8((uint64_t)v12, a5);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (BOOL)footnoteViewController:(id)a3 handleInternalLoadRequest:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  BEFootnotePresenter *v12;
  uint64_t v14;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_B8078((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)footnoteViewController:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  BEFootnotePresenter *v12;
  NSURL *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  URL._bridgeToObjectiveC()(v13);
  v15 = v14;
  -[BEFootnotePresenter footnoteViewController:handleInternalLoadRequest:](v12, "footnoteViewController:handleInternalLoadRequest:", v11, v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)footnoteViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  id v10;
  id v11;
  BEFootnotePresenter *v12;

  v8 = (uint64_t (*)(uint64_t))_Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_37ED58, 24);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = (uint64_t (*)(uint64_t))sub_6B3A0;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_B8214(v11, v8, v9);
  sub_7241C((uint64_t)v8, v9);

}

- (void)footnoteViewDidFinishLoad:(id)a3
{
  id v4;
  BEFootnotePresenter *v5;

  v4 = a3;
  v5 = self;
  FootnotePresenter.footnoteViewDidFinishLoad(_:)((uint64_t)v4);

}

- (void)footnoteViewDidDisappear:(id)a3
{
  id v4;
  BEFootnotePresenter *v5;

  v4 = a3;
  v5 = self;
  FootnotePresenter.footnoteViewDidDisappear(_:)((UIViewController)v4);

}

@end
