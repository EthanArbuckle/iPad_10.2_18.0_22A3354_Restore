@implementation PUSwipedDownTileTracker

- (PUSwipedDownTileTracker)initWithTilingView:(id)a3
{
  return -[PUSwipedDownTileTracker initWithPanGestureRecognizer:tilingView:](self, "initWithPanGestureRecognizer:tilingView:", 0, a3);
}

- (PUSwipedDownTileTracker)initWithPanGestureRecognizer:(id)a3 tilingView:(id)a4
{
  id v8;
  id v9;
  PUSwipedDownTileTracker *v10;
  PUSwipedDownTileTracker *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSwipedDownTileTracker.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("panGestureRecognizer != nil"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PUSwipedDownTileTracker;
  v10 = -[PUInteractiveTileTracker initWithTilingView:](&v14, sel_initWithTilingView_, v9);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_panGestureRecognizer, a3);

  return v11;
}

- (void)updateGestureRecognizerTracking
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PHSwipeDownTracker *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUSwipedDownTileTracker;
  -[PUInteractiveTileTracker updateGestureRecognizerTracking](&v14, sel_updateGestureRecognizerTracking);
  -[PUSwipedDownTileTracker panGestureRecognizer](self, "panGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUInteractiveTileTracker tilingView](self, "tilingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "translationInView:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v3, "velocityInView:", v4);
  v10 = v9;
  v12 = v11;
  -[PUSwipedDownTileTracker _swipeDownTracker](self, "_swipeDownTracker");
  v13 = (PHSwipeDownTracker *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = objc_alloc_init(PHSwipeDownTracker);
    -[PUSwipedDownTileTracker _setSwipeDownTracker:](self, "_setSwipeDownTracker:", v13);
  }
  -[PHSwipeDownTracker trackGestureTranslation:velocity:](v13, "trackGestureTranslation:velocity:", v6, v8, v10, v12);
  -[PUInteractiveTileTracker setShouldEnd:](self, "setShouldEnd:", (unint64_t)(objc_msgSend(v3, "state") - 3) < 2);
  -[PUInteractiveTileTracker setShouldFinish:](self, "setShouldFinish:", -[PHSwipeDownTracker shouldFinishDismissal](v13, "shouldFinishDismissal"));

}

- (void)startTileControllerTracking
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  objc_super v35[3];
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)PUSwipedDownTileTracker;
  -[PUInteractiveTileTracker startTileControllerTracking](&v36, sel_startTileControllerTracking);
  -[PUInteractiveTileTracker trackedTileController](self, "trackedTileController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUInteractiveTileTracker tilingView](self, "tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationLayoutInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tileKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutInfoForTileWithIndexPath:kind:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSwipedDownTileTracker _swipeDownTracker](self, "_swipeDownTracker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSwipedDownTileTracker.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("swipeDownTracker"));

  }
  -[PUSwipedDownTileTracker panGestureRecognizer](self, "panGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "locationInView:", v5);
  v14 = v13;
  v16 = v15;
  if (v10)
  {
    objc_msgSend(v5, "contentCoordinateSystem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinateSystem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v17, v18, v14, v16);
    v16 = v19;

  }
  objc_msgSend(v12, "translationInView:", v5);
  v21 = v20;
  v23 = v22;
  objc_msgSend(v10, "center");
  v33 = v25;
  v34 = v24;
  v26 = *MEMORY[0x1E0C9D538];
  v27 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v10, "size");
  v29 = v28;
  v31 = v30;
  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(v35, 0, sizeof(v35));
  objc_msgSend(v11, "startTrackingCenter:bounds:transform:withInitialGestureLocation:", v35, v34, v33, v26, v27, v29, v31, v14 - v21, v16 - v23);
  -[PUSwipedDownTileTracker _setTrackedTileLayoutInfo:](self, "_setTrackedTileLayoutInfo:", v10);

}

