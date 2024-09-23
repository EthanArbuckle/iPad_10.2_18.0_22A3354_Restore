@implementation ICTagContainerCell

- (BOOL)preservesSuperviewHorizontalLayoutMargins
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR___ICTagContainerCell_preservesSuperviewHorizontalLayoutMargins);
}

- (void)setPreservesSuperviewHorizontalLayoutMargins:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___ICTagContainerCell_preservesSuperviewHorizontalLayoutMargins) = a3;
  -[ICTagContainerCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                     + OBJC_IVAR___ICTagContainerCell_presentingViewController));
}

- (void)setPresentingViewController:(id)a3
{
  ICTagContainerCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_10022AA3C(a3, &OBJC_IVAR___ICTagContainerCell_presentingViewController, &OBJC_IVAR____TtC11MobileNotes17TagCollectionView_presentingViewController);

}

- (NSManagedObjectID)defaultAccountObjectID
{
  return (NSManagedObjectID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                      + OBJC_IVAR___ICTagContainerCell_defaultAccountObjectID));
}

- (void)setDefaultAccountObjectID:(id)a3
{
  ICTagContainerCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_10022AA3C(a3, &OBJC_IVAR___ICTagContainerCell_defaultAccountObjectID, &OBJC_IVAR____TtC11MobileNotes17TagCollectionView_defaultAccountObjectID);

}

- (BOOL)hasGroupInset
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_hasGroupInset);
}

- (void)setHasGroupInset:(BOOL)a3
{
  int v3;
  ICTagContainerCell *v4;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_hasGroupInset);
  *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_hasGroupInset) = a3;
  if (v3 != a3)
  {
    v4 = self;
    -[ICTagContainerCell setNeedsLayout](v4, "setNeedsLayout");
    -[ICTagContainerCell layoutIfNeeded](v4, "layoutIfNeeded");
    -[ICTagContainerCell setNeedsUpdateConfiguration](v4, "setNeedsUpdateConfiguration");

  }
}

- (BOOL)hasHorizontalScrolling
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR___ICTagContainerCell_hasHorizontalScrolling);
}

- (void)setHasHorizontalScrolling:(BOOL)a3
{
  int v3;
  ICTagContainerCell *v4;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.super.isa
       + OBJC_IVAR___ICTagContainerCell_hasHorizontalScrolling);
  *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_hasHorizontalScrolling) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_10022902C();

  }
}

- (BOOL)includesNewTagItem
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_includesNewTagItem);
}

- (void)setIncludesNewTagItem:(BOOL)a3
{
  sub_100229278(self, (uint64_t)a2, a3, &OBJC_IVAR___ICTagContainerCell_includesNewTagItem);
}

- (BOOL)includesAllTagsItem
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_includesAllTagsItem);
}

- (void)setIncludesAllTagsItem:(BOOL)a3
{
  sub_100229278(self, (uint64_t)a2, a3, &OBJC_IVAR___ICTagContainerCell_includesAllTagsItem);
}

- (BOOL)allowsExclusion
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_allowsExclusion);
}

- (void)setAllowsExclusion:(BOOL)a3
{
  sub_100229278(self, (uint64_t)a2, a3, &OBJC_IVAR___ICTagContainerCell_allowsExclusion);
}

- (id)selectionDidChange
{
  return sub_10015AC6C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICTagContainerCell_selectionDidChange, (uint64_t)sub_1002489AC, (uint64_t)&unk_10055FF20);
}

- (void)setSelectionDidChange:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t (**v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_10055FF08, 24, 7);
    v4[2] = v5;
    v6 = sub_10022AA34;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)(uint64_t))((char *)self + OBJC_IVAR___ICTagContainerCell_selectionDidChange);
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR___ICTagContainerCell_selectionDidChange);
  v8 = *(_QWORD *)&self->preservesSuperviewHorizontalLayoutMargins[OBJC_IVAR___ICTagContainerCell_selectionDidChange];
  *v7 = v6;
  v7[1] = (uint64_t (*)(uint64_t))v4;
  sub_100012C50(v9, v8);
}

- (id)dataDidChange
{
  return sub_10015AC6C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICTagContainerCell_dataDidChange, (uint64_t)sub_100206734, (uint64_t)&unk_10055FED0);
}

