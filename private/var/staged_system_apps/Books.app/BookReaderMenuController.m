@implementation BookReaderMenuController

- (_TtC5Books24BookReaderMenuController)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Books24BookReaderMenuController_mode) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Books24BookReaderMenuController_actionResponder, 0);
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[BookReaderMenuController init](&v5, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Books24BookReaderMenuController_actionResponder);
}

@end
