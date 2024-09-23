@implementation CollectionPickerContaineeViewController

- (_TtP4Maps47CollectionPickerContaineeViewControllerDelegate_)delegate
{
  return (_TtP4Maps47CollectionPickerContaineeViewControllerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_delegate, a3);
}

- (_TtC4Maps39CollectionPickerContaineeViewController)initWithCollectionEditSession:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_delegate, 0);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_collectionListDataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___modalHeaderView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___tableView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_collectionSession) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[CollectionPickerContaineeViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0, 0);
}

- (_TtC4Maps39CollectionPickerContaineeViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC4Maps39CollectionPickerContaineeViewController *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_delegate, 0);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_collectionListDataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___modalHeaderView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___tableView) = 0;
  v5 = a3;

  result = (_TtC4Maps39CollectionPickerContaineeViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E41970, "Maps/CollectionPickerContaineeViewController.swift", 50, 2, 49, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = v7.receiver;
  -[ContaineeViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = objc_msgSend(v2, "cardPresentationController", v7.receiver, v7.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setTakesAvailableHeight:", 1);

    v5 = objc_msgSend(v2, "cardPresentationController");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "setPresentedModally:", 1);

      sub_100179B7C();
      sub_10017A144();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)cancelTapped
{
  uint64_t Strong;
  void *v4;
  _TtC4Maps39CollectionPickerContaineeViewController *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_delegate);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    objc_msgSend(v4, "collectionPickerContaineeViewControllerCancelTapped:", v5);

    swift_unknownObjectRelease(v4);
  }
}

- (void)dataSourceUpdated:(id)a3
{
  id v5;
  _TtC4Maps39CollectionPickerContaineeViewController *v6;

  v5 = a3;
  v6 = self;
  CollectionPickerContaineeViewController.dataSourceUpdated(_:)((DataSource_optional *)a3);

}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v7;
  _TtC4Maps39CollectionPickerContaineeViewController *v8;
  id v9;
  _TtC4Maps39CollectionPickerContaineeViewController *v10;
  _OWORD v11[2];

  if (a4)
  {
    v7 = a3;
    v8 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v11);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v9 = a3;
    v10 = self;
  }
  sub_10017A9E8((uint64_t)v11);

  sub_10000C180((uint64_t)v11);
}

- (void)dataSource:(DataSource *)a3 confirmDeleteCollections:(NSArray *)a4 sourceView:(UIView *)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  CGFloat *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  DataSource *v24;
  NSArray *v25;
  UIView *v26;
  _TtC4Maps39CollectionPickerContaineeViewController *v27;
  uint64_t v28;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v16);
  v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a7);
  v20 = (CGFloat *)swift_allocObject(&unk_1011A7198, 88, 7);
  *((_QWORD *)v20 + 2) = a3;
  *((_QWORD *)v20 + 3) = a4;
  *((_QWORD *)v20 + 4) = a5;
  v20[5] = x;
  v20[6] = y;
  v20[7] = width;
  v20[8] = height;
  *((_QWORD *)v20 + 9) = v19;
  *((_QWORD *)v20 + 10) = self;
  v21 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject(&unk_1011A71C0, 48, 7);
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_10149DF68;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject(&unk_1011A71E8, 48, 7);
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_10149A9C0;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = self;
  sub_10020D758((uint64_t)v18, (uint64_t)&unk_10149F0F0, (uint64_t)v23);
  swift_release();
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  id v6;
  _TtC4Maps39CollectionPickerContaineeViewController *v7;
  _OWORD v8[2];

  if (a4)
  {
    v6 = a3;
    v7 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v8);

    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_10000C180((uint64_t)v8);
}

- (_TtC4Maps39CollectionPickerContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC4Maps39CollectionPickerContaineeViewController *result;

  v4 = a4;
  result = (_TtC4Maps39CollectionPickerContaineeViewController *)_swift_stdlib_reportUnimplementedInitializer("Maps.CollectionPickerContaineeViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_collectionSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_collectionListDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___modalHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___tableView));
}

@end
