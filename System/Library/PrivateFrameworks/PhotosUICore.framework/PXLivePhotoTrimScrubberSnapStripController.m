@implementation PXLivePhotoTrimScrubberSnapStripController

- (id)_snapIndicatorInfosForTimes:(id)a3 currentTime:(id *)a4 style:(unint64_t)a5 skipSingleIndicatorWithCurrentTime:(BOOL)a6 skipDefaultTimeIndicator:(BOOL)a7
{
  __int128 v8;
  uint64_t v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v10 = *a4;
  v8 = *MEMORY[0x1E0CA2E68];
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[PXLivePhotoTrimScrubberSnapStripController _snapIndicatorInfosForTimes:currentTime:suggestedTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:](self, "_snapIndicatorInfosForTimes:currentTime:suggestedTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:", a3, &v10, &v8, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_snapIndicatorInfosForTimes:(id)a3 currentTime:(id *)a4 suggestedTime:(id *)a5 style:(unint64_t)a6 skipSingleIndicatorWithCurrentTime:(BOOL)a7 skipDefaultTimeIndicator:(BOOL)a8
{
  id v14;
  PXLivePhotoTrimScrubber *v15;
  double v16;
  id v17;
  void *v19;
  void *v20;
  id v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void (*v29)(_QWORD *, __int128 *, _QWORD);
  void (*v30)(_QWORD *, __int128 *, uint64_t);
  BOOL v31;
  __int128 v32;
  int64_t v33;
  __int128 v34;
  int64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD aBlock[4];
  id v41;
  PXLivePhotoTrimScrubberSnapStripController *v42;
  PXLivePhotoTrimScrubber *v43;
  id v44;
  unint64_t v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  int64_t var3;
  BOOL v50;
  BOOL v51;
  BOOL v52;
  __int128 v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = self->_trimScrubber;
  if (-[PXLivePhotoTrimScrubber isAssetDurationLoaded](v15, "isAssetDurationLoaded")
    && (-[PXLivePhotoTrimScrubber bounds](v15, "bounds"), v16 != 0.0))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      v31 = -[PXLivePhotoTrimScrubber isDisabled](v15, "isDisabled");
      v53 = 0uLL;
      v54 = 0;
      objc_msgSend(v14, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "CMTimeValue");
      }
      else
      {
        v53 = 0uLL;
        v54 = 0;
      }

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __166__PXLivePhotoTrimScrubberSnapStripController__snapIndicatorInfosForTimes_currentTime_suggestedTime_style_skipSingleIndicatorWithCurrentTime_skipDefaultTimeIndicator___block_invoke;
      aBlock[3] = &unk_1E5116790;
      v46 = v53;
      v47 = v54;
      v48 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      v50 = a7;
      v21 = v14;
      v51 = a8;
      v41 = v21;
      v42 = self;
      v52 = v31;
      v43 = v15;
      v45 = a6;
      v17 = v17;
      v44 = v17;
      v22 = _Block_copy(aBlock);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v23 = v21;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v55, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v37 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            v34 = 0uLL;
            v35 = 0;
            if (v28)
              objc_msgSend(v28, "CMTimeValue");
            v29 = (void (*)(_QWORD *, __int128 *, _QWORD))v22[2];
            v32 = v34;
            v33 = v35;
            v29(v22, &v32, 0);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v55, 16);
        }
        while (v25);
      }

      if ((a5->var2 & 1) != 0)
      {
        v30 = (void (*)(_QWORD *, __int128 *, uint64_t))v22[2];
        v34 = *(_OWORD *)&a5->var0;
        v35 = a5->var3;
        v30(v22, &v34, 1);
      }

    }
  }
  else
  {
    v17 = (id)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (void)updateSnapStripView
{
  -[PXLivePhotoTrimScrubberSnapStripController updateSnapStripViewAnimated:](self, "updateSnapStripViewAnimated:", 1);
}

- (void)updateSnapStripViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];

  v3 = a3;
  -[PXLivePhotoTrimScrubberSnapStripController trimScrubber](self, "trimScrubber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "currentlyInteractingElement");
  if ((unint64_t)(v7 - 3) < 2)
  {
    objc_msgSend(v5, "snapKeyTimes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v5, "keyTime");
      objc_msgSend(v5, "suggestedKeyTime");
    }
    else
    {
      memset(v36, 0, sizeof(v36));
      memset(v35, 0, sizeof(v35));
    }
    -[PXLivePhotoTrimScrubberSnapStripController spec](self, "spec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "alwaysShowKeyTime") ^ 1;
    -[PXLivePhotoTrimScrubberSnapStripController spec](self, "spec");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubberSnapStripController _snapIndicatorInfosForTimes:currentTime:suggestedTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:](self, "_snapIndicatorInfosForTimes:currentTime:suggestedTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:", v8, v36, v35, 0, v11, objc_msgSend(v12, "showDefaultKeyTime") ^ 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v13);

    goto LABEL_32;
  }
  if (v7 == 1)
  {
    if (-[PXLivePhotoTrimScrubberSnapStripController allowStartEndTimeSnapIndicators](self, "allowStartEndTimeSnapIndicators"))
    {
      objc_msgSend(v5, "snapTrimStartTimes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend(v5, "trimStartTime");
      else
        memset(v34, 0, sizeof(v34));
      -[PXLivePhotoTrimScrubberSnapStripController spec](self, "spec");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v10, "showDefaultKeyTime") ^ 1;
      v18 = v34;
      goto LABEL_31;
    }
  }
  else if (v7 == 2)
  {
    if (-[PXLivePhotoTrimScrubberSnapStripController allowStartEndTimeSnapIndicators](self, "allowStartEndTimeSnapIndicators"))
    {
      objc_msgSend(v5, "snapTrimEndTimes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend(v5, "trimEndTime");
      else
        memset(v33, 0, sizeof(v33));
      -[PXLivePhotoTrimScrubberSnapStripController spec](self, "spec");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v10, "showDefaultKeyTime") ^ 1;
      v18 = v33;
LABEL_31:
      -[PXLivePhotoTrimScrubberSnapStripController _snapIndicatorInfosForTimes:currentTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:](self, "_snapIndicatorInfosForTimes:currentTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:", v8, v18, 1, 1, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v12);
LABEL_32:

    }
  }
  else
  {
    if (objc_msgSend(v5, "playheadStyle"))
    {
      objc_msgSend(v5, "snapKeyTimes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v5, "keyTime");
        objc_msgSend(v5, "suggestedKeyTime");
      }
      else
      {
        v30 = 0;
        v31 = 0;
        v32 = 0;
        v28 = 0;
        v29 = 0;
        v27 = 0;
      }
      -[PXLivePhotoTrimScrubberSnapStripController spec](self, "spec");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXLivePhotoTrimScrubberSnapStripController _snapIndicatorInfosForTimes:currentTime:suggestedTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:](self, "_snapIndicatorInfosForTimes:currentTime:suggestedTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:", v9, &v30, &v27, 0, 0, objc_msgSend(v14, "showDefaultKeyTime") ^ 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v15);

    }
    if (-[PXLivePhotoTrimScrubberSnapStripController allowStartEndTimeSnapIndicators](self, "allowStartEndTimeSnapIndicators"))
    {
      objc_msgSend(v5, "snapTrimStartTimes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v5, "trimStartTime");
      }
      else
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
      }
      -[PXLivePhotoTrimScrubberSnapStripController spec](self, "spec");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXLivePhotoTrimScrubberSnapStripController _snapIndicatorInfosForTimes:currentTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:](self, "_snapIndicatorInfosForTimes:currentTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:", v16, &v24, 1, 1, objc_msgSend(v19, "showDefaultKeyTime") ^ 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v20);

      objc_msgSend(v5, "snapTrimEndTimes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v5, "trimEndTime");
      }
      else
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
      }
      -[PXLivePhotoTrimScrubberSnapStripController spec](self, "spec", v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v10, "showDefaultKeyTime") ^ 1;
      v18 = &v21;
      goto LABEL_31;
    }
  }
  -[PXSnapStripView setIndicatorInfos:animated:](self->_snapStripView, "setIndicatorInfos:animated:", v6, v3);

}

