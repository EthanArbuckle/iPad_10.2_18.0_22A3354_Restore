@implementation PXLivePhotoTrimScrubber

- (PXLivePhotoTrimScrubber)initWithFilmStripViewClass:(Class)a3 spec:(id)a4 traitCollection:(id)a5
{
  id v8;
  id v9;
  PXLivePhotoTrimScrubber *v10;
  PXLivePhotoTrimScrubber *v11;
  void *v12;
  PXTrimScrubberLayoutHelper *v13;
  PXTrimScrubberLayoutHelper *layoutHelper;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PXLivePhotoTrimScrubber;
  v10 = -[PXLivePhotoTrimScrubber initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_filmStripViewClass, a3);
    v12 = v8;
    if (!v8)
      v12 = (void *)objc_opt_new();
    objc_storeStrong((id *)&v11->_spec, v12);
    if (!v8)

    objc_storeStrong((id *)&v11->_traitCollection, a5);
    v13 = objc_alloc_init(PXTrimScrubberLayoutHelper);
    layoutHelper = v11->_layoutHelper;
    v11->_layoutHelper = v13;

    -[PXLivePhotoTrimScrubber _PXLivePhotoTrimScrubber_commonInit](v11, "_PXLivePhotoTrimScrubber_commonInit");
  }

  return v11;
}

- (void)_newScrubberLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
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
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  double v42;
  double v43;
  unint64_t v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double Width;
  CGFloat MinX;
  double v53;
  BOOL v54;
  double v55;
  BOOL v56;
  char v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  CGFloat v75;
  double v76;
  double v77;
  double MaxX;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  double v94;
  void *v95;
  int64_t v96;
  _BOOL8 v97;
  double x;
  double v99;
  CGFloat v100;
  void *v101;
  double v102;
  double v103;
  CGFloat v104;
  void *v105;
  double v106;
  CGFloat v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double rect;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  double v119;
  double v120;
  double v121;
  _QWORD v122[5];
  CMTime v123;
  CMTime v124;
  CMTime v125;
  CMTime v126;
  CMTime time;
  CMTime v128;
  CMTime v129;
  CMTime v130;
  CMTime rhs;
  CMTime lhs;
  CMTime v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;

  -[PXLivePhotoTrimScrubber spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrubberHeight");
  v5 = v4;
  -[PXLivePhotoTrimScrubber horizontalInset](self, "horizontalInset");
  v7 = v6;
  objc_msgSend(v3, "handleWidth");
  v109 = v8;
  objc_msgSend(v3, "handleHeight");
  rect = v9;
  -[PXLivePhotoTrimScrubber bounds](self, "bounds");
  v10 = (CGRectGetHeight(v134) - v5) * 0.5;
  objc_msgSend(v3, "filmstripViewInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v120 = v7 + v13;
  v110 = v13;
  -[PXLivePhotoTrimScrubber bounds](self, "bounds");
  v106 = v7;
  v119 = v5;
  -[PXLivePhotoTrimScrubber backingAlignedRectForRect:](self, "backingAlignedRectForRect:", v120, v10 + v12, CGRectGetWidth(v135) + v7 * -2.0 - v14 - v18, v5 - v12 - v16);
  -[UIView setFrame:](self->_filmstripContainerView, "setFrame:");
  -[UIView frame](self->_filmstripContainerView, "frame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setViewportFrame:", v20, v22, v24, v26);

  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "filmstripFrameInScrubberSpace");
  v117 = v30;
  v118 = v29;
  v115 = v32;
  v116 = v31;

  -[PXLivePhotoTrimScrubber _keyHandleRect](self, "_keyHandleRect");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  memset(&v133, 0, sizeof(v133));
  -[PXLivePhotoTrimScrubber trimEndTime](self, "trimEndTime");
  -[PXLivePhotoTrimScrubber trimStartTime](self, "trimStartTime");
  CMTimeSubtract(&v133, &lhs, &rhs);
  memset(&v130, 0, sizeof(v130));
  -[PXLivePhotoTrimScrubber trimStartTime](self, "trimStartTime");
  time = v133;
  CMTimeMultiplyByRatio(&v128, &time, 1, 2);
  CMTimeAdd(&v130, &v129, &v128);
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  time = v130;
  objc_msgSend(v41, "offsetInScrubberSpaceForTime:fallbackAnchor:", &time, 0.5);
  v43 = v42;

  v121 = floor(v43);
  v108 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v44 = -[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle");
  memset(&time, 0, sizeof(time));
  -[PXLivePhotoTrimScrubber trimStartTime](self, "trimStartTime");
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = time;
  objc_msgSend(v45, "offsetInScrubberSpaceForTime:fallbackAnchor:", &v126, 0.0);
  v47 = v46;

  memset(&v126, 0, sizeof(v126));
  -[PXLivePhotoTrimScrubber trimEndTime](self, "trimEndTime");
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v126;
  objc_msgSend(v48, "offsetInScrubberSpaceForTime:fallbackAnchor:", &v125, 1.0);
  v50 = v49;

  v136.origin.x = v34;
  v136.origin.y = v36;
  v136.size.width = v38;
  v136.size.height = v40;
  Width = CGRectGetWidth(v136);
  v137.origin.y = v117;
  v137.origin.x = v118;
  v137.size.height = v115;
  v137.size.width = v116;
  MinX = CGRectGetMinX(v137);
  v53 = v110;
  v54 = Width <= v50 - v47;
  v55 = MinX - v110;
  v56 = !v54 && v44 == 2;
  v57 = !v56;
  v112 = v38;
  v113 = v34;
  if (v56)
  {
    v138.origin.x = v34;
    v138.origin.y = v36;
    v138.size.width = v38;
    v138.size.height = v40;
    v58 = CGRectGetMinX(v138);
    v53 = v110;
  }
  else
  {
    v58 = v106 + v47;
  }
  v59 = rect;
  v60 = v40;
  v61 = v58 - v53;
  if (v55 >= v61)
    v62 = v55;
  else
    v62 = v61;
  if (v109 >= v121 - v62)
    v63 = v109;
  else
    v63 = v121 - v62;
  v64 = v62;
  v65 = v108;
  v111 = v63;
  v66 = CGRectGetMinX(*(CGRect *)(&v59 - 3));
  v67 = v109 * 0.5;
  memset(&v125, 0, sizeof(v125));
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  v107 = v60;
  if (v68)
    objc_msgSend(v68, "timeForOffsetInScrubberSpace:", v67 + v66);
  else
    memset(&v125, 0, sizeof(v125));

  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v125;
  objc_msgSend(v70, "offsetInViewportSpaceForTime:", &v124);
  v72 = v71;

  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "filmstripFrame");
  v74 = CGRectGetMinX(v139);

  -[PXLivePhotoTrimScrubber backingAlignedRectForRect:](self, "backingAlignedRectForRect:", v74, v108, v72 - v74, v119);
  -[UIView setFrame:](self->_preTrimOverlayView, "setFrame:");
  v140.origin.y = v117;
  v140.origin.x = v118;
  v140.size.height = v115;
  v140.size.width = v116;
  CGRectGetMaxX(v140);
  v75 = v121;
  if ((v57 & 1) == 0)
  {
    v141.size.width = v112;
    v141.origin.x = v113;
    v141.size.height = v107;
    v141.origin.y = v36;
    CGRectGetMaxX(v141);
    v75 = v121;
  }
  PXClamp();
  v77 = v76;
  v142.origin.x = v75;
  v142.origin.y = v108;
  v142.size.width = v77;
  v142.size.height = rect;
  MaxX = CGRectGetMaxX(v142);
  memset(&v124, 0, sizeof(v124));
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79;
  if (v79)
    objc_msgSend(v79, "timeForOffsetInScrubberSpace:", MaxX - v67);
  else
    memset(&v124, 0, sizeof(v124));

  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v124;
  objc_msgSend(v81, "offsetInViewportSpaceForTime:", &v123);
  v83 = v82;

  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "filmstripFrame");
  v85 = CGRectGetMaxX(v143) - v83;

  -[PXLivePhotoTrimScrubber backingAlignedRectForRect:](self, "backingAlignedRectForRect:", v83, v108, v85, v119);
  -[UIView setFrame:](self->_postTrimOverlayView, "setFrame:");
  v122[0] = MEMORY[0x1E0C809B0];
  v122[1] = 3221225472;
  v122[2] = __53__PXLivePhotoTrimScrubber__newScrubberLayoutSubviews__block_invoke;
  v122[3] = &unk_1E5149198;
  v122[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v122);
  -[PXLivePhotoTrimScrubber backingAlignedRectForRect:](self, "backingAlignedRectForRect:", v62, v108, v111, rect);
  -[UIImageView setFrame:](self->_trimStartHandle, "setFrame:");
  -[PXLivePhotoTrimScrubber backingAlignedRectForRect:](self, "backingAlignedRectForRect:", v121, v108, v77, rect);
  -[UIImageView setFrame:](self->_trimEndHandle, "setFrame:");
  -[PXLivePhotoTrimScrubberLoupeView frame](self->_photoLoupe, "frame");
  v87 = v86;
  v89 = v88;
  v91 = v90;
  v93 = v92;
  -[PXLivePhotoTrimScrubber bounds](self, "bounds");
  v94 = (CGRectGetHeight(v144) - rect) * 0.5;
  -[PXLivePhotoTrimScrubber backingAlignedRectForRect:](self, "backingAlignedRectForRect:", v113, v94, v112, rect);
  -[PXLivePhotoTrimScrubberLoupeView setFrame:](self->_photoLoupe, "setFrame:");
  -[PXLivePhotoTrimScrubberLoupeView frame](self->_photoLoupe, "frame");
  v148.origin.x = v87;
  v148.origin.y = v89;
  v148.size.width = v91;
  v148.size.height = v93;
  if (!CGRectEqualToRect(v145, v148) && self->_delegateFlags.respondsToDidChangeLoupeRect)
  {
    -[PXLivePhotoTrimScrubber delegate](self, "delegate");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "trimScrubber:didChangeLoupeRect:", self, v113, v94, v112, rect);

  }
  -[PXLivePhotoTrimScrubber _disabledOverlayFrame](self, "_disabledOverlayFrame");
  -[UIView setFrame:](self->_disabledOverlayView, "setFrame:");
  v96 = -[PXLivePhotoTrimScrubber trimStatus](self, "trimStatus");
  if (v96)
  {
    v97 = v96 == 2;
    -[UIImageView setHighlighted:](self->_trimStartHandle, "setHighlighted:", v97);
    -[UIImageView setHighlighted:](self->_trimEndHandle, "setHighlighted:", v97);
    -[PXLivePhotoTrimScrubber _setTrimControlsHidden:animated:](self, "_setTrimControlsHidden:animated:", 0, 1);
  }
  if (self->_delegateFlags.respondsToDebugStartRect)
  {
    -[UIImageView frame](self->_trimStartHandle, "frame");
    x = v146.origin.x;
    v99 = v146.size.width;
    v146.size.height = 10.0;
    v100 = v146.origin.y - CGRectGetHeight(v146);
    -[PXLivePhotoTrimScrubber delegate](self, "delegate");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "trimScrubber:debugStartRect:", self, x, v100, v99, 10.0);

  }
  if (self->_delegateFlags.respondsToDebugEndRect)
  {
    -[UIImageView frame](self->_trimEndHandle, "frame");
    v102 = v147.origin.x;
    v103 = v147.size.width;
    v147.size.height = 10.0;
    v104 = v147.origin.y - CGRectGetHeight(v147);
    -[PXLivePhotoTrimScrubber delegate](self, "delegate");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "trimScrubber:debugEndRect:", self, v102, v104, v103, 10.0);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double x;
  double width;
  double height;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  _BYTE v26[24];
  _BYTE v27[24];
  _BYTE v28[24];
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)PXLivePhotoTrimScrubber;
  -[PXLivePhotoTrimScrubber layoutSubviews](&v29, sel_layoutSubviews);
  -[PXLivePhotoTrimScrubber _updateSpecDependentUI](self, "_updateSpecDependentUI");
  -[PXLivePhotoTrimScrubber _newScrubberLayoutSubviews](self, "_newScrubberLayoutSubviews");
  if (-[PXLivePhotoTrimScrubber showVideoScrubberDebugOverlay](self, "showVideoScrubberDebugOverlay"))
  {
    -[PXLivePhotoTrimScrubber spec](self, "spec");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scrubberHeight");
    v5 = v4;

    -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubber trimStartTime](self, "trimStartTime");
    objc_msgSend(v6, "offsetInScrubberSpaceForTime:", v28);
    v8 = v7;

    -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubber keyTime](self, "keyTime");
    objc_msgSend(v9, "offsetInScrubberSpaceForTime:", v27);
    v11 = v10;

    -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubber trimEndTime](self, "trimEndTime");
    objc_msgSend(v12, "offsetInScrubberSpaceForTime:", v26);
    v14 = v13;

    -[UIView setFrame:](self->_debugStartTimeView, "setFrame:", v8, 0.0, 1.0, v5);
    -[UIView setFrame:](self->_debugLoupeTimeView, "setFrame:", v11, 0.0, 1.0, v5);
    -[UIView setFrame:](self->_debugEndTimeView, "setFrame:", v14, 0.0, 1.0, v5);
    if (self->_delegateFlags.respondsToDebugStartOffset)
    {
      -[UIView frame](self->_debugStartTimeView, "frame");
      x = v30.origin.x;
      width = v30.size.width;
      height = v30.size.height;
      v18 = v30.origin.y - CGRectGetHeight(v30);
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trimScrubber:debugStartOffset:", self, x, v18, width, height);

    }
    if (self->_delegateFlags.respondsToDebugEndOffset)
    {
      -[UIView frame](self->_debugEndTimeView, "frame");
      v20 = v31.origin.x;
      v21 = v31.size.width;
      v22 = v31.size.height;
      v23 = v31.origin.y - CGRectGetHeight(v31);
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "trimScrubber:debugEndOffset:", self, v20, v23, v21, v22);

    }
  }
  if (self->_delegateFlags.respondsToDidLayoutSubviews)
  {
    -[PXLivePhotoTrimScrubber delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trimScrubberDidLayoutSubviews:", self);

  }
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
    self->_delegateFlags.respondsToAssetDurationDidChange = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidTapElement = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToCanBeginInteractivelyEditingElement = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidBeginInteractivelyEditingElement = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidEndInteractivelyEditingElement = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidChangeTimeForElement = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidChangeLoupeRect = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidZoomToMinimumValueMaximumValue = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidUnzoom = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPausePlayer = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidLayoutSubviews = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDebugStartRect = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDebugEndRect = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDebugStartOffset = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDebugEndOffset = objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PXLivePhotoTrimScrubberFilmStripView setThumbnailUpdatingDelegate:](self->_filmstripView, "setThumbnailUpdatingDelegate:", obj);
  }

}

