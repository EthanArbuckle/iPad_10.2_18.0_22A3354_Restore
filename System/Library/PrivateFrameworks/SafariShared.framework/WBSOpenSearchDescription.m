@implementation WBSOpenSearchDescription

- (WBSOpenSearchDescription)initWithDescriptionDocumentURLString:(id)a3 searchURLTemplate:(id)a4 urlTemplateForSuggestionsInJSON:(id)a5 urlTemplateForSuggestionsInXML:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WBSOpenSearchDescription *v14;
  uint64_t v15;
  NSString *descriptionDocumentURLString;
  WBSOpenSearchDescription *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WBSOpenSearchDescription;
  v14 = -[WBSOpenSearchDescription init](&v19, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    descriptionDocumentURLString = v14->_descriptionDocumentURLString;
    v14->_descriptionDocumentURLString = (NSString *)v15;

    objc_storeStrong((id *)&v14->_searchURLTemplate, a4);
    objc_storeStrong((id *)&v14->_urlTemplateForSuggestionsInJSON, a5);
    objc_storeStrong((id *)&v14->_urlTemplateForSuggestionsInXML, a6);
    v17 = v14;
  }

  return v14;
}

- (WBSOpenSearchDescription)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  WBSOpenSearchDescription *v5;
  void *v6;
  uint64_t v7;
  NSString *descriptionDocumentURLString;
  WBSOpenSearchURLTemplate *v9;
  void *v10;
  uint64_t v11;
  WBSOpenSearchURLTemplate *searchURLTemplate;
  WBSOpenSearchURLTemplate *v13;
  void *v14;
  uint64_t v15;
  WBSOpenSearchURLTemplate *urlTemplateForSuggestionsInJSON;
  WBSOpenSearchURLTemplate *v17;
  void *v18;
  uint64_t v19;
  WBSOpenSearchURLTemplate *urlTemplateForSuggestionsInXML;
  WBSOpenSearchDescription *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WBSOpenSearchDescription;
  v5 = -[WBSOpenSearchDescription init](&v23, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DescriptionDocumentURLString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  descriptionDocumentURLString = v5->_descriptionDocumentURLString;
  v5->_descriptionDocumentURLString = (NSString *)v7;

  v9 = [WBSOpenSearchURLTemplate alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SearchURLTemplateString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WBSOpenSearchURLTemplate initWithString:](v9, "initWithString:", v10);
  searchURLTemplate = v5->_searchURLTemplate;
  v5->_searchURLTemplate = (WBSOpenSearchURLTemplate *)v11;

  if (!-[NSString length](v5->_descriptionDocumentURLString, "length"))
    goto LABEL_5;
  if (v5->_searchURLTemplate)
  {
    v13 = [WBSOpenSearchURLTemplate alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URLTemplateStringForSuggestionsInJSON"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WBSOpenSearchURLTemplate initWithString:](v13, "initWithString:", v14);
    urlTemplateForSuggestionsInJSON = v5->_urlTemplateForSuggestionsInJSON;
    v5->_urlTemplateForSuggestionsInJSON = (WBSOpenSearchURLTemplate *)v15;

    v17 = [WBSOpenSearchURLTemplate alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URLTemplateStringForSuggestionsInXML"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WBSOpenSearchURLTemplate initWithString:](v17, "initWithString:", v18);
    urlTemplateForSuggestionsInXML = v5->_urlTemplateForSuggestionsInXML;
    v5->_urlTemplateForSuggestionsInXML = (WBSOpenSearchURLTemplate *)v19;

    v21 = v5;
  }
  else
  {
LABEL_5:
    v21 = 0;
  }

  return v21;
}

- (id)dictionaryRepresentation
{
  void *v3;
  WBSOpenSearchURLTemplate *searchURLTemplate;
  NSString *descriptionDocumentURLString;
  void *v6;
  void *v7;
  void *v8;
  WBSOpenSearchURLTemplate *urlTemplateForSuggestionsInJSON;
  void *v10;
  WBSOpenSearchURLTemplate *urlTemplateForSuggestionsInXML;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  descriptionDocumentURLString = self->_descriptionDocumentURLString;
  searchURLTemplate = self->_searchURLTemplate;
  v14[0] = CFSTR("DescriptionDocumentURLString");
  v14[1] = CFSTR("SearchURLTemplateString");
  v15[0] = descriptionDocumentURLString;
  -[WBSOpenSearchURLTemplate templateString](searchURLTemplate, "templateString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  urlTemplateForSuggestionsInJSON = self->_urlTemplateForSuggestionsInJSON;
  if (urlTemplateForSuggestionsInJSON)
  {
    -[WBSOpenSearchURLTemplate templateString](urlTemplateForSuggestionsInJSON, "templateString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("URLTemplateStringForSuggestionsInJSON"));

  }
  urlTemplateForSuggestionsInXML = self->_urlTemplateForSuggestionsInXML;
  if (urlTemplateForSuggestionsInXML)
  {
    -[WBSOpenSearchURLTemplate templateString](urlTemplateForSuggestionsInXML, "templateString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("URLTemplateStringForSuggestionsInXML"));

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WBSOpenSearchDescription *v4;
  WBSOpenSearchDescription *v5;
  NSString *descriptionDocumentURLString;
  void *v7;
  WBSOpenSearchURLTemplate *searchURLTemplate;
  void *v9;
  WBSOpenSearchURLTemplate *urlTemplateForSuggestionsInJSON;
  WBSOpenSearchURLTemplate *urlTemplateForSuggestionsInXML;
  char v12;

  v4 = (WBSOpenSearchDescription *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      descriptionDocumentURLString = self->_descriptionDocumentURLString;
      -[WBSOpenSearchDescription descriptionDocumentURLString](v5, "descriptionDocumentURLString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](descriptionDocumentURLString, "isEqualToString:", v7))
      {
        searchURLTemplate = self->_searchURLTemplate;
        -[WBSOpenSearchDescription searchURLTemplate](v5, "searchURLTemplate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(searchURLTemplate) = -[WBSOpenSearchURLTemplate isEqual:](searchURLTemplate, "isEqual:", v9);

        if (!(_DWORD)searchURLTemplate
          || (urlTemplateForSuggestionsInJSON = self->_urlTemplateForSuggestionsInJSON,
              urlTemplateForSuggestionsInJSON != v5->_urlTemplateForSuggestionsInJSON)
          && !-[WBSOpenSearchURLTemplate isEqual:](urlTemplateForSuggestionsInJSON, "isEqual:"))
        {
          v12 = 0;
          goto LABEL_14;
        }
        urlTemplateForSuggestionsInXML = self->_urlTemplateForSuggestionsInXML;
        if (urlTemplateForSuggestionsInXML == v5->_urlTemplateForSuggestionsInXML)
        {
          v12 = 1;
          goto LABEL_14;
        }
        -[WBSOpenSearchDescription urlTemplateForSuggestionsInXML](v5, "urlTemplateForSuggestionsInXML");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[WBSOpenSearchURLTemplate isEqual:](urlTemplateForSuggestionsInXML, "isEqual:", v7);
      }
      else
      {
        v12 = 0;
      }

LABEL_14:
      goto LABEL_15;
    }
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_descriptionDocumentURLString, "hash");
  v4 = -[WBSOpenSearchURLTemplate hash](self->_searchURLTemplate, "hash") ^ v3;
  v5 = -[WBSOpenSearchURLTemplate hash](self->_urlTemplateForSuggestionsInJSON, "hash");
  return v4 ^ v5 ^ -[WBSOpenSearchURLTemplate hash](self->_urlTemplateForSuggestionsInXML, "hash");
}

- (NSString)descriptionDocumentURLString
{
  return self->_descriptionDocumentURLString;
}

- (WBSOpenSearchURLTemplate)searchURLTemplate
{
  return self->_searchURLTemplate;
}

- (WBSOpenSearchURLTemplate)urlTemplateForSuggestionsInJSON
{
  return self->_urlTemplateForSuggestionsInJSON;
}

- (WBSOpenSearchURLTemplate)urlTemplateForSuggestionsInXML
{
  return self->_urlTemplateForSuggestionsInXML;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlTemplateForSuggestionsInXML, 0);
  objc_storeStrong((id *)&self->_urlTemplateForSuggestionsInJSON, 0);
  objc_storeStrong((id *)&self->_searchURLTemplate, 0);
  objc_storeStrong((id *)&self->_descriptionDocumentURLString, 0);
}

@end
