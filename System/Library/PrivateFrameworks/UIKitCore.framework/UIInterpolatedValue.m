@implementation UIInterpolatedValue

+ (id)interpolatedWrapperForValue:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(a1, "interpolatedWrapperForZeroForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (qword_1ECD82440 != -1)
    dispatch_once(&qword_1ECD82440, &__block_literal_global_114_3);
  objc_msgSend((id)qword_1ECD82438, "objectForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "CGPointValue");
  return +[UIInterpolatedPoint valueWithCGPoint:](UIInterpolatedPoint, "valueWithCGPoint:");
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_8(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "CGRectValue");
  return +[UIInterpolatedRect valueWithCGRect:](UIInterpolatedRect, "valueWithCGRect:");
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_7(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "doubleValue");
  return +[UIInterpolatedFloat valueWithFloat:](UIInterpolatedScaledFloat, "valueWithFloat:");
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_6(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "doubleValue");
  return +[UIInterpolatedFloat valueWithFloat:](UIInterpolatedFloat, "valueWithFloat:");
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_2(uint64_t a1, void *a2)
{
  _OWORD v3[8];

  if (a2)
    objc_msgSend(a2, "CATransform3DValue");
  else
    memset(v3, 0, sizeof(v3));
  +[UIInterpolatedTransform valueWithCATransform3D:](UIInterpolatedTransform, "valueWithCATransform3D:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_9(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "CGRectValue");
  return +[UIInterpolatedRect valueWithCGRect:](UIInterpolatedNormalizedRect, "valueWithCGRect:");
}

+ (id)interpolatedWrapperForZeroForKey:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (qword_1ECD82450 != -1)
    dispatch_once(&qword_1ECD82450, &__block_literal_global_142_2);
  objc_msgSend((id)qword_1ECD82448, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_6()
{
  return +[UIInterpolatedFloat zeroCompatibleWithVector:](UIInterpolatedFloat, "zeroCompatibleWithVector:", 0);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_8()
{
  return +[UIInterpolatedRect zeroCompatibleWithVector:](UIInterpolatedRect, "zeroCompatibleWithVector:", 0);
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_12(uint64_t a1, void *a2)
{
  _OWORD v3[5];

  if (a2)
    objc_msgSend(a2, "CAColorMatrixValue");
  else
    memset(v3, 0, sizeof(v3));
  +[UIInterpolatedColorMatrix valueWithColorMatrix:](UIInterpolatedColorMatrix, "valueWithColorMatrix:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)initialize
{
  if (initialize_onceToken_2 != -1)
    dispatch_once(&initialize_onceToken_2, &__block_literal_global_643);
}

void __33__UIInterpolatedValue_initialize__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v0 = (void *)_MergedGlobals_1318;
  _MergedGlobals_1318 = (uint64_t)&unk_1E1A95138;

  v1 = (void *)qword_1ECD823D8;
  qword_1ECD823D8 = (uint64_t)&unk_1E1A95150;

  v2 = (void *)qword_1ECD823E0;
  qword_1ECD823E0 = (uint64_t)&unk_1E1A95168;

  v3 = (void *)qword_1ECD823E8;
  qword_1ECD823E8 = (uint64_t)&unk_1E1A95180;

  v4 = (void *)qword_1ECD823F0;
  qword_1ECD823F0 = (uint64_t)&unk_1E1A95198;

  v5 = (void *)qword_1ECD823F8;
  qword_1ECD823F8 = (uint64_t)&unk_1E1A951B0;

  v6 = (void *)qword_1ECD82400;
  qword_1ECD82400 = (uint64_t)&unk_1E1A951C8;

  v7 = (void *)qword_1ECD82408;
  qword_1ECD82408 = (uint64_t)&unk_1E1A951E0;

  v8 = (void *)qword_1ECD82410;
  qword_1ECD82410 = (uint64_t)&unk_1E1A951F8;

  v9 = (void *)qword_1ECD82418;
  qword_1ECD82418 = (uint64_t)&unk_1E1A95210;

  v10 = (void *)qword_1ECD82420;
  qword_1ECD82420 = (uint64_t)&unk_1E1A95228;

  v11 = (void *)qword_1ECD82428;
  qword_1ECD82428 = (uint64_t)&unk_1E1A95240;

  v12 = (void *)qword_1ECD82430;
  qword_1ECD82430 = (uint64_t)&unk_1E1A95258;

}

void __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD82438;
  qword_1ECD82438 = v0;

  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_116_0, (void *)qword_1ECD82418);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_118_1, (void *)qword_1ECD823E0);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_120_1, (void *)qword_1ECD823E8);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_122_2, (void *)qword_1ECD823F0);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_124_1, (void *)_MergedGlobals_1318);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_126_0, (void *)qword_1ECD823D8);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_128_0, (void *)qword_1ECD82408);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_130_1, (void *)qword_1ECD82410);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_132_2, (void *)qword_1ECD823F8);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_134, (void *)qword_1ECD82400);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_136_3, (void *)qword_1ECD82420);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_138_1, (void *)qword_1ECD82428);
  setObjectForKeys((void *)qword_1ECD82438, &__block_literal_global_140_2, (void *)qword_1ECD82430);
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "CGSizeValue");
  return +[UIInterpolatedSize valueWithCGSize:](UIInterpolatedSize, "valueWithCGSize:");
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_5(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "CGPointValue");
  return +[UIInterpolatedPoint valueWithCGPoint:](UIInterpolatedNormalizedPoint, "valueWithCGPoint:");
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return +[UIInterpolatedColor valueWithCGColor:](UIInterpolatedColor, "valueWithCGColor:", a2);
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return +[UIInterpolatedColorArray valueWithCGColors:](UIInterpolatedColorArray, "valueWithCGColors:", a2);
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_13(uint64_t a1, uint64_t a2)
{
  return +[UIInterpolatedMeshTransform valueWithMeshTransform:](UIInterpolatedMeshTransform, "valueWithMeshTransform:", a2);
}

