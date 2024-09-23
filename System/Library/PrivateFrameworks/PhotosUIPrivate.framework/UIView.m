@implementation UIView

uint64_t __82__UIView_PUAnimationGroup___pu_animateViews_withAnimationBlock_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__UIView_PUAnimationGroup___pu_animateViews_withAnimationBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeIfNeeded");
}

uint64_t __143__UIView_PUAnimationGroup__pu_animateViews_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

uint64_t __130__UIView_PUAnimationGroup__pu_animateViews_usingDefaultDampedSpringWithDelay_initialSpringVelocity_options_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __138__UIView_PUAnimationGroup__pu_animateViews_withDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __93__UIView_PUAnimationGroup__pu_animateViews_withDuration_delay_options_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return result;
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_7(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_15(uint64_t a1)
{
  _BYTE v2[48];

  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v2, PUComposeTransform(MEMORY[0x1E0C9BAA8], (uint64_t)v2, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72)));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2_16(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3_17(uint64_t a1)
{
  _BYTE v2[48];

  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v2, PUComposeTransform(MEMORY[0x1E0C9BAA8], (uint64_t)v2, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72)));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4_18(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5_19(uint64_t a1)
{
  _BYTE v2[48];

  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v2, PUComposeTransform(MEMORY[0x1E0C9BAA8], (uint64_t)v2, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72)));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6_20(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __158__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_completion___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v12 = *(_QWORD *)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  v10 = a2;
  objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pu_animateViews:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", v11, *(_QWORD *)(a1 + 56), v10, v9, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), a4, v12, v13);

}

void __139__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_usingDefaultDampedSpringWithDelay_initialVelocity_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v12 = *(_QWORD *)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  v10 = a2;
  objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pu_animateViews:usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", v11, *(_QWORD *)(a1 + 48), v10, v9, *(double *)(a1 + 40), a4, v12, v13);

}

void __147__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_withDuration_delay_usingSpringWithDamping_initialVelocity_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v12 = *(_QWORD *)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  v10 = a2;
  objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pu_animateViews:withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v11, *(_QWORD *)(a1 + 64), v10, v9, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), a4, v12, v13);

}

uint64_t __75__UIView_PhotosUI___pu_animateWithDuration_enforced_animations_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
