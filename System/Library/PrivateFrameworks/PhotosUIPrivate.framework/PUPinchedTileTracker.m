@implementation PUPinchedTileTracker

- (PUPinchedTileTracker)initWithTilingView:(id)a3
{
  return -[PUPinchedTileTracker initWithPinchGestureRecognizer:tilingView:direction:](self, "initWithPinchGestureRecognizer:tilingView:direction:", 0, a3, 0);
}

- (PUPinchedTileTracker)initWithPinchGestureRecognizer:(id)a3 tilingView:(id)a4 direction:(int64_t)a5
{
  id v10;
  id v11;
  PUPinchedTileTracker *v12;
  PUPinchedTileTracker *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  if (v10)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPinchedTileTracker.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pinchGestureRecognizer != nil"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPinchedTileTracker.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("direction != PUPinchedTileTrackerDirectionUndefined"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)PUPinchedTileTracker;
  v12 = -[PUInteractiveTileTracker initWithTilingView:](&v17, sel_initWithTilingView_, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pinchGestureRecognizer, a3);
    v13->_direction = a5;
  }

  return v13;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  $7E9EB949801A7C79733184D8954CA4C7 *p_delegateFlags;
  objc_super v7;

  v4 = a3;
  -[PUInteractiveTileTracker delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)PUPinchedTileTracker;
    -[PUInteractiveTileTracker setDelegate:](&v7, sel_setDelegate_, v4);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToInitialAspectRatioForTileWithLayoutInfo = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToFinalLayoutInfoForTileWithLayoutInfo = objc_opt_respondsToSelector() & 1;
  }

}

