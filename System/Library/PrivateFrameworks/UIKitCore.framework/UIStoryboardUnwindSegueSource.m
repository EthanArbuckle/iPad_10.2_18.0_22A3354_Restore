@implementation UIStoryboardUnwindSegueSource

- (UIStoryboardUnwindSegueSource)init
{

  return 0;
}

- (id)_initWithSourceViewController:(id)a3 action:(SEL)a4 sender:(id)a5
{
  id v9;
  id v10;
  UIStoryboardUnwindSegueSource *v11;
  UIStoryboardUnwindSegueSource *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UIStoryboardUnwindSegueSource;
  v11 = -[UIStoryboardUnwindSegueSource init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceViewController, a3);
    v12->_unwindAction = a4;
    objc_storeStrong(&v12->_sender, a5);
  }

  return v12;
}

- (id)_childContainingUnwindSourceForViewController:(id)a3
{
  id v4;
  NSMutableArray *searchChain;
  id v6;
  UIViewController *sourceViewController;
  UIViewController *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  uint64_t *v14;
  _QWORD v15[3];
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__182;
  v21 = __Block_byref_object_dispose__182;
  v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  searchChain = self->_searchChain;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__UIStoryboardUnwindSegueSource__childContainingUnwindSourceForViewController___block_invoke;
  v11[3] = &unk_1E16E3110;
  v13 = v15;
  v6 = v4;
  v12 = v6;
  v14 = &v17;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](searchChain, "enumerateObjectsWithOptions:usingBlock:", 2, v11);
  sourceViewController = (UIViewController *)v18[5];
  if (!sourceViewController)
  {
    -[UIViewController parentViewController](self->_sourceViewController, "parentViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v6)
    {
      v8 = 0;
      goto LABEL_5;
    }
    sourceViewController = self->_sourceViewController;
  }
  v8 = sourceViewController;
LABEL_5:

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void __79__UIStoryboardUnwindSegueSource__childContainingUnwindSourceForViewController___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v7 = a2;
  v8 = *(_QWORD *)(a1[5] + 8);
  v12 = v7;
  if (*(_BYTE *)(v8 + 24))
  {
    objc_msgSend(v7, "parentViewController");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      do
      {
        if (v10 == (void *)a1[4])
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
          *a4 = 1;
        }
        objc_msgSend(v10, "parentViewController");
        v11 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v11;
      }
      while (v11);
    }
  }
  else if ((id)a1[4] == v7)
  {
    *(_BYTE *)(v8 + 24) = 1;
  }

}

- (id)_findDestination
{
  NSMutableArray *v3;
  NSMutableArray *searchChain;
  void *v5;
  UIViewController *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (NSMutableArray *)objc_opt_new();
  searchChain = self->_searchChain;
  self->_searchChain = v3;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_sourceViewController;
  -[UIViewController _nextViewControllerForUnwindSegueSearch](v6, "_nextViewControllerForUnwindSegueSearch");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    while (1)
    {
      -[NSMutableArray addObject:](self->_searchChain, "addObject:", v8);
      objc_msgSend(v8, "_destinationForUnwindingFromSource:visitedViewControllers:", self, v5);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
        break;
      objc_msgSend(v8, "_nextViewControllerForUnwindSegueSearch");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v10;
      if (!v10)
        goto LABEL_8;
    }
    v10 = (void *)v9;

  }
  else
  {
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (UIViewController)sourceViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 16, 1);
}

- (SEL)unwindAction
{
  return self->_unwindAction;
}

- (id)sender
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
  objc_storeStrong((id *)&self->_searchChain, 0);
}

@end
