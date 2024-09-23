@implementation DOCLoadingViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Files24DOCLoadingViewController *v4;

  v4 = self;
  sub_100457CFC(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  __n128 v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCLoadingViewController();
  v4 = v7.receiver;
  -[DOCLoadingViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v5 = sub_100457AA8();
  dispatch thunk of DispatchWorkItem.cancel()(v6);

  swift_release(v5);
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCLoadingViewController();
  v4 = a3;
  v5 = v9.receiver;
  -[DOCBrowserContainedViewController effectiveAppearanceDidChange:](&v9, "effectiveAppearanceDidChange:", v4);
  v6 = objc_msgSend(v5, "viewIfLoaded", v9.receiver, v9.super_class);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v4, "backgroundColor");
    objc_msgSend(v7, "setBackgroundColor:", v8);

    v4 = v7;
    v5 = v8;
  }

}

- (_TtC5Files24DOCLoadingViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files24DOCLoadingViewController____lazy_storage___task) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCLoadingViewController();
  return -[DOCBrowserContainedViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files24DOCLoadingViewController____lazy_storage___task));
}

@end
