@implementation PAEEquirectProjectFilter

- (PAEEquirectProjectFilter)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEEquirectProjectFilter;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (BOOL)addParameters
{
  void *v2;
  void *v3;

  v2 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A6DD0);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", CFSTR("X Rotation"), 1, 0, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", CFSTR("Y Rotation"), 2, 0, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", CFSTR("Z Rotation"), 3, 0, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", CFSTR("FrontFacing"), 4, 1, 0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", CFSTR("Initial YAW"), 5, 0, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", CFSTR("Quat X"), 6, 0, 0.0, -1024.0, 1024.0, -1024.0, 1024.0, 0.001);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", CFSTR("Quat Y"), 7, 0, 0.0, -1024.0, 1024.0, -1024.0, 1024.0, 0.001);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", CFSTR("Quat Z"), 8, 0, 0.0, -1024.0, 1024.0, -1024.0, 1024.0, 0.001);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", CFSTR("Quat W"), 9, 0, 0.0, -1024.0, 1024.0, -1024.0, 1024.0, 0.001);
  }
  return v3 != 0;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)variesOverTime
{
  return 0;
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 67584);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 591872);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PixelTransformSupport"), v4, CFSTR("TransformsFromLocalToScreenSpace"), v5, CFSTR("UsesRationalTime"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("SDRWorkingSpace"), v8, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a4 = 0;
  *a5 = 0;
  return 1;
}

- (PCMatrix44Tmpl<double>)getViewMatrix:(SEL)a3
{
  uint64_t v7;
  PCMatrix44Tmpl<double> *result;
  BOOL v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[8];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  v7 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  result = (PCMatrix44Tmpl<double> *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8380);
  if (v7)
    v9 = result == 0;
  else
    v9 = 1;
  if (!v9)
  {
    result = (PCMatrix44Tmpl<double> *)objc_msgSend((id)unk_1EF0BD720(result, "cameraMatrixAtTime:", a4.var0), "getBytes:length:", v14, 128);
    v10 = v14[1];
    *(_OWORD *)&retstr->var0[0][0] = v14[0];
    *(_OWORD *)&retstr->var0[0][2] = v10;
    v11 = v14[3];
    *(_OWORD *)&retstr->var0[1][0] = v14[2];
    *(_OWORD *)&retstr->var0[1][2] = v11;
    v12 = v14[5];
    *(_OWORD *)&retstr->var0[2][0] = v14[4];
    *(_OWORD *)&retstr->var0[2][2] = v12;
    v13 = v14[7];
    *(_OWORD *)&retstr->var0[3][0] = v14[6];
    *(_OWORD *)&retstr->var0[3][2] = v13;
  }
  return result;
}

- (void)getQuaternion:(id)a3 :(double *)a4 :(double *)a5 :(double *)a6 :(double *)a7
{
  void *v12;

  v12 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  objc_msgSend(v12, "getFloatValue:fromParm:atFxTime:", a4, 6, a3.var1);
  objc_msgSend(v12, "getFloatValue:fromParm:atFxTime:", a5, 7, a3.var1);
  objc_msgSend(v12, "getFloatValue:fromParm:atFxTime:", a6, 8, a3.var1);
  objc_msgSend(v12, "getFloatValue:fromParm:atFxTime:", a7, 9, a3.var1);
}

