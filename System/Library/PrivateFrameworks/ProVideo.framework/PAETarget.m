@implementation PAETarget

- (PAETarget)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAETarget;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAETarget;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3 | -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend((id)v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Target::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend((id)v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Target::Angle"), 0, 0), 2, 0, 22.5, 0.0, 6.28318531);
    objc_msgSend((id)v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Target::Crop"), 0, 0), 3, 1, 33);
  }
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  double v16;
  double v17;
  double v18;
  __double2 v19;
  int v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  float v24;
  float v25;
  float cosval;
  float sinval;
  float v28;
  float v29;
  float v30;
  float v31;
  __n128 v32;
  __n128 v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  float v44;
  float v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  double v51;
  double v52;
  double v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v61;
  float v62;
  float v66;
  BOOL v70;
  float v71;
  BOOL v75;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned int v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __n128 v85;
  char *v87;
  HGRect v88;
  HGNode *v89;
  double v90;
  double v91;
  char v92;
  double v93;
  double v94;
  double v95;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    goto LABEL_17;
  v12 = objc_msgSend(v10, "versionAtCreation");
  v13 = objc_msgSend(a4, "width");
  v14 = objc_msgSend(a4, "height");
  var1 = a5->var0.var1;
  v94 = 0.0;
  v95 = 0.0;
  objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v95, &v94, 1, var1);
  v16 = v95;
  v17 = -1.0;
  if (v95 < -1.0)
    v16 = -1.0;
  if (v16 > 2.0)
    v16 = 2.0;
  if (v94 >= -1.0)
    v17 = v94;
  if (v17 > 2.0)
    v17 = 2.0;
  v18 = (double)v13;
  v94 = v17 * (double)v14;
  v95 = v16 * (double)v13;
  v93 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v93, 2, var1);
  v92 = 0;
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v92, 3, var1);
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  v19 = __sincos_stret(v93);
  v20 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (v20)
  {
    if (objc_msgSend(a4, "imageType") == 3)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v89 = 0;
      v21 = (char *)HGObject::operator new(0x1C0uLL);
      HgcTarget::HgcTarget((HgcTarget *)v21);
      *(_QWORD *)v21 = &unk_1E64E0A18;
      *((_QWORD *)v21 + 52) = 0;
      *(_OWORD *)(v21 + 424) = HGRectInfinite;
      HGNode::SetInput((HGNode *)v21, 0, v89);
      v22 = objc_msgSend(a4, "width");
      v95 = v95 + (double)v22 * -0.5;
      v23 = objc_msgSend(a4, "height");
      v94 = v94 + (double)v23 * -0.5;
      v24 = v95;
      v25 = v94;
      (*(void (**)(char *, _QWORD, float, float, float, float))(*(_QWORD *)v21 + 96))(v21, 0, v24, v25, 0.0, 0.0);
      cosval = v19.__cosval;
      sinval = v19.__sinval;
      (*(void (**)(char *, uint64_t, float, float, float, float))(*(_QWORD *)v21 + 96))(v21, 1, cosval, sinval, 0.0, 0.0);
      v28 = 1.0 / v90;
      v29 = 1.0 / v91;
      v30 = v90;
      v31 = v91;
      (*(void (**)(char *, uint64_t, float, float, float, float))(*(_QWORD *)v21 + 96))(v21, 2, v28, v29, v30, v31);
      v32.n128_u32[0] = 1.0;
      v33.n128_u32[0] = -1.0;
      if (v12)
        v33.n128_f32[0] = 1.0;
      (*(void (**)(char *, uint64_t, __n128, __n128, float, float))(*(_QWORD *)v21 + 96))(v21, 3, v32, v33, 1.0, 1.0);
      HTarget::SetFrameSize((uint64_t)v21, objc_msgSend(a4, "width"), objc_msgSend(a4, "height"));
      v34 = v94;
      v35 = v95;
      v37 = HGRectMake4f(v36, -(float)((float)v13 * 0.5), -(float)((float)v14 * 0.5), (float)v13 * 0.5, (float)v14 * 0.5);
      v39 = v38;
      v41 = HGRectMake4f(v40, -1.0, -1.0, 1.0, 1.0);
      v42 = HGRectGrow(v37, v39, v41);
      v44 = sinval / cosval;
      v45 = v34 - v35 * (float)(sinval / cosval);
      v46 = (double)(int)v42;
      v47 = (double)v43;
      v48 = (float)((float)((float)SHIDWORD(v42) - v45) / (float)(sinval / cosval));
      v49 = (double)SHIDWORD(v42);
      v51 = (float)((float)((float)v50 - v45) / (float)(sinval / cosval));
      v52 = (double)v50;
      if (cosval >= 0.0)
      {
        v53 = (float)((float)(v44 * (float)v43) + v45);
        v61 = (v47 - v35) * (v47 - v35) + (v53 - v34) * (v53 - v34);
        v55 = sqrtf(v61);
        if (sinval >= 0.0)
        {
          v71 = (v52 - v34) * (v52 - v34) + (v51 - v35) * (v51 - v35);
          v57 = sqrtf(v71);
          if (v57 < v55 && v94 < v52 && v51 >= v46 && v51 <= v47)
            goto LABEL_86;
        }
        else
        {
          v62 = (v49 - v34) * (v49 - v34) + (v48 - v35) * (v48 - v35);
          v57 = sqrtf(v62);
          if (v57 < v55 && v94 > v49 && v48 >= v46 && v48 <= v47)
            goto LABEL_86;
        }
        v75 = v57 > v55 && v95 < v47;
        v57 = 0.0;
        if (v75)
        {
LABEL_80:
          if (v53 > v52 || v53 < v49)
            v57 = 0.0;
          else
            v57 = v55;
        }
      }
      else
      {
        v53 = (float)((float)(v44 * (float)(int)v42) + v45);
        v54 = (v46 - v35) * (v46 - v35) + (v53 - v34) * (v53 - v34);
        v55 = sqrtf(v54);
        if (sinval >= 0.0)
        {
          v66 = (v52 - v34) * (v52 - v34) + (v51 - v35) * (v51 - v35);
          v57 = sqrtf(v66);
          if (v57 < v55 && v94 < v52 && v51 >= v46 && v51 <= v47)
            goto LABEL_86;
        }
        else
        {
          v56 = (v49 - v34) * (v49 - v34) + (v48 - v35) * (v48 - v35);
          v57 = sqrtf(v56);
          if (v57 < v55 && v94 > v49 && v48 >= v46 && v48 <= v47)
            goto LABEL_86;
        }
        v70 = v57 <= v55 || v95 <= v46;
        v57 = 0.0;
        if (!v70)
          goto LABEL_80;
      }
LABEL_86:
      v77 = HGRectMake4i((int)(v35 - v57), (int)(v34 - v57), (int)(v35 + v57), (int)(v34 + v57));
      v79 = v78;
      *(_QWORD *)&v88.var0 = v77;
      *(_QWORD *)&v88.var2 = v78;
      if (v92)
      {
        v80 = vcvtpd_s64_f64(v18 * 0.5);
        v81 = vcvtpd_s64_f64((double)v14 * 0.5);
        v82 = HGRectMake4i(-v80, -v81, v80, v81);
        *(_QWORD *)&v88.var0 = HGRectIntersection(v77, v79, v82, v83);
        *(_QWORD *)&v88.var2 = v84;
      }
      v85 = HTarget::SetCropRect((HTarget *)v21, (__n128 *)&v88);
      v87 = v21;
      (*(void (**)(char *, __n128))(*(_QWORD *)v21 + 16))(v21, v85);
      objc_msgSend(a3, "setHeliumRef:", &v87);
      if (v87)
        (*(void (**)(char *))(*(_QWORD *)v87 + 24))(v87);
      (*(void (**)(char *))(*(_QWORD *)v21 + 24))(v21);
      if (v89)
        (*(void (**)(HGNode *))(*(_QWORD *)v89 + 24))(v89);
      LOBYTE(v20) = 1;
      return v20;
    }
LABEL_17:
    LOBYTE(v20) = 0;
  }
  return v20;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a6 = 0;
  *a5 = 0;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end
