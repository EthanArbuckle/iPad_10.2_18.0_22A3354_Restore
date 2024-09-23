@implementation PaperKitExtensionDocumentViewController

- (_TtC8PaperKit39PaperKitExtensionDocumentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized PaperKitExtensionDocumentViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC8PaperKit39PaperKitExtensionDocumentViewController *v2;

  v2 = self;
  PaperKitExtensionDocumentViewController.viewDidLoad()();

}

- (void)viewWillLayoutSubviews
{
  _TtC8PaperKit39PaperKitExtensionDocumentViewController *v2;

  v2 = self;
  PaperKitExtensionDocumentViewController.viewWillLayoutSubviews()();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaperKitExtensionDocumentViewController();
  v2 = v3.receiver;
  -[PaperKitExtensionDocumentViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  PaperKitExtensionDocumentViewController.adjustScaleAndInterpageSpacing()();

}

- (_TtC8PaperKit39PaperKitExtensionDocumentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8PaperKit39PaperKitExtensionDocumentViewController *result;

  v4 = a4;
  result = (_TtC8PaperKit39PaperKitExtensionDocumentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_inlineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_collapseThumbnailsConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_paperDocumentViewController));
  swift_release();
  swift_bridgeObjectRelease();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_delegate);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_liveStreamMessenger);
  swift_unknownObjectRelease();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_textualContextProvider);
  swift_unknownObjectWeakDestroy();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self+ OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_magicGenerativePlaygroundTokenProvider, &demangling cache variable for type metadata for MagicGenerativePlaygroundTokenProvider?);
}

@end
