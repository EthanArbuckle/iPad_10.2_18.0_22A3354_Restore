@implementation THNoteCardsController

- (THNoteCardsController)initWithDocumentRoot:(id)a3
{
  THNoteCardsController *v5;
  THNoteCardsController *v6;
  THStudyOptions *v7;
  CALayer *noteCardsLayer;
  CGFloat v14;
  _OWORD v17[16];
  objc_super v18;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController initWithDocumentRoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 140, CFSTR("invalid nil value for '%s'"), "documentRoot");
  v18.receiver = self;
  v18.super_class = (Class)THNoteCardsController;
  v5 = -[THNoteCardsController init](&v18, "init");
  v6 = v5;
  if (v5)
  {
    v5->_documentRoot = (THDocumentRoot *)a3;
    v7 = -[THStudyOptions initWithUserDefaults:]([THStudyOptions alloc], "initWithUserDefaults:", objc_msgSend(a3, "bookUserDefaults"));
    v6->_options = v7;
    -[THStudyOptions addObserver:](v7, "addObserver:", v6);
    v6->_noteCards = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->_noteCardInfos = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->_delayedUpdateNoteCardIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6->_noteCardsView = (UIView *)objc_alloc_init((Class)UIView);
    v6->_noteCardsLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    -[THNoteCardsController p_perspectiveTransformWithScale:](v6, "p_perspectiveTransformWithScale:", 1.0);
    noteCardsLayer = v6->_noteCardsLayer;
    v17[4] = v17[12];
    v17[5] = v17[13];
    v17[6] = v17[14];
    v17[7] = v17[15];
    v17[0] = v17[8];
    v17[1] = v17[9];
    v17[2] = v17[10];
    v17[3] = v17[11];
    -[CALayer setSublayerTransform:](noteCardsLayer, "setSublayerTransform:", v17);
    -[CALayer addSublayer:](-[UIView layer](v6->_noteCardsView, "layer"), "addSublayer:", v6->_noteCardsLayer);
    v6->_interactiveViewsToLayers = +[NSMapTable weakToWeakObjectsMapTable](NSMapTable, "weakToWeakObjectsMapTable");
    __asm { FMOV            V0.2D, #10.0 }
    v6->_minCardSize = _Q0;
    v6->_maxCardSize.width = TSDMultiplySizeScalar(895.0, 614.0, 1.33333333);
    v6->_maxCardSize.height = v14;
    v6->_scalingMode = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v6->_layoutScale = _Q0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[THStudyOptions removeObserver:](self->_options, "removeObserver:", self);
  -[NSArray makeObjectsPerformSelector:](-[CALayer sublayers](self->_noteCardsLayer, "sublayers"), "makeObjectsPerformSelector:", "removeFromSuperlayer");
  -[CALayer removeFromSuperlayer](self->_noteCardsLayer, "removeFromSuperlayer");

  v3.receiver = self;
  v3.super_class = (Class)THNoteCardsController;
  -[THNoteCardsController dealloc](&v3, "dealloc");
}

- (void)updateWithNavigationUnit:(id)a3 contentNode:(id)a4
{
  THNavigationUnit *currentNavigationUnit;

  currentNavigationUnit = self->_currentNavigationUnit;
  -[NSArray indexOfObject:](-[THDocumentNavigationModel navigationUnits](-[THDocumentRoot navigationModel](self->_documentRoot, "navigationModel"), "navigationUnits"), "indexOfObject:", currentNavigationUnit);
  -[NSArray indexOfObject:](-[THDocumentNavigationModel navigationUnits](-[THDocumentRoot navigationModel](self->_documentRoot, "navigationModel"), "navigationUnits"), "indexOfObject:", a3);
  if (currentNavigationUnit != a3)
  {
    -[THNoteCardsController p_reloadNoteCardInfosFromNavigationUnit:](self, "p_reloadNoteCardInfosFromNavigationUnit:", a3);

    self->_currentNavigationUnit = (THNavigationUnit *)a3;
  }
  if (a4)
    -[THNoteCardsController p_rotateNoteCardInfosToContentNode:](self, "p_rotateNoteCardInfosToContentNode:", a4);
  if (currentNavigationUnit == a3)
    -[THNoteCardsController p_reloadNoteCards](self, "p_reloadNoteCards");
  else
    -[THNoteCardsController p_unfilteredNoteCardInfosChangedMoveToRight:](self, "p_unfilteredNoteCardInfosChangedMoveToRight:");
}

- (void)attachToView:(id)a3
{
  if (!objc_msgSend(a3, "layer"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController attachToView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 237, CFSTR("can't attach to a view without a layer"));
  objc_msgSend(a3, "insertSubview:atIndex:", self->_noteCardsView, 0);
  self->_hostView = (UIView *)a3;
}

- (void)detachFromView:(id)a3
{
  -[UIView removeFromSuperview](self->_noteCardsView, "removeFromSuperview", a3);
  self->_hostView = 0;
}

- (void)updateFrame:(CGRect)a3 insets:(UIEdgeInsets)a4 animated:(BOOL)a5 duration:(double)a6
{
  _BOOL8 v6;
  double right;
  double left;
  double top;
  double height;
  double width;
  double y;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSMutableArray *noteCards;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  double bottom;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a5;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView setFrame:](self->_noteCardsView, "setFrame:");
  v15 = x + left;
  v16 = width - (left + right);
  v17 = height - (top + bottom);
  -[CALayer setFrame:](self->_noteCardsLayer, "setFrame:", v15, y + top, v16, v17);
  v18 = THScaleNeededToFitSizeInSize(895.0, 614.0, self->_minCardSize.width, self->_minCardSize.height);
  v19 = THScaleNeededToFitSizeInSize(895.0, 614.0, self->_maxCardSize.width, self->_maxCardSize.height);
  v20 = THScaleNeededToFitSizeInSize(895.0, 614.0, v16, v17);
  -[THNoteCardsController p_setScale:animated:duration:](self, "p_setScale:animated:duration:", v6, TSUClamp(v20, v18, v19), a6);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  noteCards = self->_noteCards;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(noteCards);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "updateTransformAnimated:duration:", v6, a6);
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v23);
  }
  if ((objc_opt_respondsToSelector(-[THNoteCardsController delegate](self, "delegate"), "noteCardsControllerUpdatedTopCardFrame:") & 1) != 0)-[THNoteCardsControllerDelegate noteCardsControllerUpdatedTopCardFrame:](-[THNoteCardsController delegate](self, "delegate"), "noteCardsControllerUpdatedTopCardFrame:", self);
}

- (void)setDarkMode:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *noteCardInfos;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSMutableArray *noteCards;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  if (self->_darkMode != a3)
  {
    v3 = a3;
    self->_darkMode = a3;
    if (-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"))
    {
      -[THNoteCardsController p_makeTopCardNonInteractive](self, "p_makeTopCardNonInteractive");
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      noteCardInfos = self->_noteCardInfos;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCardInfos, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v21 != v8)
              objc_enumerationMutation(noteCardInfos);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "setDarkMode:", v3);
          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCardInfos, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v7);
      }
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      noteCards = self->_noteCards;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(noteCards);
            v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v15, "setDarkMode:", v3);
            if (objc_msgSend(objc_msgSend(v15, "frontLayer"), "hasBody"))
              objc_msgSend(objc_msgSend(v15, "noteCardInfo"), "populateNoteCardFront:", objc_msgSend(v15, "frontLayer"));
            if (objc_msgSend(objc_msgSend(v15, "backLayer"), "hasBody"))
              objc_msgSend(objc_msgSend(v15, "noteCardInfo"), "populateNoteCardBack:", objc_msgSend(v15, "backLayer"));
          }
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        }
        while (v12);
      }
      -[THNoteCardsController p_makeTopCardInteractive](self, "p_makeTopCardInteractive");
    }
  }
}

- (void)setScalingMode:(int)a3
{
  if (self->_scalingMode != a3)
  {
    self->_scalingMode = a3;
    if (a3 == 1)
    {
      -[THNoteCardsController p_makeTopCardNonInteractive](self, "p_makeTopCardNonInteractive");
    }
    else if (!a3)
    {
      -[THNoteCardsController p_setLayoutScale:](self, "p_setLayoutScale:", self->_layoutScale * self->_dynamicScale);
      -[THNoteCardsController p_setDynamicScale:](self, "p_setDynamicScale:", 1.0);
      -[THNoteCardsController p_makeTopCardInteractive](self, "p_makeTopCardInteractive");
    }
  }
}

- (void)shuffleCards
{
  -[THNoteCardsController p_reflectShuffleOptionsChangeWithCompletionBlock:](self, "p_reflectShuffleOptionsChangeWithCompletionBlock:", 0);
}

- (BOOL)isShowingEmptyStudyCard
{
  return objc_msgSend(-[NSMutableArray firstObject](self->_noteCardInfos, "firstObject"), "isEmptyCard");
}

- (BOOL)canFlipTopCard
{
  return objc_msgSend(-[THNoteCardsController p_topNoteCardInfo](self, "p_topNoteCardInfo"), "hasBackContent");
}

- (BOOL)isPointInsideTopCardFlipGlyph:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  v6 = -[THNoteCardsController p_topNoteCard](self, "p_topNoteCard");
  objc_msgSend(v6, "convertPoint:fromLayer:", -[UIView layer](self->_hostView, "layer"), x, y);
  return objc_msgSend(v6, "isPointInsideFlipGlyph:");
}

- (void)flipTopCard
{
  id v3;
  id v4;

  -[THNoteCardsController p_handleDelayedCardUpdate](self, "p_handleDelayedCardUpdate");
  v3 = -[THNoteCardsController p_topNoteCard](self, "p_topNoteCard");
  v4 = -[THNoteCardsController p_topNoteCardInfo](self, "p_topNoteCardInfo");
  if ((objc_msgSend(v4, "hasBackContent") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController flipTopCard]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 377, CFSTR("shouldn't be flipping a card with no back content"));
  if ((objc_msgSend(v3, "isFlipped") & 1) == 0
    && (objc_msgSend(objc_msgSend(v3, "backLayer"), "hasBody") & 1) == 0)
  {
    objc_msgSend(v4, "populateNoteCardBack:", objc_msgSend(v3, "backLayer"));
  }
  objc_msgSend(v3, "flipAnimated:duration:", 1, 0.5);
}

