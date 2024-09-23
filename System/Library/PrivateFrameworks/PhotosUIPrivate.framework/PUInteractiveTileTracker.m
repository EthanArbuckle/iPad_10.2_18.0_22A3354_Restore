@implementation PUInteractiveTileTracker

- (PUInteractiveTileTracker)init
{
  return -[PUInteractiveTileTracker initWithTilingView:](self, "initWithTilingView:", 0);
}

- (PUInteractiveTileTracker)initWithTilingView:(id)a3
{
  id v6;
  PUInteractiveTileTracker *v7;
  PUInteractiveTileTracker *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUInteractiveTileTracker.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tilingView != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PUInteractiveTileTracker;
  v7 = -[PUInteractiveTileTracker init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_tilingView, a3);
    v8->_shouldFinish = 1;
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToWillStartTrackingTileController = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidStopTrackingTileController = objc_opt_respondsToSelector() & 1;
  }

}

- (void)update
{
  id v3;

  if (-[PUInteractiveTileTracker _state](self, "_state") != 2)
  {
    -[PUInteractiveTileTracker updateGestureRecognizerTracking](self, "updateGestureRecognizerTracking");
    -[PUInteractiveTileTracker _updateTrackedTileController](self, "_updateTrackedTileController");
    -[PUInteractiveTileTracker trackedTileController](self, "trackedTileController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (-[PUInteractiveTileTracker shouldEnd](self, "shouldEnd"))
    {
      if (v3)
      {
        -[PUInteractiveTileTracker stopTileControllerTracking](self, "stopTileControllerTracking");
        -[PUInteractiveTileTracker _setTrackedTileController:](self, "_setTrackedTileController:", 0);
      }
      -[PUInteractiveTileTracker _setState:](self, "_setState:", 2);
      -[PUInteractiveTileTracker completeTracking](self, "completeTracking");
    }
    else
    {
      -[PUInteractiveTileTracker _setState:](self, "_setState:", 1);
      -[PUInteractiveTileTracker updateTileControllerTracking](self, "updateTileControllerTracking");
    }

  }
}

- (void)startTileControllerTracking
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUTileHider *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[PUInteractiveTileTracker trackedTileController](self, "trackedTileController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUInteractiveTileTracker.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileController != nil"));

  }
  -[PUInteractiveTileTracker tilingView](self, "tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detachTileControllers:", v6);

  if (self->_delegateFlags.respondsToWillStartTrackingTileController)
  {
    -[PUInteractiveTileTracker delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interactiveTileTracker:willStartTrackingTileController:", self, v4);

  }
  v8 = -[PUTileHider initWithTilingView:]([PUTileHider alloc], "initWithTilingView:", v5);
  -[PUInteractiveTileTracker _setTileHider:](self, "_setTileHider:", v8);
  objc_msgSend(v4, "presentationLayoutInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUOneUpTilingLayout centerTileKinds](PUOneUpTilingLayout, "centerTileKinds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSourceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileHider hideTilesAtIndexPath:withKinds:dataSourceIdentifier:animated:](v8, "hideTilesAtIndexPath:withKinds:dataSourceIdentifier:animated:", v11, v10, v12, 1);

}

- (void)stopTileControllerTracking
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  PUTileReattachmentContext *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PUInteractiveTileTracker trackedTileController](self, "trackedTileController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUInteractiveTileTracker.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileController != nil"));

  }
  -[PUInteractiveTileTracker currentVelocity](self, "currentVelocity");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  PLOneUpGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{x:%0.1f, y:%0.1f, s:%0.3f, r:%0.2f}"), *(_QWORD *)&v6, *(_QWORD *)&v8, *(_QWORD *)&v10, *(_QWORD *)&v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v14;
    _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEBUG, "final tile velocity: %@", buf, 0xCu);

  }
  v15 = objc_alloc_init(PUTileReattachmentContext);
  -[PUTileReattachmentContext setVelocity:forTileController:](v15, "setVelocity:forTileController:", v4, v6, v8, v10, v12);
  -[PUInteractiveTileTracker configureTileReattachmentContext:](self, "configureTileReattachmentContext:", v15);
  -[PUInteractiveTileTracker tilingView](self, "tilingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reattachTileControllers:withContext:", v17, v15);

  if (self->_delegateFlags.respondsToDidStopTrackingTileController)
  {
    -[PUInteractiveTileTracker delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "interactiveTileTracker:didStopTrackingTileController:", self, v4);

  }
  -[PUInteractiveTileTracker _tileHider](self, "_tileHider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (-[PUInteractiveTileTracker shouldFinish](self, "shouldFinish"))
      objc_msgSend(v19, "reattachTiles");
    else
      objc_msgSend(v19, "unhideTilesAnimated:", 1);
    -[PUInteractiveTileTracker _setTileHider:](self, "_setTileHider:", 0);
  }

}

- (id)tileControllerToTrack
{
  return 0;
}

- (void)_updateTrackedTileController
{
  void *v3;
  id v4;

  -[PUInteractiveTileTracker trackedTileController](self, "trackedTileController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PUInteractiveTileTracker tileControllerToTrack](self, "tileControllerToTrack");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      -[PUInteractiveTileTracker _setTrackedTileController:](self, "_setTrackedTileController:", v3);
      -[PUInteractiveTileTracker startTileControllerTracking](self, "startTileControllerTracking");
      v3 = v4;
    }
  }

}

- (void)_setState:(int64_t)a3
{
  int64_t state;
  void *v8;
  void *v9;
  void *v10;

  state = self->__state;
  if (state != a3)
  {
    if (state)
    {
      if (state == 1 && a3 == 2)
        goto LABEL_8;
    }
    else if ((unint64_t)(a3 - 1) < 2)
    {
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->__state);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUInteractiveTileTracker.m"), 189, CFSTR("invalid state transition %@ -> %@"), v9, v10);

LABEL_8:
    self->__state = a3;
  }
}

- (void)_setTrackedTileController:(id)a3
{
  objc_storeStrong((id *)&self->_trackedTileController, a3);
}

- (PUTilingView)tilingView
{
  return self->_tilingView;
}

- (PUInteractiveTileTrackerDelegate)delegate
{
  return (PUInteractiveTileTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (BOOL)shouldEnd
{
  return self->_shouldEnd;
}

- (void)setShouldEnd:(BOOL)a3
{
  self->_shouldEnd = a3;
}

- (BOOL)shouldFinish
{
  return self->_shouldFinish;
}

- (void)setShouldFinish:(BOOL)a3
{
  self->_shouldFinish = a3;
}

- (PUDisplayVelocity)currentVelocity
{
  double x;
  double y;
  double scale;
  double rotation;
  PUDisplayVelocity result;

  x = self->_currentVelocity.x;
  y = self->_currentVelocity.y;
  scale = self->_currentVelocity.scale;
  rotation = self->_currentVelocity.rotation;
  result.rotation = rotation;
  result.scale = scale;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentVelocity:(PUDisplayVelocity)a3
{
  self->_currentVelocity = a3;
}

- (int64_t)_state
{
  return self->__state;
}

- (PUTileHider)_tileHider
{
  return self->__tileHider;
}

- (void)_setTileHider:(id)a3
{
  objc_storeStrong((id *)&self->__tileHider, a3);
}

- (PUTileController)trackedTileController
{
  return self->_trackedTileController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedTileController, 0);
  objc_storeStrong((id *)&self->__tileHider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tilingView, 0);
}

@end
