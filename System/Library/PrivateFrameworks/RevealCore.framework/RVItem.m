@implementation RVItem

- (RVItem)initWithSearchQuery:(id)a3 rangeInContext:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  RVItem *v9;
  RVItem *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RVItem;
  v9 = -[RVItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 6;
    objc_storeStrong((id *)&v9->_query, a3);
    v10->_highlightRange.location = location;
    v10->_highlightRange.length = length;
    v10->_selectionType = 0;
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v10, 0);
  }

  return v10;
}

- (RVItem)initWithURL:(id)a3 rangeInContext:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  RVItem *v9;
  RVItem *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RVItem;
  v9 = -[RVItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 1;
    objc_storeStrong((id *)&v9->_url, a3);
    v10->_highlightRange.location = location;
    v10->_highlightRange.length = length;
    v10->_selectionType = 0;
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v10, 0);
  }

  return v10;
}

- (RVItem)initWithDDResult:(id)a3
{
  id v5;
  RVItem *v6;
  RVItem *v7;
  NSUInteger v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RVItem;
  v6 = -[RVItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_ddResult, a3);
    v7->_highlightRange.location = objc_msgSend(v5, "urlificationRange");
    v7->_highlightRange.length = v8;
    v7->_selectionType = 2;
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v7, 0);
  }

  return v7;
}

- (RVItem)initWithDDResult:(id)a3 text:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  RVItem *v12;
  RVItem *v13;
  NSUInteger v14;
  void *v15;
  uint64_t v16;
  NSString *leadingText;
  uint64_t v18;
  NSString *trailingText;
  objc_super v21;

  length = a5.length;
  location = a5.location;
  v10 = a3;
  v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)RVItem;
  v12 = -[RVItem init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_type = 3;
    objc_storeStrong((id *)&v12->_ddResult, a3);
    v13->_highlightRange.location = objc_msgSend(v10, "urlificationRange");
    v13->_highlightRange.length = v14;
    v13->_selectionType = 2;
    if (v11)
    {
      v15 = (void *)objc_msgSend(v11, "copy");

      -[RVItem constrainContextSubstring:range:leading:]((uint64_t)v13, v15, 0, location, 1u);
      v16 = objc_claimAutoreleasedReturnValue();
      leadingText = v13->_leadingText;
      v13->_leadingText = (NSString *)v16;

      -[RVItem constrainContextSubstring:range:leading:]((uint64_t)v13, v15, location + length, objc_msgSend(v15, "length") - (location + length), 0);
      v18 = objc_claimAutoreleasedReturnValue();
      trailingText = v13->_trailingText;
      v13->_trailingText = (NSString *)v18;

      v11 = v15;
    }
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v13, 0);
  }

  return v13;
}

- (RVItem)initWithText:(id)a3 clickedIndex:(unint64_t)a4 selectionRanges:(id)a5 shouldUpdateSelection:(BOOL *)a6
{
  id v10;
  id v11;
  RVItem *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  NSString *originalSelectedText;
  BOOL v23;
  objc_super v24;

  v10 = a3;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)RVItem;
  v12 = -[RVItem init](&v24, sel_init);
  if (v12)
  {
    v23 = 0;
    v13 = +[RVSelection revealRangeAtIndex:selectedRanges:shouldUpdateSelection:](RVSelection, "revealRangeAtIndex:selectedRanges:shouldUpdateSelection:", a4, v11, &v23);
    v15 = v14;
    objc_msgSend(v11, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "rangeValue");
    v19 = v18;

    -[RVItem commonInitWithText:selectedRange:customURLParser:lookup:](v12, v10, v13, v15, 0);
    if (a4 >= v17 && a4 - v17 < v19 && v19 > v12->_highlightRange.length)
    {
      objc_msgSend(v10, "substringWithRange:", v17, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      originalSelectedText = v12->_originalSelectedText;
      v12->_originalSelectedText = (NSString *)v20;

    }
    if (a6)
      *a6 = v23;
  }

  return v12;
}

