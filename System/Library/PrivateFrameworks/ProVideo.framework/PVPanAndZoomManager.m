@implementation PVPanAndZoomManager

+ (id)panAndZoomManagerWithMediaSize:(CGSize)a3 viewSize:(CGSize)a4 fillMode:(int)a5 maxScale:(double)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMediaSize:viewSize:fillMode:maxScale:", *(_QWORD *)&a5, a3.width, a3.height, a4.width, a4.height, a6);
}

- (PVPanAndZoomManager)initWithMediaSize:(CGSize)a3 viewSize:(CGSize)a4 fillMode:(int)a5 maxScale:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat v10;
  CGFloat v11;
  PVPanAndZoomManager *v12;
  PVPanAndZoomManager *v13;
  BOOL v14;
  double v15;
  NSTimer *snapTimer;
  objc_super v18;

  height = a4.height;
  width = a4.width;
  v10 = a3.height;
  v11 = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)PVPanAndZoomManager;
  v12 = -[PVPanAndZoomManager init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PVPanAndZoomManager cancelEditing](v12, "cancelEditing");
    v13->_mediaSize.width = v11;
    v13->_mediaSize.height = v10;
    -[PVPanAndZoomManager updateMediaAspectRatio](v13, "updateMediaAspectRatio");
    v13->_viewSize.width = width;
    v13->_viewSize.height = height;
    -[PVPanAndZoomManager updateViewAspectRatio](v13, "updateViewAspectRatio");
    v13->_fillMode = a5;
    -[PVPanAndZoomManager updateMinScale](v13, "updateMinScale");
    v14 = a6 >= 0.0000001 || a6 <= -0.0000001;
    v15 = 3.0;
    if (v14)
      v15 = a6;
    v13->_maxScale = v15;
    -[PVPanAndZoomManager updateMaxScale](v13, "updateMaxScale");
    v13->_skipFirstSnap = 0;
    v13->_isZoomSnapEnabled = 1;
    v13->_zoomSnapScale = 1.0;
    v13->_zoomSnapThreshold = 0.01;
    snapTimer = v13->_snapTimer;
    v13->_scaleWhileSnapped = 1.0;
    v13->_snapTimer = 0;

    v13->_isTranslationDirectionLockEnabled = 0;
    v13->_translationDirectionLockThreshold = 5.0;
  }
  return v13;
}

- (void)beginEditingTransform:(PVTransformAnimationInfo *)a3 transformType:(int)a4 updateOtherWorkingTransforms:(BOOL)a5
{
  _BOOL4 v5;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v5 = a5;
  -[PVPanAndZoomManager setIsEditingTransform:type:](self, "setIsEditingTransform:type:", 1);
  switch(a4)
  {
    case 2:
      v12 = *(_OWORD *)&a3->time.value;
      v13 = *(_OWORD *)&a3->time.epoch;
      v14 = *(_OWORD *)&a3->translation.y;
      self->_workingTransformRotate.rotation = a3->rotation;
      *(_OWORD *)&self->_workingTransformRotate.translation.y = v14;
      *(_OWORD *)&self->_workingTransformRotate.time.epoch = v13;
      *(_OWORD *)&self->_workingTransformRotate.time.value = v12;
      break;
    case 1:
      v15 = *(_OWORD *)&a3->time.value;
      v16 = *(_OWORD *)&a3->time.epoch;
      v17 = *(_OWORD *)&a3->translation.y;
      self->_workingTransformScale.rotation = a3->rotation;
      *(_OWORD *)&self->_workingTransformScale.time.epoch = v16;
      *(_OWORD *)&self->_workingTransformScale.translation.y = v17;
      *(_OWORD *)&self->_workingTransformScale.time.value = v15;
      if (v5)
        self->_workingTransformTranslate.scale = self->_workingTransformScale.scale;
      if (self->_isEditingTranslate)
        self->_workingTransformScale.translation = self->_workingTransformTranslate.translation;
      self->_skipFirstSnap = vabdd_f64(self->_workingTransformScale.scale, self->_zoomSnapScale) <= self->_zoomSnapThreshold;
      -[PVPanAndZoomManager cancelSnapTimer](self, "cancelSnapTimer");
      break;
    case 0:
      v9 = *(_OWORD *)&a3->time.value;
      v10 = *(_OWORD *)&a3->time.epoch;
      v11 = *(_OWORD *)&a3->translation.y;
      self->_workingTransformTranslate.rotation = a3->rotation;
      *(_OWORD *)&self->_workingTransformTranslate.translation.y = v11;
      *(_OWORD *)&self->_workingTransformTranslate.time.epoch = v10;
      *(_OWORD *)&self->_workingTransformTranslate.time.value = v9;
      if (v5)
        self->_workingTransformScale.translation = self->_workingTransformTranslate.translation;
      if (self->_isEditingScale)
        self->_workingTransformTranslate.scale = self->_workingTransformScale.scale;
      break;
  }
}

