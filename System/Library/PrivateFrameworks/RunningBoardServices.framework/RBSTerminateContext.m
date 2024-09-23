@implementation RBSTerminateContext

+ (id)defaultContextWithExplanation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExplanation:", v4);

  objc_msgSend(v5, "setReportType:", 0);
  objc_msgSend(v5, "setExceptionCode:", 3735905538);
  objc_msgSend(v5, "setPreventIfBeingDebugged:", 0);
  objc_msgSend(v5, "setMaximumTerminationResistance:", 40);
  return v5;
}

- (RBSTerminateContext)init
{
  return -[RBSTerminateContext initWithExplanation:](self, "initWithExplanation:", CFSTR("<no explanation given>"));
}

- (RBSTerminateContext)initWithExplanation:(id)a3
{
  id v4;
  RBSTerminateContext *v5;
  RBSTerminateContext *v6;
  uint64_t v7;
  NSString *explanation;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSTerminateContext;
  v5 = -[RBSTerminateContext init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_maximumTerminationResistance = 40;
    v7 = objc_msgSend(v4, "copy");
    explanation = v6->_explanation;
    v6->_explanation = (NSString *)v7;

  }
  return v6;
}

- (void)setExplanation:(id)a3
{
  NSString *v4;
  NSString *explanation;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  explanation = self->_explanation;
  self->_explanation = v4;

}

- (NSString)description
{
  NSUInteger v3;
  id v4;
  uint64_t v5;
  unsigned int exceptionDomain;
  const __CFString *v7;
  unint64_t exceptionCode;
  const __CFString *v9;
  unint64_t reportType;
  NSString *explanation;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;

  v3 = -[NSArray count](self->_attributes, "count");
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = objc_claimAutoreleasedReturnValue();
  exceptionDomain = self->_exceptionDomain;
  if (exceptionDomain)
    v7 = CFSTR(" domain:");
  else
    v7 = &stru_1E2D183D0;
  if (exceptionDomain)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_exceptionDomain);
    v31 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = &stru_1E2D183D0;
  }
  exceptionCode = self->_exceptionCode;
  v9 = CFSTR(" code:");
  if (!exceptionCode)
    v9 = &stru_1E2D183D0;
  v27 = v9;
  if (exceptionCode)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%08X"), exceptionCode);
    v29 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = &stru_1E2D183D0;
  }
  explanation = self->_explanation;
  reportType = self->_reportType;
  if (explanation)
    v12 = CFSTR(" explanation:");
  else
    v12 = &stru_1E2D183D0;
  if (explanation)
    v13 = (const __CFString *)self->_explanation;
  else
    v13 = &stru_1E2D183D0;
  v30 = v4;
  v28 = (void *)v5;
  if (reportType > 2)
    v14 = CFSTR("(undefined)");
  else
    v14 = off_1E2D17840[reportType];
  NSStringFromRBSTerminationResistance(self->_maximumTerminationResistance);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v3)
  {
    -[NSArray componentsJoinedByString:](self->_attributes, "componentsJoinedByString:", CFSTR(",\n\t"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v13;
    v25 = v14;
    v18 = (__CFString *)v29;
    v19 = v28;
    v20 = (__CFString *)v31;
    v21 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("<%@|%@%@%@%@%@%@ reportType:%@ maxTerminationResistance:%@%@%@%@>"), v28, v7, v31, v27, v29, v12, v23, v25, v16, CFSTR(" attrs:[\n\t"), v17, CFSTR("\n\t]"));

  }
  else
  {
    v24 = v13;
    v26 = v14;
    v18 = (__CFString *)v29;
    v19 = v28;
    v20 = (__CFString *)v31;
    v21 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("<%@|%@%@%@%@%@%@ reportType:%@ maxTerminationResistance:%@%@%@%@>"), v28, v7, v31, v27, v29, v12, v24, v26, v15, &stru_1E2D183D0, &stru_1E2D183D0, &stru_1E2D183D0);
  }

  if (exceptionCode)
  if (exceptionDomain)

  return (NSString *)v21;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = 0xBF58476D1CE4E5B9 * (self->_exceptionDomain ^ ((unint64_t)self->_exceptionDomain >> 30));
  v3 = self->_exceptionCode ^ (self->_exceptionCode >> 30);
  v4 = (0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * v3) ^ ((0xBF58476D1CE4E5B9 * v3) >> 27))) ^ (0x94D049BB133111EBLL * (v2 ^ (v2 >> 27)));
  return v4 ^ (v4 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  RBSTerminateContext *v4;
  uint64_t v5;
  NSString *explanation;
  NSArray *attributes;
  NSDictionary *additionalPayload;
  NSDictionary *v9;
  char v10;

  v4 = (RBSTerminateContext *)a3;
  if (self == v4)
    goto LABEL_17;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class()
    || self->_reportType != v4->_reportType
    || self->_maximumTerminationResistance != v4->_maximumTerminationResistance
    || self->_exceptionDomain != v4->_exceptionDomain
    || self->_exceptionCode != v4->_exceptionCode
    || self->_preventIfBeingDebugged != v4->_preventIfBeingDebugged
    || (explanation = self->_explanation, explanation != v4->_explanation)
    && !-[NSString isEqualToString:](explanation, "isEqualToString:")
    || (attributes = self->_attributes, attributes != v4->_attributes)
    && !-[NSArray isEqualToArray:](attributes, "isEqualToArray:"))
  {
    v10 = 0;
    goto LABEL_18;
  }
  additionalPayload = self->_additionalPayload;
  v9 = v4->_additionalPayload;
  if (additionalPayload == v9)
  {
LABEL_17:
    v10 = 1;
    goto LABEL_18;
  }
  v10 = 0;
  if (additionalPayload && v9)
    v10 = -[NSDictionary isEqual:](additionalPayload, "isEqual:");