- (unint64_t)noteCardCount
{
  return (unint64_t)-[NSMutableArray count](self->_noteCardInfos, "count");
}

- (BOOL)showingMultipleCards
{
  id v3;

  v3 = -[THNoteCardsController p_topNoteCard](self, "p_topNoteCard");
  return v3 != -[THNoteCardsController p_bottomNoteCard](self, "p_bottomNoteCard");
}

- (BOOL)isTopCardAtPoint:(CGPoint)a3
{
  id v4;

  -[CALayer convertPoint:fromLayer:](self->_noteCardsLayer, "convertPoint:fromLayer:", -[UIView layer](self->_hostView, "layer"), a3.x, a3.y);
  v4 = -[THNoteCardsController p_noteCardForPoint:](self, "p_noteCardForPoint:");
  if (v4)
    LOBYTE(v4) = v4 == -[THNoteCardsController p_topNoteCard](self, "p_topNoteCard");
  return (char)v4;
}

- (BOOL)isBottomCardAtPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;

  -[CALayer convertPoint:fromLayer:](self->_noteCardsLayer, "convertPoint:fromLayer:", -[UIView layer](self->_hostView, "layer"), a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  v8 = -[THNoteCardsController p_noteCardForPoint:](self, "p_noteCardForPoint:");
  v9 = -[THNoteCardsController p_bottomNoteCard](self, "p_bottomNoteCard");
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (!v11)
  {
    if (-[THNoteCardsController p_hitTest:noteCard:outset:](self, "p_hitTest:noteCard:outset:", v9, v5, v7, 0.0, 0.0, 30.0, 50.0))
    {
      v8 = v10;
    }
    else
    {
      v8 = 0;
    }
  }
  return v8 && v8 == v10;
}

- (unint64_t)bookPageIndexForTopCard
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(THAnnotationNoteCardInfo);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THNoteCardsController p_topNoteCardInfo](self, "p_topNoteCardInfo")).n128_u64[0];
  v6 = v5;
  if (!v5)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController bookPageIndexForTopCard]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 425, CFSTR("trying to get the page for a non annotation card info."));
  return (unint64_t)objc_msgSend(v6, "pageIndex", v4);
}

- (void)animateTopCardToBottomInDirection:(CGPoint)a3
{
  double y;
  double x;
  id v7;

  y = a3.y;
  x = a3.x;
  if (self->_dragOffset.x != CGPointZero.x || self->_dragOffset.y != CGPointZero.y)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController animateTopCardToBottomInDirection:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 432, CFSTR("need to reset _dragOffset here"));
  -[THNoteCardsController p_handleDelayedCardUpdate](self, "p_handleDelayedCardUpdate");
  v7 = -[THNoteCardsController p_topNoteCard](self, "p_topNoteCard");
  if (v7)
    -[THNoteCardsController p_animateCardToTopOrBottom:direction:duration:](self, "p_animateCardToTopOrBottom:direction:duration:", v7, x, y, 0.600000024);
}

- (void)animateBottomCardToTopInDirection:(CGPoint)a3
{
  double y;
  double x;
  id v7;

  y = a3.y;
  x = a3.x;
  if (self->_dragOffset.x != CGPointZero.x || self->_dragOffset.y != CGPointZero.y)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController animateBottomCardToTopInDirection:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 445, CFSTR("need to reset _dragOffset here"));
  -[THNoteCardsController p_handleDelayedCardUpdate](self, "p_handleDelayedCardUpdate");
  v7 = -[THNoteCardsController p_bottomNoteCard](self, "p_bottomNoteCard");
  if (v7)
    -[THNoteCardsController p_animateCardToTopOrBottom:direction:duration:](self, "p_animateCardToTopOrBottom:direction:duration:", v7, x, y, 0.600000024);
}

- (void)beginDragAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  THNoteCardLayer *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __n128 v22;
  __n128 v23;

  y = a3.y;
  x = a3.x;
  -[THNoteCardsController p_handleDelayedCardUpdate](self, "p_handleDelayedCardUpdate");
  -[CALayer convertPoint:fromLayer:](self->_noteCardsLayer, "convertPoint:fromLayer:", -[UIView layer](self->_hostView, "layer"), x, y);
  v7 = v6;
  v9 = v8;
  v10 = (THNoteCardLayer *)-[THNoteCardsController p_noteCardForPoint:](self, "p_noteCardForPoint:");
  self->_draggingNoteCard = v10;
  -[THNoteCardLayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", self->_noteCardsLayer, v7, v9);
  v12 = v11;
  v14 = v13;
  -[THNoteCardLayer bounds](self->_draggingNoteCard, "bounds");
  v19 = TSDCenterOfRect(v15, v16, v17, v18);
  v21 = v20;
  v22.n128_u64[0] = v12;
  v23.n128_u64[0] = v14;
  -[THNoteCardLayer setDragAnchor:](self->_draggingNoteCard, "setDragAnchor:", TSDSubtractPoints(v22, v23, v19, v21));
}

- (void)beginDraggingTopCardAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  THNoteCardLayer *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __n128 v22;
  __n128 v23;

  y = a3.y;
  x = a3.x;
  -[THNoteCardsController p_handleDelayedCardUpdate](self, "p_handleDelayedCardUpdate");
  -[CALayer convertPoint:fromLayer:](self->_noteCardsLayer, "convertPoint:fromLayer:", -[UIView layer](self->_hostView, "layer"), x, y);
  v7 = v6;
  v9 = v8;
  v10 = (THNoteCardLayer *)-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard");
  self->_draggingNoteCard = v10;
  -[THNoteCardLayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", self->_noteCardsLayer, v7, v9);
  v12 = v11;
  v14 = v13;
  -[THNoteCardLayer bounds](self->_draggingNoteCard, "bounds");
  v19 = TSDCenterOfRect(v15, v16, v17, v18);
  v21 = v20;
  v22.n128_u64[0] = v12;
  v23.n128_u64[0] = v14;
  -[THNoteCardLayer setDragAnchor:](self->_draggingNoteCard, "setDragAnchor:", TSDSubtractPoints(v22, v23, v19, v21));
}

- (void)beginDraggingBottomCardAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  THNoteCardLayer *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __n128 v22;
  __n128 v23;

  y = a3.y;
  x = a3.x;
  -[THNoteCardsController p_handleDelayedCardUpdate](self, "p_handleDelayedCardUpdate");
  -[CALayer convertPoint:fromLayer:](self->_noteCardsLayer, "convertPoint:fromLayer:", -[UIView layer](self->_hostView, "layer"), x, y);
  v7 = v6;
  v9 = v8;
  v10 = (THNoteCardLayer *)-[THNoteCardsController p_bottomNoteCard](self, "p_bottomNoteCard");
  self->_draggingNoteCard = v10;
  -[THNoteCardLayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", self->_noteCardsLayer, v7, v9);
  v12 = v11;
  v14 = v13;
  -[THNoteCardLayer bounds](self->_draggingNoteCard, "bounds");
  v19 = TSDCenterOfRect(v15, v16, v17, v18);
  v21 = v20;
  v22.n128_u64[0] = v12;
  v23.n128_u64[0] = v14;
  -[THNoteCardLayer setDragAnchor:](self->_draggingNoteCard, "setDragAnchor:", TSDSubtractPoints(v22, v23, v19, v21));
}

- (void)handleTopCardPageNumberHovered:(BOOL)a3
{
  objc_msgSend(objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "upwardFacingLayer"), "setPageNumberHovered:", a3);
}

- (void)handleTopCardPageNumberPressed:(BOOL)a3
{
  objc_msgSend(objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "upwardFacingLayer"), "setPageNumberPressed:", a3);
}

- (BOOL)isTopCardPageNumberPressed
{
  return objc_msgSend(objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "upwardFacingLayer"), "pageNumberPressed");
}

- (void)handleTopCardFlipAffordanceHovered:(BOOL)a3
{
  objc_msgSend(objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "upwardFacingLayer"), "setFlipAffordanceHovered:", a3);
}

- (void)handleTopCardFlipAffordancePressed:(BOOL)a3
{
  objc_msgSend(objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "upwardFacingLayer"), "setFlipAffordancePressed:", a3);
}

- (BOOL)isTopCardFlipAffordancePressed
{
  return objc_msgSend(objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "upwardFacingLayer"), "flipAffordancePressed");
}

- (void)setDragOffset:(CGPoint)a3
{
  NSMutableArray *noteCards;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  THNoteCardLayer *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  self->_dragOffset = a3;
  -[THNoteCardLayer setDragOffset:](self->_draggingNoteCard, "setDragOffset:", a3.x / self->_dynamicScale, a3.y / self->_dynamicScale);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  noteCards = self->_noteCards;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(noteCards);
        v9 = *(THNoteCardLayer **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (v9 != self->_draggingNoteCard)
          -[THNoteCardLayer updateTransformAnimated:duration:](v9, "updateTransformAnimated:duration:", 0, 0.0);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  if (-[THNoteCardLayer isTopCard](self->_draggingNoteCard, "isTopCard"))
  {
    if (!-[THNoteCardLayer poppedState](self->_draggingNoteCard, "poppedState"))
      -[THNoteCardLayer popAnimated:duration:](self->_draggingNoteCard, "popAnimated:duration:", 1, 0.150000006);
  }
}

- (void)endDragInDirection:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  self->_dragOffset = CGPointZero;
  if (-[THNoteCardLayer draggedPastThreshold](self->_draggingNoteCard, "draggedPastThreshold")
    && -[THNoteCardsController showingMultipleCards](self, "showingMultipleCards"))
  {
    -[THNoteCardsController p_completeDragInDirection:animationDuration:](self, "p_completeDragInDirection:animationDuration:", x, y, 0.600000024);
  }
  else
  {
    -[THNoteCardsController p_cancelDragAnimated:duration:](self, "p_cancelDragAnimated:duration:", 1, 0.300000012);
  }
  if (-[THNoteCardLayer poppedState](self->_draggingNoteCard, "poppedState") == 3
    || -[THNoteCardLayer poppedState](self->_draggingNoteCard, "poppedState") == 1)
  {
    -[THNoteCardLayer unpopAnimated:duration:](self->_draggingNoteCard, "unpopAnimated:duration:", 1, 0.150000006);
  }

  self->_draggingNoteCard = 0;
}

