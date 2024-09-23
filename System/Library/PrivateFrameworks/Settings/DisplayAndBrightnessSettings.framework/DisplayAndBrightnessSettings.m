void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_impl(a1, v9, OS_LOG_TYPE_DEFAULT, a4, &a9, 2u);
}

BOOL OUTLINED_FUNCTION_1(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT);
}

void sub_227A399D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227A3A600(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_227A3A864(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

const __CFString *DBSStringForDisplayZoomOption(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Standard");
  else
    return off_24F025DF0[a1 - 1];
}

id DBSAnimationPackageURLForDisplayZoomOptionAndUserInterfaceStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = MGGetSInt32Answer();
  if (a1 == 1)
  {
    v7 = CFSTR("Zoomed");
  }
  else if (a1 == 3 || a1 == 2)
  {
    v7 = CFSTR("Dense");
  }
  else
  {
    v7 = CFSTR("Standard");
  }
  v8 = &stru_24F026548;
  v9 = CFSTR("-Dark");
  if (a2 != 2)
    v9 = &stru_24F026548;
  if (a3 == 1)
    v8 = CFSTR("-RTL");
  v10 = CFSTR("Classic");
  if (v6 == 2)
    v10 = CFSTR("Modern");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@%@%@"), v10, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLForResource:withExtension:", v11, CFSTR("ca"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id DBSStillPreviewImageForDisplayZoomOption(uint64_t a1)
{
  int v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = MGGetSInt32Answer();
  if ((unint64_t)(a1 - 1) > 2)
    v3 = CFSTR("Standard");
  else
    v3 = off_24F025E08[a1 - 1];
  v4 = CFSTR("Classic");
  if (v2 == 2)
    v4 = CFSTR("Modern");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BEBD640];
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void DBSPurgeKeyboardCache()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BE04760]);
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("Caches"), CFSTR("com.apple.keyboards"), 0));
  if (UIKeyboardCacheVersion_onceToken != -1)
    dispatch_once(&UIKeyboardCacheVersion_onceToken, &__block_literal_global);
  v2 = (void *)objc_msgSend(v0, "initWithPath:version:", v1, UIKeyboardCacheVersion_buildVersion);
  objc_msgSend(v2, "purge");

}

void sub_227A3F780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227A4204C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_227A42EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL numberInSpecifierValidationRange(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  v3 = a2;
  objc_msgSend(a1, "doubleValue");
  v5 = v4;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE759B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE759A8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  return v11 + 0.000001 > v5 && v8 + -0.000001 < v5;
}

void updateSpecifierValidationRange(void *a1, double a2, double a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a1;
  objc_msgSend(v5, "numberWithDouble:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE759B0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE759A8]);

}

void sub_227A48654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227A48CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t DBSGetMobileFrameBuffer()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  int v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "displayConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "deviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    DBSLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      DBSGetMobileFrameBuffer_cold_1(v5);
    goto LABEL_7;
  }
  v3 = IOMobileFramebufferOpenByName();
  if (v3)
  {
    v4 = v3;
    DBSLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      DBSGetMobileFrameBuffer_cold_2(v4, v5);
LABEL_7:

  }
  return 0;
}

uint64_t DBSChamoisEnabled()
{
  if (DBSChamoisEnabled_onceToken != -1)
    dispatch_once(&DBSChamoisEnabled_onceToken, &__block_literal_global_5);
  return DBSChamoisEnabled__isChamoisEnabled;
}

uint64_t DBSReverseZoomEnabled()
{
  if (DBSReverseZoomEnabled_onceToken != -1)
    dispatch_once(&DBSReverseZoomEnabled_onceToken, &__block_literal_global_3);
  return DBSReverseZoomEnabled__reverseZoomEnabled;
}

uint64_t DBSMostDisplaySpaceEnabled()
{
  if (DBSMostDisplaySpaceEnabled_onceToken != -1)
    dispatch_once(&DBSMostDisplaySpaceEnabled_onceToken, &__block_literal_global_6);
  return DBSMostDisplaySpaceEnabled__isMostDisplaySpaceEnabled;
}

