@implementation _UIKeyboardUsageTracking

+ (void)showLowercaseKeyplanePreference:(BOOL)a3
{
  id v3;

  TIStatisticGetKey();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarSetBoolean();

}

+ (void)showCharacterPreviewPreference:(BOOL)a3
{
  id v3;

  TIStatisticGetKey();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarSetBoolean();

}

+ (void)appAutofillDetectedIncrement
{
  void *v2;
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isRTIClient");
  TIStatisticGetKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)keyboardSetToInputMode:(id)a3 fromPrevious:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  if (v14)
  {
    if (objc_msgSend(v14, "isExtensionInputMode"))
    {
      objc_msgSend(v14, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement3PKSummoned();

      if (!v5 || objc_msgSend(v5, "isExtensionInputMode"))
      {
        if ((objc_msgSend(v14, "isEqual:", v5) & 1) != 0)
          goto LABEL_10;
        objc_msgSend(v14, "containingBundleDisplayName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "containingBundleDisplayName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToString:", v8);

        if ((v9 & 1) == 0)
          goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(v14, "identifierWithLayouts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrementSystemKeyboardSummoned();

      if (!objc_msgSend(v5, "isExtensionInputMode"))
      {
LABEL_10:
        v12 = (void *)objc_opt_class();
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "predictionViewState:forInputMode:", objc_msgSend(v13, "isPredictionViewControllerVisible"), v14);

        goto LABEL_11;
      }
    }
    TIStatisticGetKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();

    goto LABEL_10;
  }
LABEL_11:

}

+ (void)keyboardExtensionPrimaryLanguageChanged
{
  id v2;

  TIStatisticGetKey();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)keyboardExtensionCrashed
{
  id v2;

  TIStatisticGetKey();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)keyboardExtensionsOnDevice
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticGetKeyForInputMode();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticScalarSetValue();

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeInputModes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        if (objc_msgSend(v16, "isExtensionInputMode"))
        {
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          TIStatisticGetKeyForInputMode();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          TIStatisticScalarSetValue();

          objc_msgSend(v16, "defaultLayoutIsASCIICapable");
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v13);
  }

  TIStatisticGetKey();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarSetValue();

}

+ (void)predictionViewState:(BOOL)a3 forInputMode:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend(v4, "isExtensionInputMode") & 1) == 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = UIKeyboardPredictionEnabledForInputModes(v6);

    if (v7)
    {
      objc_msgSend(v4, "identifierWithLayouts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticGetKeyForInputMode();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

    }
  }

}

+ (void)inputSwitcherSetPredictionPreference:(BOOL)a3
{
  id v3;

  TIStatisticGetKey();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)keyboardGestureSetPredictionPreference:(BOOL)a3
{
  id v3;

  TIStatisticGetKey();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)keyboardGestureSelectedPredictiveInputCandidate
{
  id v2;

  TIStatisticGetKey();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)selectedPredictiveInputCandidate:(id)a3 isAutocorrection:(BOOL)a4 index:(unint64_t)a5
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a4;
  v17 = a3;
  UIKeyboardGetCurrentInputMode();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v5)
      goto LABEL_6;
    objc_msgSend(v17, "input");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (!v9)
      goto LABEL_6;
    objc_msgSend(v17, "input");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "candidate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (v12)
    {
      TIStatisticGetKeyForInputMode();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();
    }
    else
    {
LABEL_6:
      TIStatisticGetKeyForInputMode();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

      TIStatisticGetKeyForInputMode();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "candidate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "length");
      TIStatisticDistributionPushValue();

    }
    TIStatisticGetKeyForInputMode();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticDistributionPushValue();

  }
}

+ (void)keyboardGestureTwoFingerTap:(BOOL)a3 withTapCount:(int)a4
{
  id v4;

  if ((a4 - 1) <= 2)
  {
    TIStatisticsGetKeyForGesture();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();

  }
}

