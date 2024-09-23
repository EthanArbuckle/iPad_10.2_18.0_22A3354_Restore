@implementation PXComposeRecipientView

- (PXComposeRecipientView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXComposeRecipientView;
  return -[PXComposeRecipientView init](&v3, sel_init);
}

- (void)addRecipient:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientView.m"), 26, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXComposeRecipientView addRecipient:]", v8);

  abort();
}

- (void)removeRecipient:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientView.m"), 30, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXComposeRecipientView removeRecipient:]", v8);

  abort();
}

- (void)addRecipients:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientView.m"), 34, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXComposeRecipientView addRecipients:]", v8);

  abort();
}

- (void)removeRecipients:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientView.m"), 38, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXComposeRecipientView removeRecipients:]", v8);

  abort();
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $8A887CF0C8726C9BBCF2DA0B71AE3032 *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->textDidChange = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didFinishEnteringAddress = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->requestAddRecipient = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didFinishPickingRecipient = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->disambiguateRecipient = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didAddRecipient = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didRemoveRecipient = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didChangeSize = objc_opt_respondsToSelector() & 1;
  }

}

- (PXComposeRecipientViewDelegate)delegate
{
  return (PXComposeRecipientViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIFont)baseFont
{
  return self->_baseFont;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (UIButton)addButton
{
  return self->_addButton;
}

- (NSSet)usedAddresses
{
  return self->_usedAddresses;
}

- (void)setUsedAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (int64_t)maxRecipients
{
  return self->_maxRecipients;
}

- (void)setMaxRecipients:(int64_t)a3
{
  self->_maxRecipients = a3;
}

- (BOOL)isSeparatorHidden
{
  return self->_separatorHidden;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  self->_separatorHidden = a3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_usedAddresses, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
