@implementation BEExpandedContentPresenter

- (BEExpandedContentPresenter)init
{
  BEExpandedContentPresenter *result;

  result = (BEExpandedContentPresenter *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.ExpandedContentPresenter", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_7142C((uint64_t)self + OBJC_IVAR___BEExpandedContentPresenter_router);
  sub_34488((Class *)((char *)&self->super.isa + OBJC_IVAR___BEExpandedContentPresenter_bookEntity));
}

- (void)expandedContentViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  BEExpandedContentPresenter *v15;
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
  sub_71D5C((uint64_t)v12, (uint64_t)v15, (void (**)(_QWORD, _QWORD))v13);
  _Block_release(v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)expandedContentViewController:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  BEExpandedContentPresenter *v14;
  uint64_t v15;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  v14 = self;
  sub_71E70((uint64_t)v12, a5);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (BOOL)expandedContentViewController:(id)a3 handleInternalLoadRequest:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  BEExpandedContentPresenter *v12;
  uint64_t v14;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_71F30((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)expandedContentViewController:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  BEExpandedContentPresenter *v12;
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
  -[BEExpandedContentPresenter expandedContentViewController:handleInternalLoadRequest:](v12, "expandedContentViewController:handleInternalLoadRequest:", v11, v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)expandedContentViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  id v10;
  id v11;
  BEExpandedContentPresenter *v12;

  v8 = (uint64_t (*)(uint64_t))_Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_37CE28, 24);
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
  sub_720CC(v11, v8, v9);
  sub_7241C((uint64_t)v8, v9);

}

- (void)expandedContentViewDidDisappear:(id)a3
{
  id v4;
  BEExpandedContentPresenter *v5;

  v4 = a3;
  v5 = self;
  _s8BookEPUB24ExpandedContentPresenterC08expandedD16ViewDidDisappearyySo16UIViewControllerCF_0();

}

- (id)expandedContentViewController:(id)a3 stringForCopyFromString:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  BEExpandedContentPresenter *v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_722C4(v6, v8);
  v12 = v11;

  swift_bridgeObjectRelease(v8);
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  return v13;
}

- (void)expandedContentViewController:(id)a3 shareText:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  BEExpandedContentPresenter *v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = a3;
  v15 = self;
  ExpandedContentPresenter.expandedContentViewController(_:shareText:sourceRect:)(v14, v11, v13, x, y, width, height);

  swift_bridgeObjectRelease(v13);
}

@end
