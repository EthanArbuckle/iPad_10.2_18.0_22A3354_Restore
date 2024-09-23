@implementation LanguagesViewController

- (_TtC13TranslationUI23LanguagesViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC13TranslationUI23LanguagesViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_segmentedControl) = 0;
  v5 = OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_selectionModel;
  type metadata accessor for LanguageSelectionModel();
  swift_allocObject();
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1D2CFC920();
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_subscriptions) = (Class)MEMORY[0x1E0DEE9D8];

  result = (_TtC13TranslationUI23LanguagesViewController *)sub_1D2D9E394();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC13TranslationUI23LanguagesViewController *v2;

  v2 = self;
  sub_1D2D1EDF8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC13TranslationUI23LanguagesViewController *v4;

  v4 = self;
  sub_1D2D1F9E4(a3);

}

- (void)updateSelectedTarget
{
  _TtC13TranslationUI23LanguagesViewController *v2;

  v2 = self;
  sub_1D2D20974();

}

- (void)closeActionWithSender:(id)a3
{
  _TtC13TranslationUI23LanguagesViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1D2D9E214();
  swift_unknownObjectRelease();
  -[LanguagesViewController dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC13TranslationUI23LanguagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13TranslationUI23LanguagesViewController *result;

  v4 = a4;
  result = (_TtC13TranslationUI23LanguagesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_segmentedControl));
  swift_release();
  sub_1D2D21940((uint64_t)self + OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_delegate);
  swift_bridgeObjectRelease();
}

@end