double GetWhitepointShiftLuminanceLoss(float64x2_t a1, float64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v8;
  float64x2_t *v9;
  float64x2_t v10;
  int v12;
  int v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[2];
  _OWORD v21[2];
  _OWORD v22[6];
  _BYTE v23[192];
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  __asm { FMOV            V3.2D, #1.0 }
  if ((v2 & 1) == 0)
  {
    v16 = *(_QWORD *)&a1.f64[0];
    v18 = _Q3;
    v14 = a2;
    a2 = v14;
    *(_QWORD *)&a1.f64[0] = v16;
    _Q3 = v18;
    if (v12)
    {
      GetWhitepointShiftLuminanceLoss::p3 = xmmword_227A5EC20;
      *(_OWORD *)algn_255918270 = v18;
      xmmword_255918280 = xmmword_227A5EC30;
      unk_255918290 = v18;
      xmmword_2559182A0 = xmmword_227A5EC40;
      unk_2559182B0 = v18;
      a2 = v14;
      *(_QWORD *)&a1.f64[0] = v16;
      _Q3 = v18;
    }
  }
  v9 = (float64x2_t *)&off_227A5E000;
  if ((v8 & 1) == 0)
  {
    v17 = *(_QWORD *)&a1.f64[0];
    v19 = _Q3;
    v15 = a2;
    a2 = v15;
    *(_QWORD *)&a1.f64[0] = v17;
    _Q3 = v19;
    v9 = (float64x2_t *)&off_227A5E000;
    if (v13)
    {
      GetWhitepointShiftLuminanceLoss::D65_xyY = xmmword_227A5EC50;
      *(_OWORD *)algn_2559182F0 = v19;
      a2 = v15;
      *(_QWORD *)&a1.f64[0] = v17;
      _Q3 = v19;
      v9 = (float64x2_t *)&off_227A5E000;
    }
  }
  a1.f64[1] = a2;
  v10 = vsubq_f64(v9[197], a1);
  v22[2] = xmmword_255918280;
  v22[3] = unk_255918290;
  v22[4] = xmmword_2559182A0;
  v22[5] = unk_2559182B0;
  v22[0] = GetWhitepointShiftLuminanceLoss::p3;
  v22[1] = *(_OWORD *)algn_255918270;
  v21[0] = v10;
  v21[1] = _Q3;
  v20[0] = GetWhitepointShiftLuminanceLoss::D65_xyY;
  v20[1] = *(_OWORD *)algn_2559182F0;
  ChromaticAdaptationTransform<double>::ChromaticAdaptationTransform(v23, v22, v21, v20);
  return v24;
}

#error "227A4AF54: call analysis failed (funcsize=146)"

_OWORD *RGBXYZConversionMatrices<double>::RGBXYZConversionMatrices(_OWORD *a1, uint64_t a2, float64x2_t *a3, double a4, float64x2_t a5, double a6, double a7, double a8, float64x2_t a9, double a10, float64x2_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,float64x2_t a45,float64x2_t a46,float64x2_t a47,float64x2_t a48,float64x2_t a49,float64x2_t a50)
{
  double v51;
  float64x2_t v52;
  __int128 v53;
  float64x2_t v54;
  __int128 v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t vars0;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;

  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  a5.f64[0] = *(float64_t *)(a2 + 16);
  v51 = *(double *)(a2 + 8);
  v52.f64[0] = a5.f64[0] * *(double *)a2 / v51;
  a9.f64[0] = a5.f64[0] * (1.0 - *(double *)a2 - v51) / v51;
  v52.f64[1] = a5.f64[0];
  v67 = v52;
  v68 = a9;
  v53 = *(_OWORD *)(a2 + 32);
  a5.f64[0] = *(float64_t *)(a2 + 48);
  v52.f64[0] = *(float64_t *)(a2 + 40);
  v54.f64[0] = a5.f64[0] * *(double *)&v53 / v52.f64[0];
  a11.f64[0] = a5.f64[0] * (1.0 - *(double *)&v53 - v52.f64[0]) / v52.f64[0];
  v54.f64[1] = a5.f64[0];
  v65 = v54;
  v66 = a11;
  v55 = *(_OWORD *)(a2 + 64);
  a5.f64[0] = *(float64_t *)(a2 + 80);
  v52.f64[0] = *(float64_t *)(a2 + 72);
  v54.f64[0] = a5.f64[0] * *(double *)&v55 / v52.f64[0];
  v52.f64[0] = a5.f64[0] * (1.0 - *(double *)&v55 - v52.f64[0]) / v52.f64[0];
  v69 = v52;
  v54.f64[1] = a5.f64[0];
  v64 = v54;
  v56 = *a3;
  v57 = a3[1];
  v54.f64[0] = a3->f64[1];
  a5.f64[0] = vmuld_n_f64(a3->f64[0], v57.f64[0]) / v54.f64[0];
  v62 = v57;
  v63 = a5;
  v56.f64[0] = (1.0 - a3->f64[0] - v54.f64[0]) * v57.f64[0] / v54.f64[0];
  vars0 = v56;
  __invert_d3();
  v58 = vmlaq_f64(vmlaq_f64(vmulq_f64(v63, a46), v62, a48), vars0, a50);
  v59 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(a45, v63.f64[0]), a47, v62.f64[0]), a49, vars0.f64[0]);
  *a1 = vmulq_n_f64(v67, v59.f64[0]);
  a1[1] = vmulq_f64(v68, v59);
  a1[2] = vmulq_laneq_f64(v65, v59, 1);
  a1[3] = vmulq_laneq_f64(v66, v59, 1);
  a1[4] = vmulq_n_f64(v64, v58.f64[0]);
  a1[5] = vmulq_f64(v69, v58);
  __invert_d3();
  a1[8] = a47;
  a1[9] = a48;
  a1[10] = a49;
  a1[11] = a50;
  a1[6] = a45;
  a1[7] = a46;
  return a1;
}