- (RVItem)initWithText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  RVItem *v8;
  RVItem *v9;
  objc_super v11;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RVItem;
  v8 = -[RVItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[RVItem commonInitWithText:selectedRange:customURLParser:lookup:](v8, v7, location, length, 0);

  return v9;
}

- (RVItem)initWithText:(id)a3 selectedRange:(_NSRange)a4 customURLParser:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  RVItem *v11;
  RVItem *v12;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RVItem;
  v11 = -[RVItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
    -[RVItem commonInitWithText:selectedRange:customURLParser:lookup:](v11, v9, location, length, v10);

  return v12;
}

- (RVItem)initWithClientIdentifier:(id)a3 rangeInContext:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  RVItem *v9;
  RVItem *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RVItem;
  v9 = -[RVItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 5;
    v9->_highlightRange.location = location;
    v9->_highlightRange.length = length;
    objc_storeStrong((id *)&v9->_clientIdentifier, a3);
    v10->_selectionType = 0;
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v10, 0);
  }

  return v10;
}

- (RVItem)initWithContactProperty:(int64_t)a3 value:(id)a4 rangeInContext:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  RVItem *v11;
  RVItem *v12;
  objc_super v14;

  length = a5.length;
  location = a5.location;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RVItem;
  v11 = -[RVItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = 4;
    v11->_contactPropertyType = a3;
    objc_storeStrong((id *)&v11->_contactPropertyValue, a4);
    v12->_highlightRange.location = location;
    v12->_highlightRange.length = length;
    v12->_selectionType = 0;
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v12, 0);
  }

  return v12;
}

- (RVItem)initWithCoder:(id)a3
{
  id v4;
  RVItem *v5;
  Class v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *url;
  uint64_t v12;
  uint64_t v13;
  DDScannerResult *ddResult;
  uint64_t v15;
  NSString *text;
  NSString *v17;
  NSString *v18;
  uint64_t v19;
  NSString *contactPropertyValue;
  uint64_t v21;
  NSString *clientIdentifier;
  uint64_t v23;
  NSString *leadingText;
  uint64_t v25;
  NSString *trailingText;
  uint64_t v27;
  NSString *originalSelectedText;
  objc_super v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)RVItem;
  v5 = -[RVItem init](&v30, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_normalizedType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("normalizedType"));
    v6 = NSClassFromString(CFSTR("WKSecureCodingURLWrapper"));
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      v31[0] = v6;
      v31[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("url"));
      v10 = objc_claimAutoreleasedReturnValue();
      url = v5->_url;
      v5->_url = (NSURL *)v10;

    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
      v12 = objc_claimAutoreleasedReturnValue();
      v8 = v5->_url;
      v5->_url = (NSURL *)v12;
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ddResult"));
    v13 = objc_claimAutoreleasedReturnValue();
    ddResult = v5->_ddResult;
    v5->_ddResult = (DDScannerResult *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v15 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("highlightRange"));
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      v5->_highlightRange = NSRangeFromString(v17);
    v5->_contactPropertyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contactPropertyType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactPropertyValue"));
    v19 = objc_claimAutoreleasedReturnValue();
    contactPropertyValue = v5->_contactPropertyValue;
    v5->_contactPropertyValue = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leadingText"));
    v23 = objc_claimAutoreleasedReturnValue();
    leadingText = v5->_leadingText;
    v5->_leadingText = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trailingText"));
    v25 = objc_claimAutoreleasedReturnValue();
    trailingText = v5->_trailingText;
    v5->_trailingText = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalSelectedText"));
    v27 = objc_claimAutoreleasedReturnValue();
    originalSelectedText = v5->_originalSelectedText;
    v5->_originalSelectedText = (NSString *)v27;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  DDScannerResult *ddResult;
  NSString *text;
  void *v7;
  void *v8;
  NSString *clientIdentifier;
  NSString *leadingText;
  NSString *trailingText;
  NSString *originalSelectedText;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v13, "encodeInteger:forKey:", self->_normalizedType, CFSTR("normalizedType"));
  url = self->_url;
  if (url)
    objc_msgSend(v13, "encodeObject:forKey:", url, CFSTR("url"));
  ddResult = self->_ddResult;
  if (ddResult)
    objc_msgSend(v13, "encodeObject:forKey:", ddResult, CFSTR("ddResult"));
  text = self->_text;
  v7 = v13;
  if (text)
  {
    objc_msgSend(v13, "encodeObject:forKey:", text, CFSTR("text"));
    NSStringFromRange(self->_highlightRange);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("highlightRange"));

    v7 = v13;
  }
  if (self->_contactPropertyValue)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", self->_contactPropertyType, CFSTR("contactPropertyType"));
    objc_msgSend(v13, "encodeObject:forKey:", self->_contactPropertyValue, CFSTR("contactPropertyValue"));
    v7 = v13;
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
  {
    objc_msgSend(v13, "encodeObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
    v7 = v13;
  }
  leadingText = self->_leadingText;
  if (leadingText)
  {
    objc_msgSend(v13, "encodeObject:forKey:", leadingText, CFSTR("leadingText"));
    v7 = v13;
  }
  trailingText = self->_trailingText;
  if (trailingText)
  {
    objc_msgSend(v13, "encodeObject:forKey:", trailingText, CFSTR("trailingText"));
    v7 = v13;
  }
  originalSelectedText = self->_originalSelectedText;
  if (originalSelectedText)
  {
    objc_msgSend(v13, "encodeObject:forKey:", originalSelectedText, CFSTR("originalSelectedText"));
    v7 = v13;
  }

}