- (void)setDataDidChange:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_10055FEB8, 24, 7);
    v4[2] = v5;
    v6 = sub_10022AAC0;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___ICTagContainerCell_dataDidChange);
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_dataDidChange);
  v8 = *(_QWORD *)&self->preservesSuperviewHorizontalLayoutMargins[OBJC_IVAR___ICTagContainerCell_dataDidChange];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_100012C50(v9, v8);
}

- (BOOL)allowsContextualMenu
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_allowsContextualMenu);
}

- (void)setAllowsContextualMenu:(BOOL)a3
{
  uint64_t v4;
  ICTagContainerCell *v5;
  char *v6;

  v4 = OBJC_IVAR___ICTagContainerCell_allowsContextualMenu;
  *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_allowsContextualMenu) = a3;
  v5 = self;
  v6 = sub_100228DBC();
  v6[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_allowsContextualMenu] = *((_BYTE *)&self->super.super.super.super.super.super.isa
                                                                              + v4);

}

- (void)deselectAllItemsAnimated:(BOOL)a3
{
  ICTagContainerCell *v4;

  v4 = self;
  sub_100229420(a3);

}

- (void)reloadTagsWithAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  ICTagContainerCell *v8;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10055FE90, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10022AAC0;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1002296C8(a3, (uint64_t)v6, v7);
  sub_100012C50((uint64_t)v6, v7);

}

- (void)selectTagWithIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ICTagContainerCell *v13;
  char *v14;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (v8)
  {
    v12 = swift_allocObject(&unk_10055FE68, 24, 7);
    *(_QWORD *)(v12 + 16) = v8;
    v8 = sub_100166BA8;
  }
  else
  {
    v12 = 0;
  }
  v13 = self;
  v14 = sub_100228DBC();
  sub_1002FAC28(v9, v11, a4, (uint64_t)v8, v12);

  sub_100012C50((uint64_t)v8, v12);
  swift_bridgeObjectRelease(v11);
}

- (void)selectTagsWithTagSelection:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  ICTagContainerCell *v8;
  char *v9;

  v4 = a4;
  v7 = a3;
  v8 = self;
  v9 = sub_100228DBC();
  sub_1002FAE4C(a3, v4);

}

- (_TtC11MobileNotes17TagCollectionView)collectionView
{
  ICTagContainerCell *v2;
  char *v3;

  v2 = self;
  v3 = sub_100228DBC();

  return (_TtC11MobileNotes17TagCollectionView *)v3;
}

- (void)setCollectionView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___ICTagContainerCell____lazy_storage___collectionView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___ICTagContainerCell____lazy_storage___collectionView) = (Class)a3;
  v3 = a3;

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  ICTagContainerCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100229A50((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width;
  ICTagContainerCell *v6;
  char *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  v6 = self;
  v7 = sub_100228DBC();
  v8 = sub_1002FB200(width);
  v10 = v9;
  v11 = (void *)v8;

  v12 = width;
  v13 = v10;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)prepareForReuse
{
  ICTagContainerCell *v2;

  v2 = self;
  sub_10022A300();

}

- (BOOL)shouldSuppressAccessibilityHintsFor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  ICTagContainerCell *v10;
  id v11;
  uint64_t v13;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  v11 = -[ICTagContainerCell _bridgedConfigurationState](v10, "_bridgedConfigurationState");
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(v11) = UICellConfigurationState.isEditing.getter();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11 & 1;
}

- (ICTagContainerCell)initWithFrame:(CGRect)a3
{
  return (ICTagContainerCell *)sub_10022A5E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICTagContainerCell)initWithCoder:(id)a3
{
  return (ICTagContainerCell *)sub_10022A734(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagContainerCell_presentingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagContainerCell_defaultAccountObjectID));
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR___ICTagContainerCell_selectionDidChange), *(_QWORD *)&self->preservesSuperviewHorizontalLayoutMargins[OBJC_IVAR___ICTagContainerCell_selectionDidChange]);
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_dataDidChange), *(_QWORD *)&self->preservesSuperviewHorizontalLayoutMargins[OBJC_IVAR___ICTagContainerCell_dataDidChange]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagContainerCell____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagContainerCell_leadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagContainerCell_trailingConstraint));
}

@end