id __55__UIInterpolatedValue_interpolatedWrapperForValue_key___block_invoke_14(uint64_t a1, void *a2)
{
  _OWORD v3[4];

  if (a2)
    objc_msgSend(a2, "CACornerRadiiValue");
  else
    memset(v3, 0, sizeof(v3));
  +[UIInterpolatedCornerRadii valueWithCornerRadii:](UIInterpolatedCornerRadii, "valueWithCornerRadii:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD82448;
  qword_1ECD82448 = v0;

  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_143_0, (void *)qword_1ECD82418);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_144_1, (void *)qword_1ECD823E0);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_145_1, (void *)qword_1ECD823E8);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_146_3, (void *)qword_1ECD823F0);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_147_2, (void *)_MergedGlobals_1318);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_148_0, (void *)qword_1ECD823D8);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_149_3, (void *)qword_1ECD82408);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_150_3, (void *)qword_1ECD82410);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_151_1, (void *)qword_1ECD823F8);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_152_5, (void *)qword_1ECD82400);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_153_3, (void *)qword_1ECD82420);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_154_0, (void *)qword_1ECD82428);
  setObjectForKeys((void *)qword_1ECD82448, &__block_literal_global_155_2, (void *)qword_1ECD82430);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_2()
{
  return +[UIInterpolatedTransform zeroCompatibleWithVector:](UIInterpolatedTransform, "zeroCompatibleWithVector:", 0);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_3()
{
  return +[UIInterpolatedPoint zeroCompatibleWithVector:](UIInterpolatedPoint, "zeroCompatibleWithVector:", 0);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_4()
{
  return +[UIInterpolatedSize zeroCompatibleWithVector:](UIInterpolatedSize, "zeroCompatibleWithVector:", 0);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_5()
{
  return +[UIInterpolatedPoint zeroCompatibleWithVector:](UIInterpolatedNormalizedPoint, "zeroCompatibleWithVector:", 0);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_7()
{
  return +[UIInterpolatedFloat zeroCompatibleWithVector:](UIInterpolatedScaledFloat, "zeroCompatibleWithVector:", 0);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_9()
{
  return +[UIInterpolatedRect zeroCompatibleWithVector:](UIInterpolatedNormalizedRect, "zeroCompatibleWithVector:", 0);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_10()
{
  return +[UIInterpolatedColor zeroCompatibleWithVector:](UIInterpolatedColor, "zeroCompatibleWithVector:", 0);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_11()
{
  return +[UIInterpolatedColorArray zeroCompatibleWithVector:](UIInterpolatedColorArray, "zeroCompatibleWithVector:", 0);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_12()
{
  return +[UIInterpolatedColorMatrix zeroCompatibleWithVector:](UIInterpolatedColorMatrix, "zeroCompatibleWithVector:", 0);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_13()
{
  return +[UIInterpolatedMeshTransform zeroCompatibleWithVector:](UIInterpolatedMeshTransform, "zeroCompatibleWithVector:", 0);
}

id __56__UIInterpolatedValue_interpolatedWrapperForZeroForKey___block_invoke_14()
{
  return +[UIInterpolatedCornerRadii zeroCompatibleWithVector:](UIInterpolatedCornerRadii, "zeroCompatibleWithVector:", 0);
}

@end
