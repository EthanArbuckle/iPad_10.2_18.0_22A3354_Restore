@implementation VKDaVinciGestureCameraController

- (VKDaVinciGestureCameraController)initWithCameraController:(id)a3 cameraManager:(void *)a4
{
  VKDaVinciGestureCameraController *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKDaVinciGestureCameraController;
  result = -[VKGestureCameraBehavior initWithCameraController:](&v6, sel_initWithCameraController_, a3);
  if (result)
  {
    result->super._notifyCameraStateChanges = 1;
    result->_cameraManager = a4;
  }
  return result;
}

- (void)beginZoom:(CGPoint)a3
{
  double y;
  double x;
  _WORD *cameraManager;
  uint64_t v6;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  cameraManager = self->_cameraManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[92] = 1;
  *((_BYTE *)cameraManager + 186) = 0;
  *((_QWORD *)cameraManager + 27) = v6;
  *((_QWORD *)cameraManager + 28) = 0x3FF0000000000000;
  *((_BYTE *)cameraManager + 240) = 0;

}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double y;
  double x;
  double *cameraManager;
  uint64_t v10;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  cameraManager = (double *)self->_cameraManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  v10 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[28] = cameraManager[28] * (a4 * 0.7 / a5 + 0.3);
  *((_QWORD *)cameraManager + 27) = v10;

}

- (void)endZoom:(CGPoint)a3
{
  double y;
  double x;
  _BYTE *cameraManager;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  cameraManager = self->_cameraManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[186] = 1;

}

- (void)beginPan:(CGPoint)a3
{
  double y;
  double x;
  char *cameraManager;
  uint64_t v6;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  cameraManager = (char *)self->_cameraManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  *((_WORD *)cameraManager + 8) = 1;
  cameraManager[18] = 0;
  cameraManager[80] = 0;
  *(_QWORD *)(cameraManager + 36) = v6;
  *(_QWORD *)(cameraManager + 20) = v6;
  *(_QWORD *)(cameraManager + 28) = v6;

}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  double y;
  double x;
  char *cameraManager;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  cameraManager = (char *)self->_cameraManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  *(_QWORD *)(cameraManager + 20) = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);

}

- (void)endPan:(CGPoint)a3
{
  double y;
  double x;
  _BYTE *cameraManager;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  cameraManager = self->_cameraManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[18] = 1;

}

- (void)beginRotate:(CGPoint)a3
{
  double y;
  double x;
  char *cameraManager;
  uint64_t v6;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  cameraManager = (char *)self->_cameraManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  *(_WORD *)(cameraManager + 81) = 1;
  cameraManager[83] = 0;
  *((_QWORD *)cameraManager + 14) = v6;
  *((_QWORD *)cameraManager + 15) = 0;

}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y;
  double x;
  double *cameraManager;
  uint64_t v8;
  id WeakRetained;

  y = a4.y;
  x = a4.x;
  self->super._pitching = 0;
  cameraManager = (double *)self->_cameraManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  v8 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[15] = cameraManager[15] + a3;
  *((_QWORD *)cameraManager + 14) = v8;

}

- (void)endRotate:(CGPoint)a3
{
  double y;
  double x;
  _BYTE *cameraManager;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  cameraManager = self->_cameraManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[83] = 1;

}

- (void)beginPitch:(CGPoint)a3
{
  double y;
  double x;
  VKCameraController **p_cameraController;
  id WeakRetained;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _WORD *cameraManager;
  id v11;
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  y = a3.y;
  x = a3.x;
  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "camera");
  self->_beganDoublePanPitch = *(double *)(v13 + 40);
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  self->_currentDoublePanPitch = self->_beganDoublePanPitch;
  cameraManager = self->_cameraManager;
  v11 = objc_loadWeakRetained((id *)p_cameraController);
  v12 = objc_msgSend(v11, "cursorFromScreenPoint:", x, y);
  cameraManager[64] = 1;
  *((_BYTE *)cameraManager + 130) = 0;
  *((_QWORD *)cameraManager + 22) = 0;
  *((_QWORD *)cameraManager + 20) = v12;
  *((_QWORD *)cameraManager + 21) = v12;

}

