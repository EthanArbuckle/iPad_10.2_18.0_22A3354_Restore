@implementation CRLiOSDocumentModeEdit

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
  LOBYTE(self) = objc_msgSend(v4, "isMemberOfClass:", v7, v6);

  return (char)self;
}

- (unint64_t)hash
{
  return 5;
}

- (BOOL)cellHoverHighlightShouldBeDisplayed
{
  return 1;
}

- (BOOL)showApplicationToolbarWhenEnteringMode
{
  return 0;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  return 1;
}

- (BOOL)shouldHandleDoubleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  double y;
  double x;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v41;
  CGPoint v42;
  CGRect v43;

  y = a3.y;
  x = a3.x;
  v8 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactiveCanvasController"));

  v11 = objc_msgSend(v10, "documentIsSharedReadOnly");
  v12 = 0;
  if (v8 && (v11 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layerHost"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "asiOSCVC"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pencilKitCanvasViewControllerForCanvasViewController:", v14));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hitRep:", x, y));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "repForSelecting"));

    objc_opt_class(CRLFreehandDrawingRep, v19);
    v21 = sub_100221D0C(v20, v18);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v12 = v22 != 0;
    if (v22)
    {
      v23 = (void *)v22;
      v41 = v18;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "freehandDrawingToolkit"));
      objc_msgSend(v24, "beginDrawingModeIfNeededForTouchType:", a4);

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "freehandDrawingToolkit"));
      objc_msgSend(v25, "setCurrentToolSelection:", 9);

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasView"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "unscaledCoordinateSpace"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasView"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "window"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "coordinateSpace"));
      objc_msgSend(v27, "convertPoint:toCoordinateSpace:", v30, x, y);
      v32 = v31;
      v34 = v33;

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "smartSelectionManager"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "smartSelectionView"));
      objc_msgSend(v36, "frame");
      objc_msgSend(v10, "convertBoundsToUnscaledRect:");
      v42.x = x;
      v42.y = y;
      v37 = CGRectContainsPoint(v43, v42);

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "smartSelectionView"));
      if (v38 && v35 && v37)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "smartSelectionView"));
        objc_msgSend(v35, "handleDoubleTapInputAtUnscaledPoint:inSelectionView:", v39, v32, v34);

      }
      else
      {
        objc_msgSend(v35, "handleDoubleTapInputAtUnscaledPoint:", v32, v34);
      }

      v18 = v41;
    }

  }
  return v12;
}

@end