- (PVTransformAnimationInfo)endEditingTransformForType:(SEL)a3
{
  PVTransformAnimationInfo *result;
  __int128 v8;
  double rotation;
  __int128 v10;
  __int128 v11;

  result = (PVTransformAnimationInfo *)-[PVPanAndZoomManager setIsEditingTransform:type:](self, "setIsEditingTransform:type:", 0, *(_QWORD *)&a4);
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      if (!self->_disableScale)
      {
        result = (PVTransformAnimationInfo *)-[PVPanAndZoomManager cancelSnapTimer](self, "cancelSnapTimer");
        if (self->_isEditingTranslate)
          self->_workingTransformTranslate.scale = self->_workingTransformScale.scale;
        v11 = *(_OWORD *)&self->_workingTransformScale.time.epoch;
        *(_OWORD *)&retstr->time.value = *(_OWORD *)&self->_workingTransformScale.time.value;
        *(_OWORD *)&retstr->time.epoch = v11;
        *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self->_workingTransformScale.translation.y;
        rotation = self->_workingTransformScale.rotation;
        goto LABEL_15;
      }
    }
    else if (!a4 && !self->_disableTranslation)
    {
      if (self->_isEditingScale)
        self->_workingTransformScale.translation = self->_workingTransformTranslate.translation;
      v8 = *(_OWORD *)&self->_workingTransformTranslate.time.epoch;
      *(_OWORD *)&retstr->time.value = *(_OWORD *)&self->_workingTransformTranslate.time.value;
      *(_OWORD *)&retstr->time.epoch = v8;
      *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self->_workingTransformTranslate.translation.y;
      rotation = self->_workingTransformTranslate.rotation;
      goto LABEL_15;
    }
LABEL_11:
    PVTransformAnimationInfoIdentity((uint64_t)retstr);
    return result;
  }
  if (self->_disableRotation)
    goto LABEL_11;
  v10 = *(_OWORD *)&self->_workingTransformRotate.time.epoch;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&self->_workingTransformRotate.time.value;
  *(_OWORD *)&retstr->time.epoch = v10;
  *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self->_workingTransformRotate.translation.y;
  rotation = self->_workingTransformRotate.rotation;
LABEL_15:
  retstr->rotation = rotation;
  return result;
}

- (void)cancelEditing
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double v9;

  -[PVPanAndZoomManager cancelSnapTimer](self, "cancelSnapTimer");
  *(_WORD *)&self->_isEditingTranslate = 0;
  self->_isEditingRotate = 0;
  PVTransformAnimationInfoIdentity((uint64_t)&v6);
  v3 = v7;
  *(_OWORD *)&self->_workingTransformTranslate.time.value = v6;
  *(_OWORD *)&self->_workingTransformTranslate.time.epoch = v3;
  *(_OWORD *)&self->_workingTransformTranslate.translation.y = v8;
  self->_workingTransformTranslate.rotation = v9;
  PVTransformAnimationInfoIdentity((uint64_t)&v6);
  v4 = v7;
  *(_OWORD *)&self->_workingTransformScale.time.value = v6;
  *(_OWORD *)&self->_workingTransformScale.time.epoch = v4;
  *(_OWORD *)&self->_workingTransformScale.translation.y = v8;
  self->_workingTransformScale.rotation = v9;
  PVTransformAnimationInfoIdentity((uint64_t)&v6);
  v5 = v7;
  *(_OWORD *)&self->_workingTransformRotate.time.value = v6;
  *(_OWORD *)&self->_workingTransformRotate.time.epoch = v5;
  *(_OWORD *)&self->_workingTransformRotate.translation.y = v8;
  self->_workingTransformRotate.rotation = v9;
}

