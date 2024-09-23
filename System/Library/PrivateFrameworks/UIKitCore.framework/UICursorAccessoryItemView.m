@implementation UICursorAccessoryItemView

void __46___UICursorAccessoryItemView__recomputeColors__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isSelected"))
    +[UIColor systemFillColor](UIColor, "systemFillColor");
  else
    +[UIColor clearColor](UIColor, "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setBackgroundColor:", v2);

  if (objc_msgSend(*(id *)(a1 + 32), "isSelected"))
    +[UIColor systemBlackColor](UIColor, "systemBlackColor");
  else
    +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setTintColor:", v3);

  if (objc_msgSend(*(id *)(a1 + 32), "isSelected"))
    +[UIColor systemBlackColor](UIColor, "systemBlackColor");
  else
    +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setTextColor:", v4);

}

uint64_t __45___UICursorAccessoryItemView_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.9, 0.9);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __45___UICursorAccessoryItemView_setHighlighted___block_invoke_3(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

@end
