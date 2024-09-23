@implementation MTChapterResultsController

- (MTChapterResultsController)init
{
  MTChapterResultsController *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTChapterResultsController;
  v2 = -[MTChapterResultsController init](&v8, "init");
  if (v2 && (os_feature_enabled_bluemoon() & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = IMAVPlayerNotification_MediaItemDidChange;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "player"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "reloadData", v4, v6);

    -[MTChapterResultsController reloadData](v2, "reloadData");
  }
  return v2;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "player"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController currentItem](self, "currentItem"));
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController currentItem](self, "currentItem"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v9 = IMMediaItemDidLoadChaptersNotification;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController currentItem](self, "currentItem"));
      objc_msgSend(v8, "removeObserver:name:object:", self, v9, v10);

    }
    else
    {
      v9 = IMMediaItemDidLoadChaptersNotification;
    }
    -[MTChapterResultsController setCurrentItem:](self, "setCurrentItem:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController currentItem](self, "currentItem"));
    objc_msgSend(v11, "addObserver:selector:name:object:", self, "didLoadChapters", v9, v12);

    -[MTChapterResultsController didLoadChapters](self, "didLoadChapters");
  }

}

- (MTPlayerItem)currentItem
{
  return self->_currentItem;
}

- (void)setCurrentItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentItem, a3);
}

- (void)didLoadChapters
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController currentItem](self, "currentItem"));
  v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timeChapters"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
  objc_msgSend(v4, "controllerWillChangeContent:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, 0));
      objc_msgSend(v10, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", self, v9, v11, 2, 0);

      ++v7;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
      v13 = objc_msgSend(v12, "count");

    }
    while (v7 < (unint64_t)v13);
  }
  -[MTChapterResultsController setChapters:](self, "setChapters:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = 0;
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v16));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v16, 0));
      objc_msgSend(v19, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", self, v18, 0, 1, v20);

      ++v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
      v22 = objc_msgSend(v21, "count");

    }
    while (v16 < (unint64_t)v22);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
  objc_msgSend(v23, "controllerDidChangeContent:", self);

}

- (NSArray)chapters
{
  return self->_chapters;
}

- (void)setChapters:(id)a3
{
  objc_storeStrong((id *)&self->_chapters, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTChapterResultsController;
  -[MTChapterResultsController dealloc](&v4, "dealloc");
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
  v6 = objc_msgSend(v4, "row");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v6));
  return v7;
}

- (id)indexPathForObject:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0);
}

- (unint64_t)numberOfObjectsInSection:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters", a3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
}

@end
