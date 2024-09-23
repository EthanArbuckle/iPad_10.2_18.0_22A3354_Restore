@implementation SXTextTangierInteractiveCanvasController

+ (void)createCanvasWithDelegate:(id)a3 outICC:(id *)a4 outLayerHost:(id *)a5 iccClass:(Class)a6 layerHostClass:(Class)a7
{
  SXCanvasCreateWithClass(a3, a4, a5, a6, a7);
}

- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v8 = a4;
  v9 = a3;
  objc_opt_class();
  TSUDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  TSUDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "substringWithSelection:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextTangierInteractiveCanvasController setSelectedText:](self, "setSelectedText:", v12);

  v13.receiver = self;
  v13.super_class = (Class)SXTextTangierInteractiveCanvasController;
  -[TSDInteractiveCanvasController setSelection:onModel:withFlags:](&v13, sel_setSelection_onModel_withFlags_, v9, v8, a5 & 0xFFFFFFFFFFFFFFAFLL);

}

- (void)willEndEditingText
{
  objc_super v3;

  -[SXTextTangierInteractiveCanvasController setSelectedText:](self, "setSelectedText:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierInteractiveCanvasController;
  -[TSWPInteractiveCanvasController willEndEditingText](&v3, sel_willEndEditingText);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextTangierInteractiveCanvasController;
  -[TSDInteractiveCanvasController scrollViewWillBeginDragging:](&v5, sel_scrollViewWillBeginDragging_, a3);
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactiveCanvasControllerWillStartInteraction:", self);

  -[SXTextTangierInteractiveCanvasController setIsScrolling:](self, "setIsScrolling:", 1);
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXTextTangierInteractiveCanvasController;
  -[TSDInteractiveCanvasController scrollViewDidScroll:](&v6, sel_scrollViewDidScroll_, a3);
  if (-[SXTextTangierInteractiveCanvasController mightScrollToTop](self, "mightScrollToTop"))
  {
    -[SXTextTangierInteractiveCanvasController setIsScrolling:](self, "setIsScrolling:", 1);
    -[SXTextTangierInteractiveCanvasController setMightScrollToTop:](self, "setMightScrollToTop:", 0);
    -[TSDInteractiveCanvasController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactiveCanvasControllerWillStartInteraction:", self);

  }
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactiveCanvasControllerDidScroll:", self);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXTextTangierInteractiveCanvasController;
  -[TSDInteractiveCanvasController scrollViewDidEndDragging:willDecelerate:](&v10, sel_scrollViewDidEndDragging_willDecelerate_, v6, v4);
  if (!v4)
    -[SXTextTangierInteractiveCanvasController setIsScrolling:](self, "setIsScrolling:", 0);
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[TSDInteractiveCanvasController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "interactiveCanvasController:scrollViewDidEndDragging:willDecelerate:", self, v6, v4);

  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "scrollsToTop");
  if (v4)
    -[SXTextTangierInteractiveCanvasController setMightScrollToTop:](self, "setMightScrollToTop:", 1);
  return v4;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextTangierInteractiveCanvasController;
  -[TSDInteractiveCanvasController scrollViewDidEndDecelerating:](&v5, sel_scrollViewDidEndDecelerating_, a3);
  -[SXTextTangierInteractiveCanvasController setIsScrolling:](self, "setIsScrolling:", 0);
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactiveCanvasControllerDidStopScrolling:", self);

}

- (void)scrollViewDidScrollToTop:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextTangierInteractiveCanvasController;
  -[TSDInteractiveCanvasController scrollViewDidScrollToTop:](&v5, sel_scrollViewDidScrollToTop_, a3);
  -[SXTextTangierInteractiveCanvasController setIsScrolling:](self, "setIsScrolling:", 0);
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactiveCanvasControllerDidStopScrolling:", self);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextTangierInteractiveCanvasController;
  -[TSDInteractiveCanvasController scrollViewDidEndScrollingAnimation:](&v5, sel_scrollViewDidEndScrollingAnimation_, a3);
  -[SXTextTangierInteractiveCanvasController setIsScrolling:](self, "setIsScrolling:", 0);
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactiveCanvasControllerDidStopScrolling:", self);

}