- (PVTransformAnimationInfo)updateTranslation:(SEL)a3 outNeedsUpdate:(CGPoint)a4
{
  PVTransformAnimationInfo *result;
  double v9;
  double v10;
  double translationDirectionLockThreshold;
  double v12;
  double v13;
  BOOL v14;
  BOOL v15;
  __int128 v16;
  char v17;

  v17 = 0;
  if (a5)
    *a5 = 0;
  if (self->_disableTranslation)
    goto LABEL_4;
  if (!self->_isEditingTranslate)
  {
    NSLog(CFSTR("PVPanAndZoomManager: Warning: cannot update translation when not currently editing translation!"), a3, a4.x, a4.y);
LABEL_4:
    PVTransformAnimationInfoIdentity((uint64_t)retstr);
    return result;
  }
  if (self->_isZoomSnapEnabled && self->_snapTimer)
    a4 = *(CGPoint *)*(_QWORD *)&MEMORY[0x1E0C9D538];
  if (self->_isTranslationDirectionLockEnabled)
  {
    v9 = fabs(a4.x);
    v10 = fabs(a4.y);
    translationDirectionLockThreshold = self->_translationDirectionLockThreshold;
    if (v10 <= v9 * translationDirectionLockThreshold)
    {
      if (v9 > v10 * translationDirectionLockThreshold)
        a4.y = 0.0;
    }
    else
    {
      a4.x = 0.0;
    }
  }
  if (self->_isEditingScale)
    self->_workingTransformTranslate.scale = self->_workingTransformScale.scale;
  result = (PVTransformAnimationInfo *)objc_msgSend((id)objc_opt_class(), "adjustPositionToKeepMediaInViewBounds:scale:minScale:mediaAspectRatio:viewAspectRatio:fillMode:outNeedsUpdate:", self->_fillMode, &v17, a4.x + self->_workingTransformTranslate.translation.x, a4.y + self->_workingTransformTranslate.translation.y, self->_workingTransformTranslate.scale, self->_minScale, self->_mediaAspectRatio, self->_viewAspectRatio);
  if (!v17
    && (self->_workingTransformTranslate.translation.x == v12
      ? (v14 = self->_workingTransformTranslate.translation.y == v13)
      : (v14 = 0),
        v14))
  {
    v15 = 0;
  }
  else
  {
    if (self->_isEditingScale)
      self->_workingTransformTranslate.scale = self->_workingTransformScale.scale;
    self->_workingTransformTranslate.translation.x = v12;
    self->_workingTransformTranslate.translation.y = v13;
    v15 = 1;
  }
  if (a5)
    *a5 = v15;
  v16 = *(_OWORD *)&self->_workingTransformTranslate.time.epoch;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&self->_workingTransformTranslate.time.value;
  *(_OWORD *)&retstr->time.epoch = v16;
  *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self->_workingTransformTranslate.translation.y;
  retstr->rotation = self->_workingTransformTranslate.rotation;
  return result;
}

