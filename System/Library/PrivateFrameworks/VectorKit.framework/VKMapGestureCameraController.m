@implementation VKMapGestureCameraController

- (id).cxx_construct
{
  *((_BYTE *)self + 232) = 0;
  *((_BYTE *)self + 240) = 0;
  *((_BYTE *)self + 248) = 0;
  *((_BYTE *)self + 256) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomAnimation, 0);
}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double y;
  double x;
  id WeakRetained;
  void *v11;
  _BOOL4 v12;
  double v13;
  float64x2_t *v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  optional<double> *p_rubberbandZoomStartFactor;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  double v40;
  _QWORD v41[3];
  char v42;
  float64x2_t v43;
  double v44;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "vkCamera");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[VKGestureCameraBehavior allowsZoomRubberbanding](self, "allowsZoomRubberbanding");
  v13 = 1.0 - 1.0 / a4;
  if (v12 && self->_zoomPreviousT._value.data[0])
    v13 = *(double *)&self->_zoomPreviousT._hasValue;
  if (!v11)
    goto LABEL_24;
  objc_msgSend(v11, "groundPointFromScreenPoint:", x, y);
  if (!v42)
    goto LABEL_24;
  v14 = (float64x2_t *)objc_msgSend(v11, "position");
  v15 = v13;
  v16 = v15;
  v17 = (v14[1].f64[0] - v44 * v16) / (1.0 - v16);
  v18 = 1.0 / a5;
  v39 = vdivq_f64(vmlsq_lane_f64(*v14, v43, v16, 0), (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 - v16), 0));
  v40 = 1.0 - 1.0 / a5;
  v37 = vmulq_n_f64(vsubq_f64(v43, v39), v40);
  v19 = v17 + (v44 - v17) * v40;
  if (!v12 || (objc_msgSend(v11, "minHeight"), v19 >= v20) && (objc_msgSend(v11, "maxHeight"), v19 <= v21))
  {
    if (self->_rubberbandZoomStartFactor._value.data[0])
      self->_rubberbandZoomStartFactor._value.data[0] = 0;
    objc_msgSend(v11, "minHeight", *(_OWORD *)&v37);
    v30 = v29;
    objc_msgSend(v11, "maxHeight");
    goto LABEL_16;
  }
  p_rubberbandZoomStartFactor = &self->_rubberbandZoomStartFactor;
  if (!self->_rubberbandZoomStartFactor._value.data[0])
  {
    *(double *)&p_rubberbandZoomStartFactor->_hasValue = a5;
    self->_rubberbandZoomStartFactor._value.data[0] = 1;
    objc_msgSend(v11, "minHeight");
    v30 = v33;
    objc_msgSend(v11, "maxHeight");
LABEL_16:
    v32 = fmin(fmax(v19, v30), v31);
    v27 = v40;
    goto LABEL_22;
  }
  objc_msgSend(v11, "position");
  if (self->_rubberbandZoomStartFactor._value.data[0])
  {
    v23 = *(double *)&p_rubberbandZoomStartFactor->_hasValue;
    GEOConfigGetDouble();
    v25 = 1.0 / v23;
    v26 = 1.0 - 1.0 / v23;
    v27 = v40;
    if (v26 >= v40)
    {
      if (v40 >= v26)
      {
LABEL_21:
        v37 = vmulq_n_f64(vsubq_f64(v43, v39), v27);
        v32 = v17 + (v44 - v17) * v27;
LABEL_22:
        *(double *)&self->_zoomPreviousT._hasValue = v27;
        self->_zoomPreviousT._value.data[0] = 1;
        if (v32 != *(double *)(objc_msgSend(v11, "position", *(_OWORD *)&v37) + 16))
        {
          -[VKMapGestureCameraController positionClampedToCameraRestriction:](self, "positionClampedToCameraRestriction:", vaddq_f64(v38, v39), v32);
          v41[0] = v34;
          v41[1] = v35;
          v41[2] = v36;
          objc_msgSend(v11, "setPosition:", v41);
        }
LABEL_24:

        return;
      }
      v28 = 1.0 / ((v18 - v25) * 0.55 / v24 + 1.0) - 1.0;
    }
    else
    {
      v28 = 1.0 / ((v18 - v25) * 0.55 / v24 - 1.0) + 1.0;
    }
    v27 = v26 + v28 * v24;
    goto LABEL_21;
  }
  std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
}

