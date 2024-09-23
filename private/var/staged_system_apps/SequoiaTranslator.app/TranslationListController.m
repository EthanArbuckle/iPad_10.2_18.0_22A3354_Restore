@implementation TranslationListController

- (_TtC17SequoiaTranslator25TranslationListController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001C9600();
}

- (void)loadView
{
  _TtC17SequoiaTranslator25TranslationListController *v2;

  v2 = self;
  sub_1001BCE04();

}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranslationListController();
  v2 = v3.receiver;
  -[TranslationListController viewDidLoad](&v3, "viewDidLoad");
  sub_1001BE720();
  sub_1001BF784(1);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC17SequoiaTranslator25TranslationListController *v4;

  v4 = self;
  sub_1001BCF84(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC17SequoiaTranslator25TranslationListController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1001BD0DC((uint64_t)a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranslationListController();
  v2 = v3.receiver;
  -[TranslationListController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_1001BD700();

}

- (_TtC17SequoiaTranslator25TranslationListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17SequoiaTranslator25TranslationListController *result;

  v4 = a4;
  result = (_TtC17SequoiaTranslator25TranslationListController *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.TranslationListController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_translationViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_observers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore));
  swift_bridgeObjectRelease(*(_QWORD *)&self->collectionView[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryTextView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->collectionView[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pendingDictionaryModeIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->collectionView[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_entryCardStaticIdentifier]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_bottomInsetReasonToHeightMap));
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v8;
  _TtC17SequoiaTranslator25TranslationListController *v9;

  v8 = a3;
  swift_unknownObjectRetain(a5);
  v9 = self;
  sub_1001C56F0(v8, a4, a5);

  swift_unknownObjectRelease(a5);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator25TranslationListController *v5;

  v4 = a3;
  v5 = self;
  sub_1001C9778();

}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator25TranslationListController *v5;

  v4 = a3;
  v5 = self;
  sub_1001C5EF0(v4);

}

@end