- (PVTransformAnimationInfo)updateScale:(SEL)a3 normalizedLocationInView:(double)a4 outNeedsUpdate:(CGPoint)a5
{
  double y;
  double x;
  PVTransformAnimationInfo *v9;
  double rotation;
  double v12;
  double scale;
  double v14;
  double v15;
  double v16;
  double v17;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  CGPoint translation;
  uint64_t v24;
  void *v25;
  float64x2_t v26;
  int8x8_t v27;
  int8x8_t v28;
  int64x2_t v29;
  _OWORD v30[2];

  y = a5.y;
  x = a5.x;
  v9 = self;
  if (a6)
    *a6 = 0;
  if (BYTE3(self[4].time.epoch))
    goto LABEL_4;
  if (!BYTE1(self[3].time.timescale))
  {
    NSLog(CFSTR("PVPanAndZoomManager: Warning: cannot update scale when not currently editing scale!"), a3, a4);
LABEL_4:
    PVTransformAnimationInfoIdentity((uint64_t)retstr);
    return self;
  }
  rotation = self[1].rotation;
  v12 = rotation * a4;
  scale = self[3].scale;
  v14 = fmax(v12, self[3].translation.y);
  if (LOBYTE(self[3].time.timescale))
    *(_OWORD *)&self[1].translation.y = *(_OWORD *)&self->translation.y;
  v15 = fmin(v14, scale);
  if (LOBYTE(self[4].time.epoch))
  {
    if (*(_QWORD *)&self[4].time.timescale)
    {
      if (v15 <= self[4].rotation + 1.0)
      {
        v19 = v15 * *(double *)&self[4].time.value;
        *(double *)&self[4].time.value = v19;
        v15 = rotation;
        if (v19 <= 0.75)
        {
          self = (PVTransformAnimationInfo *)-[PVTransformAnimationInfo cancelSnapTimer](self, "cancelSnapTimer");
          v15 = 1.0 - (v9[4].rotation + v9[4].rotation);
        }
      }
      else
      {
        self = (PVTransformAnimationInfo *)-[PVTransformAnimationInfo cancelSnapTimer](self, "cancelSnapTimer");
      }
    }
    else
    {
      v16 = self[4].scale;
      if (v15 < v16)
      {
        v17 = self[4].rotation;
        if (vabdd_f64(rotation, v16) <= v17 || rotation >= v16 + v17)
        {
          if (!LOBYTE(self[3].rotation))
          {
            objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_onSnapTimer_, 0, 0, 1.0);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = *(void **)&v9[4].time.timescale;
            *(_QWORD *)&v9[4].time.timescale = v24;

            *(double *)&v9[4].time.value = v16;
            v9[1].rotation = v16;
            if (fabs(v9[4].scale + -1.0) < 0.0001)
            {
              v26 = *(float64x2_t *)&v9[3].time.epoch;
              v27 = (int8x8_t)0x100000001;
              if (fabs(vsubq_f64(v26, (float64x2_t)vdupq_laneq_s64((int64x2_t)v26, 1)).f64[0]) >= 0.0001)
              {
                switch(LODWORD(v9[4].translation.x))
                {
                  case 0:
                  case 4:
                  case 5:
                  case 6:
                  case 7:
                  case 8:
                  case 9:
                  case 0xA:
                  case 0xB:
                  case 0xC:
                  case 0xD:
                    v28 = (int8x8_t)1;
                    break;
                  case 1:
                    v29 = vcgtq_f64((float64x2_t)vextq_s8((int8x16_t)v26, (int8x16_t)v26, 8uLL), v26);
                    goto LABEL_45;
                  case 2:
                    v29 = vcgtq_f64(v26, (float64x2_t)vextq_s8((int8x16_t)v26, (int8x16_t)v26, 8uLL));
LABEL_45:
                    v28 = (int8x8_t)vmovn_s64(v29);
                    break;
                  case 3:
                    v28 = (int8x8_t)0x100000001;
                    break;
                  case 0xE:
                    v28 = (int8x8_t)0x100000000;
                    break;
                  default:
                    v28 = 0;
                    break;
                }
                v27 = vand_s8(v28, (int8x8_t)0x100000001);
              }
              if (v27.i32[0])
                v9[1].translation.y = 0.0;
              if (v27.i32[1])
                v9[1].scale = 0.0;
            }
            goto LABEL_23;
          }
          LOBYTE(self[3].rotation) = 0;
          v15 = v16 - (v17 + v17);
        }
      }
    }
  }
  v16 = v15;
  if (vabdd_f64(rotation, v15) >= 0.0001)
  {
LABEL_23:
    v20 = v9[1].translation.y;
    v21 = v9[1].scale;
    memset(v30, 0, 24);
    self = (PVTransformAnimationInfo *)objc_opt_class();
    if (self)
      self = (PVTransformAnimationInfo *)-[PVTransformAnimationInfo transformAnimInfoForScale:atNormalizedLocationInView:minScale:currentScale:currentTranslation:mediaAspectRatio:viewAspectRatio:fillMode:outNeedsUpdate:](self, "transformAnimInfoForScale:atNormalizedLocationInView:minScale:currentScale:currentTranslation:mediaAspectRatio:viewAspectRatio:fillMode:outNeedsUpdate:", LODWORD(v9[4].translation.x), 0, v16, x, y, v9[3].translation.y, rotation, v20, v21, *(double *)&v9[3].time.epoch, *(_QWORD *)&v9[3].translation.x);
    else
      memset(v30, 0, 24);
    v9[1].rotation = 0.0;
    *(_OWORD *)&v9[1].translation.y = *(_OWORD *)((char *)v30 + 8);
    if (LOBYTE(v9[3].time.timescale))
    {
      v9->rotation = 0.0;
      *(_OWORD *)&v9->translation.y = *(_OWORD *)((char *)v30 + 8);
    }
    v22 = 1;
    goto LABEL_30;
  }
  v22 = 0;
