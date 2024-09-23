@implementation TTRIPermissionsWarmingSheetViewController

- (NSString)title
{
  _TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController *v2;
  id v3;
  id v4;
  id v5;
  void *v6;

  v2 = self;
  v3 = sub_1B47F4268();
  v4 = TTRIPermissionsWarmingSheetView.titleLabel.getter();

  v5 = objc_msgSend(v4, sel_text);
  if (v5)
  {
    sub_1B4906A64();

    v6 = (void *)sub_1B4906A34();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController *v6;
  id v7;
  id v8;
  id v9;

  if (a3)
  {
    sub_1B4906A64();
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  v7 = sub_1B47F4268();
  v8 = TTRIPermissionsWarmingSheetView.titleLabel.getter();

  if (v5)
  {
    v9 = (id)sub_1B4906A34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v8, sel_setText_, v9);

}

- (void)loadView
{
  _TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1B47F4268();
  -[TTRIPermissionsWarmingSheetViewController setView:](v2, sel_setView_, v3);

}

- (_TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  id v8;
  id v9;
  _TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1B4906A64();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController____lazy_storage___permissionsPromptView) = 0;
    v8 = a4;
    a3 = (id)sub_1B4906A34();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController____lazy_storage___permissionsPromptView) = 0;
    v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[TTRIPermissionsWarmingSheetViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);

  return v10;
}

- (_TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController____lazy_storage___permissionsPromptView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[TTRIPermissionsWarmingSheetViewController initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController____lazy_storage___permissionsPromptView));
}

@end
