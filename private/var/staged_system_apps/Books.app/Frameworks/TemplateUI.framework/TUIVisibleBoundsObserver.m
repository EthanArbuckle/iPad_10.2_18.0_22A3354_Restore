@implementation TUIVisibleBoundsObserver

+ (id)newHorizontalWithWindow:(id)a3 layout:(id)a4 offset:(double)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithAxis:window:layout:offset:", 1, v9, v8, a5);

  return v10;
}

+ (id)newVerticalWithWindow:(id)a3 layout:(id)a4 offset:(double)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithAxis:window:layout:offset:", 2, v9, v8, a5);

  return v10;
}

- (TUIVisibleBoundsObserver)initWithAxis:(unint64_t)a3 window:(id)a4 layout:(id)a5 offset:(double)a6
{
  id v11;
  id v12;
  TUIVisibleBoundsObserver *v13;
  char *v14;
  void *v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id WeakRetained;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  BOOL v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double MinX;
  double v41;
  double v42;
  double v43;
  char *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v11 = a4;
  v12 = a5;
  v51.receiver = self;
  v51.super_class = (Class)TUIVisibleBoundsObserver;
  v13 = -[TUIVisibleBoundsObserver init](&v51, "init");
  if (v13)
  {
    v14 = (char *)objc_msgSend(v12, "computedLayoutDirection");
    objc_storeStrong((id *)&v13->_window, a4);
    v13->_axis = a3;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "controller"));
    objc_storeWeak((id *)&v13->_controller, v15);

    v16 = a3 == 1;
    v45 = v14;
    if (v14 != (_BYTE *)&dword_0 + 2)
      v16 = 0;
    v13->_flipped = v16;
    v17 = objc_storeWeak((id *)&v13->_generationHost, v12);
    v13->_generation = (unint64_t)objc_msgSend(v12, "visibleBoundsGeneration");
    v47 = v12;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowLowerLoadTriggerChildBoxFlipped:", v13->_flipped));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowUpperLoadTriggerChildBoxFlipped:", v13->_flipped));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowLowerUnloadTriggerChildBoxFlipped:", v13->_flipped));
    v48 = v11;
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowUpperUnloadTriggerChildBoxFlipped:", v13->_flipped));
    WeakRetained = objc_loadWeakRetained((id *)&v13->_controller);
    v46 = (void *)v18;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layoutForModel:", v18));

    v23 = objc_loadWeakRetained((id *)&v13->_controller);
    v24 = (void *)v19;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layoutForModel:", v19));

    v25 = objc_loadWeakRetained((id *)&v13->_controller);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layoutForModel:", v20));

    v27 = objc_loadWeakRetained((id *)&v13->_controller);
    v28 = (void *)v21;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layoutForModel:", v21));

    if (a3 == 1)
    {
      if (v45 == (_BYTE *)&dword_0 + 1)
      {
        v30 = v49;
        if (v49)
        {
          objc_msgSend(v49, "computedFrame");
          v31 = CGRectGetMinX(v52) + a6;
        }
        else
        {
          v31 = NAN;
        }
        v12 = v47;
        v13->_position.lowerLoad = v31;
        if (v26)
        {
          objc_msgSend(v26, "computedFrame");
          v36 = CGRectGetMaxX(v55) + a6;
        }
        else
        {
          v36 = NAN;
        }
        v33 = v46;
        v11 = v48;
        v13->_position.lowerUnload = v36;
        if (v50)
        {
          objc_msgSend(v50, "computedFrame");
          v38 = CGRectGetMaxX(v57) + a6;
        }
        else
        {
          v38 = NAN;
        }
        v13->_position.upperLoad = v38;
        if (v29)
        {
          objc_msgSend(v29, "computedFrame");
          MinX = CGRectGetMinX(v59);
LABEL_42:
          v43 = MinX + a6;
LABEL_44:
          v13->_position.upperUnload = v43;
          goto LABEL_45;
        }
      }
      else
      {
        v11 = v48;
        v30 = v49;
        v33 = v46;
        v12 = v47;
        if (v45 != (_BYTE *)&dword_0 + 2)
        {
LABEL_45:
          *(_BYTE *)&v13->_triggered &= 0xF0u;

          goto LABEL_46;
        }
        if (v49)
        {
          objc_msgSend(v49, "computedFrame");
          v35 = CGRectGetMaxX(v54) + a6;
        }
        else
        {
          v35 = NAN;
        }
        v13->_position.lowerLoad = v35;
        if (v26)
        {
          objc_msgSend(v26, "computedFrame");
          v41 = CGRectGetMinX(v61) + a6;
        }
        else
        {
          v41 = NAN;
        }
        v13->_position.lowerUnload = v41;
        if (v50)
        {
          objc_msgSend(v50, "computedFrame");
          v42 = CGRectGetMinX(v62) + a6;
        }
        else
        {
          v42 = NAN;
        }
        v13->_position.upperLoad = v42;
        if (v29)
        {
          objc_msgSend(v29, "computedFrame");
          MinX = CGRectGetMaxX(v63);
          goto LABEL_42;
        }
      }
    }
    else
    {
      v32 = a3 == 2;
      v11 = v48;
      v30 = v49;
      v33 = v46;
      v12 = v47;
      if (!v32)
        goto LABEL_45;
      if (v49)
      {
        objc_msgSend(v49, "computedFrame");
        v34 = CGRectGetMinY(v53) + a6;
      }
      else
      {
        v34 = NAN;
      }
      v13->_position.lowerLoad = v34;
      if (v26)
      {
        objc_msgSend(v26, "computedFrame");
        v37 = CGRectGetMaxY(v56) + a6;
      }
      else
      {
        v37 = NAN;
      }
      v13->_position.lowerUnload = v37;
      if (v50)
      {
        objc_msgSend(v50, "computedFrame");
        v39 = CGRectGetMaxY(v58) + a6;
      }
      else
      {
        v39 = NAN;
      }
      v13->_position.upperLoad = v39;
      if (v29)
      {
        objc_msgSend(v29, "computedFrame");
        MinX = CGRectGetMinY(v60);
        goto LABEL_42;
      }
    }
    v43 = NAN;
    goto LABEL_44;
  }
