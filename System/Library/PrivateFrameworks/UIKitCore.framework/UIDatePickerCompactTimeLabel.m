@implementation UIDatePickerCompactTimeLabel

void __67___UIDatePickerCompactTimeLabel_initWithTimeFormat_minuteInterval___block_invoke(uint64_t a1, void *a2)
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

uint64_t __58___UIDatePickerCompactTimeLabel__updateTimeFormatIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTimeFormat:", *(_QWORD *)(a1 + 40));
}

void __58___UIDatePickerCompactTimeLabel__updateTimeFormatIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 552) &= ~2u;
  objc_msgSend(*(id *)(a1 + 32), "pushCurrentStateIntoUI");
  objc_msgSend(*(id *)(a1 + 32), "pointerInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

void __71___UIDatePickerCompactTimeLabel__updateInputFieldLayoutForCurrentState__block_invoke(uint64_t a1)
{
  double x;
  double y;
  double width;
  double height;
  id v6;
  CGRect v7;

  v7 = CGRectInset(*(CGRect *)(a1 + 40), -1.0, -1.0);
  x = v7.origin.x;
  y = v7.origin.y;
  width = v7.size.width;
  height = v7.size.height;
  objc_msgSend(*(id *)(a1 + 32), "inputBackgroundView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", x, y, width, height);

}

double __61___UIDatePickerCompactTimeLabel__updateLayoutRectsForRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;

  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    return *MEMORY[0x1E0C9D648];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "boundingRectForCharacterRange:", a2, a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = *(void **)(a1 + 32);
  objc_msgSend(v13, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:fromView:", v14, v6, v8, v10, v12);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "displayScale");
  v3 = UIRectIntegralWithScale(v16, v18, v20, v22, v24);

  return v3;
}

void __61___UIDatePickerCompactTimeLabel__updateLayoutRectsForRanges___block_invoke_2(uint64_t a1)
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v2 = *(double **)(a1 + 32);
  v3 = v2[70];
  v4 = v2[71];
  v5 = v2[72];
  v6 = v2[73];
  objc_msgSend(v2, "hourLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);

  v8 = *(double **)(a1 + 32);
  v9 = v8[74];
  v10 = v8[75];
  v11 = v8[76];
  v12 = v8[77];
  objc_msgSend(v8, "minuteLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v9, v10, v11, v12);

  v14 = *(double **)(a1 + 32);
  v15 = v14[78];
  v16 = v14[79];
  v17 = v14[80];
  v18 = v14[81];
  objc_msgSend(v14, "timeOfDayLabel");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v15, v16, v17, v18);

}

void __75___UIDatePickerCompactTimeLabel__activateCompactLabelForGestureRecognizer___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isFirstResponder"))
    objc_msgSend(*(id *)(a1 + 32), "resignFirstResponder");
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelected:", 0);

}

uint64_t __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endEditingWheels");
}

void __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_reloadWithDate:notify:", v4, 1);
  objc_msgSend(*(id *)(a1 + 32), "wheelChanged");

}

void __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke_3(uint64_t a1, char a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "endEditingWheels");
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compactTimeLabelDidEndEditing:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", 0);

}

@end
