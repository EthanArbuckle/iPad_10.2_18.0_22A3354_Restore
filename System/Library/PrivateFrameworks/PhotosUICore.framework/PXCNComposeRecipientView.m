@implementation PXCNComposeRecipientView

- (PXCNComposeRecipientView)init
{
  PXCNComposeRecipientView *v2;
  CNComposeRecipientTextView *v3;
  CNComposeRecipientTextView *recipientTextView;
  double v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  NSMutableArray *internalRecipients;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXCNComposeRecipientView;
  v2 = -[PXComposeRecipientView init](&v11, sel_init);
  if (v2)
  {
    v3 = (CNComposeRecipientTextView *)objc_alloc_init(MEMORY[0x1E0D136B0]);
    recipientTextView = v2->_recipientTextView;
    v2->_recipientTextView = v3;

    -[CNComposeRecipientTextView setDelegate:](v2->_recipientTextView, "setDelegate:", v2);
    -[PXCNComposeRecipientView addSubview:](v2, "addSubview:", v2->_recipientTextView);
    -[CNComposeRecipientTextView intrinsicContentSize](v2->_recipientTextView, "intrinsicContentSize");
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0D136B0], "preferredHeight");
    v2->_preferredSize.width = v6;
    v2->_preferredSize.height = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    internalRecipients = v2->_internalRecipients;
    v2->_internalRecipients = (NSMutableArray *)v8;

  }
  return v2;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCNComposeRecipientView;
  -[PXCNComposeRecipientView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXCNComposeRecipientView bounds](self, "bounds");
  -[CNComposeRecipientTextView setFrame:](self->_recipientTextView, "setFrame:");
}

- (void)setText:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[CNComposeRecipientTextView textView](self->_recipientTextView, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  v7 = v12;
  if (v6 == v12)
    goto LABEL_5;
  v8 = objc_msgSend(v12, "isEqualToString:", v6);

  if ((v8 & 1) == 0)
  {
    -[CNComposeRecipientTextView textView](self->_recipientTextView, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v12);

    if (self->super._delegateRespondsTo.textDidChange)
    {
      -[PXComposeRecipientView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNComposeRecipientTextView textView](self->_recipientTextView, "textView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "composeRecipientView:textDidChange:", self, v11);

LABEL_5:
    }
  }

}

- (id)text
{
  void *v2;
  void *v3;

  -[CNComposeRecipientTextView textView](self->_recipientTextView, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLabel:(id)a3
{
  -[CNComposeRecipientTextView setLabel:](self->_recipientTextView, "setLabel:", a3);
}

- (id)label
{
  return (id)-[CNComposeRecipientTextView label](self->_recipientTextView, "label");
}

- (void)setMaxRecipients:(int64_t)a3
{
  -[CNComposeRecipientTextView setMaxRecipients:](self->_recipientTextView, "setMaxRecipients:", a3);
}

- (int64_t)maxRecipients
{
  return -[CNComposeRecipientTextView maxRecipients](self->_recipientTextView, "maxRecipients");
}

- (void)setSeparatorHidden:(BOOL)a3
{
  -[CNComposeRecipientTextView setSeparatorHidden:](self->_recipientTextView, "setSeparatorHidden:", a3);
}

- (id)recipients
{
  return self->_internalRecipients;
}

- (void)addRecipient:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCNComposeRecipientView.m"), 101, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("recipient"), v16, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCNComposeRecipientView.m"), 101, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("recipient"), v16);
  }

LABEL_3:
  objc_msgSend(v5, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView recipients](self->_recipientTextView, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PXComposeRecipientsContainsComposeRecipient(v7, v6);

  if (v8)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      v10 = "Ignored attempt to add a recipient again: %@";
LABEL_9:
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
    }
  }
  else
  {
    -[PXComposeRecipientView usedAddresses](self, "usedAddresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsObject:", v12);

    if (!v13)
    {
      -[CNComposeRecipientTextView addRecipient:](self->_recipientTextView, "addRecipient:", v6);
      -[CNComposeRecipientTextView clearText](self->_recipientTextView, "clearText");
      -[CNComposeRecipientTextView reflow](self->_recipientTextView, "reflow");
      goto LABEL_12;
    }
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      v10 = "Ignored attempt to add a used recipient: %@";
      goto LABEL_9;
    }
  }

LABEL_12:
}

- (void)removeRecipient:(id)a3
{
  CNComposeRecipientTextView *recipientTextView;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCNComposeRecipientView.m"), 117, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("recipient"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCNComposeRecipientView.m"), 117, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("recipient"), v9, v11);

    goto LABEL_6;
  }
LABEL_3:
  recipientTextView = self->_recipientTextView;
  objc_msgSend(v12, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView removeRecipient:](recipientTextView, "removeRecipient:", v6);

  -[CNComposeRecipientTextView clearText](self->_recipientTextView, "clearText");
  -[CNComposeRecipientTextView reflow](self->_recipientTextView, "reflow");

}

