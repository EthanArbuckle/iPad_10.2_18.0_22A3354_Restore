@implementation SceneHostingViewController

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
  -[SceneHostingViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  _TtC18PreviewsServicesUI26SceneHostingViewController *v2;

  v2 = self;
  SceneHostingViewController.viewDidLayoutSubviews()();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  char *v5;
  char *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  -[SceneHostingViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  v5 = &v4[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  if (*v5 == 1)
  {
    v6 = (char *)objc_msgSend(v4, sel_traitCollection);
    objc_msgSend(v6, sel_activeAppearance);

    v4 = v6;
  }

}

- (BOOL)canBecomeFirstResponder
{
  BOOL *v2;

  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host))
    return 0;
  v2 = (BOOL *)self + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview;
  swift_beginAccess();
  return *v2;
}

- (BOOL)becomeFirstResponder
{
  return sub_22AE4E080(self, (uint64_t)a2, (const char **)&selRef_becomeFirstResponder, 1);
}

- (BOOL)resignFirstResponder
{
  return sub_22AE4E080(self, (uint64_t)a2, (const char **)&selRef_resignFirstResponder, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  _BYTE *v5;
  id v6;
  _TtC18PreviewsServicesUI26SceneHostingViewController *v7;
  id v8;

  v5 = (char *)self + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview;
  swift_beginAccess();
  if (*v5 == 1)
  {
    v6 = a3;
    v7 = self;
    v8 = -[SceneHostingViewController traitCollection](v7, sel_traitCollection);
    objc_msgSend(v8, sel_activeAppearance);

  }
}

- (_TtC18PreviewsServicesUI26SceneHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22AE5E0CC();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18PreviewsServicesUI26SceneHostingViewController *)SceneHostingViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18PreviewsServicesUI26SceneHostingViewController)initWithCoder:(id)a3
{
  return (_TtC18PreviewsServicesUI26SceneHostingViewController *)SceneHostingViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_22AE4A120(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler));
  sub_22AE50A38(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host));
  sub_22AE5045C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest));
  swift_release();
}

@end
