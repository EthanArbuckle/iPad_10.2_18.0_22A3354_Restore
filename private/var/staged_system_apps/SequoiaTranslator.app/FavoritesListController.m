@implementation FavoritesListController

- (void)viewDidLoad
{
  _TtC17SequoiaTranslator23FavoritesListController *v2;

  v2 = self;
  sub_1000C5DA0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC17SequoiaTranslator23FavoritesListController *v4;

  v4 = self;
  sub_1000C625C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FavoritesListController();
  v4 = (char *)v7.receiver;
  -[FavoritesListController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  v5 = OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController_favoriteTranslationsTipUpdates;
  v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController_favoriteTranslationsTipUpdates];
  if (v6)
  {
    swift_retain(*(_QWORD *)&v4[OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController_favoriteTranslationsTipUpdates]);
    Task.cancel()();
    swift_release(v6);
    v6 = *(_QWORD *)&v4[v5];
  }
  *(_QWORD *)&v4[v5] = 0;

  swift_release(v6);
}

- (_TtC17SequoiaTranslator23FavoritesListController)initWithCoder:(id)a3
{
  return (_TtC17SequoiaTranslator23FavoritesListController *)sub_1000C9698(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController_subscriptions));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController_favoriteTranslationsTipUpdates));
  sub_10002BA44(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController____lazy_storage___invalidateFavoriteTranslationsTip), *(_QWORD *)&self->super.store[OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController____lazy_storage___invalidateFavoriteTranslationsTip]);
  sub_1000C2688(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController____lazy_storage___favoritesResultsController));
  sub_1000C2688(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController____lazy_storage___recentsResultsController));
}

@end
