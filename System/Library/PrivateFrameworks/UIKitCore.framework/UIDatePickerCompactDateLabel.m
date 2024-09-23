@implementation UIDatePickerCompactDateLabel

void __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activateLabel");

}

void __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a2;
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v3, "userInterfaceIdiom"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "compactLabelBackgroundColorForEnabledState:", objc_msgSend(v2, "isEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "background");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(v2, "setConfiguration:", v4);
}

void __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHighlightedForTouch:", 1);

}

void __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHighlightedForTouch:", 0);

}

void __46___UIDatePickerCompactDateLabel_activateLabel__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "compactLabelTextColorForEditingState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  if ((a2 & 1) == 0 && !*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "compactDateLabelDidEndEditing:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelected:", 0);

}

@end