- (void)snapStripViewNeedsDisplay
{
  -[PXSnapStripView setNeedsDisplay](self->_snapStripView, "setNeedsDisplay");
}

- (PXLivePhotoTrimScrubberSnapStripControllerSpec)spec
{
  PXLivePhotoTrimScrubberSnapStripControllerSpec *spec;
  void *v4;

  spec = self->_spec;
  if (!spec)
  {
    v4 = (void *)objc_opt_new();
    -[PXLivePhotoTrimScrubberSnapStripController setSpec:](self, "setSpec:", v4);

    spec = self->_spec;
  }
  return spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
  -[PXLivePhotoTrimScrubberSnapStripController updateSnapStripView](self, "updateSnapStripView");
}

- (PXLivePhotoTrimScrubber)trimScrubber
{
  return self->_trimScrubber;
}

- (void)setTrimScrubber:(id)a3
{
  objc_storeStrong((id *)&self->_trimScrubber, a3);
}

- (PXSnapStripView)snapStripView
{
  return self->_snapStripView;
}

- (void)setSnapStripView:(id)a3
{
  objc_storeStrong((id *)&self->_snapStripView, a3);
}

- (BOOL)allowStartEndTimeSnapIndicators
{
  return self->_allowStartEndTimeSnapIndicators;
}

