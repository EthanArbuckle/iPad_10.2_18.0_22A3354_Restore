@implementation BKTVAppService

+ (BKTVAppService)shared
{
  if (qword_31E550 != -1)
    swift_once(&qword_31E550, sub_8388C);
  return (BKTVAppService *)(id)qword_320968;
}

- (id)fetchTVApp:(id)a3
{
  id v4;
  BKTVAppService *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_84394(v4);
  v7 = v6;

  return v7;
}

- (BKTVAppService)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKTVAppService____lazy_storage___tvMapping) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[BKTVAppService init](&v5, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKTVAppService____lazy_storage___tvMapping));
}

@end
