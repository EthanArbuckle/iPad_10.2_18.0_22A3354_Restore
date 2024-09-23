@implementation PAEUnderwater

- (PAEUnderwater)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEUnderwater;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEUnderwater;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
}

- (BOOL)variesOverTime
{
  return 1;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  BOOL v7;
  _BOOL8 v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAEUnderwater;
  -[PAESharedDefaultBase addParameters](&v11, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  v5 = objc_msgSend(v4, "versionAtCreation");
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (!v6)
  {
    v8 = v5 == 0;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Underwater::Size"), 0, 0), 1, 0, 2.0, 0.001, 100.0, 0.001, 10.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Underwater::Speed"), 0, 0), 2, 0, 0.5, 0.0, 100.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Underwater::Refraction"), 0, 0), 3, 0, 100.0, 0.0, 1000.0, 0.0, 200.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BumpMap::Repeat Edges"), 0, 0), 6, v8, 0);
  }
  return v7;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  BOOL v6;
  BOOL result;

  if (a3)
    v6 = a4 == 0;
  else
    v6 = 1;
  result = !v6;
  if (!v6)
  {
    *a3 = a5->var0;
    *a4 = a5->var1;
  }
  return result;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  BOOL result;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  double v17;
  unint64_t v18;
  uint64_t i;
  uint64_t v20;
  double v21;
  float *v22;
  unint64_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  unint64_t v28;
  float v29;
  unint64_t v30;
  unint64_t v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  __float2 v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  HUnderwaterRefractV2 *v43;
  float *v44;
  uint64_t v45;
  uint64_t v47;
  float v48;
  float v49;
  float *v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  unint64_t v60;
  unint64_t v61;
  HUnderwaterRefractV2 *v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  unint64_t v90;
  unint64_t v91;
  double v92;
  float v93;
  double v94;
  float v95;
  float v96;
  double v97;
  float v98;
  HUnderwaterRefractV2 *v99;
  HUnderwaterRefractV2 *v100;
  HUnderwaterRefractV2 *v101;
  _QWORD v102[102];
  char v103;
  double v104;
  double v105[17];
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  int v119;
  uint64_t v120;
  _QWORD v121[20];

  v121[18] = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    return 0;
  v118 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v118, 3, a5->var0.var1);
  if (v118 == 0.0)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", v118);
    else
      v102[0] = 0;
    objc_msgSend(a3, "setHeliumRef:", v102);
    if (v102[0])
      (*(void (**)(_QWORD))(*(_QWORD *)v102[0] + 24))(v102[0]);
    return 1;
  }
  v13 = objc_msgSend(a4, "width", v118);
  v14 = objc_msgSend(a4, "height");
  v15 = objc_msgSend(a3, "imageType");
  v16 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  result = 0;
  if (v16 && v15 == 3)
  {
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
    v105[0] = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", v105, 1, a5->var0.var1);
    v17 = v105[0] * 0.1;
    v105[0] = v105[0] * 0.1;
    v104 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v104, 2, a5->var0.var1);
    v103 = 0;
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v103, 6, a5->var0.var1);
    v92 = (double)v14;
    v18 = 589505315;
    for (i = 1; i != 102; ++i)
    {
      v18 = ((v18 << 12) + 150889) % 0xAE529;
      v102[i] = v18;
    }
    v94 = v17;
    -[PAESharedDefaultBase secondsFromFxTime:](self, "secondsFromFxTime:", a5->var0.var1);
    v20 = 0;
    *(float *)&v21 = v21;
    v97 = v104 * *(float *)&v21;
    v22 = (float *)&v120;
    v23 = 456248;
    v24 = 0.0;
    v25 = 0.0;
    v26 = 0.0;
    v27 = 0.0;
    do
    {
      v28 = v102[v23 % 0x65 + 1];
      v102[v23 % 0x65 + 1] = ((v28 << 12) + 150889) % 0xAE529;
      v29 = (float)((float)v28 / 714020.0) * 6.2832;
      v30 = v28 % 0x65;
      v31 = v102[v28 % 0x65 + 1];
      v102[v30 + 1] = ((v31 << 12) + 150889) % 0xAE529;
      v32 = v24;
      v33 = (float)((float)((float)v31 / 714020.0) * 6.2832) + 0.0;
      v23 = v102[v31 % 0x65 + 1];
      v102[v31 % 0x65 + 1] = ((v23 << 12) + 150889) % 0xAE529;
      v34 = (float)((float)(int)v20 * 0.25) + 1.0;
      v35 = (float)((float)(1.0 / v34) * (float)((float)((float)((float)v23 / 714020.0) * 0.25) + 0.75)) * 0.25;
      v22[1] = v35;
      v36 = v34 * v35;
      v37 = __sincosf_stret(v29 + 0.0);
      v38 = v37.__cosval * v36;
      v39 = v37.__sinval * v36;
      *(v22 - 2) = v37.__cosval * v36;
      *(v22 - 1) = v37.__sinval * v36;
      v40 = v97 * v34 + v33;
      *v22 = v40;
      v22 += 4;
      if ((float)(v37.__cosval * v36) >= 0.0)
        v41 = -0.0;
      else
        v41 = v37.__cosval * v36;
      v26 = v26 + v41;
      if (v38 < 0.0)
        v38 = -0.0;
      v24 = v32 + v38;
      if (v39 >= 0.0)
        v42 = -0.0;
      else
        v42 = v37.__sinval * v36;
      v27 = v27 + v42;
      if (v39 < 0.0)
        v39 = -0.0;
      v25 = v25 + v39;
      ++v20;
    }
    while (v20 != 10);
    v102[0] = v23;
    v43 = (HUnderwaterRefractV2 *)HGObject::operator new(0x1B0uLL);
    HUnderwaterRefractV2::HUnderwaterRefractV2(v43);
    v44 = (float *)&v119;
    v45 = -10;
    do
    {
      (*(void (**)(HUnderwaterRefractV2 *, _QWORD, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, (v45 + 29), *(v44 - 1), *v44, 0.0, 0.0);
      v44 += 4;
    }
    while (!__CFADD__(v45++, 1));
    v90 = __PAIR64__(LODWORD(v26), LODWORD(v27));
    v91 = __PAIR64__(LODWORD(v24), LODWORD(v25));
    v47 = 0;
    v48 = v106 / v94;
    v49 = v111 / v94;
    v96 = v49;
    v98 = v48;
    v93 = -v49;
    v95 = -v48;
    v50 = (float *)v121;
    do
    {
      v51 = *(v50 - 4);
      v52 = *(v50 - 3);
      v53 = v51 * v95;
      v54 = *(v50 - 2);
      v55 = v50[1];
      v56 = *v50 * v95;
      v57 = v50[2];
      v58 = v51 * v98;
      v59 = *v50 * v98;
      (*(void (**)(HUnderwaterRefractV2 *, _QWORD, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, (v47 + 9), v54 + (float)((float)(v51 * v95) + (float)(v52 * v96)), v57 + (float)(v56 + (float)(v55 * v96)), v54 + (float)((float)(v51 * v98) + (float)(v52 * v96)), v57 + (float)(v59 + (float)(v55 * v96)));
      (*(void (**)(HUnderwaterRefractV2 *, _QWORD, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, (v47++ + 14), v54 + (float)(v53 + (float)(v52 * v93)), v57 + (float)(v56 + (float)(v55 * v93)), v54 + (float)(v58 + (float)(v52 * v93)), v57 + (float)(v59 + (float)(v55 * v93)));
      v50 += 8;
    }
    while (v47 != 5);
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v101 = 0;
    v60 = v91;
    v61 = v90;
    if (v103)
    {
      v99 = v101;
      if (v101)
        (*(void (**)(HUnderwaterRefractV2 *))(*(_QWORD *)v101 + 16))(v101);
      -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v99, a4, a3, v90, v91);
      v62 = v100;
      if (v100)
        v100 = 0;
      if (v99)
        (*(void (**)(HUnderwaterRefractV2 *))(*(_QWORD *)v99 + 24))(v99);
    }
    else
    {
      v62 = v101;
      if (v101)
        (*(void (**)(HUnderwaterRefractV2 *))(*(_QWORD *)v101 + 16))(v101);
    }
    v63 = v118;
    (*(void (**)(HUnderwaterRefractV2 *, uint64_t, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, 8, v63, v63, 0.0, 0.0);
    (*(void (**)(HUnderwaterRefractV2 *, _QWORD, HUnderwaterRefractV2 *))(*(_QWORD *)v43 + 120))(v43, 0, v62);
    HUnderwaterRefractV2::SetMaxOffsets((uint64_t)v43, *((float *)&v60 + 1) - *((float *)&v61 + 1), *(float *)&v60 - *(float *)&v61);
    v64 = (float)v13;
    (*(void (**)(HUnderwaterRefractV2 *, uint64_t, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, 6, v64, 0.0, 0.0, 0.0);
    v65 = v92;
    (*(void (**)(HUnderwaterRefractV2 *, uint64_t, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, 7, v65, 0.0, 0.0, 0.0);
    v66 = v106;
    v67 = v107;
    v68 = v108;
    v69 = v109;
    (*(void (**)(HUnderwaterRefractV2 *, uint64_t, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, 3, v66, v67, v68, v69);
    v70 = v110;
    v71 = v111;
    v72 = v112;
    v73 = v113;
    (*(void (**)(HUnderwaterRefractV2 *, uint64_t, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, 4, v70, v71, v72, v73);
    v74 = v114;
    v75 = v115;
    v76 = v116;
    v77 = v117;
    (*(void (**)(HUnderwaterRefractV2 *, uint64_t, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, 5, v74, v75, v76, v77);
    v78 = v105[1];
    v79 = v105[2];
    v80 = v105[3];
    v81 = v105[4];
    (*(void (**)(HUnderwaterRefractV2 *, _QWORD, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, 0, v78, v79, v80, v81);
    v82 = v105[5];
    v83 = v105[6];
    v84 = v105[7];
    v85 = v105[8];
    (*(void (**)(HUnderwaterRefractV2 *, uint64_t, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, 1, v82, v83, v84, v85);
    v86 = v105[13];
    v87 = v105[14];
    v88 = v105[15];
    v89 = v105[16];
    (*(void (**)(HUnderwaterRefractV2 *, uint64_t, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, 2, v86, v87, v88, v89);
    v100 = v43;
    (*(void (**)(HUnderwaterRefractV2 *))(*(_QWORD *)v43 + 16))(v43);
    -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v100, a4, a3);
    objc_msgSend(a3, "setHeliumRef:", &v100);
    if (v100)
      (*(void (**)(HUnderwaterRefractV2 *))(*(_QWORD *)v100 + 24))(v100);
    if (v62)
      (*(void (**)(HUnderwaterRefractV2 *))(*(_QWORD *)v62 + 24))(v62);
    if (v101)
      (*(void (**)(HUnderwaterRefractV2 *))(*(_QWORD *)v101 + 24))(v101);
    (*(void (**)(HUnderwaterRefractV2 *))(*(_QWORD *)v43 + 24))(v43);
    return 1;
  }
  return result;
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

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  uint64_t v6;
  id result;
  id v8;
  double v9;

  v9 = 0.0;
  if ((objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v9, 3, a3.var1) & 1) != 0)
  {
    if (v9 == 0.0)
      v6 = 6;
    else
      v6 = 3;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6, v9), CFSTR("PixelTransformSupport"), 0);
  }
  else if (a4)
  {
    v8 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", CFSTR("PAEUnderwater"));
    result = 0;
    *a4 = v8;
  }
  else
  {
    return 0;
  }
  return result;
}

@end