- (void)setAsset:(id)a3 videoComposition:(id)a4
{
  AVAsset *v7;
  AVVideoComposition *v8;
  AVAsset **p_asset;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v7 = (AVAsset *)a3;
  v8 = (AVVideoComposition *)a4;
  p_asset = &self->_asset;
  if (self->_asset == v7)
    v10 = 0;
  else
    v10 = -[AVAsset isEqual:](v7, "isEqual:") ^ 1;
  if (self->_videoComposition == v8)
    v11 = 0;
  else
    v11 = -[AVVideoComposition isEqual:](v8, "isEqual:") ^ 1;
  if ((v10 | v11) == 1)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    objc_storeStrong((id *)&self->_videoComposition, a4);
    -[PXLivePhotoTrimScrubberFilmStripView setAsset:videoComposition:](self->_filmstripView, "setAsset:videoComposition:", *p_asset, v8);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryForKey:", CFSTR("IPXRootSettings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PXSettingsArchiveKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("editSettings"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("disableScrubberLoupe"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if ((v17 & 1) == 0)
      -[PXLivePhotoTrimScrubberLoupeView setAsset:videoComposition:](self->_photoLoupe, "setAsset:videoComposition:", *p_asset, v8);
    -[PXLivePhotoTrimScrubber _updateContentAspectRatio](self, "_updateContentAspectRatio");
    if (v7)
    {
      -[AVAsset duration](v7, "duration");
    }
    else
    {
      v24 = 0uLL;
      v25 = 0;
    }
    v22 = v24;
    v23 = v25;
    -[PXLivePhotoTrimScrubber _setUntrimmedDuration:](self, "_setUntrimmedDuration:", &v22);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AVAsset statusOfValueForKey:error:](v7, "statusOfValueForKey:error:", CFSTR("duration"), 0) != 2)
      objc_msgSend(v18, "addObject:", CFSTR("duration"));
    if (-[AVAsset statusOfValueForKey:error:](v7, "statusOfValueForKey:error:", CFSTR("tracks"), 0) != 2)
      objc_msgSend(v18, "addObject:", CFSTR("tracks"));
    if (objc_msgSend(v18, "count"))
    {
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __53__PXLivePhotoTrimScrubber_setAsset_videoComposition___block_invoke;
      v19[3] = &unk_1E5148D30;
      objc_copyWeak(&v20, &location);
      -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](v7, "loadValuesAsynchronouslyForKeys:completionHandler:", v18, v19);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }

  }
}

- (void)setLoupePlayerView:(id)a3
{
  -[PXLivePhotoTrimScrubberLoupeView setPlayerView:](self->_photoLoupe, "setPlayerView:", a3);
}

- (UIView)loupePlayerView
{
  return -[PXLivePhotoTrimScrubberLoupeView playerView](self->_photoLoupe, "playerView");
}

- (void)setPlaceholderImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_placeholderImage, a3);
  v5 = a3;
  -[PXLivePhotoTrimScrubberFilmStripView setLivePhotoTrimScrubberThumbnail:](self->_filmstripView, "setLivePhotoTrimScrubberThumbnail:", v5);

  -[PXLivePhotoTrimScrubber _updateContentAspectRatio](self, "_updateContentAspectRatio");
}

- (void)setKeyTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3;

  v3 = *a3;
  -[PXLivePhotoTrimScrubber _setKeyTime:canHaveImpact:forElement:](self, "_setKeyTime:canHaveImpact:forElement:", &v3, 0, 3);
}

- (void)_setKeyTime:(id *)a3 canHaveImpact:(BOOL)a4 forElement:(int64_t)a5
{
  _BOOL4 v6;
  $95D729B680665BEAEFA1D6FCA8238556 *p_trimEndTime;
  int v10;
  __int128 v11;
  __int128 v12;
  unint64_t v13;
  void *v14;
  PXLivePhotoTrimScrubberLoupeView *photoLoupe;
  __int128 v16;
  CMTime trimEndTime;
  CMTime time1;

  v6 = a4;
  if ((a3->var2 & 0x1D) == 1
    && (p_trimEndTime = &self->_trimEndTime,
        time1 = *(CMTime *)a3,
        trimEndTime = (CMTime)self->_trimEndTime,
        CMTimeCompare(&time1, &trimEndTime) >= 1)
    && (self->_trimEndTime.flags & 1) != 0)
  {
    v16 = *(_OWORD *)&p_trimEndTime->value;
    a3->var3 = self->_trimEndTime.epoch;
    *(_OWORD *)&a3->var0 = v16;
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  if ((a3->var2 & 0x1D) == 1)
  {
    time1 = (CMTime)*a3;
    trimEndTime = (CMTime)self->_trimStartTime;
    if (CMTimeCompare(&time1, &trimEndTime) < 0 && (self->_trimStartTime.flags & 1) != 0)
    {
      v11 = *(_OWORD *)&self->_trimStartTime.value;
      a3->var3 = self->_trimStartTime.epoch;
      *(_OWORD *)&a3->var0 = v11;
      v10 = 1;
    }
  }
  time1 = (CMTime)self->_keyTime;
  trimEndTime = (CMTime)*a3;
  if (CMTimeCompare(&time1, &trimEndTime))
  {
    v12 = *(_OWORD *)&a3->var0;
    self->_keyTime.epoch = a3->var3;
    *(_OWORD *)&self->_keyTime.value = v12;
    v13 = -[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle");
    if ((v10 & v6) == 1 && (a3->var2 & 0x1D) == 1 && v13)
      -[PXLivePhotoTrimScrubber _trimHandleDidReachBounds](self, "_trimHandleDidReachBounds");
    if (self->_delegateFlags.respondsToDidChangeTimeForElement)
    {
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trimScrubber:didChangeTimeForElement:", self, a5);

      -[PXLivePhotoTrimScrubber _updateZoomState:](self, "_updateZoomState:", 1);
    }
    -[PXLivePhotoTrimScrubber setNeedsLayout](self, "setNeedsLayout");
    photoLoupe = self->_photoLoupe;
    time1 = (CMTime)*a3;
    -[PXLivePhotoTrimScrubberLoupeView setFrameTime:](photoLoupe, "setFrameTime:", &time1);
    -[PXLivePhotoTrimScrubber _presentControlsIfNeeded](self, "_presentControlsIfNeeded");
  }
}

- (BOOL)isValidKeyTime:(id *)a3
{
  __int128 v6;
  CMTimeRange v7;
  CMTime end;
  CMTimeRange v9;
  CMTime v10;
  __int128 v11;
  CMTimeEpoch v12;

  v11 = 0uLL;
  v12 = 0;
  -[PXLivePhotoTrimScrubber trimStartTime](self, "trimStartTime");
  memset(&v10, 0, sizeof(v10));
  -[PXLivePhotoTrimScrubber trimEndTime](self, "trimEndTime");
  if ((a3->var2 & 1) == 0)
    return 0;
  memset(&v9, 0, sizeof(v9));
  *(_OWORD *)&v7.start.value = v11;
  v7.start.epoch = v12;
  end = v10;
  CMTimeRangeFromTimeToTime(&v9, &v7.start, &end);
  *(_OWORD *)&v7.start.value = *(_OWORD *)&v9.start.value;
  *(_OWORD *)&v7.start.epoch = *(_OWORD *)&v9.start.epoch;
  v6 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&v7.duration.timescale = *(_OWORD *)&v9.duration.timescale;
  *(_OWORD *)&end.value = v6;
  end.epoch = a3->var3;
  if (CMTimeRangeContainsTime(&v7, &end))
    return 1;
  *(_OWORD *)&v7.start.value = v11;
  v7.start.epoch = v12;
  end = (CMTime)*a3;
  if (!CMTimeCompare(&v7.start, &end))
    return 1;
  v7.start = v10;
  end = (CMTime)*a3;
  return CMTimeCompare(&v7.start, &end) == 0;
}

- (void)setSnapKeyTimes:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *snapKeyTimes;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_snapKeyTimes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      snapKeyTimes = self->_snapKeyTimes;
      self->_snapKeyTimes = v6;

      -[PXLivePhotoTrimScrubber _updateKeyTimeSnappingControllers](self, "_updateKeyTimeSnappingControllers");
    }
  }

}