- (NSString)textSearchContext
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  if (self->_highlightRange.location == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_5;
  v3 = -[NSString length](self->_text, "length");
  if (v3)
  {
    v4 = +[RVSelection searchRangeForString:aroundLocation:](RVSelection, "searchRangeForString:aroundLocation:", self->_text, self->_highlightRange.location);
    if (v5 >= 2)
    {
      -[NSString substringWithRange:](self->_text, "substringWithRange:", v4, v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v3;
    }
LABEL_5:
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSURL)normalizedURL
{
  if (self)
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)self, 0);
  return self->_url;
}

- (id)getClientHintKey:(id)a3 ofType:(Class)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[RVItem clientHints](self, "clientHints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (void)setLeadingText:(id)a3
{
  unint64_t v4;
  NSString *v5;
  NSString *leadingText;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "length");
  if (v4)
  {
    -[RVItem constrainContextSubstring:range:leading:]((uint64_t)self, v7, 0, v4, 1u);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    leadingText = self->_leadingText;
    self->_leadingText = v5;
  }
  else
  {
    leadingText = self->_leadingText;
    self->_leadingText = 0;
  }

}

- (NSString)leadingText
{
  NSString *leadingText;
  unint64_t v4;
  NSString *v5;
  NSString *v6;

  leadingText = self->_leadingText;
  if (!leadingText)
  {
    if (self->_text && self->_type == 2)
    {
      v4 = -[RVItem textContentRange]((uint64_t)self);
      -[RVItem constrainContextSubstring:range:leading:]((uint64_t)self, self->_text, 0, v4, 1u);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = self->_leadingText;
      self->_leadingText = v5;

      leadingText = self->_leadingText;
    }
    else
    {
      leadingText = 0;
    }
  }
  return leadingText;
}

- (void)setTrailingText:(id)a3
{
  unint64_t v4;
  NSString *v5;
  NSString *trailingText;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "length");
  if (v4)
  {
    -[RVItem constrainContextSubstring:range:leading:]((uint64_t)self, v7, 0, v4, 1u);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    trailingText = self->_trailingText;
    self->_trailingText = v5;
  }
  else
  {
    trailingText = self->_trailingText;
    self->_trailingText = 0;
  }

}

- (NSString)trailingText
{
  NSString *trailingText;
  uint64_t v4;
  uint64_t v5;
  NSString *v6;
  NSString *v7;

  trailingText = self->_trailingText;
  if (!trailingText)
  {
    if (self->_text && self->_type == 2)
    {
      v4 = -[RVItem textContentRange]((uint64_t)self);
      -[RVItem constrainContextSubstring:range:leading:]((uint64_t)self, self->_text, v4 + v5, -[NSString length](self->_text, "length") - (v4 + v5), 0);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_trailingText;
      self->_trailingText = v6;

      trailingText = self->_trailingText;
    }
    else
    {
      trailingText = 0;
    }
  }
  return trailingText;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)normalizedType
{
  return self->_normalizedType;
}

