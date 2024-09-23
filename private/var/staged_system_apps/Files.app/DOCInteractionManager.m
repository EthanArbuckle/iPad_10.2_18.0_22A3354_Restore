@implementation DOCInteractionManager

- (_TtC5Files21DOCInteractionManager)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files21DOCInteractionManager_lastOpenedItem) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files21DOCInteractionManager_lastSelectedItem) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInteractionManager();
  return -[DOCInteractionManager init](&v3, "init");
}

+ (id)sharedManagerFor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = _s5Files21DOCInteractionManagerC06sharedC03forACSo8NSStringCSg_tFZ_0(a3);

  return v5;
}

+ (void)clearSharedControllerFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (a3)
  {
    v3 = qword_100640D20;
    v5 = a3;
    if (v3 != -1)
      swift_once(&qword_100640D20, sub_1000AE5F8);
    objc_msgSend((id)qword_100643720, "removeObjectForKey:");
  }
  else
  {
    v5 = *(id *)DOCLog.Source.unsafeMutableAddressor();
    v4 = static os_log_type_t.debug.getter(v5);
    os_log(_:dso:log:type:_:)("Scene Identifier was nil. This may not be not be a problem. Reproduce and investigate if it is ok.", 98, 2, &_mh_execute_header, v5, v4, _swiftEmptyArrayStorage);
  }

}

+ (void)setSharedManagerWith:(id)a3 to:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  sub_10010F394(v5, (uint64_t)v6);

}

- (FPItem)lastOpenedItem
{
  return (FPItem *)sub_10010EBF4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Files21DOCInteractionManager_lastOpenedItem);
}

- (void)setLastOpenedItem:(id)a3
{
  sub_10010EC98((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC5Files21DOCInteractionManager_lastOpenedItem, (void (*)(void *))sub_1000AE638);
}

- (FPItem)lastSelectedItem
{
  return (FPItem *)sub_10010EBF4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Files21DOCInteractionManager_lastSelectedItem);
}

- (void)setLastSelectedItem:(id)a3
{
  sub_10010EC98((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC5Files21DOCInteractionManager_lastSelectedItem, sub_10010EDA8);
}

- (void).cxx_destruct
{

}

@end