- (void)setSuggestedKeyTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_suggestedKeyTime;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 suggestedKeyTime;
  CMTime time1;

  p_suggestedKeyTime = &self->_suggestedKeyTime;
  time1 = *(CMTime *)a3;
  suggestedKeyTime = self->_suggestedKeyTime;
  if (CMTimeCompare(&time1, (CMTime *)&suggestedKeyTime))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_suggestedKeyTime->epoch = a3->var3;
    *(_OWORD *)&p_suggestedKeyTime->value = v6;
    -[PXLivePhotoTrimScrubber _updateKeyTimeSnappingControllers](self, "_updateKeyTimeSnappingControllers");
  }
}

- (void)setSnapTrimStartTimes:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *snapTrimStartTimes;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_snapTrimStartTimes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      snapTrimStartTimes = self->_snapTrimStartTimes;
      self->_snapTrimStartTimes = v6;

      -[PXLivePhotoTrimScrubber _updateStartTimeSnappingControllers](self, "_updateStartTimeSnappingControllers");
    }
  }

}

- (void)setSnapTrimEndTimes:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *snapTrimEndTimes;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_snapTrimEndTimes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      snapTrimEndTimes = self->_snapTrimEndTimes;
      self->_snapTrimEndTimes = v6;

      -[PXLivePhotoTrimScrubber _updateEndTimeSnappingControllers](self, "_updateEndTimeSnappingControllers");
    }
  }

}

- (void)setFocusEventTimes:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *focusEventTimes;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_focusEventTimes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      focusEventTimes = self->_focusEventTimes;
      self->_focusEventTimes = v6;

      -[PXLivePhotoTrimScrubber _updateFocusEventSnappingControllers](self, "_updateFocusEventSnappingControllers");
    }
  }

}

