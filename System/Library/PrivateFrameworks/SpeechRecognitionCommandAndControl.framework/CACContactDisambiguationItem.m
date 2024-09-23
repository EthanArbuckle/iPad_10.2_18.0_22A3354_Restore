@implementation CACContactDisambiguationItem

- (CACContactDisambiguationItem)initWithContact:(id)a3 labeledValue:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  CACContactDisambiguationItem *v10;
  CACContactDisambiguationItem *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CACContactDisambiguationItem;
  v10 = -[CACContactDisambiguationItem init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[CACContactDisambiguationItem setContact:](v10, "setContact:", v8);
    -[CACContactDisambiguationItem setContactLabeledValue:](v11, "setContactLabeledValue:", v9);
    -[CACDisambiguationItem setType:](v11, "setType:", a5);
  }

  return v11;
}

- (void)startInteraction
{
  void *v3;
  id v4;

  if (-[CACDisambiguationItem type](self, "type") == 1)
  {
    -[CACContactDisambiguationItem contact](self, "contact");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CACContactDisambiguationItem contactLabeledValue](self, "contactLabeledValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callNumberWithLabeledValue:", v3);
  }
  else
  {
    if (-[CACDisambiguationItem type](self, "type") != 2)
      return;
    -[CACContactDisambiguationItem contact](self, "contact");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CACContactDisambiguationItem contactLabeledValue](self, "contactLabeledValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "faceTimeEmailWithLabeledValue:", v3);
  }

}

- (id)displayName
{
  return (id)objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", self->_contact, 0);
}

- (NSString)contactDisplayLabel
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBAD38];
  -[CNLabeledValue label](self->_contactLabeledValue, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)contactDisplayValue
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[CNLabeledValue value](self->_contactLabeledValue, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  -[CNLabeledValue value](self->_contactLabeledValue, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "stringValue");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return (NSString *)v6;
}

- (id)displayDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("DialMessage.LabeledNumberFormat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACContactDisambiguationItem contactDisplayLabel](self, "contactDisplayLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACContactDisambiguationItem contactDisplayValue](self, "contactDisplayValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@%@"), 0, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNLabeledValue)contactLabeledValue
{
  return self->_contactLabeledValue;
}

- (void)setContactLabeledValue:(id)a3
{
  objc_storeStrong((id *)&self->_contactLabeledValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactLabeledValue, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