- (void)forceSwipeInDirection:(CGPoint)a3
{
  self->_dragOffset = CGPointZero;
  -[THNoteCardsController p_completeDragInDirection:animationDuration:](self, "p_completeDragInDirection:animationDuration:", a3.x, a3.y, 0.600000024);
  if (-[THNoteCardLayer poppedState](self->_draggingNoteCard, "poppedState") == 3
    || -[THNoteCardLayer poppedState](self->_draggingNoteCard, "poppedState") == 1)
  {
    -[THNoteCardLayer unpopAnimated:duration:](self->_draggingNoteCard, "unpopAnimated:duration:", 1, 0.150000006);
  }

  self->_draggingNoteCard = 0;
}

- (BOOL)draggingTopCard
{
  THNoteCardLayer *draggingNoteCard;

  draggingNoteCard = self->_draggingNoteCard;
  return draggingNoteCard == -[THNoteCardsController p_topNoteCard](self, "p_topNoteCard");
}

- (CGRect)frameForTopCardPageNumberInHostView
{
  id v3;
  CALayer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v3 = objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "upwardFacingLayer");
  v4 = -[UIView layer](self->_hostView, "layer");
  objc_msgSend(v3, "pageNumberLabelFrame");
  -[CALayer convertRect:fromLayer:](v4, "convertRect:fromLayer:", v3);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)frameForTopCardFlipGlyphInHostView
{
  id v3;
  CALayer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v3 = objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "upwardFacingLayer");
  v4 = -[UIView layer](self->_hostView, "layer");
  objc_msgSend(v3, "flipGlyphFrame");
  -[CALayer convertRect:fromLayer:](v4, "convertRect:fromLayer:", v3);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)frameForTopCardInHostView
{
  id v3;
  CALayer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v3 = objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "upwardFacingLayer");
  v4 = -[UIView layer](self->_hostView, "layer");
  objc_msgSend(v3, "frame");
  -[CALayer convertRect:fromLayer:](v4, "convertRect:fromLayer:", objc_msgSend(v3, "superlayer"), v5, v6, v7, v8);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)frameForBottomCardInHostView
{
  id v3;
  CALayer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v3 = objc_msgSend(-[THNoteCardsController p_bottomNoteCard](self, "p_bottomNoteCard"), "upwardFacingLayer");
  v4 = -[UIView layer](self->_hostView, "layer");
  objc_msgSend(v3, "frame");
  -[CALayer convertRect:fromLayer:](v4, "convertRect:fromLayer:", objc_msgSend(v3, "superlayer"), v5, v6, v7, v8);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)p_cancelDragAnimated:(BOOL)a3 duration:(double)a4
{
  _BOOL8 v5;
  NSMutableArray *noteCards;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  THNoteCardLayer *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  -[THNoteCardLayer cancelDragAnimated:duration:](self->_draggingNoteCard, "cancelDragAnimated:duration:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  noteCards = self->_noteCards;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(noteCards);
        v12 = *(THNoteCardLayer **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (v12 != self->_draggingNoteCard)
          -[THNoteCardLayer updateTransformAnimated:duration:](v12, "updateTransformAnimated:duration:", v5, a4);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
}

- (void)p_handleDelayedCardUpdate
{
  unint64_t delayedUpdateNoteCardIndex;

  delayedUpdateNoteCardIndex = self->_delayedUpdateNoteCardIndex;
  if (delayedUpdateNoteCardIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[THNoteCardsController p_reloadNoteCardAtIndex:noteCards:noteCardInfos:](self, "p_reloadNoteCardAtIndex:noteCards:noteCardInfos:", delayedUpdateNoteCardIndex, self->_noteCards, self->_noteCardInfos);
    self->_delayedUpdateNoteCardIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)p_resetFlipOnBelowTopCard
{
  char *v3;
  id v5;

  v3 = (char *)-[NSMutableArray count](self->_noteCards, "count");
  if ((unint64_t)v3 >= 2 && v3 - 2 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = -[NSMutableArray objectAtIndex:](self->_noteCards, "objectAtIndex:");
    if (objc_msgSend(v5, "isFlipped"))
      objc_msgSend(v5, "setFlipped:", 0);
  }
}

- (void)p_completeDragInDirection:(CGPoint)a3 animationDuration:(double)a4
{
  -[THNoteCardsController p_animateCardToTopOrBottom:direction:duration:](self, "p_animateCardToTopOrBottom:direction:duration:", self->_draggingNoteCard, a3.x, a3.y, a4);
}

- (id)topScrollView
{
  return self->_topScrollView;
}

- (void)zoomOutAndFadeCards:(BOOL)a3 duration:(double)a4
{
  _BOOL4 v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = -[THNoteCardsController noteCards](self, "noteCards", 0);
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        if (v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10), "setScaleFactor:darkerBackground:animated:duration:", 1, 0, 0.85, a4);
          v12 = 1.0;
          v13 = v11;
          v14 = 0;
        }
        else
        {
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
          v12 = 0.85;
          v14 = 1;
        }
        objc_msgSend(v13, "setScaleFactor:darkerBackground:animated:duration:", v14, 1, v12, a4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
}

- (unint64_t)noteCardLayerCount
{
  unint64_t result;

  result = (unint64_t)-[NSMutableArray count](self->_noteCards, "count");
  if (result >= 4)
    return 4;
  return result;
}

- (BOOL)topNoteCardIsFlipped
{
  return objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "isFlipped");
}

- (BOOL)isDraggingTopCard
{
  THNoteCardLayer *draggingNoteCard;

  draggingNoteCard = self->_draggingNoteCard;
  if (draggingNoteCard)
    LOBYTE(draggingNoteCard) = -[THNoteCardLayer isTopCard](draggingNoteCard, "isTopCard");
  return (char)draggingNoteCard;
}

- (CGPoint)dragOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_dragOffset.x;
  y = self->_dragOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)shuffleOffset:(BOOL)a3
{
  _BOOL4 v3;
  double Width;
  double v5;
  CGPoint result;
  CGRect v7;

  v3 = a3;
  -[UIView bounds](self->_hostView, "bounds");
  Width = CGRectGetWidth(v7);
  if (v3)
    Width = -Width;
  v5 = 0.0;
  result.y = v5;
  result.x = Width;
  return result;
}

- (double)offscreenNoteDistance
{
  CGRect v4;

  -[UIView bounds](self->_hostView, "bounds");
  return CGRectGetWidth(v4) / self->_dynamicScale;
}

- (void)noteCardWillUnsettle:(id)a3
{
  if (objc_msgSend(a3, "isTopCard"))
    -[THNoteCardsController p_makeTopCardNonInteractive](self, "p_makeTopCardNonInteractive");
}

- (void)noteCardDidSettle:(id)a3
{
  if (objc_msgSend(a3, "isTopCard"))
    -[THNoteCardsController p_makeTopCardInteractive](self, "p_makeTopCardInteractive");
}

- (void)studyOptionsWillChangeShuffle:(id)a3
{
  if (!self->_isShufflingCards)
    -[THNoteCardsController p_recreateNoteCardLayers](self, "p_recreateNoteCardLayers", a3);
}

- (void)studyOptionsDidChangeShuffle:(id)a3
{
  _QWORD v5[6];
  unsigned __int8 v6;

  if ((unint64_t)-[NSMutableArray count](self->_noteCardInfos, "count") >= 2 && !self->_isShufflingCards)
  {
    self->_isShufflingCards = 1;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1AC460;
    v5[3] = &unk_428E10;
    v6 = -[THStudyOptions shuffle](-[THNoteCardsController studyOptions](self, "studyOptions"), "shuffle");
    v5[4] = self;
    v5[5] = a3;
    -[THNoteCardsController p_reflectShuffleOptionsChangeWithCompletionBlock:](self, "p_reflectShuffleOptionsChangeWithCompletionBlock:", v5);
  }
}

- (void)studyOptionsDidChangeFilterOptions:(id)a3
{
  -[THNoteCardsController p_filterOptionsChanged](self, "p_filterOptionsChanged", a3);
}

