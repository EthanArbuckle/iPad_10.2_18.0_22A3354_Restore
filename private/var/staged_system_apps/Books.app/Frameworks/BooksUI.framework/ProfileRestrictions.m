@implementation ProfileRestrictions

- (_TtC7BooksUI19ProfileRestrictions)init
{
  return (_TtC7BooksUI19ProfileRestrictions *)ProfileRestrictions.init()();
}

- (void)dealloc
{
  void *v3;
  _TtC7BooksUI19ProfileRestrictions *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(BURestrictionsProvider);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedInstance");
  objc_msgSend(v5, "removeObserver:", v4);
  swift_unknownObjectRelease(v5);
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ProfileRestrictions(0);
  -[ProfileRestrictions dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC7BooksUI19ProfileRestrictions__isExplicitContentAllowed;
  v4 = sub_5440(&qword_26AEE8);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC7BooksUI19ProfileRestrictions__isBookStoreAllowed, v4);
  v5((char *)self + OBJC_IVAR____TtC7BooksUI19ProfileRestrictions__isAccountModificationAllowed, v4);
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
  sub_1AADE4(self, (uint64_t)a2, a3, (uint64_t)&unk_1F6A30, (uint64_t)&unk_1F6A58);
}

- (void)restrictionsForBookStoreAllowedChanged:(BOOL)a3
{
  sub_1AADE4(self, (uint64_t)a2, a3, (uint64_t)&unk_1F6A78, (uint64_t)&unk_1F6AA0);
}

- (void)restrictionsForAccountModificationAllowedChanged:(BOOL)a3
{
  sub_1AADE4(self, (uint64_t)a2, a3, (uint64_t)&unk_1F6AC0, (uint64_t)&unk_1F6AE8);
}

@end