- (void)updatePitch:(CGPoint)a3 translation:(double)a4
{
  double y;
  double x;
  VKCameraController **p_cameraController;
  id WeakRetained;
  int v10;
  _WORD *cameraManager;
  id v12;
  uint64_t v13;
  id v14;
  double v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  double beganDoublePanPitch;
  double *v19;
  id v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  std::__shared_weak_count *v30;

  y = a3.y;
  x = a3.x;
  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  v10 = objc_msgSend(WeakRetained, "isPitchEnabled");

  if (v10)
  {
    self->super._rotating = 0;
    self->_isPitchIncreasing = a4 < 0.0;
    if (!self->super._pitching)
    {
      cameraManager = self->_cameraManager;
      v12 = objc_loadWeakRetained((id *)p_cameraController);
      v13 = objc_msgSend(v12, "cursorFromScreenPoint:", x, y);
      cameraManager[64] = 1;
      *((_BYTE *)cameraManager + 130) = 0;
      *((_QWORD *)cameraManager + 22) = 0;
      *((_QWORD *)cameraManager + 20) = v13;
      *((_QWORD *)cameraManager + 21) = v13;

      self->super._pitching = 1;
    }
    v14 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v14, "camera");
    v15 = *(double *)(v29 + 72);
    if (v30)
    {
      p_shared_owners = (unint64_t *)&v30->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)())v30->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v30);
      }
    }

    beganDoublePanPitch = self->_beganDoublePanPitch;
    v19 = (double *)self->_cameraManager;
    v20 = objc_loadWeakRetained((id *)p_cameraController);
    v21 = objc_msgSend(v20, "cursorFromScreenPoint:", x, y);
    v22 = beganDoublePanPitch - a4;
    v23 = fmax(v15, 0.0);
    if (v23 >= beganDoublePanPitch - a4)
    {
      if (v22 >= 0.0)
      {
LABEL_14:
        v26 = fmin(fmax(v22, 0.0), v15 + 0.0698131701);
        v27 = v26 - self->_currentDoublePanPitch;
        *((_QWORD *)v19 + 20) = v21;
        v19[22] = v27 + v19[22];

        self->_currentDoublePanPitch = v26;
        v28 = objc_loadWeakRetained((id *)p_cameraController);
        objc_msgSend(v28, "updateState");

        return;
      }
      v24 = 0.0698131701 / (v22 * -7.87816968 + 1.0);
      v25 = -0.0698131701;
    }
    else
    {
      v24 = 0.0698131701 / ((v23 - v22) * 7.87816968 + -1.0);
      v25 = v23 + 0.0698131701;
    }
    v22 = v24 + v25;
    goto LABEL_14;
  }
}

- (void)updatePitch:(CGPoint)a3 degrees:(double)a4
{
  double y;
  double x;
  VKCameraController **p_cameraController;
  id WeakRetained;
  int v10;
  double v11;
  _WORD *cameraManager;
  id v13;
  uint64_t v14;
  id v15;
  double v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  double *v19;
  id v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  id v25;
  uint64_t v26;
  std::__shared_weak_count *v27;

  y = a3.y;
  x = a3.x;
  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  v10 = objc_msgSend(WeakRetained, "isPitchEnabled");

  if (v10)
  {
    self->super._rotating = 0;
    v11 = a4 * 0.0174532925;
    self->_isPitchIncreasing = self->_currentDoublePanPitch < a4 * 0.0174532925;
    if (!self->super._pitching)
    {
      cameraManager = self->_cameraManager;
      v13 = objc_loadWeakRetained((id *)p_cameraController);
      v14 = objc_msgSend(v13, "cursorFromScreenPoint:", x, y);
      cameraManager[64] = 1;
      *((_BYTE *)cameraManager + 130) = 0;
      *((_QWORD *)cameraManager + 22) = 0;
      *((_QWORD *)cameraManager + 20) = v14;
      *((_QWORD *)cameraManager + 21) = v14;

      self->super._pitching = 1;
    }
    v15 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v15, "camera");
    v16 = *(double *)(v26 + 72);
    if (v27)
    {
      p_shared_owners = (unint64_t *)&v27->__shared_owners_;
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)())v27->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v27);
      }
    }

    v19 = (double *)self->_cameraManager;
    v20 = objc_loadWeakRetained((id *)p_cameraController);
    v21 = objc_msgSend(v20, "cursorFromScreenPoint:", x, y);
    v22 = fmax(v16, 0.0);
    if (v22 >= v11)
    {
      if (v11 < 0.0)
        v11 = 0.0698131701 / (a4 * -0.1375 + 1.0) + -0.0698131701;
    }
    else
    {
      v11 = 0.0698131701 / ((v22 - v11) * 7.87816968 + -1.0) + v22 + 0.0698131701;
    }
    v23 = fmin(fmax(v11, 0.0), v16 + 0.0698131701);
    v24 = v23 - self->_currentDoublePanPitch;
    *((_QWORD *)v19 + 20) = v21;
    v19[22] = v24 + v19[22];

    self->_currentDoublePanPitch = v23;
    v25 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v25, "updateState");

  }
}

- (void)endPitch:(CGPoint)a3
{
  double y;
  double x;
  _BYTE *cameraManager;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  cameraManager = self->_cameraManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[130] = 1;

}

- (BOOL)isPitchIncreasing
{
  return self->_isPitchIncreasing;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  void *cameraManager;
  id WeakRetained;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  cameraManager = self->_cameraManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "camera");
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  md::CameraManager::update((uint64_t)cameraManager, &v10, 0);
  v7 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

}

@end
