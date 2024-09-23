@implementation WFLinkSnippetDialogResponse

- (WFLinkSnippetDialogResponse)initWithResponseCode:(int64_t)a3
{
  WFLinkSnippetDialogResponse *v3;
  WFLinkSnippetDialogResponse *v4;
  WFLinkSnippetDialogResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFLinkSnippetDialogResponse;
  v3 = -[WFDialogResponse initWithResponseCode:](&v7, sel_initWithResponseCode_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_snippetResponseCode = 0;
    v5 = v3;
  }

  return v4;
}

- (WFLinkSnippetDialogResponse)initWithCancelled:(BOOL)a3
{
  WFLinkSnippetDialogResponse *v3;
  WFLinkSnippetDialogResponse *v4;
  WFLinkSnippetDialogResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFLinkSnippetDialogResponse;
  v3 = -[WFDialogResponse initWithCancelled:](&v7, sel_initWithCancelled_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_snippetResponseCode = 0;
    v5 = v3;
  }

  return v4;
}

- (WFLinkSnippetDialogResponse)initWithRequestedOpenURL:(id)a3
{
  id v4;
  WFLinkSnippetDialogResponse *v5;
  WFLinkSnippetDialogResponse *v6;
  uint64_t v7;
  NSURL *requestedOpenURL;
  WFLinkSnippetDialogResponse *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFLinkSnippetDialogResponse;
  v5 = -[WFDialogResponse initWithResponseCode:](&v11, sel_initWithResponseCode_, 0);
  v6 = v5;
  if (v5)
  {
    v5->_snippetResponseCode = 0;
    v7 = objc_msgSend(v4, "copy");
    requestedOpenURL = v6->_requestedOpenURL;
    v6->_requestedOpenURL = (NSURL *)v7;

    v9 = v6;
  }

  return v6;
}

- (WFLinkSnippetDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFLinkSnippetDialogResponse *v5;
  uint64_t v6;
  NSURL *requestedOpenURL;
  WFLinkSnippetDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSnippetDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_snippetResponseCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("snippetResponseCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedOpenURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestedOpenURL = v5->_requestedOpenURL;
    v5->_requestedOpenURL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFLinkSnippetDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFLinkSnippetDialogResponse snippetResponseCode](self, "snippetResponseCode", v6.receiver, v6.super_class), CFSTR("snippetResponseCode"));
  -[WFLinkSnippetDialogResponse requestedOpenURL](self, "requestedOpenURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestedOpenURL"));

}

- (WFLinkSnippetDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFLinkSnippetDialogResponse *v5;
  uint64_t v6;
  NSURL *requestedOpenURL;
  WFLinkSnippetDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSnippetDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v10, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v5->_snippetResponseCode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("snippetResponseCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedOpenURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestedOpenURL = v5->_requestedOpenURL;
    v5->_requestedOpenURL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFLinkSnippetDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFLinkSnippetDialogResponse snippetResponseCode](self, "snippetResponseCode", v6.receiver, v6.super_class), CFSTR("snippetResponseCode"));
  -[WFLinkSnippetDialogResponse requestedOpenURL](self, "requestedOpenURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestedOpenURL"));

}

- (unint64_t)snippetResponseCode
{
  return self->_snippetResponseCode;
}

- (NSURL)requestedOpenURL
{
  return self->_requestedOpenURL;
}

- (void)setRequestedOpenURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedOpenURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end
