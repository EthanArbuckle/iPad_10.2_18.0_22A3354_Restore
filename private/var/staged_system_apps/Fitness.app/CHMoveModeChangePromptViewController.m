@implementation CHMoveModeChangePromptViewController

- (CHMoveModeChangePromptViewController)initWithNextMoveMode:(int64_t)a3 notificationType:(int64_t)a4 healthStore:(id)a5 formattingManager:(id)a6
{
  return (CHMoveModeChangePromptViewController *)sub_100597424(a3, a4, a5, a6);
}

- (void)viewDidLoad
{
  CHMoveModeChangePromptViewController *v2;

  v2 = self;
  sub_100597590();

}

- (void)didTapAcceptButton
{
  CHMoveModeChangePromptViewController *v2;

  v2 = self;
  sub_1005978E4();

}

- (void)didTapSkipButton
{
  -[CHMoveModeChangePromptViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (CHMoveModeChangePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  CHMoveModeChangePromptViewController *result;

  result = (CHMoveModeChangePromptViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.MoveModeChangePromptViewController", 45, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (CHMoveModeChangePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  CHMoveModeChangePromptViewController *result;

  v6 = a5;
  result = (CHMoveModeChangePromptViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.MoveModeChangePromptViewController", 45, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
