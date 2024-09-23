@implementation SKUISearchController

- (void)_setSuffix:(id)a3
{
  id v4;
  UILabel *v5;
  UILabel *suffixLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  id v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  NSMutableString *v41;
  NSMutableString *paddingString;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  NSMutableString *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  NSMutableString *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_suffixLabel)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    suffixLabel = self->_suffixLabel;
    self->_suffixLabel = v5;

    -[UILabel setAutoresizingMask:](self->_suffixLabel, "setAutoresizingMask:", 1);
    v7 = self->_suffixLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    v9 = self->_suffixLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v10);

    v11 = self->_suffixLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UILabel setHidden:](self->_suffixLabel, "setHidden:", -[SKUISearchController isActive](self, "isActive"));
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "userInterfaceIdiom") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "keyWindow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      if (v16 > SKUICompactThreshold())
      {
        -[SKUISearchController delegate](self, "delegate");
        v17 = v4;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "searchControllerClientContext:", self);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "shouldForceTransientSearchControllerBahavior");

        v4 = v17;
        if ((v20 & 1) == 0)
        {
          -[SKUISearchController searchBar](self, "searchBar");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "searchField");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addSubview:", self->_suffixLabel);
LABEL_9:

          goto LABEL_10;
        }
LABEL_8:
        -[SKUISearchController searchBar](self, "searchBar");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "searchField");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_clearButton");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addSubview:", self->_suffixLabel);

        goto LABEL_9;
      }

    }
    goto LABEL_8;
  }
LABEL_10:
  -[UILabel setText:](self->_suffixLabel, "setText:", v4);
  -[UILabel sizeToFit](self->_suffixLabel, "sizeToFit");
  -[UILabel frame](self->_suffixLabel, "frame");
  v25 = v24;
  v27 = v26;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "userInterfaceIdiom") != 1)
  {
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "keyWindow");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  if (v31 <= SKUICompactThreshold())
  {

    goto LABEL_15;
  }
  -[SKUISearchController delegate](self, "delegate");
  v32 = v4;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "searchControllerClientContext:", self);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "shouldForceTransientSearchControllerBahavior");

  v4 = v32;
  if ((v35 & 1) == 0)
  {
    -[UILabel superview](self->_suffixLabel, "superview");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frame");
    v38 = v37 - v25 + -30.0;

    v39 = 8.0;
    goto LABEL_17;
  }
LABEL_16:
  v38 = -5.0 - v25;
  v39 = 3.0;
LABEL_17:
  -[UILabel setFrame:](self->_suffixLabel, "setFrame:", v38, v39, v25, v27);
  -[SKUISearchController searchBar](self, "searchBar");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "searchField");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  paddingString = self->_paddingString;
  self->_paddingString = v41;

  v43 = v4;
  if (objc_msgSend(v4, "length"))
  {
    v44 = 0;
    v45 = *MEMORY[0x1E0DC1138];
    do
    {
      -[NSMutableString appendString:](self->_paddingString, "appendString:", CFSTR("_"), v59);
      v46 = self->_paddingString;
      v61 = v45;
      objc_msgSend(v59, "font");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString sizeWithAttributes:](v46, "sizeWithAttributes:", v48);
      v50 = v49;

      if (v50 > v25)
        break;
      ++v44;
    }
    while (v44 < objc_msgSend(v43, "length"));
  }
  -[SKUISearchController searchBar](self, "searchBar", v59);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "searchField");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "text");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "isNaturallyRTL");

  if ((v54 & 1) == 0)
  {
    -[SKUISearchController searchBar](self, "searchBar");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "searchField");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[SKUISearchController isActive](self, "isActive") & 1) != 0)
      v57 = 0;
    else
      v57 = self->_paddingString;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "_setSuffix:withColor:", v57, v58);

  }
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableString *paddingString;
  void *v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  SKUISearchController *v14;
  objc_super v15;

  v3 = a3;
  -[SKUISearchController searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)SKUISearchController;
  -[SKUISearchController setActive:](&v15, sel_setActive_, v3);
  objc_msgSend(v5, "searchField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v5, "setShowsSearchResultsButton:", 0);
  -[UILabel setHidden:](self->_suffixLabel, "setHidden:", v3);
  objc_msgSend(v5, "searchField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[SKUISearchController isActive](self, "isActive") & 1) != 0)
    paddingString = 0;
  else
    paddingString = self->_paddingString;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setSuffix:withColor:", paddingString, v10);

  if (!v3)
  {
    v11 = dispatch_time(0, 300000000);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __34__SKUISearchController_setActive___block_invoke;
    v12[3] = &unk_1E739FD10;
    v13 = v5;
    v14 = self;
    dispatch_after(v11, MEMORY[0x1E0C80D38], v12);

  }
}

void __34__SKUISearchController_setActive___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "searchField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "isActive") & 1) != 0)
    v2 = 0;
  else
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1320);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSuffix:withColor:", v2, v3);

}

- (SKUISearchBar)searchBar
{
  SKUISearchBar *searchBar;
  SKUISearchBar *v4;
  SKUISearchBar *v5;

  searchBar = self->_searchBar;
  if (!searchBar)
  {
    v4 = objc_alloc_init(SKUISearchBar);
    v5 = self->_searchBar;
    self->_searchBar = v4;

    searchBar = self->_searchBar;
  }
  return searchBar;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SKUISearchController;
  v7 = a4;
  -[SKUISearchController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SKUISearchController delegate](self, "delegate", v9.receiver, v9.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchControllerWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_paddingString, 0);
  objc_storeStrong((id *)&self->_suffixLabel, 0);
}

@end
