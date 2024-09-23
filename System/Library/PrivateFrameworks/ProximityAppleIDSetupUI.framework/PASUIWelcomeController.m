@implementation PASUIWelcomeController

- (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v7 = sub_220D99364();
  v9 = v8;
  if (a4)
  {
    a4 = (id)sub_220D99364();
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  v12 = a5;
  return (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController *)sub_220D956E8(v7, v9, (uint64_t)a4, v11, a5);
}

- (void)viewDidLoad
{
  char *v2;
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PASUIWelcomeController();
  v2 = (char *)v5.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ProximityAppleIDSetupUI22PASUIWelcomeController_activityIndicatorView];
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0, v5.receiver, v5.super_class);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, sel_setContentCompressionResistancePriority_forAxis_, 1, v4);
  sub_220D95DE0();
  sub_220D95948();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC23ProximityAppleIDSetupUI22PASUIWelcomeController *v5;

  v4 = a3;
  v5 = self;
  sub_220D95948();

}

- (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC23ProximityAppleIDSetupUI22PASUIWelcomeController *result;

  result = (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC23ProximityAppleIDSetupUI22PASUIWelcomeController *result;

  v6 = a5;
  result = (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ProximityAppleIDSetupUI22PASUIWelcomeController_activityIndicatorView));
}

@end
