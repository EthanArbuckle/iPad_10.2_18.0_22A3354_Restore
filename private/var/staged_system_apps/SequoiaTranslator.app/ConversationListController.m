@implementation ConversationListController

- (_TtC17SequoiaTranslator26ConversationListController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000755A8();
}

- (void)viewDidLoad
{
  _TtC17SequoiaTranslator26ConversationListController *v2;

  v2 = self;
  sub_1000726DC();

}

- (void)dismissKeyboard
{
  _TtC17SequoiaTranslator26ConversationListController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[ConversationListController view](v2, "view");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "endEditing:", 1);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC17SequoiaTranslator26ConversationListController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC17SequoiaTranslator26ConversationListController *result;

  v3 = a3;
  result = (_TtC17SequoiaTranslator26ConversationListController *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.ConversationListController", 44, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC17SequoiaTranslator26ConversationListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17SequoiaTranslator26ConversationListController *result;

  v4 = a4;
  result = (_TtC17SequoiaTranslator26ConversationListController *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.ConversationListController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator26ConversationListController_dataSource));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator26ConversationListController_observers));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator26ConversationListController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator26ConversationListController____lazy_storage___bottomSeparatorLine));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator26ConversationListController *v5;

  v4 = a3;
  v5 = self;
  sub_100074238(v4);

}

@end
