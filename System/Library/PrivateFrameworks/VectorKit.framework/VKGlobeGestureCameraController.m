@implementation VKGlobeGestureCameraController

- (void)setGlobeView:(void *)a3
{
  self->_globeView = a3;
}

- (void)setCameraManager:(void *)a3
{
  self->_cameraManager = a3;
}

- (void)beginZoom:(CGPoint)a3
{
  _WORD *cameraManager;
  double y;
  double x;
  uint64_t v6;
  id WeakRetained;

  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[88] = 1;
    *((_BYTE *)cameraManager + 178) = 0;
    *((_QWORD *)cameraManager + 26) = v6;
    *((_QWORD *)cameraManager + 27) = 0x3FF0000000000000;
    *((_BYTE *)cameraManager + 232) = 0;

  }
}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double *cameraManager;
  double y;
  double x;
  VKCameraController **p_cameraController;
  uint64_t v11;
  id WeakRetained;
  id v13;

  cameraManager = (double *)self->_cameraManager;
  if (cameraManager)
  {
    if (self->_globeView)
    {
      y = a3.y;
      x = a3.x;
      p_cameraController = &self->super._cameraController;
      WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
      v11 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
      cameraManager[27] = cameraManager[27] * (a4 * 0.7 / a5 + 0.3);
      *((_QWORD *)cameraManager + 26) = v11;

      v13 = objc_loadWeakRetained((id *)p_cameraController);
      objc_msgSend(v13, "setUserChangedZoomSinceLastProgrammaticRegionChange:", 1);

    }
  }
}

- (void)endZoom:(CGPoint)a3
{
  _BYTE *cameraManager;
  double y;
  double x;
  id WeakRetained;

  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[178] = 1;

  }
}

- (void)beginPan:(CGPoint)a3
{
  char *cameraManager;
  double y;
  double x;
  uint64_t v6;
  id WeakRetained;

  cameraManager = (char *)self->_cameraManager;
  if (cameraManager)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    *((_WORD *)cameraManager + 4) = 1;
    cameraManager[10] = 0;
    cameraManager[72] = 0;
    *(_QWORD *)(cameraManager + 28) = v6;
    *(_QWORD *)(cameraManager + 12) = v6;
    *(_QWORD *)(cameraManager + 20) = v6;

  }
}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  char *cameraManager;
  double y;
  double x;
  id WeakRetained;

  cameraManager = (char *)self->_cameraManager;
  if (cameraManager)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    *(_QWORD *)(cameraManager + 12) = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);

  }
}

- (void)endPan:(CGPoint)a3
{
  _BYTE *cameraManager;
  double y;
  double x;
  id WeakRetained;

  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[10] = 1;

  }
}

- (void)beginRotate:(CGPoint)a3
{
  char *cameraManager;
  double y;
  double x;
  uint64_t v6;
  id WeakRetained;

  cameraManager = (char *)self->_cameraManager;
  if (cameraManager)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    *(_WORD *)(cameraManager + 73) = 1;
    cameraManager[75] = 0;
    *((_QWORD *)cameraManager + 13) = v6;
    *((_QWORD *)cameraManager + 14) = 0;

  }
}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double *cameraManager;
  double y;
  double x;
  uint64_t v8;
  id WeakRetained;

  cameraManager = (double *)self->_cameraManager;
  if (cameraManager)
  {
    y = a4.y;
    x = a4.x;
    self->super._pitching = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    v8 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[14] = cameraManager[14] + a3;
    *((_QWORD *)cameraManager + 13) = v8;

  }
}

- (void)endRotate:(CGPoint)a3
{
  _BYTE *cameraManager;
  double y;
  double x;
  id WeakRetained;

  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[75] = 1;

  }
}

- (void)beginPitch:(CGPoint)a3
{
  _WORD *cameraManager;
  _QWORD *globeView;
  double y;
  double x;
  double v7;
  uint64_t v8;
  id WeakRetained;

  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    globeView = self->_globeView;
    if (globeView)
    {
      y = a3.y;
      x = a3.x;
      v7 = *(double *)(globeView[9] + 40);
      self->_beganDoublePanPitch = v7;
      self->_currentDoublePanPitch = v7;
      WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
      v8 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
      cameraManager[60] = 1;
      *((_BYTE *)cameraManager + 122) = 0;
      *((_QWORD *)cameraManager + 21) = 0;
      *((_QWORD *)cameraManager + 19) = v8;
      *((_QWORD *)cameraManager + 20) = v8;

    }
  }
}