LABEL_30:
  if (a6)
    *a6 = v22;
  translation = v9[1].translation;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&v9[1].time.timescale;
  *(CGPoint *)&retstr->time.epoch = translation;
  *(_OWORD *)&retstr->translation.y = *(_OWORD *)&v9[1].scale;
  *(_QWORD *)&retstr->rotation = v9[2].time.value;
  return self;
}

- (PVTransformAnimationInfo)updateRotation:(SEL)a3 normalizedLocationInView:(double)a4 outNeedsUpdate:(CGPoint)a5
{
  CGPoint translation;

  if (a6)
    *a6 = 0;
  if (BYTE4(self[4].time.epoch))
    goto LABEL_4;
  if (!BYTE2(self[3].time.timescale))
  {
    NSLog(CFSTR("PVPanAndZoomManager: Warning: cannot update rotation when not currently editing rotation!"), a3, a4, a5.x, a5.y);
LABEL_4:
    PVTransformAnimationInfoIdentity((uint64_t)retstr);
    return self;
  }
  if (a6)
    *a6 = 0;
  translation = self[2].translation;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&self[2].time.timescale;
  *(CGPoint *)&retstr->time.epoch = translation;
  *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self[2].scale;
  *(_QWORD *)&retstr->rotation = self[3].time.value;
  return self;
}

- (void)onSnapTimer:(id)a3
{
  self->_workingTransformScale.scale = 1.0 - (self->_zoomSnapThreshold + self->_zoomSnapThreshold);
  -[PVPanAndZoomManager cancelSnapTimer](self, "cancelSnapTimer", a3);
}

- (void)cancelSnapTimer
{
  NSTimer *snapTimer;

  -[NSTimer invalidate](self->_snapTimer, "invalidate");
  snapTimer = self->_snapTimer;
  self->_snapTimer = 0;

}

- (void)setMediaSize:(CGSize)a3
{
  if (self->_mediaSize.width != a3.width || self->_mediaSize.height != a3.height)
  {
    self->_mediaSize = a3;
    -[PVPanAndZoomManager updateMediaAspectRatio](self, "updateMediaAspectRatio");
    -[PVPanAndZoomManager updateMinScale](self, "updateMinScale");
    -[PVPanAndZoomManager updateMaxScale](self, "updateMaxScale");
  }
}

- (void)updateMediaAspectRatio
{
  double height;
  CGFloat v3;

  height = self->_mediaSize.height;
  if (height <= -0.0000001 || (v3 = 1.0, height >= 0.0000001))
    v3 = self->_mediaSize.width / height;
  self->_mediaAspectRatio = v3;
}

- (void)setViewSize:(CGSize)a3
{
  if (self->_viewSize.width != a3.width || self->_viewSize.height != a3.height)
  {
    self->_viewSize = a3;
    -[PVPanAndZoomManager updateViewAspectRatio](self, "updateViewAspectRatio");
    -[PVPanAndZoomManager updateMinScale](self, "updateMinScale");
    -[PVPanAndZoomManager updateMaxScale](self, "updateMaxScale");
  }
}

- (void)updateViewAspectRatio
{
  double height;
  CGFloat v3;

  height = self->_viewSize.height;
  if (height <= -0.0000001 || (v3 = 1.0, height >= 0.0000001))
    v3 = self->_viewSize.width / height;
  self->_viewAspectRatio = v3;
}

- (void)setFillMode:(int)a3
{
  if (self->_fillMode != a3)
  {
    self->_fillMode = a3;
    -[PVPanAndZoomManager updateMinScale](self, "updateMinScale");
    -[PVPanAndZoomManager updateMaxScale](self, "updateMaxScale");
  }
}

- (void)setMaxScale:(double)a3
{
  if (self->_maxScale != a3)
  {
    self->_maxScale = a3;
    -[PVPanAndZoomManager updateMaxScale](self, "updateMaxScale");
  }
}

- (void)updateMinScale
{
  double v3;

  objc_msgSend((id)objc_opt_class(), "calculateMinScaleForMediaAspectRatio:viewAspectRatio:fillMode:", self->_fillMode, self->_mediaAspectRatio, self->_viewAspectRatio);
  self->_minScale = v3;
}

