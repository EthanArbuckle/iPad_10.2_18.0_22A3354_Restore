@implementation UIKBLightEffectsBackground

uint64_t __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addLightSourceViews");
  objc_msgSend(*(id *)(a1 + 32), "updateAlphaForAnimationStart:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "setConstant:", -300.0 / *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 48), "animatedTransitionToRenderConfig:", *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
}

void __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_4;
  v7[3] = &unk_1E16B1BF8;
  v8 = *(id *)(a1 + 48);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_5;
  v4[3] = &unk_1E16C9138;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 56);
  +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 546, v7, v4, 1.6, 0.0, 1.0, 13.853, 7.444, 0.0);

}

uint64_t __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_4(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048619, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_inheritedRenderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completeTransitionToRenderConfig:", v3);

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __49___UIKBLightEffectsBackground_showShadowEffects___block_invoke(uint64_t a1)
{
  UIVisualEffectView *v2;
  void *v3;
  UIVisualEffectView *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _UIIntelligenceEdgeLightEffect *v17;
  void *v18;
  void *v19;
  UIView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _UIIntelligenceEdgeLightEffect *v67;
  _QWORD v68[8];
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v2 = [UIVisualEffectView alloc];
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIVisualEffectView initWithEffect:](v2, "initWithEffect:", v3);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[UIVisualEffectView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 25.0);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.3);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "CGColor");
  -[UIView layer](v4, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderColor:", v8);

  -[UIView layer](v4, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderWidth:", 4.0);

  -[UIView layer](v4, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", 25.0);

  v12 = *MEMORY[0x1E0CD2A68];
  -[UIView layer](v4, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerCurve:", v12);

  -[UIView layer](v4, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsGroupOpacity:", 0);

  -[UIView layer](v4, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsGroupBlending:", 0);

  -[UIView layer](v4, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAllowsEdgeAntialiasing:", 0);

  v17 = [_UIIntelligenceEdgeLightEffect alloc];
  +[_UIIntelligenceLightSourceDescriptor sharedShimmeringLight](_UIIntelligenceLightSourceDescriptor, "sharedShimmeringLight");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[_UIIntelligenceEdgeLightEffect initWithLightSource:radius:region:](v17, "initWithLightSource:radius:region:", v18, 1, 8.0);

  v69[0] = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundEffects:](v4, "setBackgroundEffects:", v19);

  v20 = objc_alloc_init(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v21);

  -[UIView layer](v20, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAllowsGroupOpacity:", 0);

  -[UIView layer](v20, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAllowsGroupBlending:", 0);

  -[UIView layer](v20, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAllowsEdgeAntialiasing:", 0);

  -[UIView layer](v20, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCornerRadius:", 25.0);

  -[UIView layer](v20, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCornerCurve:", v12);

  -[UIView layer](v20, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setShadowPathIsBounds:", 1);

  +[UIColor blackColor](UIColor, "blackColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "colorWithAlphaComponent:", 0.5);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v30 = objc_msgSend(v29, "CGColor");
  -[UIView layer](v20, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setShadowColor:", v30);

  -[UIView layer](v20, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setShadowRadius:", 11.0);

  -[UIView layer](v20, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = 1053609165;
  objc_msgSend(v33, "setShadowOpacity:", v34);

  -[UIView layer](v20, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setShadowOffset:", 0.0, 8.0);

  objc_msgSend(*(id *)(a1 + 32), "backdropClippingView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", v20);

  objc_msgSend(*(id *)(a1 + 32), "backdropClippingView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addSubview:", v4);

  v55 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(*(id *)(a1 + 32), "fullBackdropLayoutGuide");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](v4, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, 0.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v63;
  -[UIView leadingAnchor](v4, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = a1;
  objc_msgSend(*(id *)(a1 + 32), "backdropClippingView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v59, 1.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v58;
  objc_msgSend(*(id *)(a1 + 32), "backdropClippingView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v4, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v54, 1.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v53;
  -[UIView heightAnchor](v4, "heightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToConstant:", 50.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v68[3] = v51;
  -[UIView leadingAnchor](v20, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v4, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v68[4] = v48;
  -[UIView trailingAnchor](v4, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v20, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v68[5] = v38;
  -[UIView bottomAnchor](v4, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](v20, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v68[6] = v41;
  -[UIView heightAnchor](v20, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](v4, "heightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v68[7] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "activateConstraints:", v45);

  objc_msgSend(*(id *)(v62 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(v62 + 32), "setMirroredLightBorderView:", v4);
  objc_msgSend(*(id *)(v62 + 32), "setMirroredShadowView:", v20);

}

@end
