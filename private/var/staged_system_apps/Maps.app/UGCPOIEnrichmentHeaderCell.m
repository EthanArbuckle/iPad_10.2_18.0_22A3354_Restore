@implementation UGCPOIEnrichmentHeaderCell

- (UGCPOIEnrichmentHeaderCell)initWithFrame:(CGRect)a3
{
  UGCPOIEnrichmentHeaderCell *v3;
  UGCPOIEnrichmentHeaderCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  UILabel *v8;
  UILabel *headerLabel;
  void *v10;
  id v11;
  UILabel *v12;
  void *v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UGCPOIEnrichmentHeaderCell;
  v3 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[UGCPOIEnrichmentHeaderCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    headerLabel = v4->_headerLabel;
    v4->_headerLabel = v8;

    -[UILabel setAccessibilityIdentifier:](v4->_headerLabel, "setAccessibilityIdentifier:", CFSTR("HeaderLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UGCFontManager poiEnrichmentSectionHeaderTitleFont](UGCFontManager, "poiEnrichmentSectionHeaderTitleFont"));
    -[UILabel setFont:](v4->_headerLabel, "setFont:", v10);

    -[UILabel setNumberOfLines:](v4->_headerLabel, "setNumberOfLines:", 0);
    -[UGCPOIEnrichmentHeaderCell addSubview:](v4, "addSubview:", v4->_headerLabel);
    v11 = objc_alloc((Class)MUEdgeLayout);
    v12 = v4->_headerLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentHeaderCell layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v14 = objc_msgSend(v11, "initWithItem:container:", v12, v13);
    objc_msgSend(v14, "activate");

  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UGCPOIEnrichmentHeaderCell;
  v4 = a3;
  -[UGCPOIEnrichmentHeaderCell traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentHeaderCell traitCollection](self, "traitCollection", v10.receiver, v10.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UGCFontManager poiEnrichmentSectionHeaderTitleFont](UGCFontManager, "poiEnrichmentSectionHeaderTitleFont"));
    -[UILabel setFont:](self->_headerLabel, "setFont:", v9);

  }
}

- (void)setHeaderText:(id)a3
{
  -[UILabel setText:](self->_headerLabel, "setText:", a3);
}

- (NSString)headerText
{
  return -[UILabel text](self->_headerLabel, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end
