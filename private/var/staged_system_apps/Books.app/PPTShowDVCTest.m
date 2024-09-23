@implementation PPTShowDVCTest

- (void)startTest
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  -[PPTBasicTest setRunning:](self, "setRunning:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  +[THTestDriver goToFirstChapterWithController:](THTestDriver, "goToFirstChapterWithController:", v3);

  v4 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100159CB0;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end
