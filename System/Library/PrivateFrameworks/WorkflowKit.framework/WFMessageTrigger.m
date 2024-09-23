@implementation WFMessageTrigger

- (BOOL)hasValidConfiguration
{
  void *v3;
  BOOL v4;
  void *v5;

  -[WFMessageTrigger selectedSenders](self, "selectedSenders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[WFMessageTrigger selectedContents](self, "selectedContents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  return -[WFMessageTrigger localizedDescriptionWithConfigurationSummaryWithCount:](self, "localizedDescriptionWithConfigurationSummaryWithCount:", 1);
}

- (id)localizedDescriptionWithConfigurationSummaryWithCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  -[WFMessageTrigger selectedContents](self, "selectedContents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Containing ‘%@’"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMessageTrigger selectedContents](self, "selectedContents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  -[WFMessageTrigger selectedSenders](self, "selectedSenders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[WFMessageTrigger selectedSenders](self, "selectedSenders");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(MEMORY[0x1E0D13E30], "contactWithCNContact:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "triggerDisplayName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v17);
    }

    v22 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("From %@"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v25);

  }
  v26 = (void *)MEMORY[0x1E0CB3940];
  if (a3 == 1)
  {
    WFLocalizedString(CFSTR("When I Get a Message %@"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
  }
  else
  {
    WFLocalizedString(CFSTR("When I Get a Message %@ (%d)"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    v32 = a3;
  }
  objc_msgSend(v26, "stringWithFormat:", v27, v28, v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
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
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFMessageTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[WFMessageTrigger selectedContents](self, "selectedContents", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selectedContents"));

  -[WFMessageTrigger selectedSenders](self, "selectedSenders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("selectedSenders"));

  -[WFMessageTrigger selectedSendersStrings](self, "selectedSendersStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("selectedSendersStrings"));

}

- (WFMessageTrigger)initWithCoder:(id)a3
{
  id v4;
  WFMessageTrigger *v5;
  uint64_t v6;
  NSString *selectedContents;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *selectedSenders;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *selectedSendersStrings;
  WFMessageTrigger *v20;
  objc_super v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WFMessageTrigger;
  v5 = -[WFTrigger initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedContents"));
    v6 = objc_claimAutoreleasedReturnValue();
    selectedContents = v5->_selectedContents;
    v5->_selectedContents = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v9 = (void *)getCNContactClass_softClass;
    v27 = getCNContactClass_softClass;
    if (!getCNContactClass_softClass)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __getCNContactClass_block_invoke;
      v23[3] = &unk_1E7AF9520;
      v23[4] = &v24;
      __getCNContactClass_block_invoke((uint64_t)v23);
      v9 = (void *)v25[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v24, 8);
    v29[0] = v10;
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("selectedSenders"));
    v13 = objc_claimAutoreleasedReturnValue();
    selectedSenders = v5->_selectedSenders;
    v5->_selectedSenders = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("selectedSendersStrings"));
    v18 = objc_claimAutoreleasedReturnValue();
    selectedSendersStrings = v5->_selectedSendersStrings;
    v5->_selectedSendersStrings = (NSArray *)v18;

    v20 = v5;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFMessageTrigger;
  v4 = -[WFTrigger copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[WFMessageTrigger selectedContents](self, "selectedContents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSelectedContents:", v6);

  -[WFMessageTrigger selectedSenders](self, "selectedSenders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSelectedSenders:", v8);

  -[WFMessageTrigger selectedSendersStrings](self, "selectedSendersStrings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSelectedSendersStrings:", v10);

  return v4;
}

- (NSString)selectedContents
{
  return self->_selectedContents;
}

- (void)setSelectedContents:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContents, a3);
}

- (NSArray)selectedSenders
{
  return self->_selectedSenders;
}

- (void)setSelectedSenders:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSenders, a3);
}

- (NSArray)selectedSendersStrings
{
  return self->_selectedSendersStrings;
}

- (void)setSelectedSendersStrings:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSendersStrings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedSendersStrings, 0);
  objc_storeStrong((id *)&self->_selectedSenders, 0);
  objc_storeStrong((id *)&self->_selectedContents, 0);
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
  return WFLocalizedString(CFSTR("Message"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When I get a message from Mom”"));
}

+ (id)displayGlyph
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerDisplaySymbolNamed:renderingMode:", CFSTR("message.fill"), 2);
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)messagesGreen
{
  return (id)objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithRed:green:blue:alpha:", 0.298039228, 0.850980401, 0.392156869, 1.0);
}

@end
