@implementation UIDatePickerCalendarTimeLabel

void __68___UIDatePickerCalendarTimeLabel_initWithTimeFormat_minuteInterval___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachineUpdateFromState:toState:", a2, a3);

}

void __59___UIDatePickerCalendarTimeLabel_attributedTextWithRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4 != 0;
  if (a2 && a4)
  {
    v8 = a2 - 1;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequenceAtIndex:", a3 - 1 + v4);
      v4 -= v9;
      v7 = v4 != 0;
      v10 = v8-- != 0;
    }
    while (v10 && v4);
  }
  if (v7)
  {
    v11 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)off_1E1678D98;
    +[UIColor clearColor](UIColor, "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributes:range:", v13, a3, v4);

  }
}

void __59___UIDatePickerCalendarTimeLabel_attributedTextWithRanges___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)a1[4];
  v14 = *(_QWORD *)off_1E1678D98;
  v28 = *(_QWORD *)off_1E1678D98;
  v29[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttributes:range:", v15, a1[5], a1[6]);

  if (v10)
  {
    v16 = (void *)a1[4];
    v26 = v14;
    v27 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAttributes:range:", v17, a1[7], a1[8]);

  }
  if (v11)
  {
    v18 = (void *)a1[4];
    v24 = v14;
    v25 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAttributes:range:", v19, a1[9], a1[10]);

  }
  if (v12 && a1[12])
  {
    v20 = (void *)a1[4];
    v22 = v14;
    v23 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAttributes:range:", v21, a1[11], a1[12]);

  }
}

@end