- (void)endZoom:(CGPoint)a3
{
  if (self->_zoomPreviousT._value.data[0])
    self->_zoomPreviousT._value.data[0] = 0;
  if (self->_rubberbandZoomStartFactor._value.data[0])
    self->_rubberbandZoomStartFactor._value.data[0] = 0;
}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  double v4;
  double v5;
  double scalar;
  double y;
  double x;
  double v9;
  double v10;
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v14;
  id v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __double2 v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  int v29;
  int v30;
  double *v31;
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
  double *v45;
  CGFloat v46;
  uint64_t v47;
  uint64_t v48;
  CGFloat v49;
  CGPoint v50;
  double v51;
  double v52;
  double v53;
  CGPoint v54;
  uint64_t v55;
  uint64_t v56;
  VKCameraState v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  CGPoint v64;

  y = a4.y;
  x = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "vkCamera");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_loadWeakRetained((id *)p_cameraController);
  v16 = objc_msgSend(v15, "isPitched");

  if (!v16)
  {
    if (v14)
    {
      objc_msgSend(v14, "groundPointFromScreenPoint:", v10, v9);
      if (LOBYTE(v57.var0._rotation._imaginary._e[1]))
      {
        v4 = v57.var0._rotation._imaginary._e[2];
        scalar = v57.var0._rotation._scalar;
        v29 = 1;
      }
      else
      {
        v29 = 0;
      }
      objc_msgSend(v14, "groundPointFromScreenPoint:", x, y);
      v30 = LOBYTE(v57.var0._rotation._imaginary._e[1]);
      if (LOBYTE(v57.var0._rotation._imaginary._e[1]))
      {
        v30 = 1;
        x = v57.var0._rotation._imaginary._e[2];
        v5 = v57.var0._rotation._scalar;
      }
    }
    else
    {
      v30 = 0;
      v29 = 0;
    }
    goto LABEL_18;
  }
  objc_msgSend(v14, "pitch");
  v18 = v17;
  objc_msgSend(v14, "rightVector");
  v51 = v20;
  v52 = v19;
  v53 = v21;
  v54.x = x;
  v22 = __sincos_stret(v18 * -0.5);
  v23 = (double *)objc_msgSend(v14, "orientation");
  v24 = *v23;
  v25 = v23[1];
  v27 = v23[2];
  v26 = v23[3];
  v28 = objc_loadWeakRetained((id *)p_cameraController);
  objc_msgSend(v28, "centerScreenPoint");
  if (v14)
  {
    objc_msgSend(v14, "groundPointFromScreenPoint:");
  }
  else
  {
    v62 = 0u;
    v63 = 0u;
  }

  if ((_BYTE)v62)
  {
    v49 = y;
    v50.x = v10;
    v50.y = v9;
    v31 = (double *)objc_msgSend(v14, "position");
    v33 = *v31;
    v32 = v31[1];
    v34 = v31[2];
    if (v14)
    {
      objc_msgSend(v14, "cameraState");
    }
    else
    {
      v59 = 0;
      v60 = 0;
      v61 = 0;
    }
    v35 = v22.__sinval / sqrt(v53 * v53 + v52 * v52 + v51 * v51);
    v36 = v35 * v53;
    v37 = v35 * v52;
    v38 = v35 * v51;
    v39 = -((v32 - *(double *)&v63) * v38 - (v34 - *((double *)&v63 + 1)) * v37);
    v40 = -((v34 - *((double *)&v63 + 1)) * v36 - (v33 - *((double *)&v62 + 1)) * v38);
    v41 = -((v33 - *((double *)&v62 + 1)) * v37 - (v32 - *(double *)&v63) * v36);
    v42 = v40 + v40;
    v43 = v41 + v41;
    v57.var2._value = v24 * v38 + v25 * v22.__cosval - v27 * v36 + v26 * v37;
    v57.var3 = v27 * v22.__cosval - (v24 * v37 - v25 * v36) + v26 * v38;
    v58 = -(v24 * v36 + v25 * v37 + v27 * v38 - v26 * v22.__cosval);
    v57.var0._rotation._imaginary._e[1] = v33 + v43 * v37 + (v39 + v39) * v22.__cosval - v42 * v38;
    v57.var0._rotation._imaginary._e[2] = v32 - v43 * v36 + (v39 + v39) * v38 + v42 * v22.__cosval;
    v57.var0._rotation._scalar = v34 + v43 * v22.__cosval + v42 * v36 - (v39 + v39) * v37;
    v57.var1 = v27 * v37 - (v25 * v38 - v24 * v22.__cosval) + v26 * v36;
    v9 = v50.y;
    v10 = v50.x;
    VKCameraMakeGroundPoint(&v57, v50, v37, &v57.var0._rotation._imaginary._e[1]);
    v29 = LOBYTE(v57.var0._translation._e[0]);
    v4 = v57.var0._translation._e[1];
    scalar = v57.var0._translation._e[2];
    v64.x = v54.x;
    v64.y = v49;
    VKCameraMakeGroundPoint(&v57, v64, v44, &v57.var0._rotation._imaginary._e[1]);
    v30 = LOBYTE(v57.var0._translation._e[0]);
    x = v57.var0._translation._e[1];
    v5 = v57.var0._translation._e[2];
LABEL_18:
    if (v30 && v29)
    {
      v45 = (double *)objc_msgSend(v14, "position");
      -[VKMapGestureCameraController positionClampedToCameraRestriction:delta:](self, "positionClampedToCameraRestriction:delta:", *v45, v45[1], v45[2], x - v4, v5 - scalar, 0.0);
      v54.y = v46;
      v55 = v47;
      v56 = v48;
      objc_msgSend(v14, "setPosition:", &v54.y);
      self->_panLastScreenPoint.x = v10;
      self->_panLastScreenPoint.y = v9;
    }
  }

}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y;
  double x;
  id WeakRetained;
  void *v9;
  __double2 v10;
  double *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float64x2_t v17;
  float64x2_t v18;
  int8x16_t v19;
  float64x2_t v20;
  __int128 v21;
  float64x2_t v22;
  int8x16_t v23;
  float64x2_t v24;
  _OWORD v25[2];
  _QWORD v26[3];
  char v27;
  double v28;
  double v29;

  y = a4.y;
  x = a4.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "vkCamera");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "groundPointFromScreenPoint:", x, y);
    if (v27)
    {
      v10 = __sincos_stret(a3 * 0.5);
      v11 = (double *)objc_msgSend(v9, "position");
      v12 = v10.__sinval * (*v11 - v28 + *v11 - v28);
      -[VKMapGestureCameraController positionClampedToCameraRestriction:](self, "positionClampedToCameraRestriction:", *v11 - v12 * v10.__sinval + v10.__sinval * -2.0 * (v11[1] - v29) * v10.__cosval, v11[1] + v12 * v10.__cosval + v10.__sinval * -2.0 * (v11[1] - v29) * v10.__sinval, v11[2]);
      v26[0] = v13;
      v26[1] = v14;
      v26[2] = v15;
      objc_msgSend(v9, "setPosition:", v26);
      v16 = objc_msgSend(v9, "orientation");
      v17 = *(float64x2_t *)(v16 + 16);
      v18 = vmulq_n_f64(*(float64x2_t *)v16, v10.__cosval);
      v19 = (int8x16_t)vmulq_n_f64(*(float64x2_t *)v16, v10.__sinval);
      v20 = (float64x2_t)vextq_s8(v19, v19, 8uLL);
      *(_QWORD *)&v21 = *(_OWORD *)&vsubq_f64(v18, v20);
      *((_QWORD *)&v21 + 1) = *(_QWORD *)&vaddq_f64(v18, v20).f64[1];
      v22 = vmulq_n_f64(v17, v10.__cosval);
      v23 = (int8x16_t)vmulq_n_f64(v17, v10.__sinval);
      v24 = (float64x2_t)vextq_s8(v23, v23, 8uLL);
      *(_QWORD *)&v18.f64[0] = *(_OWORD *)&vaddq_f64(v22, v24);
      v18.f64[1] = vsubq_f64(v22, v24).f64[1];
      v25[0] = v21;
      v25[1] = v18;
      objc_msgSend(v9, "setOrientation:", v25);
    }
  }

}