- (void)updateMaxScale
{
  double v3;

  objc_msgSend((id)objc_opt_class(), "calculateMaxScale:forMediaAspectRatio:viewAspectRatio:fillMode:", self->_fillMode, self->_maxScale, self->_mediaAspectRatio, self->_viewAspectRatio);
  self->_adjustedMaxScale = v3;
}

- (BOOL)isEditing
{
  return self->_isEditingTranslate || self->_isEditingScale || self->_isEditingRotate;
}

- (BOOL)isEditingTransformType:(int)a3
{
  char v3;

  if (a3 <= 2)
    v3 = *(&self->_isEditingTranslate + a3);
  return v3 & 1;
}

- (void)setIsEditingTransform:(BOOL)a3 type:(int)a4
{
  if (a4 <= 2)
    *(&self->_isEditingTranslate + a4) = a3;
}

+ (PVTransformAnimationInfo)transformAnimInfoForScale:(SEL)a3 atNormalizedLocationInView:(double)a4 minScale:(CGPoint)a5 currentScale:(double)a6 currentTranslation:(double)a7 mediaAspectRatio:(CGPoint)a8 viewAspectRatio:(double)a9 fillMode:(double)a10 outNeedsUpdate:(int)a11
{
  uint64_t v13;
  double y;
  double x;
  double v18;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  PVTransformAnimationInfo *result;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;

  v13 = *(_QWORD *)&a11;
  y = a8.y;
  x = a8.x;
  v30 = a5.y;
  v18 = a5.x;
  retstr->rotation = 0.0;
  *(_OWORD *)&retstr->time.epoch = 0u;
  *(_OWORD *)&retstr->translation.y = 0u;
  *(_OWORD *)&retstr->time.value = 0u;
  PVTransformAnimationInfoIdentity((uint64_t)retstr);
  v22 = 1.0;
  v23 = a10;
  switch((int)v13)
  {
    case 0:
      break;
    case 1:
      if (a10 <= 1.0)
      {
        if (a9 < a10)
          v22 = a10 / a9;
      }
      else
      {
        v22 = a10 / a9;
        if (a10 / a9 < 1.0)
          v22 = 1.0;
      }
      goto LABEL_14;
    case 2:
      v22 = a10 / a9;
      if (a10 / a9 > 1.0)
        v22 = 1.0;
LABEL_14:
      v23 = v22 * a9;
      break;
    case 3:
      v23 = a10;
      break;
    default:
      if ((_DWORD)v13 == 13)
      {
        v22 = a10 / a9;
        v23 = a10;
      }
      else
      {
        v23 = a9;
      }
      break;
  }
  v24 = a4 * a7 * v23;
  v25 = a4 * a7 * v22;
  v26 = v18 + -0.5;
  CGAffineTransformMakeScale(&v31, a4 / a7, a4 / a7);
  memset(&v32, 0, sizeof(v32));
  CGAffineTransformMakeTranslation(&t1, -v26, -(0.5 - v30));
  t2 = v31;
  CGAffineTransformConcat(&v35, &t1, &t2);
  CGAffineTransformMakeTranslation(&t2, v26, 0.5 - v30);
  CGAffineTransformConcat(&v32, &v35, &t2);
  v35 = v32;
  v36.origin.x = x + v24 * -0.5;
  v36.origin.y = v25 * -0.5 - y;
  v36.size.width = v24;
  v36.size.height = v25;
  v37 = CGRectApplyAffineTransform(v36, &v35);
  retstr->translation.x = v37.origin.x + v37.size.width * 0.5;
  retstr->translation.y = -(v37.origin.y + v37.size.height * 0.5);
  retstr->scale = a4;
  result = (PVTransformAnimationInfo *)objc_msgSend(a2, "adjustPositionToKeepMediaInViewBounds:scale:minScale:mediaAspectRatio:viewAspectRatio:fillMode:outNeedsUpdate:", v13, a12);
  retstr->translation.x = v28;
  retstr->translation.y = v29;
  return result;
}