- (void)p_reloadNoteCardInfosFromNavigationUnit:(id)a3
{
  NSMutableArray *v5;
  THGlossaryController *v6;
  id v7;
  THModelGlossary *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  THGlossaryNoteCardInfo *v21;
  id obj;
  uint64_t v23;
  THAnnotationStorageController *v24;
  THNoteCardsController *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[9];
  _QWORD v32[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  self->_unfilteredNoteCardInfos = 0;
  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v24 = -[THDocumentRoot annotationController](self->_documentRoot, "annotationController");
  v25 = self;
  v6 = -[THDocumentRoot glossaryController](self->_documentRoot, "glossaryController");
  v7 = objc_msgSend(a3, "contentNodes");
  v8 = -[THGlossaryController model](v6, "model");
  v26 = +[NSMutableSet set](NSMutableSet, "set");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = 0;
    v23 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)THBundle();
        if ((char *)v11 + v10)
          v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SECTION: %lu \\U2014 %@"), &stru_43D7D8, 0), (char *)v11 + v10, objc_msgSend(v12, "title"));
        else
          v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("%@"), &stru_43D7D8, 0), objc_msgSend(v12, "title"));
        v15 = v14;
        v16 = -[THAnnotationStorageController cachedAnnotationsForContentNode:](v24, "cachedAnnotationsForContentNode:", v12);
        v32[0] = 0;
        v32[1] = v32;
        v32[2] = 0x3052000000;
        v32[3] = sub_1AC88C;
        v32[4] = sub_1AC89C;
        v32[5] = 0;
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_1AC8A8;
        v31[3] = &unk_42AFC8;
        v31[7] = v5;
        v31[8] = v32;
        v31[4] = v12;
        v31[5] = v25;
        v31[6] = v15;
        objc_msgSend(v16, "enumerateAnnotationsWithBlock:", v31);
        objc_msgSend(v26, "addObjectsFromArray:", -[THModelGlossary pathsForEntriesInContentNode:](v8, "pathsForEntriesInContentNode:", v12));
        _Block_object_dispose(v32, 8);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      v10 += (uint64_t)v11;
    }
    while (v9);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v28;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v26);
        v20 = -[THModelGlossary entryForPath:](v8, "entryForPath:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v19));
        v21 = objc_alloc_init(THGlossaryNoteCardInfo);
        -[THGlossaryNoteCardInfo setGlossaryEntry:](v21, "setGlossaryEntry:", v20);
        -[THGlossaryNoteCardInfo setTitle:](v21, "setTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("GLOSSARY TERM"), &stru_43D7D8, 0));
        -[THGlossaryNoteCardInfo setBackTitle:](v21, "setBackTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("DEFINITION"), &stru_43D7D8, 0));
        -[NSMutableArray addObject:](v5, "addObject:", v21);

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v17);
  }
  v25->_unfilteredNoteCardInfos = v5;
  -[THNoteCardsController p_updateNoteCardOrder](v25, "p_updateNoteCardOrder");
}

- (void)p_rotateNoteCardInfosToContentNode:(id)a3
{
  NSSet *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;

  v4 = +[NSSet setWithArray:](NSSet, "setWithArray:", objc_msgSend(-[THAnnotationStorageController cachedAnnotationsForContentNode:](-[THDocumentRoot annotationController](self->_documentRoot, "annotationController"), "cachedAnnotationsForContentNode:", a3), "highlightAnnotations"));
  if (-[NSSet count](v4, "count") && -[NSMutableArray count](self->_unfilteredNoteCardInfos, "count"))
  {
    v5 = 0;
    do
    {
      v6 = -[NSMutableArray lastObject](self->_unfilteredNoteCardInfos, "lastObject");
      v7 = objc_opt_class(THAnnotationNoteCardInfo);
      *(_QWORD *)&v9 = TSUDynamicCast(v7, v6).n128_u64[0];
      if (v8 && -[NSSet containsObject:](v4, "containsObject:", objc_msgSend(v8, "annotation", v9)))
        break;
      -[NSMutableArray insertObject:atIndex:](self->_unfilteredNoteCardInfos, "insertObject:atIndex:", v6, 0, v9);
      -[NSMutableArray removeLastObject](self->_unfilteredNoteCardInfos, "removeLastObject");
      ++v5;
    }
    while (v5 < (unint64_t)-[NSMutableArray count](self->_unfilteredNoteCardInfos, "count"));
  }
}

- (void)p_updateNoteCardOrder
{
  unsigned int v3;
  NSMutableArray *unfilteredNoteCardInfos;

  v3 = -[THStudyOptions shuffle](self->_options, "shuffle");
  unfilteredNoteCardInfos = self->_unfilteredNoteCardInfos;
  if (v3)
    -[NSMutableArray shuffle](unfilteredNoteCardInfos, "shuffle");
  else
    -[NSMutableArray sortUsingComparator:](unfilteredNoteCardInfos, "sortUsingComparator:", &stru_42B008);
}

- (void)p_rebuildNoteCardInfos
{
  NSMutableArray *unfilteredNoteCardInfos;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  THEmptyNoteCardInfo *v9;
  NSMutableArray *noteCardInfos;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  -[NSMutableArray removeAllObjects](self->_noteCardInfos, "removeAllObjects");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  unfilteredNoteCardInfos = self->_unfilteredNoteCardInfos;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](unfilteredNoteCardInfos, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(unfilteredNoteCardInfos);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "shouldShowWithStudyOptions:", self->_options))
          -[NSMutableArray addObject:](self->_noteCardInfos, "addObject:", v8);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](unfilteredNoteCardInfos, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }
  if (!-[NSMutableArray count](self->_noteCardInfos, "count"))
  {
    v9 = objc_alloc_init(THEmptyNoteCardInfo);
    -[THEmptyNoteCardInfo setStudyOptions:](v9, "setStudyOptions:", self->_options);
    -[THEmptyNoteCardInfo setIsUnfilteredContentAvailable:](v9, "setIsUnfilteredContentAvailable:", -[NSMutableArray count](self->_unfilteredNoteCardInfos, "count") != 0);
    -[NSMutableArray addObject:](self->_noteCardInfos, "addObject:", v9);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  noteCardInfos = self->_noteCardInfos;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCardInfos, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(noteCardInfos);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j), "setDarkMode:", self->_darkMode);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCardInfos, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  self->_noteCardInfosUnrotated = (NSArray *)-[NSMutableArray copy](self->_noteCardInfos, "copy");
}

- (id)p_noteCardsForInfos:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_msgSend(a3, "count");
  if ((unint64_t)v6 >= 4)
    v7 = 4;
  else
    v7 = (uint64_t)v6;
  for (; v7; --v7)
  {
    v8 = -[THNoteCardsController p_createNewNoteCardLayer](self, "p_createNewNoteCardLayer");
    objc_msgSend(v8, "setCardIndex:", objc_msgSend(v5, "count"));
    objc_msgSend(v5, "addObject:", v8);

  }
  -[THNoteCardsController p_reloadNoteCardAtIndex:noteCards:noteCardInfos:](self, "p_reloadNoteCardAtIndex:noteCards:noteCardInfos:", 3, v5, a3);
  -[THNoteCardsController p_reloadNoteCardAtIndex:noteCards:noteCardInfos:](self, "p_reloadNoteCardAtIndex:noteCards:noteCardInfos:", 2, v5, a3);
  -[THNoteCardsController p_reloadNoteCardAtIndex:noteCards:noteCardInfos:](self, "p_reloadNoteCardAtIndex:noteCards:noteCardInfos:", 1, v5, a3);
  -[THNoteCardsController p_reloadNoteCardAtIndex:noteCards:noteCardInfos:](self, "p_reloadNoteCardAtIndex:noteCards:noteCardInfos:", 0, v5, a3);
  return v5;
}

- (void)p_recreateNoteCardLayers
{
  NSEnumerator *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  uint64_t v13;
  unint64_t v14;
  NSMutableArray *noteCards;
  id v16;
  id v17;
  uint64_t v18;
  double y;
  void *k;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];

  -[NSMutableArray removeAllObjects](self->_noteCards, "removeAllObjects");
  -[NSArray makeObjectsPerformSelector:](-[CALayer sublayers](self->_noteCardsLayer, "sublayers"), "makeObjectsPerformSelector:", "removeFromSuperlayer");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = -[NSMapTable keyEnumerator](self->_interactiveViewsToLayers, "keyEnumerator");
  v4 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
      }
      v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v5);
  }
  -[NSMapTable removeAllObjects](self->_interactiveViewsToLayers, "removeAllObjects");
  v8 = -[THNoteCardsController p_noteCardsForInfos:](self, "p_noteCardsForInfos:", self->_noteCardInfos);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
        -[NSMutableArray addObject:](self->_noteCards, "addObject:", v13);
        -[CALayer addSublayer:](self->_noteCardsLayer, "addSublayer:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v10);
  }
  if (-[NSMutableArray count](self->_noteCards, "count"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(-[NSMutableArray objectAtIndex:](self->_noteCards, "objectAtIndex:", v14), "setCardIndex:", v14);
      ++v14;
    }
    while (v14 < (unint64_t)-[NSMutableArray count](self->_noteCards, "count"));
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  noteCards = self->_noteCards;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    y = CGPointZero.y;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(noteCards);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)k), "setDragAnchor:", CGPointZero.x, y);
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v17);
  }
  -[THNoteCardsController noteCardDidSettle:](self, "noteCardDidSettle:", -[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"));
}

- (void)p_reloadNoteCards
{
  -[THNoteCardsController p_rebuildNoteCardInfos](self, "p_rebuildNoteCardInfos");
  -[THNoteCardsController p_recreateNoteCardLayers](self, "p_recreateNoteCardLayers");
}

- (void)p_populateNoteCard:(id)a3 withInfo:(id)a4
{
  NSString *v7;

  if (objc_msgSend(a3, "isFlipped"))
    objc_msgSend(a3, "setFlipped:", 0);
  objc_msgSend(objc_msgSend(a3, "frontLayer"), "clearContents");
  objc_msgSend(objc_msgSend(a3, "backLayer"), "clearContents");
  objc_msgSend(a4, "populateNoteCardFront:", objc_msgSend(a3, "frontLayer"));
  objc_msgSend(a3, "setNoteCardInfo:", a4);
  if ((objc_msgSend(a4, "isEmptyCard") & 1) == 0)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("%lu of %lu"), &stru_43D7D8, 0), (_BYTE *)-[NSArray count](self->_noteCardInfosUnrotated, "count")- (_BYTE *)-[NSArray indexOfObject:](self->_noteCardInfosUnrotated, "indexOfObject:", a4), -[THNoteCardsController noteCardCount](self, "noteCardCount"));
    objc_msgSend(objc_msgSend(a3, "frontLayer"), "setCardNumberString:", v7);
    objc_msgSend(objc_msgSend(a3, "backLayer"), "setCardNumberString:", v7);
  }
}

