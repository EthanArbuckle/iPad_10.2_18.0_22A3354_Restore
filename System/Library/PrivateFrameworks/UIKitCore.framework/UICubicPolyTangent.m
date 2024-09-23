@implementation UICubicPolyTangent

void __44___UICubicPolyTangent_keyboardTrackpadCurve__block_invoke()
{
  _UICubicPolyTangent *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(_UICubicPolyTangent);
  v1 = (void *)_MergedGlobals_1286;
  _MergedGlobals_1286 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_1286, "setInitialLinearGain:", 0.0);
  +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gain");
  objc_msgSend((id)_MergedGlobals_1286, "setParabolicGain:");

  objc_msgSend((id)_MergedGlobals_1286, "setCubicGain:", 0.0);
  objc_msgSend((id)_MergedGlobals_1286, "setQuarticGain:", 0.0);
  +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linear");
  objc_msgSend((id)_MergedGlobals_1286, "setTangentLineSpeed:");

  +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parabolic");
  objc_msgSend((id)_MergedGlobals_1286, "setTangentSqrtSpeed:");

  objc_msgSend((id)_MergedGlobals_1286, "setTangentCbrtSpeed:", 0.0);
  objc_msgSend((id)_MergedGlobals_1286, "setTangentHyperCbrtSpeed:", 0.0);
  +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addKeyObserver:", _MergedGlobals_1286);

}

@end
