@implementation FavoritesDetailListController

- (_TtC17SequoiaTranslator29FavoritesDetailListController)initWithCoder:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator29FavoritesDetailListController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator29FavoritesDetailListController____lazy_storage___favoritesLocalePairResultsController) = (Class)1;
  v4 = a3;

  result = (_TtC17SequoiaTranslator29FavoritesDetailListController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001F88D0, "SequoiaTranslator/FavoritesDetailListController.swift", 53, 2, 28, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  NSString v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FavoritesDetailListController();
  v2 = v6.receiver;
  -[FavoritesCardListController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "navigationItem", v6.receiver, v6.super_class);
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setTitle:", v4);

  v5 = objc_msgSend(v2, "navigationItem");
  objc_msgSend(v5, "setLargeTitleDisplayMode:", 2);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.store[OBJC_IVAR____TtC17SequoiaTranslator29FavoritesDetailListController_displayLocalePairText]);
  sub_1000C2688(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC17SequoiaTranslator29FavoritesDetailListController____lazy_storage___favoritesLocalePairResultsController));
}

@end
