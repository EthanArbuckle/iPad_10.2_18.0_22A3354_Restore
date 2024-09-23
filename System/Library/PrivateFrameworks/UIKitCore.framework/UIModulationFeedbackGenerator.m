@implementation UIModulationFeedbackGenerator

uint64_t __62___UIModulationFeedbackGenerator_activateWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, double);
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "playingContinuousFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = 1;
  else
    v5 = (_DWORD)a2 == 0;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_modulationConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "feedback");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "_modulationConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "feedbackUpdateBlock");
      v10 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, double))v10)[2](v10, v8, *(double *)(*(_QWORD *)(a1 + 32) + 168));

      objc_msgSend(*(id *)(a1 + 32), "setPlayingContinuousFeedback:", v8);
      objc_msgSend(*(id *)(a1 + 32), "_playFeedback:atLocation:", v8, 1.79769313e308, 1.79769313e308);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
