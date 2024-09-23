@implementation HKSPProvenanceInfo

- (HKSPProvenanceInfo)initWithSource:(id)a3 presentation:(id)a4
{
  id v7;
  id v8;
  HKSPProvenanceInfo *v9;
  HKSPProvenanceInfo *v10;
  HKSPProvenanceInfo *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKSPProvenanceInfo;
  v9 = -[HKSPProvenanceInfo init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    objc_storeStrong((id *)&v10->_presentation, a4);
    v11 = v10;
  }

  return v10;
}

+ (HKSPProvenanceInfo)unknownProvenance
{
  return -[HKSPProvenanceInfo initWithSource:presentation:]([HKSPProvenanceInfo alloc], "initWithSource:presentation:", CFSTR("Unknown"), CFSTR("HKSPAnalyticsLaunchSourceUnknown"));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@.%p] source %@, presentation: %@"), v5, self, self->_source, self->_presentation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqualToProvenanceInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[HKSPProvenanceInfo source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[HKSPProvenanceInfo presentation](self, "presentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HKSPProvenanceInfo *v4;
  BOOL v5;

  v4 = (HKSPProvenanceInfo *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HKSPProvenanceInfo isEqualToProvenanceInfo:](self, "isEqualToProvenanceInfo:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKSPProvenanceInfo source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKSPProvenanceInfo presentation](self, "presentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)presentation
{
  return self->_presentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
