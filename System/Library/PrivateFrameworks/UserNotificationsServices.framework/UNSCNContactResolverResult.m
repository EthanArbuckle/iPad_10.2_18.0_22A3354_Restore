@implementation UNSCNContactResolverResult

+ (id)resultWithCNContactIdentifier:(id)a3 cnContactFullname:(id)a4 suggestedContact:(BOOL)a5 matchType:(unint64_t)a6 matchTypeSuggested:(BOOL)a7 identifierOfMatchLabel:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;

  v8 = a7;
  v10 = a5;
  v13 = a8;
  v14 = a4;
  v15 = a3;
  v16 = -[UNSCNContactResolverResult _initWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:]([UNSCNContactResolverResult alloc], "_initWithCNContactIdentifier:cnContactFullname:suggestedContact:matchType:matchTypeSuggested:identifierOfMatchLabel:", v15, v14, v10, a6, v8, v13);

  return v16;
}

- (id)_initWithCNContactIdentifier:(id)a3 cnContactFullname:(id)a4 suggestedContact:(BOOL)a5 matchType:(unint64_t)a6 matchTypeSuggested:(BOOL)a7 identifierOfMatchLabel:(id)a8
{
  id v15;
  id v16;
  id v17;
  UNSCNContactResolverResult *v18;
  UNSCNContactResolverResult *v19;
  objc_super v21;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)UNSCNContactResolverResult;
  v18 = -[UNSCNContactResolverResult init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cnContactIdentifier, a3);
    v19->_suggestedContact = a5;
    v19->_matchType = a6;
    v19->_matchTypeSuggested = a7;
    objc_storeStrong((id *)&v19->_identifierOfMatchLabel, a8);
    objc_storeStrong((id *)&v19->_cnContactFullname, a4);
  }

  return v19;
}

- (BOOL)isStrongerMatchThanOtherMatch:(id)a3
{
  id v4;
  char v5;
  BOOL v6;

  v4 = a3;
  if (v4)
  {
    if (-[UNSCNContactResolverResult isSuggestedContact](self, "isSuggestedContact")
      || (objc_msgSend(v4, "isSuggestedContact") & 1) != 0)
    {
      if (!-[UNSCNContactResolverResult isSuggestedContact](self, "isSuggestedContact"))
      {
        v5 = objc_msgSend(v4, "isSuggestedContact");
LABEL_10:
        v6 = v5;
        goto LABEL_11;
      }
    }
    else if (!-[UNSCNContactResolverResult isMatchTypeSuggested](self, "isMatchTypeSuggested"))
    {
      v5 = objc_msgSend(v4, "isMatchTypeSuggested");
      goto LABEL_10;
    }
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
LABEL_11:

  return v6;
}

- (BOOL)isStrongestMatch
{
  if (-[UNSCNContactResolverResult isSuggestedContact](self, "isSuggestedContact"))
    return 0;
  else
    return !-[UNSCNContactResolverResult isMatchTypeSuggested](self, "isMatchTypeSuggested");
}

- (NSString)debugDescription
{
  return (NSString *)-[UNSCNContactResolverResult descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UNSCNContactResolverResult descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  UNSCNContactResolverResult *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__UNSCNContactResolverResult_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_251B14350;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __68__UNSCNContactResolverResult_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cnContactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("cnContactIdentifier"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cnContactFullname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "un_logDigest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("cnContactFullname"));

  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSuggestedContact"), CFSTR("isSuggestedContact"));
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_stringForMatchType:", objc_msgSend(*(id *)(a1 + 40), "matchType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:withName:", v11, CFSTR("matchType"));

  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isMatchTypeSuggested"), CFSTR("matchTypeSuggested"));
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifierOfMatchLabel");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "appendBool:withName:", v15 != 0, CFSTR("identifierOfMatchLabelExists"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UNSCNContactResolverResult succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSCNContactResolverResult cnContactIdentifier](self, "cnContactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("cnContactIdentifier"));

  -[UNSCNContactResolverResult cnContactFullname](self, "cnContactFullname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "un_logDigest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("cnContactFullname"));

  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNSCNContactResolverResult isSuggestedContact](self, "isSuggestedContact"), CFSTR("isSuggestedContact"));
  -[UNSCNContactResolverResult _stringForMatchType:](self, "_stringForMatchType:", -[UNSCNContactResolverResult matchType](self, "matchType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("matchType"));

  v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNSCNContactResolverResult isMatchTypeSuggested](self, "isMatchTypeSuggested"), CFSTR("matchTypeSuggested"));
  -[UNSCNContactResolverResult identifierOfMatchLabel](self, "identifierOfMatchLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendBool:withName:", v12 != 0, CFSTR("identifierOfMatchLabelExists"));

  return v3;
}

- (id)_stringForMatchType:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_251B14370[a3];
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (NSString)cnContactFullname
{
  return self->_cnContactFullname;
}

- (BOOL)isSuggestedContact
{
  return self->_suggestedContact;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (BOOL)isMatchTypeSuggested
{
  return self->_matchTypeSuggested;
}

- (NSString)identifierOfMatchLabel
{
  return self->_identifierOfMatchLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierOfMatchLabel, 0);
  objc_storeStrong((id *)&self->_cnContactFullname, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
}

@end
