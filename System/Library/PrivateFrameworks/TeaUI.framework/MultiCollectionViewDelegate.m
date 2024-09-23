@implementation MultiCollectionViewDelegate

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI27MultiCollectionViewDelegate *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  MultiCollectionViewDelegate.scrollViewDidScroll(_:)(v4);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1B13F1760(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (void (*)(void *, id, uint64_t))MultiCollectionViewDelegate.collectionView(_:willDisplay:forItemAt:));
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  sub_1B13F164C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t)a6, (void (*)(id, id, uint64_t, uint64_t, char *))MultiCollectionViewDelegate.collectionView(_:willDisplaySupplementaryView:forElementKind:at:));
}

- (_TtC5TeaUI27MultiCollectionViewDelegate)init
{
  return (_TtC5TeaUI27MultiCollectionViewDelegate *)MultiCollectionViewDelegate.init()();
}

- (BOOL)respondsToSelector:(SEL)a3
{
  _TtC5TeaUI27MultiCollectionViewDelegate *v4;

  v4 = self;
  LOBYTE(a3) = MultiCollectionViewDelegate.responds(to:)((uint64_t)a3);

  return a3 & 1;
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  sub_1B13F164C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t)a6, (void (*)(id, id, uint64_t, uint64_t, char *))MultiCollectionViewDelegate.collectionView(_:didEndDisplayingSupplementaryView:forElementOfKind:at:));
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1B13F1760(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (void (*)(void *, id, uint64_t))MultiCollectionViewDelegate.collectionView(_:didEndDisplaying:forItemAt:));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_1B162C86C();
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
  UICollectionView *v4;
  _TtC5TeaUI27MultiCollectionViewDelegate *v5;

  v4 = (UICollectionView *)a3;
  v5 = self;
  MultiCollectionViewDelegate.collectionViewDidEndMultipleSelectionInteraction(_:)(v4);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sub_1B162C680();
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  sub_1B162C680();
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  sub_1B162C680();
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  sub_1B162C680();
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  sub_1B162C680();
}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  return sub_1B162C86C();
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return sub_1B162C86C();
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_1B162C86C();
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return sub_1B162C86C();
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return sub_1B162C86C();
}

- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  UICollectionView *v6;
  id v7;
  _TtC5TeaUI27MultiCollectionViewDelegate *v8;
  Swift::Bool v9;

  v6 = (UICollectionView *)a3;
  v7 = a4;
  v8 = self;
  v9 = MultiCollectionViewDelegate.collectionView(_:shouldUpdateFocusIn:)(v6, (UICollectionViewFocusUpdateContext)v7);

  return v9;
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  UICollectionView *v7;
  _TtC5TeaUI27MultiCollectionViewDelegate *v8;
  CGPoint v9;
  double v10;
  double v11;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = (UICollectionView *)a3;
  v8 = self;
  v9 = MultiCollectionViewDelegate.collectionView(_:targetContentOffsetForProposedContentOffset:)(v7, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

  v10 = v9.x;
  v11 = v9.y;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  sub_1B162CAB0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, MultiCollectionViewDelegate.collectionView(_:willDisplayContextMenu:animator:));
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  sub_1B162CAB0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, MultiCollectionViewDelegate.collectionView(_:willEndContextMenuInteraction:animator:));
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  UICollectionView *v6;
  id v7;
  _TtC5TeaUI27MultiCollectionViewDelegate *v8;
  void *v9;

  v6 = (UICollectionView *)a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)MultiCollectionViewDelegate.collectionView(_:previewForDismissingContextMenuWithConfiguration:)(v6, (UIContextMenuConfiguration)v7);

  return v9;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  UICollectionView *v6;
  id v7;
  _TtC5TeaUI27MultiCollectionViewDelegate *v8;
  void *v9;

  v6 = (UICollectionView *)a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)MultiCollectionViewDelegate.collectionView(_:previewForHighlightingContextMenuWithConfiguration:)(v6, (UIContextMenuConfiguration)v7);

  return v9;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  UICollectionView *v8;
  id v9;
  id v10;
  _TtC5TeaUI27MultiCollectionViewDelegate *v11;

  v8 = (UICollectionView *)a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  MultiCollectionViewDelegate.collectionView(_:didUpdateFocusIn:with:)(v8, (UICollectionViewFocusUpdateContext)v9, (UIFocusAnimationCoordinator)v10);

}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  _TtC5TeaUI27MultiCollectionViewDelegate *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  MultiCollectionViewDelegate.collectionView(_:willPerformPreviewActionForMenuWith:animator:)(v7);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC5TeaUI27MultiCollectionViewDelegate *v13;
  id v14;
  uint64_t v16;

  v7 = sub_1B16B7D60();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B7D0C();
  v12 = a3;
  v13 = self;
  v14 = MultiCollectionViewDelegate.collectionView(_:contextMenuConfigurationForItemAt:point:)();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC5TeaUI27MultiCollectionViewDelegate *v13;
  uint64_t v15;

  v7 = sub_1B16B7D60();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B7D0C();
  v12 = a3;
  swift_unknownObjectRetain();
  v13 = self;
  LOBYTE(self) = MultiCollectionViewDelegate.collectionView(_:shouldSpringLoadItemAt:with:)((uint64_t)v12, (uint64_t)v11);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return self & 1;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  _TtC5TeaUI27MultiCollectionViewDelegate *v25;
  void (*v26)(char *, uint64_t);
  void *v27;
  uint64_t v29;
  _TtC5TeaUI27MultiCollectionViewDelegate *v30;

  v30 = self;
  v7 = sub_1B16B7D60();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v29 - v14;
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)&v29 - v18;
  MEMORY[0x1E0C80A78](v20, v21);
  v23 = (char *)&v29 - v22;
  sub_1B16B7D0C();
  sub_1B16B7D0C();
  sub_1B16B7D0C();
  v24 = a3;
  v25 = v30;
  MultiCollectionViewDelegate.collectionView(_:targetIndexPathForMoveOfItemFromOriginalIndexPath:atCurrentIndexPath:toProposedIndexPath:)((uint64_t)v11, (uint64_t)v23);

  v26 = *(void (**)(char *, uint64_t))(v8 + 8);
  v26(v11, v7);
  v26(v15, v7);
  v26(v19, v7);
  v27 = (void *)sub_1B16B7CDC();
  v26(v23, v7);
  return v27;
}

