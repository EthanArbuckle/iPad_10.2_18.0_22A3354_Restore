@implementation TTRIRecurrenceOrdinalPickerViewController

- (void)loadView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0DC3AE0]);
  v5 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[TTRIRecurrenceOrdinalPickerViewController setView:](self, "setView:", v5);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TTRIRecurrenceOrdinalPickerViewController;
  -[TTRIRecurrenceOrdinalPickerViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[TTRIRecurrenceOrdinalPickerViewController pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setHostsLayoutEngine:", 0);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  if (a4 == 1)
  {
    -[TTRIRecurrenceOrdinalPickerViewController _rightColumn](self, "_rightColumn");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[TTRIRecurrenceOrdinalPickerViewController _leftColumn](self, "_leftColumn");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "count");

LABEL_7:
  return v9;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  -[TTRIRecurrenceOrdinalPickerViewController columnWidths](self, "columnWidths", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= 1)
    -[TTRIRecurrenceOrdinalPickerViewController computeLabelFontAndColumnWidths](self, "computeLabelFontAndColumnWidths");
  -[TTRIRecurrenceOrdinalPickerViewController columnWidths](self, "columnWidths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  return v11;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = -[TTRIRecurrenceOrdinalPickerViewController newLabel](self, "newLabel");
  v11 = v10;
  -[TTRIRecurrenceOrdinalPickerViewController titleForRow:forComponent:](self, "titleForRow:forComponent:", a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  return v11;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6;

  -[TTRIRecurrenceOrdinalPickerViewController delegate](self, "delegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frequencyPickerUpdated:", self);

}

- (id)pickerView:(id)a3 accessibilityLabelForComponent:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v5 = a3;
  if (a4 == 1)
  {
    RemindersUICoreBundleGet();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Day of The Week");
  }
  else
  {
    if (a4)
    {
      v9 = 0;
      goto LABEL_7;
    }
    RemindersUICoreBundleGet();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Ordinal");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, v8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

- (id)newLabel
{
  void *v3;
  void *v4;
  void *v5;

  -[TTRIRecurrenceOrdinalPickerViewController labelFont](self, "labelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[TTRIRecurrenceOrdinalPickerViewController computeLabelFontAndColumnWidths](self, "computeLabelFontAndColumnWidths");
  v4 = (void *)objc_opt_new();
  -[TTRIRecurrenceOrdinalPickerViewController labelFont](self, "labelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(v4, "setTextAlignment:", 1);
  return v4;
}

- (id)titleForRow:(int64_t)a3 forComponent:(int64_t)a4
{
  void *v5;
  void *v6;

  if (a4)
    -[TTRIRecurrenceOrdinalPickerViewController _rightColumn](self, "_rightColumn");
  else
    -[TTRIRecurrenceOrdinalPickerViewController _leftColumn](self, "_leftColumn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)computeLabelFontAndColumnWidths
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t j;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[TTRIRecurrenceOrdinalPickerViewController pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 + -46.0;

  -[TTRIRecurrenceOrdinalPickerViewController roundedSystemFontOfSize:](self, "roundedSystemFontOfSize:", 23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIRecurrenceOrdinalPickerViewController computeColumnWidthsWithFont:](self, "computeColumnWidthsWithFont:", v6);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "doubleValue");
        v11 = v11 + v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  if (v11 > v5)
  {
    v14 = 23.0;
    do
    {
      v15 = v6;
      -[TTRIRecurrenceOrdinalPickerViewController roundedSystemFontOfSize:](self, "roundedSystemFontOfSize:", (uint64_t)v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[TTRIRecurrenceOrdinalPickerViewController computeColumnWidthsWithFont:](self, "computeColumnWidthsWithFont:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v7 = v16;
      v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        v20 = 0.0;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "doubleValue");
            v20 = v20 + v22;
          }
          v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v18);
      }
      else
      {
        v20 = 0.0;
      }

      if (v20 < v5)
        break;
      v14 = v14 + -1.0;
    }
    while (v14 > 12.0 && v20 > v5);
  }
  -[TTRIRecurrenceOrdinalPickerViewController setLabelFont:](self, "setLabelFont:", v6);
  -[TTRIRecurrenceOrdinalPickerViewController setColumnWidths:](self, "setColumnWidths:", v7);

}

- (id)roundedSystemFontOfSize:(int64_t)a3
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (double)a3;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", (double)a3, *MEMORY[0x1E0DC1440]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorWithDesign:", *MEMORY[0x1E0DC13A8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)computeColumnWidthsWithFont:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id obj;
  TTRIRecurrenceOrdinalPickerViewController *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v27 = v4;
  objc_msgSend(v5, "setFont:", v4);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v29 = self;
  -[TTRIRecurrenceOrdinalPickerViewController _leftColumn](self, "_leftColumn");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        -[TTRIRecurrenceOrdinalPickerViewController _rightColumn](v29, "_rightColumn");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v31 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_msgSend(v5, "setText:", v12);
              objc_msgSend(v5, "intrinsicContentSize");
              v20 = ceil(v19);
              objc_msgSend(v5, "setText:", v18);
              objc_msgSend(v5, "intrinsicContentSize");
              v22 = ceil(v21);
              if (v20 >= v10)
                v10 = v20;
              if (v22 >= v9)
                v9 = v22;
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          }
          while (v15);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
    v10 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDays:", -[TTRIRecurrenceOrdinalPickerViewController dayMask](self, "dayMask"));
  objc_msgSend(v4, "setOrdinalValue:", -[TTRIRecurrenceOrdinalPickerViewController ordinalValue](self, "ordinalValue"));

}

- (void)updateFromRecurrenceRule:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "setPositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "daysOfTheWeek");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      v8 = objc_msgSend(v7, "dayOfTheWeek") - 1;
    }
    else if ((objc_msgSend(v13, "isWeekendRule") & 1) != 0)
    {
      v8 = 9;
    }
    else if ((objc_msgSend(v13, "isWeekdayRule") & 1) != 0)
    {
      v8 = 8;
    }
    else if (objc_msgSend(v13, "isAnyDayRule"))
    {
      v8 = 7;
    }
    else
    {
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v9 = objc_msgSend(v7, "weekNumber");

    if (v5)
      goto LABEL_14;
  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5)
LABEL_14:
      v9 = objc_msgSend(v5, "integerValue");
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TTRIRecurrenceOrdinalPickerViewController pickerView](self, "pickerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectRow:inComponent:animated:", v8, 1, 0);

  }
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9 <= 5)
      v11 = v9 - 1;
    else
      v11 = 5;
    -[TTRIRecurrenceOrdinalPickerViewController pickerView](self, "pickerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectRow:inComponent:animated:", v11, 0, 0);

  }
}

