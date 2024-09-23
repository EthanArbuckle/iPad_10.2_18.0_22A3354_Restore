@implementation PXSubjectTrackingView

- (PXSubjectTrackingView)initWithMediaView:(id)a3 cineController:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXSubjectTrackingView *v11;
  PXSubjectTrackingView *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id playbackTimeObserver;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSubjectTrackingView.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaView != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSubjectTrackingView.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cineController != nil"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)PXSubjectTrackingView;
  v11 = -[PXSubjectTrackingView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaView, a3);
    objc_storeStrong((id *)&v12->_cineController, a4);
    -[PXCinematicEditController cinematographyScript](v12->_cineController, "cinematographyScript");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setChangesDelegate:", v12);

    v12->_focusState = 0;
    v12->_viewEnabled = 0;
    v12->_viewCanBeEnabled = 1;
    objc_initWeak(&location, v12);
    objc_msgSend(v8, "player");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__PXSubjectTrackingView_initWithMediaView_cineController___block_invoke;
    v20[3] = &unk_1E5142760;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v14, "addPlaybackTimeObserver:", v20);
    v15 = objc_claimAutoreleasedReturnValue();
    playbackTimeObserver = v12->_playbackTimeObserver;
    v12->_playbackTimeObserver = (id)v15;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)setFocusState:(int64_t)a3 detection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  id v11;

  v6 = a4;
  if ((unint64_t)(a3 - 5) > 0xFFFFFFFFFFFFFFFDLL || self->_focusState != a3)
  {
    v11 = v6;
    self->_focusState = a3;
    -[PXSubjectTrackingView undoManager](self, "undoManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PXSubjectTrackingView badgeVisibleAndWillAutoClose](self, "badgeVisibleAndWillAutoClose")
      && (objc_msgSend(v7, "isUndoing") & 1) == 0
      && (objc_msgSend(v7, "isRedoing") & 1) == 0)
    {
      if ((unint64_t)a3 > 3 || a3 == 2)
      {
        -[PXSubjectTrackingView setFocusStateBadgeVisible:autoHide:](self, "setFocusStateBadgeVisible:autoHide:", 1, 1);
        -[PXSubjectTrackingView delegate](self, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSubjectTrackingView focusStateBadge](self, "focusStateBadge");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "focusDistance");
        objc_msgSend(v8, "subjectFocusStateDidChange:forBadge:focusedDisparity:", a3, v9, v10);

        -[PXSubjectTrackingView setNeedsLayout](self, "setNeedsLayout");
      }
      else
      {
        -[PXSubjectTrackingView setFocusStateBadgeVisible:autoHide:](self, "setFocusStateBadgeVisible:autoHide:", 0, 0);
      }
    }

    v6 = v11;
  }

}

- (void)layoutSubviews
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
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  double v52;
  double v53;
  double v54;
  double v55;
  NSObject *v56;
  void *v57;
  double v58;
  _BOOL4 v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  CMTime v70;
  objc_super v71;
  _BYTE v72[128];
  CMTime time;
  uint64_t v74;
  CGRect v75;
  CGRect v76;

  v74 = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)PXSubjectTrackingView;
  -[PXSubjectTrackingView layoutSubviews](&v71, sel_layoutSubviews);
  -[PXSubjectTrackingView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSubjectTrackingView focusStateBadge](self, "focusStateBadge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectForFocusStateBadge:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PXSubjectTrackingView focusStateBadge](self, "focusStateBadge");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  -[PXSubjectTrackingView cinematographyFrame](self, "cinematographyFrame");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "allDetections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      memset(&v70, 0, sizeof(v70));
      -[PXSubjectTrackingView mediaView](self, "mediaView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "player");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
        objc_msgSend(v19, "currentTime");
      else
        memset(&v70, 0, sizeof(v70));

      time = v70;
      v59 = (v70.flags & 0x1D) == 1;
      -[PXSubjectTrackingView detectionViewCache](self, "detectionViewCache", CMTimeGetSeconds(&time));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      objc_msgSend(v21, "allKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v67;
        v63 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v64 = *MEMORY[0x1E0C9D648];
        v61 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v62 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v65 = *(_QWORD *)v67;
        do
        {
          v26 = 0;
          v60 = v24;
          do
          {
            if (*(_QWORD *)v67 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v26);
            objc_msgSend(v21, "objectForKey:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "detectionForTrackIdentifier:", objc_msgSend(v27, "integerValue"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "frame");
            v31 = v30;
            v33 = v32;
            v35 = v34;
            v37 = v36;
            -[PXSubjectTrackingView frameForDetection:](self, "frameForDetection:", v29);
            v39 = v38;
            v41 = v40;
            v43 = v42;
            v45 = v44;
            if (-[PXSubjectTrackingView _isValidTrackingRect:](self, "_isValidTrackingRect:"))
            {
              if (-[PXSubjectTrackingView _isValidTrackingRect:](self, "_isValidTrackingRect:", v31, v33, v35, v37))
              {
                v46 = v22;
                v47 = v21;
                v48 = v15;
                -[PXSubjectTrackingView mediaView](self, "mediaView");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "player");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = objc_msgSend(v50, "playbackState") == 3 && v59;

                if (v51)
                {
                  -[PXSubjectTrackingView _smoothenFromValue:toNewValue:forTime:tolerance:](self, "_smoothenFromValue:toNewValue:forTime:tolerance:", v31, v39, v58);
                  v39 = v52;
                  -[PXSubjectTrackingView _smoothenFromValue:toNewValue:forTime:tolerance:](self, "_smoothenFromValue:toNewValue:forTime:tolerance:", v33, v41, v58, v45 / 100.0);
                  v41 = v53;
                  -[PXSubjectTrackingView _smoothenFromValue:toNewValue:forTime:tolerance:](self, "_smoothenFromValue:toNewValue:forTime:tolerance:", v35, v43, v58, v43 / 100.0);
                  v43 = v54;
                  -[PXSubjectTrackingView _smoothenFromValue:toNewValue:forTime:tolerance:](self, "_smoothenFromValue:toNewValue:forTime:tolerance:", v37, v45, v58, v45 / 100.0);
                  v45 = v55;
                }
                v15 = v48;
                v21 = v47;
                v22 = v46;
                v24 = v60;
                v25 = v65;
              }
            }
            else
            {
              PLPhotoEditGetLog();
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                v75.origin.x = v39;
                v75.origin.y = v41;
                v75.size.width = v43;
                v75.size.height = v45;
                NSStringFromCGRect(v75);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(time.value) = 138412546;
                *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v57;
                LOWORD(time.flags) = 2112;
                *(_QWORD *)((char *)&time.flags + 2) = v29;
                _os_log_impl(&dword_1A6789000, v56, OS_LOG_TYPE_ERROR, "Invalid tracker view frame %@ detection %@", (uint8_t *)&time, 0x16u);

                v25 = v65;
              }

              v45 = v61;
              v43 = v62;
              v41 = v63;
              v39 = v64;
            }
            objc_msgSend(v28, "setFrame:", v39, v41, v43, v45);
            v76.origin.x = v39;
            v76.origin.y = v41;
            v76.size.width = v43;
            v76.size.height = v45;
            objc_msgSend(v28, "setHidden:", CGRectIsEmpty(v76));

            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
        }
        while (v24);
      }

      if (v59)
        -[PXSubjectTrackingView setLastLayoutTime:](self, "setLastLayoutTime:", v58);

    }
  }

}

- (BOOL)_isValidTrackingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
    return 0;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  if (CGRectIsInfinite(v8))
    return 0;
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return !CGRectIsEmpty(v9);
}

- (double)_smoothenFromValue:(double)a3 toNewValue:(double)a4 forTime:(double)a5 tolerance:(double)a6
{
  double v7;
  double v8;
  double v10;
  double v13;

  v7 = a3;
  v8 = a4 - a3;
  if (v8 < 0.0)
    v8 = -v8;
  if (v8 <= a6)
    return v7;
  -[PXSubjectTrackingView lastLayoutTime](self, "lastLayoutTime");
  if (v10 >= a5 || v10 + 0.1 <= a5)
    return a4;
  v13 = (v10 * -1000.0 + a5 * 1000.0) / -100.0 + 1.0;
  return (1.0 - v13) * a4 + v13 * v7;
}

