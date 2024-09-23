@implementation UIInterfaceActionSeparatableSequenceView

uint64_t __113___UIInterfaceActionSeparatableSequenceView__withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "_withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:", *(_QWORD *)(a1 + 40));
}

void __72___UIInterfaceActionSeparatableSequenceView__reloadStackViewArrangement__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  v3 = a2;
  objc_msgSend(v2, "removeArrangedSubview:", v3);
  objc_msgSend(v3, "removeFromSuperview");

}

void __72___UIInterfaceActionSeparatableSequenceView__reloadStackViewArrangement__block_invoke_14(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "addArrangedSubview:");
  if (*(_QWORD *)(a1 + 64) - 1 <= a3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v14, "sectionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "isEqualToString:", v5) ^ 1;
    objc_msgSend(*(id *)(a1 + 32), "_addSeparatorToStackAndMutableArray:preferSectionStyle:", *(_QWORD *)(a1 + 48), v8);
    if ((v8 & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "lastObject");
      v9 = objc_claimAutoreleasedReturnValue();
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    objc_msgSend(v10, "addObject:");
  if (v9)
    objc_msgSend(v11, "addObject:", v9);
  objc_msgSend(v14, "setViewsToDisappearWhenHighlighted:", v11);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v9;

}

uint64_t __78___UIInterfaceActionSeparatableSequenceView__updateSeparatorConstantSizedAxis__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setConstantSizedAxis:", *(_QWORD *)(a1 + 32));
}

uint64_t __90___UIInterfaceActionSeparatableSequenceView__updateRoundedCornerPositionForActionRepViews__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_markRoundedCornerPositionOnAllCornersOfView:", a2);
}

uint64_t __90___UIInterfaceActionSeparatableSequenceView__updateRoundedCornerPositionForActionRepViews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_markRoundedCornerPositionOnNoCornersOfView:", a2);
}

@end
