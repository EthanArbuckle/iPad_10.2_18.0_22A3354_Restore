@implementation FPUIActionViewController

- (void)performDismiss:(id)a3
{
  void *v5;
  id v6;
  FPUIActionViewController *v7;
  _QWORD v8[6];

  v8[4] = sub_10046CF30;
  v8[5] = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_10004A82C;
  v8[3] = &unk_1005EE398;
  v5 = _Block_copy(v8);
  v6 = a3;
  v7 = self;
  -[FPUIActionViewController dismissViewControllerAnimated:completion:](v7, "dismissViewControllerAnimated:completion:", 1, v5);
  _Block_release(v5);

}

@end
