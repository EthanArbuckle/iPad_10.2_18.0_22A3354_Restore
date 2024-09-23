@implementation UISheetPresentationMetrics

void __46___UISheetPresentationMetrics__defaultMetrics__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_UISheetPresentationMetrics _init]([_UISheetPresentationMetrics alloc], "_init");
  v1 = (void *)_MergedGlobals_13_5;
  _MergedGlobals_13_5 = (uint64_t)v0;

}

void __67___UISheetPresentationMetrics_transitionSpringParametersHighSpeed___block_invoke()
{
  double v0;
  double v1;
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;

  if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_916, (uint64_t)CFSTR("SheetDampingRatio")))
    v0 = 1.0;
  else
    v0 = *(double *)&qword_1ECD767C0;
  if (_UIInternalPreferenceUsesDefault_1((int *)algn_1ECD767D8, (uint64_t)CFSTR("SheetResponse")))
    v1 = 0.344144233;
  else
    v1 = *(double *)&qword_1ECD767E0;
  +[_UISpringParameters parametersWithDampingRatio:response:](_UISpringParameters, "parametersWithDampingRatio:response:", v0, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD79B50;
  qword_1ECD79B50 = v2;

  if (_UIInternalPreferenceUsesDefault_1((int *)algn_1ECD767C8, (uint64_t)CFSTR("SheetHighSpeedDampingRatio")))v4 = 0.8;
  else
    v4 = *(double *)&qword_1ECD767D0;
  if (_UIInternalPreferenceUsesDefault_1((int *)algn_1ECD767D8, (uint64_t)CFSTR("SheetResponse")))
    v5 = 0.344144233;
  else
    v5 = *(double *)&qword_1ECD767E0;
  +[_UISpringParameters parametersWithDampingRatio:response:](_UISpringParameters, "parametersWithDampingRatio:response:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ECD79B58;
  qword_1ECD79B58 = v6;

}

@end
