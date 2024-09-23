@implementation THWAutoplayController

- (THWAutoplayController)init
{
  THWAutoplayController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWAutoplayController;
  v2 = -[THWAutoplayController init](&v4, "init");
  if (v2)
  {
    v2->_autoplayableReps = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v2, "handleNotificationVantageDidChange:", CFSTR("THVantageDidChangeNotification"), 0);
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v2, "handleNotificationVantageWillChange:", CFSTR("THVantageWillChangeNotification"), 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_tornDown)
    -[THWAutoplayController teardown](self, "teardown");

  v3.receiver = self;
  v3.super_class = (Class)THWAutoplayController;
  -[THWAutoplayController dealloc](&v3, "dealloc");
}

- (void)teardown
{
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("THVantageDidChangeNotification"), 0);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("THVantageWillChangeNotification"), 0);
  -[THWAutoplayController p_autoplayStop:](self, "p_autoplayStop:", self->_autoplayableReps);
  self->_tornDown = 1;
}

- (double)stopScrollingDelay
{
  return 0.1;
}

- (id)p_documentNavigatorFromNotification:(id)a3
{
  uint64_t v4;
  id result;
  double v6;

  v4 = objc_opt_class(THDocumentNavigator);
  *(_QWORD *)&v6 = TSUDynamicCast(v4, objc_msgSend(a3, "object")).n128_u64[0];
  if (!result)
    return objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THVantageChangeInitiator, objc_msgSend(a3, "object", v6)), "documentNavigator");
  return result;
}

- (void)stop
{
  NSMutableSet *autoplayableReps;

  autoplayableReps = self->_autoplayableReps;
  ++self->_generationCount;
  -[THWAutoplayController p_autoplayStop:](self, "p_autoplayStop:", autoplayableReps);
}

- (void)handleNotificationVantageWillChange:(id)a3
{
  TSDInteractiveCanvasController *interactiveCanvasController;
  id v6;
  NSMutableSet *autoplayableReps;

  interactiveCanvasController = self->_interactiveCanvasController;
  if (interactiveCanvasController)
  {
    if (interactiveCanvasController == objc_msgSend(-[THWAutoplayController p_documentNavigatorFromNotification:](self, "p_documentNavigatorFromNotification:"), "interactiveCanvasController"))
    {
      v6 = objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", CFSTR("THVantageChangeReason"));
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("THVantageChangeReasonTransitionToDVC")) & 1) == 0
        && (objc_msgSend(v6, "isEqualToString:", CFSTR("THVantageChangeReasonScrolling")) & 1) == 0
        && (objc_msgSend(v6, "isEqualToString:", CFSTR("THVantageChangeReasonWindowResize")) & 1) == 0)
      {
        autoplayableReps = self->_autoplayableReps;
        ++self->_generationCount;
        -[THWAutoplayController p_autoplayStop:](self, "p_autoplayStop:", autoplayableReps);
      }
    }
  }
}

- (void)handleNotificationVantageDidChange:(id)a3
{
  id v5;
  id v6;
  TSDInteractiveCanvasController *interactiveCanvasController;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", CFSTR("THVantageChangeReason"));
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonBookOpen")))
    -[THWAutoplayController setBookOpened:](self, "setBookOpened:", 1);
  v6 = -[THWAutoplayController p_documentNavigatorFromNotification:](self, "p_documentNavigatorFromNotification:", a3);
  interactiveCanvasController = self->_interactiveCanvasController;
  if (interactiveCanvasController)
  {
    v8 = v6;
    if (interactiveCanvasController == objc_msgSend(v6, "interactiveCanvasController"))
    {
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      v16 = 0;
      -[THWAutoplayController p_unpackNotification:outCurrentRelativePageIndex:outTopLevelReps:](self, "p_unpackNotification:outCurrentRelativePageIndex:outTopLevelReps:", a3, &v15, &v16);
      objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController canvasView](self->_interactiveCanvasController, "canvasView"), "enclosingScrollView"), "contentOffset");
      v10 = v9;
      v12 = v11;
      v13 = objc_msgSend(objc_msgSend(v8, "currentPageLocation"), "contentNodeGUID");
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonScrolling")))
        goto LABEL_17;
      v14 = v15;
      if (self->_currentPageIndex != v15)
      {
LABEL_19:
        if (v14 != 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(objc_msgSend(v8, "delegate"), "documentNavigatorIsOnActiveCanvas:", v8))
        {
          if (-[THWAutoplayController bookOpened](self, "bookOpened"))
            -[THWAutoplayController p_startAutoplayableDescendantsOfReps:](self, "p_startAutoplayableDescendantsOfReps:", v16);
        }
        goto LABEL_23;
      }
      if (v10 == self->_currentContentOffset.x
        && v12 == self->_currentContentOffset.y
        && -[NSString isEqualToString:](self->_currentContentNodeGUID, "isEqualToString:", v13))
      {
LABEL_17:
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonTransitionFromTOC")) & 1) == 0
          && (objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonRotation")) & 1) == 0
          && (objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonNavigation")) & 1) == 0
          && (objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonTransitionFromNotesVC")) & 1) == 0
          && (objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonTransitionFromStudyVC")) & 1) == 0
          && (objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonTransitionToDVC")) & 1) == 0
          && (objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonTransitionFromGlossary")) & 1) == 0
          && !objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonBookOpen")))
        {
LABEL_23:
          self->_currentPageIndex = v15;
          -[THWAutoplayController setCurrentContentNodeGUID:](self, "setCurrentContentNodeGUID:", v13);
          self->_currentContentOffset.x = v10;
          self->_currentContentOffset.y = v12;
          return;
        }
      }
      v14 = v15;
      goto LABEL_19;
    }
  }
}

- (void)p_unpackNotification:(id)a3 outCurrentRelativePageIndex:(unint64_t *)a4 outTopLevelReps:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  id v12;

  v8 = -[THWAutoplayController p_documentNavigatorFromNotification:](self, "p_documentNavigatorFromNotification:", a3);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "interactiveCanvasController"), "canvas"), "topLevelReps");
    v11 = -[THWAutoplayController p_isInTwoPageMode:](self, "p_isInTwoPageMode:", v9);
    self->_inTwoPageMode = v11;
    v12 = objc_msgSend(objc_msgSend(v9, "currentPageInfoForBookmarksUsingViewCenter:", !v11), "relativePageIndexInParent");
    if (a5)
      *a5 = v10;
    if (a4)
      *a4 = (unint64_t)v12;
  }
}