- (void)setViewEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = self->_viewCanBeEnabled && a3;
  if (self->_viewEnabled != v3)
  {
    if (v3)
    {
      self->_viewEnabled = 1;
      -[PXSubjectTrackingView _playbackTimeDidUpdate](self, "_playbackTimeDidUpdate", a3);
    }
    else
    {
      self->_viewEnabled = 0;
    }
  }
}

- (void)enableUIForCinematographyScriptLoad:(BOOL)a3
{
  self->_viewCanBeEnabled = a3;
  -[PXSubjectTrackingView setViewEnabled:](self, "setViewEnabled:");
}

- (void)framesDidChangeInScript:(id)a3 timeRange:(id *)a4
{
  px_dispatch_on_main_queue();
}

- (void)decisionsDidChangeInScript:(id)a3 timeRange:(id *)a4
{
  px_dispatch_on_main_queue();
}

- (void)renderDidChange:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PXSubjectTrackingView setNeedsLayout](self, "setNeedsLayout");
  if (v3)
    -[PXSubjectTrackingView setFocusStateBadgeVisible:autoHide:](self, "setFocusStateBadgeVisible:autoHide:", 0, 1);
}

- (void)scriptDidUpdate
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  if (-[PXSubjectTrackingView needsUpdateFrameTime](self, "needsUpdateFrameTime"))
  {
    -[PXSubjectTrackingView setNeedsUpdateFrameTime:](self, "setNeedsUpdateFrameTime:", 0);
    -[PXSubjectTrackingView _playbackTimeDidUpdate](self, "_playbackTimeDidUpdate");
  }
  -[PXCinematicEditController cinematographyScript](self->_cineController, "cinematographyScript");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setChangesDelegate:", self);

  v6 = 0uLL;
  v7 = 0;
  -[PXSubjectTrackingView _currentCinematographyTime](self, "_currentCinematographyTime");
  if ((unsigned __int128)0 >> 96)
  {
    v4 = v6;
    v5 = v7;
    -[PXSubjectTrackingView _updateCinematographyFrameWithTime:](self, "_updateCinematographyFrameWithTime:", &v4);
  }
}

- (void)setNeedsUpdateFrame
{
  self->_needsUpdateFrame = 1;
}

- (void)setNeedsUpdateFrameTime
{
  self->_needsUpdateFrameTime = 1;
}

- (void)_playbackTimeDidUpdate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  if (self->_viewEnabled)
  {
    -[PXSubjectTrackingView mediaView](self, "mediaView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "playbackState");

    if ((unint64_t)(v5 - 4) >= 0xFFFFFFFFFFFFFFFELL)
    {
      v20 = 0uLL;
      v21 = 0;
      -[PXSubjectTrackingView mediaView](self, "mediaView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "player");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "currentTime");
      }
      else
      {
        v20 = 0uLL;
        v21 = 0;
      }

      v18 = 0uLL;
      v19 = 0;
      -[PXSubjectTrackingView mediaView](self, "mediaView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "currentSeekTime");
      }
      else
      {
        v18 = 0uLL;
        v19 = 0;
      }

      if ((BYTE12(v18) & 1) != 0)
      {
        v20 = v18;
        v21 = v19;
      }
      -[PXSubjectTrackingView delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v20;
        v15 = v21;
        objc_msgSend(v12, "unadjustedTimeForPlayerTime:", &v14);
      }
      else
      {
        v16 = 0uLL;
        v17 = 0;
      }
      v20 = v16;
      v21 = v17;

      v16 = v20;
      v17 = v21;
      -[PXSubjectTrackingView _updateCinematographyFrameWithTime:](self, "_updateCinematographyFrameWithTime:", &v16);
    }
  }
}

- (void)_updateCinematographyFrameWithTime:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  -[PXSubjectTrackingView cineController](self, "cineController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cinematographyScript");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  objc_msgSend(v6, "frameNearestTime:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSubjectTrackingView setCinematographyFrame:animate:](self, "setCinematographyFrame:animate:", v7, 0);
}

- (void)setCinematographyFrame:(id)a3
{
  -[PXSubjectTrackingView setCinematographyFrame:animate:](self, "setCinematographyFrame:animate:", a3, 0);
}

- (void)setCinematographyFrame:(id)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  char v11;

  v4 = a4;
  v7 = a3;
  v8 = v7;
  if (self->_needsUpdateFrame || (objc_msgSend(v7, "isEqual:", self->_cinematographyFrame) & 1) == 0)
  {
    self->_needsUpdateFrame = 0;
    objc_storeStrong((id *)&self->_cinematographyFrame, a3);
    -[PXSubjectTrackingView setNeedsUpdateViewCache:](self, "setNeedsUpdateViewCache:", 1);
    if (v4)
    {
      if (!-[PXSubjectTrackingView isAnimating](self, "isAnimating"))
      {
        -[PXSubjectTrackingView setNeedsLayout](self, "setNeedsLayout");
        v9[4] = self;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __56__PXSubjectTrackingView_setCinematographyFrame_animate___block_invoke;
        v10[3] = &unk_1E5144398;
        v10[4] = self;
        v11 = 0;
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __56__PXSubjectTrackingView_setCinematographyFrame_animate___block_invoke_2;
        v9[3] = &unk_1E5147360;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v10, v9, 0.2);
      }
    }
    else
    {
      -[PXSubjectTrackingView setNeedsLayout](self, "setNeedsLayout");
      -[PXSubjectTrackingView _updateFocusStateAnimated:](self, "_updateFocusStateAnimated:", 0);
    }
  }

}

- (NSDictionary)detectionViewCache
{
  NSDictionary *detectionViewCache;

  if (-[PXSubjectTrackingView needsUpdateViewCache](self, "needsUpdateViewCache")
    || (detectionViewCache = self->_detectionViewCache) == 0)
  {
    -[PXSubjectTrackingView setNeedsUpdateViewCache:](self, "setNeedsUpdateViewCache:", 0);
    -[PXSubjectTrackingView _updateDetectionViewCache](self, "_updateDetectionViewCache");
    detectionViewCache = self->_detectionViewCache;
  }
  return detectionViewCache;
}

