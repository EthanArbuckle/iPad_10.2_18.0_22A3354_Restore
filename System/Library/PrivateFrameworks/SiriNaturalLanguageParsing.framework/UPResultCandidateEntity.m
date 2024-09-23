@implementation UPResultCandidateEntity

- (UPResultCandidateEntity)initWithRange:(_NSRange)a3 label:(id)a4 text:(id)a5 groupId:(id)a6 semanticValue:(id)a7 sharedEntityGraph:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  UPResultCandidateEntity *v17;
  UPResultCandidateEntity *v18;
  id v20;
  id v21;
  id v22;
  objc_super v23;

  length = a3.length;
  location = a3.location;
  v22 = a4;
  v21 = a5;
  v20 = a6;
  v15 = a7;
  v16 = a8;
  v23.receiver = self;
  v23.super_class = (Class)UPResultCandidateEntity;
  v17 = -[UPResultCandidateEntity init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_range.location = location;
    v17->_range.length = length;
    objc_storeStrong((id *)&v17->_label, a4);
    objc_storeStrong((id *)&v18->_text, a5);
    objc_storeStrong((id *)&v18->_groupId, a6);
    objc_storeStrong((id *)&v18->_semanticValue, a7);
    objc_storeStrong((id *)&v18->_sharedEntityGraph, a8);
  }

  return v18;
}

- (UPResultLeafNode)leafNodeRepresentation
{
  return -[UPResultLeafNode initWithLabel:andText:andSemanticValue:]([UPResultLeafNode alloc], "initWithLabel:andText:andSemanticValue:", self->_label, self->_text, self->_semanticValue);
}

- (BOOL)isHigherLevelEntity
{
  return -[NSString containsString:](self->_label, "containsString:", CFSTR("."));
}

- (NSString)higherLevelParentLabel
{
  return -[NSString substringToIndex:](self->_label, "substringToIndex:", -[NSString rangeOfString:](self->_label, "rangeOfString:", CFSTR(".")));
}

- (NSString)higherLevelChildLabel
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSString rangeOfString:](self->_label, "rangeOfString:", CFSTR("."));
  return -[NSString substringFromIndex:](self->_label, "substringFromIndex:", v3 + v4);
}

- (id)_indexedLabelRepresentation
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_groupId && -[UPResultCandidateEntity isHigherLevelEntity](self, "isHigherLevelEntity"))
  {
    v3 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    -[UPResultCandidateEntity higherLevelParentLabel](self, "higherLevelParentLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString appendString:](v3, "appendString:", v4);

    -[NSString appendString:](v3, "appendString:", CFSTR("$"));
    -[UPResultCandidateEntity groupId](self, "groupId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString appendFormat:](v3, "appendFormat:", CFSTR("%lu"), objc_msgSend(v5, "longValue"));

    -[NSString appendString:](v3, "appendString:", CFSTR("."));
    -[UPResultCandidateEntity higherLevelChildLabel](self, "higherLevelChildLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString appendString:](v3, "appendString:", v6);

  }
  else
  {
    v3 = self->_label;
  }
  return v3;
}

- (id)annotatedEntityFragmentString
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("["));
  objc_msgSend(v3, "appendString:", self->_text);
  objc_msgSend(v3, "appendString:", CFSTR("]("));
  -[UPResultCandidateEntity _indexedLabelRepresentation](self, "_indexedLabelRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  if (self->_semanticValue)
  {
    objc_msgSend(v3, "appendString:", CFSTR(":"));
    objc_msgSend(v3, "appendString:", self->_semanticValue);
  }
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)groupId
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)semanticValue
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (SIRINLUEXTERNALUsoGraph)sharedEntityGraph
{
  return (SIRINLUEXTERNALUsoGraph *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEntityGraph, 0);
  objc_storeStrong((id *)&self->_semanticValue, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