- (id)topLevelRepsForHitTesting
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[SXTextTangierInteractiveCanvasController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SXTextTangierInteractiveCanvasController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topLevelRepsForInteractiveCanvasController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SXTextTangierInteractiveCanvasController;
    -[TSDInteractiveCanvasController topLevelRepsForHitTesting](&v8, sel_topLevelRepsForHitTesting);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)i_topLevelLayersForTiling
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[SXTextTangierInteractiveCanvasController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SXTextTangierInteractiveCanvasController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topLevelLayersForInteractiveCanvasController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SXTextTangierInteractiveCanvasController;
    -[TSDInteractiveCanvasController i_topLevelLayersForTiling](&v8, sel_i_topLevelLayersForTiling);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  id v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat width;
  CGFloat height;
  double v21;
  double v22;
  id v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGPoint v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  y = a3.y;
  x = a3.x;
  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[SXTextTangierInteractiveCanvasController topLevelRepsForHitTesting](self, "topLevelRepsForHitTesting", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    v13 = INFINITY;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "storage");
          v16 = (id)objc_claimAutoreleasedReturnValue();

          if (v16 == v7)
          {
            objc_msgSend(v15, "frameInUnscaledCanvas");
            v17 = v33.origin.x;
            v18 = v33.origin.y;
            width = v33.size.width;
            height = v33.size.height;
            v32.x = x;
            v32.y = y;
            if (CGRectContainsPoint(v33, v32))
            {
              v24 = v15;

              v11 = v24;
              goto LABEL_16;
            }
            v34.origin.x = v17;
            v34.origin.y = v18;
            v34.size.width = width;
            v34.size.height = height;
            CGRectGetMidX(v34);
            v35.origin.x = v17;
            v35.origin.y = v18;
            v35.size.width = width;
            v35.size.height = height;
            CGRectGetMidY(v35);
            TSDDistance();
            if (v21 < v13)
            {
              v22 = v21;
              v23 = v15;

              v13 = v22;
              v11 = v23;
            }
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;

  y = a3.y;
  x = a3.x;
  v9 = a5;
  v10 = a4;
  -[TSDInteractiveCanvasController canvas](self, "canvas");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextTangierInteractiveCanvasController topLevelRepsForHitTesting](self, "topLevelRepsForHitTesting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "smallRepOutsetForHitTesting");
  objc_msgSend(v11, "hitRep:inTopLevelReps:smallRepOutset:withGesture:passingTest:", v12, v10, v9, x, y, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)p_currentlyScrolling
{
  char v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXTextTangierInteractiveCanvasController;
  if (-[TSDInteractiveCanvasController p_currentlyScrolling](&v6, sel_p_currentlyScrolling))
    return 1;
  -[SXTextTangierInteractiveCanvasController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "_isAnimatingScrollTest");

  return v3;
}

- (void)endUISession
{
  id v2;

  objc_msgSend(MEMORY[0x24BEB3B30], "sharedHyperlinkUIController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endUISession");

}

- (void)teardown
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierInteractiveCanvasController;
  -[TSWPInteractiveCanvasController teardown](&v3, sel_teardown);
  -[TSDInteractiveCanvasController setDelegate:](self, "setDelegate:", 0);
}

- (UIScrollView)scrollView
{
  return *(UIScrollView **)&self->_forceLayoutAndRenderOnThread;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_forceLayoutAndRenderOnThread, a3);
}

- (SXTextTangierInteractiveCanvasControllerDataSource)dataSource
{
  return (SXTextTangierInteractiveCanvasControllerDataSource *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (BOOL)forceLayoutAndRenderOnThread
{
  return *(&self->super._isTearingDown + 2);
}

- (void)setForceLayoutAndRenderOnThread:(BOOL)a3
{
  *(&self->super._isTearingDown + 2) = a3;
}

- (NSString)selectedText
{
  return (NSString *)self->_dataSource;
}

- (void)setSelectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (BOOL)isScrolling
{
  return *(&self->super._isTearingDown + 3);
}

- (void)setIsScrolling:(BOOL)a3
{
  *(&self->super._isTearingDown + 3) = a3;
}

- (BOOL)mightScrollToTop
{
  return *(&self->super._isTearingDown + 4);
}

- (void)setMightScrollToTop:(BOOL)a3
{
  *(&self->super._isTearingDown + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_forceLayoutAndRenderOnThread, 0);
}

@end
