@implementation SXLayoutPolicyManager

- (SXLayoutPolicyManager)initWithDocumentProvider:(id)a3 hintsConfigurationOptionProvider:(id)a4
{
  id v7;
  id v8;
  SXLayoutPolicyManager *v9;
  SXLayoutPolicyManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXLayoutPolicyManager;
  v9 = -[SXLayoutPolicyManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentProvider, a3);
    objc_storeStrong((id *)&v10->_hintsConfigurationOptionProvider, a4);
  }

  return v10;
}

- (BOOL)shouldPerformLayoutWithLayoutOptionsDiff:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  char v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;

  v3 = a3;
  if (a3)
  {
    if (a3 == 0xFFFF
      || (a3 & 0x87) != 0
      || (-[SXHintsConfigurationOptionProvider hints](self->_hintsConfigurationOptionProvider, "hints"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "ignoreConditionHints"),
          v5,
          (v6 & 1) != 0))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      -[SXLayoutPolicyManager documentProvider](self, "documentProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "document");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "conditions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v3 & 0x100) != 0
        || ((v3 & 8) != 0 ? (v12 = objc_msgSend(v11, "subscriptionStatus") != 0) : (v12 = 0),
            (v3 & 0x10) != 0 ? (v13 = objc_msgSend(v11, "subscriptionStatus") != 0) : (v13 = 0),
            v12
         || v13
         || (v3 & 0x200) != 0 && objc_msgSend(v11, "horizontalSizeClass")
         || (v3 & 0x400) != 0 && objc_msgSend(v11, "verticalSizeClass")
         || (v3 & 0x40) != 0 && objc_msgSend(v11, "testing")
         || (v3 & 0x20) != 0 && objc_msgSend(v11, "viewLocation")
         || (v3 & 0x800) != 0 && objc_msgSend(v11, "newsletter")
         || (v3 & 0x2000) != 0 && objc_msgSend(v11, "subscriptionActivationEligibility")))
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        v3 = (v3 >> 14) & 1;
      }

    }
  }
  return v3;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXHintsConfigurationOptionProvider)hintsConfigurationOptionProvider
{
  return self->_hintsConfigurationOptionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintsConfigurationOptionProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
}

@end
