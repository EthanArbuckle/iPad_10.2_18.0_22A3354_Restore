@implementation LocalContentViewController

- (void)viewDidLayoutSubviews
{
  _TtC15PreviewShellKit26LocalContentViewController *v2;

  v2 = self;
  LocalContentViewController.viewDidLayoutSubviews()();

}

- (_TtC15PreviewShellKit26LocalContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  id v8;
  id v9;
  _TtC15PreviewShellKit26LocalContentViewController *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_244795058();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15PreviewShellKit26LocalContentViewController_contentViewController) = 0;
    v8 = a4;
    a3 = (id)sub_24479504C();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15PreviewShellKit26LocalContentViewController_contentViewController) = 0;
    v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[LocalContentViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);

  return v10;
}

- (_TtC15PreviewShellKit26LocalContentViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15PreviewShellKit26LocalContentViewController_contentViewController) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[LocalContentViewController initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PreviewShellKit26LocalContentViewController_contentViewController));
}

@end
