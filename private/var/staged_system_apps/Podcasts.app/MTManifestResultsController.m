@implementation MTManifestResultsController

- (void)setManifest:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_manifest, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_manifestDidChange", IMPlayerManifestDidChange, v5);

  -[MTManifestResultsController reloadData](self, "reloadData");
}

- (MTManifestResultsController)initWithPlayerController:(id)a3
{
  id v4;
  MTManifestResultsController *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTManifestResultsController;
  v5 = -[MTListResultsController init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = IMAVPlayerNotification_MediaItemDidChange;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "player"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "_manifestDidChange", v7, v8);

  }
  return v5;
}

- (void)reloadData
{
  id v3;
  void *v4;
  unint64_t i;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTManifestResultsController manifest](self, "manifest"));
  v10 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  for (i = -[MTManifestResultsController startingIndexForDisplay](self, "startingIndexForDisplay"); ; ++i)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTManifestResultsController manifest](self, "manifest"));
    v7 = objc_msgSend(v6, "count");

    if (i >= (unint64_t)v7)
      break;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTManifestResultsController manifest](self, "manifest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", i));

    if (v9)
      objc_msgSend(v10, "addObject:", v9);

  }
  -[MTListResultsController setObjects:](self, "setObjects:", v10);

}

- (MTPlayerManifest)manifest
{
  return self->_manifest;
}

- (unint64_t)startingIndexForDisplay
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTManifestResultsController manifest](self, "manifest"));
  v3 = objc_msgSend(v2, "currentIndex");

  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return (unint64_t)v3;
}

- (void)_manifestDidChange
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048214;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTManifestResultsController;
  -[MTManifestResultsController dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
}

@end