+ (void)keyboardGestureOneFingerForcePan:(BOOL)a3
{
  id v3;

  TIStatisticGetKey();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)keyboardGestureOneFingerForcePress:(BOOL)a3 withPressCount:(int)a4
{
  id v4;

  if ((a4 - 1) <= 2)
  {
    TIStatisticsGetKeyForGesture();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();

  }
}

+ (void)keyboardPerformanceFromTouchStart:(double)a3 until:(double)a4
{
  id v4;

  if (a3 != 0.0)
  {
    TIStatisticGetKey();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();

  }
}

+ (void)keyboardPerformanceFromTouchRelease:(double)a3 until:(double)a4
{
  id v4;

  if (a3 != 0.0)
  {
    TIStatisticGetKey();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    TIStatisticDistributionPushValue();

  }
}

+ (void)keyboardTotalOnScreenTime:(double)a3 orientation:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((unint64_t)(a4 - 1) <= 1)
  {
    TIStatisticGetKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticDistributionPushValue();

    TIStatisticGetKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();

  }
  TIStatisticGetKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticDistributionPushValue();

  TIStatisticGetKey();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)keyboardReachabilityDistribution:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  UIKeyboardGetCurrentInputMode();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v4);
  v7 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v7;
  if (v7 && (a3 > 0.0 || a3 < 0.0))
  {
    TIStatisticGetKeyForInputMode();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticDistributionPushValue();

    v5 = (void *)v7;
  }

}

+ (void)dualStringsKeyFlickUpCount
{
  void *v2;
  id v3;

  UIKeyboardGetCurrentInputMode();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticGetKeyForInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)singleStringKeyFlickUpCount
{
  void *v2;
  id v3;

  UIKeyboardGetCurrentInputMode();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticGetKeyForInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)panAlternateKeyFlickDownCount
{
  void *v2;
  id v3;

  UIKeyboardGetCurrentInputMode();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticGetKeyForInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)redoKeyCount
{
  void *v2;
  id v3;

  UIKeyboardGetCurrentInputMode();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticGetKeyForInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)undoKeyCount
{
  void *v2;
  id v3;

  UIKeyboardGetCurrentInputMode();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticGetKeyForInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)normalPunctuationKeyCount
{
  void *v2;
  id v3;

  UIKeyboardGetCurrentInputMode();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticGetKeyForInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)restAndTypeTriggered
{
  id v2;

  TIStatisticGetKey();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)countKeystrokeForReachableKeyboardWithBias:(int64_t)a3
{
  id v3;

  if (a3)
  {
    TIStatisticGetKey();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();

  }
}

+ (void)countReachableKeyboardHandBiasChangeToBias:(int64_t)a3
{
  id v3;

  TIStatisticGetKey();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)appAutofillDetectedDecrement
{
  void *v2;
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isRTIClient");
  TIStatisticGetKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarDecrement();

}

+ (void)appAutofillFilled
{
  void *v2;
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isRTIClient");
  TIStatisticGetKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)appAutofillExtraKeyTapped
{
  id v2;

  TIStatisticGetKey();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)appAutofillCredentialFromSafariUI
{
  id v2;

  TIStatisticGetKey();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)loginPasswordFromAutofillIncrement
{
  void *v2;
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isRTIClient");
  TIStatisticGetKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)loginPasswordFromKeyboardIncrement
{
  void *v2;
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isRTIClient");
  TIStatisticGetKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)signupPasswordFromAutofillIncrement
{
  id v2;

  TIStatisticGetKey();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)signupPasswordFromKeyboardIncrement
{
  id v2;

  TIStatisticGetKey();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)keyboardSupportsTouch:(BOOL)a3
{
  id v3;

  TIStatisticGetKey();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarSetBoolean();

}

+ (void)letterCaseToggleIncrement
{
  id v2;

  TIStatisticGetKey();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)showVariantsIncrement
{
  id v2;

  TIStatisticGetKey();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

+ (void)variantDeleteIncrement
{
  id v2;

  TIStatisticGetKey();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

}

@end
