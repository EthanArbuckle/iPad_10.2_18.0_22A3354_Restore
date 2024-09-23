@implementation SessionRoutePickerViewController

- (_TtC9SeymourUI32SessionRoutePickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B41D3DC();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI32SessionRoutePickerViewController *v2;

  v2 = self;
  sub_22B41B5A0();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_22B41C5B8(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (void (*)(id))sub_22B5FC4EC);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[6];
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SessionRoutePickerViewController();
  v4 = v11.receiver;
  -[SessionRoutePickerViewController viewDidAppear:](&v11, sel_viewDidAppear_, v3);
  if (v3)
    v5 = 0.18;
  else
    v5 = 0.0;
  v6 = (void *)objc_opt_self();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v4;
  v10[4] = sub_22B41D980;
  v10[5] = v7;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_22B0F2EEC;
  v10[3] = &block_descriptor_54;
  v8 = _Block_copy(v10);
  v9 = v4;
  swift_release();
  objc_msgSend(v6, sel_animateWithDuration_animations_, v8, v5);
  _Block_release(v8);

}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_22B41C5B8(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (void (*)(id))sub_22B5FC684);
}

- (unint64_t)supportedInterfaceOrientations
{
  if (sub_22BA7D460() == 1)
    return 30;
  else
    return 24;
}

- (void)onTapBackground
{
  _TtC9SeymourUI32SessionRoutePickerViewController *v2;

  v2 = self;
  sub_22B41C650();

}

- (_TtC9SeymourUI32SessionRoutePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI32SessionRoutePickerViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI32SessionRoutePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_collectionBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_footerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController____lazy_storage___collectionViewDataSource));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9SeymourUI32SessionRoutePickerViewController *v11;
  uint64_t v12;

  v6 = sub_22BA79C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79BCC();
  v10 = a3;
  v11 = self;
  sub_22B41D5C4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC9SeymourUI32SessionRoutePickerViewController *v14;
  CGFloat Width;
  double v16;
  double v17;
  uint64_t v18;
  CGSize result;
  CGRect v20;

  v8 = sub_22BA79C14();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79BCC();
  v12 = a3;
  v13 = a4;
  v14 = self;
  objc_msgSend(v12, sel_bounds);
  Width = CGRectGetWidth(v20);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v16 = 50.0;
  v17 = Width;
  result.height = v16;
  result.width = v17;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  _TtC9SeymourUI32SessionRoutePickerViewController *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_22B41D738(v8, a5);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

@end
