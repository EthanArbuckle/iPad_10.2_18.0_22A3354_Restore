@implementation TLKTableViewScrollTester

- (TLKTableViewScrollTester)init
{
  TLKTableViewScrollTester *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TLKTableViewScrollTester;
  v2 = -[TLKTableViewScrollTester init](&v4, sel_init);
  -[TLKTableViewScrollTester setScrollTime:](v2, "setScrollTime:", 30.0);
  return v2;
}

- (void)performScrollTestOnTableView:(id)a3 completion:(id)a4
{
  -[TLKTableViewScrollTester performScrollTestOnTableView:firstScroll:completion:](self, "performScrollTestOnTableView:firstScroll:completion:", a3, 0, a4);
}

- (void)performScrollTestOnTableView:(id)a3 firstScroll:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TLKTableViewScrollTester setFinishedFirstScroll:](self, "setFinishedFirstScroll:", 0);
  -[TLKTableViewScrollTester setTableView:](self, "setTableView:", v10);

  -[TLKTableViewScrollTester setStartTime:](self, "setStartTime:", CACurrentMediaTime());
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_fire_);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addToRunLoop:forMode:", v11, *MEMORY[0x1E0C99860]);

  -[TLKTableViewScrollTester setFirstScroll:](self, "setFirstScroll:", v9);
  -[TLKTableViewScrollTester setCompletion:](self, "setCompletion:", v8);

}

- (void)fire:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  v29 = a3;
  v4 = CACurrentMediaTime();
  -[TLKTableViewScrollTester startTime](self, "startTime");
  v6 = v4 - v5;
  -[TLKTableViewScrollTester scrollTime](self, "scrollTime");
  if (v6 <= v7)
  {
    -[TLKTableViewScrollTester tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;

    -[TLKTableViewScrollTester tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentSize");
    v15 = v14;

    -[TLKTableViewScrollTester tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentInset");
    v18 = v17;
    v20 = v19;

    -[TLKTableViewScrollTester tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentOffset");
    v23 = v22;
    v25 = v24;

    if (-[TLKTableViewScrollTester directionUp](self, "directionUp"))
    {
      v26 = v25 + -24.5;
      if (v25 + -24.5 <= 0.0)
        -[TLKTableViewScrollTester setDirectionUp:](self, "setDirectionUp:", 0);
    }
    else
    {
      v27 = v15 - v12 - v18 - v20;
      v26 = v25 + 24.5;
      if (v25 + 24.5 >= v27)
      {
        -[TLKTableViewScrollTester setDirectionUp:](self, "setDirectionUp:", 1);
        -[TLKTableViewScrollTester finishFirstScrollIfNeeded](self, "finishFirstScrollIfNeeded");
      }
    }
    -[TLKTableViewScrollTester tableView](self, "tableView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContentOffset:animated:", 0, v23, v26);

  }
  else
  {
    -[TLKTableViewScrollTester finishFirstScrollIfNeeded](self, "finishFirstScrollIfNeeded");
    -[TLKTableViewScrollTester completion](self, "completion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[TLKTableViewScrollTester completion](self, "completion");
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v9[2]();

    }
    objc_msgSend(v29, "invalidate");
    -[TLKTableViewScrollTester setCompletion:](self, "setCompletion:", 0);
  }

}

- (void)finishFirstScrollIfNeeded
{
  void *v3;
  void (**v4)(void);

  if (!-[TLKTableViewScrollTester finishedFirstScroll](self, "finishedFirstScroll"))
  {
    -[TLKTableViewScrollTester firstScroll](self, "firstScroll");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[TLKTableViewScrollTester setFinishedFirstScroll:](self, "setFinishedFirstScroll:", 1);
      -[TLKTableViewScrollTester firstScroll](self, "firstScroll");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

    }
  }
}

- (double)scrollTime
{
  return self->_scrollTime;
}

- (void)setScrollTime:(double)a3
{
  self->_scrollTime = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)firstScroll
{
  return self->_firstScroll;
}

- (void)setFirstScroll:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIScrollView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (BOOL)directionUp
{
  return self->_directionUp;
}

- (void)setDirectionUp:(BOOL)a3
{
  self->_directionUp = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (BOOL)finishedFirstScroll
{
  return self->_finishedFirstScroll;
}

- (void)setFinishedFirstScroll:(BOOL)a3
{
  self->_finishedFirstScroll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong(&self->_firstScroll, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