- (NSURL)url
{
  return self->_url;
}

- (DDScannerResult)ddResult
{
  return self->_ddResult;
}

- (RVQuery)query
{
  return self->_query;
}

- (NSString)text
{
  return self->_text;
}

- (_NSRange)highlightRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_highlightRange.length;
  location = self->_highlightRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)contactPropertyValue
{
  return self->_contactPropertyValue;
}

- (int64_t)contactPropertyType
{
  return self->_contactPropertyType;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (id)clientHints
{
  return self->_clientHints;
}

- (void)setClientHints:(id)a3
{
  objc_storeStrong(&self->_clientHints, a3);
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (NSString)originalSelectedText
{
  return self->_originalSelectedText;
}

- (void)setOriginalSelectedText:(id)a3
{
  objc_storeStrong((id *)&self->_originalSelectedText, a3);
}

- (id)textQueryProvider
{
  return self->_textQueryProvider;
}

- (void)setTextQueryProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)reportAnIssueBlock
{
  return self->_reportAnIssueBlock;
}

- (void)setReportAnIssueBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)reportAnIssueExtendedBlock
{
  return self->_reportAnIssueExtendedBlock;
}

- (void)setReportAnIssueExtendedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)reportAnIssueMetadataFetchingBlock
{
  return self->_reportAnIssueMetadataFetchingBlock;
}

- (void)setReportAnIssueMetadataFetchingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)lookupContextFetchingBlock
{
  return self->_lookupContextFetchingBlock;
}

- (void)setLookupContextFetchingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lookupContextFetchingBlock, 0);
  objc_storeStrong(&self->_reportAnIssueMetadataFetchingBlock, 0);
  objc_storeStrong(&self->_reportAnIssueExtendedBlock, 0);
  objc_storeStrong(&self->_reportAnIssueBlock, 0);
  objc_storeStrong(&self->_textQueryProvider, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
  objc_storeStrong(&self->_clientHints, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_contactPropertyValue, 0);
  objc_storeStrong((id *)&self->_originalSelectedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_ddResult, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (uint64_t)textContentRange
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 32);
    if (v2 && *(_QWORD *)(v1 + 8) == 2 && *(_QWORD *)(v1 + 16) == 3)
    {
      v3 = objc_msgSend(v2, "urlificationRange");
      return *(_QWORD *)(v1 + 64) - (v3 - objc_msgSend(*(id *)(v1 + 32), "range"));
    }
    else
    {
      return *(_QWORD *)(v1 + 64);
    }
  }
  return result;
}