- (void)_updateDetectionViewCache
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSDictionary *detectionViewCache;
  void *v8;
  NSDictionary *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSDictionary *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  uint64_t v33;
  void *v34;
  void *v35;
  double x;
  double y;
  double width;
  double height;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  NSDictionary *v56;
  PXSubjectTrackingView *v57;
  NSDictionary *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v82 = *MEMORY[0x1E0C80C00];
  -[PXSubjectTrackingView cinematographyFrame](self, "cinematographyFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allDetections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      detectionViewCache = self->_detectionViewCache;
      if (detectionViewCache)
      {
        v8 = v4;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v9 = (NSDictionary *)-[NSDictionary mutableCopy](detectionViewCache, "mutableCopy");
        -[NSDictionary allValues](v9, "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v72 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "setHidden:", 1);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
          }
          while (v12);
        }

        v4 = v8;
        v15 = v9;
      }
      else
      {
        v15 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
      v57 = self;
      objc_msgSend(v4, "focusDetection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "allDetections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v59 = v17;
      v60 = v16;
      v62 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
      if (v62)
      {
        v61 = *(_QWORD *)v68;
        v58 = v15;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v68 != v61)
              objc_enumerationMutation(v17);
            v19 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v18);
            if (objc_msgSend(v19, "detectionType") != 100)
            {
              v20 = objc_msgSend(v19, "trackIdentifier");
              v21 = objc_msgSend(v16, "trackIdentifier");
              v22 = objc_msgSend(v19, "groupIdentifier");
              if (PTGroupIDIsValid())
              {
                objc_msgSend(v4, "bestDetectionForGroupIdentifier:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v19, "trackIdentifier");
                v25 = v4;
                v26 = objc_msgSend(v23, "trackIdentifier");
                v27 = objc_msgSend(v60, "groupIdentifier");
                v28 = v24 == v26;
                v4 = v25;
                v16 = v60;
                v29 = v28;
                v30 = v28 && v20 == v21;
                v15 = v58;
                v31 = v22 == v27 ? v30 : v29;

                v17 = v59;
              }
              else
              {
                v31 = 0;
              }
              if (v20 == v21 || v31)
              {
                v33 = objc_msgSend(v19, "trackIdentifier");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDictionary objectForKey:](v15, "objectForKey:", v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v35)
                {
                  -[PXSubjectTrackingView frameForDetection:](v57, "frameForDetection:", v19);
                  x = v83.origin.x;
                  y = v83.origin.y;
                  width = v83.size.width;
                  height = v83.size.height;
                  if (CGRectIsNull(v83))
                    goto LABEL_42;
                  v84.origin.x = x;
                  v84.origin.y = y;
                  v84.size.width = width;
                  v84.size.height = height;
                  if (CGRectIsInfinite(v84)
                    || (v85.origin.x = x,
                        v85.origin.y = y,
                        v85.size.width = width,
                        v85.size.height = height,
                        CGRectIsEmpty(v85)))
                  {
LABEL_42:
                    PLPhotoEditGetLog();
                    v44 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                    {
                      v86.origin.x = x;
                      v86.origin.y = y;
                      v86.size.width = width;
                      v86.size.height = height;
                      NSStringFromCGRect(v86);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v77 = v45;
                      v78 = 2112;
                      v79 = v19;
                      _os_log_impl(&dword_1A6789000, v44, OS_LOG_TYPE_ERROR, "Unable to create new tracker view with frame %@ detection %@", buf, 0x16u);

                    }
                    v35 = 0;
                  }
                  else
                  {
                    -[PXSubjectTrackingView inProgressTrackingView](v57, "inProgressTrackingView");
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (v40
                      && (v41 = (void *)v40,
                          v42 = -[PXSubjectTrackingView inProgressTrackID](v57, "inProgressTrackID"),
                          v41,
                          v33 == v42))
                    {
                      -[PXSubjectTrackingView inProgressTrackingView](v57, "inProgressTrackingView");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSDictionary setObject:forKey:](v15, "setObject:forKey:", v43, v34);
                      -[PXSubjectTrackingView setInProgressTrackingView:](v57, "setInProgressTrackingView:", 0);
                      -[PXSubjectTrackingView setInProgressTrackID:](v57, "setInProgressTrackID:", 0x7FFFFFFFFFFFFFFFLL);

                      v35 = 0;
                    }
                    else
                    {
                      PLPhotoEditGetLog();
                      v46 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v77 = v19;
                        _os_log_impl(&dword_1A6789000, v46, OS_LOG_TYPE_INFO, "Creating new tracker view for detection %@", buf, 0xCu);
                      }

                      -[PXSubjectTrackingView delegate](v57, "delegate");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v35 = (void *)objc_msgSend(v47, "newTrackingViewWithFrame:initialState:", 0, x, y, width, height);

                      if (v35)
                      {
                        -[PXSubjectTrackingView insertSubview:atIndex:](v57, "insertSubview:atIndex:", v35, 0);
                        -[NSDictionary setObject:forKey:](v15, "setObject:forKey:", v35, v34);
                      }
                    }
                    v17 = v59;
                  }
                }
                objc_msgSend(v35, "setHidden:", 0);

              }
            }
            ++v18;
          }
          while (v62 != v18);
          v48 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
          v62 = v48;
        }
        while (v48);
      }
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      -[NSDictionary allKeys](v15, "allKeys");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v64;
        do
        {
          for (j = 0; j != v51; ++j)
          {
            if (*(_QWORD *)v64 != v52)
              objc_enumerationMutation(v49);
            v54 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
            -[NSDictionary objectForKey:](v15, "objectForKey:", v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v55, "isHidden"))
            {
              objc_msgSend(v55, "removeFromSuperview");
              -[NSDictionary removeObjectForKey:](v15, "removeObjectForKey:", v54);
            }

          }
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
        }
        while (v51);
      }

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      v56 = v57->_detectionViewCache;
      v57->_detectionViewCache = v15;

    }
  }

}

- (void)_updateFocusStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v3 = a3;
  -[PXSubjectTrackingView cinematographyFrame](self, "cinematographyFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "allDetections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v23 = 0uLL;
      v24 = 0;
      objc_msgSend(v6, "time");
      -[PXSubjectTrackingView cineController](self, "cineController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cinematographyScript");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v23;
      v22 = v24;
      objc_msgSend(v10, "primaryDecisionAtTime:", &v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trackForIdentifier:", objc_msgSend(v11, "trackIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v23;
      v22 = v24;
      objc_msgSend(v12, "detectionNearestTime:", &v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "detectionType") == 100)
      {
        -[PXSubjectTrackingView setPrimaryKey:](self, "setPrimaryKey:", 0);
        -[PXSubjectTrackingView _updateDetectionViewCache](self, "_updateDetectionViewCache");
      }
      else
      {
        v14 = objc_msgSend(v13, "groupIdentifier");
        if (PTGroupIDIsValid())
        {
          objc_msgSend(v6, "bestDetectionForGroupIdentifier:", v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v15;
        }
        v16 = objc_msgSend(v12, "isDiscrete");
        v17 = objc_msgSend(v11, "isStrongDecision");
        v18 = 1;
        if (v17)
          v18 = 2;
        v19 = 3;
        if (v17)
          v19 = 4;
        if (v16)
          v20 = v18;
        else
          v20 = v19;
        -[PXSubjectTrackingView _setPrimaryDetection:focusState:animated:](self, "_setPrimaryDetection:focusState:animated:", v13, v20, v3);
      }

    }
  }

}

- (void)_setPrimaryDetection:(id)a3 focusState:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a5;
  v8 = a3;
  -[PXSubjectTrackingView setFocusState:detection:](self, "setFocusState:detection:", a4, v8);
  v9 = objc_msgSend(v8, "trackIdentifier");

  -[PXSubjectTrackingView primaryKey](self, "primaryKey");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSubjectTrackingView setPrimaryKey:](self, "setPrimaryKey:", v10);
  if (objc_msgSend(v17, "integerValue") != v9)
  {
    -[PXSubjectTrackingView setNeedsUpdateViewCache:](self, "setNeedsUpdateViewCache:", 1);
    -[PXSubjectTrackingView detectionViewCache](self, "detectionViewCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PXSubjectTrackingView delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "subjectTrackingStateDidChange:forView:animated:", 0, v12, v5);

    }
  }
  -[PXSubjectTrackingView detectionViewCache](self, "detectionViewCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSubjectTrackingView delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subjectTrackingStateDidChange:forView:animated:", a4, v15, v5);

}

- (void)setFocusStateBadgeVisible:(BOOL)a3 autoHide:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29[2];
  id location;
  _QWORD v31[5];

  v4 = a4;
  v5 = a3;
  if (!a3 || !-[PXSubjectTrackingView badgeVisibleAndWillAutoClose](self, "badgeVisibleAndWillAutoClose"))
  {
    -[PXSubjectTrackingView mediaView](self, "mediaView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playbackRate");
    v10 = v9;

    if (v5 && v10 == 0.0)
    {
      -[PXSubjectTrackingView focusStateBadge](self, "focusStateBadge");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[PXSubjectTrackingView delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "newFocusStatusBadge");
        -[PXSubjectTrackingView setFocusStateBadge:](self, "setFocusStateBadge:", v13);

        -[PXSubjectTrackingView focusStateBadge](self, "focusStateBadge");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAlpha:", 0.0);

        -[PXSubjectTrackingView focusStateBadge](self, "focusStateBadge");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSubjectTrackingView addSubview:](self, "addSubview:", v15);

      }
      -[PXSubjectTrackingView focusStateBadge](self, "focusStateBadge");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSubjectTrackingView bringSubviewToFront:](self, "bringSubviewToFront:", v16);

      v17 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke;
      v31[3] = &unk_1E5149198;
      v31[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v31, 0.3);
      -[PXSubjectTrackingView hideFocusStateBadgeTimer](self, "hideFocusStateBadgeTimer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "invalidate");

      if (v4)
      {
        -[PXSubjectTrackingView setBadgeVisibleAndWillAutoClose:](self, "setBadgeVisibleAndWillAutoClose:", 1);
        objc_initWeak(&location, self);
        v19 = (void *)MEMORY[0x1E0C99E88];
        v28[0] = v17;
        v28[1] = 3221225472;
        v28[2] = __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_2;
        v28[3] = &unk_1E5135518;
        v29[1] = (id)0x3FD3333333333333;
        objc_copyWeak(v29, &location);
        v28[4] = self;
        objc_msgSend(v19, "scheduledTimerWithTimeInterval:repeats:block:", 0, v28, 1.3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSubjectTrackingView setHideFocusStateBadgeTimer:](self, "setHideFocusStateBadgeTimer:", v20);

        objc_destroyWeak(v29);
        objc_destroyWeak(&location);
      }
      else
      {
        -[PXSubjectTrackingView setBadgeVisibleAndWillAutoClose:](self, "setBadgeVisibleAndWillAutoClose:", 0);
      }
    }
    else
    {
      -[PXSubjectTrackingView hideFocusStateBadgeTimer](self, "hideFocusStateBadgeTimer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isValid");

      if (v22)
      {
        -[PXSubjectTrackingView hideFocusStateBadgeTimer](self, "hideFocusStateBadgeTimer");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "fire");

      }
      else
      {
        -[PXSubjectTrackingView focusStateBadge](self, "focusStateBadge");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "alpha");
        v25 = v24;

        if (v25 > 0.0)
        {
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_4;
          v27[3] = &unk_1E5149198;
          v27[4] = self;
          objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v27, 0.3);
        }
      }
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentCinematographyTime
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v17;
  int64_t var3;
  __int128 v19;
  int64_t v20;
  __int128 v21;
  int64_t v22;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  -[PXSubjectTrackingView cinematographyFrame](self, "cinematographyFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXSubjectTrackingView cinematographyFrame](self, "cinematographyFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "time");
    }
    else
    {
      v21 = 0uLL;
      v22 = 0;
    }
    *(_OWORD *)&retstr->var0 = v21;
    v11 = v22;
  }
  else
  {
    -[PXSubjectTrackingView mediaView](self, "mediaView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "currentTime");
    }
    else
    {
      v21 = 0uLL;
      v22 = 0;
    }
    *(_OWORD *)&retstr->var0 = v21;
    retstr->var3 = v22;

    v21 = 0uLL;
    v22 = 0;
    -[PXSubjectTrackingView mediaView](self, "mediaView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "currentSeekTime");
    }
    else
    {
      v21 = 0uLL;
      v22 = 0;
    }

    if ((BYTE12(v21) & 1) != 0)
    {
      *(_OWORD *)&retstr->var0 = v21;
      retstr->var3 = v22;
    }
    -[PXSubjectTrackingView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v15)
    {
      v17 = *(_OWORD *)&retstr->var0;
      var3 = retstr->var3;
      objc_msgSend(v15, "unadjustedTimeForPlayerTime:", &v17);
    }
    else
    {
      v19 = 0uLL;
      v20 = 0;
    }
    *(_OWORD *)&retstr->var0 = v19;
    v11 = v20;
  }
  retstr->var3 = v11;

  return result;
}