- (void)updateTileControllerTracking
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  void *v34;
  objc_super v35[3];
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)PUSwipedDownTileTracker;
  -[PUInteractiveTileTracker updateTileControllerTracking](&v36, sel_updateTileControllerTracking);
  -[PUSwipedDownTileTracker panGestureRecognizer](self, "panGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUInteractiveTileTracker tilingView](self, "tilingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "translationInView:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v3, "velocityInView:", v4);
  v10 = v9;
  v12 = v11;
  -[PUSwipedDownTileTracker _swipeDownTracker](self, "_swipeDownTracker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackGestureTranslation:velocity:", v6, v8, v10, v12);
  -[PUSwipedDownTileTracker _trackedTileLayoutInfo](self, "_trackedTileLayoutInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackedCenter");
  objc_msgSend(v13, "trackedBounds");
  PXRectWithCenterAndSize();
  objc_msgSend(v4, "px_screenScale");
  PXRectShrinkToPixel();
  v16 = v15;
  v18 = v17;
  PXRectGetCenter();
  v20 = v19;
  v22 = v21;
  if (v13)
    objc_msgSend(v13, "trackedTransform");
  else
    memset(v35, 0, sizeof(v35));
  objc_msgSend(v14, "layoutInfoWithCenter:size:transform:", v35, v20, v22, v16, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUInteractiveTileTracker trackedTileController](self, "trackedTileController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applyLayoutInfo:", v23);

  objc_msgSend(v13, "dismissalProgress");
  -[PUInteractiveTileTracker setProgress:](self, "setProgress:");
  objc_msgSend(v13, "trackedVelocity");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  PLOneUpGetLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{x:%0.1f, y:%0.1f, s:%0.3f, r:%0.2f}"), *(_QWORD *)&v26, *(_QWORD *)&v28, *(_QWORD *)&v30, *(_QWORD *)&v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v34;
    _os_log_impl(&dword_1AAB61000, v33, OS_LOG_TYPE_DEBUG, "current swipe down velocity: %@", buf, 0xCu);

  }
  -[PUInteractiveTileTracker setCurrentVelocity:](self, "setCurrentVelocity:", v26, v28, v30, v32);

}

- (void)completeTracking
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSwipedDownTileTracker;
  -[PUInteractiveTileTracker completeTracking](&v3, sel_completeTracking);
  -[PUSwipedDownTileTracker _setSwipeDownTracker:](self, "_setSwipeDownTracker:", 0);
  -[PUSwipedDownTileTracker _setTrackedTileLayoutInfo:](self, "_setTrackedTileLayoutInfo:", 0);
}

- (id)tileControllerToTrack
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  _QWORD v9[8];
  _QWORD v10[4];
  _QWORD v11[5];
  id v12;

  -[PUSwipedDownTileTracker designatedTileController](self, "designatedTileController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PUSwipedDownTileTracker panGestureRecognizer](self, "panGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__91162;
    v11[4] = __Block_byref_object_dispose__91163;
    v12 = 0;
    -[PUInteractiveTileTracker tilingView](self, "tilingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v10[3] = 0x7FEFFFFFFFFFFFFFLL;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__PUSwipedDownTileTracker_tileControllerToTrack__block_invoke;
    v9[3] = &unk_1E58A86A8;
    *(double *)&v9[6] = v6;
    *(double *)&v9[7] = v7;
    v9[4] = v10;
    v9[5] = v11;
    objc_msgSend(v5, "enumeratePresentedTileControllersInRect:usingBlock:", v9, v6 + -50.0, v7 + -50.0, 100.0, 100.0);
    _Block_object_dispose(v10, 8);

    _Block_object_dispose(v11, 8);
  }
  return v3;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (PUTileController)designatedTileController
{
  return self->_designatedTileController;
}

- (void)setDesignatedTileController:(id)a3
{
  objc_storeStrong((id *)&self->_designatedTileController, a3);
}

- (PHSwipeDownTracker)_swipeDownTracker
{
  return self->__swipeDownTracker;
}

- (void)_setSwipeDownTracker:(id)a3
{
  objc_storeStrong((id *)&self->__swipeDownTracker, a3);
}

- (PUTileLayoutInfo)_trackedTileLayoutInfo
{
  return self->__trackedTileLayoutInfo;
}

- (void)_setTrackedTileLayoutInfo:(id)a3
{
  objc_storeStrong((id *)&self->__trackedTileLayoutInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__trackedTileLayoutInfo, 0);
  objc_storeStrong((id *)&self->__swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_designatedTileController, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
}

void __48__PUSwipedDownTileTracker_tileControllerToTrack__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  v6 = a3;
  objc_msgSend(v6, "tileKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PUTileKindItemContent"));

  if (v8)
  {
    objc_msgSend(v6, "center");
    v11 = hypot(v9 - *(double *)(a1 + 48), v10 - *(double *)(a1 + 56));
    if (v11 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11;
    }
  }

}

@end