- (void)updatePitch:(CGPoint)a3 translation:(double)a4
{
  double y;
  double x;
  int v8;
  _WORD *cameraManager;
  uint64_t v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double beganDoublePanPitch;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id WeakRetained;
  id v25;
  id v26;
  id v27;

  if (self->_cameraManager)
  {
    if (self->_globeView)
    {
      y = a3.y;
      x = a3.x;
      WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
      v8 = objc_msgSend(WeakRetained, "isPitchEnabled");

      if (v8)
      {
        self->super._rotating = 0;
        self->_isPitchIncreasing = a4 < 0.0;
        if (!self->super._pitching)
        {
          cameraManager = self->_cameraManager;
          v25 = objc_loadWeakRetained((id *)&self->super._cameraController);
          v10 = objc_msgSend(v25, "cursorFromScreenPoint:", x, y);
          cameraManager[60] = 1;
          *((_BYTE *)cameraManager + 122) = 0;
          *((_QWORD *)cameraManager + 21) = 0;
          *((_QWORD *)cameraManager + 19) = v10;
          *((_QWORD *)cameraManager + 20) = v10;

          self->super._pitching = 1;
        }
        v11 = (double *)self->_cameraManager;
        if (*((_BYTE *)v11 + 233))
        {
          v12 = *(double *)(*((_QWORD *)self->_globeView + 9) + 32);
          v13 = 0.0;
          if (v12 <= 1500000.0)
          {
            v14 = 1.0;
            v15 = fmax(v12, 1.0);
            v13 = 0.680678408 - cos(sqrt(v15 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
            if (*((_DWORD *)v11 + 59) == 1)
            {
              if (v15 < 20000.0)
                v14 = v11[40] + v15 * 0.00005 * (1.0 - v11[40]);
              v13 = v14 * v13;
            }
            if (*((_BYTE *)v11 + 241))
              v13 = v11[33] + fmin(fmax(v11[32], 0.0), 1.0) * (v13 - v11[33]);
          }
        }
        else
        {
          v13 = 1.57079633;
        }
        beganDoublePanPitch = self->_beganDoublePanPitch;
        v26 = objc_loadWeakRetained((id *)&self->super._cameraController);
        v17 = objc_msgSend(v26, "cursorFromScreenPoint:", x, y);
        v18 = beganDoublePanPitch - a4;
        v19 = fmax(v13, 0.0);
        if (v19 >= beganDoublePanPitch - a4)
        {
          if (v18 >= 0.0)
          {
LABEL_21:
            v22 = fmin(fmax(v18, 0.0), v13 + 0.0698131701);
            v23 = v22 - self->_currentDoublePanPitch;
            *((_QWORD *)v11 + 19) = v17;
            v11[21] = v23 + v11[21];

            self->_currentDoublePanPitch = v22;
            v27 = objc_loadWeakRetained((id *)&self->super._cameraController);
            objc_msgSend(v27, "updateState");

            return;
          }
          v20 = 0.0698131701 / (v18 * -7.87816968 + 1.0);
          v21 = -0.0698131701;
        }
        else
        {
          v20 = 0.0698131701 / ((v19 - v18) * 7.87816968 + -1.0);
          v21 = v19 + 0.0698131701;
        }
        v18 = v20 + v21;
        goto LABEL_21;
      }
    }
  }
}

- (void)updatePitch:(CGPoint)a3 degrees:(double)a4
{
  double y;
  double x;
  int v8;
  double v9;
  _WORD *cameraManager;
  uint64_t v11;
  double *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id WeakRetained;
  id v23;
  id v24;
  id v25;

  if (self->_cameraManager)
  {
    if (self->_globeView)
    {
      y = a3.y;
      x = a3.x;
      WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
      v8 = objc_msgSend(WeakRetained, "isPitchEnabled");

      if (v8)
      {
        self->super._rotating = 0;
        v9 = a4 * 0.0174532925;
        self->_isPitchIncreasing = self->_currentDoublePanPitch < a4 * 0.0174532925;
        if (!self->super._pitching)
        {
          cameraManager = self->_cameraManager;
          v23 = objc_loadWeakRetained((id *)&self->super._cameraController);
          v11 = objc_msgSend(v23, "cursorFromScreenPoint:", x, y);
          cameraManager[60] = 1;
          *((_BYTE *)cameraManager + 122) = 0;
          *((_QWORD *)cameraManager + 21) = 0;
          *((_QWORD *)cameraManager + 19) = v11;
          *((_QWORD *)cameraManager + 20) = v11;

          self->super._pitching = 1;
        }
        v12 = (double *)self->_cameraManager;
        if (*((_BYTE *)v12 + 233))
        {
          v13 = *(double *)(*((_QWORD *)self->_globeView + 9) + 32);
          v14 = 0.0;
          if (v13 <= 1500000.0)
          {
            v15 = 1.0;
            v16 = fmax(v13, 1.0);
            v14 = 0.680678408 - cos(sqrt(v16 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
            if (*((_DWORD *)v12 + 59) == 1)
            {
              if (v16 < 20000.0)
                v15 = v12[40] + v16 * 0.00005 * (1.0 - v12[40]);
              v14 = v15 * v14;
            }
            if (*((_BYTE *)v12 + 241))
              v14 = v12[33] + fmin(fmax(v12[32], 0.0), 1.0) * (v14 - v12[33]);
          }
        }
        else
        {
          v14 = 1.57079633;
        }
        v24 = objc_loadWeakRetained((id *)&self->super._cameraController);
        v17 = objc_msgSend(v24, "cursorFromScreenPoint:", x, y);
        v18 = fmax(v14, 0.0);
        if (v18 >= v9)
        {
          v19 = v24;
          if (v9 < 0.0)
            v9 = 0.0698131701 / (a4 * -0.1375 + 1.0) + -0.0698131701;
        }
        else
        {
          v9 = 0.0698131701 / ((v18 - v9) * 7.87816968 + -1.0) + v18 + 0.0698131701;
          v19 = v24;
        }
        v20 = fmin(fmax(v9, 0.0), v14 + 0.0698131701);
        v21 = v20 - self->_currentDoublePanPitch;
        *((_QWORD *)v12 + 19) = v17;
        v12[21] = v21 + v12[21];

        self->_currentDoublePanPitch = v20;
        v25 = objc_loadWeakRetained((id *)&self->super._cameraController);
        objc_msgSend(v25, "updateState");

      }
    }
  }
}

- (void)endPitch:(CGPoint)a3
{
  _BYTE *cameraManager;
  double y;
  double x;
  id WeakRetained;

  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[122] = 1;

  }
}

- (BOOL)isPitchIncreasing
{
  return self->_isPitchIncreasing;
}

@end
