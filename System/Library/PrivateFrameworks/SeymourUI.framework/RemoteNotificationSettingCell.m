@implementation RemoteNotificationSettingCell

- (void)switchTappedWithCellSwitch:(id)a3
{
  id v4;
  _TtC9SeymourUI29RemoteNotificationSettingCell *v5;

  v4 = a3;
  v5 = self;
  sub_22B6746D0(v4);

}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RemoteNotificationSettingCell();
  v2 = (char *)v4.receiver;
  -[RemoteNotificationSettingCell prepareForReuse](&v4, sel_prepareForReuse);
  v3 = &v2[OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_rowIndex];
  *(_QWORD *)v3 = 0;
  v3[8] = 1;

}

- (_TtC9SeymourUI29RemoteNotificationSettingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  char *v6;
  void *v7;
  char *v8;
  _TtC9SeymourUI29RemoteNotificationSettingCell *v9;
  objc_super v11;

  if (a4)
  {
    sub_22BA8067C();
    *(_QWORD *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_delegate) = 0;
    swift_unknownObjectWeakInit();
    v6 = (char *)self + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_rowIndex;
    *(_QWORD *)v6 = 0;
    v6[8] = 1;
    v7 = (void *)sub_22BA8064C();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_delegate) = 0;
    swift_unknownObjectWeakInit();
    v7 = 0;
    v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_rowIndex;
    *(_QWORD *)v8 = 0;
    v8[8] = 1;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RemoteNotificationSettingCell();
  v9 = -[RemoteNotificationSettingCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, v7);

  return v9;
}

- (_TtC9SeymourUI29RemoteNotificationSettingCell)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_rowIndex;
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RemoteNotificationSettingCell();
  return -[RemoteNotificationSettingCell initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_delegate);
}

@end
