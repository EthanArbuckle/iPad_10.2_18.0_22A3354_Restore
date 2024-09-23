@implementation MediaPickerNavigationController

- (_TtC16MusicApplication31MediaPickerNavigationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_96D6E0();
}

- (void)pushViewController:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication31MediaPickerNavigationController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_96889C(v8, a4, a5);

}

- (NSArray)viewControllers
{
  id v2;
  NSArray *v3;
  uint64_t v4;
  Class isa;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = v7.receiver;
  v3 = -[NavigationController viewControllers](&v7, "viewControllers");
  v4 = sub_4E684(0, (unint64_t *)&qword_14C9D90, UIViewController_ptr);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setViewControllers:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC16MusicApplication31MediaPickerNavigationController *v7;

  v5 = sub_4E684(0, (unint64_t *)&qword_14C9D90, UIViewController_ptr);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v6 = a3;
  v7 = self;
  sub_96D7D0();

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[NavigationController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[MediaPickerNavigationController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_969120();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication31MediaPickerNavigationController *v2;

  v2 = self;
  sub_969984();

}

- (NSString)playActivityFeatureName
{
  _TtC16MusicApplication31MediaPickerNavigationController *v2;
  NSString v3;

  v2 = self;
  sub_969B7C();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setPlayActivityFeatureName:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication31MediaPickerNavigationController *v9;
  NSString v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = a3;
  v9 = self;
  v10 = String._bridgeToObjectiveC()();
  v11.receiver = v9;
  v11.super_class = ObjectType;
  -[MediaPickerNavigationController setPlayActivityFeatureName:](&v11, "setPlayActivityFeatureName:", v10);

  swift_bridgeObjectRelease(v7);
}

- (void)cancelTapped
{
  _TtC16MusicApplication31MediaPickerNavigationController *v2;

  v2 = self;
  sub_969E68();

}

- (void)doneTapped
{
  _TtC16MusicApplication31MediaPickerNavigationController *v2;

  v2 = self;
  sub_969FD0();

}

- (_TtC16MusicApplication31MediaPickerNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC16MusicApplication31MediaPickerNavigationController *result;

  result = (_TtC16MusicApplication31MediaPickerNavigationController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.MediaPickerNavigationController", 48, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController_mediaPickerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController_mediaPickerConfiguration));
  sub_846C48(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController_prompt), *(_QWORD *)&self->super.onWillShowViewController[OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController_prompt]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController____lazy_storage___doneBarButtonItem));
  swift_bridgeObjectRelease();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController_selectedPlaybackIntentDescriptor, (uint64_t *)&unk_14B0AC0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController____lazy_storage___spinnerBarButtonItem));
}

@end
