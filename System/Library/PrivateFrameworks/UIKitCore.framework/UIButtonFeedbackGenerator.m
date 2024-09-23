@implementation UIButtonFeedbackGenerator

void __63___UIButtonFeedbackGenerator_userInteractionStartedAtLocation___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_buttonConfiguration");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactionStartedFeedback");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_playFeedback:atLocation:", v4, *(double *)(a1 + 40), *(double *)(a1 + 48));

  }
}

@end
