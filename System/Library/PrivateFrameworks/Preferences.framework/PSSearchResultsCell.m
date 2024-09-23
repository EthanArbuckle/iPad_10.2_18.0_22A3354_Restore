@implementation PSSearchResultsCell

- (PSSearchResultsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSSearchResultsCell *v4;
  PSSearchResultsCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PSSearchResultsCell;
  v4 = -[PSSearchResultsCell initWithStyle:reuseIdentifier:](&v24, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PSSearchResultsCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSearchResultsCell textLabel](v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[PSSearchResultsCell detailTextLabel](v5, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSearchResultsCell detailTextLabel](v5, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v10);

    +[PSListController appearance](PSListController, "appearance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PSSearchResultsCell _accessibilityHigherContrastTintColorForColor:](v5, "_accessibilityHigherContrastTintColorForColor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSearchResultsCell textLabel](v5, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTextColor:", v14);

    }
    +[PSListController appearance](PSListController, "appearance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "altTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[PSSearchResultsCell _accessibilityHigherContrastTintColorForColor:](v5, "_accessibilityHigherContrastTintColorForColor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSearchResultsCell detailTextLabel](v5, "detailTextLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTextColor:", v18);

    }
    +[PSListController appearance](PSListController, "appearance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cellHighlightColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      objc_msgSend(v22, "setBackgroundColor:", v21);
      -[PSSearchResultsCell setSelectedBackgroundView:](v5, "setSelectedBackgroundView:", v22);

    }
  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v2;

  self->_shouldIndentContent = 0;
  self->_shouldIndentSeparator = 0;
  v2.receiver = self;
  v2.super_class = (Class)PSSearchResultsCell;
  -[PSSearchResultsCell prepareForReuse](&v2, sel_prepareForReuse);
}

- (BOOL)shouldIndentContent
{
  return self->_shouldIndentContent;
}

- (void)setShouldIndentContent:(BOOL)a3
{
  self->_shouldIndentContent = a3;
}

- (BOOL)shouldIndentSeparator
{
  return self->_shouldIndentSeparator;
}

- (void)setShouldIndentSeparator:(BOOL)a3
{
  self->_shouldIndentSeparator = a3;
}

@end