- (void)setTrimStartTime:(id *)a3
{
  CMTime *p_trimEndTime;
  CMTime *p_minimumTrimLength;
  __int128 v7;
  void *v8;
  CMTime trimStartTime;
  CMTime time1;
  CMTime time2;
  CMTime rhs;
  CMTime v13;

  memset(&v13, 0, sizeof(v13));
  p_trimEndTime = (CMTime *)&self->_trimEndTime;
  p_minimumTrimLength = (CMTime *)&self->_minimumTrimLength;
  -[PXLivePhotoTrimScrubber untrimmedDuration](self, "untrimmedDuration");
  time1 = *p_minimumTrimLength;
  CMTimeMinimum(&rhs, &time1, &time2);
  time1 = *p_trimEndTime;
  CMTimeSubtract(&v13, &time1, &rhs);
  time1 = *(CMTime *)a3;
  trimStartTime = v13;
  if (CMTimeCompare(&time1, &trimStartTime) >= 1)
  {
    time1 = (CMTime)self->_trimStartTime;
    trimStartTime = v13;
    if (CMTimeCompare(&time1, &trimStartTime) < 0)
      -[PXLivePhotoTrimScrubber _trimHandleDidReachBounds](self, "_trimHandleDidReachBounds");
    *(CMTime *)a3 = v13;
  }
  time1 = (CMTime)*a3;
  trimStartTime = (CMTime)self->_trimStartTime;
  if (CMTimeCompare(&time1, &trimStartTime))
  {
    v7 = *(_OWORD *)&a3->var0;
    self->_trimStartTime.epoch = a3->var3;
    *(_OWORD *)&self->_trimStartTime.value = v7;
    if (self->_delegateFlags.respondsToDidChangeTimeForElement)
    {
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trimScrubber:didChangeTimeForElement:", self, 1);

      -[PXLivePhotoTrimScrubber _updateZoomState:](self, "_updateZoomState:", 1);
    }
    -[PXLivePhotoTrimScrubber setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTrimEndTime:(id *)a3
{
  CMTime *p_trimStartTime;
  CMTime *p_minimumTrimLength;
  __int128 v7;
  void *v8;
  CMTime trimEndTime;
  CMTime time1;
  CMTime time2;
  CMTime rhs;
  CMTime v13;

  memset(&v13, 0, sizeof(v13));
  p_trimStartTime = (CMTime *)&self->_trimStartTime;
  p_minimumTrimLength = (CMTime *)&self->_minimumTrimLength;
  -[PXLivePhotoTrimScrubber untrimmedDuration](self, "untrimmedDuration");
  time1 = *p_minimumTrimLength;
  CMTimeMinimum(&rhs, &time1, &time2);
  time1 = *p_trimStartTime;
  CMTimeAdd(&v13, &time1, &rhs);
  time1 = *(CMTime *)a3;
  trimEndTime = v13;
  if (CMTimeCompare(&time1, &trimEndTime) < 0)
  {
    time1 = (CMTime)self->_trimEndTime;
    trimEndTime = v13;
    if (CMTimeCompare(&time1, &trimEndTime) >= 1)
      -[PXLivePhotoTrimScrubber _trimHandleDidReachBounds](self, "_trimHandleDidReachBounds");
    *(CMTime *)a3 = v13;
  }
  time1 = (CMTime)*a3;
  trimEndTime = (CMTime)self->_trimEndTime;
  if (CMTimeCompare(&time1, &trimEndTime))
  {
    v7 = *(_OWORD *)&a3->var0;
    self->_trimEndTime.epoch = a3->var3;
    *(_OWORD *)&self->_trimEndTime.value = v7;
    if (self->_delegateFlags.respondsToDidChangeTimeForElement)
    {
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trimScrubber:didChangeTimeForElement:", self, 2);

      -[PXLivePhotoTrimScrubber _updateZoomState:](self, "_updateZoomState:", 1);
    }
    -[PXLivePhotoTrimScrubber setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)_keyHandleRect
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  char v37[24];
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;

  -[PXLivePhotoTrimScrubber spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleHeight");
  v5 = v4;

  -[PXLivePhotoTrimScrubber spec](self, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playheadWidth");
  v8 = v7;

  -[PXLivePhotoTrimScrubber _contentAspectRatio](self, "_contentAspectRatio");
  v10 = v9;
  -[PXLivePhotoTrimScrubber spec](self, "spec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleHeight");
  v13 = v10 * v12;

  if (-[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle") != 1)
    v8 = v13;
  -[PXLivePhotoTrimScrubber bounds](self, "bounds");
  v47.origin.y = (CGRectGetHeight(v46) - v5) * 0.5;
  v47.origin.x = 0.0;
  v47.size.width = v8;
  v47.size.height = v5;
  v48 = CGRectIntegral(v47);
  x = v48.origin.x;
  y = v48.origin.y;
  width = v48.size.width;
  height = v48.size.height;
  v44 = 0uLL;
  v45 = 0;
  -[PXLivePhotoTrimScrubber keyTime](self, "keyTime");
  v42 = 0uLL;
  v43 = 0;
  -[PXLivePhotoTrimScrubber trimStartTime](self, "trimStartTime");
  v40 = 0uLL;
  v41 = 0;
  -[PXLivePhotoTrimScrubber trimEndTime](self, "trimEndTime");
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v42;
  v39 = v43;
  objc_msgSend(v18, "offsetInScrubberSpaceForTime:fallbackAnchor:", &v38, 0.0);
  v20 = v19;

  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v40;
  v39 = v41;
  objc_msgSend(v21, "offsetInScrubberSpaceForTime:fallbackAnchor:", &v38, 1.0);
  v23 = v22;

  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v24 = CGRectGetWidth(v49);
  v25 = -[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle");
  if (v24 <= v23 - v20)
    goto LABEL_9;
  v26 = v25;
  if (-[PXLivePhotoTrimScrubber _trackingElement](self, "_trackingElement") != 2 || v26 != 2)
  {
    if (-[PXLivePhotoTrimScrubber _trackingElement](self, "_trackingElement") == 1
      && -[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle") == 2)
    {
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v27 = CGRectGetWidth(v50);
      goto LABEL_10;
    }
LABEL_9:
    -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v44;
    v39 = v45;
    objc_msgSend(v28, "offsetInScrubberSpaceForTime:fallbackAnchor:", &v38, 0.5);

    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    CGRectGetWidth(v51);
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    v27 = v23 - CGRectGetWidth(v52);
  }
LABEL_10:
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x1E0CA2E68];
  v39 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v29, "offsetInScrubberSpaceForTime:fallbackAnchor:", &v38, 0.0);
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber untrimmedDuration](self, "untrimmedDuration");
  objc_msgSend(v30, "offsetInScrubberSpaceForTime:fallbackAnchor:", v37, 1.0);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  CGRectGetWidth(v53);
  PXClamp();
  v32 = v31;

  v33 = v32;
  v34 = y;
  v35 = width;
  v36 = height;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (void)setPlayheadStyle:(unint64_t)a3
{
  -[PXLivePhotoTrimScrubber setPlayheadStyle:animate:](self, "setPlayheadStyle:animate:", a3, 0);
}

- (void)setPlayheadStyle:(unint64_t)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  PXLivePhotoTrimScrubberLoupeView *photoLoupe;
  PXLivePhotoTrimScrubberLoupeView *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[9];
  _BYTE v19[24];

  v4 = a4;
  if (!-[PXLivePhotoTrimScrubber currentlyInteractingElement](self, "currentlyInteractingElement")
    && self->_playheadStyle != a3)
  {
    self->_playheadStyle = a3;
    switch(a3)
    {
      case 2uLL:
        -[PXLivePhotoTrimScrubber _setPhotoLoupeHidden:animated:](self, "_setPhotoLoupeHidden:animated:", 0, v4);
        photoLoupe = self->_photoLoupe;
        -[PXLivePhotoTrimScrubber keyTime](self, "keyTime");
        -[PXLivePhotoTrimScrubberLoupeView setShowLoupeThumbnailWithFrameTime:animate:](photoLoupe, "setShowLoupeThumbnailWithFrameTime:animate:", v19, v4);
        break;
      case 1uLL:
        -[PXLivePhotoTrimScrubber _setPhotoLoupeHidden:animated:](self, "_setPhotoLoupeHidden:animated:", 0, v4);
        v8 = self->_photoLoupe;
        -[PXLivePhotoTrimScrubber spec](self, "spec");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "playheadWidth");
        -[PXLivePhotoTrimScrubberLoupeView setShowNeedleWithWidth:animate:](v8, "setShowNeedleWithWidth:animate:", v4);

        break;
      case 0uLL:
        -[PXLivePhotoTrimScrubber _setPhotoLoupeHidden:animated:](self, "_setPhotoLoupeHidden:animated:", 1, v4);
        break;
    }
    -[PXLivePhotoTrimScrubber _keyHandleRect](self, "_keyHandleRect");
    v14 = v10;
    v15 = v11;
    v16 = v12;
    v17 = v13;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __52__PXLivePhotoTrimScrubber_setPlayheadStyle_animate___block_invoke;
      v18[3] = &unk_1E51490B0;
      v18[4] = self;
      *(double *)&v18[5] = v14;
      *(double *)&v18[6] = v15;
      *(double *)&v18[7] = v16;
      *(double *)&v18[8] = v17;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v18, 0);
    }
    else
    {
      -[PXLivePhotoTrimScrubberLoupeView setFrame:](self->_photoLoupe, "setFrame:", v10, v11, v12, v13);
      -[PXLivePhotoTrimScrubber setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setUseMiniScrubber:(BOOL)a3
{
  if (self->_useMiniScrubber != a3)
  {
    self->_useMiniScrubber = a3;
    -[PXLivePhotoTrimScrubber _updateTrimHandles](self, "_updateTrimHandles");
    -[PXLivePhotoTrimScrubber _updateSpecDependentUI](self, "_updateSpecDependentUI");
  }
}

- (void)_updateTrimHandles
{
  _BOOL8 v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;

  v3 = -[PXLivePhotoTrimScrubber useMiniScrubber](self, "useMiniScrubber");
  -[PXLivePhotoTrimScrubber spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseMiniScrubberHeight:", v3);

  if (self->_trimStartHandle && self->_trimEndHandle)
  {
    v5 = -[PXLivePhotoTrimScrubber useMiniScrubber](self, "useMiniScrubber");
    v6 = (void *)objc_opt_class();
    if (v5)
      objc_msgSend(v6, "trimStartImageMini");
    else
      objc_msgSend(v6, "trimStartImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXLivePhotoTrimScrubber useMiniScrubber](self, "useMiniScrubber");
    v9 = (void *)objc_opt_class();
    if (v8)
      objc_msgSend(v9, "trimStartHighlightedImageMini");
    else
      objc_msgSend(v9, "trimStartHighlightedImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_trimStartHandle, "setImage:", v7);
    -[UIImageView setHighlightedImage:](self->_trimStartHandle, "setHighlightedImage:", v10);
    v11 = -[PXLivePhotoTrimScrubber useMiniScrubber](self, "useMiniScrubber");
    v12 = (void *)objc_opt_class();
    if (v11)
      objc_msgSend(v12, "trimEndImageMini");
    else
      objc_msgSend(v12, "trimEndImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXLivePhotoTrimScrubber useMiniScrubber](self, "useMiniScrubber");
    v15 = (void *)objc_opt_class();
    if (v14)
      objc_msgSend(v15, "trimEndHighlightedImageMini");
    else
      objc_msgSend(v15, "trimEndHighlightedImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_trimEndHandle, "setImage:", v13);
    -[UIImageView setHighlightedImage:](self->_trimEndHandle, "setHighlightedImage:", v16);

  }
  -[PXLivePhotoTrimScrubber setNeedsLayout](self, "setNeedsLayout");
}

- (void)_animateChanges:(id)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, a3, 0);
}

- (void)performAnimatedChanges:(id)a3
{
  int64_t v4;
  _QWORD v5[5];

  ++self->_changeDepth;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  v4 = self->_changeDepth - 1;
  self->_changeDepth = v4;
  if (!v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__PXLivePhotoTrimScrubber_performAnimatedChanges___block_invoke;
    v5[3] = &unk_1E5149198;
    v5[4] = self;
    -[PXLivePhotoTrimScrubber _animateChanges:](self, "_animateChanges:", v5);
  }
}

- (int64_t)trimStatus
{
  -[PXLivePhotoTrimScrubber trimStartTime](self, "trimStartTime");
  -[PXLivePhotoTrimScrubber trimEndTime](self, "trimEndTime");
  -[PXLivePhotoTrimScrubber untrimmedDuration](self, "untrimmedDuration");
  -[PXLivePhotoTrimScrubber originalStartTime](self, "originalStartTime");
  -[PXLivePhotoTrimScrubber originalEndTime](self, "originalEndTime");
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForElement:(SEL)a3
{
  __int128 v5;
  int64_t v6;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  switch(a4)
  {
    case 1:
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE trimStartTime](self, "trimStartTime");
      goto LABEL_5;
    case 2:
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE trimEndTime](self, "trimEndTime");
      goto LABEL_5;
    case 3:
    case 4:
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE keyTime](self, "keyTime");
LABEL_5:
      *(_OWORD *)&retstr->var0 = v5;
      retstr->var3 = v6;
      break;
    default:
      return self;
  }
  return self;
}

- (double)horizontalOffsetForTime:(id *)a3
{
  void *v4;
  double v5;
  double v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  objc_msgSend(v4, "offsetInScrubberSpaceForTime:", &v8);
  v6 = v5;

  return v6;
}

- (BOOL)isAssetDurationLoaded
{
  return (self->_untrimmedDuration.flags & 0x1D) == 1;
}

- (CGRect)loupeRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PXLivePhotoTrimScrubberLoupeView frame](self->_photoLoupe, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v4;
  UIView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  UIView *v16;
  UIView *v17;
  UIView *v18;
  UIView *disabledOverlayView;
  UIView *v20;
  UIView *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  UIView *v25;
  _QWORD v26[4];
  UIView *v27;
  _QWORD v28[4];
  UIView *v29;

  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    v4 = !a3;
    -[PXLivePhotoTrimScrubber setUserInteractionEnabled:](self, "setUserInteractionEnabled:", !a3);
    if (v4)
    {
      disabledOverlayView = self->_disabledOverlayView;
      if (!disabledOverlayView)
        return;
      v20 = disabledOverlayView;
      v21 = self->_disabledOverlayView;
      self->_disabledOverlayView = 0;

      v22 = (void *)MEMORY[0x1E0DC3F10];
      v23 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke_2;
      v26[3] = &unk_1E5149198;
      v27 = v20;
      v24[0] = v23;
      v24[1] = 3221225472;
      v24[2] = __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke_3;
      v24[3] = &unk_1E5147360;
      v25 = v27;
      v5 = v27;
      objc_msgSend(v22, "animateWithDuration:animations:completion:", v26, v24, 0.25);

      v18 = v27;
    }
    else
    {
      -[PXLivePhotoTrimScrubber spec](self, "spec");
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[PXLivePhotoTrimScrubber _disabledOverlayFrame](self, "_disabledOverlayFrame");
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
      -[UIView disabledOverlayColor](v5, "disabledOverlayColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v11);

      objc_msgSend(v10, "setAlpha:", 0.0);
      -[UIView filmstripCornerRadius](v5, "filmstripCornerRadius");
      v13 = v12;
      objc_msgSend(v10, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCornerRadius:", v13);

      -[PXLivePhotoTrimScrubber addSubview:](self, "addSubview:", v10);
      v15 = (void *)MEMORY[0x1E0DC3F10];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke;
      v28[3] = &unk_1E5149198;
      v16 = v10;
      v29 = v16;
      objc_msgSend(v15, "animateWithDuration:animations:", v28, 0.25);
      v17 = self->_disabledOverlayView;
      self->_disabledOverlayView = v16;
      v18 = v16;

    }
  }
}

- (BOOL)tryZoomAtTime:(id *)a3
{
  _BOOL4 v5;
  __int128 v7;
  int64_t var3;

  v5 = -[PXLivePhotoTrimScrubber allowZoom](self, "allowZoom");
  if (v5)
  {
    if (-[PXLivePhotoTrimScrubber state](self, "state") == 1)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v7 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      -[PXLivePhotoTrimScrubber _zoomAtTime:](self, "_zoomAtTime:", &v7);
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)unzoom
{
  int64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = -[PXLivePhotoTrimScrubber state](self, "state");
  -[PXLivePhotoTrimScrubber setState:](self, "setState:", 0);
  if (v3 == 2)
  {
    -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilmstripScale:", 1.0);

    -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPivotAnchor:", 0.5);

    -[PXLivePhotoTrimScrubber impactOccured](self, "impactOccured");
    -[PXLivePhotoTrimScrubber setNeedsLayout](self, "setNeedsLayout");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__PXLivePhotoTrimScrubber_unzoom__block_invoke;
    v6[3] = &unk_1E5149198;
    v6[4] = self;
    -[PXLivePhotoTrimScrubber _animateChanges:](self, "_animateChanges:", v6);
  }
}

- (void)updateTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
  -[PXLivePhotoTrimScrubber _updateTrimHandles](self, "_updateTrimHandles");
}

- (void)_setupZoom
{
  if (-[PXLivePhotoTrimScrubber allowZoom](self, "allowZoom"))
  {
    if (!-[PXLivePhotoTrimScrubber state](self, "state"))
    {
      -[PXLivePhotoTrimScrubber performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__zoomDelayed, 0, 0.5);
      -[PXLivePhotoTrimScrubber setState:](self, "setState:", 1);
    }
  }
}

- (void)_updateZoomState:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;

  v3 = a3;
  if (-[PXLivePhotoTrimScrubber allowZoom](self, "allowZoom"))
  {
    v5 = -[PXLivePhotoTrimScrubber state](self, "state");
    if (v3)
    {
      if (v5 == 1)
      {
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__zoomDelayed, 0);
        -[PXLivePhotoTrimScrubber performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__zoomDelayed, 0, 0.5);
      }
    }
    else if (v5 == 1 || -[PXLivePhotoTrimScrubber state](self, "state") == 2)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__zoomDelayed, 0);
      -[PXLivePhotoTrimScrubber unzoom](self, "unzoom");
    }
  }
}

- (void)_zoomDelayed
{
  if (-[PXLivePhotoTrimScrubber allowZoom](self, "allowZoom"))
  {
    if (-[PXLivePhotoTrimScrubber state](self, "state") == 1)
      -[PXLivePhotoTrimScrubber _zoomAtTrackedElement](self, "_zoomAtTrackedElement");
  }
}

- (void)_zoomAtTrackedElement
{
  int64_t v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v3 = -[PXLivePhotoTrimScrubber _trackingElement](self, "_trackingElement");
  if (v3)
  {
    v6 = 0uLL;
    v7 = 0;
    -[PXLivePhotoTrimScrubber timeForElement:](self, "timeForElement:", v3);
    v4 = v6;
    v5 = v7;
    -[PXLivePhotoTrimScrubber _zoomAtTime:](self, "_zoomAtTime:", &v4);
  }
}

- (void)_zoomAtTime:(id *)a3
{
  void *v5;
  double Seconds;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  _QWORD v11[5];
  CMTime v12;
  CMTime time;

  -[PXLivePhotoTrimScrubber setState:](self, "setState:", 2);
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilmstripScale:", 5.0);

  time = *(CMTime *)a3;
  Seconds = CMTimeGetSeconds(&time);
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "duration");
  else
    memset(&v12, 0, sizeof(v12));
  v9 = Seconds / CMTimeGetSeconds(&v12);
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPivotAnchor:", v9);

  -[PXLivePhotoTrimScrubber impactOccured](self, "impactOccured");
  -[PXLivePhotoTrimScrubber setNeedsLayout](self, "setNeedsLayout");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__PXLivePhotoTrimScrubber__zoomAtTime___block_invoke;
  v11[3] = &unk_1E5149198;
  v11[4] = self;
  -[PXLivePhotoTrimScrubber _animateChanges:](self, "_animateChanges:", v11);
}

- (void)_PXLivePhotoTrimScrubber_commonInit
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  int64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIView *v12;
  UIView *filmstripContainerView;
  PXLivePhotoTrimScrubberFilmStripView *v14;
  PXLivePhotoTrimScrubberFilmStripView *filmstripView;
  UIView *v16;
  UIView *preTrimOverlayView;
  void *v18;
  UIView *v19;
  UIView *postTrimOverlayView;
  void *v21;
  void *v22;
  void *v23;
  UIImageView *v24;
  UIImageView *trimStartHandle;
  void *v26;
  void *v27;
  UIImageView *v28;
  UIImageView *trimEndHandle;
  PXLivePhotoTrimScrubberLoupeView *v30;
  PXLivePhotoTrimScrubberLoupeView *photoLoupe;
  PXLivePhotoTrimScrubberHiddenAnimationHelper *v32;
  uint64_t v33;
  PXLivePhotoTrimScrubberHiddenAnimationHelper *v34;
  PXLivePhotoTrimScrubberHiddenAnimationHelper *loupeHiddenHelper;
  PXLivePhotoTrimScrubberHiddenAnimationHelper *v36;
  PXLivePhotoTrimScrubberHiddenAnimationHelper *v37;
  PXLivePhotoTrimScrubberHiddenAnimationHelper *trimControlHiddenHelper;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, int);
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  CMTime v46;

  -[PXLivePhotoTrimScrubber setClipsToBounds:](self, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber setBackgroundColor:](self, "setBackgroundColor:", v3);

  self->_state = 0;
  self->__contentAspectRatio = 1.0;
  CMTimeMake(&v46, 1, 2);
  self->_minimumTrimLength = ($95D729B680665BEAEFA1D6FCA8238556)v46;
  CMTimeMake(&v46, 1, 240);
  *(CMTime *)(&self->_hasPresentedControls + 4) = v46;
  v4 = MEMORY[0x1E0CA2E18];
  v5 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&self->_keyTime.value = *MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(v4 + 16);
  self->_keyTime.epoch = v6;
  *(_OWORD *)&self->_trimStartTime.value = v5;
  self->_trimStartTime.epoch = v6;
  *(_OWORD *)&self->_trimEndTime.value = v5;
  self->_trimEndTime.epoch = v6;
  self->_playheadStyle = 2;
  v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
  filmstripContainerView = self->_filmstripContainerView;
  self->_filmstripContainerView = v12;

  -[PXLivePhotoTrimScrubber addSubview:](self, "addSubview:", self->_filmstripContainerView);
  v14 = (PXLivePhotoTrimScrubberFilmStripView *)objc_msgSend(objc_alloc(-[PXLivePhotoTrimScrubber filmStripViewClass](self, "filmStripViewClass")), "initWithFrame:", v8, v9, v10, v11);
  filmstripView = self->_filmstripView;
  self->_filmstripView = v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PXLivePhotoTrimScrubberFilmStripView setUseContentAspectRatio:](self->_filmstripView, "setUseContentAspectRatio:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PXLivePhotoTrimScrubberFilmStripView setUserInteractionEnabled:](self->_filmstripView, "setUserInteractionEnabled:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PXLivePhotoTrimScrubberFilmStripView setPreserveThumbnailsDuringReload:](self->_filmstripView, "setPreserveThumbnailsDuringReload:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PXLivePhotoTrimScrubberFilmStripView setGeneratesPlaceholderImage:](self->_filmstripView, "setGeneratesPlaceholderImage:", 1);
  -[UIView addSubview:](self->_filmstripContainerView, "addSubview:", self->_filmstripView);
  v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
  preTrimOverlayView = self->_preTrimOverlayView;
  self->_preTrimOverlayView = v16;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_preTrimOverlayView, "setBackgroundColor:", v18);

  -[UIView addSubview:](self->_filmstripContainerView, "addSubview:", self->_preTrimOverlayView);
  v19 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
  postTrimOverlayView = self->_postTrimOverlayView;
  self->_postTrimOverlayView = v19;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_postTrimOverlayView, "setBackgroundColor:", v21);

  -[UIView addSubview:](self->_filmstripContainerView, "addSubview:", self->_postTrimOverlayView);
  objc_msgSend((id)objc_opt_class(), "trimStartImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "trimStartHighlightedImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:highlightedImage:", v22, v23);
  trimStartHandle = self->_trimStartHandle;
  self->_trimStartHandle = v24;

  -[UIImageView setContentMode:](self->_trimStartHandle, "setContentMode:", 0);
  -[PXLivePhotoTrimScrubber addSubview:](self, "addSubview:", self->_trimStartHandle);
  objc_msgSend((id)objc_opt_class(), "trimEndImage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "trimEndHighlightedImage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:highlightedImage:", v26, v27);
  trimEndHandle = self->_trimEndHandle;
  self->_trimEndHandle = v28;

  -[UIImageView setContentMode:](self->_trimEndHandle, "setContentMode:", 0);
  -[PXLivePhotoTrimScrubber addSubview:](self, "addSubview:", self->_trimEndHandle);
  v30 = -[PXLivePhotoTrimScrubberLoupeView initWithFrame:forceDarkUserInterfaceStyle:]([PXLivePhotoTrimScrubberLoupeView alloc], "initWithFrame:forceDarkUserInterfaceStyle:", self->_traitCollection == 0, v8, v9, v10, v11);
  photoLoupe = self->_photoLoupe;
  self->_photoLoupe = v30;

  -[PXLivePhotoTrimScrubber addSubview:](self, "addSubview:", self->_photoLoupe);
  -[PXLivePhotoTrimScrubber setNeedsLayout](self, "setNeedsLayout");
  objc_initWeak((id *)&v46, self);
  v32 = [PXLivePhotoTrimScrubberHiddenAnimationHelper alloc];
  v33 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __62__PXLivePhotoTrimScrubber__PXLivePhotoTrimScrubber_commonInit__block_invoke;
  v44[3] = &unk_1E5142510;
  objc_copyWeak(&v45, (id *)&v46);
  v34 = -[PXLivePhotoTrimScrubberHiddenAnimationHelper initWithAnimationBlock:](v32, "initWithAnimationBlock:", v44);
  loupeHiddenHelper = self->_loupeHiddenHelper;
  self->_loupeHiddenHelper = v34;

  v36 = [PXLivePhotoTrimScrubberHiddenAnimationHelper alloc];
  v39 = v33;
  v40 = 3221225472;
  v41 = __62__PXLivePhotoTrimScrubber__PXLivePhotoTrimScrubber_commonInit__block_invoke_2;
  v42 = &unk_1E5142510;
  objc_copyWeak(&v43, (id *)&v46);
  v37 = -[PXLivePhotoTrimScrubberHiddenAnimationHelper initWithAnimationBlock:](v36, "initWithAnimationBlock:", &v39);
  trimControlHiddenHelper = self->_trimControlHiddenHelper;
  self->_trimControlHiddenHelper = v37;

  -[PXLivePhotoTrimScrubber _updateSpecDependentUI](self, "_updateSpecDependentUI", v39, v40, v41, v42);
  -[PXLivePhotoTrimScrubber _setPhotoLoupeHidden:animated:](self, "_setPhotoLoupeHidden:animated:", 1, 0);
  -[PXLivePhotoTrimScrubber _setTrimControlsHidden:animated:](self, "_setTrimControlsHidden:animated:", 1, 0);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)&v46);

}

- (void)_updateSpecDependentUI
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[PXLivePhotoTrimScrubber invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[PXLivePhotoTrimScrubberSpec filmstripCornerRadius](self->_spec, "filmstripCornerRadius");
  v4 = v3;
  -[UIView layer](self->_filmstripContainerView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  -[PXLivePhotoTrimScrubberSpec loupeOuterCornerRadius](self->_spec, "loupeOuterCornerRadius");
  -[PXLivePhotoTrimScrubberLoupeView setOuterCornerRadius:](self->_photoLoupe, "setOuterCornerRadius:");
  -[PXLivePhotoTrimScrubberSpec loupeInnerCornerRadius](self->_spec, "loupeInnerCornerRadius");
  -[PXLivePhotoTrimScrubberLoupeView setInnerCornerRadius:](self->_photoLoupe, "setInnerCornerRadius:");
  -[PXLivePhotoTrimScrubberSpec loupeVerticalInset](self->_spec, "loupeVerticalInset");
  -[PXLivePhotoTrimScrubberLoupeView setVerticalInset:](self->_photoLoupe, "setVerticalInset:");
  -[PXLivePhotoTrimScrubberSpec filmstripBorderColor](self->_spec, "filmstripBorderColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXLivePhotoTrimScrubberSpec filmstripBorderColor](self->_spec, "filmstripBorderColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    -[UIView layer](self->_filmstripContainerView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBorderColor:", v8);

    -[UIView layer](self->_filmstripContainerView, "layer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderWidth:", 1.0);

  }
}

- (void)setShowVideoScrubberDebugOverlay:(BOOL)a3
{
  UIView *v4;
  UIView *debugStartTimeView;
  void *v6;
  UIView *v7;
  UIView *debugLoupeTimeView;
  void *v9;
  UIView *v10;
  UIView *debugEndTimeView;
  void *v12;
  UIView *v13;
  UIView *v14;
  UIView *v15;

  if (self->_showVideoScrubberDebugOverlay != a3)
  {
    self->_showVideoScrubberDebugOverlay = a3;
    if (a3)
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      debugStartTimeView = self->_debugStartTimeView;
      self->_debugStartTimeView = v4;

      -[UIView setUserInteractionEnabled:](self->_debugStartTimeView, "setUserInteractionEnabled:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_debugStartTimeView, "setBackgroundColor:", v6);

      -[PXLivePhotoTrimScrubber addSubview:](self, "addSubview:", self->_debugStartTimeView);
      v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      debugLoupeTimeView = self->_debugLoupeTimeView;
      self->_debugLoupeTimeView = v7;

      -[UIView setUserInteractionEnabled:](self->_debugLoupeTimeView, "setUserInteractionEnabled:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_debugLoupeTimeView, "setBackgroundColor:", v9);

      -[PXLivePhotoTrimScrubber addSubview:](self, "addSubview:", self->_debugLoupeTimeView);
      v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      debugEndTimeView = self->_debugEndTimeView;
      self->_debugEndTimeView = v10;

      -[UIView setUserInteractionEnabled:](self->_debugEndTimeView, "setUserInteractionEnabled:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_debugEndTimeView, "setBackgroundColor:", v12);

      -[PXLivePhotoTrimScrubber addSubview:](self, "addSubview:", self->_debugEndTimeView);
    }
    else
    {
      -[UIView removeFromSuperview](self->_debugStartTimeView, "removeFromSuperview");
      v13 = self->_debugStartTimeView;
      self->_debugStartTimeView = 0;

      -[UIView removeFromSuperview](self->_debugLoupeTimeView, "removeFromSuperview");
      v14 = self->_debugLoupeTimeView;
      self->_debugLoupeTimeView = 0;

      -[UIView removeFromSuperview](self->_debugEndTimeView, "removeFromSuperview");
      v15 = self->_debugEndTimeView;
      self->_debugEndTimeView = 0;

    }
  }
}

- (double)_offsetForTime:(id *)a3
{
  double v5;
  CMTime *v6;
  CMTimeEpoch epoch;
  double Width;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double Seconds;
  CMTime v17;
  CMTime time2;
  CMTime time1;
  CMTime v20;
  CGRect v21;

  memset(&v20, 0, sizeof(v20));
  -[PXLivePhotoTrimScrubber untrimmedDuration](self, "untrimmedDuration");
  v5 = 0.0;
  if ((unsigned __int128)0 >> 96 == 1 && (a3->var2 & 0x1D) == 1)
  {
    time1 = v20;
    v6 = (CMTime *)MEMORY[0x1E0CA2E68];
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (CMTimeCompare(&time1, &time2) >= 1)
    {
      time2 = (CMTime)*a3;
      v17 = v20;
      CMTimeMinimum(&time1, &time2, &v17);
      epoch = time1.epoch;
      *(CMTime *)a3 = time1;
      *(_OWORD *)&time2.value = *(_OWORD *)&a3->var0;
      time2.epoch = epoch;
      v17 = *v6;
      CMTimeMaximum(&time1, &time2, &v17);
      *(CMTime *)a3 = time1;
      -[PXLivePhotoTrimScrubber bounds](self, "bounds");
      Width = CGRectGetWidth(v21);
      -[PXLivePhotoTrimScrubber horizontalInset](self, "horizontalInset");
      v10 = v9;
      -[PXLivePhotoTrimScrubber spec](self, "spec");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleWidth");
      v13 = v10 + v12;
      v14 = Width + v13 * -2.0;
      time1 = (CMTime)*a3;
      Seconds = CMTimeGetSeconds(&time1);
      time1 = v20;
      v5 = v13 + Seconds / CMTimeGetSeconds(&time1) * v14;

    }
  }
  return v5;
}

- (double)offsetForTime:(id *)a3
{
  void *v4;
  double v5;
  double v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  objc_msgSend(v4, "offsetInScrubberSpaceForTime:", &v8);
  v6 = v5;

  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtPoint:(SEL)a3
{
  double x;
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v8;

  x = a4.x;
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper", a4.x, a4.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "timeForOffsetInScrubberSpace:", x);
    v6 = v8;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeAtLocation:(SEL)a3 forElement:(CGPoint)a4
{
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v16;

  y = a4.y;
  x = a4.x;
  -[PXLivePhotoTrimScrubber spec](self, "spec");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleWidth");
  v11 = v10;
  objc_msgSend(v16, "handleAnchorX");
  v13 = v11 * (1.0 - v12);
  if (a5 == 2)
  {
    v14 = -v13;
  }
  else
  {
    v14 = 0.0;
    if (a5 == 1)
      v14 = v13;
  }
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  -[PXLivePhotoTrimScrubber timeAtPoint:](self, "timeAtPoint:", x + v14, y);

  return result;
}

- (void)handleSetKeyTime:(id *)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  __int128 v8;
  int64_t var3;
  CMTime time2;
  CMTime time1;

  if (-[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle") == 2)
  {
    if (self->_delegateFlags.respondsToDidBeginInteractivelyEditingElement)
    {
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trimScrubber:didBeginInteractivelyEditingElement:", self, 3);

    }
    -[PXLivePhotoTrimScrubber _setTrackingElement:](self, "_setTrackingElement:", 3);
    time1 = (CMTime)self->_trimStartTime;
    time2 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      time1 = (CMTime)self->_trimEndTime;
      time2 = (CMTime)*a3;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __44__PXLivePhotoTrimScrubber_handleSetKeyTime___block_invoke;
        v7[3] = &unk_1E51446C8;
        v7[4] = self;
        v8 = *(_OWORD *)&a3->var0;
        var3 = a3->var3;
        -[PXLivePhotoTrimScrubber performAnimatedChanges:](self, "performAnimatedChanges:", v7);
      }
    }
    -[PXLivePhotoTrimScrubber _setTrackingElement:](self, "_setTrackingElement:", 0);
    if (self->_delegateFlags.respondsToDidEndInteractivelyEditingElement)
    {
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trimScrubber:didEndInteractivelyEditingElement:successful:", self, 3, 1);

    }
  }
}

- (void)handleTapWithElement:(int64_t)a3
{
  id v5;

  if (self->_delegateFlags.respondsToDidBeginInteractivelyEditingElement)
  {
    -[PXLivePhotoTrimScrubber delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trimScrubber:didTapElement:", self, a3);

  }
}

- (void)handleLongPressWithElement:(int64_t)a3
{
  _BOOL4 v5;
  void *v6;
  _BYTE v7[24];

  v5 = -[PXLivePhotoTrimScrubber allowZoom](self, "allowZoom");
  if (a3 == 4 && v5)
  {
    if (self->_delegateFlags.respondsToPausePlayer)
    {
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trimScrubberPausePlayer:", self);

    }
    -[PXLivePhotoTrimScrubber keyTime](self, "keyTime");
    -[PXLivePhotoTrimScrubber _zoomAtTime:](self, "_zoomAtTime:", v7);
  }
}

- (void)_setTrackingElement:(int64_t)a3
{
  if (self->__trackingElement != a3)
  {
    self->__trackingElement = a3;
    if (a3 == 3)
      -[PXLivePhotoTrimScrubberLoupeView setShowLoupePlayerAnimate:](self->_photoLoupe, "setShowLoupePlayerAnimate:", 0);
  }
}

- (void)handleBeginTrackingAtLocation:(CGPoint)a3
{
  double y;
  double x;
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
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  BOOL v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  _QWORD v34[6];
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;

  y = a3.y;
  x = a3.x;
  v44 = *MEMORY[0x1E0C80C00];
  -[PXLivePhotoTrimScrubber spec](self, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleWidth");
  v8 = v7;
  objc_msgSend(v6, "handleAnchorX");
  v10 = v8 * v9;
  objc_msgSend(v6, "handleTouchDistance");
  v12 = v11;
  -[PXLivePhotoTrimScrubberLoupeView center](self->_photoLoupe, "center");
  v14 = vabdd_f64(x, v13);
  -[UIImageView frame](self->_trimStartHandle, "frame");
  v15 = vabdd_f64(x, v10 + CGRectGetMinX(v45));
  -[UIImageView frame](self->_trimEndHandle, "frame");
  v16 = vabdd_f64(x, CGRectGetMaxX(v46) - v10);
  if (-[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle") == 2 && v14 < v12)
    v17 = 3;
  else
    v17 = 0;
  v24 = -[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle") != 1 || v14 >= v12;
  v18 = 4;
  if (v24)
    v18 = v17;
  v19 = v16 < v12;
  if (v16 >= v15)
    v19 = 0;
  v20 = v16 < v14;
  if (v15 < v12 && v15 < v14)
    v18 = 1;
  if (v19 && v20)
    v21 = 2;
  else
    v21 = v18;
  -[PXLivePhotoTrimScrubber _setPhotoLoupeHidden:animated:](self, "_setPhotoLoupeHidden:animated:", (v19 && v20) | (v15 < v12 && v15 < v14), 1);
  v22 = 0;
  if (-[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle") == 2 && !v21)
  {
    v22 = objc_msgSend(v6, "fallbackToKeyTimeTracking");
    if (v22)
      v21 = 3;
    else
      v21 = 0;
  }
  v23 = -[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle");
  if (v21)
    v24 = 0;
  else
    v24 = v23 == 1;
  if (v24)
  {
    v25 = objc_msgSend(v6, "fallbackToPlayheadTracking");
    if (v25)
      v21 = 4;
    else
      v21 = 0;
  }
  else
  {
    v25 = 0;
  }
  if (!self->_delegateFlags.respondsToCanBeginInteractivelyEditingElement
    || (-[PXLivePhotoTrimScrubber delegate](self, "delegate"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend(v26, "trimScrubber:canBeginInteractivelyEditingElement:", self, v21),
        v26,
        v27))
  {
    -[PXLivePhotoTrimScrubber _setTrackingElement:](self, "_setTrackingElement:", v21);
    -[PXLivePhotoTrimScrubber _snappingControllersForElement:](self, "_snappingControllersForElement:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v40 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "interactionBegan");
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v30);
    }
    if ((v22 | v25) == 1)
    {
      v37 = 0uLL;
      v38 = 0;
      -[PXLivePhotoTrimScrubber _timeAtLocation:forElement:](self, "_timeAtLocation:forElement:", v21, x, y);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __57__PXLivePhotoTrimScrubber_handleBeginTrackingAtLocation___block_invoke;
      v34[3] = &unk_1E51490B0;
      v35 = v37;
      v36 = v38;
      v34[4] = self;
      v34[5] = v21;
      -[PXLivePhotoTrimScrubber _animateChanges:](self, "_animateChanges:", v34);
    }
    if (v21 && self->_delegateFlags.respondsToDidBeginInteractivelyEditingElement)
    {
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "trimScrubber:didBeginInteractivelyEditingElement:", self, v21);

    }
    -[PXLivePhotoTrimScrubber _setupZoom](self, "_setupZoom");
    -[PXLivePhotoTrimScrubber prepareForImpact](self, "prepareForImpact");

  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)viewportMinTime
{
  void *v5;
  double MinX;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v8;
  CGRect v9;

  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewportFrame");
  MinX = CGRectGetMinX(v9);
  if (v8)
  {
    objc_msgSend(v8, "timeForOffsetInScrubberSpace:", MinX);
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)viewportMaxTime
{
  void *v5;
  double MaxX;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v8;
  CGRect v9;

  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewportFrame");
  MaxX = CGRectGetMaxX(v9);
  if (v8)
  {
    objc_msgSend(v8, "timeForOffsetInScrubberSpace:", MaxX);
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampTimeToViewportIfZoomed:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v8;
  CMTimeRange v9;
  CMTime time;
  CMTime v11;
  CMTime end;
  CMTime start;
  CMTimeRange v14;

  *retstr = *a4;
  result = -[PXLivePhotoTrimScrubber state](self, "state");
  if (result == ($3CC8671D27C23BF42ADDB32F2B5E48AE *)2)
  {
    memset(&v14, 0, sizeof(v14));
    -[PXLivePhotoTrimScrubber viewportMinTime](self, "viewportMinTime");
    -[PXLivePhotoTrimScrubber viewportMaxTime](self, "viewportMaxTime");
    CMTimeRangeFromTimeToTime(&v14, &start, &end);
    v8 = *(_OWORD *)&a4->var0;
    time.epoch = a4->var3;
    v9 = v14;
    *(_OWORD *)&time.value = v8;
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeClampToRange(&v11, &time, &v9);
    *(CMTime *)retstr = v11;
  }
  return result;
}

- (void)handleChangeTrackingAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  CGFloat x;
  double y;
  double v6;
  int64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  CMTime *p_time;
  CGFloat v21;
  CMTime time;
  void *v23;
  CMTime v24;
  _QWORD v25[3];
  Float64 Seconds;
  CMTime v27;

  x = a4.x;
  y = a3.y;
  v6 = a3.x;
  v8 = -[PXLivePhotoTrimScrubber _trackingElement](self, "_trackingElement", a3.x, a3.y, a4.x, a4.y);
  memset(&v27, 0, sizeof(v27));
  -[PXLivePhotoTrimScrubber _timeAtLocation:forElement:](self, "_timeAtLocation:forElement:", v8, v6, y);
  -[PXLivePhotoTrimScrubber _snappingControllersForElement:](self, "_snappingControllersForElement:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber _snapTimesForElement:](self, "_snapTimesForElement:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  Seconds = 0.0;
  time = v27;
  Seconds = CMTimeGetSeconds(&time);
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v23 = &unk_1A7E74EE7;
  v24 = v27;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__PXLivePhotoTrimScrubber_handleChangeTrackingAtLocation_withVelocity___block_invoke;
  v17[3] = &unk_1E5141180;
  v19 = v25;
  v21 = x;
  v11 = v10;
  v18 = v11;
  p_time = &time;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v17);
  v13 = *(_OWORD *)(*(_QWORD *)&time.timescale + 32);
  v14 = *(_QWORD *)(*(_QWORD *)&time.timescale + 48);
  -[PXLivePhotoTrimScrubber _clampTimeToViewportIfZoomed:](self, "_clampTimeToViewportIfZoomed:", &v13);
  v12 = *(_QWORD *)&time.timescale;
  *(_OWORD *)(*(_QWORD *)&time.timescale + 32) = v15;
  *(_QWORD *)(v12 + 48) = v16;
  switch(v8)
  {
    case 1:
      v13 = v15;
      v14 = v16;
      -[PXLivePhotoTrimScrubber setTrimStartTime:](self, "setTrimStartTime:", &v13);
      break;
    case 2:
      v13 = v15;
      v14 = v16;
      -[PXLivePhotoTrimScrubber setTrimEndTime:](self, "setTrimEndTime:", &v13);
      break;
    case 3:
      v13 = v15;
      v14 = v16;
      -[PXLivePhotoTrimScrubber _setKeyTime:canHaveImpact:forElement:](self, "_setKeyTime:canHaveImpact:forElement:", &v13, 1, 3);
      break;
    case 4:
      v13 = v15;
      v14 = v16;
      -[PXLivePhotoTrimScrubber _setKeyTime:canHaveImpact:forElement:](self, "_setKeyTime:canHaveImpact:forElement:", &v13, 1, 4);
      break;
    default:
      break;
  }

  _Block_object_dispose(&time, 8);
  _Block_object_dispose(v25, 8);

}

- (void)handleEndTracking:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  PXLivePhotoTrimScrubberLoupeView *photoLoupe;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[24];
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[PXLivePhotoTrimScrubber _trackingElement](self, "_trackingElement");
  -[PXLivePhotoTrimScrubber _setTrackingElement:](self, "_setTrackingElement:", 0);
  if (v5)
  {
    if (v5 == 3)
    {
      photoLoupe = self->_photoLoupe;
      -[PXLivePhotoTrimScrubber keyTime](self, "keyTime");
      -[PXLivePhotoTrimScrubberLoupeView setShowLoupeThumbnailWithFrameTime:animate:](photoLoupe, "setShowLoupeThumbnailWithFrameTime:animate:", v17, 1);
    }
    if (self->_delegateFlags.respondsToDidEndInteractivelyEditingElement)
    {
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "trimScrubber:didEndInteractivelyEditingElement:successful:", self, v5, v3);

    }
  }
  -[PXLivePhotoTrimScrubber _snappingControllersForElement:](self, "_snappingControllersForElement:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "interactionEnded");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }
  -[PXLivePhotoTrimScrubber _updateZoomState:](self, "_updateZoomState:", 0);
  if (-[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle"))
    -[PXLivePhotoTrimScrubber _setPhotoLoupeHidden:animated:](self, "_setPhotoLoupeHidden:animated:", 0, 1);

}

- (void)_assetDidLoadValues
{
  void *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  -[PXLivePhotoTrimScrubber asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v7 = 0uLL;
  v8 = 0;
  if (v3)
    objc_msgSend(v3, "duration");
  v5 = v7;
  v6 = v8;
  -[PXLivePhotoTrimScrubber _setUntrimmedDuration:](self, "_setUntrimmedDuration:", &v5);
  -[PXLivePhotoTrimScrubber _updateContentAspectRatio](self, "_updateContentAspectRatio");

}

- (void)_setUntrimmedDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_untrimmedDuration;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  int64_t v10;
  __int128 v11;
  int64_t var3;
  CMTime time2;
  CMTime time1;

  p_untrimmedDuration = &self->_untrimmedDuration;
  time1 = *(CMTime *)a3;
  time2 = (CMTime)self->_untrimmedDuration;
  if (CMTimeCompare(&time1, &time2))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_untrimmedDuration->epoch = a3->var3;
    *(_OWORD *)&p_untrimmedDuration->value = v6;
    v11 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[PXLivePhotoTrimScrubber layoutHelper](self, "layoutHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    v10 = var3;
    objc_msgSend(v7, "setDuration:", &v9);

    if ((a3->var2 & 1) == 0)
    {
      -[PXLivePhotoTrimScrubber _setPhotoLoupeHidden:animated:](self, "_setPhotoLoupeHidden:animated:", 1, 0);
      -[PXLivePhotoTrimScrubber _setTrimControlsHidden:animated:](self, "_setTrimControlsHidden:animated:", 1, 0);
      self->_hasPresentedControls = 0;
    }
    -[PXLivePhotoTrimScrubber setNeedsLayout](self, "setNeedsLayout");
    if (self->_delegateFlags.respondsToAssetDurationDidChange)
    {
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trimScrubberAssetDurationDidChange:", self);

    }
    -[PXLivePhotoTrimScrubber _presentControlsIfNeeded](self, "_presentControlsIfNeeded");
  }
}

- (void)_updateContentAspectRatio
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  _OWORD v25[3];
  CGRect v26;
  CGRect v27;

  -[PXLivePhotoTrimScrubber videoComposition](self, "videoComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v3, "renderSize");
    v8 = v6 / v7;
    v9 = v7 == 0.0;
LABEL_3:
    if (v9)
      v10 = 1.0;
    else
      v10 = v8;
    goto LABEL_17;
  }
  objc_msgSend(v4, "tracks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[PXLivePhotoTrimScrubber placeholderImage](self, "placeholderImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v10 = 1.0;
      goto LABEL_17;
    }
    -[PXLivePhotoTrimScrubber placeholderImage](self, "placeholderImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v21 = v20;
    v23 = v22;

    v8 = v21 / v23;
    v9 = v23 == 0.0;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "naturalSize");
    v15 = v14;
    v17 = v16;
    memset(v25, 0, sizeof(v25));
    objc_msgSend(v13, "preferredTransform");
    v26.size.width = v17 * 0.0 + 0.0 * v15;
    v26.size.height = v26.size.width;
    v26.origin.x = 0.0;
    v26.origin.y = 0.0;
    v27 = CGRectStandardize(v26);
    if (v27.size.height == 0.0)
      v10 = 1.0;
    else
      v10 = v27.size.width / v27.size.height;
  }
  else
  {
    PLPhotoEditGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEFAULT, "Did not find a video track falling back to 1.0 aspectRatio", (uint8_t *)v25, 2u);
    }

    v10 = 1.0;
  }

LABEL_17:
  -[PXLivePhotoTrimScrubber _setContentAspectRatio:](self, "_setContentAspectRatio:", v10);

}

- (void)_setContentAspectRatio:(double)a3
{
  double v5;

  if (self->__contentAspectRatio != a3
    || (-[PXLivePhotoTrimScrubberLoupeView aspectRatio](self->_photoLoupe, "aspectRatio"), v5 != a3))
  {
    self->__contentAspectRatio = a3;
    -[PXLivePhotoTrimScrubberLoupeView setAspectRatio:](self->_photoLoupe, "setAspectRatio:", a3);
    -[PXLivePhotoTrimScrubber setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateKeyTimeSnappingControllers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSArray *v7;
  NSArray *keyTimeSnappingControllers;
  _BYTE v9[48];

  -[PXLivePhotoTrimScrubber snapKeyTimes](self, "snapKeyTimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber suggestedKeyTime](self, "suggestedKeyTime");
  if ((v9[36] & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB3B18];
    -[PXLivePhotoTrimScrubber suggestedKeyTime](self, "suggestedKeyTime");
    objc_msgSend(v4, "valueWithCMTime:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObject:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  objc_msgSend((id)objc_opt_class(), "_createSnappingControllersForKeytimes:", v3);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  keyTimeSnappingControllers = self->_keyTimeSnappingControllers;
  self->_keyTimeSnappingControllers = v7;

}

- (void)_updateStartTimeSnappingControllers
{
  NSArray *v3;
  NSArray *startTimeSnappingControllers;
  id v5;

  -[PXLivePhotoTrimScrubber snapTrimStartTimes](self, "snapTrimStartTimes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_createSnappingControllersForKeytimes:", v5);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  startTimeSnappingControllers = self->_startTimeSnappingControllers;
  self->_startTimeSnappingControllers = v3;

}

- (void)_updateEndTimeSnappingControllers
{
  NSArray *v3;
  NSArray *endTimeSnappingControllers;
  id v5;

  -[PXLivePhotoTrimScrubber snapTrimEndTimes](self, "snapTrimEndTimes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_createSnappingControllersForKeytimes:", v5);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  endTimeSnappingControllers = self->_endTimeSnappingControllers;
  self->_endTimeSnappingControllers = v3;

}

- (void)_updateFocusEventSnappingControllers
{
  NSArray *v3;
  NSArray *focusEventSnappingControllers;
  NSArray *v5;

  v5 = self->_focusEventTimes;
  objc_msgSend((id)objc_opt_class(), "_createSnappingControllersForKeytimes:", v5);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  focusEventSnappingControllers = self->_focusEventSnappingControllers;
  self->_focusEventSnappingControllers = v3;

}

- (id)_snappingControllersForElement:(int64_t)a3
{
  uint64_t v4;
  id v5;

  if ((unint64_t)(a3 - 3) < 2)
  {
    v5 = (id)objc_opt_new();
    objc_msgSend(v5, "addObjectsFromArray:", self->_keyTimeSnappingControllers);
    objc_msgSend(v5, "addObjectsFromArray:", self->_focusEventSnappingControllers);
  }
  else
  {
    if (a3 == 1)
    {
      v4 = 472;
    }
    else
    {
      if (a3 != 2)
      {
        v5 = 0;
        return v5;
      }
      v4 = 480;
    }
    v5 = *(id *)((char *)&self->super.super.super.isa + v4);
  }
  return v5;
}

- (id)_snapTimesForElement:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE v10[48];

  if ((unint64_t)(a3 - 3) < 2)
  {
    v5 = (void *)objc_opt_new();
    -[PXLivePhotoTrimScrubber snapKeyTimes](self, "snapKeyTimes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    -[PXLivePhotoTrimScrubber suggestedKeyTime](self, "suggestedKeyTime");
    if ((v10[36] & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1E0CB3B18];
      -[PXLivePhotoTrimScrubber suggestedKeyTime](self, "suggestedKeyTime");
      objc_msgSend(v7, "valueWithCMTime:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
    objc_msgSend(v5, "addObjectsFromArray:", self->_focusEventTimes);
  }
  else
  {
    if (a3 == 1)
    {
      -[PXLivePhotoTrimScrubber snapTrimStartTimes](self, "snapTrimStartTimes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    if (a3 == 2)
    {
      -[PXLivePhotoTrimScrubber snapTrimEndTimes](self, "snapTrimEndTimes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    v5 = 0;
  }
  return v5;
}

- (void)_setPhotoLoupeHidden:(BOOL)a3 animated:(BOOL)a4
{
  -[PXLivePhotoTrimScrubberHiddenAnimationHelper setHidden:animated:](self->_loupeHiddenHelper, "setHidden:animated:", a3, a4);
}

- (void)_setTrimControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  -[PXLivePhotoTrimScrubberHiddenAnimationHelper setHidden:animated:](self->_trimControlHiddenHelper, "setHidden:animated:", a3, a4);
}

- (void)_presentControlsIfNeeded
{
  char v3;
  char v4;

  if (!self->_hasPresentedControls)
  {
    -[PXLivePhotoTrimScrubber untrimmedDuration](self, "untrimmedDuration");
    if ((v4 & 1) != 0)
    {
      -[PXLivePhotoTrimScrubber keyTime](self, "keyTime");
      if ((v3 & 1) != 0)
      {
        self->_hasPresentedControls = 1;
        -[PXLivePhotoTrimScrubber layoutIfNeeded](self, "layoutIfNeeded");
        if (-[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle"))
          -[PXLivePhotoTrimScrubber _setPhotoLoupeHidden:animated:](self, "_setPhotoLoupeHidden:animated:", 0, 1);
      }
    }
  }
}

- (CGRect)_disabledOverlayFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;
  CGRect v39;

  -[PXLivePhotoTrimScrubber trimStartHandle](self, "trimStartHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView frame](self->_filmstripContainerView, "frame");
  v38.origin.x = v12;
  v38.origin.y = v13;
  v38.size.width = v14;
  v38.size.height = v15;
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  v34 = CGRectUnion(v33, v38);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;

  -[PXLivePhotoTrimScrubber trimEndHandle](self, "trimEndHandle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v39.origin.x = v21;
  v39.origin.y = v22;
  v39.size.width = v23;
  v39.size.height = v24;
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v36 = CGRectUnion(v35, v39);
  v25 = v36.origin.x;
  v26 = v36.origin.y;
  v27 = v36.size.width;
  v28 = v36.size.height;

  -[PXLivePhotoTrimScrubber backingAlignedRectForRect:](self, "backingAlignedRectForRect:", v25, v26, v27, v28);
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)_releaseAVObjects
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PXLivePhotoTrimScrubberFilmStripView _releaseAVObjects](self->_filmstripView, "_releaseAVObjects");
  -[PXLivePhotoTrimScrubber setLoupePlayerView:](self, "setLoupePlayerView:", 0);
}

- (UIView)photoLoupe
{
  return &self->_photoLoupe->super;
}

- (UIView)_preTrimOverlayView
{
  return self->_preTrimOverlayView;
}

- (UIView)_postTrimOverlayView
{
  return self->_postTrimOverlayView;
}

- (PXLivePhotoTrimScrubberSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (Class)filmStripViewClass
{
  return self->_filmStripViewClass;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)untrimmedDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 752);
  return self;
}

- (double)horizontalInset
{
  return self->_horizontalInset;
}

- (void)setHorizontalInset:(double)a3
{
  self->_horizontalInset = a3;
}

- (unint64_t)playheadStyle
{
  return self->_playheadStyle;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 776);
  return self;
}

- (NSArray)snapKeyTimes
{
  return self->_snapKeyTimes;
}

- (NSArray)snapTrimStartTimes
{
  return self->_snapTrimStartTimes;
}

- (NSArray)snapTrimEndTimes
{
  return self->_snapTrimEndTimes;
}

- (NSArray)focusEventTimes
{
  return self->_focusEventTimes;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)suggestedKeyTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 800);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 824);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 848);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 872);
  return self;
}

- (void)setOriginalStartTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_originalStartTime.value = *(_OWORD *)&a3->var0;
  self->_originalStartTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 896);
  return self;
}

- (void)setOriginalEndTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_originalEndTime.value = *(_OWORD *)&a3->var0;
  self->_originalEndTime.epoch = var3;
}

- (PXLivePhotoTrimScrubberDelegate)delegate
{
  return (PXLivePhotoTrimScrubberDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)useMiniScrubber
{
  return self->_useMiniScrubber;
}

- (BOOL)allowZoom
{
  return self->_allowZoom;
}

- (void)setAllowZoom:(BOOL)a3
{
  self->_allowZoom = a3;
}

- (double)_contentAspectRatio
{
  return self->__contentAspectRatio;
}

- (int64_t)_trackingElement
{
  return self->__trackingElement;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (PXTrimScrubberLayoutHelper)layoutHelper
{
  return self->_layoutHelper;
}

- (void)setLayoutHelper:(id)a3
{
  objc_storeStrong((id *)&self->_layoutHelper, a3);
}

- (UIImageView)trimStartHandle
{
  return self->_trimStartHandle;
}

- (UIImageView)trimEndHandle
{
  return self->_trimEndHandle;
}

- (BOOL)showVideoScrubberDebugOverlay
{
  return self->_showVideoScrubberDebugOverlay;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTrimLength
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 920);
  return self;
}

- (void)setMinimumTrimLength:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_minimumTrimLength.value = *(_OWORD *)&a3->var0;
  self->_minimumTrimLength.epoch = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trimEndHandle, 0);
  objc_storeStrong((id *)&self->_trimStartHandle, 0);
  objc_storeStrong((id *)&self->_layoutHelper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusEventTimes, 0);
  objc_storeStrong((id *)&self->_snapTrimEndTimes, 0);
  objc_storeStrong((id *)&self->_snapTrimStartTimes, 0);
  objc_storeStrong((id *)&self->_snapKeyTimes, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_filmStripViewClass, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_postTrimOverlayView, 0);
  objc_storeStrong((id *)&self->_preTrimOverlayView, 0);
  objc_storeStrong((id *)&self->_debugEndTimeView, 0);
  objc_storeStrong((id *)&self->_debugLoupeTimeView, 0);
  objc_storeStrong((id *)&self->_debugStartTimeView, 0);
  objc_storeStrong((id *)&self->_trimControlHiddenHelper, 0);
  objc_storeStrong((id *)&self->_loupeHiddenHelper, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_focusEventSnappingControllers, 0);
  objc_storeStrong((id *)&self->_endTimeSnappingControllers, 0);
  objc_storeStrong((id *)&self->_startTimeSnappingControllers, 0);
  objc_storeStrong((id *)&self->_keyTimeSnappingControllers, 0);
  objc_storeStrong((id *)&self->_disabledOverlayView, 0);
  objc_storeStrong((id *)&self->_filmstripView, 0);
  objc_storeStrong((id *)&self->_filmstripContainerView, 0);
  objc_storeStrong((id *)&self->_photoLoupe, 0);
}

void __71__PXLivePhotoTrimScrubber_handleChangeTrackingAtLocation_withVelocity___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;

  v10 = 0;
  objc_msgSend(a2, "updateOffset:withVelocity:shouldSnap:shouldBreak:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, &v10, 0, *(double *)(a1 + 56));
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "CMTimeValue");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_OWORD *)(v9 + 32) = 0uLL;
    *(_QWORD *)(v9 + 48) = 0;
    *a4 = 1;

  }
}

uint64_t __57__PXLivePhotoTrimScrubber_handleBeginTrackingAtLocation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "_setKeyTime:canHaveImpact:forElement:", &v6, 1, v3);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  return objc_msgSend(v4, "setFrameTime:", &v6);
}

uint64_t __44__PXLivePhotoTrimScrubber_handleSetKeyTime___block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;

  v2 = *(_OWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 32), "setKeyTime:", &v2);
}

void __62__PXLivePhotoTrimScrubber__PXLivePhotoTrimScrubber_commonInit__block_invoke(uint64_t a1, int a2)
{
  double v2;
  void *v3;
  id WeakRetained;

  if (a2)
    v2 = 0.0;
  else
    v2 = 1.0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "photoLoupe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

void __62__PXLivePhotoTrimScrubber__PXLivePhotoTrimScrubber_commonInit__block_invoke_2(uint64_t a1, int a2)
{
  double v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  if (a2)
    v3 = 0.0;
  else
    v3 = 1.0;
  v4 = objc_loadWeakRetained(&to);
  objc_msgSend(v4, "trimEndHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

  v6 = objc_loadWeakRetained(&to);
  objc_msgSend(v6, "trimStartHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v3);

  v8 = objc_loadWeakRetained(&to);
  objc_msgSend(v8, "_preTrimOverlayView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v3);

  v10 = objc_loadWeakRetained(&to);
  objc_msgSend(v10, "_postTrimOverlayView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v3);

  objc_destroyWeak(&to);
}

void __39__PXLivePhotoTrimScrubber__zoomAtTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  double Seconds;
  void *v6;
  CMTime v7;
  CMTime time;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 455))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 696));
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "viewportMinTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    v6 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v6, "viewportMaxTime");
    else
      memset(&v7, 0, sizeof(v7));
    objc_msgSend(WeakRetained, "trimScrubber:didZoomToMinimumValue:maximumValue:", v4, Seconds, CMTimeGetSeconds(&v7));

  }
}

void __33__PXLivePhotoTrimScrubber_unzoom__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 456))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 696));
    objc_msgSend(WeakRetained, "trimScrubberDidUnzoom:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __50__PXLivePhotoTrimScrubber_performAnimatedChanges___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __52__PXLivePhotoTrimScrubber_setPlayheadStyle_animate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

void __53__PXLivePhotoTrimScrubber_setAsset_videoComposition___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PXLivePhotoTrimScrubber_setAsset_videoComposition___block_invoke_2;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __53__PXLivePhotoTrimScrubber_setAsset_videoComposition___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_assetDidLoadValues");

}