- (void)updateGestureRecognizerTracking
{
  void *v3;
  double v4;
  double v5;
  PUChangeDirectionValueFilter *v6;
  _BOOL8 v7;
  double v8;
  double v9;
  _BOOL8 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUPinchedTileTracker;
  -[PUInteractiveTileTracker updateGestureRecognizerTracking](&v11, sel_updateGestureRecognizerTracking);
  -[PUPinchedTileTracker pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;
  -[PUPinchedTileTracker _pinchGestureRecognizerScaleDirectionValueFilter](self, "_pinchGestureRecognizerScaleDirectionValueFilter");
  v6 = (PUChangeDirectionValueFilter *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(PUChangeDirectionValueFilter);
    -[PUChangeDirectionValueFilter setMinimumChangeValue:](v6, "setMinimumChangeValue:", 0.05);
    -[PUPinchedTileTracker _setPinchGestureRecognizerScaleDirectionValueFilter:](self, "_setPinchGestureRecognizerScaleDirectionValueFilter:", v6);
  }
  -[PUValueFilter setInputValue:](v6, "setInputValue:", v5);
  v7 = (unint64_t)(objc_msgSend(v3, "state") - 3) < 2
    || (unint64_t)objc_msgSend(v3, "numberOfTouches") < 2;
  -[PUInteractiveTileTracker setShouldEnd:](self, "setShouldEnd:", v7);
  -[PUValueFilter outputValue](v6, "outputValue");
  v9 = v8;
  if (-[PUPinchedTileTracker direction](self, "direction") == 1)
    v10 = v9 >= 0.0;
  else
    v10 = v9 <= 0.0;
  -[PUInteractiveTileTracker setShouldFinish:](self, "setShouldFinish:", v10);

}

- (void)startTileControllerTracking
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  PUPinchTracker *v19;
  PUPinchTracker *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  PUPinchTracker *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, __int128 *, double, double, double, double);
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  PUPinchedTileTracker *v39;
  PUPinchTracker *v40;
  __int128 *v41;
  double v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)PUPinchedTileTracker;
  -[PUInteractiveTileTracker startTileControllerTracking](&v50, sel_startTileControllerTracking);
  -[PUInteractiveTileTracker trackedTileController](self, "trackedTileController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUInteractiveTileTracker tilingView](self, "tilingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "freezeTileController:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPinchedTileTracker _setInitialLayoutInfo:](self, "_setInitialLayoutInfo:", v5);
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "size");
  v11 = v10;
  v13 = v12;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  if (v5)
    objc_msgSend(v5, "transform");
  if (self->_delegateFlags.respondsToInitialAspectRatioForTileWithLayoutInfo)
  {
    -[PUInteractiveTileTracker delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pinchedTiledTracker:initialAspectRatioForTileWithLayoutInfo:", self, v5);
    v16 = v15;

    v17 = v16 < 0.0 || ((*(_QWORD *)&v16 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
    if (!v17 || (unint64_t)(*(_QWORD *)&v16 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      if (v16 <= v11 / v13)
        v13 = v11 / v16;
      else
        v11 = v13 * v16;
    }
  }
  v19 = [PUPinchTracker alloc];
  v44 = v47;
  v45 = v48;
  v46 = v49;
  v20 = -[PUPinchTracker initWithInitialCenter:initialSize:initialTransform:](v19, "initWithInitialCenter:initialSize:initialTransform:", &v44, v7, v9, v11, v13);
  if (-[PUPinchedTileTracker direction](self, "direction") == 2)
    -[PUPinchTracker setAllowTrackingOutside:](v20, "setAllowTrackingOutside:", 1);
  +[PUVelocityFilter gestureVelocityFilter](PUVelocityFilter, "gestureVelocityFilter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUVelocityFilter gestureVelocityFilter](PUVelocityFilter, "gestureVelocityFilter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUVelocityFilter gestureVelocityFilter](PUVelocityFilter, "gestureVelocityFilter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v44 = 0;
  *((_QWORD *)&v44 + 1) = &v44;
  *(_QWORD *)&v45 = 0x2020000000;
  BYTE8(v45) = 1;
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke;
  v33 = &unk_1E58A6C48;
  v24 = v5;
  v34 = v24;
  v25 = v3;
  v35 = v25;
  v26 = v21;
  v36 = v26;
  v27 = v22;
  v37 = v27;
  v28 = v23;
  v38 = v28;
  v39 = self;
  v42 = v11;
  v43 = v13;
  v41 = &v44;
  v29 = v20;
  v40 = v29;
  -[PUPinchTracker setUpdateHandler:](v29, "setUpdateHandler:", &v30);
  -[PUPinchedTileTracker _setPinchTracker:](self, "_setPinchTracker:", v29, v30, v31, v32, v33);
  -[PUPinchedTileTracker _setPinchProgress:](self, "_setPinchProgress:", 0.0);
  -[PUPinchedTileTracker _setHorizontalVelocityFilter:](self, "_setHorizontalVelocityFilter:", v26);
  -[PUPinchedTileTracker _setVerticalVelocityFilter:](self, "_setVerticalVelocityFilter:", v27);
  -[PUPinchedTileTracker _setAngularVelocityFilter:](self, "_setAngularVelocityFilter:", v28);

  _Block_object_dispose(&v44, 8);
}

- (void)updateTileControllerTracking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)PUPinchedTileTracker;
  -[PUInteractiveTileTracker updateTileControllerTracking](&v31, sel_updateTileControllerTracking);
  -[PUPinchedTileTracker pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUInteractiveTileTracker tilingView](self, "tilingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPinchedTileTracker _pinchTracker](self, "_pinchTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "locationOfTouch:inView:", 0, v5);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v3, "locationOfTouch:inView:", 1, v5);
    objc_msgSend(v6, "setPinchLocation1:location2:", v8, v10, v11, v12);
  }
  -[PUPinchedTileTracker _pinchProgress](self, "_pinchProgress");
  v14 = fabs(v13);
  if (v14 >= INFINITY && v14 <= INFINITY)
  {
    objc_msgSend(v3, "scale");
    v16 = v15;
    v17 = -[PUPinchedTileTracker direction](self, "direction");
    v13 = v16 + -1.0;
    if (v17 != 1)
      v13 = (1.0 - v16) * 1.5;
  }
  if (v13 < 0.0)
    v13 = 0.0;
  -[PUInteractiveTileTracker setProgress:](self, "setProgress:", fmin(v13, 1.0));
  -[PUPinchedTileTracker _horizontalVelocityFilter](self, "_horizontalVelocityFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "outputValue");
  v20 = v19;

  -[PUPinchedTileTracker _verticalVelocityFilter](self, "_verticalVelocityFilter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "outputValue");
  v23 = v22;

  objc_msgSend(v3, "velocity");
  v25 = v24;
  -[PUPinchedTileTracker _angularVelocityFilter](self, "_angularVelocityFilter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "outputValue");
  v28 = v27;

  PLOneUpGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{x:%0.1f, y:%0.1f, s:%0.3f, r:%0.2f}"), *(_QWORD *)&v20, *(_QWORD *)&v23, *(_QWORD *)&v25, *(_QWORD *)&v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v30;
    _os_log_impl(&dword_1AAB61000, v29, OS_LOG_TYPE_DEBUG, "current pinch velocity: %@", buf, 0xCu);

  }
  -[PUInteractiveTileTracker setCurrentVelocity:](self, "setCurrentVelocity:", v20, v23, v25, v28);

}

- (void)completeTracking
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPinchedTileTracker;
  -[PUInteractiveTileTracker completeTracking](&v5, sel_completeTracking);
  -[PUPinchedTileTracker _pinchTracker](self, "_pinchTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setUpdateHandler:", 0);
    -[PUPinchedTileTracker _setPinchTracker:](self, "_setPinchTracker:", 0);
  }
  -[PUPinchedTileTracker _setPinchGestureRecognizerScaleDirectionValueFilter:](self, "_setPinchGestureRecognizerScaleDirectionValueFilter:", 0);

}

