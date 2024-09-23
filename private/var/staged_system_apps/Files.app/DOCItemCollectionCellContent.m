@implementation DOCItemCollectionCellContent

- (void)dealloc
{
  _TtC5Files28DOCItemCollectionCellContent *v2;
  objc_super v3;

  v2 = self;
  sub_10009FBA0();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionCellContent();
  -[DOCItemCollectionCellContent dealloc](&v3, "dealloc");
}

- (void)thumbnailLoaded:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _TtC5Files28DOCItemCollectionCellContent *v9;
  _QWORD v10[5];
  uint64_t v11;

  v5 = swift_allocObject(&unk_1005F18F8, 24, 7);
  swift_unknownObjectWeakInit(v5 + 16);
  v6 = swift_allocObject(&unk_1005F1AA0, 32, 7);
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = a3;
  v10[4] = sub_1004B0ED0;
  v11 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10004A82C;
  v10[3] = &unk_1005F1AB8;
  v7 = _Block_copy(v10);
  v8 = v11;
  swift_unknownObjectRetain_n(a3, 2);
  v9 = self;
  swift_release(v8);
  DOCRunInMainThread(v7);
  _Block_release(v7);
  swift_unknownObjectRelease(a3);

}

- (void).cxx_destruct
{
  _QWORD v3[23];
  _QWORD v4[16];
  _QWORD v5[25];

  sub_100070EDC((uint64_t)self + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_gridItemLayoutTraits, (uint64_t)v3, (uint64_t *)&unk_100641300);
  sub_1000716DC(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100071784);
  sub_100070EDC((uint64_t)self + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_listItemLayoutTraits, (uint64_t)v4, &qword_100658670);
  sub_1000717C0(v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10007B580);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_node));
  sub_100144F34(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_sortingDescriptor), *(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_sortingDescriptor], *(_QWORD *)&self->pendingNotifications[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_sortingDescriptor]);

  sub_100087534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_thumbnailUpdateBlock), *(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_thumbnailUpdateBlock]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_thumbnailUpdateLock));
  swift_bridgeObjectRelease(*(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_inflightRenameTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_inflightRenameOldTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__title]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_trailingAttachmentcolor));

  sub_100070EDC((uint64_t)self + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__titleWithTags, (uint64_t)v5, (uint64_t *)&unk_100641310);
  sub_10044930C(v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000786EC);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__titleWithIconAndTags));
  swift_bridgeObjectRelease(*(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__date]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__size]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__kind]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__shareString]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__tags));
  swift_bridgeObjectRelease(*(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__sourceName]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__thumbnail));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__thumbnailLoadingPool));

  swift_bridgeObjectRelease(*(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__tableSubtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__largeCompactWidthTextTableSubtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->disabledNotificationCount[OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__largeRegularWidthTextTableSubtitle]);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_delegate);
}

- (_TtC5Files28DOCItemCollectionCellContent)init
{
  return (_TtC5Files28DOCItemCollectionCellContent *)DOCItemCollectionCellContent.init()();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC5Files28DOCItemCollectionCellContent *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  _TtC5Files28DOCItemCollectionCellContent *v20;
  _OWORD v21[2];

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v21, 0, sizeof(v21));
    v19 = a5;
    v20 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)(v21, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v16 = v15;
  v17 = sub_10005A360(&qword_100641860, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_1004D6948);
  v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v16, (char *)&type metadata for Any + 8, v17);

LABEL_8:
  DOCItemCollectionCellContent.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v21, v18, a6);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v12);
  sub_10007EB54((uint64_t)v21);
}

- (id)accessibilityItem
{
  id *v2;
  id v3;
  _BYTE v5[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_node);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_node, v5, 0, 0);
  v3 = *v2;
  if (*v2)
    v3 = objc_msgSend(v3, "fpfs_fpItem");
  return v3;
}

- (BOOL)accessibilityIsFolder
{
  _TtC5Files28DOCItemCollectionCellContent *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1004B0348();

  return v3 & 1;
}

- (BOOL)accessibilityShouldDim
{
  return sub_10006F62C() & 1;
}

@end
