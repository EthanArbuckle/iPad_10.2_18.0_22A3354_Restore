@implementation PXComposeRecipientTableViewModel

- (PXComposeRecipientTableViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewModel.m"), 22, CFSTR("%s is not available as initializer"), "-[PXComposeRecipientTableViewModel init]");

  abort();
}

- (PXComposeRecipientTableViewModel)initWithComposeRecipientDataSourceManager:(id)a3
{
  id v5;
  PXComposeRecipientTableViewModel *v6;
  PXComposeRecipientTableViewModel *v7;
  NSArray *recipients;
  NSArray *v9;
  NSArray *composeRecipients;
  NSString *headerTitle;
  NSString *footerTitle;
  void *v13;
  uint64_t v14;
  PXPeopleSuggestionsMediaProvider *peopleSuggestionsMediaProvider;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXComposeRecipientTableViewModel;
  v6 = -[PXComposeRecipientTableViewModel init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_composeRecipientDataSourceManager, a3);
    recipients = v7->_recipients;
    v9 = (NSArray *)MEMORY[0x1E0C9AA60];
    v7->_recipients = (NSArray *)MEMORY[0x1E0C9AA60];

    composeRecipients = v7->_composeRecipients;
    v7->_composeRecipients = v9;

    headerTitle = v7->_headerTitle;
    v7->_headerTitle = (NSString *)&stru_1E5149688;

    footerTitle = v7->_footerTitle;
    v7->_footerTitle = (NSString *)&stru_1E5149688;

    -[PXComposeRecipientDataSourceManager peopleSuggestionsDataSourceManager](v7->_composeRecipientDataSourceManager, "peopleSuggestionsDataSourceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mediaProvider");
    v14 = objc_claimAutoreleasedReturnValue();
    peopleSuggestionsMediaProvider = v7->_peopleSuggestionsMediaProvider;
    v7->_peopleSuggestionsMediaProvider = (PXPeopleSuggestionsMediaProvider *)v14;

  }
  return v7;
}

- (void)setRecipients:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *recipients;
  void *v10;
  NSArray *v11;

  v11 = (NSArray *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewModel.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recipients"));

  }
  v5 = self->_recipients;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSArray isEqual:](v5, "isEqual:", v11);

    if ((v7 & 1) == 0)
    {
      v8 = (NSArray *)-[NSArray copy](v11, "copy");
      recipients = self->_recipients;
      self->_recipients = v8;

      -[PXComposeRecipientTableViewModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setComposeRecipients:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *composeRecipients;
  void *v10;
  NSArray *v11;

  v11 = (NSArray *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewModel.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composeRecipients"));

  }
  v5 = self->_composeRecipients;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSArray isEqual:](v5, "isEqual:", v11);

    if ((v7 & 1) == 0)
    {
      v8 = (NSArray *)-[NSArray copy](v11, "copy");
      composeRecipients = self->_composeRecipients;
      self->_composeRecipients = v8;

      -[PXComposeRecipientTableViewModel signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setCanAddRecipients:(BOOL)a3
{
  if (self->_canAddRecipients != a3)
  {
    self->_canAddRecipients = a3;
    -[PXComposeRecipientTableViewModel signalChange:](self, "signalChange:", 4);
  }
}

- (void)setCanDeleteRecipients:(BOOL)a3
{
  if (self->_canDeleteRecipients != a3)
  {
    self->_canDeleteRecipients = a3;
    -[PXComposeRecipientTableViewModel signalChange:](self, "signalChange:", 8);
  }
}

- (void)setCanSelectRecipients:(BOOL)a3
{
  if (self->_canSelectRecipients != a3)
  {
    self->_canSelectRecipients = a3;
    -[PXComposeRecipientTableViewModel signalChange:](self, "signalChange:", 16);
  }
}

- (void)setHeaderTitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *headerTitle;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewModel.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("headerTitle"));

  }
  v5 = self->_headerTitle;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v11);

    if (!v7)
    {
      v8 = (NSString *)-[NSString copy](v11, "copy");
      headerTitle = self->_headerTitle;
      self->_headerTitle = v8;

      -[PXComposeRecipientTableViewModel signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setFooterTitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *footerTitle;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewModel.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("footerTitle"));

  }
  v5 = self->_footerTitle;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v11);

    if (!v7)
    {
      v8 = (NSString *)-[NSString copy](v11, "copy");
      footerTitle = self->_footerTitle;
      self->_footerTitle = v8;

      -[PXComposeRecipientTableViewModel signalChange:](self, "signalChange:", 64);
    }
  }

}

- (void)setUseGroupedBackgroundColor:(BOOL)a3
{
  if (self->_useGroupedBackgroundColor != a3)
  {
    self->_useGroupedBackgroundColor = a3;
    -[PXComposeRecipientTableViewModel signalChange:](self, "signalChange:", 128);
  }
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXComposeRecipientTableViewModel;
  -[PXComposeRecipientTableViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (PXComposeRecipientDataSourceManager)composeRecipientDataSourceManager
{
  return self->_composeRecipientDataSourceManager;
}

- (PXPeopleSuggestionsMediaProvider)peopleSuggestionsMediaProvider
{
  return self->_peopleSuggestionsMediaProvider;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSArray)composeRecipients
{
  return self->_composeRecipients;
}

- (BOOL)canAddRecipients
{
  return self->_canAddRecipients;
}

- (BOOL)canDeleteRecipients
{
  return self->_canDeleteRecipients;
}

- (BOOL)canSelectRecipients
{
  return self->_canSelectRecipients;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (BOOL)useGroupedBackgroundColor
{
  return self->_useGroupedBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_composeRecipients, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionsMediaProvider, 0);
  objc_storeStrong((id *)&self->_composeRecipientDataSourceManager, 0);
}

@end
