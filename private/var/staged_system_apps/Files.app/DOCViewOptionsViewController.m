@implementation DOCViewOptionsViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id v5;
  objc_class *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v7.receiver;
  -[DOCViewOptionsViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC5Files28DOCViewOptionsViewController_viewOptionsHostingController], "navigationItem", v7.receiver, v7.super_class);
  if ((objc_msgSend(v4, "_isInPopoverPresentation") & 1) != 0)
    v6 = 0;
  else
    v6 = sub_1000E65C4();
  objc_msgSend(v5, "setRightBarButtonItem:", v6);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char *v7;
  id v8;
  objc_class *v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType(self);
  swift_unknownObjectRetain(a4);
  v7 = (char *)v10.receiver;
  -[DOCViewOptionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC5Files28DOCViewOptionsViewController_viewOptionsHostingController], "navigationItem", v10.receiver, v10.super_class);
  if ((objc_msgSend(v7, "_isInPopoverPresentation") & 1) != 0)
    v9 = 0;
  else
    v9 = sub_1000E65C4();
  objc_msgSend(v8, "setRightBarButtonItem:", v9);
  swift_unknownObjectRelease(a4);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  char *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType(self, a2);
  swift_unknownObjectRetain(a3);
  v4 = (char *)v12.receiver;
  -[DOCViewOptionsViewController preferredContentSizeDidChangeForChildContentContainer:](&v12, "preferredContentSizeDidChangeForChildContentContainer:", a3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC5Files28DOCViewOptionsViewController_viewOptionsHostingController];
  objc_msgSend(v5, "preferredContentSize", v12.receiver, v12.super_class);
  v7 = v6;
  v8 = objc_msgSend(v4, "navigationBar");
  objc_msgSend(v8, "intrinsicContentSize");
  v10 = v9;

  objc_msgSend(v5, "preferredContentSize");
  objc_msgSend(v4, "setPreferredContentSize:", v7, v10 + v11);
  swift_unknownObjectRelease(a3);

}

- (_TtC5Files28DOCViewOptionsViewController)init
{
  _TtC5Files28DOCViewOptionsViewController *result;

  result = (_TtC5Files28DOCViewOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCViewOptionsViewController", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (_TtC5Files28DOCViewOptionsViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC5Files28DOCViewOptionsViewController *result;

  v3 = a3;
  result = (_TtC5Files28DOCViewOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCViewOptionsViewController", 34, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files28DOCViewOptionsViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files28DOCViewOptionsViewController_viewOptionsHostingController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files28DOCViewOptionsViewController____lazy_storage___doneBarButtonButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files28DOCViewOptionsViewController____lazy_storage___dismissAction));
}

@end