- (CGRect)viewFrameForNormalizedRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXSubjectTrackingView layoutDelegate](self, "layoutDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PXSubjectTrackingView layoutDelegate](self, "layoutDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewRectForNormalizedRect:", x, y, width, height);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

  }
  else
  {
    PXRectFlippedVertically();
    -[NUMediaView convertNormalizedViewRect:fromSpace:](self->_mediaView, "convertNormalizedViewRect:fromSpace:", CFSTR("/masterSpace"));
    -[NUMediaView convertRectFromImage:](self->_mediaView, "convertRectFromImage:");
    -[PXSubjectTrackingView convertRect:fromView:](self, "convertRect:fromView:", self->_mediaView);
    v11 = v18;
    v13 = v19;
    v15 = v20;
    v17 = v21;
  }
  v22 = v11;
  v23 = v13;
  v24 = v15;
  v25 = v17;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGPoint)viewPointForNormalizedPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[PXSubjectTrackingView layoutDelegate](self, "layoutDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXSubjectTrackingView layoutDelegate](self, "layoutDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewPointForNormalizedPoint:", x, y);
  }
  else
  {
    -[NUMediaView _masterSizeWithoutGeometry](self->_mediaView, "_masterSizeWithoutGeometry");
    +[PXSubjectTrackingView denormalizePoint:masterSize:flipYCoordinate:](PXSubjectTrackingView, "denormalizePoint:masterSize:flipYCoordinate:", 1, x, y, v10, v11);
    v13 = v12;
    v15 = v14;
    -[PXSubjectTrackingView mediaView](self, "mediaView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertPoint:fromSpace:toView:", CFSTR("/masterSpace"), self, v13, v15);
  }
  v16 = v8;
  v17 = v9;

  v18 = v16;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGRect)frameForDetection:(id)a3
{
  id v4;
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
  void *v15;
  char isKindOfClass;
  double v17;
  double v18;
  double MidX;
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
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "rect");
  -[PXSubjectTrackingView viewFrameForNormalizedRect:](self, "viewFrameForNormalizedRect:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PXSubjectTrackingView cineController](self, "cineController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cinematographyScript");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trackForIdentifier:", objc_msgSend(v4, "trackIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v17 = 0.0;
  v18 = 0.0;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "rect");
    MidX = CGRectGetMidX(v34);
    objc_msgSend(v4, "rect");
    -[PXSubjectTrackingView viewPointForNormalizedPoint:](self, "viewPointForNormalizedPoint:", MidX, CGRectGetMidY(v35));
    v17 = v20;
    v18 = v21;
  }
  -[PXSubjectTrackingView _reframeWithinVideo:isFixedFocus:fixedFocusCenter:](self, "_reframeWithinVideo:isFixedFocus:fixedFocusCenter:", isKindOfClass & 1, v6, v8, v10, v12, v17, v18);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = v23;
  v31 = v25;
  v32 = v27;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGRect)_reframeWithinVideo:(CGRect)a3 isFixedFocus:(BOOL)a4 fixedFocusCenter:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  _BOOL4 v7;
  double height;
  double width;
  double v10;
  double v11;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MidX;
  double MidY;
  double v36;
  double v37;
  _BOOL4 v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double MinX;
  double v49;
  double MinY;
  double v51;
  double v52;
  double v53;
  CGFloat rect;
  CGFloat v55;
  CGFloat v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect result;
  CGRect v71;
  CGRect v72;

  y = a5.y;
  x = a5.x;
  v7 = a4;
  height = a3.size.height;
  width = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (CGRectIsEmpty(a3))
    goto LABEL_14;
  -[PXSubjectTrackingView layoutDelegate](self, "layoutDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = x;
  v53 = y;
  if (v13)
  {
    -[PXSubjectTrackingView layoutDelegate](self, "layoutDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "videoFrame");
    v16 = v15;
    v55 = v18;
    v56 = v17;
    rect = v19;
  }
  else
  {
    -[PXSubjectTrackingView mediaView](self, "mediaView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageFrame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    -[PXSubjectTrackingView mediaView](self, "mediaView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSubjectTrackingView convertRect:fromView:](self, "convertRect:fromView:", v29, v22, v24, v26, v28);
    v16 = v30;
    v55 = v32;
    v56 = v31;
    rect = v33;

  }
  v57.origin.x = v11;
  v57.origin.y = v10;
  v57.size.width = width;
  v57.size.height = height;
  MidX = CGRectGetMidX(v57);
  v58.origin.x = v11;
  v58.origin.y = v10;
  v58.size.width = width;
  v58.size.height = height;
  MidY = CGRectGetMidY(v58);
  v36 = v7 ? v53 : MidY;
  v37 = v7 ? v52 : MidX;
  v59.origin.x = v16;
  v59.size.width = v55;
  v59.origin.y = v56;
  v59.size.height = rect;
  if (!CGRectContainsPoint(v59, *(CGPoint *)(&v36 - 1)))
  {
LABEL_14:
    v11 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_15;
  }
  if (v7)
  {
    v11 = v52 + -37.5;
    v10 = v53 + -37.5;
    v38 = 1;
    width = 75.0;
    v39 = 1;
    height = 75.0;
  }
  else
  {
    v38 = width < 50.0;
    if (width < 50.0)
    {
      v60.origin.x = v11;
      v60.origin.y = v10;
      v60.size.width = width;
      v60.size.height = height;
      v11 = CGRectGetMidX(v60) + -25.0;
      width = 50.0;
    }
    if (height >= 50.0)
    {
      v39 = 0;
    }
    else
    {
      v61.origin.x = v11;
      v61.origin.y = v10;
      v61.size.width = width;
      v61.size.height = height;
      v10 = CGRectGetMidY(v61) + -25.0;
      v39 = 1;
      height = 50.0;
    }
  }
  v62.origin.x = v16;
  v62.origin.y = v56;
  v62.size.width = v55;
  v62.size.height = rect;
  v63 = CGRectInset(v62, width * 0.05 + 3.0, height * 0.05 + 3.0);
  v44 = v63.origin.x;
  v45 = v63.origin.y;
  v46 = v63.size.width;
  v47 = v63.size.height;
  if (v38)
  {
    MinX = CGRectGetMinX(v63);
    if (v11 < MinX)
      v11 = MinX;
    v64.origin.x = v44;
    v64.origin.y = v45;
    v64.size.width = v46;
    v64.size.height = v47;
    v49 = CGRectGetMaxX(v64) - width;
    if (v11 >= v49)
      v11 = v49;
    if (!v39)
    {
LABEL_23:
      if (v7)
        goto LABEL_15;
      goto LABEL_35;
    }
  }
  else if (!v39)
  {
    goto LABEL_23;
  }
  v65.origin.x = v44;
  v65.origin.y = v45;
  v65.size.width = v46;
  v65.size.height = v47;
  MinY = CGRectGetMinY(v65);
  if (v10 < MinY)
    v10 = MinY;
  v66.origin.x = v44;
  v66.origin.y = v45;
  v66.size.width = v46;
  v66.size.height = v47;
  v51 = CGRectGetMaxY(v66) - height;
  if (v10 >= v51)
    v10 = v51;
  if (!v7)
  {
LABEL_35:
    v67.origin.x = v44;
    v67.origin.y = v45;
    v67.size.width = v46;
    v67.size.height = v47;
    v71.origin.x = v11;
    v71.origin.y = v10;
    v71.size.width = width;
    v71.size.height = height;
    if (!CGRectContainsRect(v67, v71))
    {
      v68.origin.x = v44;
      v68.origin.y = v45;
      v68.size.width = v46;
      v68.size.height = v47;
      v72.origin.x = v11;
      v72.origin.y = v10;
      v72.size.width = width;
      v72.size.height = height;
      v69 = CGRectIntersection(v68, v72);
      v11 = v69.origin.x;
      v10 = v69.origin.y;
      width = v69.size.width;
      height = v69.size.height;
    }
  }
LABEL_15:
  v40 = v11;
  v41 = v10;
  v42 = width;
  v43 = height;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (CGPoint)normalizedPointForViewPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[PXSubjectTrackingView layoutDelegate](self, "layoutDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXSubjectTrackingView layoutDelegate](self, "layoutDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "normalizedPoint:fromView:", self, x, y);
  }
  else
  {
    -[PXSubjectTrackingView mediaView](self, "mediaView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertPoint:toNormalizedYDownSourceSpaceFromView:", v7, x, y);
  }
  v10 = v8;
  v11 = v9;

  v12 = v10;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)_hitDetectionAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  y = a3.y;
  x = a3.x;
  v28 = *MEMORY[0x1E0C80C00];
  -[PXSubjectTrackingView cinematographyFrame](self, "cinematographyFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "allDetections", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v24;
    v12 = INFINITY;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v14, "detectionType") != 100)
        {
          -[PXSubjectTrackingView frameForDetection:](self, "frameForDetection:", v14);
          v15 = v30.origin.x;
          v16 = v30.origin.y;
          width = v30.size.width;
          height = v30.size.height;
          v29.x = x;
          v29.y = y;
          if (CGRectContainsPoint(v30, v29))
          {
            v31.origin.x = v15;
            v31.origin.y = v16;
            v31.size.width = width;
            v31.size.height = height;
            v19 = CGRectGetWidth(v31);
            v32.origin.x = v15;
            v32.origin.y = v16;
            v32.size.width = width;
            v32.size.height = height;
            v20 = v19 * CGRectGetHeight(v32);
            if (v20 < v12)
            {
              v21 = v14;

              v12 = v20;
              v10 = v21;
            }
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)handleSingleSelectOnPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  _BYTE v23[24];
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[24];

  y = a3.y;
  x = a3.x;
  -[PXSubjectTrackingView cineController](self, "cineController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cinematographyScript");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSubjectTrackingView _hitDetectionAtPoint:](self, "_hitDetectionAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "time");
    objc_msgSend(v7, "primaryDecisionAtTime:", v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupIdentifier");
    v11 = PTGroupIDIsValid();
    objc_msgSend(v9, "groupIdentifier");
    v12 = PTGroupIDIsValid();
    v13 = 0;
    if (v11 && v12)
    {
      v14 = objc_msgSend(v10, "groupIdentifier");
      v13 = v14 == objc_msgSend(v9, "groupIdentifier");
    }
    v15 = objc_msgSend(v10, "trackIdentifier");
    v16 = objc_msgSend(v9, "trackIdentifier");
    if (v13 || v15 == v16)
    {
      v17 = objc_msgSend(v10, "isStrongDecision");
      v26 = 0uLL;
      v27 = 0;
      if (v10)
        objc_msgSend(v10, "time");
      v24 = v26;
      v25 = v27;
      objc_msgSend(v7, "frameNearestTime:", &v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "focusDetection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "trackIdentifier");
      v21 = v20 == objc_msgSend(v9, "trackIdentifier") || v13;
      if (v21 == 1)
      {
        -[PXSubjectTrackingView _currentCinematographyTime](self, "_currentCinematographyTime");
        -[PXSubjectTrackingView focusOnDetection:atTime:strong:](self, "focusOnDetection:atTime:strong:", v9, v23, v17 ^ 1u);
      }

    }
    else
    {
      -[PXSubjectTrackingView _currentCinematographyTime](self, "_currentCinematographyTime");
      -[PXSubjectTrackingView focusOnDetection:atTime:strong:](self, "focusOnDetection:atTime:strong:", v9, &v22, 0);
    }

  }
  else
  {
    -[PXSubjectTrackingView _trackAndFocusObjectAtPoint:strong:](self, "_trackAndFocusObjectAtPoint:strong:", 0, x, y);
  }

}

- (void)handleDoubleSelectOnPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BYTE v10[24];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;
  CGPoint v14;

  y = a3.y;
  x = a3.x;
  v13 = *MEMORY[0x1E0C80C00];
  -[PXSubjectTrackingView _hitDetectionAtPoint:](self, "_hitDetectionAtPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "time");
    -[PXSubjectTrackingView focusOnDetection:atTime:strong:](self, "focusOnDetection:atTime:strong:", v7, v10, 1);
  }
  else
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14.x = x;
      v14.y = y;
      NSStringFromCGPoint(v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_INFO, "handleDoubleSelectOnPoint: No detection at %@", buf, 0xCu);

    }
  }

}

