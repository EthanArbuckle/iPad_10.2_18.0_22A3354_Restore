@implementation RemoteExtensionHostViewController

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  _TtC13iCloudQuotaUI33RemoteExtensionHostViewController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_currentDevice);
  v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6 == (id)1)
    return 30;
  else
    return 2;
}

- (_TtC13iCloudQuotaUI33RemoteExtensionHostViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC13iCloudQuotaUI33RemoteExtensionHostViewController *result;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13iCloudQuotaUI33RemoteExtensionHostViewController____lazy_storage___hostViewController) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI33RemoteExtensionHostViewController_appExtension;
  v6 = sub_21F454828();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC13iCloudQuotaUI33RemoteExtensionHostViewController *)sub_21F456754();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t (*v3)(void);
  _TtC13iCloudQuotaUI33RemoteExtensionHostViewController *v4;
  id v5;

  v3 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.isa) + 0x88);
  v4 = self;
  v5 = (id)v3();
  -[UIViewController presentPreferredSizeWithViewController:animated:completion:](v4, sel_presentPreferredSizeWithViewController_animated_completion_, v5, 1, 0);

}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  id v6;
  _TtC13iCloudQuotaUI33RemoteExtensionHostViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_21F3FF810(a4);

}

- (_TtC13iCloudQuotaUI33RemoteExtensionHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13iCloudQuotaUI33RemoteExtensionHostViewController *result;

  v4 = a4;
  result = (_TtC13iCloudQuotaUI33RemoteExtensionHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI33RemoteExtensionHostViewController____lazy_storage___hostViewController));
  sub_21F3654E8((uint64_t)self + OBJC_IVAR____TtC13iCloudQuotaUI33RemoteExtensionHostViewController_appExtension, &qword_2554C4E70);
}

- (uint64_t)hostViewControllerDidActivate:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v0 = sub_21F454930();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21F3A93DC();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_21F454924();
  v6 = sub_21F456364();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v11 = v8;
    *(_DWORD *)v7 = 136315650;
    v10 = sub_21F2D11C4(0xD000000000000035, 0x800000021F475610, &v11);
    sub_21F456514();
    *(_WORD *)(v7 + 12) = 2080;
    v10 = sub_21F2D11C4(0xD000000000000021, 0x800000021F4757F0, &v11);
    sub_21F456514();
    *(_WORD *)(v7 + 22) = 2048;
    v10 = 99;
    sub_21F456514();
    _os_log_impl(&dword_21F2CC000, v5, v6, "%s: %s - line %ld", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2207C9094](v8, -1, -1);
    MEMORY[0x2207C9094](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end
