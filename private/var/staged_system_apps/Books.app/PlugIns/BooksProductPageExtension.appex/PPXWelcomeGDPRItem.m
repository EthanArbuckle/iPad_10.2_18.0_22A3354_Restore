@implementation PPXWelcomeGDPRItem

- (id)welcomeScreenViewControllerWithCompletion:(id)a3
{
  id v3;
  PPXWelcomeGDPRViewController *v4;
  id v5;
  PPXWelcomeGDPRViewController *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = [PPXWelcomeGDPRViewController alloc];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003964;
  v8[3] = &unk_10002D0F8;
  v9 = v3;
  v5 = v3;
  v6 = -[PPXWelcomeGDPRViewController initWithCompletion:](v4, "initWithCompletion:", v8);

  return v6;
}

@end
