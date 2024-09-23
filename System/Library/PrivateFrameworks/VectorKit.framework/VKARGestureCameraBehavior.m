@implementation VKARGestureCameraBehavior

- (VKARGestureCameraBehavior)initWithARCameraController:(id)a3
{
  id v4;
  VKARGestureCameraBehavior *v5;
  VKARGestureCameraBehavior *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKARGestureCameraBehavior;
  v5 = -[VKGestureCameraBehavior initWithCameraController:](&v8, sel_initWithCameraController_, v4);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_arCameraController, v4);

  return v6;
}

- (void)beginPan:(CGPoint)a3
{
  double y;
  double x;
  VKARCameraController **p_arCameraController;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  Geocentric<double> *p_startPanPosition;
  double v14;
  float64x2_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  float64x2_t v19;
  uint64_t v20;
  float64x2_t v21;
  __int128 v22;
  double v23;

  y = a3.y;
  x = a3.x;
  p_arCameraController = &self->_arCameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_arCameraController);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "arCameraTransform");
  }
  else
  {
    v18 = 0;
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
  }

  v9 = objc_loadWeakRetained((id *)p_arCameraController);
  v10 = objc_msgSend(v9, "cursorFromScreenPoint:", x, y);

  v11 = objc_loadWeakRetained((id *)p_arCameraController);
  v12 = objc_msgSend(v11, "globeView");
  v19 = v15;
  v20 = v16;
  p_startPanPosition = &self->_startPanPosition;
  if (altitude::GlobeView::getDirFromScreenPosition(v12, &v21, v15.f64, (float)(int)v10, (float)SHIDWORD(v10))
    && altitude::Intersector::intersectRayWithVisibleSet(*(_QWORD *)(v12 + 456), &v19, &v21, (uint64_t)&v22))
  {
    v14 = v23;
    *(_OWORD *)p_startPanPosition->_e = v22;
    p_startPanPosition->_e[2] = v14;

  }
  else
  {

    p_startPanPosition->_e[0] = 0.0;
    p_startPanPosition->_e[1] = 0.0;
    p_startPanPosition->_e[2] = 0.0;
  }
}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  Geocentric<double> *p_startPanPosition;
  double y;
  double x;
  double v7;
  double v8;
  VKARCameraController **p_arCameraController;
  id WeakRetained;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  BOOL SpherePointIntersection;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  id v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  double v49;
  _OWORD v50[3];
  double v51;
  double v52[4];
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  _OWORD v59[3];
  uint64_t v60;

  p_startPanPosition = &self->_startPanPosition;
  if (*(_QWORD *)&self->_startPanPosition._e[0] | *(_QWORD *)&self->_startPanPosition._e[1] | *(_QWORD *)&self->_startPanPosition._e[2])
  {
    y = a4.y;
    x = a4.x;
    v7 = a3.y;
    v8 = a3.x;
    p_arCameraController = &self->_arCameraController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_arCameraController);
    v11 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);

    v12 = objc_loadWeakRetained((id *)p_arCameraController);
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "arCameraTransform");
    }
    else
    {
      v60 = 0;
      memset(v59, 0, sizeof(v59));
    }

    v14 = p_startPanPosition->_e[0];
    v15 = p_startPanPosition->_e[1];
    v16 = p_startPanPosition->_e[2];
    v17 = objc_loadWeakRetained((id *)p_arCameraController);
    v18 = sqrt(v14 * v14 + v15 * v15 + v16 * v16);
    SpherePointIntersection = altitude::GlobeView::getSpherePointIntersection(objc_msgSend(v17, "globeView"), v11, SHIDWORD(v11), (double *)v59, (uint64_t)&v56, v18);

    if (SpherePointIntersection)
    {
      v20 = objc_loadWeakRetained((id *)p_arCameraController);
      v21 = objc_msgSend(v20, "cursorFromScreenPoint:", v8, v7);

      v22 = objc_loadWeakRetained((id *)p_arCameraController);
      LOBYTE(v21) = altitude::GlobeView::getSpherePointIntersection(objc_msgSend(v22, "globeView"), v21, SHIDWORD(v21), (double *)v59, (uint64_t)&v53, v18);

      if ((v21 & 1) != 0)
      {
        v23 = objc_loadWeakRetained((id *)p_arCameraController);
        objc_msgSend(v23, "altitude");
        if (v24 < 10.0)
        {
          v28 = 112.94372;
        }
        else
        {
          v25 = objc_loadWeakRetained((id *)p_arCameraController);
          objc_msgSend(v25, "altitude");
          v27 = sqrt((v26 + 12756274.0) * v26);

          v28 = v27 * 0.01;
        }

        v29 = fmin(fmax(sqrt((v56 - v53) * (v56 - v53) + (v57 - v54) * (v57 - v54) + (v58 - v55) * (v58 - v55)), 0.0), v28)/ v28;
        if (v28 == 0.0)
          v29 = 1.0;
        v30 = -(v58 * v53 - v55 * v56);
        v31 = -(v54 * v56 - v57 * v53);
        v32 = -(v55 * v57 - v58 * v54);
        v33 = v53 * v56 + v54 * v57 + v55 * v58;
        v34 = v31 * v31 + v32 * v32 + v30 * v30;
        v35 = sqrt(v34 + v33 * v33) + v33;
        v36 = 1.0 / sqrt(v34 + v35 * v35);
        v52[0] = v36 * v32;
        v52[1] = v36 * v30;
        v52[2] = v36 * v31;
        v52[3] = v36 * v35;
        memset(v50, 0, 24);
        *((_QWORD *)&v50[1] + 1) = 0x3FF0000000000000;
        gm::Quaternion<double>::slerp((double *)v50, v52, v29 * v29 * (v29 * 2.0 + -3.0) + 1.0);
        v37 = v50[0];
        v38 = v50[1];
        v39 = objc_loadWeakRetained((id *)p_arCameraController);
        v40 = v39;
        if (v39)
        {
          objc_msgSend(v39, "offsetTransform");
        }
        else
        {
          v51 = 0.0;
          memset(v50, 0, sizeof(v50));
        }

        v41 = v51 * *((double *)&v37 + 1)
            - (*((double *)&v50[2] + 1) * *(double *)&v37
             - *(double *)&v50[2] * *((double *)&v38 + 1))
            + *((double *)&v50[1] + 1) * *(double *)&v38;
        v42 = *((double *)&v50[2] + 1) * *((double *)&v38 + 1)
            + *(double *)&v50[2] * *(double *)&v37
            - *((double *)&v50[1] + 1) * *((double *)&v37 + 1)
            + v51 * *(double *)&v38;
        v43 = *((double *)&v50[1] + 1) * *(double *)&v37
            + *(double *)&v50[2] * *((double *)&v37 + 1)
            + *((double *)&v50[2] + 1) * *(double *)&v38;
        *((double *)&v50[1] + 1) = *((double *)&v50[1] + 1) * *((double *)&v38 + 1)
                                 + v51 * *(double *)&v37
                                 + *((double *)&v50[2] + 1) * *((double *)&v37 + 1)
                                 - *(double *)&v50[2] * *(double *)&v38;
        *(double *)&v50[2] = v41;
        *((double *)&v50[2] + 1) = v42;
        v51 = -(v43 - v51 * *((double *)&v38 + 1));
        v44 = objc_loadWeakRetained((id *)p_arCameraController);
        v45 = v50[0];
        v46 = *(_QWORD *)&v50[1];
        v47 = *(_OWORD *)((char *)&v50[1] + 8);
        v48 = *((_QWORD *)&v50[2] + 1);
        v49 = v51;
        objc_msgSend(v44, "setOffsetTransform:", &v45);

      }
    }
  }
}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double y;
  double x;
  VKARCameraController **p_arCameraController;
  id WeakRetained;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64_t v28;
  __int128 v29;
  float64_t v30;
  uint64_t v31;
  float64x2_t v32[3];
  uint64_t v33;
  float64x2_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  float64x2_t v38;
  uint64_t v39;
  float64x2_t v40;

  y = a3.y;
  x = a3.x;
  p_arCameraController = &self->_arCameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_arCameraController);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "arCameraTransform");
  }
  else
  {
    v37 = 0;
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
  }

  v12 = objc_loadWeakRetained((id *)p_arCameraController);
  v13 = objc_msgSend(v12, "cursorFromScreenPoint:", x, y);

  v14 = objc_loadWeakRetained((id *)p_arCameraController);
  v15 = objc_msgSend(v14, "globeView");
  v38 = v34;
  v39 = v35;
  if (altitude::GlobeView::getDirFromScreenPosition(v15, &v40, v34.f64, (float)(int)v13, (float)SHIDWORD(v13))
    && altitude::Intersector::intersectRayWithVisibleSet(*(_QWORD *)(v15 + 456), &v38, &v40, (uint64_t)v32))
  {
    v16 = v32[1].f64[0];
    v25 = v32[0];

    v24 = v34;
    v17 = *(double *)&v35;
    v18 = objc_loadWeakRetained((id *)p_arCameraController);
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "offsetTransform", *(_OWORD *)&v24, *(_OWORD *)&v25);
    }
    else
    {
      v33 = 0;
      memset(v32, 0, sizeof(v32));
    }
    v20 = a4 * -0.7 / a5 + -0.3;
    v26 = vsubq_f64(v25, v24);
    v21 = v16 - v17;
    v22 = sqrt(vaddvq_f64(vmulq_f64(v26, v26)) + v21 * v21);
    v23 = v22 + v22 * v20;

    v32[0] = vmlaq_n_f64(v32[0], v26, v23 / v22);
    v32[1].f64[0] = v32[1].f64[0] + v23 / v22 * v21;
    v14 = objc_loadWeakRetained((id *)p_arCameraController);
    v27 = v32[0];
    v28 = v32[1].f64[0];
    v29 = *(__int128 *)((char *)&v32[1] + 8);
    v30 = v32[2].f64[1];
    v31 = v33;
    objc_msgSend(v14, "setOffsetTransform:", &v27);
  }

}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y;
  double x;
  VKARCameraController **p_arCameraController;
  id WeakRetained;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  double v14;
  __double2 v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
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
  float64x2_t v42;
  float64x2_t v43;
  __int128 v44;
  __int128 v45;
  double v46;
  double v47[7];
  float64x2_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  float64x2_t v52;
  uint64_t v53;
  float64x2_t v54;

  y = a4.y;
  x = a4.x;
  p_arCameraController = &self->_arCameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_arCameraController);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "arCameraTransform");
  }
  else
  {
    v51 = 0;
    v49 = 0u;
    v50 = 0u;
    v48 = 0u;
  }

  v10 = objc_loadWeakRetained((id *)p_arCameraController);
  v11 = objc_msgSend(v10, "cursorFromScreenPoint:", x, y);

  v12 = objc_loadWeakRetained((id *)p_arCameraController);
  v13 = objc_msgSend(v12, "globeView");
  v52 = v48;
  v53 = v49;
  if (altitude::GlobeView::getDirFromScreenPosition(v13, &v54, v48.f64, (float)(int)v11, (float)SHIDWORD(v11))
    && altitude::Intersector::intersectRayWithVisibleSet(*(_QWORD *)(v13 + 456), &v52, &v54, (uint64_t)&v43))
  {
    v14 = *(double *)&v44;
    v42 = v43;

    v15 = __sincos_stret(a3 * 0.5);
    v16 = objc_loadWeakRetained((id *)p_arCameraController);
    v12 = v16;
    if (v16)
    {
      objc_msgSend(v16, "offsetTransform");
      v17 = *((double *)&v45 + 1);
      v18 = *(double *)&v45;
      v19 = v46;
      v21 = *((double *)&v44 + 1);
      v20 = *(double *)&v44;
      v22 = v43.f64[1];
      v23 = v43.f64[0];
    }
    else
    {
      v46 = 0.0;
      v23 = 0.0;
      v44 = 0u;
      v45 = 0u;
      v43 = 0u;
      v22 = 0.0;
      v20 = 0.0;
      v19 = 0.0;
      v17 = 0.0;
      v18 = 0.0;
      v21 = 0.0;
    }
    _V17.D[1] = v42.f64[1];
    _D7 = v42.f64[1];
    __asm { FMLA            D16, D7, V17.D[1] }
    v31 = v15.__sinval / sqrt(_D16 + v14 * v14);
    v32 = v31 * v42.f64[0];
    v33 = vmuld_lane_f64(v31, v42, 1);
    v34 = v31 * v14;
    v35 = v17 * v33 - (v18 * v34 - v21 * v15.__cosval);
    v36 = v21 * v34 + v18 * v15.__cosval - v17 * v32;
    v37 = v17 * v15.__cosval - (v21 * v33 - v18 * v32) + v19 * v34;
    v38 = v21 * v32 + v18 * v33 + v17 * v34;
    v39 = -(v22 * v34 - v20 * v33) - (v22 * v34 - v20 * v33);
    v40 = -(v20 * v32 - v23 * v34) - (v20 * v32 - v23 * v34);
    v41 = -(v23 * v33 - v22 * v32) - (v23 * v33 - v22 * v32);
    v47[0] = v23 + v39 * v15.__cosval + v41 * v33 - v40 * v34;
    v47[1] = v22 + v39 * v34 + v40 * v15.__cosval - v41 * v32;
    v47[2] = v20 - v39 * v33 + v40 * v32 + v41 * v15.__cosval;
    v47[3] = v35 + v19 * v32;
    v47[4] = v36 + v19 * v33;
    v47[5] = v37;
    v47[6] = -(v38 - v19 * v15.__cosval);
    objc_msgSend(v12, "setOffsetTransform:", v47, *(_OWORD *)&v42, *(_OWORD *)&v43, v44, v45, *(_QWORD *)&v46);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_arCameraController);
}

@end
