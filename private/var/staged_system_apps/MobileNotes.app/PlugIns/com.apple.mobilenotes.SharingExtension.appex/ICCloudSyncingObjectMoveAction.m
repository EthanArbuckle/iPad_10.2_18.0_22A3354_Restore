@implementation ICCloudSyncingObjectMoveAction

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_type);
}

- (ICCloudSyncingObject)object
{
  return (ICCloudSyncingObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object));
}

- (ICCloudSyncingObject)fromParentObject
{
  return (ICCloudSyncingObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject));
}

- (ICCloudSyncingObject)toParentObject
{
  return (ICCloudSyncingObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject));
}

- (BOOL)isCopy
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy);
}

- (ICCloudSyncingObjectMoveAction)initWithType:(int64_t)a3 object:(id)a4 fromParentObject:(id)a5 toParentObject:(id)a6 isCopy:(BOOL)a7
{
  objc_class *ObjectType;
  id v14;
  id v15;
  id v16;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_type) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject) = (Class)a6;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) = a7;
  v18.receiver = self;
  v18.super_class = ObjectType;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  return -[ICCloudSyncingObjectMoveAction init](&v18, "init");
}

- (ICCloudSyncingObjectMoveAction)initWithObject:(id)a3 fromParentObject:(id)a4 toParentObject:(id)a5 isCopy:(BOOL)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  return (ICCloudSyncingObjectMoveAction *)ICCloudSyncingObject.MoveAction.init(object:fromParentObject:toParentObject:isCopy:)(v9, a4, a5, a6);
}

- (ICCloudSyncingObjectMoveAction)initWithFolder:(id)a3 toParentObject:(id)a4 isCopy:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  ICCloudSyncingObjectMoveAction *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "parent");
  if (!v10)
    v10 = objc_msgSend(v8, "account");
  v11 = -[ICCloudSyncingObjectMoveAction initWithObject:fromParentObject:toParentObject:isCopy:](self, "initWithObject:fromParentObject:toParentObject:isCopy:", v8, v10, v9, v5);

  return v11;
}

- (ICCloudSyncingObjectMoveAction)initWithNote:(id)a3 toFolder:(id)a4 isCopy:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  ICCloudSyncingObjectMoveAction *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "folder");
  v11 = -[ICCloudSyncingObjectMoveAction initWithObject:fromParentObject:toParentObject:isCopy:](self, "initWithObject:fromParentObject:toParentObject:isCopy:", v8, v10, v9, v5);

  return v11;
}

- (ICCloudSyncingObjectMoveAction)init
{
  ICCloudSyncingObjectMoveAction *result;

  result = (ICCloudSyncingObjectMoveAction *)_swift_stdlib_reportUnimplementedInitializer("com_apple_mobilenotes_SharingExtension.MoveAction", 49, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
