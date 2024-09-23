@implementation UIDragFeedbackGenerator

uint64_t __61___UIDragFeedbackGenerator_userInteractionStartedAtLocation___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_dragConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactionStartedFeedback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_playFeedback:atLocation:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "_startPlayingContinuousFeedback");
  }
  return objc_msgSend(*(id *)(a1 + 32), "deactivate");
}

@end
