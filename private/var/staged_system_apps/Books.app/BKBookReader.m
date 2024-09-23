@implementation BKBookReader

- (float)getFloatDefault:(id)a3 default:(float)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "floatForKey:", v5);
  v8 = v7;

  if (v8 <= 0.0)
    return a4;
  else
    return v8;
}

- (BKBookReader)initWithDelegate:(id)a3
{
  id v5;
  BKBookReader *v6;
  BKBookReader *v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKBookReader;
  v6 = -[BKBookReader init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v7->_state = 0;
    LODWORD(v8) = 2.0;
    -[BKBookReader getFloatDefault:default:](v7, "getFloatDefault:default:", CFSTR("BKBookReaderSleepBeforePagination"), v8);
    v7->_sleepBeforePagination = v9;
    LODWORD(v10) = 1.0;
    -[BKBookReader getFloatDefault:default:](v7, "getFloatDefault:default:", CFSTR("BKBookReaderSleepBeforeNextBook"), v10);
    v7->_sleepBeforeNextBook = v11;
    LODWORD(v12) = 0.5;
    -[BKBookReader getFloatDefault:default:](v7, "getFloatDefault:default:", CFSTR("BKBookReaderSleepBeforeSnapshot"), v12);
    v7->_sleepBeforeSnapshot = v13;
  }

  return v7;
}

- (void)doneSleepingBeforeNextBook
{
  unsigned int v3;
  unsigned int v4;
  int v5;

  if (self->_state == 1)
  {
    -[BKBookReaderDelegate openNextBook](self->_delegate, "openNextBook");
    v3 = -[BKBookReaderDelegate paginationDidEnd](self->_delegate, "paginationDidEnd");
    v4 = -[BKBookReaderDelegate bookDidAppear](self->_delegate, "bookDidAppear");
    if (v3)
    {
      if (v4)
      {
        -[BKBookReaderDelegate goToFirstPage](self->_delegate, "goToFirstPage");
        v5 = 9;
      }
      else
      {
        v5 = 4;
      }
    }
    else if (v4)
    {
      v5 = 5;
    }
    else
    {
      v5 = 6;
    }
    self->_state = v5;
  }
}

- (void)sleepBeforeNextBook
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, (uint64_t)(float)(self->_sleepBeforeNextBook * 1000000000.0));
  v4 = objc_claimAutoreleasedReturnValue(-[BKBookReaderDelegate queue](self->_delegate, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001765DC;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

- (void)doneSleepingBeforeSnapshot
{
  if (self->_state == 2)
  {
    -[BKBookReaderDelegate takeSnapshot](self->_delegate, "takeSnapshot");
    -[BKBookReaderDelegate goToNextPage](self->_delegate, "goToNextPage");
    self->_state = 7;
  }
}

- (void)sleepBeforeSnapshot
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, (uint64_t)(float)(self->_sleepBeforeSnapshot * 1000000000.0));
  v4 = objc_claimAutoreleasedReturnValue(-[BKBookReaderDelegate queue](self->_delegate, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001766C4;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

- (void)doneSleepingBeforePagination
{
  if (self->_state == 3)
  {
    -[BKBookReader sleepBeforeSnapshot](self, "sleepBeforeSnapshot");
    self->_state = 2;
  }
}

- (void)sleepBeforePagination
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, (uint64_t)(float)(self->_sleepBeforePagination * 1000000000.0));
  v4 = objc_claimAutoreleasedReturnValue(-[BKBookReaderDelegate queue](self->_delegate, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001767A0;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

- (void)decideAboutOpeningTheNextBook
{
  int v3;

  if (-[BKBookReaderDelegate hasPendingBook](self->_delegate, "hasPendingBook"))
  {
    -[BKBookReader sleepBeforeNextBook](self, "sleepBeforeNextBook");
    v3 = 1;
  }
  else
  {
    -[BKBookReaderDelegate terminateTest](self->_delegate, "terminateTest");
    v3 = 0;
  }
  self->_state = v3;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKBookReaderDelegate queue](self->_delegate, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100176860;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)paginationDidEnd
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKBookReaderDelegate queue](self->_delegate, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017692C;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)libraryDidAppear
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKBookReaderDelegate queue](self->_delegate, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001769EC;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)bookDidAppear
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKBookReaderDelegate queue](self->_delegate, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100176A74;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)newPageIsReady
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKBookReaderDelegate queue](self->_delegate, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100176B34;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)pageTurnFailed
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKBookReaderDelegate queue](self->_delegate, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100176BE0;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)firstPageRequested
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKBookReaderDelegate queue](self->_delegate, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100176CBC;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
