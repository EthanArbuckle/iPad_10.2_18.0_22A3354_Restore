@implementation ContentLoader

- (void)dealloc
{
  _TtC8BookEPUB13ContentLoader *v2;

  v2 = self;
  ContentLoader.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_loaderID;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_signposter;
  v6 = type metadata accessor for OSSignposter(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_signpostID;
  v8 = type metadata accessor for OSSignpostID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8BookEPUB13ContentLoader_pendingLayoutUpdates));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookEPUB13ContentLoader_currentLayoutProvider));
  v9 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader__document;
  v10 = sub_319AC(&qword_3B89C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader__contentView;
  v12 = sub_319AC(&qword_3B89D8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  sub_52128((uint64_t)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_contentViewHost, &qword_3B89A0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookEPUB13ContentLoader_axKeyUpdates));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8BookEPUB13ContentLoader____lazy_storage___accessoryPageView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8BookEPUB13ContentLoader____lazy_storage___accessoryScrollView));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookEPUB13ContentLoader_cancellables));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_contentMediator);
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_paginatingService);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_stylesheetProvider);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_contentLoaderViewReusePool);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookEPUB13ContentLoader_pageLayers));
  v13 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_log;
  v14 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);

}

- (_TtC8BookEPUB13ContentLoader)init
{
  _TtC8BookEPUB13ContentLoader *result;

  result = (_TtC8BookEPUB13ContentLoader *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.ContentLoader", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8BookEPUB13ContentLoader *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_74DFC();
  objc_msgSend(v4, "contentOffset");
  objc_msgSend(v6, "setContentOffset:");

}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v7;
  id v8;
  _TtC8BookEPUB13ContentLoader *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_74DFC();
  objc_msgSend(v7, "contentOffset");
  objc_msgSend(v10, "setContentOffset:");

}

- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8BookEPUB13ContentLoader *v12;
  uint64_t v14;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_86CE4((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)navigationHandler:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
  sub_85890(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_86F9C);
}

- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC8BookEPUB13ContentLoader *v14;
  uint64_t v15;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  v14 = self;
  sub_87050((uint64_t)v12, a5);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  _TtC8BookEPUB13ContentLoader *v15;
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
  sub_87120((uint64_t)v12, (uint64_t)v15, (void (**)(_QWORD, _QWORD))v13);
  _Block_release(v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)navigationHandlerWebContentProcessFailedWithNoURL:(id)a3
{
  id v4;
  _TtC8BookEPUB13ContentLoader *v5;

  v4 = a3;
  v5 = self;
  _s8BookEPUB13ContentLoaderC020navigationHandlerWebC22ProcessFailedWithNoURLyySo9WKWebViewCF_0(v4);

}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC8BookEPUB13ContentLoader *v16;
  uint64_t v17;

  v9 = sub_319AC((uint64_t *)&unk_3B8C50);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  v15 = a5;
  v16 = self;
  sub_87268((uint64_t)v11, (uint64_t)a5);

  sub_52128((uint64_t)v11, (uint64_t *)&unk_3B8C50);
}

- (void)navigationHandlerWebContentLoadFailed:(id)a3 reason:(id)a4
{
  id v6;
  _TtC8BookEPUB13ContentLoader *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_875FC((uint64_t)a4);

}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  sub_85890(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_8770C);
}

- (void)navigationHandlerWebContentProcessAttemptingReload:(id)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8BookEPUB13ContentLoader_attemptingReload) = 1;
}

- (NSString)description
{
  _TtC8BookEPUB13ContentLoader *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  ContentLoader.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)setIgnorePageTurnGestures:(BOOL)a3
{
  _TtC8BookEPUB13ContentLoader *v4;

  v4 = self;
  ContentLoader.setIgnorePageTurnGestures(_:)(a3);

}

- (void)adjustGesturesForTextInteractionAssistant:(id)a3 view:(id)a4
{
  id v6;
  id v7;
  _TtC8BookEPUB13ContentLoader *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  ContentLoader.adjustGestures(for:view:)(v6, v7);

}

- (void)handleStylusGesture:(id)a3
{
  id v4;
  _TtC8BookEPUB13ContentLoader *v5;

  v4 = a3;
  v5 = self;
  sub_944BC(v4);

}

- (void)stylusTimerFired:(id)a3
{
  id v4;
  _TtC8BookEPUB13ContentLoader *v5;

  v4 = a3;
  v5 = self;
  sub_955A0();

}

- (void)handleLoupeGesture:(id)a3
{
  id v4;
  _TtC8BookEPUB13ContentLoader *v5;

  v4 = a3;
  v5 = self;
  sub_94B70(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC8BookEPUB13ContentLoader *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = ContentLoader.gestureRecognizer(_:shouldReceive:)((UIGestureRecognizer)v6, (UITouch)v7);

  return v9;
}

- (void)_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4
{
  double y;
  double x;
  uint64_t KeyPath;
  _TtC8BookEPUB13ContentLoader *v9;
  _TtC8BookEPUB13ContentLoader *v10;
  uint64_t v11;
  void *v12;
  _TtC8BookEPUB13ContentLoader *v13;

  y = a4.y;
  x = a4.x;
  KeyPath = swift_getKeyPath(&unk_2E85B8);
  swift_getKeyPath(&unk_2E85E0);
  v9 = self;
  static Published.subscript.getter(&v13, v9, KeyPath);
  swift_release();
  swift_release();
  v10 = v13;
  if (v13)
  {
    v11 = objc_opt_self(WKWebView);
    v12 = (void *)swift_dynamicCastObjCClass(v10, v11);
    if (v12)
      sub_945D0(a3, v12, 1, x, y);

    v9 = v10;
  }

}

@end
