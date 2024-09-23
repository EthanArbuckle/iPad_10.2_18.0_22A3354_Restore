@implementation UIWebURLAction

+ (void)performDataDetectorsDefaultActionForDOMNode:(id)a3 forFrame:(id)a4 inView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultActionForDOMNode:forFrame:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "performAction:inView:interactionDelegate:", v10, v7, 0);
}

+ (BOOL)performDefaultActionForURL:(id)a3 andDOMNode:(id)a4 withAllowedTypes:(unint64_t)a5 forFrame:(id)a6 inView:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  void *v17;
  uint64_t v18;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = 0;
  if (v12 && v13)
  {
    if ((a5 & 0xFFFFFFFF80000001) != 0
      && objc_msgSend(v12, "isSpringboardHandledURL")
      && TelephonyUtilitiesLibrary()
      && objc_msgSend(v12, "hasTelephonyScheme"))
    {
      goto LABEL_14;
    }
    if ((a5 & 4) != 0)
    {
      objc_msgSend(v12, "scheme");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "caseInsensitiveCompare:", CFSTR("x-apple-data-detectors"));

      if (!v18)
        goto LABEL_14;
    }
    if ((a5 & 2) != 0 && objc_msgSend(v12, "isSpringboardHandledURL"))
    {
      if (!TelephonyUtilitiesLibrary()
        || (objc_msgSend(v12, "isFaceTimeURL") & 1) == 0 && !objc_msgSend(v12, "isFaceTimeAudioURL"))
      {
        objc_msgSend((id)UIApp, "_openURL:originatingView:completionHandler:", v12, v15, 0);
        goto LABEL_17;
      }
LABEL_14:
      objc_msgSend(a1, "performDataDetectorsDefaultActionForDOMNode:forFrame:inView:", v13, v14, v15);
LABEL_17:
      v16 = 1;
      goto LABEL_18;
    }
    v16 = 0;
  }
LABEL_18:

  return v16;
}

@end
