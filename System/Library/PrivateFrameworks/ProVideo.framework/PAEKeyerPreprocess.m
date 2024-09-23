@implementation PAEKeyerPreprocess

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEKeyerPreprocess;
  -[PAEKeyerPreprocess dealloc](&v2, sel_dealloc);
}

- (BOOL)addAdvancedParametersWithParamAPI:(id)a3 paramFlags:(unsigned int)a4
{
  if (a3)
    objc_msgSend(a3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Keyer::FixVideo"), CFSTR("Fix Video"), 0), 68, 1, a4 | 0x221);
  return 1;
}

- (BOOL)findGrainRegionWithInfo:(id *)a3 coordX:(int *)a4 coordY:(int *)a5 width:(int)a6 height:(int)a7 minGreenHueAngle:(float)a8 maxGreenHueAngle:(float)a9 greenChroma:(float)a10 minBlueHueAngle:(float)a11 maxBlueHueAngle:(float)a12 blueChroma:(float)a13
{
  __int128 v23;
  HGXForm *v24;
  HGTransform *v25;
  HGColorMatrix *v26;
  HgcLocateScreen *v27;
  HgcLocateScreen *v28;
  HgcAnalyzeGrain *v29;
  PAEKeyer *keyer;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  unsigned int v46;
  int v47;
  uint64_t v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  float v61;
  int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  float v67;
  float v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  float v75;
  int *v76;
  uint64_t v78;
  HGXForm *v79;
  int *v80;
  BOOL v81;
  int *v82;
  uint64_t v83;
  HGTransform *v84;
  HgcAnalyzeGrain *v87;
  _OWORD v88[2];
  double v89;
  uint64_t v90;
  id v91;
  __int128 v92;
  __int128 v93;
  double var4;
  _OWORD v95[4];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  *a5 = 0;
  *a4 = 0;
  v23 = *(_OWORD *)&a3->var2;
  v92 = *(_OWORD *)&a3->var0.var0;
  v93 = v23;
  var4 = a3->var4;
  v24 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v24);
  v25 = (HGTransform *)HGObject::operator new(0x90uLL);
  HGTransform::HGTransform(v25);
  (*(void (**)(HGTransform *, double, double, double))(*(_QWORD *)v25 + 144))(v25, 0.100000001, 0.100000001, 1.0);
  (*(void (**)(HGXForm *, HGTransform *))(*(_QWORD *)v24 + 576))(v24, v25);
  v26 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
  HGColorMatrix::HGColorMatrix(v26);
  desiredRGBToYCbCrMatrix(self->_apiManager, (uint64_t)v95, (uint64_t)a3->var0.var1);
  HGColorMatrix::LoadMatrix(v26, v95, 0);
  (*(void (**)(HGColorMatrix *, _QWORD, HGXForm *))(*(_QWORD *)v26 + 120))(v26, 0, v24);
  v27 = (HgcLocateScreen *)HGObject::operator new(0x1A0uLL);
  HgcLocateScreen::HgcLocateScreen(v27);
  (*(void (**)(HgcLocateScreen *, _QWORD, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 0, a11, a11, a11, a11);
  (*(void (**)(HgcLocateScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 1, a12, a12, a12, a12);
  (*(void (**)(HgcLocateScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 2, a13, a13, a13, a13);
  (*(void (**)(HgcLocateScreen *, _QWORD, HGColorMatrix *))(*(_QWORD *)v27 + 120))(v27, 0, v26);
  v28 = (HgcLocateScreen *)HGObject::operator new(0x1A0uLL);
  HgcLocateScreen::HgcLocateScreen(v28);
  (*(void (**)(HgcLocateScreen *, _QWORD, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 0, a8, a8, a8, a8);
  (*(void (**)(HgcLocateScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 1, a9, a9, a9, a9);
  (*(void (**)(HgcLocateScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 2, a10, a10, a10, a10);
  (*(void (**)(HgcLocateScreen *, _QWORD, HGColorMatrix *))(*(_QWORD *)v28 + 120))(v28, 0, v26);
  v29 = (HgcAnalyzeGrain *)HGObject::operator new(0x1A0uLL);
  HgcAnalyzeGrain::HgcAnalyzeGrain(v29);
  (*(void (**)(HgcAnalyzeGrain *, _QWORD, HGColorMatrix *))(*(_QWORD *)v29 + 120))(v29, 0, v26);
  (*(void (**)(HgcAnalyzeGrain *, uint64_t, HgcLocateScreen *))(*(_QWORD *)v29 + 120))(v29, 1, v27);
  (*(void (**)(HgcAnalyzeGrain *, uint64_t, HgcLocateScreen *))(*(_QWORD *)v29 + 120))(v29, 2, v28);
  v91 = 0;
  keyer = self->_keyer;
  v88[0] = v92;
  v88[1] = v93;
  v89 = var4;
  v90 = 3;
  var1 = a3->var0.var1;
  v87 = v29;
  (*(void (**)(HgcAnalyzeGrain *))(*(_QWORD *)v29 + 16))(v29);
  v32 = -[PAEFilterDefaultBase getInputBitmap:withInfo:atTime:appendHGGraph:](keyer, "getInputBitmap:withInfo:atTime:appendHGGraph:", &v91, v88, var1, &v87);
  if (v87)
    (*(void (**)(HgcAnalyzeGrain *))(*(_QWORD *)v87 + 24))(v87);
  if (!v32)
    goto LABEL_31;
  v84 = v25;
  v83 = objc_msgSend(v91, "origin");
  v33 = objc_msgSend(v91, "dataPtr");
  v81 = v32;
  v82 = a4;
  v34 = objc_msgSend(v91, "pixelFormat");
  v80 = a5;
  v35 = v34 != 0;
  if (v34)
    v36 = 2;
  else
    v36 = 1;
  v37 = 2;
  if (v34)
    v37 = 3;
  v78 = v37;
  v38 = objc_msgSend(v91, "width");
  v39 = objc_msgSend(v91, "height");
  v40 = objc_msgSend(v91, "rowBytes");
  v79 = v24;
  v41 = (int)(float)((float)v39 * 0.5);
  v42 = ((v41 - (int)(float)((float)((float)a7 * 0.5) * 0.1)) & ~((v41 - (int)(float)((float)((float)a7 * 0.5) * 0.1)) >> 31))
      + 1;
  v43 = v42 - v41;
  v44 = v41 - v42;
  if (v42 - v41 >= v41 - v42)
  {
    v50 = 0;
    v49 = 0;
    v76 = v82;
    goto LABEL_28;
  }
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  v50 = 0;
  v51 = 0;
  v52 = 0;
  v53 = (int)(float)((float)v38 * 0.5);
  v54 = v42 * ((unint64_t)v40 >> 2);
  v55 = v53 - (int)(float)((float)((float)a6 * 0.5) * 0.1);
  v56 = v55 & ~(v55 >> 31);
  v57 = 4 * v36 + 4 * v54;
  v58 = v33 + 4 * v35 + 4 * v54;
  v59 = v33 + v57;
  v60 = v33 + 4 * v78 + 4 * v54;
  v61 = 100.0;
  v62 = v56 + 1 - v53;
  v63 = v53 - (v56 + 1);
  v64 = (4 * (v56 + 1));
  v65 = 4 * (int)(v40 >> 2);
  v66 = 2 * v53 - 2 * v56 - 2;
  v67 = 100.0;
  v68 = 100.0;
  do
  {
    if (v62 < v63)
    {
      v69 = v66;
      v70 = v60;
      v71 = v59;
      v72 = v58;
      v73 = v62;
      v74 = v48;
      do
      {
        v75 = *(float *)(v72 + 4 * v64);
        v48 = (int)(float)((float)((float)v73 / 0.1) + 5.0);
        if (*(float *)(v71 + 4 * v64) >= 1.0)
        {
          ++v46;
          if (v75 >= v67)
            goto LABEL_21;
          v47 = (int)(float)((float)((float)v43 / 0.1) + 5.0);
          v67 = *(float *)(v72 + 4 * v64);
        }
        else if (*(float *)(v70 + 4 * v64) >= 1.0)
        {
          ++v45;
          if (v75 >= v61)
          {
LABEL_21:
            v48 = v74;
            goto LABEL_22;
          }
          v52 = (int)(float)((float)((float)v43 / 0.1) + 5.0);
          v51 = (int)(float)((float)((float)v73 / 0.1) + 5.0);
          v48 = v74;
          v61 = *(float *)(v72 + 4 * v64);
        }
        else
        {
          if (v75 >= v68)
            goto LABEL_21;
          v50 = (int)(float)((float)((float)v43 / 0.1) + 5.0);
          v49 = (int)(float)((float)((float)v73 / 0.1) + 5.0);
          v48 = v74;
          v68 = *(float *)(v72 + 4 * v64);
        }
LABEL_22:
        ++v73;
        v72 += 16;
        v71 += 16;
        v70 += 16;
        v74 = v48;
        --v69;
      }
      while (v69);
    }
    ++v43;
    v58 += v65;
    v59 += v65;
    v60 += v65;
  }
  while (v43 != v44);
  v76 = v82;
  if (v45 <= v46)
  {
    v51 = v48;
    v52 = v47;
    if (!v46)
    {
LABEL_28:
      v51 = v49;
      v52 = v50;
    }
  }
  *v76 = v51;
  v24 = v79;
  *v80 = v52;
  v25 = v84;
  LOBYTE(v32) = v81;
  if (v83)
    *v80 = -v52;
LABEL_31:

  (*(void (**)(HgcAnalyzeGrain *))(*(_QWORD *)v29 + 24))(v29);
  (*(void (**)(HgcLocateScreen *))(*(_QWORD *)v28 + 24))(v28);
  (*(void (**)(HgcLocateScreen *))(*(_QWORD *)v27 + 24))(v27);
  (*(void (**)(HGColorMatrix *))(*(_QWORD *)v26 + 24))(v26);
  (*(void (**)(HGTransform *))(*(_QWORD *)v25 + 24))(v25);
  (*(void (**)(HGXForm *))(*(_QWORD *)v24 + 24))(v24);
  return v32;
}

- (BOOL)doDegrainWithDegrainAmount:(double)a3 degrainIntensity:(double)a4 withInfo:(id *)a5 outputNode:(void *)a6 pcaMatrix:(id)a7 width:(int)a8 height:(int)a9
{
  return 1;
}

- (BOOL)doPreprocessKeyerFootageWithParamAPI:(id)a3 withInfo:(id *)a4 linearInput:(BOOL)a5 scaleX:(float)a6 scaleY:(float)a7 width:(float)a8 height:(float)a9 fixDVResult:(void *)a10 degrainResult:(void *)a11 outputNode:(void *)a12
{
  _BOOL4 v16;
  HFixDV *v19;
  float v20;
  uint64_t v21;
  HFixDV *v22;
  uint64_t v23;
  char v25;
  _BYTE v26[64];
  _BYTE v27[72];
  uint64_t v28;

  v16 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  objc_msgSend(a3, "getBoolValue:fromParm:atFxTime:", &v25, 68, a4->var0.var1, a10, a11);
  if (v25)
  {
    desiredRGBToYCbCrMatrix(self->_apiManager, (uint64_t)v27, (uint64_t)a4->var0.var1);
    desiredYCbCrToRGBMatrix(self->_apiManager, (uint64_t)v26, (uint64_t)a4->var0.var1);
    v19 = (HFixDV *)HGObject::operator new(0x240uLL);
    HFixDV::HFixDV(v19, a6, a7);
    v20 = 0.45455;
    if (!v16)
      v20 = 1.0;
    *((float *)v19 + 102) = v20;
    *((_DWORD *)v19 + 103) = 1082130432;
    *((_WORD *)v19 + 208) = 257;
    HFixDV::setRGBToYCbCrMatrix((uint64_t)v19, (uint64_t)v27);
    HFixDV::setYCbCrToRGBMatrix((uint64_t)v19, (uint64_t)v26);
    (*(void (**)(HFixDV *, _QWORD, _QWORD))(*(_QWORD *)v19 + 120))(v19, 0, *(_QWORD *)a12);
    v21 = *(_QWORD *)a12;
    v22 = v19;
    if (*(HFixDV **)a12 != v19)
    {
      if (v21)
        (*(void (**)(_QWORD))(*(_QWORD *)v21 + 24))(*(_QWORD *)a12);
      *(_QWORD *)a12 = v19;
      (*(void (**)(HFixDV *))(*(_QWORD *)v19 + 16))(v19);
      v22 = *(HFixDV **)a12;
    }
    v23 = *(_QWORD *)a10;
    if (*(HFixDV **)a10 != v22)
    {
      if (v23)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)v23 + 24))(*(_QWORD *)a10);
        v22 = *(HFixDV **)a12;
      }
      *(_QWORD *)a10 = v22;
      if (v22)
        (*(void (**)(HFixDV *))(*(_QWORD *)v22 + 16))(v22);
    }
    (*(void (**)(HFixDV *))(*(_QWORD *)v19 + 24))(v19);
  }
  return 1;
}

- (void)setKeyer:(id)a3
{
  self->_keyer = (PAEKeyer *)a3;
}

@end
