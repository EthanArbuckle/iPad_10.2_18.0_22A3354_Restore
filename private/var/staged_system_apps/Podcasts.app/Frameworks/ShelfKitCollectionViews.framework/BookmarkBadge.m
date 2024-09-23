@implementation BookmarkBadge

- (_TtC23ShelfKitCollectionViews13BookmarkBadge)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews13BookmarkBadge *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13BookmarkBadge_bookmarkButtonPresenter) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews13BookmarkBadge *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/BookmarkBadge.swift", 43, 2, 34, 0);
  __break(1u);
  return result;
}

- (void)primaryActionTriggered
{
  uint64_t v2;
  _TtC23ShelfKitCollectionViews13BookmarkBadge *v3;
  __n128 v4;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews13BookmarkBadge_bookmarkButtonPresenter);
  if (v2)
  {
    v3 = self;
    v4 = swift_retain(v2);
    dispatch thunk of BookmarkButtonPresenter.performPrimaryAction()(v4);

    swift_release(v2);
  }
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13BookmarkBadge_bookmarkButtonPresenter));
  sub_2A2428((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews13BookmarkBadge_iconsSet);
}

@end
