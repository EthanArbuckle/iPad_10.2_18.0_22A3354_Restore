@implementation PXSocialGroupMakeKeyPhotoActionPerformer

- (void)performBackgroundTask
{
  PXSocialGroupMakeKeyPhotoActionPerformer *v2;

  v2 = self;
  sub_1A6F04BEC();

}

+ (BOOL)canPerformWithActionManager:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = a3;
    v7 = objc_msgSend(v5, sel_socialGroup);

    if (v7)
    {

      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  sub_1A6F8FADC();

  v5 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return (id)sub_1A7AE3734();
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  void *v6;
  id v7;

  v6 = _Block_copy(a5);
  sub_1A7AE3764();
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  sub_1A6856488(0, (unint64_t *)&qword_1EE8D8F20);
  v7 = a4;
  return (id)sub_1A7AE43C4();
}

- (PXSocialGroupMakeKeyPhotoActionPerformer)initWithActionType:(id)a3
{
  objc_class *ObjectType;
  void *v5;
  PXSocialGroupMakeKeyPhotoActionPerformer *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1A7AE3764();
  v5 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[PXActionPerformer initWithActionType:](&v8, sel_initWithActionType_, v5);

  return v6;
}

@end
