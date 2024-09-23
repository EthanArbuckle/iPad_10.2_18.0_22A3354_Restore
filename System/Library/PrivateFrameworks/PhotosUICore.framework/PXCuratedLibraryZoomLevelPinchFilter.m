@implementation PXCuratedLibraryZoomLevelPinchFilter

- (PXCuratedLibraryZoomLevelPinchFilter)init
{
  PXCuratedLibraryZoomLevelPinchFilter *v2;
  PXCuratedLibraryZoomLevelPinchFilter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryZoomLevelPinchFilter;
  v2 = -[PXCuratedLibraryZoomLevelPinchFilter init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXCuratedLibraryZoomLevelPinchFilter reset](v2, "reset");
  return v3;
}

- (void)reset
{
  void *v3;
  double v4;
  double v5;
  PXInitialHysteresisNumberFilter *v6;
  PXInitialHysteresisNumberFilter *initialDirectionFilter;
  PXChangeDirectionNumberFilter *v8;
  PXChangeDirectionNumberFilter *scaleDirectionFilter;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomLevelPinchSignificantScaleDelta");
  v5 = v4;

  self->_isTrackingPinch = 0;
  self->_didHandleInitialPinch = 0;
  v6 = -[PXNumberFilter initWithInput:]([PXInitialHysteresisNumberFilter alloc], "initWithInput:", 1.0);
  initialDirectionFilter = self->_initialDirectionFilter;
  self->_initialDirectionFilter = v6;

  -[PXInitialHysteresisNumberFilter setHysteresis:](self->_initialDirectionFilter, "setHysteresis:", v5);
  v8 = -[PXChangeDirectionNumberFilter initWithInput:]([PXChangeDirectionNumberFilter alloc], "initWithInput:", 1.0);
  scaleDirectionFilter = self->_scaleDirectionFilter;
  self->_scaleDirectionFilter = v8;

  -[PXChangeDirectionNumberFilter setMinimumChange:](self->_scaleDirectionFilter, "setMinimumChange:", v5);
}

- (void)filterPinchGestureWithScale:(double)a3 initialPinchHandler:(id)a4 subsequentDirectionChangeHandler:(id)a5
{
  uint64_t (**v8)(id, uint64_t);
  void (**v9)(id, uint64_t);
  uint64_t v10;
  PXChangeDirectionNumberFilter *scaleDirectionFilter;
  double v12;
  double v13;
  uint64_t v14;
  PXInitialHysteresisNumberFilter *initialDirectionFilter;
  double v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v8 = (uint64_t (**)(id, uint64_t))a4;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = MEMORY[0x1E0C809B0];
  scaleDirectionFilter = self->_scaleDirectionFilter;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __121__PXCuratedLibraryZoomLevelPinchFilter_filterPinchGestureWithScale_initialPinchHandler_subsequentDirectionChangeHandler___block_invoke;
  v19[3] = &__block_descriptor_40_e33_v16__0___PXMutableNumberFilter__8l;
  *(double *)&v19[4] = a3;
  -[PXNumberFilter performChanges:](scaleDirectionFilter, "performChanges:", v19);
  -[PXNumberFilter output](self->_scaleDirectionFilter, "output");
  v13 = v12;
  if (self->_isTrackingPinch)
  {
    if (self->_didHandleInitialPinch && v9 && v12 != self->_lastDirection)
    {
      if (v12 > 0.0)
        v14 = 1;
      else
        v14 = -1;
      v9[2](v9, v14);
    }
  }
  else
  {
    initialDirectionFilter = self->_initialDirectionFilter;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __121__PXCuratedLibraryZoomLevelPinchFilter_filterPinchGestureWithScale_initialPinchHandler_subsequentDirectionChangeHandler___block_invoke_2;
    v18[3] = &__block_descriptor_40_e33_v16__0___PXMutableNumberFilter__8l;
    *(double *)&v18[4] = a3;
    -[PXNumberFilter performChanges:](initialDirectionFilter, "performChanges:", v18);
    -[PXNumberFilter output](self->_initialDirectionFilter, "output");
    if (v16 != 1.0)
    {
      self->_isTrackingPinch = 1;
      if (v16 > 1.0)
        v17 = 1;
      else
        v17 = -1;
      self->_didHandleInitialPinch = v8[2](v8, v17);
    }
  }
  self->_lastDirection = v13;

}

- (BOOL)isTrackingPinch
{
  return self->_isTrackingPinch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleDirectionFilter, 0);
  objc_storeStrong((id *)&self->_initialDirectionFilter, 0);
}

uint64_t __121__PXCuratedLibraryZoomLevelPinchFilter_filterPinchGestureWithScale_initialPinchHandler_subsequentDirectionChangeHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInput:", *(double *)(a1 + 32));
}

uint64_t __121__PXCuratedLibraryZoomLevelPinchFilter_filterPinchGestureWithScale_initialPinchHandler_subsequentDirectionChangeHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInput:", *(double *)(a1 + 32));
}

@end
