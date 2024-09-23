@implementation PadShowEventTest

- (void)runTest
{
  void *v3;
  void *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  -[PadShowEventTest _setupViewToDate:](self, "_setupViewToDate:", v4);
  v5 = dispatch_time(0, 4000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DF794;
  v7[3] = &unk_1001B26A0;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);

}

- (id)_getEvent
{
  return 0;
}

- (MainViewController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
