@implementation CHWhatsNewViewController

- (CHWhatsNewViewController)initWithFitnessPlusAvailable:(BOOL)a3 buttonHandler:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)();

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    v7 = swift_allocObject(&unk_1007A4108, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_100106890;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  return (CHWhatsNewViewController *)sub_1004C167C(a3, (uint64_t)v8, v7);
}

- (void)viewDidLoad
{
  CHWhatsNewViewController *v2;

  v2 = self;
  sub_1004C183C();

}

- (void)didTapContinueButton
{
  void (*v2)(void);
  CHWhatsNewViewController *v3;

  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR___CHWhatsNewViewController_buttonHandler];
  if (v2)
  {
    v3 = self;
    v2();

  }
}

- (CHWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  CHWhatsNewViewController *result;

  result = (CHWhatsNewViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WhatsNewViewController", 33, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (CHWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  CHWhatsNewViewController *result;

  v6 = a5;
  result = (CHWhatsNewViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WhatsNewViewController", 33, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100022BA4(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR___CHWhatsNewViewController_buttonHandler], *(_QWORD *)&self->buttonHandler[OBJC_IVAR___CHWhatsNewViewController_buttonHandler]);
}

@end
