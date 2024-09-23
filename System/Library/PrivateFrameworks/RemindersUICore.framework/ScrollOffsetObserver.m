@implementation ScrollOffsetObserver

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v5;
  _TtC15RemindersUICoreP33_7C8C604C15D0DA1EA91E5188EF1F6E2320ScrollOffsetObserver *v6;

  v5 = a3;
  v6 = self;
  sub_1B43CFB80((uint64_t)a3);

}

- (_TtC15RemindersUICoreP33_7C8C604C15D0DA1EA91E5188EF1F6E2320ScrollOffsetObserver)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[ScrollOffsetObserver init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
