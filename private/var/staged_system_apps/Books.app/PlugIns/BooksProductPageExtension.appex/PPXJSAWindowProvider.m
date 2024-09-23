@implementation PPXJSAWindowProvider

+ (PPXJSAWindowProvider)sharedProvider
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005E28;
  block[3] = &unk_10002D3D0;
  block[4] = a1;
  if (qword_1000356C0 != -1)
    dispatch_once(&qword_1000356C0, block);
  return (PPXJSAWindowProvider *)(id)qword_1000356C8;
}

- (id)windowFromOptions:(id)a3
{
  return 0;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
