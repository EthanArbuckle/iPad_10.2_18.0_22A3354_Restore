@implementation DOCDragMonitor

- (_TtC5Files14DOCDragMonitor)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files14DOCDragMonitor_isItemCollectionDragActive) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCDragMonitor();
  return -[DOCDragMonitor init](&v3, "init");
}

- (BOOL)isItemCollectionDragActive
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files14DOCDragMonitor_isItemCollectionDragActive);
}

- (void)setIsItemCollectionDragActive:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files14DOCDragMonitor_isItemCollectionDragActive) = a3;
}

@end
