@implementation WFConditionalSubjectValue

- (WFConditionalSubjectValue)initWithContent:(id)a3 contentType:(int64_t)a4 caseInsensitive:(BOOL)a5 comparableTimeUnits:(unint64_t)a6
{
  id v12;
  WFConditionalSubjectValue *v13;
  WFConditionalSubjectValue *v14;
  WFConditionalSubjectValue *v15;
  void *v17;
  objc_super v18;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConditionalSubjectParameterState.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("content"));

  }
  v18.receiver = self;
  v18.super_class = (Class)WFConditionalSubjectValue;
  v13 = -[WFConditionalSubjectValue init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_content, a3);
    v14->_caseInsensitive = a5;
    v14->_contentType = a4;
    v14->_comparableTimeUnits = a6;
    v15 = v14;
  }

  return v14;
}

- (WFConditionalSubjectValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  WFConditionalSubjectValue *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentType"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("caseInsensitive"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("comparableTimeUnits"));

  if (v5)
  {
    v9 = -[WFConditionalSubjectValue initWithContent:contentType:caseInsensitive:comparableTimeUnits:](self, "initWithContent:contentType:caseInsensitive:comparableTimeUnits:", v5, v6, v7, v8);
  }
  else
  {
    v10 = (void *)objc_opt_new();
    v9 = -[WFConditionalSubjectValue initWithContent:contentType:caseInsensitive:comparableTimeUnits:](self, "initWithContent:contentType:caseInsensitive:comparableTimeUnits:", v10, v6, v7, v8);

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WFConditionalSubjectValue content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("content"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[WFConditionalSubjectValue contentType](self, "contentType"), CFSTR("contentType"));
  objc_msgSend(v5, "encodeBool:forKey:", -[WFConditionalSubjectValue isCaseInsensitive](self, "isCaseInsensitive"), CFSTR("caseInsensitive"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[WFConditionalSubjectValue comparableTimeUnits](self, "comparableTimeUnits"), CFSTR("comparableTimeUnits"));

}

- (WFContentCollection)content
{
  return self->_content;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (BOOL)isCaseInsensitive
{
  return self->_caseInsensitive;
}

- (unint64_t)comparableTimeUnits
{
  return self->_comparableTimeUnits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
