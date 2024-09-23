@implementation ViewController

- (void)showDebugController
{
  uint64_t v2;
  _TtC7Measure14ViewController *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v2 = qword_10047A930;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10047A930, sub_100083368);
  v4 = (void *)xmmword_1004AF228;
  if ((_QWORD)xmmword_1004AF228)
  {
    v5 = objc_allocWithZone((Class)UINavigationController);
    v6 = v4;
    v7 = objc_msgSend(v5, "initWithRootViewController:", v6);
    objc_msgSend(v7, "setModalPresentationStyle:", -2);
    -[ViewController presentViewController:animated:completion:](v3, "presentViewController:animated:completion:", v7, 1, 0);

  }
  else
  {
    __break(1u);
  }
}

- (void)caDisplayLinkCallback
{
  _TtC7Measure14ViewController *v2;

  v2 = self;
  sub_1001CE754();

}

@end
