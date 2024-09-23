@implementation PencilEducationElementData

+ (id)elementDataForType:(int64_t)a3 languageID:(id)a4
{
  id v6;
  PencilEducationElementData *v7;
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

  v6 = a4;
  v7 = objc_alloc_init(PencilEducationElementData);
  objc_msgSend(a1, "prefixForElementType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilEducationElementData setLanguageID:](v7, "setLanguageID:", v6);
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_24F4E5CD0, CFSTR("PencilSettings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilEducationElementData setTitle:](v7, "setTitle:", v13);

    objc_msgSend(v10, "stringByAppendingString:", CFSTR("TEXT_CONTENT"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedStringForLanguageInBundle(v14, v6, v11, CFSTR("PencilSettings"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilEducationElementData setTextContent:](v7, "setTextContent:", v15);

    objc_msgSend(v10, "stringByAppendingString:", CFSTR("PLACEHOLDER_TEXT_CONTENT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedStringForLanguageInBundle(v16, v6, v11, CFSTR("PencilSettings"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilEducationElementData setPlaceholderTextContent:](v7, "setPlaceholderTextContent:", v17);

    -[PencilEducationElementData setType:](v7, "setType:", a3);
  }

  return v7;
}

+ (id)prefixForElementType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_24F4E5518[a3];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
  objc_storeStrong((id *)&self->_textContent, a3);
}

- (NSString)placeholderTextContent
{
  return self->_placeholderTextContent;
}

- (void)setPlaceholderTextContent:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTextContent, a3);
}

- (NSString)languageID
{
  return self->_languageID;
}

- (void)setLanguageID:(id)a3
{
  objc_storeStrong((id *)&self->_languageID, a3);
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
