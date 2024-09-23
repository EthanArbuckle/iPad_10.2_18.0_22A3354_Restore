@implementation OBStackedIconTextList

- (OBStackedIconTextList)initWithFrame:(CGRect)a3
{
  OBStackedIconTextList *v3;
  uint64_t v4;
  NSMutableArray *entries;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OBStackedIconTextList;
  v3 = -[OBStackedIconTextList initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    entries = v3->_entries;
    v3->_entries = (NSMutableArray *)v4;

    v3->_itemSpacing = 32.0;
    -[OBStackedIconTextList setAxis:](v3, "setAxis:", 1);
    v3->_iconTextPadding = 12.0;
    -[OBStackedIconTextList setBaselineRelativeArrangement:](v3, "setBaselineRelativeArrangement:", 1);
    -[OBStackedIconTextList updateSpacing](v3, "updateSpacing");
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBStackedIconTextList;
  -[OBStackedIconTextList traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[OBStackedIconTextList updateSpacing](self, "updateSpacing");
}

- (void)updateSpacing
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:", 30.0);
  -[OBStackedIconTextList setSpacing:](self, "setSpacing:");

}

- (id)viewForFirstBaselineLayout
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[OBStackedIconTextList subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "textView");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBStackedIconTextList;
    -[OBStackedIconTextList viewForFirstBaselineLayout](&v8, sel_viewForFirstBaselineLayout);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)viewForLastBaselineLayout
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[OBStackedIconTextList subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "textView");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBStackedIconTextList;
    -[OBStackedIconTextList viewForLastBaselineLayout](&v8, sel_viewForLastBaselineLayout);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)setIconTextPadding:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_iconTextPadding != a3)
  {
    self->_iconTextPadding = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[OBStackedIconTextList subviews](self, "subviews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setPadding:", a3);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)addEntryWithIcon:(id)a3 iconSize:(CGSize)a4 text:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  OBIconTextView *v11;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  v11 = -[OBIconTextView initWithIcon:iconSize:text:dataDetectorTypes:]([OBIconTextView alloc], "initWithIcon:iconSize:text:dataDetectorTypes:", v10, v9, -[OBStackedIconTextList dataDetectorTypes](self, "dataDetectorTypes"), width, height);

  -[OBIconTextView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBIconTextView setPadding:](v11, "setPadding:", self->_iconTextPadding);
  -[OBStackedIconTextList addArrangedSubview:](self, "addArrangedSubview:", v11);
  -[NSMutableArray addObject:](self->_entries, "addObject:", v11);

}

- (void)addEntryWithIcon:(id)a3 iconSize:(CGSize)a4 attributedText:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  OBIconTextView *v12;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  v12 = -[OBIconTextView initWithIcon:iconSize:text:dataDetectorTypes:]([OBIconTextView alloc], "initWithIcon:iconSize:text:dataDetectorTypes:", v10, 0, -[OBStackedIconTextList dataDetectorTypes](self, "dataDetectorTypes"), width, height);

  -[OBIconTextView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBIconTextView textView](v12, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v9);

  -[OBIconTextView setPadding:](v12, "setPadding:", self->_iconTextPadding);
  -[OBStackedIconTextList addArrangedSubview:](self, "addArrangedSubview:", v12);
  -[NSMutableArray addObject:](self->_entries, "addObject:", v12);

}

- (double)iconTextPadding
{
  return self->_iconTextPadding;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
