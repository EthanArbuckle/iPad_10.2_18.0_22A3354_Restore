@implementation WFEmailTrigger

- (BOOL)hasValidConfiguration
{
  void *v3;
  BOOL v4;
  void *v5;

  -[WFEmailTrigger selectedSenders](self, "selectedSenders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[WFEmailTrigger selectedSubject](self, "selectedSubject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  return -[WFEmailTrigger localizedDescriptionWithConfigurationSummaryWithCount:](self, "localizedDescriptionWithConfigurationSummaryWithCount:", 1);
}

- (id)localizedDescriptionWithConfigurationSummaryWithCount:(unint64_t)a3
{
  void *v5;
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
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unint64_t v37;

  v5 = (void *)objc_opt_new();
  -[WFEmailTrigger selectedAccountIdentifiers](self, "selectedAccountIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("In %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEmailTrigger selectedAccountDescriptions](self, "selectedAccountDescriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  -[WFEmailTrigger selectedSubject](self, "selectedSubject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Subject Contains ‘%@’"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEmailTrigger selectedSubject](self, "selectedSubject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

  }
  -[WFEmailTrigger selectedSenders](self, "selectedSenders");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("From %@"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEmailTrigger selectedSenders](self, "selectedSenders");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v23);

  }
  -[WFEmailTrigger selectedRecipients](self, "selectedRecipients");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("To %@"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEmailTrigger selectedRecipients](self, "selectedRecipients");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", "));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v30);

  }
  v31 = (void *)MEMORY[0x1E0CB3940];
  if (a3 == 1)
  {
    WFLocalizedString(CFSTR("When I Get an Email %@"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
  }
  else
  {
    WFLocalizedString(CFSTR("When I Get an Email %@ (%d)"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    v37 = a3;
  }
  objc_msgSend(v31, "stringWithFormat:", v32, v33, v37);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)localizedPastTenseDescription
{
  return &stru_1E7AFA810;
}

- (Class)shortcutInputContentItemClass
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFEmailTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[WFEmailTrigger selectedAccountIdentifiers](self, "selectedAccountIdentifiers", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selectedAccountIdentifiers"));

  -[WFEmailTrigger selectedAccountDescriptions](self, "selectedAccountDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("selectedAccountDescriptions"));

  -[WFEmailTrigger selectedSubject](self, "selectedSubject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("selectedSubject"));

  -[WFEmailTrigger selectedRecipients](self, "selectedRecipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("selectedRecipients"));

  -[WFEmailTrigger selectedSenders](self, "selectedSenders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("selectedSenders"));

}

- (WFEmailTrigger)initWithCoder:(id)a3
{
  id v4;
  WFEmailTrigger *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *selectedAccountIdentifiers;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *selectedAccountDescriptions;
  uint64_t v16;
  NSString *selectedSubject;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *selectedRecipients;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *selectedSenders;
  WFEmailTrigger *v28;
  objc_super v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WFEmailTrigger;
  v5 = -[WFTrigger initWithCoder:](&v30, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("selectedAccountIdentifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    selectedAccountIdentifiers = v5->_selectedAccountIdentifiers;
    v5->_selectedAccountIdentifiers = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("selectedAccountDescriptions"));
    v14 = objc_claimAutoreleasedReturnValue();
    selectedAccountDescriptions = v5->_selectedAccountDescriptions;
    v5->_selectedAccountDescriptions = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedSubject"));
    v16 = objc_claimAutoreleasedReturnValue();
    selectedSubject = v5->_selectedSubject;
    v5->_selectedSubject = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("selectedRecipients"));
    v21 = objc_claimAutoreleasedReturnValue();
    selectedRecipients = v5->_selectedRecipients;
    v5->_selectedRecipients = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("selectedSenders"));
    v26 = objc_claimAutoreleasedReturnValue();
    selectedSenders = v5->_selectedSenders;
    v5->_selectedSenders = (NSArray *)v26;

    v28 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFEmailTrigger;
  v4 = -[WFTrigger copyWithZone:](&v16, sel_copyWithZone_, a3);
  -[WFEmailTrigger selectedAccountIdentifiers](self, "selectedAccountIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSelectedAccountIdentifiers:", v6);

  -[WFEmailTrigger selectedAccountDescriptions](self, "selectedAccountDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSelectedAccountDescriptions:", v8);

  -[WFEmailTrigger selectedSubject](self, "selectedSubject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSelectedSubject:", v10);

  -[WFEmailTrigger selectedRecipients](self, "selectedRecipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setSelectedRecipients:", v12);

  -[WFEmailTrigger selectedSenders](self, "selectedSenders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setSelectedSenders:", v14);

  return v4;
}

- (NSArray)selectedAccountIdentifiers
{
  return self->_selectedAccountIdentifiers;
}

- (void)setSelectedAccountIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAccountIdentifiers, a3);
}

- (NSArray)selectedAccountDescriptions
{
  return self->_selectedAccountDescriptions;
}

- (void)setSelectedAccountDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAccountDescriptions, a3);
}

- (NSString)selectedSubject
{
  return self->_selectedSubject;
}

- (void)setSelectedSubject:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSubject, a3);
}

- (NSArray)selectedRecipients
{
  return self->_selectedRecipients;
}

- (void)setSelectedRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRecipients, a3);
}

- (NSArray)selectedSenders
{
  return self->_selectedSenders;
}

- (void)setSelectedSenders:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSenders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedSenders, 0);
  objc_storeStrong((id *)&self->_selectedRecipients, 0);
  objc_storeStrong((id *)&self->_selectedSubject, 0);
  objc_storeStrong((id *)&self->_selectedAccountDescriptions, 0);
  objc_storeStrong((id *)&self->_selectedAccountIdentifiers, 0);
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (BOOL)requiresNotification
{
  return 1;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Email"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When I get an email from Jane”"));
}

+ (id)displayGlyphName
{
  return CFSTR("envelope.fill");
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)mailBlue
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC79F8]), "initWithRed:green:blue:alpha:", 0.352941185, 0.784313738, 0.980392158, 1.0);
}

@end