LABEL_46:

  return v13;
}

- (void)visibleBoundsUpdated:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t axis;
  double MinY;
  double MaxY;
  CGRect v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  axis = self->_axis;
  if (axis == 2)
  {
    MinY = CGRectGetMinY(a3);
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    MaxY = CGRectGetMaxY(v12);
  }
  else
  {
    if (axis != 1)
      return;
    MinY = CGRectGetMinX(a3);
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    MaxY = CGRectGetMaxX(v11);
  }
  -[TUIVisibleBoundsObserver _updateVisibleMin:max:](self, "_updateVisibleMin:max:", MinY, MaxY);
}

- (void)_updateVisibleMin:(double)a3 max:(double)a4
{
  double lowerLoad;
  BOOL v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  char triggered;
  char v11;
  char v12;
  char v13;
  char v14;
  id v15;
  id WeakRetained;
  void *v17;
  _QWORD v18[5];
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;

  lowerLoad = self->_position.lowerLoad;
  if (self->_flipped)
  {
    v6 = lowerLoad <= a4 && (*(_BYTE *)&self->_triggered & 1) == 0;
    v7 = self->_position.lowerUnload >= a4 && (*(_BYTE *)&self->_triggered & 2) == 0;
    v8 = self->_position.upperLoad >= a3 && (*(_BYTE *)&self->_triggered & 4) == 0;
    if (self->_position.upperUnload > a3)
    {
LABEL_15:
      v9 = 0;
      goto LABEL_24;
    }
  }
  else
  {
    v6 = lowerLoad >= a3 && (*(_BYTE *)&self->_triggered & 1) == 0;
    v7 = self->_position.lowerUnload <= a3 && (*(_BYTE *)&self->_triggered & 2) == 0;
    v8 = self->_position.upperLoad <= a4 && (*(_BYTE *)&self->_triggered & 4) == 0;
    if (self->_position.upperUnload < a4)
      goto LABEL_15;
  }
  v9 = (*(_BYTE *)&self->_triggered & 8) == 0;
LABEL_24:
  triggered = (char)self->_triggered;
  v11 = triggered & 2;
  if (v7)
    v11 = 2;
  v12 = triggered & 0xF1;
  v13 = triggered & 4;
  if (v8)
    v13 = 4;
  v14 = triggered & 8;
  if (v9)
    v14 = 8;
  *(_BYTE *)&self->_triggered = v12 | v13 | v11 | v14 | v6;
  if (v9 || v6 || v7 || v8)
  {
    v15 = +[TUITransaction noAnimationTransaction](TUITransaction, "noAnimationTransaction");
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "transactionCoordinator"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_6F59C;
    v18[3] = &unk_23F3C8;
    v18[4] = self;
    v19 = v6;
    v20 = v7;
    v21 = v8;
    v22 = v9;
    objc_msgSend(v17, "scheduleLayoutUpdateWithTransaction:block:", v15, v18);

    objc_msgSend(v15, "commit");
  }
}

- (double)lowerLoadPosition
{
  return self->_position.lowerLoad;
}

- (double)lowerUnloadPosition
{
  return self->_position.lowerUnload;
}

- (double)upperLoadPosition
{
  return self->_position.upperLoad;
}

- (double)upperUnloadPosition
{
  return self->_position.upperUnload;
}

- (BOOL)lowerLoadTriggered
{
  return *(_BYTE *)&self->_triggered & 1;
}

- (BOOL)lowerUnloadTriggered
{
  return (*(_BYTE *)&self->_triggered >> 1) & 1;
}

- (BOOL)upperLoadTriggered
{
  return (*(_BYTE *)&self->_triggered >> 2) & 1;
}

- (BOOL)upperUnloadTriggered
{
  return (*(_BYTE *)&self->_triggered >> 3) & 1;
}

- (TUIDynamicArrayWindowing)window
{
  return self->_window;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_generationHost);
  objc_destroyWeak((id *)&self->_controller);
}

@end
