@implementation PKPaymentPreferenceCardOptionListItem

- (PKPaymentPass)pass
{
  void *v2;
  id v3;
  void *v4;

  -[PKPaymentPreferenceOptionListItem preference](self, "preference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "pass");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = v2;
  }
  v4 = v3;
LABEL_7:

  return (PKPaymentPass *)v4;
}

- (id)_text
{
  void *v2;
  void *v3;

  -[PKPaymentPreferenceCardOptionListItem pass](self, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_secondaryText
{
  void *v3;
  void *v4;

  -[PKPaymentPreferenceCardOptionListItem pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferenceCardOptionListItem _censoredPANTextForPass:](self, "_censoredPANTextForPass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_image
{
  PKPassView *v3;
  void *v4;
  PKPassView *v5;
  double v6;
  void *v7;

  v3 = [PKPassView alloc];
  -[PKPaymentPreferenceCardOptionListItem pass](self, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPassView initWithPass:content:suppressedContent:](v3, "initWithPass:content:suppressedContent:", v4, 4, 2039);

  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v5, "snapshotOfFrontFaceWithRequestedSize:", 66.0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_censoredPANTextForPass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "isAccessPass"))
  {
    objc_msgSend(v3, "fieldForKey:", *MEMORY[0x1E0D6ADB8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!objc_msgSend(v3, "hasAssociatedPeerPaymentAccount"))
      goto LABEL_6;
    objc_msgSend(v3, "peerPaymentBalance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_6;
    objc_msgSend(v3, "peerPaymentBalance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minimalFormattedStringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IN_APP_BALANCE_FORMAT"), CFSTR("%@"), v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
LABEL_6:
      PKSanitizedPrimaryAccountRepresentationForPass();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

@end
