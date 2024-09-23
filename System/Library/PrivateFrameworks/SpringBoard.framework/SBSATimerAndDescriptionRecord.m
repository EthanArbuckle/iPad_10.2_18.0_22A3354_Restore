@implementation SBSATimerAndDescriptionRecord

void __43___SBSATimerAndDescriptionRecord_schedule___block_invoke(uint64_t a1)
{
  SBSAElapsedTimerDescription *v2;
  void *v3;
  id v4;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [SBSAElapsedTimerDescription alloc];
    objc_msgSend(WeakRetained, "timerDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SBSAElapsedTimerDescription initElapsedTimerDescriptionWithDescription:](v2, "initElapsedTimerDescriptionWithDescription:", v3);
    objc_msgSend(WeakRetained, "setTimerDescription:", v4);

    objc_msgSend(WeakRetained[1], "invalidate");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