+ (CGPoint)adjustPositionToKeepMediaInViewBounds:(CGPoint)a3 scale:(double)a4 minScale:(double)a5 mediaAspectRatio:(double)a6 viewAspectRatio:(double)a7 fillMode:(int)a8 outNeedsUpdate:(BOOL *)a9
{
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a1, "maximumNormalizedPositionForScale:minScale:position:mediaAspectRatio:viewAspectRatio:fillMode:", *(_QWORD *)&a8, a4, a5, a3.x, a3.y, a6, a7);
  v14 = fabs(x);
  v15 = fabs(v12);
  v16 = fabs(y);
  v17 = fabs(v13);
  if (a9)
  {
    v18 = v16 > v17;
    if (v14 > v15)
      v18 = 1;
    *a9 = v18;
  }
  if (v16 <= v17)
    v13 = y;
  if (v14 <= v15)
    v12 = x;
  result.y = v13;
  result.x = v12;
  return result;
}

+ (CGPoint)maximumNormalizedPositionForScale:(double)a3 minScale:(double)a4 position:(CGPoint)a5 mediaAspectRatio:(double)a6 viewAspectRatio:(double)a7 fillMode:(int)a8
{
  double y;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  _BOOL4 v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  CGPoint result;

  y = a5.y;
  if (a7 <= 1.0)
  {
    v12 = a7 / a6;
    if (a6 >= a7)
      v12 = 1.0;
  }
  else
  {
    v12 = a7 / a6;
    if (a7 / a6 < 1.0)
      v12 = 1.0;
  }
  v13 = a7;
  switch(a8)
  {
    case 0:
      break;
    case 1:
      v14 = 1.0;
      if (a7 <= 1.0)
      {
        if (a6 < a7)
          v14 = a7 / a6;
      }
      else
      {
        v14 = a7 / a6;
        if (a7 / a6 < 1.0)
          v14 = 1.0;
      }
      goto LABEL_15;
    case 2:
      v14 = a7 / a6;
      if (a7 / a6 > 1.0)
        v14 = 1.0;
LABEL_15:
      v13 = v14 * a6;
      break;
    case 3:
      v13 = a7;
      break;
    default:
      if (a8 == 13)
        v13 = a7;
      else
        v13 = a6;
      break;
  }
  v15 = 1;
  v16 = 1;
  if (vabdd_f64(a6, a7) >= 0.0001)
  {
    switch(a8)
    {
      case 0:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        v17 = 0;
        v18 = 1;
        break;
      case 1:
        v18 = a6 < a7;
        v17 = a6 > a7;
        break;
      case 2:
        v18 = a6 > a7;
        v17 = a6 < a7;
        break;
      case 3:
        v18 = 1;
        goto LABEL_35;
      case 14:
        v18 = 0;
LABEL_35:
        v17 = 1;
        break;
      default:
        v18 = 0;
        v17 = 0;
        break;
    }
    v15 = v18;
    v16 = v17;
  }
  v27 = v16;
  v19 = v13 / (v12 * a6) * a3;
  if (v15)
    v20 = a3;
  else
    v20 = v13 / (v12 * a6) * a3;
  objc_msgSend(a1, "maximumNormalizedPositionInAxisForScale:minScale:isMediaAxisNormal:isPositionBelowZero:", v15 != 0, a5.x < 0.0, v20, a4);
  v22 = v21;
  if (v27)
    v23 = a3;
  else
    v23 = v19;
  objc_msgSend(a1, "maximumNormalizedPositionInAxisForScale:minScale:isMediaAxisNormal:isPositionBelowZero:", v27 != 0, y < 0.0, v23, a4);
  v25 = v24;
  v26 = v22;
  result.y = v25;
  result.x = v26;
  return result;
}

+ (double)maximumNormalizedPositionInAxisForScale:(double)a3 minScale:(double)a4 isMediaAxisNormal:(BOOL)a5 isPositionBelowZero:(BOOL)a6
{
  double v6;
  double v7;

  if (a5)
    a4 = 1.0;
  v6 = vabdd_f64(a3, a4) / a4;
  v7 = 2.0;
  if (a6)
    v7 = -2.0;
  return v6 / v7;
}