- (void)addRecipients:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_msgSend(a3, "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        PXCNComposeRecipientWithRecipient(*(void **)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          -[PXCNComposeRecipientView addRecipient:](self, "addRecipient:", v9, (_QWORD)v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)removeRecipients:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)objc_msgSend(a3, "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[PXCNComposeRecipientView removeRecipient:](self, "removeRecipient:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double height;
  double v6;
  CGSize result;

  width = a3.width;
  -[PXCNComposeRecipientView layoutIfNeeded](self, "layoutIfNeeded", a3.width, a3.height);
  height = self->_preferredSize.height;
  v6 = width;
  result.height = height;
  result.width = v6;
  return result;
}

- (id)addButton
{
  return (id)-[CNComposeRecipientTextView addButton](self->_recipientTextView, "addButton");
}

- (BOOL)becomeFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCNComposeRecipientView;
  -[PXCNComposeRecipientView becomeFirstResponder](&v4, sel_becomeFirstResponder);
  return -[CNComposeRecipientTextView becomeFirstResponder](self->_recipientTextView, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXCNComposeRecipientView;
  -[PXCNComposeRecipientView resignFirstResponder](&v6, sel_resignFirstResponder);
  -[PXCNComposeRecipientView firstResponder](self, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "resignFirstResponder");

  return v4;
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v5;
  id v6;

  if (self->super._delegateRespondsTo.textDidChange)
  {
    v5 = a4;
    -[PXComposeRecipientView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composeRecipientView:textDidChange:", self, v5);

  }
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length")
    && +[PXRecipientTransportUtilities px_recipientKindFromString:](PXRecipientTransportUtilities, "px_recipientKindFromString:", v6))
  {
    objc_msgSend(v9, "clearText");
    -[PXCNComposeRecipientView composeRecipientView:composeRecipientForAddress:](self, "composeRecipientView:composeRecipientForAddress:", v9, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addRecipient:", v7);
    if (self->super._delegateRespondsTo.didFinishEnteringAddress)
    {
      -[PXComposeRecipientView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "composeRecipientView:didFinishEnteringAddress:", self, v6);

    }
  }

}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  double width;
  id v7;

  height = a4.height;
  width = a4.width;
  self->_preferredSize = a4;
  -[PXCNComposeRecipientView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", a3);
  if (self->super._delegateRespondsTo.didChangeSize)
  {
    -[PXComposeRecipientView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "composeRecipientView:didChangeSize:", self, width, height);

  }
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4;

  if (self->super._delegateRespondsTo.requestAddRecipient)
  {
    -[PXComposeRecipientView delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composeRecipientViewRequestAddRecipient:", self);

  }
}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  id v4;

  if (self->super._delegateRespondsTo.didFinishPickingRecipient)
  {
    -[PXComposeRecipientView delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composeRecipientViewDidFinishPickingRecipient:", self);

  }
}

- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4
{
  PXCNComposeRecipient *v5;
  void *v6;
  id v7;

  if (self->super._delegateRespondsTo.disambiguateRecipient)
  {
    objc_msgSend(a4, "recipient", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[PXCNComposeRecipient initWithRecipient:]([PXCNComposeRecipient alloc], "initWithRecipient:", v7);
    -[PXComposeRecipientView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composeRecipientView:disambiguateRecipient:", self, v5);

  }
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v5;
  void *v6;
  PXCNComposeRecipient *v7;

  v5 = a4;
  v7 = -[PXCNComposeRecipient initWithRecipient:]([PXCNComposeRecipient alloc], "initWithRecipient:", v5);

  if (v7)
  {
    -[NSMutableArray addObject:](self->_internalRecipients, "addObject:", v7);
    if (self->super._delegateRespondsTo.didAddRecipient)
    {
      -[PXComposeRecipientView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "composeRecipientView:didAddRecipient:", self, v7);

    }
  }

}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v5;
  void *v6;
  PXCNComposeRecipient *v7;

  v5 = a4;
  v7 = -[PXCNComposeRecipient initWithRecipient:]([PXCNComposeRecipient alloc], "initWithRecipient:", v5);

  -[NSMutableArray removeObject:](self->_internalRecipients, "removeObject:", v7);
  if (self->super._delegateRespondsTo.didRemoveRecipient)
  {
    -[PXComposeRecipientView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composeRecipientView:didRemoveRecipient:", self, v7);

  }
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a4;
  v5 = +[PXRecipientTransportUtilities px_recipientKindFromString:](PXRecipientTransportUtilities, "px_recipientKindFromString:", v4);
  if (v5)
    v6 = v5 == 2;
  else
    v6 = 5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13688]), "initWithContact:address:kind:", 0, v4, v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalRecipients, 0);
  objc_storeStrong((id *)&self->_recipientTextView, 0);
}

@end
