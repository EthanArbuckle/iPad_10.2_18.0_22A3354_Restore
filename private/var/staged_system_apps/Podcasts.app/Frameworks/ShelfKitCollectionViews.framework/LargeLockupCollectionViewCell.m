@implementation LargeLockupCollectionViewCell

- (_TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell *)sub_134A4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_135EC8();
}

- (void)prepareForReuse
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LargeLockupCollectionViewCell();
  v2 = (char *)v4.receiver;
  -[LargeLockupCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = *(id *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_embeddedView];
  sub_1A8770();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell *v9;
  Class isa;
  objc_class *v11;
  objc_super v12;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  v11 = (objc_class *)type metadata accessor for LargeLockupCollectionViewCell();
  v12.receiver = v9;
  v12.super_class = v11;
  -[LargeLockupCollectionViewCell _bridgedUpdateConfigurationUsingState:](&v12, "_bridgedUpdateConfigurationUsingState:", isa);

  sub_134F34();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)canBeEdited
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_134D5C((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)isEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LargeLockupCollectionViewCell();
  return -[LargeLockupCollectionViewCell isEditing](&v3, "isEditing");
}

- (void)setEditing:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell *v4;

  v4 = self;
  sub_135704(a3);

}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for LargeLockupCollectionViewCell();
  v2 = (char *)v13.receiver;
  -[LargeLockupCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = *(id *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_embeddedView];
  v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (_TtC23ShelfKitCollectionViews15LargeLockupView)accessibilityEmbeddedView
{
  return (_TtC23ShelfKitCollectionViews15LargeLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_embeddedView);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_embeddedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_deletionButton));
  swift_release(*(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_deletionUITriggered]);
}

@end