- (void)beginPitch:(CGPoint)a3
{
  void *v4;
  double v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "vkCamera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pitch");
  self->_beganPitch = v5;

}

- (void)updatePitch:(CGPoint)a3 translation:(double)a4
{
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v8;
  int v9;
  double v10;
  double beganPitch;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __double2 v32;
  double *v33;
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
  id v44;
  double *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  double *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  int v64;
  id v65;
  void *v66;
  double v67[3];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  double v72[4];

  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "vkCamera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (a4 > 0.0) - (a4 < 0.0);
  v10 = fabs(a4);
  self->_isPitchIncreasing = v9 < 0;
  beganPitch = self->_beganPitch;
  if (v9 >= 0)
    v12 = -v10;
  else
    v12 = v10;
  objc_msgSend(v8, "maxPitch");
  v14 = v13;
  objc_msgSend(v8, "maxPitch");
  v16 = beganPitch + v12;
  if (v14 == 0.0)
    v17 = v14;
  else
    v17 = 0.0698131701;
  v18 = fmax(v15, 0.0);
  if (v18 >= v16)
  {
    if (v16 < 0.0)
      v16 = -(v17 + 1.0 / (v16 * 0.55 / v17 - 1.0) * v17);
  }
  else
  {
    v16 = v18 + (1.0 / ((v18 - v16) * 0.55 / v17 - 1.0) + 1.0) * v17;
  }
  objc_msgSend(v8, "maxPitch");
  v20 = v19;
  v21 = objc_loadWeakRetained((id *)p_cameraController);
  v22 = objc_msgSend(v21, "isPitched");

  objc_msgSend(v8, "pitch");
  v24 = v23;
  objc_msgSend(v8, "rightVector");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = fmin(fmax(v16, 0.0), v20 + 0.0698131701);
  v32 = __sincos_stret((v31 - v24) * 0.5);
  v33 = (double *)objc_msgSend(v8, "orientation");
  v34 = v32.__sinval / sqrt(v26 * v26 + v28 * v28 + v30 * v30);
  v35 = v34 * v26;
  v36 = v34 * v28;
  v37 = v34 * v30;
  v38 = v33[1];
  v39 = v33[2];
  v40 = v33[3];
  v41 = *v33 * v37 + v38 * v32.__cosval - v39 * v35 + v40 * v36;
  v42 = v39 * v32.__cosval - (*v33 * v36 - v38 * v35) + v40 * v37;
  v43 = *v33 * v35 + v38 * v36 + v39 * v37;
  v72[0] = v39 * v36 - (v38 * v37 - *v33 * v32.__cosval) + v40 * v35;
  v72[1] = v41;
  v72[2] = v42;
  v72[3] = -(v43 - v40 * v32.__cosval);
  v44 = objc_loadWeakRetained((id *)p_cameraController);
  objc_msgSend(v44, "centerScreenPoint");
  if (v8)
  {
    objc_msgSend(v8, "groundPointFromScreenPoint:");
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }

  if ((_BYTE)v70)
  {
    v45 = (double *)objc_msgSend(v8, "position");
    v46 = v45[1];
    v47 = *v45 - *((double *)&v70 + 1);
    v48 = v45[2];
    v49 = -((v46 - *(double *)&v71) * v37 - (v48 - *((double *)&v71 + 1)) * v36);
    v50 = -((v48 - *((double *)&v71 + 1)) * v35 - v47 * v37);
    v51 = -(v47 * v36 - (v46 - *(double *)&v71) * v35);
    v52 = v50 + v50;
    v53 = v51 + v51;
    *(double *)&v68 = *v45 + v53 * v36 + (v49 + v49) * v32.__cosval - v52 * v37;
    *((double *)&v68 + 1) = v46 - v53 * v35 + (v49 + v49) * v37 + v52 * v32.__cosval;
    *(double *)&v69 = v48 + v53 * v32.__cosval + v52 * v35 - (v49 + v49) * v36;
    objc_msgSend(v8, "setPosition:", &v68);
    objc_msgSend(v8, "setOrientation:", v72);
  }
  else
  {
    objc_msgSend(v8, "setOrientation:", v72);
    v54 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v54, "centerScreenPoint");
    if (v8)
    {
      objc_msgSend(v8, "groundPointFromScreenPoint:");
    }
    else
    {
      v68 = 0u;
      v69 = 0u;
    }

    v55 = (double *)objc_msgSend(v8, "position");
    v57 = *((double *)&v68 + 1);
    v56 = *(double *)&v69;
    v59 = *v55;
    v58 = v55[1];
    v60 = *(double *)objc_msgSend(v8, "position");
    v61 = *(double *)(objc_msgSend(v8, "position") + 8);
    v62 = *(double *)(objc_msgSend(v8, "position") + 16);
    v67[0] = v59 - v57 + v60;
    v67[1] = v58 - v56 + v61;
    v67[2] = v62;
    objc_msgSend(v8, "setPosition:", v67);
  }
  self->_currentPitch = v31;
  v63 = objc_loadWeakRetained((id *)p_cameraController);
  v64 = objc_msgSend(v63, "isPitched");

  if (((v22 | v64 ^ 1) & 1) == 0)
  {
    v65 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v65, "cameraDelegate");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "mapLayerDidBecomePitched:", 1);
    goto LABEL_24;
  }
  if (((v22 ^ 1 | v64) & 1) == 0)
  {
    v65 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v65, "cameraDelegate");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "mapLayerDidBecomePitched:", 0);
