@implementation UITextChoiceAccelerationAssistant

void __72___UITextChoiceAccelerationAssistant_createPromptWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "updateDocumentFromPrompt:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

UIColor *__59___UITextChoiceAccelerationAssistant_defaultUnderlineColor__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;

  v3 = dbl_18667CA90[objc_msgSend(a2, "userInterfaceStyle") == 2];
  v4 = v3 + *(double *)(a1 + 40) * fmin(v3, 1.0 - v3);
  v5 = 0.0;
  if (v4 != 0.0)
    v5 = 1.0 - v3 / v4 + 1.0 - v3 / v4;
  return +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", *(double *)(a1 + 32), v5);
}

void __96___UITextChoiceAccelerationAssistant_showPromptForReplacementCandidate_originalCandidate_delay___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(*(id *)(a1 + 32), "textChoices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 48), "prompt");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCandidate:", v4);

      objc_msgSend(*(id *)(a1 + 48), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "keyboardState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "secureCandidateRenderTraits");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "singleCellHeight");
      v10 = v9;
      objc_msgSend(*(id *)(a1 + 48), "prompt");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSecureCandidateHeight:", v10);

    }
    if (objc_msgSend(*(id *)(a1 + 48), "usingCustomInteraction"))
    {
      objc_msgSend(*(id *)(a1 + 48), "textInputResponder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = *(_QWORD *)(a1 + 56);

        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 48), "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "textInputResponder");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "updateTextChoicePromptSelection:toRange:", v15, *(_QWORD *)(a1 + 56));

          objc_msgSend(*(id *)(a1 + 48), "updateSelectionHighlights");
        }
      }
    }
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "prompt");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setReplacement:", v16);

    objc_msgSend(*(id *)(a1 + 48), "prompt");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "candidateChoices");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 48), "textInputView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateWithChoices:fromParentView:referenceTextView:presentedFromRect:textHighlightColor:", v19, v20, v21, *(_QWORD *)(a1 + 72), 0);

    v22 = *(void **)(a1 + 48);
    objc_msgSend(v22, "prompt");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updatePrompt:forReplacementCandidate:", v23, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 48), "setupPassthroughContainer");
  }
}

void __97___UITextChoiceAccelerationAssistant_shouldShowPromptForWebKitText_atPosition_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "rangeOfAutocorrectionForString:atPosition:inDocument:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v3 != 0);

}

void __93___UITextChoiceAccelerationAssistant_fullAutocorrectionForWord_atPosition_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(*(id *)(a1 + 32), "rangeOfAutocorrectionForString:atPosition:inDocument:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (objc_msgSend(v16, "fullText"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v6 = objc_msgSend(v3, "rangeValue"),
        v8 = v6 + v7,
        v4,
        v5 >= v8))
  {
    objc_msgSend(v16, "fullText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "rangeValue");
    objc_msgSend(v9, "substringWithRange:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "underlinedWordData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        v15 = v12;
      else
        v15 = 0;
      (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v15);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __157___UITextChoiceAccelerationAssistant_decorateTextInRanges_replacementText_allowAutomaticReplacement_autoHide_voiceCommandTrackingUUID_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "updateSelectionHighlights");
  objc_msgSend(*(id *)(a1 + 40), "replacement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "revertText");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "replacement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textChoices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "updateDocumentFromPrompt:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __157___UITextChoiceAccelerationAssistant_decorateTextInRanges_replacementText_allowAutomaticReplacement_autoHide_voiceCommandTrackingUUID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetDictationChoices");
}

uint64_t __198___UITextChoiceAccelerationAssistant_decorateTextInRects_targetTextArray_replacementText_deltaRanges_originalSelectedRange_allowAutomaticReplacement_autoHide_voiceCommandUUID_withCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateSelectionHighlights");
  return objc_msgSend(*(id *)(a1 + 32), "updateDocumentFromPrompt:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __198___UITextChoiceAccelerationAssistant_decorateTextInRects_targetTextArray_replacementText_deltaRanges_originalSelectedRange_allowAutomaticReplacement_autoHide_voiceCommandUUID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "resetDictationChoices");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

@end