__int128 *ChromaticAdaptationMatrix<double>::ChromaticAdaptationMatrix(__int128 *a1, float64x2_t *a2, float64x2_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 a13, float64x2_t a14, __int128 a15, float64x2_t a16, __int128 a17, float64x2_t a18, __int128 a19, float64x2_t a20,__int128 a21,float64x2_t a22,__int128 a23,float64x2_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  uint64_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  double v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  double v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t *v67;
  uint64_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t *v77;
  float64x2_t v78;
  __int128 v79;
  float64x2_t v80;
  __int128 v81;
  float64x2_t v82;

  a40 = *MEMORY[0x24BDAC8D0];
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  a19 = xmmword_227A5EC60;
  a20 = (float64x2_t)0x3FA3EAB367A0F909uLL;
  a21 = xmmword_227A5EC70;
  a22 = (float64x2_t)0xBFB189374BC6A7F0;
  a23 = xmmword_227A5EC80;
  a24 = (float64x2_t)0x3FF0793DD97F62B7uLL;
  __invert_d3();
  v43 = 0;
  v45 = *a2;
  v44 = a2[1];
  v62 = (float64x2_t)a13;
  v46 = a14;
  v63 = (float64x2_t)a15;
  v47 = a16;
  v64 = (float64x2_t)a17;
  v48 = a18;
  v49 = a2->f64[1];
  v50.f64[0] = vmuld_n_f64(a2->f64[0], v44.f64[0]) / v49;
  v45.f64[0] = (1.0 - a2->f64[0] - v49) * v44.f64[0] / v49;
  v51 = vmulq_f64(v50, (float64x2_t)0x3FA3EAB367A0F909uLL);
  v52 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_227A5EC60, v50.f64[0]), (float64x2_t)xmmword_227A5EC70, v44.f64[0]), (float64x2_t)xmmword_227A5EC80, v45.f64[0]);
  v53 = vmlaq_f64(vmlaq_f64(v51, (float64x2_t)0xBFB189374BC6A7F0, v44), (float64x2_t)0x3FF0793DD97F62B7uLL, v45);
  v55 = *a3;
  v54 = a3[1];
  v56 = a3->f64[1];
  v57.f64[0] = vmuld_n_f64(a3->f64[0], v54.f64[0]) / v56;
  v55.f64[0] = (1.0 - a3->f64[0] - v56) * v54.f64[0] / v56;
  v58 = vmulq_f64(v57, (float64x2_t)0x3FA3EAB367A0F909uLL);
  v59 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_227A5EC60, v57.f64[0]), (float64x2_t)xmmword_227A5EC70, v54.f64[0]), (float64x2_t)xmmword_227A5EC80, v55.f64[0]);
  v60 = vdivq_f64(vmlaq_f64(vmlaq_f64(v58, (float64x2_t)0xBFB189374BC6A7F0, v54), (float64x2_t)0x3FF0793DD97F62B7uLL, v55), v53);
  v61 = vdivq_f64(v59, v52);
  v53.f64[0] = 0.0;
  v53.f64[1] = v61.f64[1];
  a13 = *(unint64_t *)&v61.f64[0];
  a14 = 0u;
  a15 = (__int128)v53;
  a16 = 0u;
  a17 = 0uLL;
  a18 = v60;
  *(_QWORD *)&v62.f64[1] = vextq_s8((int8x16_t)v62, (int8x16_t)v62, 8uLL).u64[0];
  *(_QWORD *)&v63.f64[1] = vextq_s8((int8x16_t)v63, (int8x16_t)v63, 8uLL).u64[0];
  *(_QWORD *)&v64.f64[1] = vextq_s8((int8x16_t)v64, (int8x16_t)v64, 8uLL).u64[0];
  do
  {
    v66 = *(float64x2_t *)((char *)&a13 + v43);
    v65 = *(float64x2_t *)((char *)&a13 + v43 + 16);
    v67 = (float64x2_t *)((char *)&a19 + v43);
    *v67 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v62, v66.f64[0]), v63, v66, 1), v64, v65.f64[0]);
    v67[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v46, v66), v47, v66, 1), v65, v48);
    v43 += 32;
  }
  while (v43 != 96);
  v68 = 0;
  v72 = (float64x2_t)a19;
  v69 = a20;
  v73 = (float64x2_t)a21;
  v70 = a22;
  v74 = (float64x2_t)a23;
  v71 = a24;
  a13 = xmmword_227A5EC60;
  a14 = (float64x2_t)0x3FA3EAB367A0F909uLL;
  a15 = xmmword_227A5EC70;
  a16 = (float64x2_t)0xBFB189374BC6A7F0;
  a17 = xmmword_227A5EC80;
  a18 = (float64x2_t)0x3FF0793DD97F62B7uLL;
  *(_QWORD *)&v72.f64[1] = vextq_s8((int8x16_t)v72, (int8x16_t)v72, 8uLL).u64[0];
  *(_QWORD *)&v73.f64[1] = vextq_s8((int8x16_t)v73, (int8x16_t)v73, 8uLL).u64[0];
  *(_QWORD *)&v74.f64[1] = vextq_s8((int8x16_t)v74, (int8x16_t)v74, 8uLL).u64[0];
  do
  {
    v76 = *(float64x2_t *)((char *)&a13 + v68);
    v75 = *(float64x2_t *)((char *)&a13 + v68 + 16);
    v77 = (float64x2_t *)((char *)&a19 + v68);
    *v77 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v72, v76.f64[0]), v73, v76, 1), v74, v75.f64[0]);
    v77[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v69, v76), v70, v76, 1), v75, v71);
    v68 += 32;
  }
  while (v68 != 96);
  v78 = a22;
  v79 = a23;
  v80 = a24;
  v81 = a19;
  v82 = a20;
  a1[2] = a21;
  a1[3] = (__int128)v78;
  a1[4] = v79;
  a1[5] = (__int128)v80;
  *a1 = v81;
  a1[1] = (__int128)v82;
  return a1;
}

