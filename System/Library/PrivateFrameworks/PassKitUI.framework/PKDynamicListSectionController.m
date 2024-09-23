@implementation PKDynamicListSectionController

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  return objc_alloc_init(MEMORY[0x1E0DC3390]);
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (objc_class *)MEMORY[0x1E0DC35A8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithAppearance:", 2);
  -[PKDynamicListSectionController headerText](self, "headerText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    -[PKDynamicListSectionController attributedHeaderText](self, "attributedHeaderText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_5;
  }
  objc_msgSend(v7, "setHeaderMode:", 1);
LABEL_5:
  -[PKDynamicListSectionController footerText](self, "footerText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_8:
    objc_msgSend(v7, "setFooterMode:", 1);
    goto LABEL_9;
  }
  -[PKDynamicListSectionController attributedFooterText](self, "attributedFooterText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_8;
LABEL_9:
  -[PKDynamicListSectionController leadingSwipeActionsConfigurationProvider](self, "leadingSwipeActionsConfigurationProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeadingSwipeActionsConfigurationProvider:", v12);

  -[PKDynamicListSectionController trailingSwipeActionsConfigurationProvider](self, "trailingSwipeActionsConfigurationProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTrailingSwipeActionsConfigurationProvider:", v13);

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v7, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSString *headerText;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if ((id)*MEMORY[0x1E0DC48A8] == v8)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "groupedHeaderConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_attributedHeaderText)
    {
LABEL_7:
      objc_msgSend(v10, "setAttributedText:");
      goto LABEL_10;
    }
    headerText = self->_headerText;
LABEL_9:
    objc_msgSend(v10, "setText:", headerText);
    goto LABEL_10;
  }
  if ((id)*MEMORY[0x1E0DC48A0] == v8)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "groupedFooterConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_attributedFooterText)
      goto LABEL_7;
    headerText = self->_footerText;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:
  objc_msgSend(v12, "setContentConfiguration:", v10);

}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSAttributedString)attributedHeaderText
{
  return self->_attributedHeaderText;
}

- (void)setAttributedHeaderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSAttributedString)attributedFooterText
{
  return self->_attributedFooterText;
}

- (void)setAttributedFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)leadingSwipeActionsConfigurationProvider
{
  return self->_leadingSwipeActionsConfigurationProvider;
}

- (void)setLeadingSwipeActionsConfigurationProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)trailingSwipeActionsConfigurationProvider
{
  return self->_trailingSwipeActionsConfigurationProvider;
}

- (void)setTrailingSwipeActionsConfigurationProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trailingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong(&self->_leadingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_attributedFooterText, 0);
  objc_storeStrong((id *)&self->_attributedHeaderText, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
