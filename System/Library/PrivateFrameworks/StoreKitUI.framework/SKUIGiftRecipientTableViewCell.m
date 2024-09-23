@implementation SKUIGiftRecipientTableViewCell

- (SKUIGiftRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUIGiftRecipientTableViewCell *v7;
  uint64_t v8;
  CNComposeRecipientTextView *v9;
  CNComposeRecipientTextView *recipientView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CNComposeRecipientTextView *v17;
  void *v18;
  CNComposeRecipientTextView *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  double v31;
  void *v32;
  UIView *v33;
  UIView *topBorderView;
  UIView *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftRecipientTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v44.receiver = self;
  v44.super_class = (Class)SKUIGiftRecipientTableViewCell;
  v7 = -[SKUIGiftRecipientTableViewCell initWithStyle:reuseIdentifier:](&v44, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = SKUIContactsAutocompleteUIFramework();
    v9 = (CNComposeRecipientTextView *)objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("CNComposeRecipientTextView"), v8));
    recipientView = v7->_recipientView;
    v7->_recipientView = v9;

    -[CNComposeRecipientTextView labelView](v7->_recipientView, "labelView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    -[CNComposeRecipientTextView labelView](v7->_recipientView, "labelView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v14);

    -[CNComposeRecipientTextView labelView](v7->_recipientView, "labelView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v16);

    v17 = v7->_recipientView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTextView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[CNComposeRecipientTextView setDelegate:](v7->_recipientView, "setDelegate:", v7);
    v19 = v7->_recipientView;
    -[CNComposeRecipientTextView labelView](v19, "labelView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "font");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTextView setBaseFont:](v19, "setBaseFont:", v21);

    v22 = *MEMORY[0x1E0DC4920];
    -[CNComposeRecipientTextView setMaximumContentSizeCategory:](v7->_recipientView, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC4920]);
    -[CNComposeRecipientTextView setMinimumContentSizeCategory:](v7->_recipientView, "setMinimumContentSizeCategory:", v22);
    -[CNComposeRecipientTextView textView](v7->_recipientView, "textView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textContainer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setLineFragmentPadding:", 0.0);

    -[CNComposeRecipientTextView subviews](v7->_recipientView, "subviews");
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v41 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v30, "frame", (_QWORD)v40);
          if (v31 <= 1.0)
          {
            objc_msgSend(v30, "setHidden:", 1);
            goto LABEL_16;
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v27)
          continue;
        break;
      }
    }
LABEL_16:

    -[CNComposeRecipientTextView sizeToFit](v7->_recipientView, "sizeToFit");
    -[SKUIGiftRecipientTableViewCell contentView](v7, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", v7->_recipientView);

    v33 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topBorderView = v7->_topBorderView;
    v7->_topBorderView = v33;

    v35 = v7->_topBorderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v35, "setBackgroundColor:", v36);

    -[SKUIGiftRecipientTableViewCell contentView](v7, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v7->_topBorderView);

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_leftToRight = objc_msgSend(v38, "userInterfaceLayoutDirection") == 0;

    -[SKUIGiftRecipientTableViewCell setDidLayoutSubviews:](v7, "setDidLayoutSubviews:", 0);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CNContactPickerViewController setDelegate:](self->_contactPickerController, "setDelegate:", 0);
  -[CNComposeRecipientTextView setDelegate:](self->_recipientView, "setDelegate:", 0);
  -[SKUIGiftContactSearchController setDelegate:](self->_searchController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIGiftRecipientTableViewCell;
  -[SKUIGiftRecipientTableViewCell dealloc](&v3, sel_dealloc);
}

- (NSAttributedString)attributedPlaceholder
{
  return -[UILabel attributedText](self->_placeholderLabel, "attributedText");
}

- (NSString)label
{
  void *v2;
  void *v3;

  -[CNComposeRecipientTextView labelView](self->_recipientView, "labelView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)presentPeoplePickerPopover:(id)a3 animated:(BOOL)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v5 = a3;
  -[SKUIGiftRecipientTableViewCell frame](self, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SKUIGiftRecipientTableViewCell superview](self, "superview");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v14, 1, 1, v7, v9, v11, v13);

}

- (void)presentSearchResultsPopover:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CNComposeRecipientTextView *recipientView;
  id v6;
  id v7;

  v4 = a4;
  recipientView = self->_recipientView;
  v6 = a3;
  -[CNComposeRecipientTextView textView](recipientView, "textView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v7, 1, v4);

}

