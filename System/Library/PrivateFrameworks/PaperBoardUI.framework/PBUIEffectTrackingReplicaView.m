@implementation PBUIEffectTrackingReplicaView

- (PBUIEffectTrackingReplicaView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PBUIEffectTrackingReplicaView *v7;
  PBUISnapshotReplicaView *v8;
  PBUISnapshotReplicaView *snapshotsView;
  PBUIPortalReplicaEffectView *v10;
  PBUIPortalReplicaEffectView *portalView;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PBUIEffectTrackingReplicaView;
  v7 = -[PBUIEffectTrackingReplicaView initWithFrame:](&v13, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[PBUISnapshotReplicaView initWithFrame:]([PBUISnapshotReplicaView alloc], "initWithFrame:", x, y, width, height);
    snapshotsView = v7->_snapshotsView;
    v7->_snapshotsView = v8;

    v10 = -[PBUIPortalReplicaEffectView initWithFrame:]([PBUIPortalReplicaEffectView alloc], "initWithFrame:", x, y, width, height);
    portalView = v7->_portalView;
    v7->_portalView = v10;

    -[PBUIEffectTrackingReplicaView setObservesSnapshotValidity:]((uint64_t)v7, 1);
    -[PBUIEffectTrackingReplicaView addSubview:](v7, "addSubview:", v7->_snapshotsView);
    -[PBUIEffectTrackingReplicaView addSubview:](v7, "addSubview:", v7->_portalView);
    -[PBUIPortalReplicaEffectView setAutoresizingMask:](v7->_portalView, "setAutoresizingMask:", 18);
    -[PBUISnapshotReplicaView setAutoresizingMask:](v7->_snapshotsView, "setAutoresizingMask:", 18);
    -[PBUIEffectTrackingReplicaView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
  }
  return v7;
}

- (uint64_t)setObservesSnapshotValidity:(uint64_t)result
{
  char v2;
  uint64_t v3;
  void *v4;

  if (result)
  {
    v2 = a2;
    v3 = result;
    if (*(unsigned __int8 *)(result + 418) != a2)
    {
      v4 = *(void **)(result + 480);
      if (a2)
        result = objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v3, CFSTR("valid"), 1, &PrivateKVOContext);
      else
        result = objc_msgSend(v4, "removeObserver:forKeyPath:context:", v3, CFSTR("valid"), &PrivateKVOContext);
      *(_BYTE *)(v3 + 418) = v2;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[PBUIEffectTrackingReplicaView setObservesSnapshotValidity:]((uint64_t)self, 0);
  v3.receiver = self;
  v3.super_class = (Class)PBUIEffectTrackingReplicaView;
  -[PBUIEffectTrackingReplicaView dealloc](&v3, sel_dealloc);
}

- (void)setReason:(id)a3
{
  NSString *v4;
  NSString *reason;
  id v6;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  reason = self->_reason;
  self->_reason = v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EffectTrackingView | %@"), self->_reason);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUIPortalReplicaView setReason:](self->_portalView, "setReason:", v6);
  -[PBUISnapshotReplicaView setReason:](self->_snapshotsView, "setReason:", v6);

}

- (void)setEffectWeight:(double)a3
{
  -[PBUIPortalReplicaEffectView setEffectWeight:](self->_portalView, "setEffectWeight:");
  self->_effectWeight = a3;
}

- (void)invalidate
{
  -[PBUIEffectTrackingReplicaView setObservesSnapshotValidity:]((uint64_t)self, 0);
  -[PBUISnapshotReplicaView invalidate](self->_snapshotsView, "invalidate");
  -[PBUIPortalReplicaView invalidate](self->_portalView, "invalidate");
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PBUIEffectTrackingReplicaView setNeedsReconfiguration]((id *)&self->super.super.super.isa);
  }
}

- (id)setNeedsReconfiguration
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  if (result)
  {
    v1 = (uint64_t)result;
    objc_msgSend(result[61], "requestStyle:", objc_msgSend(result, "style"));
    if (*(_BYTE *)(v1 + 416))
      v2 = *(_QWORD *)(v1 + 448);
    else
      v2 = 0;
    objc_msgSend(*(id *)(v1 + 480), "setEffectiveStyle:", v2);
    v3 = objc_msgSend(*(id *)(v1 + 480), "isValid");
    if (*(_BYTE *)(v1 + 417))
      v4 = v3;
    else
      v4 = 0;
    objc_msgSend(*(id *)(v1 + 480), "setHidden:", v4 ^ 1);
    if (((v4 ^ 1) & 1) != 0)
      objc_msgSend((id)v1, "addSubview:", *(_QWORD *)(v1 + 488));
    else
      objc_msgSend(*(id *)(v1 + 488), "removeFromSuperview");
    objc_msgSend(*(id *)(v1 + 488), "setHidden:", v4);
    return (id *)-[PBUIEffectTrackingReplicaView setObservesSnapshotValidity:](v1, 1);
  }
  return result;
}

