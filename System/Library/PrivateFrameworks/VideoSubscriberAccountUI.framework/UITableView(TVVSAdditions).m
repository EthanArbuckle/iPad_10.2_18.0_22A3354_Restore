@implementation UITableView(TVVSAdditions)

- (id)vs_indexPathForFirstFocusableRow
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(a1, "numberOfSections") < 1)
  {
LABEL_10:
    v4 = 0;
  }
  else
  {
    v2 = 0;
    while (1)
    {
      if (objc_msgSend(a1, "numberOfRowsInSection:", v2) >= 1)
      {
        v3 = 0;
        while (1)
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v3, v2);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(a1, "vs_canFocusRowAtIndexPath:", v4) & 1) != 0)
            break;

          if (++v3 >= objc_msgSend(a1, "numberOfRowsInSection:", v2))
            goto LABEL_9;
        }
        if (v4)
          break;
      }
LABEL_9:
      if (++v2 >= objc_msgSend(a1, "numberOfSections"))
        goto LABEL_10;
    }
  }
  return v4;
}

- (BOOL)vs_containsIndexPath:()TVVSAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 >= objc_msgSend(a1, "numberOfSections"))
  {
    v7 = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "row");
    v7 = v6 < objc_msgSend(a1, "numberOfRowsInSection:", objc_msgSend(v4, "section"));
  }

  return v7;
}

- (uint64_t)vs_canFocusRowAtIndexPath:()TVVSAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "vs_hasRowAtIndexPath:", v4))
  {
    objc_msgSend(a1, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(v5, "tableView:canFocusRowAtIndexPath:", a1, v4);
    else
      v6 = 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)vs_hasRowAtIndexPath:()TVVSAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;

  v4 = a3;
  v5 = v4;
  v8 = 0;
  if (v4)
  {
    if ((objc_msgSend(v4, "section") & 0x8000000000000000) == 0
      && (objc_msgSend(v5, "row") & 0x8000000000000000) == 0)
    {
      v6 = objc_msgSend(v5, "section");
      if (v6 < objc_msgSend(a1, "numberOfSections"))
      {
        v7 = objc_msgSend(v5, "row");
        if (v7 < objc_msgSend(a1, "numberOfRowsInSection:", objc_msgSend(v5, "section")))
          v8 = 1;
      }
    }
  }

  return v8;
}

- (double)vs_scrollToTopContentOffset
{
  double v2;
  double v3;

  objc_msgSend(a1, "contentOffset");
  v3 = v2;
  objc_msgSend(a1, "adjustedContentInset");
  return v3;
}

- (uint64_t)vs_scrollToTopAnimated:()TVVSAdditions
{
  objc_msgSend(a1, "vs_scrollToTopContentOffset");
  return objc_msgSend(a1, "setContentOffset:animated:", a3);
}

- (void)vs_scrollViewDidEndScrollingAnimation
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "vs_scrollCompletionOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    VSDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[UITableView(TVVSAdditions) vs_scrollViewDidEndScrollingAnimation]";
      _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(a1, "vs_scrollCompletionOperations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "vs_scrollCompletionOperations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", 0);

    objc_msgSend(v6, "start");
  }
}

- (void)vs_scrollToTopAnimated:()TVVSAdditions completion:
{
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[UITableView(TVVSAdditions) vs_scrollToTopAnimated:completion:]";
    _os_log_impl(&dword_2303C5000, v7, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  objc_msgSend(a1, "vs_scrollCompletionOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "vs_setScrollCompletionOperations:", v9);

  }
  objc_msgSend(a1, "vs_scrollToTopAnimated:", a3);
  if ((objc_msgSend(a1, "isScrollAnimating") & 1) != 0)
  {
    v10 = (void *)MEMORY[0x24BDD1478];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __64__UITableView_TVVSAdditions__vs_scrollToTopAnimated_completion___block_invoke;
    v13[3] = &unk_24FE19C00;
    v14 = v6;
    objc_msgSend(v10, "blockOperationWithBlock:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "vs_scrollCompletionOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v11);

  }
  else
  {
    v6[2](v6);
  }

}

- (void)vs_scrollToIndexPath:()TVVSAdditions atScrollPosition:animated:withCompletion:
{
  id v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD);
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  VSDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[UITableView(TVVSAdditions) vs_scrollToIndexPath:atScrollPosition:animated:withCompletion:]";
    _os_log_impl(&dword_2303C5000, v12, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  objc_msgSend(a1, "vs_scrollCompletionOperations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "vs_setScrollCompletionOperations:", v14);

  }
  objc_msgSend(a1, "scrollToRowAtIndexPath:atScrollPosition:animated:", v10, a4, a5);
  if ((objc_msgSend(a1, "isScrollAnimating") & 1) != 0)
  {
    v15 = (void *)MEMORY[0x24BDD1478];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __92__UITableView_TVVSAdditions__vs_scrollToIndexPath_atScrollPosition_animated_withCompletion___block_invoke;
    v18[3] = &unk_24FE19C00;
    v19 = v11;
    objc_msgSend(v15, "blockOperationWithBlock:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "vs_scrollCompletionOperations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v16);

  }
  else
  {
    v11[2](v11);
  }

}

- (id)vs_scrollCompletionOperations
{
  return objc_getAssociatedObject(a1, "VSScrollCompletionOperationsKey");
}

- (void)vs_setScrollCompletionOperations:()TVVSAdditions
{
  objc_setAssociatedObject(a1, "VSScrollCompletionOperationsKey", a3, (void *)1);
}

@end
