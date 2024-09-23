@implementation WFOnScreenContentServiceOptions

- (WFOnScreenContentServiceOptions)init
{
  void *v3;
  void *v4;
  WFOnScreenContentServiceOptions *v5;
  _OWORD v7[2];

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "if_auditToken");
  else
    memset(v7, 0, sizeof(v7));
  v5 = -[WFOnScreenContentServiceOptions initWithSupportedItemClasses:originatingProcessAuditToken:](self, "initWithSupportedItemClasses:originatingProcessAuditToken:", &unk_1E6004180, v7);

  return v5;
}

- (WFOnScreenContentServiceOptions)initWithSupportedItemClasses:(id)a3 originatingProcessAuditToken:(id *)a4
{
  id v7;
  WFOnScreenContentServiceOptions *v8;
  WFOnScreenContentServiceOptions *v9;
  __int128 v10;
  WFOnScreenContentServiceOptions *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFOnScreenContentServiceOptions;
  v8 = -[WFOnScreenContentServiceOptions init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_supportedItemClasses, a3);
    v10 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v9->_originatingProcessAuditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v9->_originatingProcessAuditToken.val[4] = v10;
    v11 = v9;
  }

  return v9;
}

- (WFOnScreenContentServiceOptions)initWithCoder:(id)a3
{
  id v4;
  WFOnScreenContentServiceOptions *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *supportedItemClasses;
  void *v11;
  void *v12;
  WFOnScreenContentServiceOptions *v13;
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFOnScreenContentServiceOptions;
  v5 = -[WFOnScreenContentServiceOptions init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("supportedItemClasses"));
    v9 = objc_claimAutoreleasedReturnValue();
    supportedItemClasses = v5->_supportedItemClasses;
    v5->_supportedItemClasses = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingProcessAuditToken"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "if_auditToken");
      *(_OWORD *)v5->_originatingProcessAuditToken.val = v15;
      *(_OWORD *)&v5->_originatingProcessAuditToken.val[4] = v16;
    }
    v13 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v8[2];

  v4 = a3;
  -[WFOnScreenContentServiceOptions supportedItemClasses](self, "supportedItemClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("supportedItemClasses"));

  v6 = *(_OWORD *)&self->_originatingProcessAuditToken.val[4];
  v8[0] = *(_OWORD *)self->_originatingProcessAuditToken.val;
  v8[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D50], "if_dataWithAuditToken:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("originatingProcessAuditToken"));

}

- (NSArray)supportedItemClasses
{
  return self->_supportedItemClasses;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)originatingProcessAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)self[1].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setOriginatingProcessAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_originatingProcessAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_originatingProcessAuditToken.val[4] = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedItemClasses, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
