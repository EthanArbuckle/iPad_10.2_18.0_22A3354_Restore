@implementation DictionaryWordSelectionController

- (_TtC17SequoiaTranslator33DictionaryWordSelectionController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000ABB28();
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DictionaryWordSelectionController();
  v2 = v3.receiver;
  -[DictionaryWordSelectionController viewDidLoad](&v3, "viewDidLoad");
  sub_1000AA134();
  sub_1000AA450();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC17SequoiaTranslator33DictionaryWordSelectionController *v3;

  v3 = self;
  sub_1000ABCAC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC17SequoiaTranslator33DictionaryWordSelectionController *v4;

  v4 = self;
  sub_1000A9408(a3);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC17SequoiaTranslator33DictionaryWordSelectionController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1000AAC54((uint64_t)a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (_TtC17SequoiaTranslator33DictionaryWordSelectionController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17SequoiaTranslator33DictionaryWordSelectionController *result;

  v4 = a4;
  result = (_TtC17SequoiaTranslator33DictionaryWordSelectionController *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.DictionaryWordSelectionController", 51, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController____lazy_storage___cardCell));
  sub_10002BA44(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_translationAlternativeSelectedHandler), *(_QWORD *)&self->originalCardFrame[OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_translationAlternativeSelectedHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_dictionaryController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_translation));
  swift_bridgeObjectRelease(*(_QWORD *)&self->originalCardFrame[OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_word]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_cardBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_highlightedView));
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[DictionaryWordSelectionController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

@end
