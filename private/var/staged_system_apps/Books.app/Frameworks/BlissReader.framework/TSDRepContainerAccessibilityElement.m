@implementation TSDRepContainerAccessibilityElement

- (TSDRepContainerAccessibilityElement)initWithRep:(id)a3
{
  TSDRepContainerAccessibilityElement *v4;
  int ShouldPerformValidationChecks;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSDRepContainerAccessibilityElement;
  v4 = -[TSAccessibilityElement initWithAccessibilityParent:](&v13, "initWithAccessibilityParent:", objc_msgSend(objc_msgSend(a3, "tsaxCanvas"), "tsaxCanvasContainerView"));
  ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
  if (a3 || !ShouldPerformValidationChecks)
  {
    if (a3)
      v4->_rep = (TSDRepAccessibility *)a3;
  }
  else
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Cannot create a rep container with a nil rep!"), v7, v8, v9, v10, v11, (uint64_t)v13.receiver))abort();
  }
  return v4;
}

- (void)dealloc
{
  id v3;
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
  v3 = -[TSDRepContainerAccessibilityElement tsaxChildren](self, "tsaxChildren");
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
  self->_rep = 0;
  v8.receiver = self;
  v8.super_class = (Class)TSDRepContainerAccessibilityElement;
  -[TSDRepContainerAccessibilityElement dealloc](&v8, "dealloc");
}

- (BOOL)tsaxShouldCacheChildren
{
  return 0;
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  TSDRepAccessibility *v3;

  v3 = -[TSDRepContainerAccessibilityElement rep](self, "rep");
  if (v3)
  {
    if (-[TSDInteractiveCanvasControllerAccessibility tsaxIsTearingDown](-[TSDRepAccessibility tsaxInteractiveCanvasController](-[TSDRepContainerAccessibilityElement rep](self, "rep"), "tsaxInteractiveCanvasController"), "tsaxIsTearingDown"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LODWORD(v3) = +[NSThread isMainThread](NSThread, "isMainThread");
      if ((_DWORD)v3)
        LOBYTE(v3) = -[TSDRepAccessibility tsaxCanvas](-[TSDRepContainerAccessibilityElement rep](self, "rep"), "tsaxCanvas") != 0;
    }
  }
  return (char)v3;
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  TSDRepAccessibility *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  _BYTE v16[128];

  v5 = -[TSDRepContainerAccessibilityElement rep](self, "rep");
  objc_msgSend(a3, "addObject:", v5);
  if (-[TSDRepAccessibility tsaxShouldCreateKnobs](v5, "tsaxShouldCreateKnobs"))
  {
    objc_msgSend(a3, "addObjectsFromArray:", -[TSDRepAccessibility tsaxKnobAccessibilityElements](-[TSDRepContainerAccessibilityElement _selectableRep](self, "_selectableRep"), "tsaxKnobAccessibilityElements"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_229A14;
    v15[3] = &unk_427B40;
    v15[4] = v5;
    objc_msgSend(a3, "sortUsingComparator:", v15);
  }
  if (-[TSDRepAccessibility isAccessibilityElement](v5, "isAccessibilityElement")
    && objc_msgSend(-[TSDRepAccessibility tsaxChildren](v5, "tsaxChildren"), "count"))
  {
    objc_msgSend(a3, "addObjectsFromArray:", -[TSDRepAccessibility tsaxChildren](v5, "tsaxChildren"));
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "tsaxEnsureChildrenAreLoaded");
        objc_msgSend(v10, "setAccessibilityContainer:", self);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
  objc_msgSend(a3, "setAccessibilityContainer:", 0);
}

- (void)tsaxDidInvalidateChildren
{
  TSAccessibilityPostLayoutChangedNotification(0);
}

- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDRepAccessibility accessibilityFrame](-[TSDRepContainerAccessibilityElement _selectableRep](self, "_selectableRep"), "accessibilityFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (TSDRepAccessibility)_selectableRep
{
  TSDRepAccessibility *result;

  result = -[TSDRepAccessibility tsaxRepForSelecting](self->_rep, "tsaxRepForSelecting");
  if (!result)
    return self->_rep;
  return result;
}

- (TSDRepAccessibility)rep
{
  return self->_rep;
}

- (void)setRep:(id)a3
{
  self->_rep = (TSDRepAccessibility *)a3;
}

@end
