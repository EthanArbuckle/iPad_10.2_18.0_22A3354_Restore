@implementation VKImageCanvas

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  -[VKCameraController updateWithTimestamp:withContext:](self->_cameraController._obj, "updateWithTimestamp:withContext:", a4, a3);
}

- (void)loadScene
{
  MapEngine *var0;
  char v3;

  var0 = self->_runLoopController->var0;
  if (var0)
  {
    v3 = 5;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v3);
  }
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6
{
  double var1;
  double var0;

  var1 = a3.var1;
  var0 = a3.var0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VKCameraController setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:](self->_cameraController._obj, "setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:", 2, 0, 0, var0, var1, a4, a5, a6, 0.0);
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  double v4;
  VKEdgeInsets v5;

  *(_QWORD *)&v5.bottom = *(_QWORD *)&a3.bottom;
  if (*(_QWORD *)&v5.top != *(_QWORD *)&self->_edgeInsets.top
    || *(_QWORD *)&a3.bottom != *(_QWORD *)&self->_edgeInsets.bottom)
  {
    HIDWORD(v4) = LODWORD(v5.left);
    self->_edgeInsets = v5;
    *(float *)&v4 = self->_edgeInsets.top;
    a3.left = self->_edgeInsets.left;
    a3.bottom = self->_edgeInsets.bottom;
    a3.right = self->_edgeInsets.right;
    -[VKCameraController setEdgeInsets:](self->_cameraController._obj, "setEdgeInsets:", v4, *(double *)&a3.left, *(double *)&a3.bottom, *(double *)&a3.right);
  }
}

- (void)renderSceneWithEngine:(void *)a3 completion:(function<void)(
{
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  double v15;
  void *f;
  _QWORD v17[3];
  _QWORD *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a4->__f_.__f_)
  {
    v7 = *((_QWORD *)a3 + 11);
    if (v7)
    {
      (*(void (**)(uint64_t, SEL))(*(_QWORD *)v7 + 32))(v7, a2);
      if (*((_QWORD *)a3 + 11) == *((_QWORD *)a3 + 8))
      {
        v9 = (std::__shared_weak_count *)*((_QWORD *)a3 + 9);
        *((_QWORD *)a3 + 8) = 0;
        *((_QWORD *)a3 + 9) = 0;
        if (v9)
        {
          p_shared_owners = (unint64_t *)&v9->__shared_owners_;
          do
            v11 = __ldaxr(p_shared_owners);
          while (__stlxr(v11 - 1, p_shared_owners));
          if (!v11)
          {
            ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
            std::__shared_weak_count::__release_weak(v9);
          }
        }
      }
      else
      {
        v8 = *((_QWORD *)a3 + 10);
        *((_QWORD *)a3 + 10) = 0;
        if (v8)
          (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
      }
      *((_QWORD *)a3 + 11) = 0;
    }
    v12 = *((_QWORD *)self->_taskContext.__ptr_ + 1);
    v17[0] = &off_1E42C7C10;
    v18 = v17;
    geo::TaskQueue::barrierSync(v12, v17);
    v13 = v18;
    if (v18 == v17)
    {
      v14 = 4;
      v13 = v17;
    }
    else
    {
      if (!v18)
        goto LABEL_17;
      v14 = 5;
    }
    (*(void (**)(void))(*v13 + 8 * v14))();
  }
LABEL_17:
  md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)a3 + 567), "-[VKImageCanvas renderSceneWithEngine:completion:]");
  v15 = CACurrentMediaTime();
  if (md::MapEngine::renderSceneSync((md::MapEngine *)a3, v15))
  {
    f = a4->__f_.__f_;
    if (f)
      (*(void (**)(void *))(*(_QWORD *)f + 48))(f);
  }
}

