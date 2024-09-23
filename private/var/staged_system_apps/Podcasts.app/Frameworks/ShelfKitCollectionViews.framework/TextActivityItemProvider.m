@implementation TextActivityItemProvider

- (id)item
{
  return sub_1F6020(self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr))sub_1F6080);
}

- (_TtC23ShelfKitCollectionViews24TextActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  sub_1F61BC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)"ShelfKitCollectionViews.TextActivityItemProvider", 48);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->context[OBJC_IVAR____TtC23ShelfKitCollectionViews24TextActivityItemProvider_text]);
}

@end
