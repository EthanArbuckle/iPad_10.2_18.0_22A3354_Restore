@implementation JSSettingsContainerViewController

- (void)viewDidLoad
{
  _TtC16MusicApplication33JSSettingsContainerViewController *v2;

  v2 = self;
  JSSettingsContainerViewController.viewDidLoad()();

}

- (void)handleDoneButtonTapped
{
  _TtC16MusicApplication33JSSettingsContainerViewController *v2;
  _TtC16MusicApplication33JSSettingsContainerViewController *v3;
  _TtC16MusicApplication33JSSettingsContainerViewController *v4;
  _TtC16MusicApplication33JSSettingsContainerViewController *v5;

  v5 = self;
  v2 = (_TtC16MusicApplication33JSSettingsContainerViewController *)-[JSSettingsContainerViewController presentingViewController](v5, "presentingViewController");
  if (v2)
  {
    v3 = v2;
    -[JSSettingsContainerViewController dismissViewControllerAnimated:completion:](v2, "dismissViewControllerAnimated:completion:", 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (_TtC16MusicApplication33JSSettingsContainerViewController)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication33JSSettingsContainerViewController_allowedServicesSubscription) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[JSDrivenViewController init](&v5, "init");
}

- (_TtC16MusicApplication33JSSettingsContainerViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC16MusicApplication33JSSettingsContainerViewController *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication33JSSettingsContainerViewController_allowedServicesSubscription) = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  v6 = a3;
  v7 = -[JSDrivenViewController initWithCoder:](&v9, "initWithCoder:", v6);

  return v7;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33JSSettingsContainerViewController_allowedServicesSubscription));
}

@end
