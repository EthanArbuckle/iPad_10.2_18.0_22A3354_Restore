@implementation _UIStatusBarActivityAction

+ (id)actionForBackgroundActivityType:(int64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62___UIStatusBarActivityAction_actionForBackgroundActivityType___block_invoke;
  v4[3] = &__block_descriptor_40_e22_B16__0___UIStatusBar_8l;
  v4[4] = a3;
  objc_msgSend(a1, "actionWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
