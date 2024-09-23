@implementation DataSharingWelcomeController

- (void)aboutDataSharingTapped
{
  _TtC9SiriSetup28DataSharingWelcomeController *v2;
  void *v3;
  id v4;

  v2 = self;
  v3 = (void *)sub_227767744();
  v4 = objc_msgSend((id)objc_opt_self(), sel_presenterForPrivacySplashWithIdentifier_, v3);

  if (v4)
    objc_msgSend(v4, sel_setPresentingViewController_, v2);
  objc_msgSend(v4, sel_present);

}

- (void)shareTapped
{
  sub_227754B04((char *)self, (uint64_t)a2, (void (*)(void))sub_22774F7D0);
}

- (void)notNowTapped
{
  sub_227754B04((char *)self, (uint64_t)a2, (void (*)(void))sub_22774F8F8);
}

- (_TtC9SiriSetup28DataSharingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC9SiriSetup28DataSharingWelcomeController *result;

  result = (_TtC9SiriSetup28DataSharingWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup28DataSharingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC9SiriSetup28DataSharingWelcomeController *result;

  v6 = a5;
  result = (_TtC9SiriSetup28DataSharingWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2277489F0((uint64_t)self + OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_orbView));
}

@end
