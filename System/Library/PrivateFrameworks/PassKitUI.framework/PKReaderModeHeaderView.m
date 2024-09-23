@implementation PKReaderModeHeaderView

- (PKReaderModeHeaderView)initWithState:(unint64_t)a3 context:(int64_t)a4 product:(id)a5
{
  id v9;
  PKReaderModeHeaderView *v10;
  PKReaderModeHeaderView *v11;
  uint64_t v12;
  NSArray *resourceKeys;
  void *v14;
  uint64_t v15;
  NSDictionary *readerModeResources;
  objc_super v18;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PKReaderModeHeaderView;
  v10 = -[PKTableHeaderView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  if (v10)
  {
    v10->_state = a3;
    objc_storeStrong((id *)&v10->_product, a5);
    v19[0] = CFSTR("transferValue");
    v19[1] = CFSTR("notFound");
    v19[2] = CFSTR("transferValue");
    v19[3] = CFSTR("transferring");
    v19[4] = CFSTR("cardAdded");
    v19[5] = CFSTR("commuteCardAdded");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 6);
    v12 = objc_claimAutoreleasedReturnValue();
    resourceKeys = v11->_resourceKeys;
    v11->_resourceKeys = (NSArray *)v12;

    v11->_context = a4;
    objc_msgSend(v9, "provisioningMethodMetadataForType:", *MEMORY[0x1E0D6AE40]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "readerModeResources");
    v15 = objc_claimAutoreleasedReturnValue();
    readerModeResources = v11->_readerModeResources;
    v11->_readerModeResources = (NSDictionary *)v15;

    -[PKReaderModeHeaderView _configureForCurrentState](v11, "_configureForCurrentState");
  }

  return v11;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  -[PKReaderModeHeaderView _configureForCurrentState](self, "_configureForCurrentState");
}

- (id)_titleForState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSArray objectAtIndexedSubscript:](self->_resourceKeys, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_readerModeResources, "objectForKeyedSubscript:", CFSTR("readerModeScreens"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localizedTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (a3 > 5)
    {
      v8 = 0;
    }
    else
    {
      PKLocalizedPaymentString(&off_1E3E63260[a3]->isa);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (id)_subtitleForState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  -[NSArray objectAtIndexedSubscript:](self->_resourceKeys, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_readerModeResources, "objectForKeyedSubscript:", CFSTR("readerModeScreens"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localizedDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    switch(a3)
    {
      case 0uLL:
      case 2uLL:
        -[PKPaymentSetupProduct displayName](self->_product, "displayName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("READER_MODE_PROVISIONING_TRANSFER_VALUE_SUBTITLE_FORMAT"), CFSTR("%@"), v9);
        goto LABEL_10;
      case 1uLL:
        v10 = CFSTR("READER_MODE_PROVISIONING_CARD_NOT_FOUND_SUBTITLE");
        goto LABEL_7;
      case 3uLL:
        v10 = CFSTR("READER_MODE_PROVISIONING_TRANSFERRING_SUBTITLE");
LABEL_7:
        PKLocalizedPaymentString(&v10->isa);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 4uLL:
        -[PKPaymentSetupProduct displayName](self->_product, "displayName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("READER_MODE_PROVISIONING_CARD_ADDED_DEFAULT_SUBTITLE_FORMAT"), CFSTR("%@"), v9);
        goto LABEL_10;
      case 5uLL:
        -[PKPaymentSetupProduct displayName](self->_product, "displayName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("READER_MODE_PROVISIONING_CARD_ADDED_COMMUTE_SUBTITLE_FORMAT"), CFSTR("%@"), v9);
LABEL_10:
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v8 = 0;
        break;
    }
  }

  return v8;
}

- (void)_configureForCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  -[PKReaderModeHeaderView _titleForState:](self, "_titleForState:", self->_state);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKReaderModeHeaderView _subtitleForState:](self, "_subtitleForState:", self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableHeaderView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v3);

  v6 = (self->_state & 0xFFFFFFFFFFFFFFFELL) == 4;
  -[PKTableHeaderView checkmarkLayer](self, "checkmarkLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRevealed:animated:", v6, 0);

  -[PKTableHeaderView subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v10, "setLineSpacing:", 1.0);
    objc_msgSend(v10, "setParagraphSpacing:", -7.0);
    objc_msgSend(v10, "setAlignment:", 1);
    v16[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(v9, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v16[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(v9, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    v16[2] = *MEMORY[0x1E0DC1100];
    objc_msgSend(v9, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = *MEMORY[0x1E0DC1178];
    v17[2] = v13;
    v17[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v14);
    objc_msgSend(v9, "setAttributedText:", v15);

  }
  else
  {
    objc_msgSend(v8, "setText:", 0);
  }
  -[PKTableHeaderView setActionTitle:](self, "setActionTitle:", 0);
  -[PKReaderModeHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKReaderModeHeaderView;
  -[PKTableHeaderView layoutSubviews](&v4, sel_layoutSubviews);
  -[PKTableHeaderView subtitleLabel](self, "subtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "setFrame:");

}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerModeResources, 0);
  objc_storeStrong((id *)&self->_resourceKeys, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