void __53__PXLivePhotoTrimScrubber__newScrubberLayoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "layoutHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filmstripFrame");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setFrame:");

  objc_msgSend(*(id *)(a1 + 32), "layoutHelper");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleFrameInFilmstripSpace");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setVisibleRect:");

}

+ (id)_createSnappingControllersForKeytimes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double Seconds;
  void *v12;
  CMTime v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        memset(&v14[1], 0, sizeof(CMTime));
        if (v10)
          objc_msgSend(v10, "CMTimeValue");
        v14[0] = v14[1];
        Seconds = CMTimeGetSeconds(v14);
        objc_msgSend((id)objc_opt_class(), "createSnappingControllerWithSnappingTarget:", Seconds);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAttractionOffsetThreshold:", 0.05);
        objc_msgSend(v12, "setRetentionOffsetThreshold:", 0.1);
        objc_msgSend(v12, "setAttractionVelocityThreshold:", 100.0);
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)createSnappingControllerWithSnappingTarget:(double)a3
{
  return -[PXSnappingController initWithSnappingTarget:]([PXSnappingController alloc], "initWithSnappingTarget:", a3);
}

+ (UIImage)trimStartImage
{
  return 0;
}

+ (UIImage)trimEndImage
{
  return 0;
}

+ (UIImage)trimStartHighlightedImage
{
  return 0;
}

+ (UIImage)trimEndHighlightedImage
{
  return 0;
}

+ (UIImage)trimStartImageMini
{
  return 0;
}

+ (UIImage)trimStartHighlightedImageMini
{
  return 0;
}

+ (UIImage)trimEndImageMini
{
  return 0;
}

+ (UIImage)trimEndHighlightedImageMini
{
  return 0;
}

@end
