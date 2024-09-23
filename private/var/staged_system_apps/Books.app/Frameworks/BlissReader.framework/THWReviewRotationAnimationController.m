@implementation THWReviewRotationAnimationController

- (THWReviewRotationAnimationController)initWithRep:(id)a3
{
  THWReviewRotationAnimationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWReviewRotationAnimationController;
  v4 = -[THWReviewRotationAnimationController init](&v6, "init");
  if (v4)
    v4->_rep = (THWReviewRep *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewRotationAnimationController;
  -[THWReviewRotationAnimationController dealloc](&v3, "dealloc");
}

- (int)autoRotationMode
{
  return 4;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  return 1.0;
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)expandedWillRotateTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  -[THWPagedCanvasController setPadInfos:](-[THWReviewRep stageCanvasController](self->_rep, "stageCanvasController", a3.width, a3.height, a4.width, a4.height), "setPadInfos:", 0);
  +[CATransaction flush](CATransaction, "flush");
}

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  -[THWPagedCanvasController setPadInfos:](-[THWReviewRep stageCanvasController](self->_rep, "stageCanvasController", a3.width, a3.height), "setPadInfos:", 1);
  -[THScrollView setClipsToBounds:](-[THWPagedCanvasController scrollView](-[THWReviewRep stageCanvasController](self->_rep, "stageCanvasController"), "scrollView"), "setClipsToBounds:", 1);
  objc_msgSend(-[THWReviewRep layout](self->_rep, "layout"), "invalidateQuestionLayouts");
  -[THWPagedCanvasController invalidateLayoutsAndFrames](-[THWReviewRep stageCanvasController](self->_rep, "stageCanvasController"), "invalidateLayoutsAndFrames");
}

- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  THWReviewRotationAnimationController *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  -[TSDInteractiveCanvasController beginAnimations:context:](-[THWPagedCanvasController interactiveCanvasController](-[THWReviewRep stageCanvasController](self->_rep, "stageCanvasController", a3.width, a3.height, a4.width, a4.height), "interactiveCanvasController"), "beginAnimations:context:", CFSTR("reviewRotate"), 0);
  -[TSDInteractiveCanvasController setAnimationDuration:](-[THWPagedCanvasController interactiveCanvasController](-[THWReviewRep stageCanvasController](self->_rep, "stageCanvasController"), "interactiveCanvasController"), "setAnimationDuration:", a5);
  v7 = -[THWReviewRep p_currentScrollableCanvasController](self->_rep, "p_currentScrollableCanvasController");
  objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "beginAnimations:context:", CFSTR("reviewRotate"), 0);
  objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "setAnimationDuration:", a5);
  -[THScrollView setClipsToBounds:](-[THWPagedCanvasController scrollView](-[THWReviewRep stageCanvasController](self->_rep, "stageCanvasController"), "scrollView"), "setClipsToBounds:", 0);
  objc_msgSend(-[THWReviewRep layout](self->_rep, "layout"), "invalidateFrame");
  -[THWPagedCanvasController invalidateLayoutsAndFrames](-[THWReviewRep stageCanvasController](self->_rep, "stageCanvasController"), "invalidateLayoutsAndFrames");
  objc_msgSend(v7, "invalidateLayoutsAndFrames");
  v8 = objc_alloc_init((Class)TSUMutableRetainedPointerSet);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "canvas"), "topLevelReps");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:withObject:", "addToSet:", v8);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v11);
  }
  objc_msgSend(-[THWReviewRep interactiveCanvasController](self->_rep, "interactiveCanvasController"), "layoutIfNeeded");
  v25 = self;
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWPagedCanvasController interactiveCanvasController](-[THWReviewRep stageCanvasController](self->_rep, "stageCanvasController"), "interactiveCanvasController"), "layoutIfNeeded");
  v24 = v7;
  objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "layoutIfNeeded");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v8);
        v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
        v19 = objc_opt_class(TSWPRep);
        *(_QWORD *)&v21 = TSUDynamicCast(v19, v18).n128_u64[0];
        if (v20)
        {
          v22 = v20;
          v23 = +[CATransition animation](CATransition, "animation", v21);
          objc_msgSend(v23, "setType:", kCATransitionFade);
          objc_msgSend(v23, "setDuration:", a5);
          objc_msgSend(objc_msgSend(v22, "textLayer"), "addAnimation:forKey:", v23, CFSTR("fadeAnimation"));
        }
      }
      v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16, v21);
    }
    while (v15);
  }
  objc_msgSend(objc_msgSend(v24, "interactiveCanvasController"), "commitAnimations");
  -[TSDInteractiveCanvasController commitAnimations](-[THWPagedCanvasController interactiveCanvasController](-[THWReviewRep stageCanvasController](v25->_rep, "stageCanvasController"), "interactiveCanvasController"), "commitAnimations");

}

- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  objc_msgSend(-[THWReviewRep layout](self->_rep, "layout", a3.width, a3.height, a4.width, a4.height), "invalidateFrame");
  objc_msgSend(-[THWReviewRep layout](self->_rep, "layout"), "invalidateQuestionLayouts");
  -[THWPagedCanvasController invalidateLayoutsAndFrames](-[THWReviewRep stageCanvasController](self->_rep, "stageCanvasController"), "invalidateLayoutsAndFrames");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[NSMutableDictionary allValues](-[THWReviewRep scrollableCanvasControllers](self->_rep, "scrollableCanvasControllers", 0), "allValues");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "invalidateLayoutsAndFrames");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (THWReviewRep)rep
{
  return self->_rep;
}

@end
