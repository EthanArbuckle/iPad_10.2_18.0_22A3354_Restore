@implementation EpisodeDetailTranscriptViewController

- (_TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_C87F4();
}

- (void)dealloc
{
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v2;

  v2 = self;
  sub_BB758();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController____lazy_storage___timestampView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController_subscriptions));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController_lastSelectionStart));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController____lazy_storage___textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController____lazy_storage___textViewTapGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController_highlightedParagraphButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController____lazy_storage___representedFlowDestinations));
  swift_release(*(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController_rebuildMenuBar]);
}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v2;

  v2 = self;
  sub_BB924();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v4;

  v4 = self;
  sub_BC058(a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v4;

  v4 = self;
  sub_BCAE0(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_BCEB4(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_BCEB4(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, 2);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  -[EpisodeDetailTranscriptViewController viewDidDisappear:](&v9, "viewDidDisappear:", v3);
  v5 = (uint64_t *)(*(_QWORD *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController_viewModel]
                 + OBJC_IVAR____TtCC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController9ViewModel_menuBarProvider);
  v6 = *v5;
  if (*v5)
  {
    v7 = v5[1];
    ObjectType = swift_getObjectType();
    swift_unknownObjectRetain(v6);
    dispatch thunk of MenuBarProvider.menuBarPresenter.setter(0, 0, ObjectType, v7);

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (void)viewDidLayoutSubviews
{
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v2;

  v2 = self;
  sub_BCFFC();

}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v10;
  uint64_t v11;

  v5 = type metadata accessor for UIContentUnavailableConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = self;
  sub_BD310();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)copy:(id)a3
{
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v5;
  __n128 v6;
  uint64_t v7;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v7, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v8 = self;
  }
  sub_BDF38();

  sub_D1D4((uint64_t)v9, &qword_3D1A70);
}

- (void)highlightParagraph:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v6;

  v5 = a3;
  v6 = self;
  sub_BF09C(a3);

}

- (_TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.EpisodeDetailTranscriptViewController", 61, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v5;

  v4 = a3;
  v5 = self;
  sub_C272C((uint64_t)v4);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v5;

  v4 = a3;
  v5 = self;
  sub_C2B84((uint64_t)v4);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v17;
  id v18;
  NSURL *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  Class isa;
  uint64_t v25;

  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4, v12);
  if (!a6)
  {
    v15 = (void *)objc_opt_self(UIApplication);
    v16 = a3;
    v17 = self;
    v18 = objc_msgSend(v15, "sharedApplication");
    URL._bridgeToObjectiveC()(v19);
    v21 = v20;
    v22 = sub_D4A3C((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_239FC(&qword_3D0410, 255, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_2EF6A0);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v18, "openURL:options:completionHandler:", v21, isa, 0, swift_bridgeObjectRelease(v22).n128_f64[0]);

  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  return a6 != 0;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v5;

  v4 = a3;
  v5 = self;
  sub_C2E54(v4);

}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v13;
  Class v14;

  length = a4.length;
  location = a4.location;
  v10 = sub_E710(0, (unint64_t *)&unk_3D4C80, UIMenuElement_ptr);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v10);
  v12 = a3;
  v13 = self;
  v14 = sub_C3510(v12, location, length, v11);

  swift_bridgeObjectRelease(v11);
  return v14;
}

- (void)buildMenuWithBuilder:(id)a3
{
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_C399C(a3);
  swift_unknownObjectRelease(a3);

}

- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4
{
  id v6;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v7;
  uint64_t v8;
  uint64_t v9;
  Class isa;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_C8A04();
  v9 = v8;

  swift_unknownObjectRelease(a4);
  sub_E710(0, (unint64_t *)&unk_3D4CD0, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (void)customCopyAction
{
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v2;

  v2 = self;
  sub_BDF38();

}

- (void)beginFindInteraction
{
  char *v2;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v3;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v4;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v5;

  v5 = self;
  v2 = sub_BB2FC();
  v3 = (_TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *)objc_msgSend(v2, "findInteraction");

  if (v3)
  {
    -[EpisodeDetailTranscriptViewController presentFindNavigatorShowingReplace:](v3, "presentFindNavigatorShowingReplace:", 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (void)presentTranslation
{
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v2;

  v2 = self;
  sub_C46CC();

}

- (void)keyboardWillShow:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v5;

  v4 = a3;
  v5 = self;
  sub_C498C(v4);

}

- (void)keyboardWillHide
{
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v2;
  char *v3;
  char *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char *v13;

  v2 = self;
  v3 = sub_BB2FC();
  objc_msgSend(v3, "setContentInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  v13 = sub_BB2FC();
  v4 = sub_BB2FC();
  objc_msgSend(v4, "contentInset");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v13, "setScrollIndicatorInsets:", v6, v8, v10, v12);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_C9104(v6);

  return v9;
}

@end
