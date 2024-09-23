@implementation SSKUpdateDisplayTransformsAdapter

- (SSKUpdateDisplayTransformsAdapter)initWithDisplayConfiguration:(id)a3 displayTransformUpdater:(id)a4
{
  objc_class *ObjectType;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayTransformUpdater) = (Class)a4;
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = a3;
  swift_unknownObjectRetain();
  return -[SSKUpdateDisplayTransformsAdapter init](&v10, sel_init);
}

- (SSKUpdateDisplayTransformsAdapter)init
{
  SSKUpdateDisplayTransformsAdapter *result;

  result = (SSKUpdateDisplayTransformsAdapter *)sub_246018070();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

- (void)displayUpdated:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration) = (Class)a3;
  v3 = a3;

}

@end