- (void)configureTileReattachmentContext:(id)a3
{
  id v4;
  _BOOL8 v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUPinchedTileTracker;
  -[PUInteractiveTileTracker configureTileReattachmentContext:](&v6, sel_configureTileReattachmentContext_, v4);
  if (-[PUPinchedTileTracker direction](self, "direction") == 1)
  {
    if (-[PUInteractiveTileTracker shouldEnd](self, "shouldEnd"))
      v5 = -[PUInteractiveTileTracker shouldFinish](self, "shouldFinish");
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v4, "setZoomingIn:", v5);

}

- (id)tileControllerToTrack
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v17[8];
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  -[PUPinchedTileTracker pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "numberOfTouches") >= 2)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__75285;
    v23 = __Block_byref_object_dispose__75286;
    v24 = 0;
    -[PUInteractiveTileTracker tilingView](self, "tilingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationInView:", v5);
    v7 = v6;
    v9 = v8;
    objc_msgSend(v3, "locationOfTouch:inView:", 0, v5);
    v11 = v10;
    v13 = v12;
    objc_msgSend(v3, "locationOfTouch:inView:", 1, v5);
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0x7FEFFFFFFFFFFFFFLL;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__PUPinchedTileTracker_tileControllerToTrack__block_invoke;
    v17[3] = &unk_1E58A86A8;
    v17[6] = v7;
    v17[7] = v9;
    v17[4] = v18;
    v17[5] = &v19;
    objc_msgSend(v5, "enumeratePresentedTileControllersInRect:usingBlock:", v17, fmin(v11, v14), fmin(v13, v15), vabdd_f64(v11, v14), vabdd_f64(v13, v15));
    v4 = (id)v20[5];
    _Block_object_dispose(v18, 8);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateTargetLayoutInfoIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUPinchedTileTracker _targetLayoutInfo](self, "_targetLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && self->_delegateFlags.respondsToFinalLayoutInfoForTileWithLayoutInfo)
  {
    -[PUPinchedTileTracker _initialLayoutInfo](self, "_initialLayoutInfo");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PUInteractiveTileTracker delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pinchedTiledTracker:finalLayoutInfoForTileWithLayoutInfo:", self, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPinchedTileTracker _setTargetLayoutInfo:](self, "_setTargetLayoutInfo:", v5);
  }
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (int64_t)direction
{
  return self->_direction;
}

- (PUChangeDirectionValueFilter)_pinchGestureRecognizerScaleDirectionValueFilter
{
  return self->__pinchGestureRecognizerScaleDirectionValueFilter;
}

- (void)_setPinchGestureRecognizerScaleDirectionValueFilter:(id)a3
{
  objc_storeStrong((id *)&self->__pinchGestureRecognizerScaleDirectionValueFilter, a3);
}

- (PUPinchTracker)_pinchTracker
{
  return self->__pinchTracker;
}

- (void)_setPinchTracker:(id)a3
{
  objc_storeStrong((id *)&self->__pinchTracker, a3);
}

- (double)_pinchProgress
{
  return self->__pinchProgress;
}

- (void)_setPinchProgress:(double)a3
{
  self->__pinchProgress = a3;
}

- (PUTileLayoutInfo)_initialLayoutInfo
{
  return self->__initialLayoutInfo;
}

- (void)_setInitialLayoutInfo:(id)a3
{
  objc_storeStrong((id *)&self->__initialLayoutInfo, a3);
}

- (PUTileLayoutInfo)_targetLayoutInfo
{
  return self->__targetLayoutInfo;
}

- (void)_setTargetLayoutInfo:(id)a3
{
  objc_storeStrong((id *)&self->__targetLayoutInfo, a3);
}

- (PUVelocityFilter)_horizontalVelocityFilter
{
  return self->__horizontalVelocityFilter;
}

- (void)_setHorizontalVelocityFilter:(id)a3
{
  objc_storeStrong((id *)&self->__horizontalVelocityFilter, a3);
}

- (PUVelocityFilter)_verticalVelocityFilter
{
  return self->__verticalVelocityFilter;
}

- (void)_setVerticalVelocityFilter:(id)a3
{
  objc_storeStrong((id *)&self->__verticalVelocityFilter, a3);
}

- (PUVelocityFilter)_angularVelocityFilter
{
  return self->__angularVelocityFilter;
}

- (void)_setAngularVelocityFilter:(id)a3
{
  objc_storeStrong((id *)&self->__angularVelocityFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__angularVelocityFilter, 0);
  objc_storeStrong((id *)&self->__verticalVelocityFilter, 0);
  objc_storeStrong((id *)&self->__horizontalVelocityFilter, 0);
  objc_storeStrong((id *)&self->__targetLayoutInfo, 0);
  objc_storeStrong((id *)&self->__initialLayoutInfo, 0);
  objc_storeStrong((id *)&self->__pinchTracker, 0);
  objc_storeStrong((id *)&self->__pinchGestureRecognizerScaleDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
}

void __45__PUPinchedTileTracker_tileControllerToTrack__block_invoke(uint64_t a1, void *a2, void *a3)
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

void __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke(uint64_t a1, __int128 *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  void *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD aBlock[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke_2;
  aBlock[3] = &unk_1E58A6C20;
  v21 = *(id *)(a1 + 32);
  v27 = a3;
  v28 = a4;
  v29 = a5;
  v30 = a6;
  v13 = a2[1];
  v31 = *a2;
  v32 = v13;
  v33 = a2[2];
  v22 = *(id *)(a1 + 40);
  v23 = *(id *)(a1 + 48);
  v24 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 72);
  v25 = v14;
  v26 = v15;
  v34 = *(_OWORD *)(a1 + 96);
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 80), "allowTrackingOutside") & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0DC3F10];
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke_3;
    v18[3] = &unk_1E58ABAC8;
    v19 = v16;
    objc_msgSend(v17, "animateWithDuration:animations:", v18, 0.2);

  }
  else
  {
    v16[2](v16);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;

}