uint64_t apple_numbers_changed_notification(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_localizeAutoLockTitles");
  return objc_msgSend(a2, "reloadSpecifierID:", CFSTR("AUTOLOCK"));
}

uint64_t HasSeenACaseLatchCoverChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifiers");
}

void sub_227A4ED0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227A5194C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227A51AD8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_227A51DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227A54378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id DBSLockScreenTimeString()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v0, "setHour:", 9);
  objc_msgSend(v0, "setMinute:", 41);
  objc_msgSend(v0, "setSecond:", 0);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateFromComponents:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v3, "setLocalizedDateFormatFromTemplate:", CFSTR("Jmm"));
  objc_msgSend(v3, "stringFromDate:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id DBS_LocalizedStringForMagnify(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Magnify"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DBS_BundleForDisplayAndBrightnessSettingsFramework()
{
  if (DBS_BundleForDisplayAndBrightnessSettingsFramework_onceToken != -1)
    dispatch_once(&DBS_BundleForDisplayAndBrightnessSettingsFramework_onceToken, &__block_literal_global_7);
  return (id)DBS_BundleForDisplayAndBrightnessSettingsFramework__displayAndBrightnessSettingsFrameworkBundle;
}

id DBS_LocalizedStringForDisplays(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Display"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DBS_LocalizedStringForFineTune(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("FineTune"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DBS_LocalizedStringForConnectedDisplays(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("ExternalDisplays"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DBS_LocalizedStringForColorSchedule(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("ColorSchedule"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DBS_LocalizedStringForColorTemperature(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("ColorTemperature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DBS_LocalizedStringForLargeFontSettings(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("LargeFontsSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DBS_LocalizedStringForDeviceAppearance(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("DeviceAppearanceSchedule"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DBS_LocalizedStringForPictureInPicture(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("PiP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DBS_LocalizedStringForContinuousExpose(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("ContinuousExpose"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_227A56E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id DBSLogForCategory(unint64_t a1)
{
  if (a1 >= 2)
    DBSLogForCategory_cold_1();
  if (DBSLogForCategory_loggingToken != -1)
    dispatch_once(&DBSLogForCategory_loggingToken, &__block_literal_global_8);
  return (id)DBSLogForCategory_logObjects[a1];
}

id sub_227A5B958()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FindClass()
{
  return objc_opt_self();
}

uint64_t sub_227A5B9AC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void DBSGetMobileFrameBuffer_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_227A37000, log, OS_LOG_TYPE_ERROR, "PSGetMobileFrameBuffer unable to get device name", v1, 2u);
}

void DBSGetMobileFrameBuffer_cold_2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_227A37000, a2, OS_LOG_TYPE_ERROR, "IOMobileFramebufferOpenByName:%d", (uint8_t *)v2, 8u);
}

void DBSLogForCategory_cold_1()
{
  __assert_rtn("DBSLogForCategory", "DBSLogging.m", 13, "category < DBSLoggingCategoryCount");
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x24BE02948]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return MEMORY[0x24BE0B4F8]();
}

uint64_t BKSDisplayBrightnessSet()
{
  return MEMORY[0x24BE0B508]();
}

uint64_t BKSDisplayBrightnessTransactionCreate()
{
  return MEMORY[0x24BE0B518]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04728]();
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x24BDC47D0](name, matrix, options, size);
}

