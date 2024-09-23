@implementation UrlActivityItemProvider

- (id)item
{
  return sub_1F6020(self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr))sub_1F5C20);
}

- (_TtC23ShelfKitCollectionViews23UrlActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  sub_1F61BC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)"ShelfKitCollectionViews.UrlActivityItemProvider", 47);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23UrlActivityItemProvider_url;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_E8C08((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23UrlActivityItemProvider_shortUrl);
}

@end
