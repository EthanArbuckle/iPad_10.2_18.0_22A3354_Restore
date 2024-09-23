@implementation SBSStatusBarStyleOverridesAssertion

+ (id)backgroundLocationAssertionForPID:(int)a3
{
  return +[SBSStatusBarStyleOverridesAssertion assertionWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:](SBSStatusBarStyleOverridesAssertion, "assertionWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", 2048, *(_QWORD *)&a3, 0, 0);
}

+ (id)assertionWithStatusBarStyleOverrides:(unint64_t)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  return -[SBSStatusBarStyleOverridesAssertion initWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:]([SBSStatusBarStyleOverridesAssertion alloc], "initWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", a3, *(_QWORD *)&a4, a5, a6);
}

- (SBSStatusBarStyleOverridesAssertion)initWithStatusBarStyleOverrides:(unint64_t)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v10;
  SBSBackgroundActivityAssertionData *v11;
  SBSStatusBarStyleOverridesAssertion *v12;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  soft_STUIBackgroundActivityIdentifiersForStyleOverrides(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBSBackgroundActivityAssertionData initWithBackgroundActivityIdentifiers:forPID:exclusive:showsWhenForeground:]([SBSBackgroundActivityAssertionData alloc], "initWithBackgroundActivityIdentifiers:forPID:exclusive:showsWhenForeground:", v10, v8, v7, v6);
  v12 = -[SBSBackgroundActivityAssertion initWithBackgroundActivityAssertionData:](self, "initWithBackgroundActivityAssertionData:", v11);

  return v12;
}

- (unint64_t)statusBarStyleOverrides
{
  return soft_STUIStyleOverridesForBackgroundActivityIdentifiers((uint64_t)-[SBSBackgroundActivityAssertion backgroundActivityIdentifiers](self, "backgroundActivityIdentifiers"));
}

@end
