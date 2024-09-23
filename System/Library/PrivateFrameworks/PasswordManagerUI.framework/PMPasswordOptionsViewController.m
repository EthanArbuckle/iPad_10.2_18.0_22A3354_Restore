@implementation PMPasswordOptionsViewController

- (_TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_243850264();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController *)sub_2437AAF40(v5, v7, a4);
}

- (_TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController)initWithCoder:(id)a3
{
  _TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController *result;

  result = (_TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController *)sub_243850984();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController *v2;

  v2 = self;
  sub_2437AB1FC();

}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

@end
