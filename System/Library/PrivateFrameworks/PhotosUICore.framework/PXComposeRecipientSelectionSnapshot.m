@implementation PXComposeRecipientSelectionSnapshot

- (PXComposeRecipientSelectionSnapshot)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientSelectionManager.m"), 27, CFSTR("%s is not available as initializer"), "-[PXComposeRecipientSelectionSnapshot init]");

  abort();
}

- (PXComposeRecipientSelectionSnapshot)initWithSelectedComposeRecipients:(id)a3 selectedRecipients:(id)a4
{
  id v6;
  id v7;
  PXComposeRecipientSelectionSnapshot *v8;
  uint64_t v9;
  NSArray *selectedComposeRecipients;
  uint64_t v11;
  NSArray *selectedRecipients;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXComposeRecipientSelectionSnapshot;
  v8 = -[PXComposeRecipientSelectionSnapshot init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    selectedComposeRecipients = v8->_selectedComposeRecipients;
    v8->_selectedComposeRecipients = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    selectedRecipients = v8->_selectedRecipients;
    v8->_selectedRecipients = (NSArray *)v11;

  }
  return v8;
}

- (NSArray)selectedComposeRecipients
{
  return self->_selectedComposeRecipients;
}

- (NSArray)selectedRecipients
{
  return self->_selectedRecipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedRecipients, 0);
  objc_storeStrong((id *)&self->_selectedComposeRecipients, 0);
}

@end