- (void)setShowsSnapshot:(BOOL)a3
{
  if (self->_showsSnapshot != a3)
  {
    self->_showsSnapshot = a3;
    -[PBUIEffectTrackingReplicaView setNeedsReconfiguration]((id *)&self->super.super.super.isa);
  }
}

- (uint64_t)snapshotViewStyle
{
  if (result)
  {
    if (*(_BYTE *)(result + 416))
      return *(_QWORD *)(result + 448);
    else
      return 0;
  }
  return result;
}

- (uint64_t)snapshotsView
{
  if (result)
    return *(_QWORD *)(result + 480);
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  PBUISnapshotReplicaView *snapshotsView;
  id v8;
  objc_super v9;

  if (a6 == &PrivateKVOContext)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("valid"), a4, a5))
    {
      if (self)
        snapshotsView = self->_snapshotsView;
      else
        snapshotsView = 0;
      if (-[PBUISnapshotReplicaView isValid](snapshotsView, "isValid"))
      {
        -[PBUIEffectTrackingReplicaView delegate](self, "delegate");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "effectTrackingReplicaViewHasValidSnapshot:", self);

      }
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PBUIEffectTrackingReplicaView;
    -[PBUIEffectTrackingReplicaView observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setPortalProvider:(id)a3
{
  -[PBUIPortalReplicaView setProvider:](self->_portalView, "setProvider:", a3);
  -[PBUIEffectTrackingReplicaView setNeedsReconfiguration]((id *)&self->super.super.super.isa);
}

- (PBUIPosterReplicaPortalProviding)portalProvider
{
  return -[PBUIPortalReplicaView provider](self->_portalView, "provider");
}

- (void)setSnapshotProvider:(id)a3
{
  -[PBUISnapshotReplicaView setProvider:](self->_snapshotsView, "setProvider:", a3);
  -[PBUIEffectTrackingReplicaView setNeedsReconfiguration]((id *)&self->super.super.super.isa);
}

- (PBUIPosterReplicaSnapshotProviding)snapshotProvider
{
  return -[PBUISnapshotReplicaView provider](self->_snapshotsView, "provider");
}

- (BOOL)hasSnapshotProvider
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 480), "provider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)hasPortalProvider
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 488), "provider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (void)offsetWallpaperBy:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[PBUISnapshotReplicaView offsetWallpaperBy:](self->_snapshotsView, "offsetWallpaperBy:");
  -[PBUIPortalReplicaEffectView offsetWallpaperBy:](self->_portalView, "offsetWallpaperBy:", x, y);
}

- (int64_t)effectiveStyle
{
  return self->_style;
}

- (BOOL)shouldMatchWallpaperPosition
{
  return -[PBUISnapshotReplicaView shouldMatchWallpaperPosition](self->_snapshotsView, "shouldMatchWallpaperPosition")
      || -[PBUIPortalReplicaView shouldMatchWallpaperPosition](self->_portalView, "shouldMatchWallpaperPosition");
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PBUISnapshotReplicaView setShouldMatchWallpaperPosition:](self->_snapshotsView, "setShouldMatchWallpaperPosition:");
  -[PBUIPortalReplicaView setShouldMatchWallpaperPosition:](self->_portalView, "setShouldMatchWallpaperPosition:", v3);
}

- (void)setFullscreen:(BOOL)a3
{
  -[PBUIEffectTrackingReplicaView setShouldMatchWallpaperPosition:](self, "setShouldMatchWallpaperPosition:", !a3);
}

- (BOOL)isFullscreen
{
  return !-[PBUIEffectTrackingReplicaView shouldMatchWallpaperPosition](self, "shouldMatchWallpaperPosition");
}

- (PBUIFakeBlurObserver)observer
{
  return (PBUIFakeBlurObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (void)setTransformOptions:(unint64_t)a3
{
  self->_transformOptions = a3;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)requiresSnapshotTreatment
{
  return self->_requiresSnapshotTreatment;
}

- (void)setRequiresSnapshotTreatment:(BOOL)a3
{
  self->_requiresSnapshotTreatment = a3;
}

- (double)effectWeight
{
  return self->_effectWeight;
}

- (BOOL)showsSnapshot
{
  return self->_showsSnapshot;
}

- (NSString)reason
{
  return self->_reason;
}

- (PBUIEffectTrackingReplicaViewDelegate)delegate
{
  return (PBUIEffectTrackingReplicaViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)observesSnapshotValidity
{
  if (result)
    return *(_BYTE *)(result + 418) != 0;
  return result;
}

- (void)setSnapshotsView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 480), a2);
}

- (uint64_t)portalView
{
  if (result)
    return *(_QWORD *)(result + 488);
  return result;
}

- (void)setPortalView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 488), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_snapshotsView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
