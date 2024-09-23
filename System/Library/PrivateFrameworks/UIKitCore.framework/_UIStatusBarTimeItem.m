@implementation _UIStatusBarTimeItem

+ (_UIStatusBarIdentifier)timeDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("timeDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)shortTimeDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("shortTimeDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)pillTimeDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("pillTimeDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)dateDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("dateDisplayIdentifier"));
}

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("timeEntry"), CFSTR("shortTimeEntry"), CFSTR("dateEntry"), 0);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v38;

  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)_UIStatusBarTimeItem;
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v38, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "dataChanged"))
    goto LABEL_36;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "timeDisplayIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v10)
  {
    objc_msgSend(v6, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeEntry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if ((objc_msgSend(v7, "isEnabled") & 1) != 0)
      {
        objc_msgSend(v6, "data");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeEntry");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setEnabled:", objc_msgSend(v21, "isEnabled"));

      }
      else
      {
        objc_msgSend(v7, "setEnabled:", 0);
      }
      if (!objc_msgSend(v7, "isEnabled"))
        goto LABEL_36;
      objc_msgSend(v6, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeEntry");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarTimeItem timeView](self, "timeView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:
      v36 = v35;
      objc_msgSend(v35, "setText:", v34);

      goto LABEL_35;
    }
  }
  else
  {

  }
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "shortTimeDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 != v12)
  {

    goto LABEL_6;
  }
  objc_msgSend(v6, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "shortTimeEntry");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    if ((objc_msgSend(v7, "isEnabled") & 1) != 0)
    {
      objc_msgSend(v6, "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortTimeEntry");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnabled:", objc_msgSend(v25, "isEnabled"));

    }
    else
    {
      objc_msgSend(v7, "setEnabled:", 0);
    }
    if (!objc_msgSend(v7, "isEnabled"))
      goto LABEL_36;
    objc_msgSend(v6, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortTimeEntry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarTimeItem shortTimeView](self, "shortTimeView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
LABEL_6:
  objc_msgSend(v7, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "pillTimeDisplayIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 != v14)
  {

    goto LABEL_8;
  }
  objc_msgSend(v6, "data");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "shortTimeEntry");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    if ((objc_msgSend(v7, "isEnabled") & 1) != 0)
    {
      objc_msgSend(v6, "data");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "shortTimeEntry");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnabled:", objc_msgSend(v29, "isEnabled"));

    }
    else
    {
      objc_msgSend(v7, "setEnabled:", 0);
    }
    if (!objc_msgSend(v7, "isEnabled"))
      goto LABEL_36;
    objc_msgSend(v6, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortTimeEntry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarTimeItem pillTimeView](self, "pillTimeView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
LABEL_8:
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dateDisplayIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v15 != (void *)v16)
  {
    v17 = (void *)v16;
LABEL_35:

    goto LABEL_36;
  }
  objc_msgSend(v6, "data");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dateEntry");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    if ((objc_msgSend(v7, "isEnabled") & 1) != 0)
    {
      objc_msgSend(v6, "data");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "dateEntry");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnabled:", objc_msgSend(v33, "isEnabled"));

    }
    else
    {
      objc_msgSend(v7, "setEnabled:", 0);
    }
    if (objc_msgSend(v7, "isEnabled"))
    {
      objc_msgSend(v6, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dateEntry");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarTimeItem dateView](self, "dateView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
  }
LABEL_36:

  return v8;
}

- (_UIStatusBarStringView)timeView
{
  _UIStatusBarStringView *timeView;

  timeView = self->_timeView;
  if (!timeView)
  {
    -[_UIStatusBarTimeItem _create_timeView](self, "_create_timeView");
    timeView = self->_timeView;
  }
  return timeView;
}

- (void)_create_timeView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *timeView;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  timeView = self->_timeView;
  self->_timeView = v4;

  -[_UIStatusBarStringView setFontStyle:](self->_timeView, "setFontStyle:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_timeView, "setAdjustsFontSizeToFitWidth:", 1);
}

- (_UIStatusBarStringView)shortTimeView
{
  _UIStatusBarStringView *shortTimeView;

  shortTimeView = self->_shortTimeView;
  if (!shortTimeView)
  {
    -[_UIStatusBarTimeItem _create_shortTimeView](self, "_create_shortTimeView");
    shortTimeView = self->_shortTimeView;
  }
  return shortTimeView;
}

- (void)_create_shortTimeView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *shortTimeView;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  shortTimeView = self->_shortTimeView;
  self->_shortTimeView = v4;

  -[_UIStatusBarStringView setFontStyle:](self->_shortTimeView, "setFontStyle:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_shortTimeView, "setAdjustsFontSizeToFitWidth:", 1);
}

- (_UIStatusBarStringView)pillTimeView
{
  _UIStatusBarStringView *pillTimeView;

  pillTimeView = self->_pillTimeView;
  if (!pillTimeView)
  {
    -[_UIStatusBarTimeItem _create_pillTimeView](self, "_create_pillTimeView");
    pillTimeView = self->_pillTimeView;
  }
  return pillTimeView;
}

- (void)_create_pillTimeView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *pillTimeView;
  double v6;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  pillTimeView = self->_pillTimeView;
  self->_pillTimeView = v4;

  -[_UIStatusBarStringView setFontStyle:](self->_pillTimeView, "setFontStyle:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_pillTimeView, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setBaselineAdjustment:](self->_pillTimeView, "setBaselineAdjustment:", 1);
  LODWORD(v6) = 1132003328;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_pillTimeView, "setContentCompressionResistancePriority:forAxis:", 0, v6);
}

- (_UIStatusBarStringView)dateView
{
  _UIStatusBarStringView *dateView;

  dateView = self->_dateView;
  if (!dateView)
  {
    -[_UIStatusBarTimeItem _create_dateView](self, "_create_dateView");
    dateView = self->_dateView;
  }
  return dateView;
}

- (void)_create_dateView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *dateView;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dateView = self->_dateView;
  self->_dateView = v4;

}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "timeDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIStatusBarTimeItem timeView](self, "timeView");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "shortTimeDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[_UIStatusBarTimeItem shortTimeView](self, "shortTimeView");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "pillTimeDisplayIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        -[_UIStatusBarTimeItem pillTimeView](self, "pillTimeView");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "dateDisplayIdentifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8 == v4)
        {
          -[_UIStatusBarTimeItem dateView](self, "dateView");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12.receiver = self;
          v12.super_class = (Class)_UIStatusBarTimeItem;
          -[_UIStatusBarItem viewForIdentifier:](&v12, sel_viewForIdentifier_, v4);
          v9 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  v10 = (void *)v9;

  return v10;
}

- (void)setTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_timeView, a3);
}

- (void)setShortTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_shortTimeView, a3);
}

- (void)setPillTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_pillTimeView, a3);
}

- (void)setDateView:(id)a3
{
  objc_storeStrong((id *)&self->_dateView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_pillTimeView, 0);
  objc_storeStrong((id *)&self->_shortTimeView, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
}

@end