LABEL_24:

  }
}

- (void)updatePitch:(CGPoint)a3 degrees:(double)a4
{
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __double2 v28;
  double *v29;
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
  id v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;
  double *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  id v59;
  int v60;
  id v61;
  void *v62;
  double v63[3];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  double v68[4];

  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "vkCamera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = a4 * 0.0174532925;
  self->_isPitchIncreasing = self->_currentPitch < a4 * 0.0174532925;
  objc_msgSend(v8, "maxPitch");
  v11 = v10;
  objc_msgSend(v8, "maxPitch");
  if (v11 == 0.0)
    v13 = v11;
  else
    v13 = 0.0698131701;
  v14 = fmax(v12, 0.0);
  if (v14 >= v9)
  {
    if (v9 < 0.0)
      v9 = -(v13 + 1.0 / (a4 * 0.00959931089 / v13 - 1.0) * v13);
  }
  else
  {
    v9 = v14 + (1.0 / ((v14 - v9) * 0.55 / v13 - 1.0) + 1.0) * v13;
  }
  objc_msgSend(v8, "maxPitch");
  v16 = v15;
  v17 = objc_loadWeakRetained((id *)p_cameraController);
  v18 = objc_msgSend(v17, "isPitched");

  objc_msgSend(v8, "pitch");
  v20 = v19;
  objc_msgSend(v8, "rightVector");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = fmin(fmax(v9, 0.0), v16 + 0.0698131701);
  v28 = __sincos_stret((v27 - v20) * 0.5);
  v29 = (double *)objc_msgSend(v8, "orientation");
  v30 = v28.__sinval / sqrt(v22 * v22 + v24 * v24 + v26 * v26);
  v31 = v30 * v22;
  v32 = v30 * v24;
  v33 = v30 * v26;
  v34 = v29[1];
  v35 = v29[2];
  v36 = v29[3];
  v37 = *v29 * v33 + v34 * v28.__cosval - v35 * v31 + v36 * v32;
  v38 = v35 * v28.__cosval - (*v29 * v32 - v34 * v31) + v36 * v33;
  v39 = *v29 * v31 + v34 * v32 + v35 * v33;
  v68[0] = v35 * v32 - (v34 * v33 - *v29 * v28.__cosval) + v36 * v31;
  v68[1] = v37;
  v68[2] = v38;
  v68[3] = -(v39 - v36 * v28.__cosval);
  v40 = objc_loadWeakRetained((id *)p_cameraController);
  objc_msgSend(v40, "centerScreenPoint");
  if (v8)
  {
    objc_msgSend(v8, "groundPointFromScreenPoint:");
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }

  if ((_BYTE)v66)
  {
    v41 = (double *)objc_msgSend(v8, "position");
    v42 = v41[1];
    v43 = *v41 - *((double *)&v66 + 1);
    v44 = v41[2];
    v45 = -((v42 - *(double *)&v67) * v33 - (v44 - *((double *)&v67 + 1)) * v32);
    v46 = -((v44 - *((double *)&v67 + 1)) * v31 - v43 * v33);
    v47 = -(v43 * v32 - (v42 - *(double *)&v67) * v31);
    v48 = v46 + v46;
    v49 = v47 + v47;
    *(double *)&v64 = *v41 + v49 * v32 + (v45 + v45) * v28.__cosval - v48 * v33;
    *((double *)&v64 + 1) = v42 - v49 * v31 + (v45 + v45) * v33 + v48 * v28.__cosval;
    *(double *)&v65 = v44 + v49 * v28.__cosval + v48 * v31 - (v45 + v45) * v32;
    objc_msgSend(v8, "setPosition:", &v64);
    objc_msgSend(v8, "setOrientation:", v68);
  }
  else
  {
    objc_msgSend(v8, "setOrientation:", v68);
    v50 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v50, "centerScreenPoint");
    if (v8)
    {
      objc_msgSend(v8, "groundPointFromScreenPoint:");
    }
    else
    {
      v64 = 0u;
      v65 = 0u;
    }

    v51 = (double *)objc_msgSend(v8, "position");
    v53 = *((double *)&v64 + 1);
    v52 = *(double *)&v65;
    v55 = *v51;
    v54 = v51[1];
    v56 = *(double *)objc_msgSend(v8, "position");
    v57 = *(double *)(objc_msgSend(v8, "position") + 8);
    v58 = *(double *)(objc_msgSend(v8, "position") + 16);
    v63[0] = v55 - v53 + v56;
    v63[1] = v54 - v52 + v57;
    v63[2] = v58;
    objc_msgSend(v8, "setPosition:", v63);
  }
  self->_currentPitch = v27;
  v59 = objc_loadWeakRetained((id *)p_cameraController);
  v60 = objc_msgSend(v59, "isPitched");

  if (((v18 | v60 ^ 1) & 1) == 0)
  {
    v61 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v61, "cameraDelegate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "mapLayerDidBecomePitched:", 1);
    goto LABEL_21;
  }
  if (((v18 ^ 1 | v60) & 1) == 0)
  {
    v61 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v61, "cameraDelegate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "mapLayerDidBecomePitched:", 0);
LABEL_21:

  }
}

