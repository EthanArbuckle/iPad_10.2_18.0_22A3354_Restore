@implementation FMChooseMapViewController

- (_TtC6FindMy25FMChooseMapViewController)initWithCoder:(id)a3
{
  _TtC6FindMy25FMChooseMapViewController *result;

  result = (_TtC6FindMy25FMChooseMapViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMChooseMapViewController.swift", 38, 2, 42, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  char *v4;
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v8.receiver;
  v5 = a3;
  -[FMBaseContentViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  v6 = objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC6FindMy25FMChooseMapViewController_hostingViewController], "view", v8.receiver, v8.super_class);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "invalidateIntrinsicContentSize");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewLayoutMarginsDidChange
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v3.receiver;
  -[FMChooseMapViewController viewLayoutMarginsDidChange](&v3, "viewLayoutMarginsDidChange");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_scrollView], "layoutIfNeeded", v3.receiver, v3.super_class);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMChooseMapViewController_hostingViewController));
}

@end