- (void)setAllowStartEndTimeSnapIndicators:(BOOL)a3
{
  self->_allowStartEndTimeSnapIndicators = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapStripView, 0);
  objc_storeStrong((id *)&self->_trimScrubber, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

void __166__PXLivePhotoTrimScrubberSnapStripController__snapIndicatorInfosForTimes_currentTime_suggestedTime_style_skipSingleIndicatorWithCurrentTime_skipDefaultTimeIndicator___block_invoke(uint64_t a1, CMTime *a2, char a3)
{
  int32_t v6;
  int32_t v7;
  int32_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  PXSnapStripViewIndicatorInfo *v20;
  CMTime v21;
  CMTime time1;

  time1 = *a2;
  v21 = *(CMTime *)(a1 + 72);
  v6 = CMTimeCompare(&time1, &v21);
  time1 = *a2;
  v21 = *(CMTime *)(a1 + 96);
  v7 = CMTimeCompare(&time1, &v21);
  time1 = *a2;
  v21 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v8 = CMTimeCompare(&time1, &v21);
  if ((!*(_BYTE *)(a1 + 120) || v7 || v6 || objc_msgSend(*(id *)(a1 + 32), "count") != 1)
    && (!*(_BYTE *)(a1 + 121) || v8))
  {
    objc_msgSend(*(id *)(a1 + 40), "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (*(_BYTE *)(a1 + 122))
    {
      objc_msgSend(v9, "disabledColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if ((a3 & 1) != 0)
    {
      objc_msgSend(v9, "suggestedMarkerColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "count") == 1 || v6)
    {
      objc_msgSend(v10, "currentPositionMarkerColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "originalPositionMarkerColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    v13 = *(void **)(a1 + 48);
    time1 = *a2;
    objc_msgSend(v13, "horizontalOffsetForTime:", &time1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "convertPoint:fromView:", *(_QWORD *)(a1 + 48));
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 64);
    v17 = objc_msgSend(v10, "livePortraitStyle");
    v18 = 2;
    if (v6)
      v18 = v16;
    if (v17)
      v19 = v18;
    else
      v19 = v16;
    v20 = -[PXSnapStripViewIndicatorInfo initWithOffset:color:style:]([PXSnapStripViewIndicatorInfo alloc], "initWithOffset:color:style:", v12, v19, v15);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v20);

  }
}

@end