- (int)dayMask
{
  void *v2;
  uint64_t v3;

  -[TTRIRecurrenceOrdinalPickerViewController pickerView](self, "pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedRowInComponent:", 1);

  if (v3 <= 6)
    return +[TTRIRecurrenceChooserController dayFromNumber:](TTRIRecurrenceChooserController, "dayFromNumber:", v3 + 1);
  if ((unint64_t)(v3 - 7) > 2)
    return 0;
  return dword_1B490F168[v3 - 7];
}

- (int)ordinalValue
{
  void *v2;
  int v3;

  -[TTRIRecurrenceOrdinalPickerViewController pickerView](self, "pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedRowInComponent:", 0);

  return v3 + 1;
}

- (id)_leftColumn
{
  if (_leftColumn_onceToken != -1)
    dispatch_once(&_leftColumn_onceToken, &__block_literal_global_4);
  return (id)_leftColumn___leftColumn;
}

void __56__TTRIRecurrenceOrdinalPickerViewController__leftColumn__block_invoke()
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
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  RemindersUICoreBundleGet();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("first"), CFSTR("first"), CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  RemindersUICoreBundleGet();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("second"), CFSTR("second"), CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v1;
  RemindersUICoreBundleGet();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("third"), CFSTR("third"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v3;
  RemindersUICoreBundleGet();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("fourth"), CFSTR("fourth"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v5;
  RemindersUICoreBundleGet();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("fifth"), CFSTR("fifth"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  RemindersUICoreBundleGet();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("last"), CFSTR("last"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_leftColumn___leftColumn;
  _leftColumn___leftColumn = v10;

}

- (id)_rightColumn
{
  if (_rightColumn_onceToken != -1)
    dispatch_once(&_rightColumn_onceToken, &__block_literal_global_30);
  return (id)_rightColumn___rightColumn;
}

void __57__TTRIRecurrenceOrdinalPickerViewController__rightColumn__block_invoke()
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
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[11];

  v15[10] = *MEMORY[0x1E0C80C00];
  CUIKStringForDayOfWeekNotStandalone();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v14;
  CUIKStringForDayOfWeekNotStandalone();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v13;
  CUIKStringForDayOfWeekNotStandalone();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v12;
  CUIKStringForDayOfWeekNotStandalone();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v0;
  CUIKStringForDayOfWeekNotStandalone();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v1;
  CUIKStringForDayOfWeekNotStandalone();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v2;
  CUIKStringForDayOfWeekNotStandalone();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v3;
  RemindersUICoreBundleGet();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("day"), CFSTR("day"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v5;
  RemindersUICoreBundleGet();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("weekday"), CFSTR("weekday"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v7;
  RemindersUICoreBundleGet();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("weekend day"), CFSTR("weekend day"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 10);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_rightColumn___rightColumn;
  _rightColumn___rightColumn = v10;

}

- (TTRIRecurrenceOrdinalPickerViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TTRIRecurrenceOrdinalPickerViewControllerDelegate *)a3;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_labelFont, a3);
}

- (NSArray)columnWidths
{
  return self->_columnWidths;
}

- (void)setColumnWidths:(id)a3
{
  objc_storeStrong((id *)&self->_columnWidths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnWidths, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
}

@end
