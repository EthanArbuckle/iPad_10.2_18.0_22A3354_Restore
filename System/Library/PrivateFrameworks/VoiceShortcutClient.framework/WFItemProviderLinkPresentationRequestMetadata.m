@implementation WFItemProviderLinkPresentationRequestMetadata

- (void)fetchLinkMetadataWithCompletion:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[WFItemProviderLinkPresentationRequestMetadata linkPresentationMetadata](self, "linkPresentationMetadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (WFItemProviderLinkPresentationRequestMetadata)initWithLinkPresentationMetadata:(id)a3
{
  id v6;
  WFItemProviderLinkPresentationRequestMetadata *v7;
  WFItemProviderLinkPresentationRequestMetadata *v8;
  WFItemProviderLinkPresentationRequestMetadata *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFItemProviderRequestMetadata.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("linkPresentationMetadata"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFItemProviderLinkPresentationRequestMetadata;
  v7 = -[WFItemProviderLinkPresentationRequestMetadata init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_linkPresentationMetadata, a3);
    v9 = v8;
  }

  return v8;
}

- (id)registeredTypeIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CBD520];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFItemProviderLinkPresentationRequestMetadata linkPresentationMetadata](self, "linkPresentationMetadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("linkPresentationMetadata"));

}

- (WFItemProviderLinkPresentationRequestMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFItemProviderLinkPresentationRequestMetadata *v6;

  v4 = a3;
  getLPLinkMetadataClass();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkPresentationMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[WFItemProviderLinkPresentationRequestMetadata initWithLinkPresentationMetadata:](self, "initWithLinkPresentationMetadata:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (LPLinkMetadata)linkPresentationMetadata
{
  return self->_linkPresentationMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkPresentationMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
