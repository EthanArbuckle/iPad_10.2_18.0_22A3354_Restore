@implementation WTTextSuggestion

- (WTTextSuggestion)initWithOriginalRange:(_NSRange)a3 replacement:(id)a4 suggestionCategory:(id)a5 suggestionShortDescription:(id)a6 suggestionDescription:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  id v16;
  WTTextSuggestion *v17;
  NSUUID *v18;
  NSUUID *uuid;
  uint64_t v20;
  NSString *replacement;
  uint64_t v22;
  NSString *suggestionCategory;
  uint64_t v24;
  NSString *suggestionShortDescription;
  uint64_t v26;
  NSString *suggestionDescription;
  objc_super v29;

  length = a3.length;
  location = a3.location;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)WTTextSuggestion;
  v17 = -[WTTextSuggestion init](&v29, sel_init);
  if (v17)
  {
    v18 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    uuid = v17->_uuid;
    v17->_uuid = v18;

    v17->_originalRange.location = location;
    v17->_originalRange.length = length;
    v20 = objc_msgSend(v13, "copy");
    replacement = v17->_replacement;
    v17->_replacement = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    suggestionCategory = v17->_suggestionCategory;
    v17->_suggestionCategory = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    suggestionShortDescription = v17->_suggestionShortDescription;
    v17->_suggestionShortDescription = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    suggestionDescription = v17->_suggestionDescription;
    v17->_suggestionDescription = (NSString *)v26;

    v17->_state = 0;
  }

  return v17;
}

- (WTTextSuggestion)initWithOriginalRange:(_NSRange)a3 replacement:(id)a4 suggestionDescription:(id)a5
{
  return -[WTTextSuggestion initWithOriginalRange:replacement:suggestionCategory:suggestionShortDescription:suggestionDescription:](self, "initWithOriginalRange:replacement:suggestionCategory:suggestionShortDescription:suggestionDescription:", a3.location, a3.length, a4, 0, 0, a5);
}

- (WTTextSuggestion)initWithOriginalRange:(_NSRange)a3 replacement:(id)a4
{
  return -[WTTextSuggestion initWithOriginalRange:replacement:suggestionCategory:suggestionShortDescription:suggestionDescription:](self, "initWithOriginalRange:replacement:suggestionCategory:suggestionShortDescription:suggestionDescription:", a3.location, a3.length, a4, 0, 0, 0);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[WTTextSuggestion uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return -[WTTextSuggestion state](self, "state") + 257 * v4;
}

- (BOOL)isEqual:(id)a3
{
  WTTextSuggestion *v4;
  WTTextSuggestion *v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;

  v4 = (WTTextSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WTTextSuggestion uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTTextSuggestion uuid](v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[WTTextSuggestion state](self, "state");
      v9 = v8 == -[WTTextSuggestion state](v5, "state");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(CFSTR("WTTextSuggestionKey"), "UTF8String");
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

}

- (WTTextSuggestion)initWithXPCDictionary:(id)a3
{
  id v4;
  WTTextSuggestion *v5;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(CFSTR("WTTextSuggestionKey"), "UTF8String");
  BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  v5 = (WTTextSuggestion *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[WTTextSuggestion uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("WTSessionCodingKeyUUID"));

  v5 = (void *)MEMORY[0x24BDD1968];
  v6 = -[WTTextSuggestion originalRange](self, "originalRange");
  objc_msgSend(v5, "valueWithRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("WTSessionCodingKeyOriginalRange"));

  -[WTTextSuggestion replacement](self, "replacement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("WTSessionCodingKeyReplacement"));

  -[WTTextSuggestion suggestionCategory](self, "suggestionCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("WTSessionCodingKeySuggestionCategory"));

  -[WTTextSuggestion suggestionShortDescription](self, "suggestionShortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("WTSessionCodingKeySuggestionShortDescription"));

  -[WTTextSuggestion suggestionDescription](self, "suggestionDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("WTSessionCodingKeySuggestionDescription"));

  objc_msgSend(v13, "encodeInt64:forKey:", -[WTTextSuggestion state](self, "state"), CFSTR("WTSessionCodingKeyState"));
}

- (WTTextSuggestion)initWithCoder:(id)a3
{
  id v4;
  WTTextSuggestion *v5;
  uint64_t v6;
  NSUUID *uuid;
  void *v8;
  NSUInteger v9;
  uint64_t v10;
  NSString *replacement;
  uint64_t v12;
  NSString *suggestionCategory;
  uint64_t v14;
  NSString *suggestionShortDescription;
  uint64_t v16;
  NSString *suggestionDescription;

  v4 = a3;
  v5 = -[WTTextSuggestion init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTSessionCodingKeyUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTSessionCodingKeyOriginalRange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_originalRange.location = objc_msgSend(v8, "rangeValue");
    v5->_originalRange.length = v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTSessionCodingKeyReplacement"));
    v10 = objc_claimAutoreleasedReturnValue();
    replacement = v5->_replacement;
    v5->_replacement = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTSessionCodingKeySuggestionCategory"));
    v12 = objc_claimAutoreleasedReturnValue();
    suggestionCategory = v5->_suggestionCategory;
    v5->_suggestionCategory = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTSessionCodingKeySuggestionShortDescription"));
    v14 = objc_claimAutoreleasedReturnValue();
    suggestionShortDescription = v5->_suggestionShortDescription;
    v5->_suggestionShortDescription = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTSessionCodingKeySuggestionDescription"));
    v16 = objc_claimAutoreleasedReturnValue();
    suggestionDescription = v5->_suggestionDescription;
    v5->_suggestionDescription = (NSString *)v16;

    v5->_state = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("WTSessionCodingKeyState"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (_NSRange)originalRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_originalRange.length;
  location = self->_originalRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)replacement
{
  return self->_replacement;
}

- (NSString)suggestionCategory
{
  return self->_suggestionCategory;
}

- (NSString)suggestionShortDescription
{
  return self->_suggestionShortDescription;
}

- (NSString)suggestionDescription
{
  return self->_suggestionDescription;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionDescription, 0);
  objc_storeStrong((id *)&self->_suggestionShortDescription, 0);
  objc_storeStrong((id *)&self->_suggestionCategory, 0);
  objc_storeStrong((id *)&self->_replacement, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
