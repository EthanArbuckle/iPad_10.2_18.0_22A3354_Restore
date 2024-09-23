@implementation PencilHandwritingEducationElementData

+ (id)elementDataForType:(int64_t)a3 languageID:(id)a4
{
  id v6;
  PencilHandwritingEducationElementData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v6 = a4;
  v7 = objc_alloc_init(PencilHandwritingEducationElementData);
  objc_msgSend(a1, "prefixForElementType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilHandwritingEducationElementData setLanguageID:](v7, "setLanguageID:", v6);
    if (a3)
    {
      v12 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v10, "stringByAppendingString:", CFSTR("TITLE"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24F4E5CD0, CFSTR("PencilSettings"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithString:", v14);
      -[PencilHandwritingEducationElementData setTitle:](v7, "setTitle:", v15);

    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x24BEBB4B8]);
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("ellipsis.circle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageWithRenderingMode:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setImage:", v17);

      v18 = objc_alloc(MEMORY[0x24BDD1688]);
      objc_msgSend(v10, "stringByAppendingString:", CFSTR("TITLE_1"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", v19, &stru_24F4E5CD0, CFSTR("PencilSettings"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v18, "initWithString:", v20);

      objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendAttributedString:", v21);

      v22 = objc_alloc(MEMORY[0x24BDD1688]);
      objc_msgSend(v10, "stringByAppendingString:", CFSTR("TITLE_2"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", v23, &stru_24F4E5CD0, CFSTR("PencilSettings"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v22, "initWithString:", v24);
      objc_msgSend(v14, "appendAttributedString:", v25);

      -[PencilHandwritingEducationElementData setTitle:](v7, "setTitle:", v14);
    }

    objc_msgSend(v10, "stringByAppendingString:", CFSTR("TEXT_CONTENT"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedStringForLanguageInBundle(v26, v6, v11, CFSTR("PencilSettings"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilHandwritingEducationElementData setTextContent:](v7, "setTextContent:", v27);

    objc_msgSend(v10, "stringByAppendingString:", CFSTR("PLACEHOLDER_TEXT_CONTENT"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedStringForLanguageInBundle(v28, v6, v11, CFSTR("PencilSettings"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilHandwritingEducationElementData setPlaceholderTextContent:](v7, "setPlaceholderTextContent:", v29);

    -[PencilHandwritingEducationElementData setType:](v7, "setType:", a3);
  }

  return v7;
}

+ (id)prefixForElementType:(int64_t)a3
{
  if (a3)
    return 0;
  else
    return CFSTR("AUTO_REFINE");
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)placeholderTextContent
{
  return self->_placeholderTextContent;
}

- (void)setPlaceholderTextContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)languageID
{
  return self->_languageID;
}

- (void)setLanguageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageID, 0);
  objc_storeStrong((id *)&self->_placeholderTextContent, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
