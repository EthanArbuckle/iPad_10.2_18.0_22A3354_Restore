@implementation PKEventDetailsListViewItem

- (PKEventDetailsListViewItem)initWithTitle:(id)a3 detail:(id)a4 layoutStyle:(int64_t)a5 axID:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PKEventDetailsListViewItem *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  objc_super v22;

  v8 = sub_19DE87BF4();
  v10 = v9;
  v11 = sub_19DE87BF4();
  v13 = v12;
  v14 = sub_19DE87BF4();
  v16 = v15;
  v17 = self;
  sub_19DE83AFC();
  v18 = (uint64_t *)((char *)v17 + OBJC_IVAR___PKEventDetailsListViewItem_title);
  *v18 = v8;
  v18[1] = v10;
  v19 = (uint64_t *)((char *)v17 + OBJC_IVAR___PKEventDetailsListViewItem_detail);
  *v19 = v11;
  v19[1] = v13;
  *(Class *)((char *)&v17->super.isa + OBJC_IVAR___PKEventDetailsListViewItem_layoutStyle) = (Class)a5;
  v20 = (uint64_t *)((char *)v17 + OBJC_IVAR___PKEventDetailsListViewItem_axID);
  *v20 = v14;
  v20[1] = v16;

  v22.receiver = v17;
  v22.super_class = (Class)type metadata accessor for EventDetailsListViewItem(0);
  return -[PKEventDetailsListViewItem init](&v22, sel_init);
}

- (PKEventDetailsListViewItem)init
{
  PKEventDetailsListViewItem *result;

  result = (PKEventDetailsListViewItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___PKEventDetailsListViewItem_uniqueIdentifier;
  v4 = sub_19DE83B08();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
