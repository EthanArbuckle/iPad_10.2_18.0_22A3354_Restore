@implementation WBSQuickWebsiteSearchProvider

- (WBSQuickWebsiteSearchProvider)initWithDictionaryRepresentation:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  WBSQuickWebsiteSearchProvider *v8;
  WBSQuickWebsiteSearchProvider *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *sourcePageURLString;
  WBSOpenSearchURLTemplate *v15;
  WBSOpenSearchURLTemplate *searchURLTemplateFromForm;
  uint64_t v17;
  NSString *openSearchDescriptionURLString;
  uint64_t v19;
  NSDate *dateAdded;
  uint64_t v21;
  NSDate *dateOfLastSearch;
  WBSQuickWebsiteSearchProvider *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSQuickWebsiteSearchProvider;
  v8 = -[WBSQuickWebsiteSearchProvider init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("SourcePageURLString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("SearchURLTemplateStringFromForm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("OpenSearchDescriptionURLString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length") && (objc_msgSend(v11, "length") || objc_msgSend(v12, "length")))
    {
      v13 = objc_msgSend(v10, "copy");
      sourcePageURLString = v9->_sourcePageURLString;
      v9->_sourcePageURLString = (NSString *)v13;

      v15 = -[WBSOpenSearchURLTemplate initWithString:]([WBSOpenSearchURLTemplate alloc], "initWithString:", v11);
      searchURLTemplateFromForm = v9->_searchURLTemplateFromForm;
      v9->_searchURLTemplateFromForm = v15;

      v17 = objc_msgSend(v12, "copy");
      openSearchDescriptionURLString = v9->_openSearchDescriptionURLString;
      v9->_openSearchDescriptionURLString = (NSString *)v17;

      objc_msgSend(v6, "safari_dateForKey:", CFSTR("DateAdded"));
      v19 = objc_claimAutoreleasedReturnValue();
      dateAdded = v9->_dateAdded;
      v9->_dateAdded = (NSDate *)v19;

      objc_msgSend(v6, "safari_dateForKey:", CFSTR("DateOfLastSearch"));
      v21 = objc_claimAutoreleasedReturnValue();
      dateOfLastSearch = v9->_dateOfLastSearch;
      v9->_dateOfLastSearch = (NSDate *)v21;

      v23 = v9;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (WBSQuickWebsiteSearchProvider)initWithSourcePageURLString:(id)a3 searchURLTemplateFromForm:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSQuickWebsiteSearchProvider *v11;
  WBSQuickWebsiteSearchProvider *v12;
  uint64_t v13;
  NSString *sourcePageURLString;
  uint64_t v15;
  NSDate *dateAdded;
  WBSQuickWebsiteSearchProvider *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WBSQuickWebsiteSearchProvider;
  v11 = -[WBSQuickWebsiteSearchProvider init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    v13 = objc_msgSend(v8, "copy");
    sourcePageURLString = v12->_sourcePageURLString;
    v12->_sourcePageURLString = (NSString *)v13;

    objc_storeStrong((id *)&v12->_searchURLTemplateFromForm, a4);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = objc_claimAutoreleasedReturnValue();
    dateAdded = v12->_dateAdded;
    v12->_dateAdded = (NSDate *)v15;

    v17 = v12;
  }

  return v12;
}

- (WBSQuickWebsiteSearchProvider)initWithSourcePageURLString:(id)a3 openSearchDescriptionURLString:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSQuickWebsiteSearchProvider *v11;
  WBSQuickWebsiteSearchProvider *v12;
  uint64_t v13;
  NSString *sourcePageURLString;
  uint64_t v15;
  NSString *openSearchDescriptionURLString;
  uint64_t v17;
  NSDate *dateAdded;
  WBSQuickWebsiteSearchProvider *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WBSQuickWebsiteSearchProvider;
  v11 = -[WBSQuickWebsiteSearchProvider init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    v13 = objc_msgSend(v8, "copy");
    sourcePageURLString = v12->_sourcePageURLString;
    v12->_sourcePageURLString = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    openSearchDescriptionURLString = v12->_openSearchDescriptionURLString;
    v12->_openSearchDescriptionURLString = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = objc_claimAutoreleasedReturnValue();
    dateAdded = v12->_dateAdded;
    v12->_dateAdded = (NSDate *)v17;

    v19 = v12;
  }

  return v12;
}

