@implementation SidebarTextFieldListCell

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC5Books24SidebarTextFieldListCell *v7;
  Class isa;
  uint64_t v10;

  v3 = type metadata accessor for UICellConfigurationState(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_10060765C();

  isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (UICellConfigurationState *)isa;
}

- (_TtC5Books24SidebarTextFieldListCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Books24SidebarTextFieldListCell_shouldBeginEditing) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SidebarTextFieldListCell();
  return -[SidebarTextFieldListCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books24SidebarTextFieldListCell)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Books24SidebarTextFieldListCell_shouldBeginEditing) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SidebarTextFieldListCell();
  return -[SidebarTextFieldListCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