- (id)constrainContextSubstring:(uint64_t)a3 range:(unint64_t)a4 leading:(unsigned __int8)a5
{
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  id v18;

  v9 = a2;
  v10 = 0;
  if (a1 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = +[RVSelection maxContextLength](RVSelection, "maxContextLength");
    v12 = a4 - v11;
    if (((a4 > v11) & a5) == 0)
      v12 = 0;
    v13 = v12 + a3;
    v14 = objc_msgSend(v9, "length");
    v10 = 0;
    if (v14 > v13)
    {
      if (a4 >= v11)
        v15 = v11;
      else
        v15 = a4;
      if (v13 + v15 <= v14)
        v16 = v15;
      else
        v16 = v14 - v13;
      if (v16)
      {
        if (v13)
          v17 = 0;
        else
          v17 = v16 == v14;
        if (v17)
        {
          v18 = v9;
        }
        else
        {
          objc_msgSend(v9, "substringWithRange:", v13);
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v10 = v18;
      }
      else
      {
        v10 = 0;
      }
    }
  }

  return v10;
}

- (void)normalizeWithParser:(uint64_t)a1 lookupOnly:(void *)a2
{
  void (**v3)(id, _OWORD *);
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int Category;
  BOOL v26;
  char HasType;
  NSRange v28;
  NSUInteger length;
  unint64_t v30;
  NSRange v31;
  uint64_t v32;
  NSRange v33;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id obj;
  uint64_t v54;
  int v55;
  unint64_t v56;
  uint64_t v57;
  __int128 v58;
  _QWORD v59[8];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_BYTE *)(a1 + 96))
  {
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a1 + 8);
    objc_msgSend((id)a1, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 16);
    if (v6 != 2)
      goto LABEL_67;
    v7 = (unint64_t *)(a1 + 64);
    if (*(_QWORD *)(a1 + 64) == 0x7FFFFFFFFFFFFFFFLL || !objc_msgSend(v4, "length"))
      goto LABEL_66;
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 72);
    v10 = +[RVSelection searchRangeForString:aroundLocation:](RVSelection, "searchRangeForString:aroundLocation:", *(_QWORD *)(a1 + 48), v8);
    if (v11 < 2)
    {
LABEL_52:
      if (!v3)
        goto LABEL_66;
      if (!v9)
      {
LABEL_56:
        *(_QWORD *)&v58 = v8;
        *((_QWORD *)&v58 + 1) = v9;
        v3[2](v3, &v58);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v42 = *(_QWORD *)(a1 + 72);
          if (v42)
          {
            if (__PAIR128__(v42, *v7) != v58)
            {
LABEL_65:

              goto LABEL_66;
            }
          }
          else
          {
            if (!*((_QWORD *)&v58 + 1))
              goto LABEL_65;
            v43 = v58;
            if (v43 >= objc_msgSend(v5, "length"))
              goto LABEL_65;
            *(_OWORD *)v7 = v58;
          }
        }
        if (v41)
        {
          v44 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v41;
          v45 = v41;

          *(_QWORD *)(a1 + 16) = 1;
          goto LABEL_65;
        }
LABEL_66:
        v6 = *(_QWORD *)(a1 + 16);
        goto LABEL_67;
      }
      v6 = *(_QWORD *)(a1 + 16);
      if (v6 == 2)
      {
        if (v9 != *(_QWORD *)(a1 + 72))
        {
LABEL_74:
          *(_BYTE *)(a1 + 96) = 1;

          goto LABEL_75;
        }
        goto LABEL_56;
      }
LABEL_67:
      if (v6 == 3)
      {
        objc_msgSend(*(id *)(a1 + 32), "coreResult");
        if (DDResultGetCategory() == 1)
        {
          v46 = (void *)DDResultCopyExtractedURL();
          if (v46)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              objc_storeStrong((id *)(a1 + 24), v47);
              *(_QWORD *)(a1 + 16) = 1;
            }

          }
        }
      }
      goto LABEL_74;
    }
    v54 = v9;
    v57 = v10;
    v48 = v11;
    objc_msgSend(v5, "substringWithRange:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v13;
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v13, "absoluteString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        objc_msgSend(v13, "scheme");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lowercaseString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(&unk_1EA908C68, "containsObject:", v17);

        if (v55)
        {
          v18 = obj;
          objc_storeStrong((id *)(a1 + 24), obj);
          *(_QWORD *)(a1 + 16) = 1;
          *(_QWORD *)(a1 + 64) = v57;
          *(_QWORD *)(a1 + 72) = v48;
LABEL_51:

          v9 = v54;
          goto LABEL_52;
        }
LABEL_12:
        v51 = v8;
        v52 = v5;
        v56 = *v7;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CE78]), "initWithScannerType:passiveIntent:", 0, 0);
        v50 = v12;
        objc_msgSend(MEMORY[0x1E0D1CE70], "scanString:range:configuration:", v12, 0x7FFFFFFFFFFFFFFFLL, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v61;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v61 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v23);
              objc_msgSend(v24, "coreResult");
              Category = DDResultGetCategory();
              if (Category)
                v26 = Category == 7;
              else
                v26 = 1;
              if (!v26)
              {
                HasType = DDResultHasType();
                if ((HasType & 1) == 0)
                {
                  v28.location = DDResultGetRangeForURLification();
                  length = v28.length;
                  v30 = v28.location + v57;
                  v31.length = *(_QWORD *)(a1 + 72);
                  if (v31.length)
                  {
                    if (v28.length >= 2 && floor((double)v28.length * 0.66) <= (double)v31.length)
                    {
                      v32 = v30 + 2;
                      if (v30 >= 2)
                        v28.location = v30 - 2;
                      else
                        v28.location = 0;
                      if (v30 >= 2)
                        v32 = 4;
                      v28.length += v32;
                      v31.location = *(_QWORD *)(a1 + 64);
                      v33 = NSIntersectionRange(v28, v31);
                      if (v33.location == *(_QWORD *)(a1 + 64) && v33.length == *(_QWORD *)(a1 + 72))
                      {
LABEL_46:
                        *(_QWORD *)(a1 + 64) = v30;
                        *(_QWORD *)(a1 + 72) = length;
                        objc_storeStrong((id *)(a1 + 32), v24);
                        *(_QWORD *)(a1 + 16) = 3;
                        goto LABEL_47;
                      }
                    }
                  }
                  else if (v56 >= v30 && v56 - v30 < v28.length)
                  {
                    goto LABEL_46;
                  }
                }
              }
              ++v23;
            }
            while (v21 != v23);
            v36 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
            v21 = v36;
          }
          while (v36);
        }
