@implementation SummaryBannerViewController

- (_TtC9SeymourUI27SummaryBannerViewController)initWithCoder:(id)a3
{
  _TtC9SeymourUI27SummaryBannerViewController *result;

  result = (_TtC9SeymourUI27SummaryBannerViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI27SummaryBannerViewController)initWithRequest:(id)a3
{
  id v3;
  _TtC9SeymourUI27SummaryBannerViewController *result;

  v3 = a3;
  result = (_TtC9SeymourUI27SummaryBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI27SummaryBannerViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v6;
  id v7;
  _TtC9SeymourUI27SummaryBannerViewController *result;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = a5;
  result = (_TtC9SeymourUI27SummaryBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI27SummaryBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI27SummaryBannerViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI27SummaryBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI27SummaryBannerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22B67A55C(v7);

}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC9SeymourUI27SummaryBannerViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_22B67A800(a4);

}

- (uint64_t)messageViewController:(double)a1 didUpdateSize:(double)a2
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v12;
  double v13;

  v4 = sub_22BA7FE00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA7F950();
  v8 = sub_22BA7FDF4();
  v9 = sub_22BA80CD0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    *(_DWORD *)v10 = 134349312;
    v13 = a1;
    sub_22BA81240();
    *(_WORD *)(v10 + 12) = 2050;
    v13 = a2;
    sub_22BA81240();
    _os_log_impl(&dword_22B0E6000, v8, v9, "[UM] Summary Banner size: %{public}f x %{public}f", (uint8_t *)v10, 0x16u);
    MEMORY[0x22E2F3F0C](v10, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