- (void)handleLongSelectOnPoint:(CGPoint)a3
{
  -[PXSubjectTrackingView _focusOnFixedLocationAtPoint:strong:](self, "_focusOnFixedLocationAtPoint:strong:", 1, a3.x, a3.y);
}

- (void)handleInteractionBegan
{
  id v2;

  -[PXSubjectTrackingView delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactionBegan");

}

- (BOOL)focusOnTrack:(id)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v5 = a5;
  v8 = objc_msgSend(a3, "trackIdentifier");
  v10 = *a4;
  return -[PXSubjectTrackingView _focusOnTrackWithID:atTime:strong:](self, "_focusOnTrackWithID:atTime:strong:", v8, &v10, v5);
}

- (BOOL)_focusOnTrackWithID:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  -[PXSubjectTrackingView cineController](self, "cineController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cinematographyScript");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *a4;
  v11 = objc_msgSend(v10, "focusOnTrackIdentifier:atTime:strong:", a3, &v17, v5);

  PLPhotoEditGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("weak");
      if (v5)
        v14 = CFSTR("strong");
      LODWORD(v17.var0) = 138412546;
      *(int64_t *)((char *)&v17.var0 + 4) = (int64_t)v14;
      LOWORD(v17.var2) = 2048;
      *(_QWORD *)((char *)&v17.var2 + 2) = a3;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_INFO, "Engine successfully placed %@ focus on track with ID %ld", (uint8_t *)&v17, 0x16u);
    }

    -[PXSubjectTrackingView delegate](self, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    v17 = *a4;
    -[NSObject trackingWasEditedAtTime:](v13, "trackingWasEditedAtTime:", &v17);
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v15 = CFSTR("weak");
    if (v5)
      v15 = CFSTR("strong");
    LODWORD(v17.var0) = 138412546;
    *(int64_t *)((char *)&v17.var0 + 4) = (int64_t)v15;
    LOWORD(v17.var2) = 2048;
    *(_QWORD *)((char *)&v17.var2 + 2) = a3;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Engine failed to place %@ focus on track with ID %ld", (uint8_t *)&v17, 0x16u);
  }

  return v11;
}