void __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  __int128 v7;
  void *v8;
  __int128 v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v2 = *(void **)(a1 + 32);
  v3 = *(double *)(a1 + 80);
  v4 = *(double *)(a1 + 88);
  v5 = *(double *)(a1 + 96);
  v6 = *(double *)(a1 + 104);
  v7 = *(_OWORD *)(a1 + 128);
  v22 = *(_OWORD *)(a1 + 112);
  v23 = v7;
  v24 = *(_OWORD *)(a1 + 144);
  objc_msgSend(v2, "layoutInfoWithCenter:size:transform:", &v22, v3, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "applyLayoutInfo:", v8);
  objc_msgSend(*(id *)(a1 + 48), "setInputValue:", *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 56), "setInputValue:", *(double *)(a1 + 88));
  v21 = 0.0;
  v9 = *(_OWORD *)(a1 + 128);
  v22 = *(_OWORD *)(a1 + 112);
  v23 = v9;
  v24 = *(_OWORD *)(a1 + 144);
  PUDecomposeTransform((uint64_t)&v22, 0, 0, 0, &v21);
  v10 = MEMORY[0x1AF42A3CC](objc_msgSend(*(id *)(a1 + 64), "setInputValue:", v21));
  objc_msgSend(*(id *)(a1 + 72), "_updateTargetLayoutInfoIfNeeded");
  objc_msgSend(*(id *)(a1 + 72), "_targetLayoutInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "size");
    v14 = v13;
    v16 = v15;
    if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      v20 = *(double *)(a1 + 160);
      v18 = *(double *)(a1 + 96) - v20;
      v19 = v14 - v20;
      goto LABEL_6;
    }
    if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      v17 = *(double *)(a1 + 168);
      v18 = *(double *)(a1 + 104) - v17;
      v19 = v16 - v17;
LABEL_6:
      v10 = v18 / v19;
    }
  }
  objc_msgSend(*(id *)(a1 + 72), "_setPinchProgress:", v10);

}

uint64_t __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
