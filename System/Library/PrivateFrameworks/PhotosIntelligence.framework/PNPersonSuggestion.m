@implementation PNPersonSuggestion

- (NSString)autonamingFeedbackStandardNameRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  -[PNPersonSuggestion nameComponents](self, "nameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autonamingFeedbackStandardizedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (!v5)
  {
    -[PNPersonSuggestion nameString](self, "nameString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v18 = (void *)MEMORY[0x24BDD17C8];
  v19.receiver = self;
  v19.super_class = (Class)PNPersonSuggestion;
  -[PNPersonSuggestion description](&v19, sel_description);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonSuggestion personLocalIdentifier](self, "personLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonSuggestion nameComponents](self, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  v6 = v5;
  -[PNPersonSuggestion nameString](self, "nameString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  v9 = v8;
  -[PNPersonSuggestion contactIdentifier](self, "contactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  v12 = v11;
  if (-[PNPersonSuggestion isMe](self, "isMe"))
    v13 = CFSTR("Y");
  else
    v13 = CFSTR("N");
  v14 = v13;
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@ personLocalIdentifier:%@ nameComponents:%@ nameString:%@ contactIdentifier:%@ isMe:%@ source:%ld attribution:%ld>"), v17, v3, v6, v9, v12, v14, -[PNPersonSuggestion suggestionSource](self, "suggestionSource"), -[PNPersonSuggestion attribution](self, "attribution"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)nameString
{
  return self->_nameString;
}

- (void)setNameString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (void)setPersonLocalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)suggestionSource
{
  return self->_suggestionSource;
}

- (void)setSuggestionSource:(int64_t)a3
{
  self->_suggestionSource = a3;
}

- (int64_t)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(int64_t)a3
{
  self->_attribution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_nameString, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
}

+ (id)suggestionWithPersonLocalIdentifier:(id)a3 meContactIdentifier:(id)a4
{
  id v5;
  id v6;
  PNPersonSuggestion *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PNPersonSuggestion);
  -[PNPersonSuggestion setPersonLocalIdentifier:](v7, "setPersonLocalIdentifier:", v6);

  -[PNPersonSuggestion setContactIdentifier:](v7, "setContactIdentifier:", v5);
  -[PNPersonSuggestion setIsMe:](v7, "setIsMe:", 1);
  -[PNPersonSuggestion setSuggestionSource:](v7, "setSuggestionSource:", 0);
  -[PNPersonSuggestion setAttribution:](v7, "setAttribution:", 3);
  return v7;
}

+ (id)suggestionWithPersonLocalIdentifier:(id)a3 personView:(id)a4
{
  id v5;
  id v6;
  PNPersonSuggestion *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PNPersonSuggestion);
  -[PNPersonSuggestion setPersonLocalIdentifier:](v7, "setPersonLocalIdentifier:", v6);

  objc_msgSend(v5, "suggestedNameComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonSuggestion setNameComponents:](v7, "setNameComponents:", v8);

  objc_msgSend(v5, "suggestedNameString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonSuggestion setNameString:](v7, "setNameString:", v9);

  objc_msgSend(v5, "contactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonSuggestion setContactIdentifier:](v7, "setContactIdentifier:", v10);

  -[PNPersonSuggestion setSuggestionSource:](v7, "setSuggestionSource:", 1);
  v11 = objc_msgSend(v5, "autonamingSuggestionReason");

  if ((unint64_t)(v11 - 2) >= 4)
    v12 = 0;
  else
    v12 = v11 - 1;
  -[PNPersonSuggestion setAttribution:](v7, "setAttribution:", v12);
  return v7;
}

@end
