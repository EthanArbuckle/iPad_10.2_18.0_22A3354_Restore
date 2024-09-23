@implementation ContainerDetail.ViewController

- (_TtCV16MusicApplication15ContainerDetail14ViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_AE187C();
}

- (void)viewDidLoad
{
  _TtCV16MusicApplication15ContainerDetail14ViewController *v2;

  v2 = self;
  sub_AD777C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtCV16MusicApplication15ContainerDetail14ViewController *v4;

  v4 = self;
  sub_AD7D9C(a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ContainerDetail.ViewController(0);
  -[ContainerDetail.ViewController viewWillAppear:](&v4, "viewWillAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtCV16MusicApplication15ContainerDetail14ViewController *v4;

  v4 = self;
  sub_AD81C4(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  char v8[24];
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ContainerDetail.ViewController(0);
  v4 = (char *)v9.receiver;
  -[ContainerDetail.ViewController viewDidDisappear:](&v9, "viewDidDisappear:", v3);
  v5 = &v4[OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController_dataSource];
  swift_beginAccess(&v4[OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController_dataSource], v8, 0, 0);
  v6 = *((_QWORD *)v5 + 1);
  ObjectType = swift_getObjectType();
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v6 + 176))(ObjectType, v6))
  {
    dispatch thunk of RelatedContentProvider.onDisappear()();
    swift_release();
  }

}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContainerDetail.ViewController(0);
  v4 = a3;
  v5 = v6.receiver;
  -[ContainerDetail.ViewController willMoveToParentViewController:](&v6, "willMoveToParentViewController:", v4);
  sub_AD8C1C();
  sub_B1DF98();
  swift_release();

}

- (int64_t)preferredStatusBarStyle
{
  _TtCV16MusicApplication15ContainerDetail14ViewController *v2;
  int64_t v3;

  v2 = self;
  v3 = *(_QWORD *)(sub_AD8C1C() + 48);

  swift_release();
  return v3;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtCV16MusicApplication15ContainerDetail14ViewController *v11;
  uint64_t v12;

  v5 = type metadata accessor for UIContentUnavailableConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = a3;
  v11 = self;
  sub_AD8550();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (_TtCV16MusicApplication15ContainerDetail14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtCV16MusicApplication15ContainerDetail14ViewController *result;

  v4 = a4;
  result = (_TtCV16MusicApplication15ContainerDetail14ViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __n128 v3;
  char *v4;
  uint64_t v5;

  swift_release();
  swift_release();
  sub_56024((uint64_t)self + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController_artwork, (uint64_t *)&unk_14AD650);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController____lazy_storage___backdropContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController_backdropView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController_floatingArtworkContainer));
  v3 = swift_release();
  v4 = (char *)self + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController_relatedContentState;
  v5 = type metadata accessor for RelatedContentProvider.State(0, v3);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  sub_56024((uint64_t)self + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController_relatedContentStateSubscription, (uint64_t *)&unk_14C06B0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController_detailComponentController));
  swift_bridgeObjectRelease();
  sub_955CE8(*(uint64_t *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController____lazy_storage___popoverProvider));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController____lazy_storage___collectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController____lazy_storage___collectionView));
  swift_release();
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController____lazy_storage___contextualActionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail14ViewController____lazy_storage___contextualActionsBarButtonItem));
  swift_release();
}

@end
