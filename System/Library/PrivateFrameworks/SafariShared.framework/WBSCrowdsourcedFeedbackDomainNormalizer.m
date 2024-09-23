@implementation WBSCrowdsourcedFeedbackDomainNormalizer

- (WBSCrowdsourcedFeedbackDomainNormalizer)init
{
  WBSCrowdsourcedFeedbackDomainNormalizer *v2;
  uint64_t v3;
  NSCharacterSet *dotCharacterSet;
  WBSCrowdsourcedFeedbackDomainNormalizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSCrowdsourcedFeedbackDomainNormalizer;
  v2 = -[WBSCrowdsourcedFeedbackDomainNormalizer init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("."));
    v3 = objc_claimAutoreleasedReturnValue();
    dotCharacterSet = v2->_dotCharacterSet;
    v2->_dotCharacterSet = (NSCharacterSet *)v3;

    v5 = v2;
  }

  return v2;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "host");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v5 = v4;
  }
  v6 = v5;
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", self->_dotCharacterSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safari_stringByRemovingWwwDotPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotCharacterSet, 0);
}

@end
