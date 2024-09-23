@implementation SSMailResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.mobilemail");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSMailResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSMailResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SSMailResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v26, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6048], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6030], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA67D8], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA67D0], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[SSResultBuilder result](v5, "result");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "valueForAttribute:withType:", *MEMORY[0x1E0CA66F8], objc_opt_class());
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMailResultBuilder setCreationDate:](v5, "setCreationDate:", v13);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA68B8], objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMailResultBuilder setBody:](v5, "setBody:", v14);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA68D8], objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[SSMailResultBuilder setSubject:](v5, "setSubject:", v15);
    }
    else
    {
      objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMailResultBuilder setSubject:](v5, "setSubject:", v16);

    }
    objc_msgSend(v11, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v11;
    else
      v18 = 0;
    -[SSMailResultBuilder setRecipientEmails:](v5, "setRecipientEmails:", v18);

    objc_msgSend(v8, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v8;
    else
      v20 = 0;
    -[SSMailResultBuilder setRecipients:](v5, "setRecipients:", v20);

    objc_msgSend(v7, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMailResultBuilder setAuthorEmail:](v5, "setAuthorEmail:", v22);

    }
    else
    {
      -[SSMailResultBuilder setAuthorEmail:](v5, "setAuthorEmail:", 0);
    }

    objc_msgSend(v6, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMailResultBuilder setAuthor:](v5, "setAuthor:", v24);

    }
    else
    {
      -[SSMailResultBuilder setAuthor:](v5, "setAuthor:", 0);
    }

  }
  return v5;
}

- (id)buildInlineCardSection
{
  void *v3;
  void *v4;
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
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  objc_super v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  -[SSMailResultBuilder subject](self, "subject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "whiteSpaceCondensedStringForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsEmphasized:", 1);
    v5 = (void *)objc_opt_new();
    v35[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFormattedTextPieces:", v7);

    v8 = (void *)objc_opt_new();
    if (v5 && (isMacOS() & 1) == 0)
    {
      objc_msgSend(v8, "addObject:", v5);
      objc_msgSend(v8, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMaxLines:", 1);

    }
  }
  else
  {
    v8 = (void *)objc_opt_new();
    v6 = 0;
  }
  -[SSMailResultBuilder body](self, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SSMailResultBuilder body](self, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder matchedStrings](self, "matchedStrings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v13))
    {
      -[SSResultBuilder buildHighlightedMatchedTextWithTitle:headTruncation:](self, "buildHighlightedMatchedTextWithTitle:headTruncation:", 0, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    objc_msgSend(v14, "formattedTextPieces");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v8, "addObject:", v14);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0D8C660];
      -[SSMailResultBuilder body](self, "body");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v18);

    }
    if (SSSnippetModernizationEnabled())
      v19 = 1;
    else
      v19 = 2;
    objc_msgSend(v8, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMaxLines:", v19);

  }
  v21 = (void *)objc_opt_new();
  -[SSMailResultBuilder author](self, "author");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22
    || (-[SSMailResultBuilder authorEmail](self, "authorEmail"),
        (v22 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setIsEmphasized:", 1);
    objc_msgSend(v21, "addObject:", v23);

  }
  if (v6 && isMacOS())
  {
    objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", CFSTR(" — "));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v24);

    objc_msgSend(v6, "setIsEmphasized:", 0);
    objc_msgSend(v21, "addObject:", v6);
  }
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setFormattedTextPieces:", v21);
  v34.receiver = self;
  v34.super_class = (Class)SSMailResultBuilder;
  -[SSResultBuilder buildInlineCardSection](&v34, sel_buildInlineCardSection);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTitle:", v25);
  objc_msgSend(v26, "setDescriptions:", v8);
  -[SSMailResultBuilder creationDate](self, "creationDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0D8C3D0];
    -[SSMailResultBuilder creationDate](self, "creationDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSDateFormatManager dynamicCompactStringFromDate:](SSDateFormatManager, "dynamicCompactStringFromDate:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "textWithString:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSecondaryTitle:", v31);

  }
  else
  {
    objc_msgSend(v26, "setSecondaryTitle:", 0);
  }

  objc_msgSend(v26, "setIsSecondaryTitleDetached:", 1);
  return v26;
}

- (id)buildCompactCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  -[SSMailResultBuilder subject](self, "subject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    -[SSMailResultBuilder subject](self, "subject");
  else
    -[SSMailResultBuilder fallbackTitleString](self, "fallbackTitleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  -[SSMailResultBuilder creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[SSDateFormatManager dynamicCompactStringFromDate:](SSDateFormatManager, "dynamicCompactStringFromDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  -[SSMailResultBuilder author](self, "author");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (-[SSMailResultBuilder authorEmail](self, "authorEmail"),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "addObject:", v8);

  }
  -[SSMailResultBuilder buildRecipientsString](self, "buildRecipientsString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v5, "addObject:", v9);
  v14.receiver = self;
  v14.super_class = (Class)SSMailResultBuilder;
  -[SSResultBuilder buildCompactCardSection](&v14, sel_buildCompactCardSection);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v11);

  objc_msgSend((id)objc_opt_class(), "richTextsFromStrings:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDescriptions:", v12);

  return v10;
}

- (id)buildRecipientsString
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  -[SSMailResultBuilder recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  if (!v4 || (v6 = v5, !objc_msgSend(v3, "count")))
  {
    -[SSMailResultBuilder recipientEmails](self, "recipientEmails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v7, "count");
    v4 = (void *)v8;
  }
  if (v4 && v6 >= 2)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MAIL_RECIPIENT_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v4, v6);
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v12;
  }

  return v4;
}

- (id)fallbackTitleString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NO_SUBJECT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buildThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[SSMailResultBuilder authorEmail](self, "authorEmail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSContactStore contactWithEmail:](SSContactStore, "contactWithEmail:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContactIdentifiers:", v7);

    objc_msgSend(v5, "setThreeDTouchEnabled:", 1);
  }
  else
  {
    -[SSMailResultBuilder author](self, "author");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      -[SSMailResultBuilder author](self, "author");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSNameFormatManager contactFromName:](SSNameFormatManager, "contactFromName:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v11, 1002);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMonogramLetters:", v12);

    }
    else
    {
      v5 = (void *)objc_opt_new();
    }
  }

  return v5;
}

- (unint64_t)numberOfLinesForDescriptions
{
  return 1;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (NSString)authorEmail
{
  return self->_authorEmail;
}

- (void)setAuthorEmail:(id)a3
{
  objc_storeStrong((id *)&self->_authorEmail, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSArray)recipientEmails
{
  return self->_recipientEmails;
}

- (void)setRecipientEmails:(id)a3
{
  objc_storeStrong((id *)&self->_recipientEmails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientEmails, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_authorEmail, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