- (PCMatrix44Tmpl<double>)composeViewMatrix:(SEL)a3 withCameraBehavior:(id)a4 heroAngle:(int)a5
{
  double v10;
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
  double v27;
  double v28;
  double v29;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  long double v39;
  __double2 v40;
  __double2 v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
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
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  long double v75;
  double v76;
  __double2 v77;
  double v78;
  __double2 v79;
  double v80;
  __double2 v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  PCMatrix44Tmpl<double> *result;
  double v91;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  __int128 v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103[4];
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;

  v96 = 0.0;
  v97 = 0.0;
  v94 = 0.0;
  v95 = 0.0;
  -[PAEEquirectProjectFilter getQuaternion:::::](self, "getQuaternion:::::", a4.var1, &v97, &v96, &v95, &v94);
  v110 = v94;
  v111 = v97;
  v112 = v96;
  v113 = v95;
  v107 = 0.0;
  v108 = 0.0;
  v109 = 1.0;
  PCQuat<double>::transform<double>(&v110, &v107);
  v10 = sqrt(v107 * v107 + v108 * v108 + v109 * v109);
  if (v10 <= -0.000000100000001 || v10 >= 0.000000100000001)
  {
    v107 = v107 / v10;
    v108 = v108 / v10;
    v109 = v109 / v10;
  }
  v105 = 0.0;
  v106 = 0.0;
  v104 = 1.0;
  PCQuat<double>::transform<double>(&v110, &v104);
  v11 = sqrt(v104 * v104 + v105 * v105 + v106 * v106);
  if (v11 <= -0.000000100000001 || v11 >= 0.000000100000001)
  {
    v104 = v104 / v11;
    v105 = v105 / v11;
    v106 = v106 / v11;
  }
  v12 = v107;
  v13 = v108;
  v14 = v107 * 0.0;
  v15 = v108 * 0.0;
  v16 = v109;
  v17 = v109 + v107 * 0.0 + v108 * 0.0;
  if (v17 <= 1.0)
    v18 = v109 + v107 * 0.0 + v108 * 0.0;
  else
    v18 = 1.0;
  if (v17 >= -1.0)
    v19 = v18;
  else
    v19 = -1.0;
  v20 = acos(v19);
  v21 = 0.0;
  if (v20 > 0.00001)
  {
    v91 = v20;
    v22 = v12 + v15 + v16 * 0.0;
    v23 = v22 * 0.0;
    v24 = v14 + v13 + v16 * 0.0;
    v25 = v24 * 0.0;
    v26 = v22 + v24 * 0.0;
    v27 = v24 + v23;
    v28 = v23 + v25;
    v29 = sqrt(v28 * v28 + v26 * v26 + v27 * v27);
    if (v29 < 0.000000100000001 && v29 > -0.000000100000001)
      v29 = 1.0;
    v31 = v26 / v29;
    v32 = v27 / v29;
    v33 = v26 / v29 + v27 / v29 * 0.0;
    v34 = v28 / v29 * 0.0;
    v35 = v34 + v33;
    if (v34 + v33 <= 1.0)
      v36 = v34 + v33;
    else
      v36 = 1.0;
    if (v35 >= -1.0)
      v37 = v36;
    else
      v37 = -1.0;
    v38 = acos(v37);
    if (v34 + v32 + v31 * 0.0 < 0.0)
      v38 = 6.28318531 - v38;
    v21 = v38 + 1.57079633;
    v20 = v91;
  }
  v39 = v20;
  v40 = __sincos_stret(v20 * 0.5);
  v41 = __sincos_stret(v21 * 0.5);
  v42 = v40.__sinval * (v41.__sinval * 0.0);
  v43 = v40.__sinval * 0.0 * (v41.__sinval * 0.0);
  v44 = v40.__sinval * 0.0 * v41.__cosval;
  v45 = v40.__cosval * (v41.__sinval * 0.0);
  v103[0] = v40.__cosval * v41.__cosval - (v40.__sinval * 0.0 * v41.__sinval + v42 + v43);
  v103[1] = v40.__sinval * v41.__cosval + v45 + v43 - v40.__sinval * 0.0 * v41.__sinval;
  v103[2] = v44 + v45 + v40.__sinval * v41.__sinval - v43;
  v103[3] = v40.__cosval * v41.__sinval + v44 + v43 - v42;
  v101 = 0.0;
  v102 = 0.0;
  v100 = 1.0;
  PCQuat<double>::transform<double>(v103, &v100);
  v46 = sqrt(v100 * v100 + v101 * v101 + v102 * v102);
  if (v46 <= -0.000000100000001 || v46 >= 0.000000100000001)
  {
    v100 = v100 / v46;
    v101 = v101 / v46;
    v102 = v102 / v46;
  }
  v98 = xmmword_1B304EEE0;
  v99 = 0.0;
  PCQuat<double>::transform<double>(v103, (double *)&v98);
  v48 = *((double *)&v98 + 1);
  v47 = *(double *)&v98;
  v49 = v99;
  v50 = sqrt(*(double *)&v98 * *(double *)&v98 + *((double *)&v98 + 1) * *((double *)&v98 + 1) + v49 * v49);
  if (v50 <= -0.000000100000001 || v50 >= 0.000000100000001)
  {
    v47 = *(double *)&v98 / v50;
    v48 = *((double *)&v98 + 1) / v50;
    v49 = v99 / v50;
  }
  v51 = v104;
  v52 = v105;
  v53 = v106;
  v54 = v104 * v100 + v105 * v101 + v106 * v102;
  v55 = 1.0;
  if (v54 <= 1.0)
    v55 = v104 * v100 + v105 * v101 + v106 * v102;
  if (v54 >= -1.0)
    v56 = v55;
  else
    v56 = -1.0;
  v57 = acos(v56);
  if (v47 * v51 + v48 * v52 + v49 * v53 <= 0.0)
    v58 = v57;
  else
    v58 = -v57;
  v59 = fmod(v58, 6.28318531);
  if (v58 >= 0.0)
    v60 = v59;
  else
    v60 = v59 + 6.28318531;
  v61 = fmod(v39, 6.28318531);
  if (v39 >= 0.0)
    v62 = v61;
  else
    v62 = v61 + 6.28318531;
  v63 = fmod(v21, 6.28318531);
  if (v21 >= 0.0)
    v64 = v63;
  else
    v64 = v63 + 6.28318531;
  v65 = fmod(v62 + -1.57079633, 6.28318531);
  if (v62 + -1.57079633 >= 0.0)
    v66 = v65;
  else
    v66 = v65 + 6.28318531;
  -[PAEEquirectProjectFilter getInitialYaw:](self, "getInitialYaw:", a4.var1);
  v68 = v64 - v67;
  v69 = fmod(v64 - v67, 6.28318531);
  if (v68 < 0.0)
    v69 = v69 + 6.28318531;
  v70 = v69 + a6;
  v71 = fmod(v69 + a6, 6.28318531);
  if (v70 >= 0.0)
    v72 = v71;
  else
    v72 = v71 + 6.28318531;
  if (-[PAEEquirectProjectFilter getIsFrontFacing:](self, "getIsFrontFacing:", a4.var1))
  {
    if (a5 != 1)
    {
      v73 = fmod(-v60, 6.28318531);
      if (v60 <= 0.0)
        v60 = v73;
      else
        v60 = v73 + 6.28318531;
      v74 = fmod(-v66, 6.28318531);
      if (v66 <= 0.0)
        v66 = v74;
      else
        v66 = v74 + 6.28318531;
    }
    v75 = v72 + 3.14159265;
    v76 = fmod(v75, 6.28318531);
    if (v75 < 0.0)
      v76 = v76 + 6.28318531;
    v93 = v76;
  }
  else
  {
    v93 = v72;
  }
  v77 = __sincos_stret(v60 * 0.5);
  v78 = v77.__sinval * 0.0;
  v79 = __sincos_stret(v66 * 0.5);
  v80 = v79.__sinval * 0.0;
  v81 = __sincos_stret(v93 * 0.5);
  v82 = v79.__cosval * v77.__cosval - (v77.__sinval * v80 + v79.__sinval * v78 + v80 * v78);
  v83 = v79.__sinval * v77.__cosval + v79.__cosval * v78 + v80 * v78 - v77.__sinval * v80;
  v84 = v77.__cosval * v80 + v79.__cosval * v78 + v79.__sinval * v77.__sinval - v80 * v78;
  v85 = v79.__cosval * v77.__sinval + v77.__cosval * v80 + v80 * v78 - v79.__sinval * v78;
  v86 = v81.__sinval * 0.0 * v83;
  v87 = v81.__sinval * 0.0 * v85;
  v88 = v81.__sinval * 0.0 * v82;
  v89 = v81.__sinval * 0.0 * v84;
  v110 = v81.__cosval * v82 - (v87 + v86 + v81.__sinval * v84);
  v111 = v89 - v81.__sinval * v85 + v81.__cosval * v83 + v88;
  v112 = v87 - v86 + v81.__cosval * v84 + v81.__sinval * v82;
  v113 = v81.__sinval * v83 - v89 + v81.__cosval * v85 + v88;
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  PCMatrix44Tmpl<double>::setRotationFromQuaternion((uint64_t)retstr, &v110);
  return result;
}

