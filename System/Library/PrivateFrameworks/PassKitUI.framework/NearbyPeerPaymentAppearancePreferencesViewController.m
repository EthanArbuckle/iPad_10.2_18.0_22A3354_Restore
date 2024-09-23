@implementation NearbyPeerPaymentAppearancePreferencesViewController

- (_TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_19D55F288();
}

- (void)viewDidLoad
{
  _TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController *v2;

  v2 = self;
  sub_19D55645C();

}

- (int64_t)preferredUserInterfaceStyle
{
  objc_super v3;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_context) != (Class)2)
    return 2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NearbyPeerPaymentAppearancePreferencesViewController();
  return -[NearbyPeerPaymentAppearancePreferencesViewController preferredUserInterfaceStyle](&v3, sel_preferredUserInterfaceStyle);
}

- (void)viewDidLayoutSubviews
{
  _TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController *v2;

  v2 = self;
  sub_19D556A20();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController *v12;
  uint64_t v13;

  v6 = sub_19DE83D78();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE83D48();
  v11 = a3;
  v12 = self;
  sub_19D556D24(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;
  double v5;

  result = 20.0;
  v5 = 0.0;
  if (a4)
    v5 = 20.0;
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_context) != (Class)2)
    return v5;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_context) != (Class)2
    && a4 == 0)
  {
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v4;
  void *v6;
  id v7;
  _TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController *v8;
  double v9;
  CGRect v11;

  v4 = 0.0;
  if (a4 == 1)
  {
    v6 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_footer);
    v7 = a3;
    v8 = self;
    objc_msgSend(v7, sel_bounds);
    objc_msgSend(v6, sel_sizeThatFits_, CGRectGetWidth(v11), 1.79769313e308);
    v4 = v9;

  }
  return v4;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4 == 1)
    return objc_autoreleaseReturnValue(objc_retain(*(id *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_footer)));
  else
    return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController *v5;

  v4 = a3;
  v5 = self;
  sub_19D557400(v4);

}

- (_TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController *result;

  v4 = a4;
  result = (_TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_identityManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_divider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_footer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController____lazy_storage___datasource));
}

@end