LABEL_47:

        v12 = v50;
        if (*(_QWORD *)(a1 + 16) == 2 && !*(_QWORD *)(a1 + 72))
        {
          v64 = *MEMORY[0x1E0CCE0E8];
          v37 = v64;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE168]), "initWithTagSchemes:", v38);
          objc_msgSend(v39, "setString:", v50);
          v40 = objc_msgSend(v50, "length");
          v59[0] = MEMORY[0x1E0C809B0];
          v59[1] = 3221225472;
          v59[2] = __41__RVItem_normalizeWithParser_lookupOnly___block_invoke;
          v59[3] = &unk_1EA9072C0;
          v59[6] = v48;
          v59[7] = v56;
          v59[4] = a1;
          v59[5] = v57;
          objc_msgSend(v39, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v40, 0, v37, 46, v59);

        }
        v7 = (unint64_t *)(a1 + 64);
        v5 = v52;
        v8 = v51;
        v18 = obj;
        goto LABEL_51;
      }

    }
    goto LABEL_12;
  }
LABEL_75:

}

_QWORD *__41__RVItem_normalizeWithParser_lookupOnly___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4, _BYTE *a5)
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;

  v5 = result[5] + a3;
  v6 = result[7];
  v7 = v6 >= v5;
  v8 = v6 - v5;
  if (v7)
  {
    if (v8 >= a4)
      return result;
    v9 = result[4];
    *(_QWORD *)(v9 + 64) = v5;
    *(_QWORD *)(v9 + 72) = a4;
  }
  *a5 = 1;
  return result;
}

- (void)commonInitWithText:(unint64_t)a3 selectedRange:(uint64_t)a4 customURLParser:(void *)a5 lookup:
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  id v21;

  v21 = a2;
  v9 = a5;
  a1[1] = 2;
  v10 = objc_msgSend(v21, "copy");
  v11 = (void *)a1[6];
  a1[6] = v10;

  a1[8] = a3;
  a1[9] = a4;
  a1[15] = a4 != 0;
  -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)a1, v9);
  if (!a1[15] && !a1[9] && a3 < objc_msgSend(v21, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v21, "characterAtIndex:", a3));

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v21, "length");
      v16 = a3;
      do
        v17 = v16--;
      while (v16 < v15
           && (objc_msgSend(v14, "characterIsMember:", objc_msgSend(v21, "characterAtIndex:", v16)) & 1) != 0);
      v18 = a3 + 1;
      do
      {
        v19 = v18;
        if (v18 >= v15)
          break;
        v20 = objc_msgSend(v14, "characterIsMember:", objc_msgSend(v21, "characterAtIndex:", v18));
        v18 = v19 + 1;
      }
      while ((v20 & 1) != 0);
      a1[8] = v17;
      a1[9] = v19 - v17;
      a1[2] = 2;

    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
