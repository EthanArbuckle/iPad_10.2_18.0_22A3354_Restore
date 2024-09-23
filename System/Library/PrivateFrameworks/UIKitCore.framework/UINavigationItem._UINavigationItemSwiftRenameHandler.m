@implementation UINavigationItem._UINavigationItemSwiftRenameHandler

- (_TtCE5UIKitCSo16UINavigationItem35_UINavigationItemSwiftRenameHandler)init
{
  objc_super v4;

  *(UINavigationItem **)((char *)&self->super._associatedItem
                       + OBJC_IVAR____TtCE5UIKitCSo16UINavigationItem35_UINavigationItemSwiftRenameHandler_delegate) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)_s35_UINavigationItemSwiftRenameHandlerCMa();
  return -[_UINavigationItemRenameHandler init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_18563E558((uint64_t)self + OBJC_IVAR____TtCE5UIKitCSo16UINavigationItem35_UINavigationItemSwiftRenameHandler_delegate);
}

@end
