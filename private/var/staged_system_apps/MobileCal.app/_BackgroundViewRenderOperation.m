@implementation _BackgroundViewRenderOperation

- (_BackgroundViewRenderOperation)initWithView:(id)a3 views:(id)a4 bounds:(CGRect)a5 traitCollection:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  id v16;
  _BackgroundViewRenderOperation *v17;
  _BackgroundViewRenderOperation *v18;
  objc_super v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_BackgroundViewRenderOperation;
  v17 = -[_BackgroundViewRenderOperation init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_view, a3);
    objc_storeStrong((id *)&v18->_views, a4);
    v18->_bounds.origin.x = x;
    v18->_bounds.origin.y = y;
    v18->_bounds.size.width = width;
    v18->_bounds.size.height = height;
    objc_storeStrong((id *)&v18->_traits, a6);
  }

  return v18;
}

- (void)main
{
  NSMutableSet *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  UITraitCollection *traits;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[5];
  id v11;

  v3 = self->_views;
  objc_sync_enter(v3);
  -[NSMutableSet removeObject:](self->_views, "removeObject:", self->_view);
  objc_sync_exit(v3);

  if ((-[_BackgroundViewRenderOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BackgroundViewRenderOperation view](self, "view"));
    if (objc_msgSend(v4, "hasOccurrences"))
    {

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BackgroundViewRenderOperation view](self, "view"));
      v6 = objc_msgSend(v5, "hasDrawnBefore");

      if (!v6)
        return;
    }
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = sub_10005296C;
    v10[4] = sub_10005297C;
    v11 = 0;
    traits = self->_traits;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100056F60;
    v9[3] = &unk_1001B3030;
    v9[4] = self;
    v9[5] = v10;
    -[UITraitCollection performAsCurrentTraitCollection:](traits, "performAsCurrentTraitCollection:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005707C;
    v8[3] = &unk_1001B3030;
    v8[4] = self;
    v8[5] = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
    _Block_object_dispose(v10, 8);

  }
}

- (MonthWeekOccurrencesView)view
{
  return (MonthWeekOccurrencesView *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_views, 0);
}

@end