- (BOOL)_focusOnGroup:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  -[PXSubjectTrackingView cineController](self, "cineController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cinematographyScript");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *a4;
  v11 = objc_msgSend(v10, "focusOnGroupIdentifier:atTime:strong:", a3, &v17, v5);

  PLPhotoEditGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("weak");
      if (v5)
        v14 = CFSTR("strong");
      LODWORD(v17.var0) = 138412546;
      *(int64_t *)((char *)&v17.var0 + 4) = (int64_t)v14;
      LOWORD(v17.var2) = 2048;
      *(_QWORD *)((char *)&v17.var2 + 2) = a3;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_INFO, "Engine successfully placed %@ focus on group with ID %ld", (uint8_t *)&v17, 0x16u);
    }

    -[PXSubjectTrackingView delegate](self, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    v17 = *a4;
    -[NSObject trackingWasEditedAtTime:](v13, "trackingWasEditedAtTime:", &v17);
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v15 = CFSTR("weak");
    if (v5)
      v15 = CFSTR("strong");
    LODWORD(v17.var0) = 138412546;
    *(int64_t *)((char *)&v17.var0 + 4) = (int64_t)v15;
    LOWORD(v17.var2) = 2048;
    *(_QWORD *)((char *)&v17.var2 + 2) = a3;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Engine failed to place %@ focus on group with ID %ld", (uint8_t *)&v17, 0x16u);
  }

  return v11;
}

- (BOOL)focusOnDetection:(id)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  uint64_t v11;
  __int128 v12;
  int64_t var3;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "groupIdentifier");
  if (PTGroupIDIsValid())
  {
    v9 = objc_msgSend(v8, "groupIdentifier");

    v12 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    return -[PXSubjectTrackingView _focusOnGroup:atTime:strong:](self, "_focusOnGroup:atTime:strong:", v9, &v12, v5);
  }
  else
  {
    v11 = objc_msgSend(v8, "trackIdentifier");

    v12 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    return -[PXSubjectTrackingView _focusOnTrackWithID:atTime:strong:](self, "_focusOnTrackWithID:atTime:strong:", v11, &v12, v5);
  }
}

- (void)_newTrackWasAddedAndFocusedAtTime:(id *)a3
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  -[PXSubjectTrackingView setNeedsUpdateViewCache:](self, "setNeedsUpdateViewCache:", 1);
  -[PXSubjectTrackingView _updateFocusStateAnimated:](self, "_updateFocusStateAnimated:", 1);
  -[PXSubjectTrackingView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  objc_msgSend(v5, "trackingWasEditedAtTime:", &v6);

}

- (BOOL)_focusOnFixedLocationAtDetection:(id)a3 strong:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  const char *v10;
  BOOL v11;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v4 = a4;
  v15 = 0uLL;
  v16 = 0;
  v6 = a3;
  -[PXSubjectTrackingView _currentCinematographyTime](self, "_currentCinematographyTime");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F538]), "initWithDetection:", v6);

  v13 = v15;
  v14 = v16;
  v8 = -[PXSubjectTrackingView addFocusTrack:atTime:strong:](self, "addFocusTrack:atTime:strong:", v7, &v13, v4);
  if (v8 == 2)
  {
    PLPhotoEditGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      v10 = "Tap-to-track error: couldn't focus on track";
      goto LABEL_7;
    }
  }
  else
  {
    if (v8 != 1)
    {
      v13 = v15;
      v14 = v16;
      -[PXSubjectTrackingView _newTrackWasAddedAndFocusedAtTime:](self, "_newTrackWasAddedAndFocusedAtTime:", &v13);
      v11 = 1;
      goto LABEL_10;
    }
    PLPhotoEditGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      v10 = "Fixed-focus error: couldn't add track";
LABEL_7:
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 2u);
    }
  }

  v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)_focusOnFixedLocationAtPoint:(CGPoint)a3 strong:(BOOL)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v21[4];
  id v22[3];
  int64x2_t v23;
  __int128 v24;
  uint64_t v25;
  BOOL v26;
  __int128 v27;
  uint64_t v28;
  id location;
  __int128 v30;
  uint64_t v31;

  y = a3.y;
  x = a3.x;
  -[PXSubjectTrackingView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0uLL;
  v31 = 0;
  -[PXSubjectTrackingView _currentCinematographyTime](self, "_currentCinematographyTime");
  -[PXSubjectTrackingView normalizedPointForViewPoint:](self, "normalizedPointForViewPoint:", x, y);
  v11 = v10;
  v13 = v12;
  objc_initWeak(&location, self);
  v14 = objc_alloc(MEMORY[0x1E0D711C0]);
  v15 = v11 + -0.05;
  v16 = v13 + -0.05;
  v27 = v30;
  v28 = v31;
  v17 = (void *)objc_msgSend(v14, "initWithComposition:time:sampleRect:", v9, &v27, v15, v16, 0.1, 0.1);
  v18 = MEMORY[0x1E0C80D38];
  v19 = MEMORY[0x1E0C80D38];
  objc_msgSend(v17, "setResponseQueue:", v18);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__PXSubjectTrackingView__focusOnFixedLocationAtPoint_strong___block_invoke;
  v21[3] = &unk_1E5135540;
  objc_copyWeak(v22, &location);
  v25 = v31;
  v22[1] = *(id *)&v15;
  v22[2] = *(id *)&v16;
  v23 = vdupq_n_s64(0x3FB999999999999AuLL);
  v24 = v30;
  v26 = a4;
  objc_msgSend(v17, "submit:", v21);
  objc_destroyWeak(v22);

  objc_destroyWeak(&location);
  return 1;
}

- (void)_disparitySampleFinishedWithResponse:(id)a3 time:(id *)a4 rect:(CGRect)a5 strong:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  void *v12;
  id v13;
  int v14;
  int v15;
  id v16;
  double v17;
  NSObject *v18;
  void *v19;
  int64_t v20;
  NSObject *v21;
  const char *v22;
  __int128 v23;
  uint64_t v24;
  id v25;
  uint8_t buf[16];
  uint64_t v27;
  uint64_t v28;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v28 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  objc_msgSend(a3, "result:", &v25, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;
  if (v12)
  {
    objc_msgSend(v12, "sampledDisparityValue");
    v15 = v14;
    v16 = objc_alloc(MEMORY[0x1E0D7F530]);
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E10];
    v27 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
    LODWORD(v17) = v15;
    v18 = objc_msgSend(v16, "initWithTime:rect:focusDistance:", buf, x, y, width, height, v17);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F538]), "initWithDetection:", v18);
    memset(buf, 0, sizeof(buf));
    v27 = 0;
    -[PXSubjectTrackingView _currentCinematographyTime](self, "_currentCinematographyTime");
    v23 = *(_OWORD *)buf;
    v24 = v27;
    v20 = -[PXSubjectTrackingView addFocusTrack:atTime:strong:](self, "addFocusTrack:atTime:strong:", v19, &v23, v6);
    if (v20 == 2)
    {
      PLPhotoEditGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v23) = 0;
        v22 = "Tap-to-track error: couldn't focus on track";
        goto LABEL_10;
      }
    }
    else
    {
      if (v20 != 1)
      {
        v23 = *(_OWORD *)buf;
        v24 = v27;
        -[PXSubjectTrackingView _newTrackWasAddedAndFocusedAtTime:](self, "_newTrackWasAddedAndFocusedAtTime:", &v23);
        goto LABEL_13;
      }
      PLPhotoEditGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v23) = 0;
        v22 = "Fixed-focus error: couldn't add track";
LABEL_10:
        _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v23, 2u);
      }
    }

LABEL_13:
    goto LABEL_14;
  }
  PLPhotoEditGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "Fixed-focus error: disparity sampling failed with error %@", buf, 0xCu);
  }
LABEL_14:

}

