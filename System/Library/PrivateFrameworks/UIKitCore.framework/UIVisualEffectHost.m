@implementation UIVisualEffectHost

BOOL __59___UIVisualEffectHost__updateView_shouldDrawWithTintColor___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  char isKindOfClass;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UILabel _setMaterialTextColorFollowsTintColor:](v3, *(unsigned __int8 *)(a1 + 32));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void __68___UIVisualEffectHost__applyRequestedDescriptorEffectInvertingView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if (v3 == a2)
  {
    objc_msgSend(v4, "applyIdentityViewEffects");
    objc_msgSend(v4, "applyIdentityFilterEffects");
  }
  else
  {
    objc_msgSend(v4, "applyRequestedViewEffects");
    objc_msgSend(v4, "applyRequestedFilterEffects");
  }

}

uint64_t __46___UIVisualEffectHost_setPrimaryCaptureGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrimaryCaptureGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

void __61___UIVisualEffectHost_prepareToTransitionToEffectDescriptor___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateAdjustTintColors");
  objc_msgSend(*(id *)(a1 + 32), "_configureEffectDescriptor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = *(id **)(a1 + 32);
  objc_msgSend(v2[7], "_identityContainerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_applyIdentityDescriptorEffectInvertingView:", v3);

}

void __67___UIVisualEffectHost__applyIdentityDescriptorEffectInvertingView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if (v3 == a2)
  {
    objc_msgSend(v4, "applyRequestedViewEffects");
    objc_msgSend(v4, "applyRequestedFilterEffects");
  }
  else
  {
    objc_msgSend(v4, "applyIdentityViewEffects");
    objc_msgSend(v4, "applyIdentityFilterEffects");
  }

}

void __36___UIVisualEffectHost_endTransition__block_invoke(uint64_t a1)
{
  id *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_configureEffectDescriptor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = *(id **)(a1 + 32);
  objc_msgSend(v2[6], "_identityContainerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_applyRequestedDescriptorEffectInvertingView:", v3);

}

@end