- (VKImageCanvas)initWithMapEngine:(void *)a3
{
  VKImageCanvas *v4;
  VKImageCanvas *v5;
  uint64_t v6;
  TaskContext *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v12;
  Camera *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  VKCamera *v20;
  VKCamera *obj;
  Camera *ptr;
  long double v23;
  long double v24;
  float64x2_t v25;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __int128 v38;
  float64x2_t v39;
  uint64_t v40;
  _QWORD v41[4];
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)VKImageCanvas;
  v4 = -[VKImageCanvas init](&v42, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_runLoopController = (RunLoopController *)*((_QWORD *)a3 + 15);
    objc_storeStrong((id *)&v4->_displayTarget, *((id *)a3 + 105));
    v7 = (TaskContext *)*((_QWORD *)a3 + 1);
    v6 = *((_QWORD *)a3 + 2);
    if (v6)
    {
      v8 = (unint64_t *)(v6 + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    cntrl = (std::__shared_weak_count *)v5->_taskContext.__cntrl_;
    v5->_taskContext.__ptr_ = v7;
    v5->_taskContext.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    *(_QWORD *)&v5->_edgeInsets.top = 0;
    *(_QWORD *)&v5->_edgeInsets.bottom = 0;
    *((_BYTE *)a3 + 976) = 1;
    v13 = (Camera *)*((_QWORD *)a3 + 133);
    v14 = *((_QWORD *)a3 + 134);
    if (v14)
    {
      v15 = (unint64_t *)(v14 + 8);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    v17 = (std::__shared_weak_count *)v5->_camera.__cntrl_;
    v5->_camera.__ptr_ = v13;
    v5->_camera.__cntrl_ = (__shared_weak_count *)v14;
    if (v17)
    {
      v18 = (unint64_t *)&v17->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v20 = -[VKCamera initWithRunLoopController:]([VKCamera alloc], "initWithRunLoopController:", v5->_runLoopController);
    obj = v5->_vkCamera._obj;
    v5->_vkCamera._obj = v20;

    -[VKCamera setNdcZNear:](v5->_vkCamera._obj, "setNdcZNear:", *(double *)(*(_QWORD *)(*((_QWORD *)a3 + 3) + 8) + 64));
    memset(v41, 0, 24);
    v41[3] = 0x3FF0000000000000;
    -[VKCamera setOrientation:](v5->_vkCamera._obj, "setOrientation:", v41);
    ptr = v5->_camera.__ptr_;
    v38 = *((_OWORD *)ptr + 1);
    v23 = tan(*((double *)ptr + 1) * 0.5 + 0.785398163);
    v24 = log(v23);
    *(_QWORD *)&v25.f64[0] = v38;
    v25.f64[1] = v24;
    __asm { FMOV            V2.2D, #0.5 }
    v39 = vmlaq_f64(_Q2, (float64x2_t)vdupq_n_s64(0x3FC45F306DC9C883uLL), v25);
    v40 = *((_QWORD *)&v38 + 1);
    -[VKCamera setMercatorPosition:](v5->_vkCamera._obj, "setMercatorPosition:", &v39);
    v31 = *((id *)a3 + 105);
    objc_msgSend(v31, "size");
    if (v32 > 0.0)
    {
      objc_msgSend(v31, "size");
      if (v33 > 0.0)
      {
        objc_msgSend(v31, "size");
        v35 = v34;
        objc_msgSend(v31, "size");
        -[VKCamera setAspectRatio:](v5->_vkCamera._obj, "setAspectRatio:", v35 / v36);
      }
    }

  }
  return v5;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = &off_1E42B4DB0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = &off_1E42B54B0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

- (shared_ptr<md::TaskContext>)taskContext
{
  TaskContext **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::TaskContext> result;

  cntrl = self->_taskContext.__cntrl_;
  *v2 = self->_taskContext.__ptr_;
  v2[1] = (TaskContext *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (TaskContext *)self;
  return result;
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5
{
  VKCameraController *v8;
  char isKindOfClass;
  id v10;

  v10 = a3;
  v8 = self->_cameraController._obj;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[VKCameraController setMapRegion:pitch:yaw:duration:timingCurve:completion:](self->_cameraController._obj, "setMapRegion:pitch:yaw:duration:timingCurve:completion:", v10, 0, 0, a4, a5, 0.0);

}

- (GEOMapRegion)mapRegion
{
  -[VKCameraController mapRegion](self->_cameraController._obj, "mapRegion");
  return (GEOMapRegion *)(id)objc_claimAutoreleasedReturnValue();
}

- (double)yaw
{
  double result;

  -[VKCameraController heading](self->_cameraController._obj, "heading");
  return result;
}

- (double)pitch
{
  double result;

  -[VKCameraController pitch](self->_cameraController._obj, "pitch");
  return result;
}

- (VKCamera)vkCamera
{
  return self->_vkCamera._obj;
}

- (void)cancelLoad
{
  MapEngine *var0;
  uint64_t v3;

  var0 = self->_runLoopController->var0;
  if (var0)
  {
    v3 = *((_QWORD *)var0 + 11);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 16))(v3, 1);
  }
}

- (int)mapType
{
  return self->_mapType;
}

- (void)setMapType:(int)a3
{
  self->_mapType = a3;
}

- (VKEdgeInsets)edgeInsets
{
  float top;
  float left;
  float bottom;
  float right;
  VKEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (shared_ptr<gdc::Camera>)camera
{
  Camera **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<gdc::Camera> result;

  cntrl = self->_camera.__cntrl_;
  *v2 = self->_camera.__ptr_;
  v2[1] = (Camera *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Camera *)self;
  return result;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;

  objc_storeStrong((id *)&self->_displayTarget, 0);
  cntrl = self->_camera.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  self->_vkCamera._vptr$_retain_ptr = (void **)&off_1E42B54B0;

  v6 = self->_taskContext.__cntrl_;
  if (v6)
  {
    v7 = (unint64_t *)((char *)v6 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v6 + 16))(v6);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
    }
  }
  self->_cameraController._vptr$_retain_ptr = (void **)&off_1E42B4DB0;

}

- (void)renderSceneWithEngine:completion:
{
  *a2 = &off_1E42C7C10;
}

- (_QWORD)renderSceneWithEngine:completion:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E42C7C10;
  return result;
}

@end
