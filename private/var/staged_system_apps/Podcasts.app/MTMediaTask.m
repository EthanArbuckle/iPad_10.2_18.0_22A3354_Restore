@implementation MTMediaTask

- (MTMediaTask)initWithType:(int64_t)a3
{
  MTMediaTask *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  AMSMediaTask *v10;
  AMSMediaTask *mediaTask;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTMediaTask;
  v4 = -[MTMediaTask init](&v13, "init");
  if (v4)
  {
    if (a3)
      v5 = 301;
    else
      v5 = 300;
    v6 = objc_alloc((Class)AMSMediaTask);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PFClientUtil mediaApiClientIdentifier](PFClientUtil, "mediaApiClientIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PFClientUtil mediaApiClientVersion](PFClientUtil, "mediaApiClientVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
    v10 = (AMSMediaTask *)objc_msgSend(v6, "initWithType:clientIdentifier:clientVersion:bag:", v5, v7, v8, v9);
    mediaTask = v4->_mediaTask;
    v4->_mediaTask = v10;

    if (a3)
      -[AMSMediaTask setIncludedResultKeys:](v4->_mediaTask, "setIncludedResultKeys:", &off_1004D74B8);
  }
  return v4;
}

- (void)setIdentifiers:(id)a3
{
  -[AMSMediaTask setItemIdentifiers:](self->_mediaTask, "setItemIdentifiers:", a3);
}

- (void)setCharts:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector(self->_mediaTask, "setCharts:") & 1) != 0)
    -[AMSMediaTask setCharts:](self->_mediaTask, "setCharts:", v3);
}

- (NSArray)identifiers
{
  return (NSArray *)-[AMSMediaTask itemIdentifiers](self->_mediaTask, "itemIdentifiers");
}

- (void)perform:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSMediaTask perform](self->_mediaTask, "perform"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B4B28;
  v7[3] = &unk_1004A9678;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addFinishBlock:", v7);

}

- (BOOL)charts
{
  return self->_charts;
}

- (AMSMediaTask)mediaTask
{
  return self->_mediaTask;
}

- (void)setMediaTask:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaTask, 0);
}

@end
