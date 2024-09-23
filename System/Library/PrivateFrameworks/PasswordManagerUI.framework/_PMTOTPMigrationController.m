@implementation _PMTOTPMigrationController

- (UIViewController)viewController
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_viewController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setViewController:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_viewController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtP17PasswordManagerUI34_PMTOTPMigrationControllerDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_delegate;
  swift_beginAccess();
  return (_TtP17PasswordManagerUI34_PMTOTPMigrationControllerDelegate_ *)(id)MEMORY[0x2494FCAC0](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC17PasswordManagerUI26_PMTOTPMigrationController)initWithMigrationURL:(id)a3 delegate:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v5 = sub_24384D720();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24384D6F0();
  swift_unknownObjectRetain();
  return (_TtC17PasswordManagerUI26_PMTOTPMigrationController *)_PMTOTPMigrationController.init(migrationURL:delegate:)((uint64_t)v7, (uint64_t)a4);
}

- (void)addGenerator:(id)a3 toSavedAccount:(id)a4
{
  id v6;
  id v7;
  _TtC17PasswordManagerUI26_PMTOTPMigrationController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_243825570(v6, v7);

}

- (int64_t)numberOfCodes
{
  _TtC17PasswordManagerUI26_PMTOTPMigrationController *v3;
  int64_t v4;
  uint64_t v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_24384DED0();
  swift_release();
  swift_release();
  v4 = *(_QWORD *)(v6 + 16);

  swift_bridgeObjectRelease();
  return v4;
}

- (NSArray)totpGenerators
{
  _TtC17PasswordManagerUI26_PMTOTPMigrationController *v3;
  void *v4;
  uint64_t v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_24384DED0();
  swift_release();
  swift_release();
  sub_243541B04(v6);

  swift_bridgeObjectRelease();
  sub_243543548();
  v4 = (void *)sub_243850408();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (_TtC17PasswordManagerUI26_PMTOTPMigrationController)init
{
  _TtC17PasswordManagerUI26_PMTOTPMigrationController *result;

  result = (_TtC17PasswordManagerUI26_PMTOTPMigrationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_appState));
  v3 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_migrationURL;
  v4 = sub_24384D720();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_viewController));
  sub_243541D74((uint64_t)self + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_delegate);
}

@end
