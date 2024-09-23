@implementation SidebarLabelListCell

- (BOOL)isEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SidebarLabelListCell();
  return -[SidebarLabelListCell isEditing](&v3, "isEditing");
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC5Books20SidebarLabelListCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for SidebarLabelListCell();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[SidebarLabelListCell isEditing](&v9, "isEditing");
  v8.receiver = v6;
  v8.super_class = v5;
  -[SidebarLabelListCell setEditing:](&v8, "setEditing:", v3);
  if (v7 != -[SidebarLabelListCell isEditing](v6, "isEditing"))
    sub_10053C32C(-[SidebarLabelListCell isEditing](v6, "isEditing"));

}

- (_TtC5Books20SidebarLabelListCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Books20SidebarLabelListCell *)sub_10053B1DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books20SidebarLabelListCell)initWithCoder:(id)a3
{
  return (_TtC5Books20SidebarLabelListCell *)sub_10053B320(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  _TtC5Books20SidebarLabelListCell *v10;
  uint64_t v11;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = self;
  sub_10053B458();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)prepareForReuse
{
  _TtC5Books20SidebarLabelListCell *v2;

  v2 = self;
  sub_10053B87C();

}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC5Books20SidebarLabelListCell *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  swift_unknownObjectRelease(a3);
  sub_10053BA40(a4);

  _s5Books15CurrentPageViewVwxx_0(v9);
}

- (void).cxx_destruct
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC5Books20SidebarLabelListCell_item;
  sub_10049EEF0(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC5Books20SidebarLabelListCell_item), *((_QWORD *)v3 + 1), *((_QWORD *)v3 + 2), *((_QWORD *)v3 + 3), *((_QWORD *)v3 + 4), *((_QWORD *)v3 + 5), *((void **)v3 + 6), *((_QWORD *)v3 + 7));
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books20SidebarLabelListCell_inlineEditingDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books20SidebarLabelListCell__inlineEditingTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books20SidebarLabelListCell_inlineEditingLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books20SidebarLabelListCell_inlineEditingLeadingAXConstraint));
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[SidebarLabelListCell endEditing:](self, "endEditing:", 1);
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  id v7;
  _TtC5Books20SidebarLabelListCell *v8;
  id v9;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books20SidebarLabelListCell_inlineEditingDelegate);
  if (Strong)
  {
    v6 = Strong;
    v9 = *(id *)(Strong + OBJC_IVAR____TtCV5Books21SidebarCollectionView11Coordinator_editingCell);
    *(_QWORD *)(Strong + OBJC_IVAR____TtCV5Books21SidebarCollectionView11Coordinator_editingCell) = self;
    v7 = a3;
    v8 = self;

    swift_unknownObjectRelease(v6);
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  id v7;
  _TtC5Books20SidebarLabelListCell *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books20SidebarLabelListCell_inlineEditingDelegate);
  if (Strong)
  {
    v6 = Strong;
    v7 = a3;
    v8 = self;
    sub_10049E554((char *)v8);

    swift_unknownObjectRelease(v6);
  }
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_10035B798(self, (uint64_t)a2, (void (*)(void))sub_10053CA28);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_10035B798(self, (uint64_t)a2, (void (*)(void))sub_10053CC60);
}

@end
