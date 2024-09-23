@implementation TLKKeyValueGridView

- (TLKKeyValueGridView)init
{
  TLKKeyValueGridView *v2;
  TLKKeyValueGridView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TLKKeyValueGridView;
  v2 = -[NUIContainerGridView initWithArrangedSubviewRows:](&v7, sel_initWithArrangedSubviewRows_, 0);
  v3 = v2;
  if (v2)
  {
    -[NUIContainerGridView setRowSpacing:](v2, "setRowSpacing:", 4.0);
    v4 = (void *)objc_opt_new();
    -[TLKKeyValueGridView setKeyLabels:](v3, "setKeyLabels:", v4);

    v5 = (void *)objc_opt_new();
    -[TLKKeyValueGridView setValueLabels:](v3, "setValueLabels:", v5);

    -[NUIContainerGridView setColumnSpacing:](v3, "setColumnSpacing:", 16.0);
  }
  return v3;
}

- (void)updateWithTuples:(id)a3 valueColumnIsTrailing:(BOOL)a4 truncateKey:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  unint64_t i;
  void *v44;
  _BOOL4 v45;
  _QWORD v46[3];

  v45 = a5;
  v5 = a4;
  v46[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  if (v8 != -[NUIContainerGridView numberOfRows](self, "numberOfRows"))
  {
    v9 = -[NUIContainerGridView numberOfRows](self, "numberOfRows");
    if (v9 >= objc_msgSend(v7, "count"))
    {
      for (i = objc_msgSend(v7, "count"); i < -[NUIContainerGridView numberOfRows](self, "numberOfRows"); ++i)
      {
        -[NUIContainerGridView rowAtIndex:](self, "rowAtIndex:", i);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setHidden:", 1);

      }
    }
    else
    {
      v10 = -[NUIContainerGridView numberOfRows](self, "numberOfRows");
      if (v10 < objc_msgSend(v7, "count"))
      {
        v11 = *MEMORY[0x1E0DC4AB8];
        do
        {
          v12 = (void *)objc_opt_new();
          +[TLKFontUtilities footnoteFont](TLKFontUtilities, "footnoteFont");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setFont:", v13);

          v14 = (void *)objc_opt_new();
          +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", v11, 0, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setFont:", v15);

          LODWORD(v16) = 1148846080;
          objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 0, v16);
          LODWORD(v17) = 1148829696;
          objc_msgSend(v14, "setContentHuggingPriority:forAxis:", 0, v17);
          -[TLKKeyValueGridView keyLabels](self, "keyLabels");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v12);

          -[TLKKeyValueGridView valueLabels](self, "valueLabels");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v14);

          v46[0] = v12;
          v46[1] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[NUIContainerGridView addRowWithArrangedSubviews:](self, "addRowWithArrangedSubviews:", v20);

          v22 = -[NUIContainerGridView numberOfRows](self, "numberOfRows");
        }
        while (v22 < objc_msgSend(v7, "count"));
      }
    }
  }
  if (objc_msgSend(v7, "count"))
  {
    if (v5)
      v23 = 4;
    else
      v23 = 1;
    -[NUIContainerGridView columnAtIndex:](self, "columnAtIndex:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAlignment:", v23);

  }
  if (objc_msgSend(v7, "count"))
  {
    v25 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "key");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKKeyValueGridView keyLabels](self, "keyLabels");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setText:", v27);

      objc_msgSend(v26, "value");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKKeyValueGridView valueLabels](self, "valueLabels");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", v25);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v30);

      if (v5)
      {
        if (+[TLKLayoutUtilities isLTR](TLKLayoutUtilities, "isLTR"))
          v33 = 2;
        else
          v33 = 0;
      }
      else
      {
        v33 = 0;
      }
      -[TLKKeyValueGridView valueLabels](self, "valueLabels");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", v25);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setTextAlignment:", v33);

      -[TLKKeyValueGridView keyLabels](self, "keyLabels");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", v25);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v38 = 1000.0 - (float)v45;
      objc_msgSend(v37, "setContentCompressionResistancePriority:forAxis:", 0, v38);

      -[TLKKeyValueGridView valueLabels](self, "valueLabels");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", v25);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v41 = 1000.0 - (float)!v45;
      objc_msgSend(v40, "setContentCompressionResistancePriority:forAxis:", 0, v41);

      -[NUIContainerGridView rowAtIndex:](self, "rowAtIndex:", v25);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setHidden:", 0);

      ++v25;
    }
    while (v25 < objc_msgSend(v7, "count"));
  }

}

- (NSMutableArray)keyLabels
{
  return self->_keyLabels;
}

- (void)setKeyLabels:(id)a3
{
  objc_storeStrong((id *)&self->_keyLabels, a3);
}

- (NSMutableArray)valueLabels
{
  return self->_valueLabels;
}

- (void)setValueLabels:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabels, 0);
  objc_storeStrong((id *)&self->_keyLabels, 0);
}

@end
