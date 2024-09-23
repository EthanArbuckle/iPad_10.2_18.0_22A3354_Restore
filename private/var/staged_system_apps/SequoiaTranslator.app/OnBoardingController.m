@implementation OnBoardingController

- (_TtC17SequoiaTranslator20OnBoardingController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC17SequoiaTranslator20OnBoardingController *result;
  uint64_t v13;

  v5 = type metadata accessor for TranslationTaskHint(0, a2);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController_languagesService;
  (*(void (**)(char *, _QWORD))(v9 + 104))(v7, enum case for TranslationTaskHint.speech(_:));
  v10 = type metadata accessor for LanguagesService(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)LanguagesService.init(task:)(v7);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController____lazy_storage___onBoardingController) = 0;
  *(_QWORD *)&self->languagesService[OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController_oBDelegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC17SequoiaTranslator20OnBoardingController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001F88D0, "SequoiaTranslator/OnBoardingController.swift", 44, 2, 33, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  Class isa;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for OnBoardingController();
  v2 = v7.receiver;
  -[OnBoardingController viewDidLoad](&v7, "viewDidLoad");
  objc_msgSend(v2, "setNavigationBarHidden:", 1);
  v3 = sub_100006DF4((uint64_t *)&unk_10028C060);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_1001EA980;
  v5 = sub_10013BEF8();
  *(_QWORD *)(v4 + 32) = v5;
  specialized Array._endMutation()(v5);
  sub_10000A05C(0, (unint64_t *)&unk_1002953D0, UIViewController_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v2, "setViewControllers:", isa, swift_bridgeObjectRelease().n128_f64[0]);

}

- (NSArray)keyCommands
{
  uint64_t v3;
  uint64_t v4;
  _TtC17SequoiaTranslator20OnBoardingController *v5;
  NSString v6;
  id v7;
  uint64_t v8;
  Class isa;

  v3 = sub_100006DF4((uint64_t *)&unk_10028C060);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_1001EA980;
  v5 = self;
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend((id)objc_opt_self(UIKeyCommand), "keyCommandWithInput:modifierFlags:action:", v6, 0, "_primaryActionKeyTriggered");

  *(_QWORD *)(v4 + 32) = v7;
  specialized Array._endMutation()(v8);

  sub_10000A05C(0, (unint64_t *)&qword_100297A40, UIKeyCommand_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)_primaryActionKeyTriggered
{
  _TtC17SequoiaTranslator20OnBoardingController *v2;

  v2 = self;
  sub_10013D1DC();

}

- (void)continueButtonPressed
{
  char v2;
  uint64_t Strong;
  uint64_t v4;
  _TtC17SequoiaTranslator20OnBoardingController *v5;

  v2 = *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController_whatsNew);
  v5 = self;
  if ((v2 & 1) == 0)
    sub_10013D394();
  Strong = swift_unknownObjectWeakLoadStrong((char *)v5 + OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController_oBDelegate);
  if (Strong)
  {
    v4 = Strong;
    sub_10013EBC4(v5);

    swift_unknownObjectRelease(v4);
  }
  else
  {

  }
}

- (_TtC17SequoiaTranslator20OnBoardingController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC17SequoiaTranslator20OnBoardingController *result;

  result = (_TtC17SequoiaTranslator20OnBoardingController *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.OnBoardingController", 38, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC17SequoiaTranslator20OnBoardingController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC17SequoiaTranslator20OnBoardingController *result;

  v3 = a3;
  result = (_TtC17SequoiaTranslator20OnBoardingController *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.OnBoardingController", 38, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC17SequoiaTranslator20OnBoardingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17SequoiaTranslator20OnBoardingController *result;

  v4 = a4;
  result = (_TtC17SequoiaTranslator20OnBoardingController *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.OnBoardingController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController_languagesService));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController____lazy_storage___onBoardingController));
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController_oBDelegate);
}

@end
