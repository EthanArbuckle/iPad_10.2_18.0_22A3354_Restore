@implementation UIPhysicalButtonAction

void __65___UIPhysicalButtonAction_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;

  v2 = (void *)a1[2].i64[0];
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65___UIPhysicalButtonAction_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v5 = a1[2];
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __65___UIPhysicalButtonAction_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  const __CFString *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  _NSStringFromUIPhysicalButton(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:");
  _NSStringFromUIPhysicalButtonState(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v2, CFSTR("state"));
  _NSStringFromUIPhysicalButtonBehavior(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v3, CFSTR("behavior"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 48);
  if (v5)
  {
    v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v5, CFSTR("contact"));
    v4 = *(_QWORD *)(a1 + 32);
  }
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendUnsignedInteger:withName:", *(_QWORD *)(v4 + 56), CFSTR("stage"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 40), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), CFSTR("numberOfStages"));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v9 > 3)
    v10 = &stru_1E16EDF20;
  else
    v10 = off_1E16E3820[v9];
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v10, CFSTR("stagePhase"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 40), "appendFloat:withName:decimalPrecision:", CFSTR("normalizedForce"), 3, *(double *)(*(_QWORD *)(a1 + 32) + 80));
  v12 = (id)objc_msgSend(*(id *)(a1 + 40), "appendFloat:withName:decimalPrecision:", CFSTR("normalizedForceVelocity"), 3, *(double *)(*(_QWORD *)(a1 + 32) + 88));
  v13 = (id)objc_msgSend(*(id *)(a1 + 40), "appendFloat:withName:decimalPrecision:", CFSTR("releaseStageForceThreshold"), 3, *(double *)(*(_QWORD *)(a1 + 32) + 96));
  v14 = (id)objc_msgSend(*(id *)(a1 + 40), "appendFloat:withName:decimalPrecision:", CFSTR("pressedStageForceThreshold"), 3, *(double *)(*(_QWORD *)(a1 + 32) + 104));
  v15 = (id)objc_msgSend(*(id *)(a1 + 40), "appendFloat:withName:decimalPrecision:", CFSTR("nextStageForceThreshold"), 3, *(double *)(*(_QWORD *)(a1 + 32) + 112));

}

@end
