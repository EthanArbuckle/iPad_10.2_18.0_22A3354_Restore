@implementation _UIStoryboardUnwindChain

- (id)initFromSourceViewController:(id)a3 toDestinationViewController:(id)a4
{
  id v7;
  id v8;
  _UIStoryboardUnwindChain *v9;
  uint64_t v10;
  NSMutableArray *viewControllers;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  unint64_t commonAncestorIdx;
  void *v25;
  void *v26;
  _UIStoryboardUnwindChain *v27;
  void *v29;
  void *v30;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)_UIStoryboardUnwindChain;
  v9 = -[_UIStoryboardUnwindChain init](&v31, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    viewControllers = v9->_viewControllers;
    v9->_viewControllers = (NSMutableArray *)v10;

    v12 = v7;
    v13 = v12;
    if (v12)
    {
      v14 = v12;
      while (1)
      {
        -[NSMutableArray addObject:](v9->_viewControllers, "addObject:", v14);
        if (v14 == v8)
          break;
        _UIInternalPreference_ForceIOSDeviceInsets_block_invoke(v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v15;
        if (!v15)
        {
          v16 = 0;
          goto LABEL_8;
        }
      }
      v16 = v8;
LABEL_8:

    }
    if ((unint64_t)-[NSMutableArray count](v9->_viewControllers, "count") <= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("UIStoryboardUnwindSegueTemplate.m"), 83, CFSTR("Could not unwind from %@ to %@ because the parent view controller of %@ could not be found."), v13, v8, v13);

    }
    v17 = -[NSMutableArray count](v9->_viewControllers, "count");
    v9->_commonAncestorIdx = 0x7FFFFFFFFFFFFFFFLL;
    v18 = v8;
    v19 = v18;
    if (v18)
    {
      v20 = v18;
      while (1)
      {
        v21 = -[NSMutableArray indexOfObject:](v9->_viewControllers, "indexOfObject:", v20);
        v9->_commonAncestorIdx = v21;
        v22 = v9->_viewControllers;
        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
          break;
        -[NSMutableArray insertObject:atIndex:](v22, "insertObject:atIndex:", v20, v17);
        _UIInternalPreference_ForceIOSDeviceInsets_block_invoke(v20);
        v23 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v23;
        if (!v23)
          goto LABEL_17;
      }
      -[NSMutableArray removeObjectsInRange:](v22, "removeObjectsInRange:", v21 + 1, v17 + ~v21);

    }
LABEL_17:
    commonAncestorIdx = v9->_commonAncestorIdx;
    if (commonAncestorIdx == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("UIStoryboardUnwindSegueTemplate.m"), 120, CFSTR("Could not unwind from %@ to %@ because a common ancestor could not be found. (Note that it is not supported to unwind from a view controller to one of its descendants.)"), v13, v19);

      commonAncestorIdx = v9->_commonAncestorIdx;
    }
    v9->_modalAncestorContainingSourceIdx = 0x7FFFFFFFFFFFFFFFLL;
    if (commonAncestorIdx)
    {
      while (1)
      {
        -[NSMutableArray objectAtIndexedSubscript:](v9->_viewControllers, "objectAtIndexedSubscript:", commonAncestorIdx);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "childModalViewController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          break;

        if (!--commonAncestorIdx)
          goto LABEL_24;
      }
      v9->_modalAncestorContainingSourceIdx = commonAncestorIdx;

    }
LABEL_24:
    v27 = v9;
  }

  return v9;
}

- (UIViewController)commonAncestorViewController
{
  return (UIViewController *)-[NSMutableArray objectAtIndexedSubscript:](self->_viewControllers, "objectAtIndexedSubscript:", self->_commonAncestorIdx);
}

- (UIViewController)modalAncestorContainingSourceViewController
{
  if (self->_modalAncestorContainingSourceIdx == 0x7FFFFFFFFFFFFFFFLL)
    return (UIViewController *)0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_viewControllers, "objectAtIndexedSubscript:");
  return (UIViewController *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)enumerateViewControllersFromModalAncestorUpToButNotIncludingDestination:(id)a3
{
  unint64_t modalAncestorContainingSourceIdx;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *, void *);

  v10 = (void (**)(id, void *, void *))a3;
  if (self->_modalAncestorContainingSourceIdx == 0x7FFFFFFFFFFFFFFFLL)
    modalAncestorContainingSourceIdx = 0;
  else
    modalAncestorContainingSourceIdx = self->_modalAncestorContainingSourceIdx;
  v5 = -[NSMutableArray count](self->_viewControllers, "count");
  if (modalAncestorContainingSourceIdx < v5 - 1)
  {
    v6 = v5;
    v7 = modalAncestorContainingSourceIdx + 1;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_viewControllers, "objectAtIndexedSubscript:", v7 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_viewControllers, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v8, v9);

      ++v7;
    }
    while (v6 != v7);
  }

}

- (id)debugDescription
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v20;
  _QWORD aBlock[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[3];
  char v25;

  v3 = -[NSMutableArray count](self->_viewControllers, "count");
  if (-[NSMutableArray count](self->_viewControllers, "count") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p (invalid chain)>"), objc_opt_class(), self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_viewControllers, "objectAtIndexedSubscript:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB37A0];
    v7 = objc_opt_class();
    v20 = (void *)v5;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@:%p %@:%p"), v7, self, objc_opt_class(), v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 >= 2)
    {
      for (i = 1; i != v3; ++i)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_viewControllers, "objectAtIndexedSubscript:", i - 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](self->_viewControllers, "objectAtIndexedSubscript:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "parentModalViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == v11)
        {
          v15 = CFSTR(" --(presents)--> ");
        }
        else
        {
          objc_msgSend(v10, "childModalViewController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9 == v12)
          {
            v15 = CFSTR(" --(presented by)--> ");
          }
          else
          {
            objc_msgSend(v10, "parentViewController");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9 == v13)
            {
              v15 = CFSTR(" --(parent of)--> ");
            }
            else
            {
              objc_msgSend(v9, "parentViewController");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14 == v10)
                v15 = CFSTR(" --(child of)--> ");
              else
                v15 = CFSTR(" --(unknown relation!)--> ");
            }
          }
        }
        objc_msgSend(v4, "appendString:", v15);
        objc_msgSend(v4, "appendFormat:", CFSTR(" (%@:%p"), objc_opt_class(), v10);
        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x2020000000;
        v25 = 0;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __44___UIStoryboardUnwindChain_debugDescription__block_invoke;
        aBlock[3] = &unk_1E16E30E8;
        v23 = v24;
        v16 = v4;
        v22 = v16;
        v17 = _Block_copy(aBlock);
        v18 = (void (**)(_QWORD, _QWORD))v17;
        if (i == self->_commonAncestorIdx)
          (*((void (**)(void *, const __CFString *))v17 + 2))(v17, CFSTR("common ancestor"));
        if (i == self->_modalAncestorContainingSourceIdx)
          ((void (**)(_QWORD, const __CFString *))v18)[2](v18, CFSTR("modal ancestor of source"));
        objc_msgSend(v16, "appendString:", CFSTR(")"));

        _Block_object_dispose(v24, 8);
      }
    }
    objc_msgSend(v4, "appendString:", CFSTR(">"));

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end
