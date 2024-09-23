@implementation MapsDebugReadOnlyValueRow

- (int64_t)cellStyle
{
  return 1;
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MapsDebugReadOnlyValueRow;
  -[MapsDebugTableRow configureCell:](&v12, "configureCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "detailTextLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textProperties"));
  objc_msgSend(v11, "setColor:", v10);

  objc_msgSend(v4, "setContentConfiguration:", v5);
}

@end
