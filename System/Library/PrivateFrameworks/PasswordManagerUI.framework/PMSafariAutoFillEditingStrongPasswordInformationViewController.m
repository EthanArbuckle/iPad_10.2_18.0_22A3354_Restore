@implementation PMSafariAutoFillEditingStrongPasswordInformationViewController

+ (BOOL)shouldShowView
{
  unsigned int v2;
  id v3;
  void *v4;
  unsigned __int8 v5;

  v2 = objc_msgSend((id)objc_opt_self(), sel_isPasswordManagerAppEnabledAndInstalled);
  if (v2)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_pm_defaults);
    v4 = (void *)sub_243850234();
    v5 = objc_msgSend(v3, sel_BOOLForKey_, v4);

    LOBYTE(v2) = v5 ^ 1;
  }
  return v2;
}

- (PMSafariAutoFillEditingStrongPasswordInformationViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController_delegate;
  swift_beginAccess();
  return (PMSafariAutoFillEditingStrongPasswordInformationViewControllerDelegate *)(id)MEMORY[0x2494FCAC0](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (CGSize)contentSize
{
  void *ObjCClassFromMetadata;
  PMSafariAutoFillEditingStrongPasswordInformationViewController *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  swift_getObjectType();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v4 = self;
  if (objc_msgSend(ObjCClassFromMetadata, sel_shouldShowView))
  {
    v5 = -[PMSafariAutoFillEditingStrongPasswordInformationViewController view](v4, sel_view);
    if (!v5)
    {
      __break(1u);
      goto LABEL_7;
    }
    v8 = v5;
    objc_msgSend(v5, sel_intrinsicContentSize);
    v10 = v9;
    v12 = v11;

  }
  else
  {

    v10 = 0.0;
    v12 = 0.0;
  }
  v6 = v10;
  v7 = v12;
LABEL_7:
  result.height = v7;
  result.width = v6;
  return result;
}

- (NSString)websiteTitle
{
  char *v3;
  PMSafariAutoFillEditingStrongPasswordInformationViewController *v4;
  void *v5;
  _BYTE v7[32];

  v3 = (char *)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anywebsiteTitle;
  swift_beginAccess();
  sub_243540710((uint64_t)v3, (uint64_t)v7);
  v4 = self;
  swift_dynamicCast();

  v5 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setWebsiteTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  PMSafariAutoFillEditingStrongPasswordInformationViewController *v7;
  __int128 v8;
  uint64_t v9;

  v4 = sub_243850264();
  v9 = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v8 = v4;
  *((_QWORD *)&v8 + 1) = v5;
  v6 = (_OWORD *)((char *)self
                + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anywebsiteTitle);
  swift_beginAccess();
  v7 = self;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  sub_24373B97C(&v8, v6);
  swift_endAccess();

}

- (NSURL)formURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  _BYTE v11[32];

  v3 = sub_24384D720();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v7 = (char *)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anyFormURL;
  swift_beginAccess();
  sub_243540710((uint64_t)v7, (uint64_t)v11);
  swift_dynamicCast();
  v8 = (void *)sub_24384D6D8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v8;
}

- (void)setFormURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *boxed_opaque_existential_0;
  _OWORD *v9;
  PMSafariAutoFillEditingStrongPasswordInformationViewController *v10;
  uint64_t v12[3];
  uint64_t v13;

  v4 = sub_24384D720();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  sub_24384D6F0();
  v13 = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
  (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 32))(boxed_opaque_existential_0, v7, v4);
  v9 = (_OWORD *)((char *)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anyFormURL);
  swift_beginAccess();
  v10 = self;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  sub_24373B97C(v12, v9);
  swift_endAccess();

}

- (PMSafariAutoFillEditingStrongPasswordInformationViewController)initWithWebsiteTitle:(id)a3 url:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v4 = sub_24384D720();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_243850264();
  v9 = v8;
  sub_24384D6F0();
  return (PMSafariAutoFillEditingStrongPasswordInformationViewController *)PMSafariAutoFillEditingStrongPasswordInformationViewController.init(websiteTitle:url:)(v7, v9, (uint64_t)v6);
}

- (PMSafariAutoFillEditingStrongPasswordInformationViewController)initWithCoder:(id)a3
{
  _OWORD *v5;
  id v6;
  PMSafariAutoFillEditingStrongPasswordInformationViewController *result;

  swift_unknownObjectWeakInit();
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anyIconController);
  *v5 = 0u;
  v5[1] = 0u;
  v6 = a3;

  result = (PMSafariAutoFillEditingStrongPasswordInformationViewController *)sub_243850984();
  __break(1u);
  return result;
}

- (void)loadView
{
  PMSafariAutoFillEditingStrongPasswordInformationViewController *v2;

  v2 = self;
  PMSafariAutoFillEditingStrongPasswordInformationViewController.loadView()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  PMSafariAutoFillEditingStrongPasswordInformationViewController *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PMSafariAutoFillEditingStrongPasswordInformationViewController;
  v4 = self;
  -[PMSafariAutoFillEditingStrongPasswordInformationViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  sub_243824964();

}

- (PMSafariAutoFillEditingStrongPasswordInformationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PMSafariAutoFillEditingStrongPasswordInformationViewController *result;

  v4 = a4;
  result = (PMSafariAutoFillEditingStrongPasswordInformationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_243541D74((uint64_t)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anywebsiteTitle);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anyFormURL);
  sub_2435381CC((uint64_t)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anyIconController, (uint64_t *)&unk_2572B5900);
  swift_release();
  swift_release();
}

@end