- (BOOL)isPitchIncreasing
{
  return self->_isPitchIncreasing;
}

- (Matrix<double,)positionClampedToCameraRestriction:()Matrix<double
{
  double v3;
  double v4;
  double v5;
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v8;
  void *v9;
  char v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _OWORD v29[5];
  VKCameraState v30;
  CGPoint v31;
  Matrix<double, 3, 1> result;

  v3 = a3._e[2];
  v4 = a3._e[1];
  v5 = a3._e[0];
  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "vkCamera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "regionRestriction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEmpty");

  if ((v10 & 1) == 0)
  {
    if (v8)
      objc_msgSend(v8, "cameraState");
    else
      memset(v29, 0, sizeof(v29));
    v11 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v11, "centerScreenPoint");
    VKCameraMakeGroundPoint(&v30, v31, v12, (double *)v29);

    objc_msgSend(v8, "groundPoint");
    v14 = v13;
    v16 = v15;
    v17 = v30.var0._translation._e[1];
    v18 = v30.var0._translation._e[2];
    objc_msgSend(v8, "regionRestriction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v17 - v14;
    v21 = v18 - v16;
    objc_msgSend(v19, "clampedPosition:", v20 + v5, v21 + v4);
    v23 = v22;
    v25 = v24;

    v5 = v23 - v20;
    v4 = v25 - v21;
  }

  v26 = v5;
  v27 = v4;
  v28 = v3;
  result._e[2] = v28;
  result._e[1] = v27;
  result._e[0] = v26;
  return result;
}