- (void)p_reloadNoteCardAtIndex:(int)a3 noteCards:(id)a4 noteCardInfos:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v9 = objc_msgSend(a5, "count");
  if (v9 < objc_msgSend(a4, "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_reloadNoteCardAtIndex:noteCards:noteCardInfos:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 1075, CFSTR("should have at least as many note card infos as layers"));
  v10 = objc_msgSend(a4, "count");
  v11 = objc_msgSend(a5, "count");
  switch(a3)
  {
    case 0:
      if (v10)
        v12 = 0;
      else
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      if (v11)
        v13 = 0;
      else
        v13 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_28;
    case 1:
      if ((unint64_t)v10 > 1)
        v12 = 1;
      else
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      if ((unint64_t)v11 > 1)
        v13 = 1;
      else
        v13 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_28;
    case 2:
      if ((unint64_t)v10 <= 1)
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v12 = (uint64_t)v10 - 2;
      if ((unint64_t)v11 <= 1)
        v13 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v13 = (uint64_t)v11 - 2;
      goto LABEL_28;
    case 3:
      if (v10)
        v12 = (uint64_t)v10 - 1;
      else
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      if (v11)
        v13 = (uint64_t)v11 - 1;
      else
        v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_28:
      if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v12 != v13)
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_reloadNoteCardAtIndex:noteCards:noteCardInfos:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 1114, CFSTR("indexes should both be valid or invalid at the same time"));
      }
      else
      {
        -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", objc_msgSend(a4, "objectAtIndex:"), objc_msgSend(a5, "objectAtIndex:", v13));
      }
      break;
    default:
      return;
  }
}

- (CATransform3D)p_perspectiveTransformWithScale:(SEL)a3
{
  CATransform3D *result;

  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  result = CATransform3DMakeScale(retstr, a4, a4, 1.0);
  retstr->m34 = -0.000285714286;
  return result;
}

- (void)p_setScale:(double)a3 animated:(BOOL)a4 duration:(double)a5
{
  int scalingMode;

  scalingMode = self->_scalingMode;
  if (scalingMode == 1)
  {
    -[THNoteCardsController p_setDynamicScale:animated:duration:](self, "p_setDynamicScale:animated:duration:", a4, a3 / self->_layoutScale, a5);
  }
  else if (!scalingMode)
  {
    if (a4)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a5), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_setScale:animated:duration:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 1138, CFSTR("should not animate note cards when in Layout mode"));
    -[THNoteCardsController p_setLayoutScale:](self, "p_setLayoutScale:", a3 / self->_dynamicScale, a5);
  }
}

- (void)p_setLayoutScale:(double)a3
{
  double layoutScale;
  NSMutableArray *noteCards;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  layoutScale = self->_layoutScale;
  if (layoutScale != a3 && vabdd_f64(layoutScale, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_layoutScale = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    noteCards = self->_noteCards;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(noteCards);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "setLayoutContext:", +[THNoteCardLayoutContext contextWithScale:hostView:](THNoteCardLayoutContext, "contextWithScale:hostView:", self->_noteCardsView, self->_layoutScale));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }
}

- (void)p_setDynamicScale:(double)a3
{
  -[THNoteCardsController p_setDynamicScale:animated:duration:](self, "p_setDynamicScale:animated:duration:", 0, a3, 0.0);
}

- (void)p_setDynamicScale:(double)a3 animated:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v6;
  __int128 v9;
  CALayer *noteCardsLayer;
  CABasicAnimation *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[8];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v6 = a4;
  self->_dynamicScale = a3;
  v9 = 0uLL;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  noteCardsLayer = self->_noteCardsLayer;
  if (noteCardsLayer)
  {
    -[CALayer sublayerTransform](noteCardsLayer, "sublayerTransform");
    v9 = 0uLL;
  }
  v27 = v9;
  v28 = v9;
  v25 = v9;
  v26 = v9;
  v23 = v9;
  v24 = v9;
  v21 = v9;
  v22 = v9;
  -[THNoteCardsController p_perspectiveTransformWithScale:](self, "p_perspectiveTransformWithScale:", a3);
  v20[4] = v25;
  v20[5] = v26;
  v20[6] = v27;
  v20[7] = v28;
  v20[0] = v21;
  v20[1] = v22;
  v20[2] = v23;
  v20[3] = v24;
  -[CALayer setSublayerTransform:](self->_noteCardsLayer, "setSublayerTransform:", v20);
  if (v6)
  {
    v11 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("sublayerTransform"));
    v16 = v33;
    v17 = v34;
    v18 = v35;
    v19 = v36;
    v12 = v29;
    v13 = v30;
    v14 = v31;
    v15 = v32;
    -[CABasicAnimation setFromValue:](v11, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v12));
    v16 = v25;
    v17 = v26;
    v18 = v27;
    v19 = v28;
    v12 = v21;
    v13 = v22;
    v14 = v23;
    v15 = v24;
    -[CABasicAnimation setToValue:](v11, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v12));
    -[CABasicAnimation setDuration:](v11, "setDuration:", a5);
    -[CABasicAnimation setTimingFunction:](v11, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    -[CALayer addAnimation:forKey:](self->_noteCardsLayer, "addAnimation:forKey:", v11, CFSTR("noteCardsLayerSublayerTransform"));
  }
}

- (id)p_createNewNoteCardLayer
{
  THNoteCardLayer *v3;

  v3 = -[THNoteCardLayer initWithDelegate:darkMode:]([THNoteCardLayer alloc], "initWithDelegate:darkMode:", self, self->_darkMode);
  -[THNoteCardLayer setLayoutContext:](v3, "setLayoutContext:", +[THNoteCardLayoutContext contextWithScale:hostView:](THNoteCardLayoutContext, "contextWithScale:hostView:", self->_noteCardsView, self->_layoutScale));
  return v3;
}

- (BOOL)p_hitTest:(CGPoint)a3 noteCard:(id)a4 outset:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint v19;
  CGRect v20;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  objc_msgSend(a4, "convertPoint:fromLayer:", self->_noteCardsLayer, a3.x, a3.y);
  v11 = v10;
  v13 = v12;
  objc_msgSend(a4, "bounds");
  v20.origin.x = v14 - left;
  v20.origin.y = v15 - top;
  v20.size.width = left + right + v16;
  v20.size.height = top + bottom + v17;
  v19.x = v11;
  v19.y = v13;
  return CGRectContainsPoint(v20, v19);
}

