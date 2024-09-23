@implementation CRTextFeatureOrderingUtilities

+ (id)textFeatureOrderWithRevision:(unint64_t)a3 angleThresholdForRotatedCrops:(double)a4 optimizeGroupsForStability:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v7;
  CRTextFeatureOrderV2 *v8;
  CRTextFeatureOrderV2 *v9;
  uint8_t v11[16];

  v5 = a5;
  if (a3 <= 2)
  {
    CROSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_DEFAULT, "textFeatureOrderWithRevision is only supported on V3 onwards", v11, 2u);
    }

  }
  v8 = -[CRTextFeatureOrderV2 initWithAngleThresholdForRotatedCrops:]([CRTextFeatureOrderV2 alloc], "initWithAngleThresholdForRotatedCrops:", a4);
  v9 = v8;
  if (v5)
    -[CRTextFeatureOrderV2 setTextFeatureOrderMode:](v8, "setTextFeatureOrderMode:", 1);
  return v9;
}

@end
