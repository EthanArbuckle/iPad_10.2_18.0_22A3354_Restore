@implementation FRDragController

- (FRDragController)initWithDataSource:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  FRDragController *v8;
  FRDragController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FRDragController;
  v8 = -[FRDragController init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_context, a4);
  }

  return v9;
}

- (id)_collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[FRDragController dragItemsForIndexPath:](self, "dragItemsForIndexPath:", a5, a4);
}

- (id)_collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return -[FRDragController dragItemsForIndexPath:](self, "dragItemsForIndexPath:", a5, a4, a6.x, a6.y);
}

- (id)_tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[FRDragController dragItemsForIndexPath:](self, "dragItemsForIndexPath:", a5, a4);
}

- (id)_tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return -[FRDragController dragItemsForIndexPath:](self, "dragItemsForIndexPath:", a5, a4, a6.x, a6.y);
}

- (id)_collectionView:(id)a3 liftingPreviewParametersForItemAtIndexPath:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRDragController visiblePathForIndexPath:](self, "visiblePathForIndexPath:", a4));
  v5 = objc_alloc_init((Class)UIDragPreviewParameters);
  objc_msgSend(v5, "setVisiblePath:", v4);

  return v5;
}

- (id)dragItemsForIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRDragController dataSource](self, "dataSource"));
  v6 = objc_opt_respondsToSelector(v5, "dragController:headlineForCellAtIndexPath:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRDragController dataSource](self, "dataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dragController:headlineForCellAtIndexPath:", self, v4));

  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRDragController dataSource](self, "dataSource"));
  v10 = objc_opt_respondsToSelector(v9, "dragController:feedForCellAtIndexPath:");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRDragController dataSource](self, "dataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dragController:feedForCellAtIndexPath:", self, v4));

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRDragController dragItemsForHeadline:](self, "dragItemsForHeadline:", v8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRDragController dragItemsForFeed:](self, "dragItemsForFeed:", v12));
  v15 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v13);
  -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v14);
  if (-[NSMutableArray count](v15, "count"))
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v15));
  else
    v16 = 0;

  return v16;
}

- (id)dragItemsForHeadline:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "articleID"));
  if (v5)
  {
    v6 = -[FRDragController isHeadlineDraggable:](self, "isHeadlineDraggable:", v4);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "articleID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v8, v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL nss_NewsURLForArticleID:title:](NSURL, "nss_NewsURLForArticleID:title:", v7, v10));

      v12 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithObject:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
      objc_msgSend(v12, "setSuggestedName:", v13);

      v14 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v14));

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)dragItemsForFeed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fr_NewsURLForTagID:title:](NSURL, "fr_NewsURLForTagID:title:", v5, v6));

    v8 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithObject:", v7);
    v9 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v9));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isHeadlineDraggable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  if (objc_msgSend(v4, "isPaid")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRDragController context](self, "context")),
        v5,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRDragController context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "purchaseController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceChannelID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "purchasedTagIDs"));
    v11 = objc_msgSend(v10, "containsObject:", v9);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)visiblePathForIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGRect v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRDragController dataSource](self, "dataSource"));
  v6 = objc_opt_respondsToSelector(v5, "dragController:contentRectOfCellAtIndexPath:");

  if ((v6 & 1) == 0)
    goto LABEL_3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRDragController dataSource](self, "dataSource"));
  objc_msgSend(v7, "dragController:contentRectOfCellAtIndexPath:", self, v4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  if (!CGRectIsEmpty(v18))
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v9, v11, v13, v15));
  else
LABEL_3:
    v16 = 0;

  return v16;
}

- (FRDragControllerDataSource)dataSource
{
  return (FRDragControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (FRFeldsparContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