+ (double)calculateMinScaleForMediaAspectRatio:(double)a3 viewAspectRatio:(double)a4 fillMode:(int)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = 1.0;
  if (vabdd_f64(a3, a4) >= 0.0001 && (a3 <= -0.0000001 || a3 >= 0.0000001) && (a4 <= -0.0000001 || a4 >= 0.0000001))
  {
    v6 = a4;
    switch(a5)
    {
      case 0:
      case 3:
        goto LABEL_22;
      case 1:
        v7 = 1.0;
        if (a4 <= 1.0)
        {
          if (a3 < a4)
            v7 = a4 / a3;
        }
        else
        {
          v7 = a4 / a3;
          if (a4 / a3 < 1.0)
            v7 = 1.0;
        }
        goto LABEL_21;
      case 2:
        v7 = a4 / a3;
        if (a4 / a3 > 1.0)
          v7 = 1.0;
LABEL_21:
        v6 = v7 * a3;
        goto LABEL_22;
      default:
        if (a5 == 13)
        {
          v8 = a4 / a3;
          v9 = 1.0;
          if (v8 <= 1.0)
            v9 = v8;
          v5 = v9 / v8;
        }
        else
        {
          v6 = a3;
LABEL_22:
          v10 = a4 / a3;
          if (v10 > 1.0)
            v10 = 1.0;
          v5 = v10 * a3 / v6;
        }
        break;
    }
  }
  return v5;
}

+ (double)calculateMaxScale:(double)result forMediaAspectRatio:(double)a4 viewAspectRatio:(double)a5 fillMode:(int)a6
{
  double v6;
  double v7;
  double v8;
  double v9;

  if (vabdd_f64(a4, a5) >= 0.0001 && (a4 <= -0.0000001 || a4 >= 0.0000001) && (a5 <= -0.0000001 || a5 >= 0.0000001))
  {
    v6 = 1.0;
    v7 = a5;
    switch(a6)
    {
      case 0:
        break;
      case 1:
        if (a5 <= 1.0)
        {
          if (a4 < a5)
            v6 = a5 / a4;
        }
        else
        {
          v6 = a5 / a4;
          if (a5 / a4 < 1.0)
            v6 = 1.0;
        }
        goto LABEL_19;
      case 2:
        v6 = a5 / a4;
        if (a5 / a4 > 1.0)
          v6 = 1.0;
LABEL_19:
        v7 = v6 * a4;
        break;
      case 3:
        v7 = a5;
        break;
      default:
        v7 = a4;
        if (a6 == 13)
        {
          v7 = a5;
          v6 = a5 / a4;
        }
        break;
    }
    v8 = 1.0;
    if (a5 <= 1.0)
    {
      if (a4 < a5)
        v8 = a5 / a4;
    }
    else
    {
      v8 = a5 / a4;
      if (a5 / a4 < 1.0)
        v8 = 1.0;
    }
    v9 = v8 * a4 / v7;
    if (a6 == 13)
      v9 = v8 / v6;
    return v9 * result;
  }
  return result;
}

- (CGSize)mediaSize
{
  double width;
  double height;
  CGSize result;

  width = self->_mediaSize.width;
  height = self->_mediaSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)fillMode
{
  return self->_fillMode;
}

- (double)maxScale
{
  return self->_maxScale;
}

- (double)zoomSnapScale
{
  return self->_zoomSnapScale;
}

- (void)setZoomSnapScale:(double)a3
{
  self->_zoomSnapScale = a3;
}

- (BOOL)isZoomSnapEnabled
{
  return self->_isZoomSnapEnabled;
}

- (void)setIsZoomSnapEnabled:(BOOL)a3
{
  self->_isZoomSnapEnabled = a3;
}

- (double)zoomSnapThreshold
{
  return self->_zoomSnapThreshold;
}

- (void)setZoomSnapThreshold:(double)a3
{
  self->_zoomSnapThreshold = a3;
}

- (BOOL)isTranslationDirectionLockEnabled
{
  return self->_isTranslationDirectionLockEnabled;
}

- (void)setIsTranslationDirectionLockEnabled:(BOOL)a3
{
  self->_isTranslationDirectionLockEnabled = a3;
}

- (double)translationDirectionLockThreshold
{
  return self->_translationDirectionLockThreshold;
}

- (void)setTranslationDirectionLockThreshold:(double)a3
{
  self->_translationDirectionLockThreshold = a3;
}

- (BOOL)disableTranslation
{
  return self->_disableTranslation;
}

- (void)setDisableTranslation:(BOOL)a3
{
  self->_disableTranslation = a3;
}

- (BOOL)disableScale
{
  return self->_disableScale;
}

- (void)setDisableScale:(BOOL)a3
{
  self->_disableScale = a3;
}

- (BOOL)disableRotation
{
  return self->_disableRotation;
}

- (void)setDisableRotation:(BOOL)a3
{
  self->_disableRotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapTimer, 0);
}

@end
