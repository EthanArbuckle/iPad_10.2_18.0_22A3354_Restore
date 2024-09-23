@implementation WFTimeTriggerDayOfWeekCell

- (WFTimeTriggerDayOfWeekCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFTimeTriggerDayOfWeekCell *v4;
  WFTimeTriggerDayOfWeekCell *v5;
  UIStackView *v6;
  UIStackView *stackView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  WFTimeTriggerDayOfWeekCell *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  WFTimeTriggerDayOfWeekCell *v20;
  _QWORD v22[4];
  WFTimeTriggerDayOfWeekCell *v23;
  id v24;
  uint64_t v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)WFTimeTriggerDayOfWeekCell;
  v4 = -[WFTimeTriggerDayOfWeekCell initWithStyle:reuseIdentifier:](&v26, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[WFTimeTriggerDayOfWeekCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    stackView = v5->_stackView;
    v5->_stackView = v6;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v5->_stackView, "setSpacing:", 14.0);
    -[UIStackView setDistribution:](v5->_stackView, "setDistribution:", 1);
    -[WFTimeTriggerDayOfWeekCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v5->_stackView);

    v9 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "veryShortWeekdaySymbols");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "firstWeekday");

    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __60__WFTimeTriggerDayOfWeekCell_initWithStyle_reuseIdentifier___block_invoke;
    v22[3] = &unk_24E604198;
    v14 = v5;
    v24 = v9;
    v25 = v13;
    v23 = v14;
    v15 = v9;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v22);
    -[WFTimeTriggerDayOfWeekCell setButtons:](v14, "setButtons:", v15);
    -[WFTimeTriggerDayOfWeekCell setupConstraints](v14, "setupConstraints");
    -[WFTimeTriggerDayOfWeekCell updateSelectedDays](v14, "updateSelectedDays");
    -[WFTimeTriggerDayOfWeekCell stackView](v14, "stackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimeTriggerDayOfWeekCell contentView](v14, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMarginsGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v16, "wf_addConstraintsToFillLayoutGuide:", v18);

    v20 = v14;
  }

  return v5;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFTimeTriggerDayOfWeekCell;
  -[WFTimeTriggerDayOfWeekCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[WFTimeTriggerDayOfWeekCell updateSelectedDays](self, "updateSelectedDays");
}

- (void)setSelectedRecurrences:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRecurrences, a3);
  -[WFTimeTriggerDayOfWeekCell updateSelectedDays](self, "updateSelectedDays");
}

- (void)updateSelectedDays
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[WFTimeTriggerDayOfWeekCell selectedRecurrences](self, "selectedRecurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_11579);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WFTimeTriggerDayOfWeekCell buttons](self, "buttons", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "tag"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSelected:", objc_msgSend(v4, "containsObject:", v11));

        if ((objc_msgSend(v10, "isSelected") & 1) != 0)
          -[WFTimeTriggerDayOfWeekCell tintColor](self, "tintColor");
        else
          objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBackgroundColor:", v12);

        objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTitleColor:forState:", v13, 0);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)toggleWeekdayButton:(id)a3
{
  id v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  SEL v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "tag") <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTimeTriggerDayOfWeekCell.m"), 107, CFSTR("Button tag was not setup: %@"), v5);
  }
  else
  {
    v6 = objc_msgSend(v5, "tag");
    v7 = objc_msgSend(v5, "isSelected");
    v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v8, "setWeekday:", v6);
    -[WFTimeTriggerDayOfWeekCell selectedRecurrences](self, "selectedRecurrences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if ((v7 & 1) != 0)
    {
      v21 = a2;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
LABEL_5:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
          if (objc_msgSend(v16, "weekday") == v6)
            break;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            if (v13)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v18 = v16;

        if (!v18)
          goto LABEL_12;
      }
      else
      {
LABEL_11:

LABEL_12:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v21, self, CFSTR("WFTimeTriggerDayOfWeekCell.m"), 129, CFSTR("Asked to deselect date components (%@), which isn't in the set of currently-selected date components (%@)"), v8, v11);

        v18 = 0;
      }
      objc_msgSend(v11, "removeObject:", v18);

    }
    else
    {
      objc_msgSend(v10, "addObject:", v8);
    }
    -[WFTimeTriggerDayOfWeekCell setSelectedRecurrences:](self, "setSelectedRecurrences:", v10);
    -[WFTimeTriggerDayOfWeekCell delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimeTriggerDayOfWeekCell selectedRecurrences](self, "selectedRecurrences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dayOfWeekPickerCell:didChangeSelectedRecurrences:", self, v20);

  }
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  WFTimeTriggerDayOfWeekCell *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = self;
  -[WFTimeTriggerDayOfWeekCell buttons](self, "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "widthAnchor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "constraintEqualToConstant:", 48.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v12) = 1144733696;
        objc_msgSend(v11, "setPriority:", v12);
        objc_msgSend(v3, "addObject:", v11);
        objc_msgSend(v9, "heightAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "widthAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "constraintEqualToAnchor:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v15);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  -[WFTimeTriggerDayOfWeekCell stackView](v20, "stackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTimeTriggerDayOfWeekCell contentView](v20, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutMarginsGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v16, "wf_addConstraintsToFillLayoutGuide:", v18);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3);
}

- (WFTimeTriggerDayOfWeekCellDelegate)delegate
{
  return (WFTimeTriggerDayOfWeekCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)selectedRecurrences
{
  return self->_selectedRecurrences;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_selectedRecurrences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

id __48__WFTimeTriggerDayOfWeekCell_updateSelectedDays__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "weekday") < 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v2, "weekday"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

void __60__WFTimeTriggerDayOfWeekCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a2;
  +[WFDayOfWeekButton buttonWithType:](WFDayOfWeekButton, "buttonWithType:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v5, 0);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:design:", *MEMORY[0x24BEBB578], 17.0, *MEMORY[0x24BEBB600]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(v11, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextAlignment:", 1);

  objc_msgSend(v11, "setTag:", a3 + 1);
  objc_msgSend(v11, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_toggleWeekdayButton_, 64);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if ((unint64_t)objc_msgSend(v11, "tag") >= *(_QWORD *)(a1 + 48))
  {
    v10 = objc_msgSend(v11, "tag") - *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v11, v10);
    objc_msgSend(*(id *)(a1 + 32), "stackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertArrangedSubview:atIndex:", v11, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    objc_msgSend(*(id *)(a1 + 32), "stackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addArrangedSubview:", v11);
  }

}

@end