- (id)p_noteCardForPoint:(CGPoint)a3
{
  double y;
  double x;
  NSEnumerator *v6;
  id result;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  y = a3.y;
  x = a3.x;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[NSArray reverseObjectEnumerator](-[CALayer sublayers](self->_noteCardsLayer, "sublayers", 0), "reverseObjectEnumerator");
  result = -[NSEnumerator countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
      objc_msgSend(v11, "convertPoint:fromLayer:", self->_noteCardsLayer, x, y);
      if (objc_msgSend(v11, "containsPoint:"))
      {
        v12 = objc_opt_class(THNoteCardLayer);
        TSUDynamicCast(v12, v11);
        if (result)
          break;
      }
      if (v8 == (id)++v10)
      {
        result = -[NSEnumerator countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v8 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (id)p_topNoteCard
{
  return -[NSMutableArray lastObject](self->_noteCards, "lastObject");
}

- (id)p_bottomNoteCard
{
  return -[NSMutableArray firstObject](self->_noteCards, "firstObject");
}

- (id)p_topNoteCardInfo
{
  return -[NSMutableArray lastObject](self->_noteCardInfos, "lastObject");
}

- (id)p_noteCardAtIndex:(int)a3
{
  NSMutableArray *noteCards;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  noteCards = self->_noteCards;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v13;
  v8 = a3;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(noteCards);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if (objc_msgSend(v10, "cardIndex") == (id)v8)
      return v10;
    if (v6 == (id)++v9)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)p_animateCardToTopOrBottom:(id)a3 direction:(CGPoint)a4 duration:(double)a5
{
  double y;
  double x;
  id v10;
  NSMutableArray *noteCards;
  unint64_t v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *i;
  char *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  y = a4.y;
  x = a4.x;
  if (-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard") != a3
    && -[THNoteCardsController p_bottomNoteCard](self, "p_bottomNoteCard") != a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_animateCardToTopOrBottom:direction:duration:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 1260, CFSTR("shouldn't complete dragging anything other than the top or bottom note cards"));
  }
  v10 = -[THNoteCardsController p_topNoteCard](self, "p_topNoteCard");
  objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "reset");
  noteCards = self->_noteCards;
  if (v10 == a3)
  {
    -[NSMutableArray moveLastObjectToFirst](noteCards, "moveLastObjectToFirst");
    -[NSMutableArray moveLastObjectToFirst](self->_noteCardInfos, "moveLastObjectToFirst");
    v12 = 2;
  }
  else
  {
    -[NSMutableArray moveFirstObjectToLast](noteCards, "moveFirstObjectToLast");
    -[NSMutableArray moveFirstObjectToLast](self->_noteCardInfos, "moveFirstObjectToLast");
    v12 = 1;
  }
  self->_delayedUpdateNoteCardIndex = v12;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = self->_noteCards;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v13);
        v19 = (char *)i + v16;
        v20 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (v20 == a3)
        {
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1ADEE0;
          v24[3] = &unk_426DD0;
          v24[4] = self;
          objc_msgSend(a3, "completeDragInDirection:newCardIndex:animated:duration:completion:", v19, 1, v24, x, y, a5);
          if (v10 == a3)
            v21 = 0;
          else
            v21 = -[NSMutableArray count](self->_noteCards, "count");
          -[CALayer insertSublayer:atIndex:](self->_noteCardsLayer, "insertSublayer:atIndex:", a3, v21);
        }
        else
        {
          objc_msgSend(v20, "setCardIndex:animated:duration:", v19, 1, a5 * 0.5);
        }
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v16 += (uint64_t)i;
    }
    while (v15);
  }
  v22 = -[THNoteCardsController p_topNoteCard](self, "p_topNoteCard");
  if (v22 != -[NSArray lastObject](-[CALayer sublayers](self->_noteCardsLayer, "sublayers"), "lastObject"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_animateCardToTopOrBottom:direction:duration:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 1304, CFSTR("note cards are out of order"));
  v23 = -[THNoteCardsController p_bottomNoteCard](self, "p_bottomNoteCard");
  if (v23 != -[NSArray firstObject](-[CALayer sublayers](self->_noteCardsLayer, "sublayers"), "firstObject"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_animateCardToTopOrBottom:direction:duration:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"), 1305, CFSTR("note cards are out of order"));
}

- (void)p_filterOptionsChanged
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  id v19;
  NSMutableArray *noteCardInfos;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  int v29;
  unint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  double y;
  id v38;
  id v39;
  id v40;
  double v41;
  void *v42;
  id v43;
  id v44;
  char *v45;
  uint64_t v46;
  double v47;
  NSMutableArray *noteCards;
  char *v49;
  NSMutableArray *v50;
  id v51;
  id v52;
  id v53;
  double v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  BOOL v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  double v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  NSMutableArray *v81;
  id v82;
  char *v83;
  uint64_t v84;
  id v85;
  char *v86;
  id v87;
  char *k;
  id v89;
  id v90;
  id v91;
  uint64_t v92;
  void *m;
  id v94;
  id v95;
  uint64_t v96;
  void *n;
  id v98;
  id v99;
  uint64_t v100;
  id v101;
  id v102;
  id v103;
  int v104;
  id v105;
  void *v106;
  _BOOL4 v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[5];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self);
  v3 = -[NSMutableArray copy](self->_noteCardInfos, "copy");
  -[THNoteCardsController p_rebuildNoteCardInfos](self, "p_rebuildNoteCardInfos");
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = objc_alloc_init((Class)NSMutableArray);
  v103 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v3, "count") == (char *)&dword_0 + 1
    && -[NSMutableArray count](self->_noteCardInfos, "count") == (char *)&dword_0 + 1)
  {
    v6 = objc_opt_class(THEmptyNoteCardInfo);
    TSUDynamicCast(v6, objc_msgSend(v3, "firstObject"));
    v8 = v7 != 0;
    v9 = objc_opt_class(THEmptyNoteCardInfo);
    TSUDynamicCast(v9, -[NSMutableArray firstObject](self->_noteCardInfos, "firstObject"));
    if (v10)
      v11 = 0;
    else
      v11 = v8;
    v104 = v11;
    if (v10)
      v12 = v8;
    else
      v12 = 0;
    v107 = v12;
  }
  else
  {
    v107 = 0;
    v104 = 0;
  }
  v13 = objc_alloc_init((Class)NSMutableArray);
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v122, v129, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v123;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v123 != v16)
          objc_enumerationMutation(v3);
        v18 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)i);
        if ((-[NSMutableArray containsObject:](self->_noteCardInfos, "containsObject:", v18) & 1) == 0)
          objc_msgSend(v13, "addObject:", v18);
      }
      v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v122, v129, 16);
    }
    while (v15);
  }
  v108 = v13;
  v19 = objc_alloc_init((Class)NSMutableArray);
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  noteCardInfos = self->_noteCardInfos;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCardInfos, "countByEnumeratingWithState:objects:count:", &v118, v128, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v119;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v119 != v23)
          objc_enumerationMutation(noteCardInfos);
        v25 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v3, "containsObject:", v25) & 1) == 0)
          objc_msgSend(v19, "addObject:", v25);
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCardInfos, "countByEnumeratingWithState:objects:count:", &v118, v128, 16);
    }
    while (v22);
  }
  v26 = v103;
  v27 = v107;
  if (!v107)
  {
    v28 = objc_msgSend(v3, "count");
    if (v28 < -[NSMutableArray count](self->_noteCardInfos, "count"))
      v29 = 1;
    else
      v29 = v104;
    if (v29 == 1)
    {
      if (-[NSMutableArray count](self->_noteCards, "count"))
      {
        v30 = 0;
        do
        {
          if (objc_msgSend(v108, "containsObject:", objc_msgSend(v3, "objectAtIndex:", v30)))
            objc_msgSend(v103, "addObject:", -[NSMutableArray objectAtIndex:](self->_noteCards, "objectAtIndex:", v30));
          ++v30;
        }
        while (v30 < (unint64_t)-[NSMutableArray count](self->_noteCards, "count"));
      }
      v31 = -[NSMutableArray mutableCopy](self->_noteCardInfos, "mutableCopy");
      v105 = objc_msgSend(v19, "mutableCopy");
      if (objc_msgSend(v31, "count"))
      {
        v32 = objc_msgSend(v3, "lastObject");
        if (v32 != objc_msgSend(v31, "lastObject"))
        {
          v33 = objc_msgSend(v31, "lastObject");
          v34 = -[THNoteCardsController p_createNewNoteCardLayer](self, "p_createNewNoteCardLayer");
          -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", v34, v33);
          -[CALayer addSublayer:](self->_noteCardsLayer, "addSublayer:", v34);
          objc_msgSend(v34, "setFilteredOut:", 1);
          v35 = -[NSMutableArray count](self->_noteCardInfos, "count");
          if ((unint64_t)v35 >= 4)
            v36 = 4;
          else
            v36 = (uint64_t)v35;
          objc_msgSend(v34, "setCardIndex:", v36);
          y = CGPointZero.y;
          objc_msgSend(v34, "setDragAnchor:", CGPointZero.x, y);
          objc_msgSend(v34, "setDragOffset:", CGPointZero.x, y);
          -[NSMutableArray addObject:](self->_noteCards, "addObject:", v34);

          objc_msgSend(v4, "addObject:", v34);
          objc_msgSend(v31, "removeObject:", v33);
          objc_msgSend(v105, "removeObject:", v33);
        }
      }
      if (objc_msgSend(v31, "count"))
      {
        v38 = objc_msgSend(v3, "firstObject");
        if (v38 != objc_msgSend(v31, "firstObject"))
        {
          v39 = objc_msgSend(v31, "firstObject");
          v40 = -[THNoteCardsController p_createNewNoteCardLayer](self, "p_createNewNoteCardLayer");
          -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", v40, v39);
          -[CALayer addSublayer:](self->_noteCardsLayer, "addSublayer:", v40);
          objc_msgSend(v40, "setFilteredOut:", 1);
          objc_msgSend(v40, "setCardIndex:", 0);
          v41 = CGPointZero.y;
          objc_msgSend(v40, "setDragAnchor:", CGPointZero.x, v41);
          objc_msgSend(v40, "setDragOffset:", CGPointZero.x, v41);
          -[NSMutableArray insertObject:atIndex:](self->_noteCards, "insertObject:atIndex:", v40, 0);

          objc_msgSend(v4, "addObject:", v40);
          objc_msgSend(v31, "removeObject:", v39);
          objc_msgSend(v105, "removeObject:", v39);
        }
      }
      v42 = v105;
      if (objc_msgSend(v105, "count"))
      {
        v43 = objc_msgSend(v105, "lastObject");
        v44 = -[THNoteCardsController p_createNewNoteCardLayer](self, "p_createNewNoteCardLayer");
        -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", v44, v43);
        -[CALayer addSublayer:](self->_noteCardsLayer, "addSublayer:", v44);
        objc_msgSend(v44, "setFilteredOut:", 1);
        v45 = (char *)-[NSMutableArray count](self->_noteCardInfos, "count");
        if ((unint64_t)(v45 - 1) >= 3)
          v46 = 3;
        else
          v46 = (uint64_t)(v45 - 1);
        objc_msgSend(v44, "setCardIndex:", v46);
        v47 = CGPointZero.y;
        objc_msgSend(v44, "setDragAnchor:", CGPointZero.x, v47);
        objc_msgSend(v44, "setDragOffset:", CGPointZero.x, v47);
        noteCards = self->_noteCards;
        v49 = (char *)-[NSMutableArray count](noteCards, "count") - 1;
        v50 = noteCards;
        v27 = v107;
        -[NSMutableArray insertObject:atIndex:](v50, "insertObject:atIndex:", v44, v49);

        objc_msgSend(v4, "addObject:", v44);
        objc_msgSend(v31, "removeObject:", v43);
        v51 = v43;
        v42 = v105;
        objc_msgSend(v105, "removeObject:", v51);
      }
      if (objc_msgSend(v42, "count"))
      {
        v52 = objc_msgSend(v42, "firstObject");
        v53 = -[THNoteCardsController p_createNewNoteCardLayer](self, "p_createNewNoteCardLayer");
        -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", v53, v52);
        -[CALayer addSublayer:](self->_noteCardsLayer, "addSublayer:", v53);
        objc_msgSend(v53, "setFilteredOut:", 1);
        objc_msgSend(v53, "setCardIndex:", 1);
        v54 = CGPointZero.y;
        objc_msgSend(v53, "setDragAnchor:", CGPointZero.x, v54);
        objc_msgSend(v53, "setDragOffset:", CGPointZero.x, v54);
        -[NSMutableArray insertObject:atIndex:](self->_noteCards, "insertObject:atIndex:", v53, 1);

        objc_msgSend(v4, "addObject:", v53);
        objc_msgSend(v31, "removeObject:", v52);
        v55 = v52;
        v42 = v105;
        objc_msgSend(v105, "removeObject:", v55);
      }
LABEL_83:

      goto LABEL_84;
    }
    v56 = objc_msgSend(v3, "mutableCopy");
    v57 = -[NSMutableArray mutableCopy](self->_noteCardInfos, "mutableCopy");
    v102 = objc_msgSend(v108, "mutableCopy");
    v106 = v57;
    if (objc_msgSend(v56, "count")
      && objc_msgSend(v57, "count")
      && (v58 = objc_msgSend(v56, "lastObject"), v58 == objc_msgSend(v57, "lastObject")))
    {
      objc_msgSend(v56, "removeObject:", objc_msgSend(v56, "lastObject"));
      objc_msgSend(v57, "removeObject:", objc_msgSend(v57, "lastObject"));
      v61 = 1;
    }
    else
    {
      v59 = objc_msgSend(v56, "lastObject");
      v60 = -[NSMutableArray lastObject](self->_noteCards, "lastObject");
      objc_msgSend(v5, "addObject:", v60);

      v57 = v106;
      objc_msgSend(v56, "removeObject:", v59);
      objc_msgSend(v102, "removeObject:", v59);
      v61 = 0;
    }
    if (objc_msgSend(v57, "count")
      && objc_msgSend(v56, "count")
      && (v62 = objc_msgSend(v56, "firstObject"), v63 = v62 == objc_msgSend(v106, "firstObject"), v57 = v106, v63))
    {
      objc_msgSend(v56, "removeObject:", objc_msgSend(v56, "firstObject"));
      objc_msgSend(v106, "removeObject:", objc_msgSend(v106, "firstObject"));
      ++v61;
    }
    else if (objc_msgSend(v56, "count"))
    {
      v64 = objc_msgSend(v56, "firstObject");
      v65 = -[NSMutableArray firstObject](self->_noteCards, "firstObject");
      objc_msgSend(v5, "addObject:", v65);

      objc_msgSend(v56, "removeObject:", v64);
      v66 = v64;
      v57 = v106;
      objc_msgSend(v102, "removeObject:", v66);
    }
    if ((unint64_t)-[NSMutableArray count](self->_noteCards, "count") >= 3)
    {
      v100 = v61;
      v67 = -[NSMutableArray objectAtIndex:](self->_noteCards, "objectAtIndex:", 1);
      if (objc_msgSend(v102, "count"))
      {
        v68 = objc_msgSend(v102, "firstObject");
        -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", v67, v68);
        objc_msgSend(v5, "addObject:", v67);
        objc_msgSend(v102, "removeObject:", v68);
        objc_msgSend(v56, "removeObject:", v68);
      }
      else
      {
        v69 = v57;
        v70 = objc_msgSend(v57, "firstObject");
        -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", v67, v70);
        objc_msgSend(v69, "removeObject:", v70);
        v61 = v100 + 1;
      }
    }
    v101 = v56;
    if ((unint64_t)-[NSMutableArray count](self->_noteCards, "count") >= 4)
    {
      v71 = -[NSMutableArray objectAtIndex:](self->_noteCards, "objectAtIndex:", 2);
      if (!objc_msgSend(v102, "count"))
      {
        v98 = objc_msgSend(v106, "lastObject");
        -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", v71, v98);
        v99 = v98;
        v42 = v106;
        objc_msgSend(v106, "removeObject:", v99);
        ++v61;
LABEL_74:
        if (objc_msgSend(v42, "count") && v61 != 4)
        {
          v73 = CGPointZero.y;
          v74 = v61 - 3;
          v75 = 1;
          do
          {
            v76 = v74;
            if ((v75 & 1) != 0)
              v77 = objc_msgSend(v42, "lastObject");
            else
              v77 = objc_msgSend(v42, "firstObject");
            v78 = v77;
            v79 = v42;
            v80 = -[THNoteCardsController p_createNewNoteCardLayer](self, "p_createNewNoteCardLayer");
            -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", v80, v78);
            -[CALayer insertSublayer:atIndex:](self->_noteCardsLayer, "insertSublayer:atIndex:", v80, 0);
            objc_msgSend(v80, "setCardIndex:", 1);
            objc_msgSend(v80, "setDragOffset:", CGPointZero.x, v73);
            -[NSMutableArray addObject:](self->_noteCards, "addObject:", v80);

            objc_msgSend(v79, "removeObject:", v78);
            v42 = v79;
            if (!objc_msgSend(v79, "count"))
              break;
            v75 ^= 1u;
            v74 = v76 + 1;
          }
          while (v76);
        }
        v81 = self->_noteCards;
        v117[0] = _NSConcreteStackBlock;
        v117[1] = 3221225472;
        v117[2] = sub_1AEDE4;
        v117[3] = &unk_427B40;
        v117[4] = self;
        -[NSMutableArray sortUsingComparator:](v81, "sortUsingComparator:", v117);

        v26 = v103;
        v27 = v107;
        v31 = v101;
        goto LABEL_83;
      }
      v72 = objc_msgSend(v102, "lastObject");
      -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", v71, v72);
      objc_msgSend(v5, "addObject:", v71);
      objc_msgSend(v102, "removeObject:", v72);
      objc_msgSend(v56, "removeObject:", v72);
    }
    v42 = v106;
    goto LABEL_74;
  }