- (double)convertToFOVYFromFOVX:(double)a3 width:(double)a4 height:(double)a5
{
  long double v7;
  long double v8;

  v7 = tan(a3 * 0.0174532925 * 0.5);
  v8 = atan2(a5, a4 / v7);
  return (v8 + v8) / 0.0174532925;
}

- (double)convertToFOVXFromFOVY:(double)a3 width:(double)a4 height:(double)a5
{
  long double v7;
  long double v8;

  v7 = tan(a3 * 0.0174532925 * 0.5);
  v8 = atan2(v7 * a4, a5);
  return (v8 + v8) / 0.0174532925;
}

- (void)getProjectionFOVYDegrees:(float *)a3 FOVXDegrees:(float *)a4 withFrameAspect:(double)a5 atTime:(id)a6
{
  double v9;
  double v10;
  long double v11;
  long double v12;

  objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8380), "focalLengthAtFxTime:", a6.var1);
  if (fabs(v9) != INFINITY)
  {
    v10 = 1.0 / v9;
    v11 = atan(1.0 / v9 * 36.0 * 0.5);
    *(float *)&v11 = (v11 + v11) * 57.2957795;
    *a4 = *(float *)&v11;
    v12 = atan(a5 * 36.0 * v10 * 0.5);
    *(float *)&v12 = (v12 + v12) * 57.2957795;
    *a3 = *(float *)&v12;
  }
}