uint64_t GSSendAppPreferencesChanged()
{
  return MEMORY[0x24BE3D620]();
}

uint64_t IOMobileFramebufferGetCanvasSizes()
{
  return MEMORY[0x24BE516E0]();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return MEMORY[0x24BE51718]();
}

uint64_t IOMobileFramebufferSetCanvasSize()
{
  return MEMORY[0x24BE51720]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x24BED8450]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PSGetCapabilityBoolAnswer()
{
  return MEMORY[0x24BE75A88]();
}

uint64_t PSIsInEDUMode()
{
  return MEMORY[0x24BE75AF0]();
}

uint64_t PSLocalizablePearlStringForKey()
{
  return MEMORY[0x24BE75BB8]();
}

uint64_t PSRoundToPixel()
{
  return MEMORY[0x24BE75C50]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x24BE75DC8]();
}

uint64_t SBSUIWallpaperGetPreview()
{
  return MEMORY[0x24BEB0FC8]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BEBE6A8]();
}

uint64_t UISUserInterfaceStyleModeSchedulesEqual()
{
  return MEMORY[0x24BEBECA0]();
}

uint64_t UISUserInterfaceStyleModeValueIsAutomatic()
{
  return MEMORY[0x24BEBECA8]();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x24BED20A0]();
}

uint64_t _AXSDisableScreenFilters()
{
  return MEMORY[0x24BED21C8]();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x24BED21D8]();
}

uint64_t _AXSScreenFilterApplied()
{
  return MEMORY[0x24BED2400]();
}

uint64_t _AXSSetEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x24BED2460]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

uint64_t _UIUpdatedVisualStyleEnabled()
{
  return MEMORY[0x24BEBEBF0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

uint64_t __invert_d3()
{
  return MEMORY[0x24BDAC808]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

