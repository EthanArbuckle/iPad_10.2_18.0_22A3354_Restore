@implementation WTReplaceTextEffect

void __35___WTReplaceTextEffect_invalidate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(void);

  objc_msgSend(*(id *)(a1 + 32), "rootLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperlayer");

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "completion");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

    }
  }
}

void __41___WTReplaceTextEffect_updateEffectWith___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  id v7;

  objc_msgSend(a2, "candidateRects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isDestination");

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "setHighlightsCandidateRects:", 1);
      *a4 = 1;
    }
  }
  else
  {

  }
}

void __41___WTReplaceTextEffect_updateEffectWith___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "removeEffect:animated:", v2, objc_msgSend(*(id *)(a1 + 32), "animateRemovalWhenDone"));

}

@end
