@implementation UITextChoiceAccelerationBubble

uint64_t __56___UITextChoiceAccelerationBubble_updateViewForOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v3);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "replacement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "revertText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v3);

    if ((v10 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v8, "alternativeRevertTexts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "containsObject:", v3);

    }
  }

  return v7;
}

uint64_t __50___UITextChoiceAccelerationBubble_removeAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __50___UITextChoiceAccelerationBubble_removeAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "reset");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 466) = 0;
  return result;
}

@end