- (void)_trackAndFocusObjectAtPoint:(CGPoint)a3 strong:(BOOL)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20[3];
  __int128 v21;
  uint64_t v22;
  BOOL v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  uint64_t v27;
  id location;
  __int128 v29;
  uint64_t v30;

  y = a3.y;
  x = a3.x;
  -[PXSubjectTrackingView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0uLL;
  v30 = 0;
  -[PXSubjectTrackingView _currentCinematographyTime](self, "_currentCinematographyTime");
  -[PXSubjectTrackingView normalizedPointForViewPoint:](self, "normalizedPointForViewPoint:", x, y);
  v11 = v10;
  v13 = v12;
  objc_initWeak(&location, self);
  v26 = v29;
  v27 = v30;
  -[PXSubjectTrackingView _objectTrackingStartedAtTime:](self, "_objectTrackingStartedAtTime:", &v26);
  v14 = objc_alloc(MEMORY[0x1E0D712C8]);
  v26 = v29;
  v27 = v30;
  v15 = (void *)objc_msgSend(v14, "initWithComposition:startTime:pointToTrack:", v9, &v26, v11, v13);
  v16 = MEMORY[0x1E0C80D38];
  v17 = MEMORY[0x1E0C80D38];
  objc_msgSend(v15, "setResponseQueue:", v16);

  v18 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__PXSubjectTrackingView__trackAndFocusObjectAtPoint_strong___block_invoke;
  v24[3] = &unk_1E5135568;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v15, "setProgressHandler:", v24);
  v19[0] = v18;
  v19[1] = 3221225472;
  v19[2] = __60__PXSubjectTrackingView__trackAndFocusObjectAtPoint_strong___block_invoke_2;
  v19[3] = &unk_1E5135590;
  objc_copyWeak(v20, &location);
  v20[1] = *(id *)&x;
  v20[2] = *(id *)&y;
  v21 = v29;
  v22 = v30;
  v23 = a4;
  objc_msgSend(v15, "submit:", v19);
  objc_destroyWeak(v20);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&location);
}

- (void)_objectTrackingStartedAtTime:(id *)a3
{
  NSObject *v5;
  __CFString *v6;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = *a3;
    v6 = (__CFString *)CMTimeCopyDescription(0, (CMTime *)&v8);
    LODWORD(v8.var0) = 138412290;
    *(int64_t *)((char *)&v8.var0 + 4) = (int64_t)v6;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "Tap-to-track started: t=%@", (uint8_t *)&v8, 0xCu);

  }
  -[PXSubjectTrackingView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  objc_msgSend(v7, "objectTrackingStartedAtTime:", &v8);

}

- (void)_trackedObjectWasUpdatedAtTime:(id *)a3 trackedRect:(CGRect)a4 confidence:(float)a5 shouldStop:(BOOL *)a6
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v30;
  uint64_t v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v31 = *MEMORY[0x1E0C80C00];
  PLPhotoEditGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v30 = *a3;
    v14 = (__CFString *)CMTimeCopyDescription(0, (CMTime *)&v30);
    LODWORD(v30.var0) = 138412290;
    *(int64_t *)((char *)&v30.var0 + 4) = (int64_t)v14;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_INFO, "Tap-to-track progress: t=%@", (uint8_t *)&v30, 0xCu);

  }
  -[PXSubjectTrackingView delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *a3;
  objc_msgSend(v15, "trackedObjectWasUpdatedAtTime:shouldStop:", &v30, a6);

  -[PXSubjectTrackingView inProgressTrackingView](self, "inProgressTrackingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[PXSubjectTrackingView viewFrameForNormalizedRect:](self, "viewFrameForNormalizedRect:", x, y, width, height);
    -[PXSubjectTrackingView _reframeWithinVideo:isFixedFocus:fixedFocusCenter:](self, "_reframeWithinVideo:isFixedFocus:fixedFocusCenter:", 0);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[PXSubjectTrackingView delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "newTrackingViewWithFrame:initialState:", 5, v18, v20, v22, v24);
    -[PXSubjectTrackingView setInProgressTrackingView:](self, "setInProgressTrackingView:", v26);

    -[PXSubjectTrackingView inProgressTrackingView](self, "inProgressTrackingView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSubjectTrackingView insertSubview:atIndex:](self, "insertSubview:atIndex:", v27, 0);

    -[PXSubjectTrackingView setFocusStateBadgeVisible:autoHide:](self, "setFocusStateBadgeVisible:autoHide:", 1, 0);
    -[PXSubjectTrackingView delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSubjectTrackingView focusStateBadge](self, "focusStateBadge");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTrackingInProgressTextForFocusStateBadge:", v29);

  }
}

- (void)_finishedProcessingTrackedObject:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "Tap-to-track finished with success", v12, 2u);
  }

  -[PXSubjectTrackingView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectTrackingFinishedWithSuccess:", 1);

  v7 = objc_msgSend(v4, "trackIdentifier");
  -[PXSubjectTrackingView detectionViewCache](self, "detectionViewCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PXSubjectTrackingView inProgressTrackingView](self, "inProgressTrackingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[PXSubjectTrackingView setInProgressTrackingView:](self, "setInProgressTrackingView:", 0);
  }
  else
  {
    -[PXSubjectTrackingView setInProgressTrackID:](self, "setInProgressTrackID:", v7);
    -[PXSubjectTrackingView setNeedsUpdateViewCache:](self, "setNeedsUpdateViewCache:", 1);
  }
  -[PXSubjectTrackingView setFocusStateBadgeVisible:autoHide:](self, "setFocusStateBadgeVisible:autoHide:", 0, 0);
}

- (void)_trackedObjectAtPoint:(CGPoint)a3 failedWithError:(id)a4
{
  double y;
  double x;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  y = a3.y;
  x = a3.x;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Tap-to-track failed with error: %@", (uint8_t *)&v11, 0xCu);
  }

  -[PXSubjectTrackingView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectTrackingFinishedWithSuccess:", 0);

  -[PXSubjectTrackingView inProgressTrackingView](self, "inProgressTrackingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  -[PXSubjectTrackingView setInProgressTrackingView:](self, "setInProgressTrackingView:", 0);
  -[PXSubjectTrackingView setFocusStateBadgeVisible:autoHide:](self, "setFocusStateBadgeVisible:autoHide:", 0, 0);
  -[PXSubjectTrackingView _focusOnFixedLocationAtPoint:strong:](self, "_focusOnFixedLocationAtPoint:strong:", 0, x, y);

}

- (void)_trackedObjectAtPoint:(CGPoint)a3 finishedWithResponse:(id)a4 trackStartTime:(id *)a5 strongTrack:(BOOL)a6
{
  _BOOL8 v6;
  double y;
  double x;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  int64_t var3;
  id v20;

  v6 = a6;
  y = a3.y;
  x = a3.x;
  v20 = 0;
  objc_msgSend(a4, "result:", &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  if (v11)
  {
    objc_msgSend(v11, "completedTrack");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v18 = *(_OWORD *)&a5->var0;
      var3 = a5->var3;
      v15 = -[PXSubjectTrackingView addFocusTrack:atTime:strong:](self, "addFocusTrack:atTime:strong:", v13, &v18, v6);
      if (v15 == 2)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Tap-to-track error: cinematographyScript failed to focus on new track: %@"), v14);
      }
      else
      {
        if (v15 != 1)
        {
          -[PXSubjectTrackingView _finishedProcessingTrackedObject:](self, "_finishedProcessingTrackedObject:", v14);
          v18 = *(_OWORD *)&a5->var0;
          var3 = a5->var3;
          -[PXSubjectTrackingView _newTrackWasAddedAndFocusedAtTime:](self, "_newTrackWasAddedAndFocusedAtTime:", &v18);
          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Tap-to-track error: cinematographyScript failed to add new track: %@"), v14);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSubjectTrackingView _trackedObjectAtPoint:failedWithError:](self, "_trackedObjectAtPoint:failedWithError:", v17, x, y);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Tap-to-track error: result did not contain completedTrack: %@"), v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSubjectTrackingView _trackedObjectAtPoint:failedWithError:](self, "_trackedObjectAtPoint:failedWithError:", v16, x, y);

      v14 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithUnderlyingError:debugDescription:", v12, CFSTR("Tap-to-track error: tracking failed with error %@"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSubjectTrackingView _trackedObjectAtPoint:failedWithError:](self, "_trackedObjectAtPoint:failedWithError:", v14, x, y);
  }
LABEL_11:

}

- (int64_t)addFocusTrack:(id)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  int64_t v16;
  __int128 v18;
  int64_t var3;

  v5 = a5;
  v8 = a3;
  -[PXSubjectTrackingView cineController](self, "cineController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cinematographyScript");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "addTrack:", v8);

  if (v11)
  {
    -[PXSubjectTrackingView cineController](self, "cineController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cinematographyScript");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "trackIdentifier");
    v18 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v15 = objc_msgSend(v13, "focusOnTrackIdentifier:atTime:strong:", v14, &v18, v5);

    if (v15)
      v16 = 0;
    else
      v16 = 2;
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)showTrackingInformationalString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXSubjectTrackingView setFocusStateBadgeVisible:autoHide:](self, "setFocusStateBadgeVisible:autoHide:", 1, 1);
  -[PXSubjectTrackingView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSubjectTrackingView focusStateBadge](self, "focusStateBadge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:forFocusStateBadge:", v4, v6);

  -[PXSubjectTrackingView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_axDescriptionForCacheKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v4 = a3;
  -[PXSubjectTrackingView cinematographyFrame](self, "cinematographyFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "allDetections"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    objc_msgSend(v6, "detectionForTrackIdentifier:", objc_msgSend(v4, "integerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D7F530], "accessibilityLabelForDetectionType:", objc_msgSend(v9, "detectionType"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = &stru_1E5149688;
    }

  }
  else
  {
    v11 = &stru_1E5149688;
  }

  return v11;
}

