@implementation PIGainMap

+ (NSString)currentVersion
{
  return (NSString *)CFSTR("GM1");
}

+ (id)gainMapParametersFromRawProperties:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isAppleProRaw")
    && objc_msgSend(a1, "shouldUseGainMapExposureCompensationForRawProperties:", v4))
  {
    objc_msgSend(v4, "rawToneCurveProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      LODWORD(v6) = 1043878380;
      objc_msgSend(v5, "inverseAggregatedCurveValueAt:", v6);
      *(float *)&v9 = (float)(0.18 / v8) * 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)shouldUseGainMapExposureCompensationForRawProperties:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  if (!objc_msgSend(v3, "isAppleProRaw"))
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0D52108], "meteorGainMapExposureCompensationMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (objc_msgSend(v3, "hasLensCorrection") && objc_msgSend(v3, "isSensorRawCapture"))
    {
      v5 = objc_msgSend(v3, "isUnifiedBracketingHDRCapture") ^ 1;
      goto LABEL_8;
    }
LABEL_7:
    LOBYTE(v5) = 0;
    goto LABEL_8;
  }
  LOBYTE(v5) = 1;
LABEL_8:

  return v5;
}

@end
