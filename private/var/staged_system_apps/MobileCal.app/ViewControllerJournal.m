@implementation ViewControllerJournal

- (ViewControllerJournal)init
{
  ViewControllerJournal *v2;
  uint64_t v3;
  NSMutableArray *journal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ViewControllerJournal;
  v2 = -[ViewControllerJournal init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    journal = v2->_journal;
    v2->_journal = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ViewControllerJournal;
  v3 = -[ViewControllerJournal description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, self->_journal));

  return v5;
}

- (id)insertNewLayer
{
  JournalPresentationLayer *v3;

  v3 = objc_alloc_init(JournalPresentationLayer);
  -[NSMutableArray insertObject:atIndex:](self->_journal, "insertObject:atIndex:", v3, 0);
  return v3;
}

- (void)addPushedViewController:(id)a3 withPresenter:(id)a4
{
  NSMutableArray *journal;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  journal = self->_journal;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](journal, "firstObject"));
  v9 = v8;
  if (!v8
    || (v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentingViewController")),
        v10,
        v10 != v13))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ViewControllerJournal insertNewLayer](self, "insertNewLayer"));

    objc_msgSend(v11, "setPresentingViewController:", v13);
    v9 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pushedViewControllers"));
  objc_msgSend(v12, "insertObject:atIndex:", v7, 0);

}

- (void)addPresentedViewController:(id)a3 withPresenter:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ViewControllerJournal insertNewLayer](self, "insertNewLayer"));
  objc_msgSend(v8, "setPresentedViewController:", v7);

  objc_msgSend(v8, "setPresentingViewController:", v6);
}

- (id)nextJournaledViewController
{
  NSEnumerator *v3;
  NSEnumerator *journalEnumerator;
  NSEnumerator *currentLayerEnumerator;
  uint64_t v6;
  void *v7;
  void *v8;
  JournaledDisplayedViewController *v9;
  void *v10;
  NSEnumerator *v11;
  void *v12;
  void *v13;
  void *v14;
  NSEnumerator *v15;
  NSEnumerator *v16;
  NSEnumerator *v17;
  JournaledDisplayedViewController *v18;

  if (!self->_journalEnumerator)
  {
    v3 = (NSEnumerator *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectEnumerator](self->_journal, "objectEnumerator"));
    journalEnumerator = self->_journalEnumerator;
    self->_journalEnumerator = v3;

  }
  currentLayerEnumerator = self->_currentLayerEnumerator;
  if (currentLayerEnumerator)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](currentLayerEnumerator, "nextObject"));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = 0;
      goto LABEL_6;
    }
    v11 = self->_currentLayerEnumerator;
    self->_currentLayerEnumerator = 0;

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_journalEnumerator, "nextObject"));
  if (!v12)
  {
    v17 = self->_journalEnumerator;
    self->_journalEnumerator = 0;

    v8 = 0;
    v10 = 0;
    v7 = 0;
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pushedViewControllers"));
  v15 = (NSEnumerator *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectEnumerator"));
  v16 = self->_currentLayerEnumerator;
  self->_currentLayerEnumerator = v15;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentedViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentingViewController"));
  if (v10)
  {

    v9 = objc_alloc_init(JournaledDisplayedViewController);
    -[JournaledDisplayedViewController setViewController:](v9, "setViewController:", v10);
    -[JournaledDisplayedViewController setPresentingViewController:](v9, "setPresentingViewController:", v8);
    -[JournaledDisplayedViewController setDisplayType:](v9, "setDisplayType:", 1);
    v7 = 0;
    goto LABEL_15;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_currentLayerEnumerator, "nextObject"));

  if (!v7)
  {
    v10 = 0;
    goto LABEL_14;
  }
LABEL_6:
  v9 = objc_alloc_init(JournaledDisplayedViewController);
  -[JournaledDisplayedViewController setViewController:](v9, "setViewController:", v7);
  -[JournaledDisplayedViewController setDisplayType:](v9, "setDisplayType:", 0);
  v10 = 0;
LABEL_15:
  v18 = v9;

  return v18;
}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->_journal, "count") == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayerEnumerator, 0);
  objc_storeStrong((id *)&self->_journalEnumerator, 0);
  objc_storeStrong((id *)&self->_journal, 0);
}

@end
