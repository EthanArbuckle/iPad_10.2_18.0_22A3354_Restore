@implementation PUPickerOnboardingHeaderView

- (PUPickerOnboardingHeaderViewDelegate)delegate
{
  sub_1AABA730C();
}

- (void)setDelegate:(id)a3
{
  PUPickerOnboardingHeaderView *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AABA7368();

}

- (PUPickerOnboardingHeaderView)initWithClientDisplayName:(id)a3 isLimitedLibraryPicker:(BOOL)a4 closeAction:(id)a5
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = a4;
  if (a3)
  {
    v7 = sub_1AB08D498();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  return (PUPickerOnboardingHeaderView *)sub_1AABA739C(v7, v9, v6, a5);
}

- (PUPickerOnboardingHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AABA9488();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  PUPickerOnboardingHeaderView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1AABA9510(width, height, v6, v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)didMoveToWindow
{
  PUPickerOnboardingHeaderView *v2;

  v2 = self;
  sub_1AABA9580();

}

- (void)hovering:(id)a3
{
  id v4;
  PUPickerOnboardingHeaderView *v5;

  v4 = a3;
  v5 = self;
  sub_1AABA98A0(v4);

}

- (PUPickerOnboardingHeaderView)initWithFrame:(CGRect)a3
{
  sub_1AABA9944();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerOnboardingHeaderView_icon);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerOnboardingHeaderView_title);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerOnboardingHeaderView_subtitle);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerOnboardingHeaderView_closeButton);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerOnboardingHeaderView_separatorView);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerOnboardingHeaderView_platterView);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerOnboardingHeaderView_separatorHeightConstraint);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerOnboardingHeaderView_learnMoreButton);
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR___PUPickerOnboardingHeaderView_delegate);
}

@end