- (BOOL)p_isInTwoPageMode:(id)a3
{
  return 0;
}

- (void)p_startAutoplayableDescendantsOfReps:(id)a3
{
  NSMutableSet *autoplayableReps;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableSet *v11;
  unint64_t generationCount;
  double v13;
  dispatch_time_t v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (!self->_tornDown)
  {
    autoplayableReps = self->_autoplayableReps;
    ++self->_generationCount;
    v6 = +[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", autoplayableReps);
    -[NSMutableSet removeAllObjects](self->_autoplayableReps, "removeAllObjects");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(a3);
          -[THWAutoplayController p_recursivelyAddAutoplayableRepsForRep:](self, "p_recursivelyAddAutoplayableRepsForRep:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10));
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
    v11 = +[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", self->_autoplayableReps);
    -[NSMutableSet intersectSet:](v11, "intersectSet:", v6);
    -[NSMutableSet minusSet:](v6, "minusSet:", v11);
    if (-[NSMutableSet count](v6, "count"))
      -[THWAutoplayController p_autoplayStop:](self, "p_autoplayStop:", v6);
    if (-[NSMutableSet count](self->_autoplayableReps, "count"))
    {
      generationCount = self->_generationCount;
      -[THWAutoplayController stopScrollingDelay](self, "stopScrollingDelay");
      v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_16BF1C;
      v15[3] = &unk_427240;
      v15[4] = self;
      v15[5] = generationCount;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v15);
    }
  }
}

- (void)p_recursivelyAddAutoplayableRepsForRep:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (objc_msgSend(a3, "conformsToProtocol:", &OBJC_PROTOCOL___THWAutoplayable)
    && (objc_msgSend(a3, "hasBeenRemoved") & 1) == 0
    && objc_msgSend(a3, "isVisibleOnCanvas")
    && objc_msgSend(objc_msgSend(a3, "autoplayConfig"), "enabled")
    && objc_msgSend(a3, "autoplayAllowed"))
  {
    -[NSMutableSet addObject:](self->_autoplayableReps, "addObject:", a3);
  }
  v5 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSDContainerRep, a3);
  if (v5)
  {
    v6 = v5;
    if (!objc_msgSend(v5, "masksToBounds") || objc_msgSend(v6, "isVisibleOnCanvas"))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = objc_msgSend(v6, "childReps", 0);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            -[THWAutoplayController p_recursivelyAddAutoplayableRepsForRep:](self, "p_recursivelyAddAutoplayableRepsForRep:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11));
            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }
    }
  }
}

- (void)p_autoplayStart
{
  NSMutableSet *autoplayableReps;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if ((-[TSDInteractiveCanvasController currentlyScrolling](self->_interactiveCanvasController, "currentlyScrolling") & 1) == 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    autoplayableReps = self->_autoplayableReps;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](autoplayableReps, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(autoplayableReps);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v8, "hasBeenRemoved") & 1) == 0
            && objc_msgSend(objc_msgSend(v8, "autoplayConfig"), "enabled"))
          {
            if (objc_msgSend(v8, "autoplayAllowed"))
              objc_msgSend(v8, "autoplayStart");
          }
        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](autoplayableReps, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
  }
}

- (void)p_autoplayStop:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(a3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v8, "autoplayConfig"), "enabled"))
          objc_msgSend(v8, "autoplayStop");
      }
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  objc_msgSend(a3, "removeAllObjects");
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)tornDown
{
  return self->_tornDown;
}

- (void)setTornDown:(BOOL)a3
{
  self->_tornDown = a3;
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->_currentPageIndex = a3;
}

- (NSString)currentContentNodeGUID
{
  return self->_currentContentNodeGUID;
}

- (void)setCurrentContentNodeGUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (CGPoint)currentContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentContentOffset.x;
  y = self->_currentContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentContentOffset:(CGPoint)a3
{
  self->_currentContentOffset = a3;
}

- (NSMutableSet)autoplayableReps
{
  return self->_autoplayableReps;
}

- (void)setAutoplayableReps:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)inTwoPageMode
{
  return self->_inTwoPageMode;
}

- (void)setInTwoPageMode:(BOOL)a3
{
  self->_inTwoPageMode = a3;
}

- (unint64_t)generationCount
{
  return self->_generationCount;
}

- (BOOL)bookOpened
{
  return self->_bookOpened;
}

- (void)setBookOpened:(BOOL)a3
{
  self->_bookOpened = a3;
}

@end