LABEL_84:
  -[NSMutableArray removeObjectsInArray:](self->_noteCards, "removeObjectsInArray:", v5);
  if (-[NSMutableArray count](self->_noteCards, "count"))
  {
    v82 = -[NSMutableArray lastObject](self->_noteCards, "lastObject");
    v83 = (char *)-[NSMutableArray count](self->_noteCards, "count");
    if ((unint64_t)(v83 - 1) >= 3)
      v84 = 3;
    else
      v84 = (uint64_t)(v83 - 1);
    if ((objc_msgSend(v4, "containsObject:", v82) & 1) != 0
      || (objc_msgSend(v5, "containsObject:", v82) & 1) != 0)
    {
      objc_msgSend(v82, "setCardIndex:", v84);
    }
    else
    {
      objc_msgSend(v82, "setCardIndex:forceHidden:animated:duration:", v84, objc_msgSend(v26, "containsObject:", v82), 1, 0.75);
    }
  }
  if ((unint64_t)-[NSMutableArray count](self->_noteCards, "count") >= 2)
  {
    v85 = -[NSMutableArray firstObject](self->_noteCards, "firstObject");
    if ((objc_msgSend(v4, "containsObject:", v85) & 1) != 0
      || (objc_msgSend(v5, "containsObject:", v85) & 1) != 0)
    {
      objc_msgSend(v85, "setCardIndex:", 0);
    }
    else
    {
      objc_msgSend(v85, "setCardIndex:forceHidden:animated:duration:", 0, objc_msgSend(v26, "containsObject:", v85), 1, 0.75);
    }
  }
  if ((unint64_t)-[NSMutableArray count](self->_noteCards, "count") >= 3
    && ceilf((float)(unint64_t)-[NSMutableArray count](self->_noteCards, "count") * 0.5) > 1.0)
  {
    v86 = (_BYTE *)(&dword_0 + 1);
    do
    {
      if (v86 >= (char *)-[NSMutableArray count](self->_noteCards, "count") - 1)
        break;
      v87 = -[NSMutableArray objectAtIndex:](self->_noteCards, "objectAtIndex:", v86);
      if ((objc_msgSend(v4, "containsObject:", v87) & 1) != 0
        || (objc_msgSend(v5, "containsObject:", v87) & 1) != 0)
      {
        objc_msgSend(v87, "setCardIndex:", 1);
      }
      else
      {
        objc_msgSend(v87, "setCardIndex:forceHidden:animated:duration:", 1, objc_msgSend(v26, "containsObject:", v87), 1, 0.75);
      }
      ++v86;
    }
    while (ceilf((float)(unint64_t)-[NSMutableArray count](self->_noteCards, "count") * 0.5) > (float)(unint64_t)v86);
  }
  if ((unint64_t)-[NSMutableArray count](self->_noteCards, "count") >= 4)
  {
    for (k = (char *)vcvtps_u32_f32((float)(unint64_t)-[NSMutableArray count](self->_noteCards, "count") * 0.5);
          k < (char *)-[NSMutableArray count](self->_noteCards, "count") - 1;
          ++k)
    {
      v89 = -[NSMutableArray objectAtIndex:](self->_noteCards, "objectAtIndex:", k);
      if ((objc_msgSend(v4, "containsObject:", v89) & 1) != 0
        || (objc_msgSend(v5, "containsObject:", v89) & 1) != 0)
      {
        objc_msgSend(v89, "setCardIndex:", 2);
      }
      else
      {
        objc_msgSend(v89, "setCardIndex:forceHidden:animated:duration:", 2, objc_msgSend(v26, "containsObject:", v89), 1, 0.75);
      }
    }
  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v90 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
  if (v90)
  {
    v91 = v90;
    v92 = *(_QWORD *)v114;
    do
    {
      for (m = 0; m != v91; m = (char *)m + 1)
      {
        if (*(_QWORD *)v114 != v92)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)m), "setFilteredOut:direction:animated:duration:completion:", 0, 1, 0, 1.0, 0.0, 0.5);
      }
      v91 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
    }
    while (v91);
  }
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v94 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v110;
    do
    {
      for (n = 0; n != v95; n = (char *)n + 1)
      {
        if (*(_QWORD *)v110 != v96)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)n), "setFilteredOut:direction:animated:duration:completion:", 1, 1, 0, 1.0, 0.0, 0.5);
      }
      v95 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
    }
    while (v95);
  }

  if (v27)
    -[THNoteCardsController p_recreateNoteCardLayers](self, "p_recreateNoteCardLayers");
  else
    -[THNoteCardsController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_recreateNoteCardLayers", 0, 0.75);
}

