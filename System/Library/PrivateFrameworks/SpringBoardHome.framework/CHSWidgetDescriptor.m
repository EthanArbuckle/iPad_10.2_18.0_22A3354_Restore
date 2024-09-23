@implementation CHSWidgetDescriptor

id __60__CHSWidgetDescriptor_SpringBoardHome__mostInterestingColor__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "resolvedColorWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resolvedColorWithTraitCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sbh_colorfulness");
  v8 = v7;
  objc_msgSend(v5, "sbh_colorfulness");
  if (v8 <= v9)
    v10 = v5;
  else
    v10 = v6;
  v11 = v10;
  if (!v11)
  {
    if (v6)
    {
      v12 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v12;
  }

  return v11;
}

@end
