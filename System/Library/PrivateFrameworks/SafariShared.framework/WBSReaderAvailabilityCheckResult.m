@implementation WBSReaderAvailabilityCheckResult

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_readerAvailable)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (self->_isSameDocumentNavigation)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; isReaderAvailable = %@; isSameDocumentNavigation: %@"),
    v5,
    self,
    v8,
    v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSArray count](self->_textSamples, "count"))
    objc_msgSend(v9, "appendFormat:", CFSTR("; textSamples = %lu sample(s)"),
      -[NSArray count](self->_textSamples, "count"));
  if (self->_canonicalURL)
    objc_msgSend(v9, "appendFormat:", CFSTR("; canonicalURL = %@"), self->_canonicalURL);
  objc_msgSend(v9, "appendString:", CFSTR(">"));
  return v9;
}

- (NSDictionary)combinedMetadataForTests
{
  void *v3;
  void *v4;
  NSArray *textSamples;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  textSamples = self->_textSamples;
  if (textSamples)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", textSamples, CFSTR("textSamples"));
  return (NSDictionary *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v5 + 8) = self->_readerAvailable;
  *(_BYTE *)(v5 + 9) = self->_isSameDocumentNavigation;
  v6 = -[NSArray copyWithZone:](self->_textSamples, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_BYTE *)(v5 + 10) = self->_doesPageUseSearchEngineOptimizationMetadata;
  v8 = -[NSURL copyWithZone:](self->_canonicalURL, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *textSamples;
  NSURL *canonicalURL;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", self->_readerAvailable, CFSTR("isReaderAvailable"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isSameDocumentNavigation, CFSTR("isSameDocumentNavigation"));
  textSamples = self->_textSamples;
  if (textSamples)
    objc_msgSend(v6, "encodeObject:forKey:", textSamples, CFSTR("textSamples"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_doesPageUseSearchEngineOptimizationMetadata, CFSTR("doesPageUseSearchEngineOptimizationMetadata"));
  canonicalURL = self->_canonicalURL;
  if (canonicalURL)
    objc_msgSend(v6, "encodeObject:forKey:", canonicalURL, CFSTR("canonicalURL"));

}

- (WBSReaderAvailabilityCheckResult)initWithCoder:(id)a3
{
  id v4;
  WBSReaderAvailabilityCheckResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *textSamples;
  uint64_t v11;
  NSURL *canonicalURL;
  WBSReaderAvailabilityCheckResult *v13;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WBSReaderAvailabilityCheckResult;
  v5 = -[WBSReaderAvailabilityCheckResult init](&v15, sel_init);
  if (v5)
  {
    v5->_readerAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isReaderAvailable"));
    v5->_isSameDocumentNavigation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSameDocumentNavigation"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("textSamples"));
    v9 = objc_claimAutoreleasedReturnValue();
    textSamples = v5->_textSamples;
    v5->_textSamples = (NSArray *)v9;

    v5->_doesPageUseSearchEngineOptimizationMetadata = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("doesPageUseSearchEngineOptimizationMetadata"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("canonicalURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    canonicalURL = v5->_canonicalURL;
    v5->_canonicalURL = (NSURL *)v11;

    v13 = v5;
  }

  return v5;
}

- (BOOL)isReaderAvailable
{
  return self->_readerAvailable;
}

- (void)setReaderAvailable:(BOOL)a3
{
  self->_readerAvailable = a3;
}

- (BOOL)isSameDocumentNavigation
{
  return self->_isSameDocumentNavigation;
}

- (void)setIsSameDocumentNavigation:(BOOL)a3
{
  self->_isSameDocumentNavigation = a3;
}

- (NSArray)textSamples
{
  return self->_textSamples;
}

- (void)setTextSamples:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)doesPageUseSearchEngineOptimizationMetadata
{
  return self->_doesPageUseSearchEngineOptimizationMetadata;
}

- (void)setDoesPageUseSearchEngineOptimizationMetadata:(BOOL)a3
{
  self->_doesPageUseSearchEngineOptimizationMetadata = a3;
}

- (NSURL)canonicalURL
{
  return self->_canonicalURL;
}

- (void)setCanonicalURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalURL, 0);
  objc_storeStrong((id *)&self->_textSamples, 0);
}

@end