- (NSArray)recipientAddresses
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView recipients](self->_recipientView, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "address");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setAttributedPlaceholder:(id)a3
{
  id v4;
  UILabel *placeholderLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  uint64_t v12;
  UILabel *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SKUIGiftRecipientTableViewCell attributedPlaceholder](self, "attributedPlaceholder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqual:", v4) & 1) == 0)
  {
    placeholderLabel = self->_placeholderLabel;
    if (v15)
    {
      if (!placeholderLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_placeholderLabel;
        self->_placeholderLabel = v6;

        v8 = self->_placeholderLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_placeholderLabel;
        -[CNComposeRecipientTextView textView](self->_recipientView, "textView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isFirstResponder") & 1) != 0)
          v12 = 1;
        else
          v12 = -[CNComposeRecipientTextView hasContent](self->_recipientView, "hasContent");
        -[UILabel setHidden:](v10, "setHidden:", v12);

        -[SKUIGiftRecipientTableViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertSubview:belowSubview:", self->_placeholderLabel, self->_recipientView);

        placeholderLabel = self->_placeholderLabel;
      }
      -[UILabel setAttributedText:](placeholderLabel, "setAttributedText:");
      -[UILabel sizeToFit](self->_placeholderLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](placeholderLabel, "removeFromSuperview");
      v13 = self->_placeholderLabel;
      self->_placeholderLabel = 0;

    }
    -[SKUIGiftRecipientTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setLabel:(id)a3
{
  -[CNComposeRecipientTextView setLabel:](self->_recipientView, "setLabel:", a3);
}

- (void)setRecipientAddresses:(id)a3
{
  -[CNComposeRecipientTextView setAddresses:](self->_recipientView, "setAddresses:", a3);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  UIView *topBorderView;
  void *v36;
  double v37;
  objc_super v38;
  CGRect v39;

  v38.receiver = self;
  v38.super_class = (Class)SKUIGiftRecipientTableViewCell;
  -[SKUIGiftRecipientTableViewCell layoutSubviews](&v38, sel_layoutSubviews);
  -[SKUIGiftRecipientTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CNComposeRecipientTextView setFrame:](self->_recipientView, "setFrame:", v5, v7, v9, v11);
  if (-[SKUIGiftRecipientTableViewCell didLayoutSubviews](self, "didLayoutSubviews"))
    -[CNComposeRecipientTextView reflow](self->_recipientView, "reflow");
  -[CNComposeRecipientTextView layoutIfNeeded](self->_recipientView, "layoutIfNeeded");
  if (self->_placeholderLabel)
  {
    -[CNComposeRecipientTextView labelView](self->_recipientView, "labelView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftRecipientTableViewCell convertRect:fromView:](self, "convertRect:fromView:", v21, v14, v16, v18, v20);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    -[UILabel frame](self->_placeholderLabel, "frame");
    v31 = v30;
    if (-[SKUIGiftRecipientTableViewCell leftToRight](self, "leftToRight"))
    {
      v39.origin.x = v23;
      v39.origin.y = v25;
      v39.size.width = v27;
      v39.size.height = v29;
      v32 = CGRectGetMaxX(v39) + 4.0;
      v33 = v9 + -15.0 - v32;
    }
    else
    {
      v33 = v9 + -15.0 + -4.0 + v23 - v9;
      v32 = 15.0;
    }
    v34 = (v29 - v31) * 0.5;
    -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v32, v25 + floorf(v34), v33, v31);

  }
  topBorderView = self->_topBorderView;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "scale");
  -[UIView setFrame:](topBorderView, "setFrame:", 0.0, 0.0, v9, 1.0 / v37);

  -[SKUIGiftRecipientTableViewCell setDidLayoutSubviews:](self, "setDidLayoutSubviews:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[CNComposeRecipientTextView frame](self->_recipientView, "frame", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = SKUIContactsAutocompleteUIFramework();
  v7 = objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("CNComposeRecipient"), v6));
  objc_msgSend(v5, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v7, "initWithContact:address:kind:", v8, v9, 0);
  -[CNComposeRecipientTextView addRecipient:](self->_recipientView, "addRecipient:", v10);
  -[SKUIGiftRecipientTableViewCell _sendDismissContactPicker](self, "_sendDismissContactPicker");

}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  height = a4.height;
  v11 = a3;
  objc_msgSend(v11, "frame");
  v6 = v11;
  if (height != v7)
  {
    objc_msgSend(v11, "setFrame:");
    -[SKUIGiftRecipientTableViewCell superview](self, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v8, "superview");
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      while (v9);
    }
    objc_msgSend(v8, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "tableView:giftRecipientCellDidChangeSize:", v8, self);

    v6 = v11;
  }

}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a4;
  v5 = SKUIContactsAutocompleteUIFramework();
  v6 = (void *)objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("CNComposeRecipient"), v5)), "initWithContact:address:kind:", 0, v4, 0);

  return v6;
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", objc_msgSend(a3, "hasContent"));
  -[SKUIGiftRecipientTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v7, "clearText");
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v7, "addAddress:", v6);
  -[SKUIGiftRecipientTableViewCell _resetSearchController](self, "_resetSearchController");
  -[SKUIGiftRecipientTableViewCell _sendDidChangeRecipients](self, "_sendDidChangeRecipients");

}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v6;
  SKUIGiftContactSearchController *v7;
  SKUIGiftContactSearchController *searchController;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!self->_searchController)
  {
    v7 = objc_alloc_init(SKUIGiftContactSearchController);
    searchController = self->_searchController;
    self->_searchController = v7;

    -[SKUIGiftContactSearchController setDelegate:](self->_searchController, "setDelegate:", self);
  }
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", objc_msgSend(v9, "hasContent"));
  -[SKUIGiftContactSearchController searchForText:](self->_searchController, "searchForText:", v6);

}

- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3
{
  void *v3;
  id v4;

  -[SKUIGiftRecipientTableViewCell _contactStore](self, "_contactStore", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "requestAccessForEntityType:completionHandler:", 0, &__block_literal_global_53);
    v3 = v4;
  }

}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  -[SKUIGiftRecipientTableViewCell _sendDismissContactPicker](self, "_sendDismissContactPicker", a3);
  -[SKUIGiftRecipientTableViewCell _sendDidChangeRecipients](self, "_sendDidChangeRecipients");
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  CNContactPickerViewController *contactPickerController;
  uint64_t v8;
  CNContactPickerViewController *v9;
  CNContactPickerViewController *v10;
  void *v11;
  id *v12;
  CNContactPickerViewController *v13;
  void *v14;
  id v15;
  void *v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  -[SKUIGiftRecipientTableViewCell superview](self, "superview", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v4, "superview");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    while (v5);
  }
  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    contactPickerController = self->_contactPickerController;
    if (!contactPickerController)
    {
      v8 = SKUIContactsUIFramework();
      v9 = (CNContactPickerViewController *)objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("CNContactPickerViewController"), v8));
      v10 = self->_contactPickerController;
      self->_contactPickerController = v9;

      -[CNContactPickerViewController setDelegate:](self->_contactPickerController, "setDelegate:", self);
      v11 = (void *)SKUIContactsFramework();
      v12 = (id *)SKUIWeakLinkedSymbolForString("CNContactEmailAddressesKey", v11);
      v13 = self->_contactPickerController;
      v17[0] = *v12;
      v14 = (void *)MEMORY[0x1E0C99D20];
      v15 = v17[0];
      objc_msgSend(v14, "arrayWithObjects:count:", v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactPickerViewController setDisplayedPropertyKeys:](v13, "setDisplayedPropertyKeys:", v16);

      contactPickerController = self->_contactPickerController;
    }
    objc_msgSend(v6, "tableView:giftRecipientCell:presentContactPicker:", v4, self, contactPickerController, v17[0]);
  }

}

- (void)recipientViewDidResignFirstResponder:(id)a3
{
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", -[CNComposeRecipientTextView hasContent](self->_recipientView, "hasContent", a3));
  -[SKUIGiftRecipientTableViewCell _resetSearchController](self, "_resetSearchController");
}

- (void)searchController:(id)a3 didSelectRecipient:(id)a4
{
  -[CNComposeRecipientTextView addRecipient:](self->_recipientView, "addRecipient:", a4);
  -[CNComposeRecipientTextView clearText](self->_recipientView, "clearText");
  -[SKUIGiftRecipientTableViewCell _resetSearchController](self, "_resetSearchController");
  -[SKUIGiftRecipientTableViewCell _sendDidChangeRecipients](self, "_sendDidChangeRecipients");
}

- (id)_contactStore
{
  CNContactStore *contactStore;
  uint64_t v4;
  CNContactStore *v5;
  CNContactStore *v6;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = SKUIContactsFramework();
    v5 = (CNContactStore *)objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("CNContactStore"), v4));
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)_resetSearchController
{
  SKUIGiftContactSearchController *searchController;

  searchController = self->_searchController;
  if (searchController)
  {
    -[SKUIGiftContactSearchController resetSearch](searchController, "resetSearch");
    -[SKUIGiftRecipientTableViewCell _sendDidUpdateSearchController](self, "_sendDidUpdateSearchController");
  }
}

- (void)_sendDidChangeRecipients
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  -[SKUIGiftRecipientTableViewCell superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v6, "superview");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:
  v7 = v3;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "tableView:giftRecipientCellDidChangeRecipients:", v7, self);

}

- (void)_sendDidUpdateSearchController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  -[SKUIGiftRecipientTableViewCell superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v6, "superview");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:
  v7 = v3;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "tableView:giftRecipientCell:didUpdateSearchController:", v7, self, self->_searchController);

}

- (void)_sendDismissContactPicker
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  -[SKUIGiftRecipientTableViewCell superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v6, "superview");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:
  v7 = v3;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "tableView:giftRecipientCell:dismissContactPicker:", v7, self, self->_contactPickerController);

}

- (BOOL)didLayoutSubviews
{
  return self->_didLayoutSubviews;
}

- (void)setDidLayoutSubviews:(BOOL)a3
{
  self->_didLayoutSubviews = a3;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_recipientView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_contactPickerController, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftRecipientTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
