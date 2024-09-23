@implementation WFLinkSnippetDialogRequest

- (WFLinkSnippetDialogRequest)initWithViewSnippet:(id)a3 attribution:(id)a4
{
  id v6;
  WFLinkSnippetDialogRequest *v7;
  uint64_t v8;
  LNViewSnippet *viewSnippet;
  WFLinkSnippetDialogRequest *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFLinkSnippetDialogRequest;
  v7 = -[WFDialogRequest initWithAttribution:prompt:](&v12, sel_initWithAttribution_prompt_, a4, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    viewSnippet = v7->_viewSnippet;
    v7->_viewSnippet = (LNViewSnippet *)v8;

    v10 = v7;
  }

  return v7;
}

- (WFLinkSnippetDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFLinkSnippetDialogRequest *v5;
  uint64_t v6;
  LNViewSnippet *viewSnippet;
  WFLinkSnippetDialogRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSnippetDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("viewSnippet"));
    v6 = objc_claimAutoreleasedReturnValue();
    viewSnippet = v5->_viewSnippet;
    v5->_viewSnippet = (LNViewSnippet *)v6;

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
  v6.super_class = (Class)WFLinkSnippetDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFLinkSnippetDialogRequest viewSnippet](self, "viewSnippet", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("viewSnippet"));

}

- (LNViewSnippet)viewSnippet
{
  return self->_viewSnippet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewSnippet, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
