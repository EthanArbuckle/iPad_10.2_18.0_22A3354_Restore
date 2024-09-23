@implementation PKPaymentSetupFieldLabel

- (void)updateWithAttribute:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupFieldLabel;
  -[PKPaymentSetupField updateWithAttribute:](&v6, sel_updateWithAttribute_, v4);
  -[PKPaymentSetupFieldLabel _commonUpdate](self, "_commonUpdate");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "defaultValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PKPaymentSetupField setDefaultValue:](self, "setDefaultValue:", v5);

  }
}

- (void)updateWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupFieldLabel;
  -[PKPaymentSetupField updateWithConfiguration:](&v16, sel_updateWithConfiguration_, v4);
  objc_msgSend(v4, "PKStringForKey:", CFSTR("buttonTitle"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    -[PKPaymentSetupFieldLabel setButtonTitle:](self, "setButtonTitle:", v5);
  objc_msgSend(v4, "PKStringForKey:", CFSTR("detailTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PKPaymentSetupFieldLabel setDetailTitle:](self, "setDetailTitle:", v6);
  objc_msgSend(v4, "PKStringForKey:", CFSTR("detailSubtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[PKPaymentSetupFieldLabel setDetailSubtitle:](self, "setDetailSubtitle:", v7);
  objc_msgSend(v4, "PKStringForKey:", CFSTR("detailBody"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[PKPaymentSetupFieldLabel setDetailBody:](self, "setDetailBody:", v8);
  objc_msgSend(v4, "PKStringForKey:", CFSTR("businessChatIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[PKPaymentSetupFieldLabel setBusinessChatIdentifier:](self, "setBusinessChatIdentifier:", v9);
  objc_msgSend(v4, "PKStringForKey:", CFSTR("businessChatButtonTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[PKPaymentSetupFieldLabel setBusinessChatButtonTitle:](self, "setBusinessChatButtonTitle:", v10);
  objc_msgSend(v4, "PKStringForKey:", CFSTR("businessChatIntentName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[PKPaymentSetupFieldLabel setBusinessChatIntentName:](self, "setBusinessChatIntentName:", v11);
  v15 = (void *)v5;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("alignment"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    -[PKPaymentSetupFieldLabel setAlingment:](self, "setAlingment:", PKPaymentSetupFieldLabelAlignmentFromString(v12));
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("links"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    -[PKPaymentSetupFieldLabel setLinks:](self, "setLinks:", v14);
  -[PKPaymentSetupFieldLabel _commonUpdate](self, "_commonUpdate");

}

- (void)_commonUpdate
{
  -[PKPaymentSetupField _setLocalizedDisplayName:](self, "_setLocalizedDisplayName:", 0);
  -[PKPaymentSetupField setLocalizedPlaceholder:](self, "setLocalizedPlaceholder:", 0);
  -[PKPaymentSetupField setDisplayFormat:](self, "setDisplayFormat:", 0);
  -[PKPaymentSetupField setSubmissionKey:](self, "setSubmissionKey:", 0);
  -[PKPaymentSetupField setSubmissionDestination:](self, "setSubmissionDestination:", 0);
  -[PKPaymentSetupField setRequiresSecureSubmission:](self, "setRequiresSecureSubmission:", 0);
}

- (id)submissionString
{
  return 0;
}

- (BOOL)submissionStringMeetsAllRequirements
{
  return 1;
}

- (unint64_t)fieldType
{
  return 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupFieldLabel;
  v5 = -[PKPaymentSetupField copyWithZone:](&v23, sel_copyWithZone_);
  v6 = -[NSString copyWithZone:](self->_buttonTitle, "copyWithZone:", a3);
  v7 = (void *)v5[17];
  v5[17] = v6;

  v8 = -[NSString copyWithZone:](self->_detailTitle, "copyWithZone:", a3);
  v9 = (void *)v5[18];
  v5[18] = v8;

  v10 = -[NSString copyWithZone:](self->_detailSubtitle, "copyWithZone:", a3);
  v11 = (void *)v5[19];
  v5[19] = v10;

  v12 = -[NSString copyWithZone:](self->_detailBody, "copyWithZone:", a3);
  v13 = (void *)v5[20];
  v5[20] = v12;

  v14 = -[NSString copyWithZone:](self->_businessChatButtonTitle, "copyWithZone:", a3);
  v15 = (void *)v5[21];
  v5[21] = v14;

  v16 = -[NSString copyWithZone:](self->_businessChatIdentifier, "copyWithZone:", a3);
  v17 = (void *)v5[22];
  v5[22] = v16;

  v18 = -[NSString copyWithZone:](self->_businessChatIntentName, "copyWithZone:", a3);
  v19 = (void *)v5[23];
  v5[23] = v18;

  v5[24] = self->_alingment;
  v20 = -[NSArray copyWithZone:](self->_links, "copyWithZone:", a3);
  v21 = (void *)v5[25];
  v5[25] = v20;

  return v5;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)detailTitle
{
  return self->_detailTitle;
}

- (void)setDetailTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)detailSubtitle
{
  return self->_detailSubtitle;
}

- (void)setDetailSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)detailBody
{
  return self->_detailBody;
}

- (void)setDetailBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)businessChatButtonTitle
{
  return self->_businessChatButtonTitle;
}

- (void)setBusinessChatButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)businessChatIdentifier
{
  return self->_businessChatIdentifier;
}

- (void)setBusinessChatIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)businessChatIntentName
{
  return self->_businessChatIntentName;
}

- (void)setBusinessChatIntentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (unint64_t)alingment
{
  return self->_alingment;
}

- (void)setAlingment:(unint64_t)a3
{
  self->_alingment = a3;
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_businessChatIntentName, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
  objc_storeStrong((id *)&self->_businessChatButtonTitle, 0);
  objc_storeStrong((id *)&self->_detailBody, 0);
  objc_storeStrong((id *)&self->_detailSubtitle, 0);
  objc_storeStrong((id *)&self->_detailTitle, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end