- (Matrix<double,)positionClampedToCameraRestriction:()Matrix<double delta:()3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
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
  _OWORD v37[5];
  VKCameraState v38;
  CGPoint v39;
  Matrix<double, 3, 1> result;

  v4 = a4._e[2];
  v5 = a4._e[1];
  v6 = a4._e[0];
  v7 = a3._e[2];
  v8 = a3._e[1];
  v9 = a3._e[0];
  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "vkCamera");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "regionRestriction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEmpty");

  if (v14)
  {
    v15 = v6 + v9;
    v16 = v5 + v8;
  }
  else
  {
    if (v12)
      objc_msgSend(v12, "cameraState");
    else
      memset(v37, 0, sizeof(v37));
    v17 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v17, "centerScreenPoint");
    v35 = v7;
    v36 = v4;
    VKCameraMakeGroundPoint(&v38, v39, v18, (double *)v37);

    objc_msgSend(v12, "groundPoint");
    v20 = v19;
    v22 = v21;
    v23 = v38.var0._translation._e[1];
    v24 = v38.var0._translation._e[2];
    objc_msgSend(v12, "regionRestriction");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v23 - v20;
    v27 = v24 - v22;
    objc_msgSend(v25, "clampedPositionForOrigin:delta:", v26 + v9, v27 + v8, v6, v5);
    v29 = v28;
    v31 = v30;

    v15 = v29 - v26;
    v16 = v31 - v27;
    v7 = v35;
    v4 = v36;
  }

  v32 = v15;
  v33 = v16;
  v34 = v4 + v7;
  result._e[2] = v34;
  result._e[1] = v33;
  result._e[0] = v32;
  return result;
}

@end