- (PXSubjectTrackingViewDelegate)delegate
{
  return (PXSubjectTrackingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXSubjectTrackingLayoutDelegate)layoutDelegate
{
  return (PXSubjectTrackingLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (void)setLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_layoutDelegate, a3);
}

- (BOOL)viewEnabled
{
  return self->_viewEnabled;
}

- (id)playbackTimeObserver
{
  return self->_playbackTimeObserver;
}

- (void)setPlaybackTimeObserver:(id)a3
{
  objc_storeStrong(&self->_playbackTimeObserver, a3);
}

- (void)setDetectionViewCache:(id)a3
{
  objc_storeStrong((id *)&self->_detectionViewCache, a3);
}

- (UIView)inProgressTrackingView
{
  return self->_inProgressTrackingView;
}

- (void)setInProgressTrackingView:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressTrackingView, a3);
}

- (int64_t)inProgressTrackID
{
  return self->_inProgressTrackID;
}

- (void)setInProgressTrackID:(int64_t)a3
{
  self->_inProgressTrackID = a3;
}

- (PTCinematographyFrame)cinematographyFrame
{
  return self->_cinematographyFrame;
}

- (NSNumber)primaryKey
{
  return self->_primaryKey;
}

- (void)setPrimaryKey:(id)a3
{
  objc_storeStrong((id *)&self->_primaryKey, a3);
}

- (BOOL)needsUpdateFrame
{
  return self->_needsUpdateFrame;
}

- (void)setNeedsUpdateFrame:(BOOL)a3
{
  self->_needsUpdateFrame = a3;
}

- (BOOL)needsUpdateFrameTime
{
  return self->_needsUpdateFrameTime;
}

- (void)setNeedsUpdateFrameTime:(BOOL)a3
{
  self->_needsUpdateFrameTime = a3;
}

- (BOOL)needsUpdateViewCache
{
  return self->_needsUpdateViewCache;
}

- (void)setNeedsUpdateViewCache:(BOOL)a3
{
  self->_needsUpdateViewCache = a3;
}

- (UIView)focusStateBadge
{
  return self->_focusStateBadge;
}

- (void)setFocusStateBadge:(id)a3
{
  objc_storeStrong((id *)&self->_focusStateBadge, a3);
}

- (NSTimer)hideFocusStateBadgeTimer
{
  return self->_hideFocusStateBadgeTimer;
}

- (void)setHideFocusStateBadgeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_hideFocusStateBadgeTimer, a3);
}

- (int64_t)focusState
{
  return self->_focusState;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (double)lastLayoutTime
{
  return self->_lastLayoutTime;
}

- (void)setLastLayoutTime:(double)a3
{
  self->_lastLayoutTime = a3;
}

- (BOOL)badgeVisibleAndWillAutoClose
{
  return self->_badgeVisibleAndWillAutoClose;
}

- (void)setBadgeVisibleAndWillAutoClose:(BOOL)a3
{
  self->_badgeVisibleAndWillAutoClose = a3;
}

- (BOOL)viewCanBeEnabled
{
  return self->_viewCanBeEnabled;
}

- (void)setViewCanBeEnabled:(BOOL)a3
{
  self->_viewCanBeEnabled = a3;
}

- (NUMediaView)mediaView
{
  return self->_mediaView;
}

- (PXCinematicEditController)cineController
{
  return self->_cineController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cineController, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_hideFocusStateBadgeTimer, 0);
  objc_storeStrong((id *)&self->_focusStateBadge, 0);
  objc_storeStrong((id *)&self->_primaryKey, 0);
  objc_storeStrong((id *)&self->_cinematographyFrame, 0);
  objc_storeStrong((id *)&self->_inProgressTrackingView, 0);
  objc_storeStrong((id *)&self->_detectionViewCache, 0);
  objc_storeStrong(&self->_playbackTimeObserver, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __60__PXSubjectTrackingView__trackAndFocusObjectAtPoint_strong___block_invoke(uint64_t a1, __int128 *a2, uint64_t a3, double a4, double a5, double a6, double a7, float a8)
{
  id WeakRetained;
  double v16;
  __int128 v17;
  uint64_t v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v17 = *a2;
  v18 = *((_QWORD *)a2 + 2);
  *(float *)&v16 = a8;
  objc_msgSend(WeakRetained, "_trackedObjectWasUpdatedAtTime:trackedRect:confidence:shouldStop:", &v17, a3, a4, a5, a6, a7, v16);

}

void __60__PXSubjectTrackingView__trackAndFocusObjectAtPoint_strong___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  double v7;
  double v8;
  __int128 v9;
  uint64_t v10;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(unsigned __int8 *)(a1 + 80);
  v7 = *(double *)(a1 + 40);
  v8 = *(double *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 72);
  objc_msgSend(WeakRetained, "_trackedObjectAtPoint:finishedWithResponse:trackStartTime:strongTrack:", v4, &v9, v6, v7, v8);

}

void __61__PXSubjectTrackingView__focusOnFixedLocationAtPoint_strong___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(unsigned __int8 *)(a1 + 96);
  v7 = *(_OWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 88);
  objc_msgSend(WeakRetained, "_disparitySampleFinishedWithResponse:time:rect:strong:", v4, &v7, v6, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

void __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "focusStateBadge");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5 = *(double *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_3;
  v6[3] = &unk_1E5147280;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "animateWithDuration:animations:", v6, v5);
  objc_destroyWeak(&v7);

}

uint64_t __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "focusStateBadge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  return objc_msgSend(*(id *)(a1 + 32), "setBadgeVisibleAndWillAutoClose:", 0);
}

uint64_t __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "focusStateBadge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  return objc_msgSend(*(id *)(a1 + 32), "setBadgeVisibleAndWillAutoClose:", 0);
}

uint64_t __56__PXSubjectTrackingView_setCinematographyFrame_animate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsAnimating:", 1);
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_updateFocusStateAnimated:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __56__PXSubjectTrackingView_setCinematographyFrame_animate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimating:", 0);
}

uint64_t __62__PXSubjectTrackingView_decisionsDidChangeInScript_timeRange___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t result;
  CMTime v5;
  CMTimeRange range;
  CMTime v7;

  memset(&v7, 0, sizeof(v7));
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "_currentCinematographyTime");
  v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 72);
  v5 = v7;
  result = CMTimeRangeContainsTime(&range, &v5);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_updateFocusStateAnimated:", 1);
  return result;
}

uint64_t __59__PXSubjectTrackingView_framesDidChangeInScript_timeRange___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t result;
  CMTime v5;
  CMTimeRange range;
  CMTime v7;

  memset(&v7, 0, sizeof(v7));
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "_currentCinematographyTime");
  v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 72);
  v5 = v7;
  result = CMTimeRangeContainsTime(&range, &v5);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "scriptDidUpdate");
  return result;
}

void __58__PXSubjectTrackingView_initWithMediaView_cineController___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PXSubjectTrackingView_initWithMediaView_cineController___block_invoke_2;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __58__PXSubjectTrackingView_initWithMediaView_cineController___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "viewEnabled");

  if (v3)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "_playbackTimeDidUpdate");

  }
}

+ (CGPoint)denormalizePoint:(CGPoint)a3 masterSize:(CGSize)a4 flipYCoordinate:(BOOL)a5
{
  double v5;
  double v6;
  CGPoint result;

  v5 = a3.x * a4.width;
  v6 = a3.y * a4.height;
  if (a5)
    v6 = a4.height - v6;
  result.y = v6;
  result.x = v5;
  return result;
}

@end