- (void)p_reflectShuffleOptionsChangeWithCompletionBlock:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  _QWORD v35[3];
  id v36;
  _QWORD v37[4];

  if ((unint64_t)-[NSMutableArray count](self->_noteCardInfos, "count") >= 2)
  {
    -[THNoteCardsController p_updateNoteCardOrder](self, "p_updateNoteCardOrder");
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v36 = 0;
    v36 = -[NSMutableArray count](self->_noteCards, "count");
    if (-[NSMutableArray count](self->_noteCardInfos, "count", _NSConcreteStackBlock, 3221225472, sub_1AF32C, &unk_42B030, self, a3, v37, v35) == (char *)&dword_0 + 2)
    {
      v5 = -[THNoteCardsController p_noteCardAtIndex:](self, "p_noteCardAtIndex:", 1);
      v6 = -[THNoteCardsController p_noteCardAtIndex:](self, "p_noteCardAtIndex:", 0);
      v7 = -[NSMutableArray lastObject](self->_noteCardInfos, "lastObject");
      -[THNoteCardsController p_rebuildNoteCardInfos](self, "p_rebuildNoteCardInfos");
      v8 = -[NSMutableArray lastObject](self->_noteCardInfos, "lastObject");
      if (v7 == v8)
        v9 = 0.5;
      else
        v9 = 0.625;
      objc_msgSend(v5, "shuffleToIndex:animated:delay:duration:completion:", v7 == v8, 1, &v34, 0.0, v9);
      if (v7 == v8)
        v10 = 0.5;
      else
        v10 = 0.375;
      objc_msgSend(v6, "shuffleToIndex:animated:delay:duration:completion:", v7 != v8, 1, &v34, 0.125, v10);
    }
    else if (-[NSMutableArray count](self->_noteCardInfos, "count") == (char *)&dword_0 + 3)
    {
      v11 = -[THNoteCardsController p_noteCardAtIndex:](self, "p_noteCardAtIndex:", 2);
      v12 = -[THNoteCardsController p_noteCardAtIndex:](self, "p_noteCardAtIndex:", 1);
      v13 = -[THNoteCardsController p_noteCardAtIndex:](self, "p_noteCardAtIndex:", 0);
      v14 = -[NSMutableArray objectAtIndex:](self->_noteCardInfos, "objectAtIndex:", 2);
      v15 = -[NSMutableArray objectAtIndex:](self->_noteCardInfos, "objectAtIndex:", 1);
      v16 = -[NSMutableArray objectAtIndex:](self->_noteCardInfos, "objectAtIndex:", 0);
      -[THNoteCardsController p_rebuildNoteCardInfos](self, "p_rebuildNoteCardInfos");
      v17 = -[NSMutableArray indexOfObject:](self->_noteCardInfos, "indexOfObject:", v14);
      objc_msgSend(v11, "shuffleToIndex:animated:delay:duration:completion:", v17, 1, &v34, 0.0, (double)(2 - (uint64_t)v17) * 0.125 + 0.5);
      v18 = -[NSMutableArray indexOfObject:](self->_noteCardInfos, "indexOfObject:", v15);
      objc_msgSend(v12, "shuffleToIndex:animated:delay:duration:completion:", v18, 1, &v34, 0.125, (double)(1 - (uint64_t)v18) * 0.125 + 0.5);
      v19 = (uint64_t)-[NSMutableArray indexOfObject:](self->_noteCardInfos, "indexOfObject:", v16);
      objc_msgSend(v13, "shuffleToIndex:animated:delay:duration:completion:", v19, 1, &v34, 0.25, (double)-v19 * 0.125 + 0.5);
    }
    else if ((unint64_t)-[NSMutableArray count](self->_noteCardInfos, "count") >= 4)
    {
      v20 = -[THNoteCardsController p_noteCardAtIndex:](self, "p_noteCardAtIndex:", 3);
      v21 = -[THNoteCardsController p_noteCardAtIndex:](self, "p_noteCardAtIndex:", 2);
      v22 = -[THNoteCardsController p_noteCardAtIndex:](self, "p_noteCardAtIndex:", 1);
      v23 = -[THNoteCardsController p_noteCardAtIndex:](self, "p_noteCardAtIndex:", 0);
      v24 = -[NSMutableArray lastObject](self->_noteCardInfos, "lastObject");
      v25 = -[NSMutableArray firstObject](self->_noteCardInfos, "firstObject");
      -[THNoteCardsController p_rebuildNoteCardInfos](self, "p_rebuildNoteCardInfos");
      v26 = -[NSMutableArray lastObject](self->_noteCardInfos, "lastObject");
      v27 = -[NSMutableArray firstObject](self->_noteCardInfos, "firstObject");
      if (v24 != v26)
        -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", v21, v26);
      if (v25 != v27)
        -[THNoteCardsController p_populateNoteCard:withInfo:](self, "p_populateNoteCard:withInfo:", v22, v27);
      if (v24 == v26)
        v28 = 3;
      else
        v28 = 2;
      if (v24 == v26)
        v29 = 0.5;
      else
        v29 = 0.625;
      objc_msgSend(v20, "shuffleToIndex:animated:delay:duration:completion:", v28, 1, &v34, 0.0, v29);
      if (v24 == v26)
        v30 = 2;
      else
        v30 = 3;
      if (v24 == v26)
        v31 = 0.5;
      else
        v31 = 0.375;
      objc_msgSend(v21, "shuffleToIndex:animated:delay:duration:completion:", v30, 1, &v34, 0.125, v31);
      if (v25 == v27)
        v32 = 0.5;
      else
        v32 = 0.625;
      objc_msgSend(v22, "shuffleToIndex:animated:delay:duration:completion:", v25 == v27, 1, &v34, 0.25, v32);
      if (v25 == v27)
        v33 = 0.5;
      else
        v33 = 0.375;
      objc_msgSend(v23, "shuffleToIndex:animated:delay:duration:completion:", v25 != v27, 1, &v34, 0.375, v33);
    }
    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);
  }
}

- (void)p_unfilteredNoteCardInfosChangedMoveToRight:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  NSMutableArray *noteCards;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  unint64_t v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *k;
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];

  v3 = a3;
  if (-[NSMutableArray count](self->_noteCardInfos, "count"))
  {
    if (v3)
      v5 = 1.0;
    else
      v5 = -1.0;
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_recreateNoteCardLayers", 0);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    noteCards = self->_noteCards;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(noteCards);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "setFilteredOut:direction:animated:duration:completion:", 1, 1, 0, -v5, 0.0, 0.5);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](noteCards, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v8);
    }
    -[NSMutableArray removeAllObjects](self->_noteCards, "removeAllObjects");
    -[THNoteCardsController p_rebuildNoteCardInfos](self, "p_rebuildNoteCardInfos");
    v11 = -[THNoteCardsController p_noteCardsForInfos:](self, "p_noteCardsForInfos:", self->_noteCardInfos);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
          -[NSMutableArray addObject:](self->_noteCards, "addObject:", v16);
          -[CALayer addSublayer:](self->_noteCardsLayer, "addSublayer:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v13);
    }
    if (-[NSMutableArray count](self->_noteCards, "count"))
    {
      v17 = 0;
      do
      {
        objc_msgSend(-[NSMutableArray objectAtIndex:](self->_noteCards, "objectAtIndex:", v17), "setCardIndex:", v17);
        objc_msgSend(-[NSMutableArray objectAtIndex:](self->_noteCards, "objectAtIndex:", v17++), "setFilteredOut:direction:", 1, v5, 0.0);
      }
      while (v17 < (unint64_t)-[NSMutableArray count](self->_noteCards, "count"));
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = self->_noteCards;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (k = 0; k != v20; k = (char *)k + 1)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)k);
          if (v23 == -[NSMutableArray lastObject](self->_noteCards, "lastObject"))
          {
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_1AF71C;
            v25[3] = &unk_426DD0;
            v24 = v25;
            v25[4] = self;
          }
          else
          {
            v24 = 0;
          }
          objc_msgSend(v23, "setFilteredOut:direction:animated:duration:completion:", 0, 1, v24, -v5, 0.0, 0.5);
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v20);
    }
  }
  else
  {
    -[THNoteCardsController p_reloadNoteCards](self, "p_reloadNoteCards");
  }
}

- (void)p_makeTopCardInteractive
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  CALayer *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id obj;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFString *v21;
  id v22;
  _BYTE v23[128];

  if (!-[NSMapTable count](self->_interactiveViewsToLayers, "count") && !self->_scalingMode)
  {
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = objc_msgSend(-[THNoteCardsController p_topNoteCard](self, "p_topNoteCard"), "interactiveLayers");
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v18;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v18 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v6);
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1AF938;
          v16[3] = &unk_42B058;
          v16[4] = self;
          v21 = CFSTR("scrollViewBlock");
          v22 = objc_msgSend(v16, "copy");
          v8 = objc_msgSend(v7, "swapIntoView:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
          if (v8)
          {
            v9 = v8;
            v10 = -[UIView layer](self->_hostView, "layer");
            objc_msgSend(v9, "frame");
            -[CALayer convertRect:fromLayer:](v10, "convertRect:fromLayer:", objc_msgSend(v7, "superlayer"), v11, v12, v13, v14);
            objc_msgSend(v9, "setFrame:");
            -[UIView addSubview:](self->_hostView, "addSubview:", v9);
            objc_msgSend(v7, "setHidden:", 1);
            -[NSMapTable setObject:forKey:](self->_interactiveViewsToLayers, "setObject:forKey:", v7, v9);
          }
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v4);
    }
  }
}

- (void)p_makeTopCardNonInteractive
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (-[NSMapTable count](self->_interactiveViewsToLayers, "count"))
  {
    v3 = -[NSMapTable copy](self->_interactiveViewsToLayers, "copy");
    -[NSMapTable removeAllObjects](self->_interactiveViewsToLayers, "removeAllObjects");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = objc_msgSend(v3, "keyEnumerator", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          v10 = objc_msgSend(v3, "objectForKey:", v9);
          objc_msgSend(v10, "swapOutOfView:", v9);
          +[CATransaction begin](CATransaction, "begin");
          +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
          objc_msgSend(v9, "removeFromSuperview");
          +[CATransaction commit](CATransaction, "commit");
          objc_msgSend(v10, "setHidden:", 0);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    self->_topScrollView = 0;
  }
}

- (THNoteCardsControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THNoteCardsControllerDelegate *)a3;
}

- (THStudyOptions)studyOptions
{
  return self->_options;
}

- (NSArray)noteCards
{
  return &self->_noteCards->super;
}

- (CGSize)minCardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minCardSize.width;
  height = self->_minCardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinCardSize:(CGSize)a3
{
  self->_minCardSize = a3;
}

- (CGSize)maxCardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxCardSize.width;
  height = self->_maxCardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxCardSize:(CGSize)a3
{
  self->_maxCardSize = a3;
}

- (int)scalingMode
{
  return self->_scalingMode;
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

@end
