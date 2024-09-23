@implementation MusicMediaPickerServiceViewController

- (void)viewDidLoad
{
  MusicMediaPickerServiceViewController *v2;

  v2 = self;
  sub_1000046BC();

}

- (void)mediaPickerNavigationControllerDidCancel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MusicMediaPickerServiceViewController *v7;

  v4 = a3;
  v7 = self;
  v5 = (void *)sub_100004DC0();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "remoteMediaPickerDidCancel");

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (void)updateWithConfiguration:(id)a3
{
  id v4;
  MusicMediaPickerServiceViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100004E78((uint64_t)v4);

}

+ (id)_remoteViewControllerInterface
{
  return sub_1000050A0((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_clientInterface);
}

+ (id)_exportedInterface
{
  return sub_1000050A0((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_serviceInterface);
}

- (MusicMediaPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  MusicMediaPickerServiceViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___MusicMediaPickerServiceViewController_mediaPickerViewController, 0);
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___MusicMediaPickerServiceViewController_mediaPickerViewController, 0);
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MusicMediaPickerServiceViewController();
  v11 = -[MusicMediaPickerServiceViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (MusicMediaPickerServiceViewController)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___MusicMediaPickerServiceViewController_mediaPickerViewController, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MusicMediaPickerServiceViewController();
  return -[MusicMediaPickerServiceViewController initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___MusicMediaPickerServiceViewController_mediaPickerViewController);
}

@end