- (WBSOpenSearchDescription)openSearchDescription
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "quickWebsiteSearchProvider:openSearchDescriptionForOpenSearchDescriptionURLString:", self, self->_openSearchDescriptionURLString);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSOpenSearchDescription *)v4;
}

- (WBSOpenSearchURLTemplate)searchURLTemplate
{
  void *v3;
  WBSOpenSearchURLTemplate *v4;

  if (!self->_openSearchDescriptionURLString
    || (-[WBSQuickWebsiteSearchProvider openSearchDescription](self, "openSearchDescription"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "searchURLTemplate"),
        v4 = (WBSOpenSearchURLTemplate *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v4 = self->_searchURLTemplateFromForm;
  }
  return v4;
}

- (WBSOpenSearchURLTemplate)urlTemplateForSuggestionsInJSON
{
  void *v2;
  void *v3;

  -[WBSQuickWebsiteSearchProvider openSearchDescription](self, "openSearchDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlTemplateForSuggestionsInJSON");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSOpenSearchURLTemplate *)v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  WBSOpenSearchURLTemplate *searchURLTemplateFromForm;
  void *v5;
  NSDate *dateAdded;
  NSDate *dateOfLastSearch;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", self->_sourcePageURLString, CFSTR("SourcePageURLString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  searchURLTemplateFromForm = self->_searchURLTemplateFromForm;
  if (searchURLTemplateFromForm)
  {
    -[WBSOpenSearchURLTemplate templateString](searchURLTemplateFromForm, "templateString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("SearchURLTemplateStringFromForm"));

  }
  if (-[NSString length](self->_openSearchDescriptionURLString, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_openSearchDescriptionURLString, CFSTR("OpenSearchDescriptionURLString"));
  dateAdded = self->_dateAdded;
  if (dateAdded)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", dateAdded, CFSTR("DateAdded"));
  dateOfLastSearch = self->_dateOfLastSearch;
  if (dateOfLastSearch)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", dateOfLastSearch, CFSTR("DateOfLastSearch"));
  return v3;
}

- (NSString)displayName
{
  NSString *displayName;
  void *v4;
  NSString *v5;
  NSString *v6;

  displayName = self->_displayName;
  if (!displayName)
  {
    -[NSString safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:](self->_sourcePageURLString, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_domainFromHost");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_displayName;
    self->_displayName = v5;

    displayName = self->_displayName;
  }
  return displayName;
}

- (NSString)hostname
{
  NSString *hostname;
  void *v4;
  NSString *v5;
  NSString *v6;

  hostname = self->_hostname;
  if (!hostname)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_sourcePageURLString);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "host");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_hostname;
    self->_hostname = v5;

    hostname = self->_hostname;
  }
  return hostname;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSQuickWebsiteSearchProvider displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; display name = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)sourcePageURLString
{
  return self->_sourcePageURLString;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (WBSOpenSearchURLTemplate)searchURLTemplateFromForm
{
  return self->_searchURLTemplateFromForm;
}

- (void)setSearchURLTemplateFromForm:(id)a3
{
  objc_storeStrong((id *)&self->_searchURLTemplateFromForm, a3);
}

- (NSString)openSearchDescriptionURLString
{
  return self->_openSearchDescriptionURLString;
}

- (void)setOpenSearchDescriptionURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)dateOfLastSearch
{
  return self->_dateOfLastSearch;
}

- (void)setDateOfLastSearch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastSearch, 0);
  objc_storeStrong((id *)&self->_openSearchDescriptionURLString, 0);
  objc_storeStrong((id *)&self->_searchURLTemplateFromForm, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_sourcePageURLString, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
