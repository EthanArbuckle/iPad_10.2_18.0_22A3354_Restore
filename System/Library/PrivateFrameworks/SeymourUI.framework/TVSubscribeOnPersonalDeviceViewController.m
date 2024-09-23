@implementation TVSubscribeOnPersonalDeviceViewController

- (_TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B7608F0();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController *v2;

  v2 = self;
  sub_22B75FC98();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVSubscribeOnPersonalDeviceViewController();
  v4 = v5.receiver;
  -[TVSubscribeOnPersonalDeviceViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  sub_22B6AEE08();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController *v4;

  v4 = self;
  sub_22B760260(a3);

}

- (_TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController_imageView));
  swift_release();
}

@end
