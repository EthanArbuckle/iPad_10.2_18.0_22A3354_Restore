@implementation PKApplyActionContentTextItem

- (PKApplyActionContentTextItem)initWithDictionary:(id)a3
{
  id v4;
  PKApplyActionContentTextItem *v5;
  uint64_t v6;
  NSString *analyticsIdentifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  PKApplyActionContentTextItemODIDetail *v20;
  PKApplyActionContentTextItemODIDetail *v21;
  uint64_t v22;
  NSArray *odiDetails;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKApplyActionContentTextItem;
  v5 = -[PKApplyActionContentTextItem init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("analyticsIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    analyticsIdentifier = v5->_analyticsIdentifier;
    v5->_analyticsIdentifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("subtitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("odiDetails"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18);
          v20 = [PKApplyActionContentTextItemODIDetail alloc];
          v21 = -[PKApplyActionContentTextItemODIDetail initWithDictionary:](v20, "initWithDictionary:", v19, (_QWORD)v25);
          objc_msgSend(v13, "safelyAddObject:", v21);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v13, "count"))
    {
      v22 = objc_msgSend(v13, "copy");
      odiDetails = v5->_odiDetails;
      v5->_odiDetails = (NSArray *)v22;
    }
    else
    {
      odiDetails = v5->_odiDetails;
      v5->_odiDetails = 0;
    }

  }
  return v5;
}

- (id)odiAttributesDictionary
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_odiDetails;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "odiAttributesDictionary", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addEntriesFromDictionary:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  if (self->_analyticsIdentifier)
    objc_msgSend(v3, "appendString:");
  if (self->_title)
    objc_msgSend(v3, "appendString:");
  if (self->_subtitle)
    objc_msgSend(v3, "appendString:");
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSCopying *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKApplyActionContentTextItem *v5;
  uint64_t v6;
  NSString *analyticsIdentifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSArray *odiDetails;

  v5 = -[PKApplyActionContentTextItem init](+[PKApplyActionContentTextItem allocWithZone:](PKApplyActionContentTextItem, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_analyticsIdentifier, "copyWithZone:", a3);
  analyticsIdentifier = v5->_analyticsIdentifier;
  v5->_analyticsIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v10;

  v12 = -[NSArray copyWithZone:](self->_odiDetails, "copyWithZone:", a3);
  odiDetails = v5->_odiDetails;
  v5->_odiDetails = (NSArray *)v12;

  return v5;
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSArray)odiDetails
{
  return self->_odiDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiDetails, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
}

@end
