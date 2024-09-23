@implementation TranscriptViewController

- (_TtC12NowPlayingUI24TranscriptViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_8E374();
}

- (void)viewDidLoad
{
  _TtC12NowPlayingUI24TranscriptViewController *v2;

  v2 = self;
  sub_7B798();

}

- (void)viewWillLayoutSubviews
{
  _TtC12NowPlayingUI24TranscriptViewController *v2;

  v2 = self;
  sub_7E344();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[TranscriptViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_7F044();
  sub_7F690(2u);
  sub_7FE3C();

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12NowPlayingUI24TranscriptViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for UIContentUnavailableConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_805F0();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC12NowPlayingUI24TranscriptViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NowPlayingUI24TranscriptViewController *result;

  v4 = a4;
  result = (_TtC12NowPlayingUI24TranscriptViewController *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.TranscriptViewController", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___collectionViewWrapper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___searchButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___topGradientMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___topGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___bottomGradientMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___bottomGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_searchQueue));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_playTask));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_transcriptSyncingStateObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_networkObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_retrySubject));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_objectGraph));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_player));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_metricsController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_playbackController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_session));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_nowPlayingViewModel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_alignmentCoordinator));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_libraryActionController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_playerStylePublisher));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_storeTranscriptIdentifierProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_presentationContext));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_subscriptions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_searchSubscriptions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController_viewModels));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___stateMachine));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___timestampView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___collectionViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___findInteraction));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24TranscriptViewController____lazy_storage___liveObserver));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12NowPlayingUI24TranscriptViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_84C80(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12NowPlayingUI24TranscriptViewController *v12;
  __n128 v13;
  uint64_t v14;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  if ((static Podcasts.isBlueMoonEnabled()(v12) & 1) != 0)
  {

  }
  else
  {
    v14 = sub_7DB20();
    *(_BYTE *)(v14 + 16) = 0;
    sub_C3EE8();

    v13 = swift_release(v14);
  }
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v13);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12NowPlayingUI24TranscriptViewController *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __n128 v16;
  BOOL v17;
  BOOL v18;
  uint64_t v20;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_7B32C();
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)(v13 + 16);

    v16 = swift_release(v14);
    if (v15 >> 62)
      v17 = v15 >> 62 == 3;
    else
      v17 = 1;
    v18 = v17;
  }
  else
  {

    v18 = 0;
  }
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v18;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC12NowPlayingUI24TranscriptViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_8F64C(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC12NowPlayingUI24TranscriptViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_8F844();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4;
  _TtC12NowPlayingUI24TranscriptViewController *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_7DB20();
  *(_BYTE *)(v6 + 16) = 3;
  sub_C3EE8();

  swift_release(v6);
  return 1;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4;
  _TtC12NowPlayingUI24TranscriptViewController *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_7DB20();
  *(_BYTE *)(v6 + 16) = 12;
  sub_C3EE8();

  swift_release(v6);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC12NowPlayingUI24TranscriptViewController *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_7DB20();
  *(_BYTE *)(v6 + 16) = 3;
  sub_C3EE8();

  swift_release(v6);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v8;
  _TtC12NowPlayingUI24TranscriptViewController *v9;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v9 = self;
  sub_8F990(x, y);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC12NowPlayingUI24TranscriptViewController *v6;
  uint64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_7DB20();
  *(_BYTE *)(v7 + 16) = 12;
  sub_C3EE8();

  swift_release(v7);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC12NowPlayingUI24TranscriptViewController *v5;

  v4 = a3;
  v5 = self;
  sub_85FC4(v4);

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC12NowPlayingUI24TranscriptViewController *v11;
  id v12;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = self;
  v12 = sub_8F9E0(v10, v9);

  swift_bridgeObjectRelease(v9);
  return v12;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC12NowPlayingUI24TranscriptViewController *v10;
  uint64_t v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  v11 = sub_7DB20();
  *(_BYTE *)(v11 + 16) = 8;
  sub_C3EE8();

  swift_unknownObjectRelease(a5);
  swift_release(v11);
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC12NowPlayingUI24TranscriptViewController *v10;
  uint64_t v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  v11 = sub_7DB20();
  *(_BYTE *)(v11 + 16) = 9;
  sub_C3EE8();

  swift_unknownObjectRelease(a5);
  swift_release(v11);
}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;

  ObjectType = swift_getObjectType(self);
  sub_F174(0, &qword_1FDF20, UITextSearchingFindSession_ptr);
  v7 = sub_3F28C(&qword_1FDF28, v6, (uint64_t (*)(uint64_t))type metadata accessor for TranscriptViewController, (uint64_t)&unk_16AC1C);
  return (id)UITextSearchingFindSession.init<A>(searchableObject:)(self, ObjectType, v7);
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI24TranscriptViewController *v8;
  uint64_t v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_7DB20();
  *(_BYTE *)(v9 + 16) = 7;
  sub_C3EE8();

  swift_release(v9);
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI24TranscriptViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_8FF84(v6);

}

- (void)commandFKeyboardSearch
{
  id v2;
  void *v3;
  id v4;
  _TtC12NowPlayingUI24TranscriptViewController *v5;

  v5 = self;
  v2 = -[TranscriptViewController view](v5, "view");
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "becomeFirstResponder");

    v4 = sub_7BB14();
    objc_msgSend(v4, "presentFindNavigatorShowingReplace:", 0);

    sub_88DD8();
  }
  else
  {
    __break(1u);
  }
}

- (NSArray)keyCommands
{
  uint64_t v3;
  uint64_t v4;
  _TtC12NowPlayingUI24TranscriptViewController *v5;
  NSString v6;
  id v7;
  uint64_t v8;
  Class isa;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1FC7D0);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_16B2D0;
  v5 = self;
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend((id)objc_opt_self(UIKeyCommand), "keyCommandWithInput:modifierFlags:action:", v6, 0x100000, "commandFKeyboardSearch");

  *(_QWORD *)(v4 + 32) = v7;
  specialized Array._endMutation()(v8);

  sub_F174(0, &qword_1FDF18, UIKeyCommand_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (void)didTapEmptySpace
{
  _TtC12NowPlayingUI24TranscriptViewController *v2;
  uint64_t v3;

  v2 = self;
  v3 = sub_7DB20();
  *(_BYTE *)(v3 + 16) = 10;
  sub_C3EE8();

  swift_release(v3);
}

@end
