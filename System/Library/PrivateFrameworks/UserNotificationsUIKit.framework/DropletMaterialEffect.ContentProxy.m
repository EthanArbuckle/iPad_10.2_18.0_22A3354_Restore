@implementation DropletMaterialEffect.ContentProxy

- (void)addEffectToView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF12ContentProxy_contentView);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF12ContentProxy_contentView) = (Class)a3;
  v3 = a3;

}

- (void)removeEffectFromView:(id)a3
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF12ContentProxy_contentView);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF12ContentProxy_contentView) = 0;

}

- (_TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF12ContentProxy)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF12ContentProxy_contentView) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[DropletMaterialEffect.ContentProxy init](&v5, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF12ContentProxy_contentView));
}

@end
