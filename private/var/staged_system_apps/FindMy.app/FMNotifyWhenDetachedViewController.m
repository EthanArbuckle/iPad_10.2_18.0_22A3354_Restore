@implementation FMNotifyWhenDetachedViewController

- (_TtC6FindMy34FMNotifyWhenDetachedViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10034D838();
}

- (void)viewDidLoad
{
  _TtC6FindMy34FMNotifyWhenDetachedViewController *v2;

  v2 = self;
  sub_10034B0C4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMNotifyWhenDetachedViewController(0);
  v4 = v8.receiver;
  v5 = a3;
  -[FMNotifyWhenDetachedViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (!v5 || v7 != objc_msgSend(v5, "userInterfaceStyle"))
    sub_10034CF24();

}

- (void)cancelAction
{
  -[FMNotifyWhenDetachedViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)doneAction
{
  _TtC6FindMy34FMNotifyWhenDetachedViewController *v2;

  v2 = self;
  sub_10034D030((uint64_t)v2);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_contentStackView));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_imagesContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_notifyWhenDetachedImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_mismatchIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_notifyWhenDetachedDescription));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_notifyWhenDetachedSwitchSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_notifyWhenDetachedSwitch));
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_device;
  v4 = type metadata accessor for FMIPDevice(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