LABEL_18:

  return v10;
}

- (BOOL)shouldTerminatePlugIns
{
  return self->_maximumTerminationResistance > 0x27u;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSTerminateContext exceptionDomain](self, "exceptionDomain"), CFSTR("_exceptionDomain"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSTerminateContext exceptionCode](self, "exceptionCode"), CFSTR("_exceptionCode"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSTerminateContext maximumTerminationResistance](self, "maximumTerminationResistance"), CFSTR("_maximumTerminationResistance"));
  objc_msgSend(v4, "encodeBool:forKey:", -[RBSTerminateContext preventIfBeingDebugged](self, "preventIfBeingDebugged"), CFSTR("_preventIfBeingDebugged"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSTerminateContext reportType](self, "reportType"), CFSTR("_reportType"));
  -[RBSTerminateContext attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_attributes"));

  -[RBSTerminateContext explanation](self, "explanation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_explanation"));

  RBSXPCPackObject(self->_additionalPayload);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeXPCObject:forKey:", v7, CFSTR("_additionalPayload"));

}

- (RBSTerminateContext)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  RBSTerminateContext *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_explanation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RBSTerminateContext initWithExplanation:](self, "initWithExplanation:", v5);

  if (v6)
  {
    -[RBSTerminateContext setExceptionDomain:](v6, "setExceptionDomain:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_exceptionDomain")));
    -[RBSTerminateContext setExceptionCode:](v6, "setExceptionCode:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_exceptionCode")));
    -[RBSTerminateContext setMaximumTerminationResistance:](v6, "setMaximumTerminationResistance:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_maximumTerminationResistance")));
    -[RBSTerminateContext setPreventIfBeingDebugged:](v6, "setPreventIfBeingDebugged:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_preventIfBeingDebugged")));
    -[RBSTerminateContext setReportType:](v6, "setReportType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_reportType")));
    v7 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v7, objc_opt_class(), CFSTR("_attributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSTerminateContext setAttributes:](v6, "setAttributes:", v8);

    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("_additionalPayload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    RBSXPCUnpackObject(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSTerminateContext setAdditionalPayload:](v6, "setAdditionalPayload:", v10);

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RBSTerminateContext *v4;

  v4 = -[RBSTerminateContext initWithExplanation:](+[RBSTerminateContext allocWithZone:](RBSTerminateContext, "allocWithZone:", a3), "initWithExplanation:", self->_explanation);
  -[RBSTerminateContext setExceptionCode:](v4, "setExceptionCode:", self->_exceptionCode);
  -[RBSTerminateContext setExceptionDomain:](v4, "setExceptionDomain:", self->_exceptionDomain);
  -[RBSTerminateContext setMaximumTerminationResistance:](v4, "setMaximumTerminationResistance:", self->_maximumTerminationResistance);
  -[RBSTerminateContext setPreventIfBeingDebugged:](v4, "setPreventIfBeingDebugged:", self->_preventIfBeingDebugged);
  -[RBSTerminateContext setReportType:](v4, "setReportType:", self->_reportType);
  -[RBSTerminateContext setAttributes:](v4, "setAttributes:", self->_attributes);
  -[RBSTerminateContext setAdditionalPayload:](v4, "setAdditionalPayload:", self->_additionalPayload);
  return v4;
}

- (NSDictionary)additionalPayload
{
  return self->_additionalPayload;
}

- (void)setAdditionalPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)explanation
{
  return self->_explanation;
}

- (unint64_t)reportType
{
  return self->_reportType;
}

- (void)setReportType:(unint64_t)a3
{
  self->_reportType = a3;
}

- (unsigned)exceptionDomain
{
  return self->_exceptionDomain;
}

- (void)setExceptionDomain:(unsigned int)a3
{
  self->_exceptionDomain = a3;
}

- (unint64_t)exceptionCode
{
  return self->_exceptionCode;
}

- (void)setExceptionCode:(unint64_t)a3
{
  self->_exceptionCode = a3;
}

- (unsigned)maximumTerminationResistance
{
  return self->_maximumTerminationResistance;
}

- (void)setMaximumTerminationResistance:(unsigned __int8)a3
{
  self->_maximumTerminationResistance = a3;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)preventIfBeingDebugged
{
  return self->_preventIfBeingDebugged;
}

- (void)setPreventIfBeingDebugged:(BOOL)a3
{
  self->_preventIfBeingDebugged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_additionalPayload, 0);
}

@end
