@implementation ICSearchSuggestionController

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___ICSearchSuggestionController_collectionView));
}

- (ICSearchSuggestionController)initWithParentView:(id)a3 delegate:(id)a4
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain(a4);
  return (ICSearchSuggestionController *)sub_100225B08(v5, (uint64_t)a4);
}

- (void)showWithAnimated:(BOOL)a3 transitionCoordinator:(id)a4 searchBarFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v12;
  ICSearchSuggestionController *v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  swift_unknownObjectRetain(a4);
  v13 = self;
  sub_100226554(a3, a4, x, y, width, height);
  swift_unknownObjectRelease(a4, v12);

}

- (void)updateForSuggestions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  ICSearchSuggestionController *v11;
  uint64_t v12;

  v5 = sub_100012E18((uint64_t *)&unk_1005D5040);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000163BC(0, (unint64_t *)&unk_1005D7350, ICSearchSuggestion_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  v11 = self;
  sub_100226334(v10, 0);
  dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)(v8, 0, 0, 0);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  swift_bridgeObjectRelease(v10);
}

- (void)hide
{
  void *v2;
  id v3;
  id v4;
  id v5;
  ICSearchSuggestionController *v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSearchSuggestionController_collectionView);
  v6 = self;
  v3 = objc_msgSend(v2, "superview");
  if (v3)
  {
    v4 = v3;
    v5 = *(Class *)((char *)&v6->super.isa + OBJC_IVAR___ICSearchSuggestionController_parentView);

    if (v4 == v5)
    {
      objc_msgSend(v2, "setHidden:", 1);
      objc_msgSend(v2, "removeFromSuperview");
    }
  }

}

- (ICSearchSuggestionController)init
{
  ICSearchSuggestionController *result;

  result = (ICSearchSuggestionController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.SearchSuggestionController", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSearchSuggestionController_delegate), v3);
}

- (uint64_t)collectionView:(void *)a3 canFocusItemAtIndexPath:(uint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a1;
  LOBYTE(a1) = sub_100226F38();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return a1 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  ICSearchSuggestionController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100226DA0(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
