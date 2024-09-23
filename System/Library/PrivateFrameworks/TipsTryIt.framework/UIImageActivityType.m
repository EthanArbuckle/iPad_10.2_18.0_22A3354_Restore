@implementation UIImageActivityType

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC9TipsTryIt19UIImageActivityType_image));
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC9TipsTryIt19UIImageActivityType_image));
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC9TipsTryIt19UIImageActivityType_image));
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v5;
  id v6;
  _TtC9TipsTryIt19UIImageActivityType *v7;
  id v8;
  id v9;

  v5 = objc_allocWithZone(MEMORY[0x24BDDA8B0]);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_init);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15F0]), sel_initWithObject_, *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC9TipsTryIt19UIImageActivityType_image));
  objc_msgSend(v8, sel_setIconProvider_, v9);

  return v8;
}

- (_TtC9TipsTryIt19UIImageActivityType)init
{
  _TtC9TipsTryIt19UIImageActivityType *result;

  result = (_TtC9TipsTryIt19UIImageActivityType *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