- (id)collectionView:(id)a3 transitionLayoutForOldLayout:(id)a4 newLayout:(id)a5
{
  UICollectionView *v8;
  id v9;
  id v10;
  _TtC5TeaUI27MultiCollectionViewDelegate *v11;
  Class isa;

  v8 = (UICollectionView *)a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  isa = MultiCollectionViewDelegate.collectionView(_:transitionLayoutForOldLayout:newLayout:)(v8, (UICollectionViewLayout)v9, (UICollectionViewLayout)v10).super.super.isa;

  return isa;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC5TeaUI27MultiCollectionViewDelegate *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  sub_1B14107A8();
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  MultiCollectionViewDelegate.indexPathForPreferredFocusedView(in:)(v9, (uint64_t)v8);

  v11 = sub_1B16B7D60();
  v12 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v11) != 1)
  {
    v12 = (void *)sub_1B16B7CDC();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v8, v11);
  }
  return v12;
}

- (id)viewForZoomingInScrollView:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI27MultiCollectionViewDelegate *v5;
  UIView_optional *v6;
  void *v7;
  void *v8;

  v4 = (UIScrollView *)a3;
  v5 = self;
  MultiCollectionViewDelegate.viewForZooming(in:)(v6, v4);
  v8 = v7;

  return v8;
}

- (void)scrollViewDidZoom:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI27MultiCollectionViewDelegate *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  MultiCollectionViewDelegate.scrollViewDidZoom(_:)(v4);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI27MultiCollectionViewDelegate *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  MultiCollectionViewDelegate.scrollViewWillBeginDragging(_:)(v4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI27MultiCollectionViewDelegate *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  MultiCollectionViewDelegate.scrollViewDidEndDecelerating(_:)(v4);

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI27MultiCollectionViewDelegate *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  MultiCollectionViewDelegate.scrollViewWillBeginDecelerating(_:)(v4);

}

- (void)scrollViewDidScrollToTop:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI27MultiCollectionViewDelegate *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  MultiCollectionViewDelegate.scrollViewDidScrollToTop(_:)(v4);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI27MultiCollectionViewDelegate *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  MultiCollectionViewDelegate.scrollViewDidEndScrollingAnimation(_:)(v4);

}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI27MultiCollectionViewDelegate *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  MultiCollectionViewDelegate.scrollViewDidChangeAdjustedContentInset(_:)(v4);

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI27MultiCollectionViewDelegate *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  LOBYTE(self) = MultiCollectionViewDelegate.scrollViewShouldScrollToTop(_:)(v4);

  return self & 1;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  UIScrollView *v6;
  id v7;
  _TtC5TeaUI27MultiCollectionViewDelegate *v8;

  v6 = (UIScrollView *)a3;
  v7 = a4;
  v8 = self;
  MultiCollectionViewDelegate.scrollViewWillBeginZooming(_:with:)(v6, (UIView_optional *)a4);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  UIScrollView *v6;
  _TtC5TeaUI27MultiCollectionViewDelegate *v7;

  v6 = (UIScrollView *)a3;
  v7 = self;
  MultiCollectionViewDelegate.scrollViewDidEndDragging(_:willDecelerate:)(v6, a4);

}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v8;
  id v9;
  _TtC5TeaUI27MultiCollectionViewDelegate *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  MultiCollectionViewDelegate.scrollViewDidEndZooming(_:with:atScale:)(a5, (uint64_t)v8, a4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7;
  _TtC5TeaUI27MultiCollectionViewDelegate *v8;

  v7 = a3;
  v8 = self;
  MultiCollectionViewDelegate.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v7, (uint64_t)a5);

}

@end