- (BOOL)getIsFrontFacing:(id)a3
{
  void *v4;
  char v6;

  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v4)
  {
    v6 = 0;
    objc_msgSend(v4, "getBoolValue:fromParm:atFxTime:", &v6, 4, a3.var1);
    LOBYTE(v4) = v6 != 0;
  }
  return (char)v4;
}

- (double)getInitialYaw:(id)a3
{
  void *v4;
  double v6;

  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v4)
    return 0.0;
  v6 = 0.0;
  objc_msgSend(v4, "getFloatValue:fromParm:atFxTime:", &v6, 5, a3.var1);
  return v6;
}

- (HGEquirectProjectParams)getParams:(SEL)a3 withOutputImage:(id *)a4 inputImage:(id)a5 width:(id)a6 height:(unint64_t)a7 outputWidth:(unint64_t)a8 outputHeight:(unint64_t)a9 xRotation:(unint64_t)a10 yRotation:(double)a11 zRotation:(double)a12 cameraBehavior:(double)a13 paramAPI:(int)a14
{
  int v15;
  int v16;
  HGEquirectProjectParams *result;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;

  v15 = a8;
  v16 = a7;
  *(_OWORD *)retstr->var0 = xmmword_1B304F230;
  *(_OWORD *)&retstr->var1[1] = xmmword_1B304F230;
  *(_QWORD *)&retstr->var2[2] = 0x423400003F800000;
  retstr->var4 = 45.0;
  retstr->var5 = 0;
  *(_QWORD *)&retstr->var12 = 0;
  *(_QWORD *)&retstr->var14 = 0;
  *(_WORD *)&retstr->var16 = 0;
  *(_OWORD *)retstr->var18 = xmmword_1B304FAB0;
  *(_OWORD *)retstr->var19 = xmmword_1B3050190;
  *(_OWORD *)retstr->var20 = xmmword_1B304FAB0;
  *(_OWORD *)retstr->var21 = xmmword_1B3050190;
  result = (HGEquirectProjectParams *)-[PAEEquirectProjectFilter getProjectionFOVYDegrees:FOVXDegrees:withFrameAspect:atTime:](self, "getProjectionFOVYDegrees:FOVXDegrees:withFrameAspect:atTime:", &retstr->var3, &retstr->var4, a4->var0.var1, (double)a10 / (double)a9);
  if (self)
  {
    result = -[PAEEquirectProjectFilter composeViewMatrix:withCameraBehavior:heroAngle:](self, "composeViewMatrix:withCameraBehavior:heroAngle:", a4->var0.var1, a14, a12);
    v24 = v37;
    v25 = v40;
    v26 = v43;
    v27 = v38;
    v28 = v41;
    v29 = v44;
    v30 = v39;
    v31 = v42;
    v32 = v45;
  }
  else
  {
    v32 = 0.0;
    v31 = 0.0;
    v30 = 0.0;
    v29 = 0.0;
    v28 = 0.0;
    v27 = 0.0;
    v26 = 0.0;
    v25 = 0.0;
    v24 = 0.0;
  }
  retstr->var0[0] = v24;
  retstr->var0[1] = v25;
  retstr->var0[2] = v26;
  retstr->var1[0] = v27;
  retstr->var1[1] = v28;
  retstr->var1[2] = v29;
  retstr->var2[0] = v30;
  retstr->var2[1] = v31;
  retstr->var2[2] = v32;
  retstr->var12 = v16;
  retstr->var13 = v15;
  if (a6)
  {
    retstr->var12 = objc_msgSend(a6, "width");
    result = (HGEquirectProjectParams *)objc_msgSend(a6, "height");
    retstr->var13 = (int)result;
    if (self)
    {
      result = -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a6);
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
    }
    *(float32x4_t *)retstr->var20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v33), v34);
    *(float32x4_t *)retstr->var21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v35), v36);
  }
  if (a5)
  {
    retstr->var14 = objc_msgSend(a5, "width");
    result = (HGEquirectProjectParams *)objc_msgSend(a5, "height");
    retstr->var15 = (int)result;
    if (self)
    {
      result = -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a5);
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
    }
    *(float32x4_t *)retstr->var18 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v33), v34);
    *(float32x4_t *)retstr->var19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v35), v36);
  }
  *(_WORD *)&retstr->var16 = 256;
  return result;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  if (a3)
    *a3 = a5->var0;
  if (a4)
    *a4 = a5->var1;
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  float32x2_t v13;
  void *v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  LiHeEquirectProject *v23;
  float v24;
  HGCrop *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  HGTextureWrap *v30;
  char *v31;
  float v32;
  HGXForm *v33;
  unint64_t v34;
  unint64_t v35;
  float v36;
  HGXForm *v37;
  uint64_t v39;
  int v40;
  LiHgcEquirectProject *v41;
  LiHgcEquirectProject *v42;
  _BYTE v43[144];
  double v44[16];
  double v45[7];
  float64x2_t v46;
  double v47;
  uint64_t v48;
  float64x2_t v49;
  double v50;
  uint64_t v51;
  float64x2_t v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _OWORD v59[3];
  float32x2_t v60;
  float v61;
  float32x2_t v62;
  float v63;
  float32x2_t v64;
  float v65;
  float v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74[2];

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = (void *)v9;
    if (objc_msgSend(a3, "imageType") == 3)
    {
      v73 = 0.0;
      v74[0] = 0.0;
      v72 = 0.0;
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", v74, 1, a5->var0.var1);
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v73, 2, a5->var0.var1);
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v72, 3, a5->var0.var1);
      v71 = 0;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      if (a4)
      {
        objc_msgSend(a4, "imageInfo");
        v11 = *((_QWORD *)&v67 + 1);
        v12 = v67;
        objc_msgSend(a4, "heliumRef");
        v13 = v60;
      }
      else
      {
        v12 = 0;
        v11 = 0;
        v13 = 0;
      }
      v14 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("PE360FrontCameraBehavior"));
      if (v14 && (v15 = objc_msgSend(v14, "integerValue"), v15 != 2))
      {
        v40 = 0;
      }
      else
      {
        if (-[PAEEquirectProjectFilter getIsFrontFacing:](self, "getIsFrontFacing:", a5->var0.var1))
          v73 = -v73;
        v15 = 2;
        v40 = 1;
      }
      v16 = *(_OWORD *)&a5->var2;
      v59[0] = *(_OWORD *)&a5->var0.var0;
      v59[1] = v16;
      v59[2] = *(_OWORD *)&a5->var4;
      v17 = objc_msgSend(a3, "width");
      v18 = objc_msgSend(a3, "height");
      LODWORD(v39) = v15;
      -[PAEEquirectProjectFilter getParams:withOutputImage:inputImage:width:height:outputWidth:outputHeight:xRotation:yRotation:zRotation:cameraBehavior:paramAPI:](self, "getParams:withOutputImage:inputImage:width:height:outputWidth:outputHeight:xRotation:yRotation:zRotation:cameraBehavior:paramAPI:", v59, a3, a4, v12, v11, v17, v74[0], v73, v72, v18, v39, v10);
      v53 = v65;
      v58 = 0x3FF0000000000000;
      v46 = vcvtq_f64_f32(v60);
      v49 = vcvtq_f64_f32(v62);
      v47 = v61;
      v48 = 0;
      v50 = v63;
      v52 = vcvtq_f64_f32(v64);
      v51 = 0;
      v55 = 0;
      v54 = 0;
      v57 = 0;
      v56 = 0;
      -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
      -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
      v19 = v44[5];
      v20 = objc_msgSend(a3, "width");
      v21 = objc_msgSend(a3, "height");
      *(float *)&v22 = (float)v20;
      if ((float)v20 >= (float)v21)
        v23 = (LiHeEquirectProject *)objc_msgSend(a3, "height", v22);
      else
        v23 = (LiHeEquirectProject *)objc_msgSend(a3, "width", v22);
      v24 = computeDistanceToEquirectImagePlane((float)(unint64_t)v23, v66, v23);
      v25 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v25);
      v27 = HGRectMake4f(v26, 1.0, 1.0, (float)v12 + -2.0, (float)v11 + -2.0);
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 0, (float)(int)v27, (float)SHIDWORD(v27), (float)v28, (float)v29);
      (*(void (**)(HGCrop *, _QWORD, float32x2_t))(*(_QWORD *)v25 + 120))(v25, 0, v13);
      v30 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
      HGTextureWrap::HGTextureWrap(v30);
      HGTextureWrap::SetTextureWrapMode((uint64_t)v30, (const char *)3, v31);
      (*(void (**)(HGTextureWrap *, _QWORD, HGCrop *))(*(_QWORD *)v30 + 120))(v30, 0, v25);
      if ((HGTextureWrap *)v13 != v30)
      {
        if (v13)
          (*(void (**)(float32x2_t))(**(_QWORD **)&v13 + 24))(v13);
        v13 = (float32x2_t)v30;
        (*(void (**)(HGTextureWrap *))(*(_QWORD *)v30 + 16))(v30);
      }
      v32 = fabs(v44[0]) * (double)(v12 - 2);
      if ((v40 & -[PAEEquirectProjectFilter getIsFrontFacing:](self, "getIsFrontFacing:", a5->var0.var1)) == 1)
      {
        v33 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v33);
        (*(void (**)(HGXForm *, _QWORD, float32x2_t))(*(_QWORD *)v33 + 120))(v33, 0, v13);
        HGTransform::HGTransform((HGTransform *)v43);
        HGTransform::LoadIdentity((HGTransform *)v43);
        HGTransform::Translate((HGTransform *)v43, (float)-(float)(v32 * 0.5), 0.0, 0.0);
        HGTransform::Scale((HGTransform *)v43, -1.0, 1.0, 1.0);
        HGTransform::Translate((HGTransform *)v43, (float)(v32 * 0.5), 0.0, 0.0);
        (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v33 + 576))(v33, v43);
        if ((HGXForm *)v13 != v33)
        {
          if (v13)
            (*(void (**)(float32x2_t))(**(_QWORD **)&v13 + 24))(v13);
          v13 = (float32x2_t)v33;
          (*(void (**)(HGXForm *))(*(_QWORD *)v33 + 16))(v33);
        }
        HGTransform::~HGTransform((HGTransform *)v43);
        (*(void (**)(HGXForm *))(*(_QWORD *)v33 + 24))(v33);
      }
      v34 = objc_msgSend(a3, "width");
      v35 = objc_msgSend(a3, "height");
      v36 = fabs(v19) * (double)(v11 - 2);
      NewEquirectProjectNode(v46.f64, v45, v44, 1, &v42, v32, v36, (float)v34, (float)v35, v24);
      (*(void (**)(LiHgcEquirectProject *, _QWORD, float32x2_t))(*(_QWORD *)v42 + 120))(v42, 0, v13);
      v41 = v42;
      if (v42)
        (*(void (**)(LiHgcEquirectProject *))(*(_QWORD *)v42 + 16))(v42);
      if (-[PAEEquirectProjectFilter getIsFrontFacing:](self, "getIsFrontFacing:", a5->var0.var1) && (v15 | 2) == 2)
      {
        v37 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v37);
        (*(void (**)(HGXForm *, _QWORD, LiHgcEquirectProject *))(*(_QWORD *)v37 + 120))(v37, 0, v41);
        HGTransform::HGTransform((HGTransform *)v43);
        HGTransform::LoadIdentity((HGTransform *)v43);
        HGTransform::Translate((HGTransform *)v43, (float)-(float)(v32 * 0.5), 0.0, 0.0);
        HGTransform::Scale((HGTransform *)v43, -1.0, 1.0, 1.0);
        HGTransform::Translate((HGTransform *)v43, (float)(v32 * 0.5), 0.0, 0.0);
        (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v37 + 576))(v37, v43);
        if (v41 != (LiHgcEquirectProject *)v37)
        {
          if (v41)
            (*(void (**)(void))(*(_QWORD *)v41 + 24))();
          v41 = (LiHgcEquirectProject *)v37;
          (*(void (**)(HGXForm *))(*(_QWORD *)v37 + 16))(v37);
        }
        HGTransform::~HGTransform((HGTransform *)v43);
        (*(void (**)(HGXForm *))(*(_QWORD *)v37 + 24))(v37);
      }
      objc_msgSend(a3, "setHeliumRef:", &v41);
      if (v41)
        (*(void (**)(LiHgcEquirectProject *))(*(_QWORD *)v41 + 24))(v41);
      if (v42)
        (*(void (**)(LiHgcEquirectProject *))(*(_QWORD *)v42 + 24))(v42);
      (*(void (**)(HGTextureWrap *))(*(_QWORD *)v30 + 24))(v30);
      (*(void (**)(HGCrop *))(*(_QWORD *)v25 + 24))(v25);
      if (v13)
        (*(void (**)(float32x2_t))(**(_QWORD **)&v13 + 24))(v13);
      LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)frameCleanup
{
  return 1;
}

@end
