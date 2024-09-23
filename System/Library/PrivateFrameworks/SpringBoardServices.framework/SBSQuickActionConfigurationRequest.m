@implementation SBSQuickActionConfigurationRequest

- (void)requestQuickActionControlWithQuickActionCategory:(unint64_t)a3 location:(int64_t)a4
{
  -[SBSQuickActionConfigurationRequest _requestQuickActionControlWithExtensionBundleIdentifier:containerBundleIdentifier:kind:quickActionCategory:type:location:](self, "_requestQuickActionControlWithExtensionBundleIdentifier:containerBundleIdentifier:kind:quickActionCategory:type:location:", 0, 0, 0, a3, 0, a4);
}

- (void)requestQuickActionControlWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 type:(unint64_t)a6 location:(int64_t)a7
{
  -[SBSQuickActionConfigurationRequest _requestQuickActionControlWithExtensionBundleIdentifier:containerBundleIdentifier:kind:quickActionCategory:type:location:](self, "_requestQuickActionControlWithExtensionBundleIdentifier:containerBundleIdentifier:kind:quickActionCategory:type:location:", a3, a4, a5, 3, a6, a7);
}

- (void)_requestQuickActionControlWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 quickActionCategory:(unint64_t)a6 type:(unint64_t)a7 location:(int64_t)a8
{
  id v14;
  id v15;
  SBSQuickActionControlRequest *v16;
  SBSQuickActionControlRequest *trailingQuickActionControlRequest;
  SBSQuickActionControlRequest *v18;
  id v19;

  v19 = a3;
  v14 = a4;
  v15 = a5;
  if (a8 == 1)
  {
    v18 = -[SBSQuickActionControlRequest initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:quickActionCategory:type:location:]([SBSQuickActionControlRequest alloc], "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:quickActionCategory:type:location:", v19, v14, v15, a6, a7, 1);
    trailingQuickActionControlRequest = self->_trailingQuickActionControlRequest;
    self->_trailingQuickActionControlRequest = v18;
    goto LABEL_5;
  }
  if (!a8)
  {
    v16 = -[SBSQuickActionControlRequest initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:quickActionCategory:type:location:]([SBSQuickActionControlRequest alloc], "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:quickActionCategory:type:location:", v19, v14, v15, a6, a7, 0);
    trailingQuickActionControlRequest = self->_leadingQuickActionControlRequest;
    self->_leadingQuickActionControlRequest = v16;
LABEL_5:

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_leadingQuickActionControlRequest);
  objc_storeStrong(v4 + 2, self->_trailingQuickActionControlRequest);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  SBSQuickActionControlRequest *leadingQuickActionControlRequest;
  id v5;

  leadingQuickActionControlRequest = self->_leadingQuickActionControlRequest;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", leadingQuickActionControlRequest, CFSTR("kSBSQuickActionConfigurationLeadingControlRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trailingQuickActionControlRequest, CFSTR("kSBSQuickActionConfigurationTrailingControlRequest"));

}

- (SBSQuickActionConfigurationRequest)initWithCoder:(id)a3
{
  id v4;
  SBSQuickActionConfigurationRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SBSQuickActionControlRequest *leadingQuickActionControlRequest;
  uint64_t v11;
  SBSQuickActionControlRequest *trailingQuickActionControlRequest;
  objc_super v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBSQuickActionConfigurationRequest;
  v5 = -[SBSQuickActionConfigurationRequest init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSBSQuickActionConfigurationLeadingControlRequest"));
    v9 = objc_claimAutoreleasedReturnValue();
    leadingQuickActionControlRequest = v5->_leadingQuickActionControlRequest;
    v5->_leadingQuickActionControlRequest = (SBSQuickActionControlRequest *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSBSQuickActionConfigurationTrailingControlRequest"));
    v11 = objc_claimAutoreleasedReturnValue();
    trailingQuickActionControlRequest = v5->_trailingQuickActionControlRequest;
    v5->_trailingQuickActionControlRequest = (SBSQuickActionControlRequest *)v11;

  }
  return v5;
}

- (SBSQuickActionControlRequest)leadingQuickActionControlRequest
{
  return self->_leadingQuickActionControlRequest;
}

- (SBSQuickActionControlRequest)trailingQuickActionControlRequest
{
  return self->_trailingQuickActionControlRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingQuickActionControlRequest, 0);
  objc_storeStrong((id *)&self->_leadingQuickActionControlRequest, 0);
}

@end
