@implementation CRLRepContainerAccessibilityElement

- (CRLRepContainerAccessibilityElement)initWithRep:(id)a3 accessibilityParent:(id)a4
{
  id v6;
  id v7;
  CRLRepContainerAccessibilityElement *v8;
  int ShouldPerformValidationChecks;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CRLRepContainerAccessibilityElement;
  v8 = -[CRLAccessibilityElement initWithAccessibilityParent:](&v17, "initWithAccessibilityParent:", v7);
  ShouldPerformValidationChecks = CRLAccessibilityShouldPerformValidationChecks();
  if (v6 || !ShouldPerformValidationChecks)
  {
    if (v6)
      objc_storeWeak((id *)&v8->_rep, v6);
  }
  else
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Cannot create a rep container with a nil rep!"), v11, v12, v13, v14, v15, (uint64_t)v17.receiver))abort();
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRepContainerAccessibilityElement crlaxChildren](self, "crlaxChildren"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "setAccessibilityContainer:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_storeWeak((id *)&self->_rep, 0);
  v8.receiver = self;
  v8.super_class = (Class)CRLRepContainerAccessibilityElement;
  -[CRLRepContainerAccessibilityElement dealloc](&v8, "dealloc");
}

- (BOOL)crlaxShouldCacheChildren
{
  return 0;
}

- (BOOL)crlaxIsReadyToLoadChildren
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRepContainerAccessibilityElement rep](self, "rep"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRepContainerAccessibilityElement rep](self, "rep"));
    if ((objc_msgSend(v4, "crlaxIsBeingRemoved") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRepContainerAccessibilityElement rep](self, "rep"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxInteractiveCanvasController"));
      if ((objc_msgSend(v7, "crlaxIsTearingDown") & 1) != 0)
        v5 = 0;
      else
        v5 = +[NSThread isMainThread](NSThread, "isMainThread");

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)crlaxLoadChildrenIntoCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRepContainerAccessibilityElement rep](self, "rep"));
  objc_msgSend(v4, "addObject:", v5);
  if (objc_msgSend(v5, "crlaxShouldCreateKnobs"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRepContainerAccessibilityElement _selectableRep](self, "_selectableRep"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxKnobAccessibilityElements"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasKnobAccessibilityElement crlaxSortKnobElements:](CRLCanvasKnobAccessibilityElement, "crlaxSortKnobElements:", v7));
    objc_msgSend(v4, "addObjectsFromArray:", v8);

  }
  if (objc_msgSend(v5, "isAccessibilityElement"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxChildren"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxChildren"));
      objc_msgSend(v4, "addObjectsFromArray:", v11);

    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "crlaxEnsureChildrenAreLoaded", (_QWORD)v18);
        objc_msgSend(v17, "setAccessibilityContainer:", self);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (void)crlaxChildWillBeRemoved:(id)a3
{
  objc_msgSend(a3, "setAccessibilityContainer:", 0);
}

- (void)crlaxDidInvalidateChildren
{
  CRLAccessibilityPostLayoutChangedNotification(0);
}

- (BOOL)crlaxShouldSortChildrenUsingStandardAlgorithm
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRepContainerAccessibilityElement _selectableRep](self, "_selectableRep"));
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CRLCanvasRepAccessibility)_selectableRep
{
  CRLCanvasRepAccessibility **p_rep;
  id WeakRetained;
  id v4;

  p_rep = &self->_rep;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "crlaxRepForSelecting"));

  if (!v4)
    v4 = objc_loadWeakRetained((id *)p_rep);
  return (CRLCanvasRepAccessibility *)v4;
}

- (CRLCanvasRepAccessibility)rep
{
  return (CRLCanvasRepAccessibility *)objc_loadWeakRetained((id *)&self->_rep);
}

- (void)setRep:(id)a3
{
  objc_storeWeak((id *)&self->_rep, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rep);
}

@end
