@implementation TagCollectionView

- (id)selectionDidChange
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD aBlock[5];
  uint64_t v8;
  _BYTE v9[24];

  v2 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_selectionDidChange);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_selectionDidChange, v9, 0, 0);
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  v8 = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1002489AC;
  aBlock[3] = &unk_100567C70;
  v4 = _Block_copy(aBlock);
  v5 = v8;
  swift_retain(v3);
  swift_release(v5);
  return v4;
}

- (void)setSelectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_100567C58, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_100166BB0;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_selectionDidChange);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_100012C50(v7, v8);
}

- (id)dataDidChange
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange))
    return 0;
  v2 = *(_QWORD *)&self->tagDataSource[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange];
  v6[4] = *(Class *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100206734;
  v6[3] = &unk_100567C20;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
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
    v4 = (_QWORD *)swift_allocObject(&unk_100567C08, 24, 7);
    v4[2] = v5;
    v6 = sub_10030E740;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange);
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange);
  v8 = *(_QWORD *)&self->tagDataSource[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_100012C50(v9, v8);
}

- (BOOL)isEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[TagCollectionView isEditing](&v3, "isEditing");
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC11MobileNotes17TagCollectionView *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9.receiver = self;
  v9.super_class = ObjectType;
  v6 = self;
  v7 = -[TagCollectionView isEditing](&v9, "isEditing");
  v8.receiver = v6;
  v8.super_class = ObjectType;
  -[TagCollectionView setEditing:](&v8, "setEditing:", v3);
  sub_1002FDD88(v7);

}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[TagCollectionView layoutSubviews](&v3, "layoutSubviews");
  sub_1002FC32C(0);

}

- (ICTagSelection)tagSelection
{
  return (ICTagSelection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagSelection));
}

- (void)setTagSelection:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagSelection);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagSelection) = (Class)a3;
  v3 = a3;

}

- (void)dataSourceDidUpdate:(id)a3
{
  _TtC11MobileNotes17TagCollectionView *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC11MobileNotes17TagCollectionView *v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v6);
    swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v8 = self;
  }
  sub_1002FE6C4();

  sub_100012DDC((uint64_t)v9, &qword_1005CF190);
}

- (_TtC11MobileNotes17TagCollectionView)initWithCoder:(id)a3
{
  sub_1002FE7A8(a3);
}

- (void)selectTagSelection:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  _TtC11MobileNotes17TagCollectionView *v8;

  v4 = a4;
  v7 = a3;
  v8 = self;
  sub_1002FAE4C(a3, v4);

}

- (_TtC11MobileNotes17TagCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;
  _TtC11MobileNotes17TagCollectionView *result;

  v4 = a4;
  result = (_TtC11MobileNotes17TagCollectionView *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.TagCollectionView", 29, "init(frame:collectionViewLayout:)", 33, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagDataSource));
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes17TagCollectionView_selectionDidChange), *(_QWORD *)&self->tagDataSource[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_selectionDidChange]);
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange), *(_QWORD *)&self->tagDataSource[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_defaultAccountObjectID));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_workerContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_viewContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_presentingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagSelectionBeforeDrag));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_sizingCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagObjectID));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_renameTagAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagDeletionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagRenameViewController));
  sub_10030C82C(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes17TagCollectionView_currentRenamedTagInfo), *(_QWORD *)&self->tagDataSource[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_currentRenamedTagInfo], *(_QWORD *)&self->selectionDidChange[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_currentRenamedTagInfo], *(void **)&self->selectionDidChange[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_currentRenamedTagInfo + 8]);
  sub_100012DDC((uint64_t)self + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_accessibilityProvider, &qword_1005D51F8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView____lazy_storage___tagSizingLabel));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sub_100300EDC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_10030C508);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12.receiver = self;
  v12.super_class = ObjectType;
  LODWORD(a4) = !-[TagCollectionView isEditing](&v12, "isEditing");
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (char)a4;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11MobileNotes17TagCollectionView *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_10030CA74();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  sub_100300EDC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_10030CEB8);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC11MobileNotes17TagCollectionView *v13;
  id v14;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v14 = sub_10030D070(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  return sub_100302304(self, (uint64_t)a2, a3, a4, 1);
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return sub_100302304(self, (uint64_t)a2, a3, a4, 0);
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return 1;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC11MobileNotes17TagCollectionView *v15;
  id v16;
  uint64_t v17;
  uint64_t v19;

  v9 = sub_100012E18((uint64_t *)&unk_1005D6350);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  swift_unknownObjectRetain(a4);
  v15 = self;
  v16 = sub_10030D374(a4, (uint64_t)v11);

  swift_unknownObjectRelease(a4, v17);
  sub_100012DDC((uint64_t)v11, (uint64_t *)&unk_1005D6350);
  return v16;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  uint64_t v7;
  _TtC11MobileNotes17TagCollectionView *v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10030DCFC(a4);

  swift_unknownObjectRelease(a4, v7);
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v6;
  uint64_t v7;
  _TtC11MobileNotes17TagCollectionView *v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10030E370();

  swift_unknownObjectRelease(a4, v7);
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC11MobileNotes17TagCollectionView *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v18;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  swift_unknownObjectRetain(a4);
  v14 = self;
  v15 = sub_10030E3E4((uint64_t)v12);

  swift_unknownObjectRelease(a4, v16);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15;
}

@end
