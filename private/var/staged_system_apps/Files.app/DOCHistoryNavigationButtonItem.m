@implementation DOCHistoryNavigationButtonItem

- (_TtC5Files30DOCHistoryNavigationButtonItem)initWithCoder:(id)a3
{
  id v4;
  _TtC5Files30DOCHistoryNavigationButtonItem *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files30DOCHistoryNavigationButtonItem_direction) = 2;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files30DOCHistoryNavigationButtonItem_canEnable) = 1;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files30DOCHistoryNavigationButtonItem_canPerformShiftAction) = 0;
  v4 = a3;

  result = (_TtC5Files30DOCHistoryNavigationButtonItem *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCBrowserHistoryController.swift", 39, 2, 321, 0);
  __break(1u);
  return result;
}

- (_TtC5Files30DOCHistoryNavigationButtonItem)init
{
  objc_super v3;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files30DOCHistoryNavigationButtonItem_direction) = 2;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files30DOCHistoryNavigationButtonItem_canEnable) = 1;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files30DOCHistoryNavigationButtonItem_canPerformShiftAction) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCHistoryNavigationButtonItem();
  return -[DOCHistoryNavigationButtonItem init](&v3, "init");
}

- (BOOL)isEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCHistoryNavigationButtonItem();
  return -[DOCHistoryNavigationButtonItem isEnabled](&v3, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCHistoryNavigationButtonItem();
  -[DOCHistoryNavigationButtonItem setEnabled:](&v4, "setEnabled:", v3);
}

@end
