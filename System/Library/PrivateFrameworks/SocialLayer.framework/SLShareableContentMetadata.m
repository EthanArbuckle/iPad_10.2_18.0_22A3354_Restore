@implementation SLShareableContentMetadata

- (SLShareableContentMetadata)initWithSceneIdentifier:(id)a3 bundleIdentifier:(id)a4 representations:(id)a5 metadata:(id)a6 highlightURL:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SLShareableContentMetadata *v18;
  SLShareableContentMetadata *v19;
  uint64_t v20;
  NSArray *representations;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SLShareableContentMetadata;
  v18 = -[SLShareableContentMetadata init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sceneIdentifier, a3);
    objc_storeStrong((id *)&v19->_bundleIdentifier, a4);
    v20 = objc_msgSend(v15, "copy");
    representations = v19->_representations;
    v19->_representations = (NSArray *)v20;

    objc_storeStrong((id *)&v19->_metadata, a6);
    objc_storeStrong((id *)&v19->_highlightURL, a7);
  }

  return v19;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentMetadata sceneIdentifier](self, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sceneIdentifier=%@"), v4);

  -[SLShareableContentMetadata bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" bundleIdentifier=%@"), v5);

  -[SLShareableContentMetadata representations](self, "representations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" representations=%@"), v6);

  -[SLShareableContentMetadata highlightURL](self, "highlightURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" highlightURL=%@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLShareableContentMetadata)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  SLShareableContentMetadata *v22;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_sceneIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_bundleIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  v12 = objc_opt_class();
  NSStringFromSelector(sel_representations);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_class();
  NSStringFromSelector(sel_metadata);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC11A8], "metadataWithDataRepresentation:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_class();
  NSStringFromSelector(sel_highlightURL);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[SLShareableContentMetadata initWithSceneIdentifier:bundleIdentifier:representations:metadata:highlightURL:](self, "initWithSceneIdentifier:bundleIdentifier:representations:metadata:highlightURL:", v7, v10, v14, v18, v21);
  return v22;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[SLShareableContentMetadata sceneIdentifier](self, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sceneIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SLShareableContentMetadata bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bundleIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SLShareableContentMetadata representations](self, "representations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_representations);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v9, v10);

  -[SLShareableContentMetadata metadata](self, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_metadata);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v13);

  -[SLShareableContentMetadata highlightURL](self, "highlightURL");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_highlightURL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v14);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  SLShareableContentMetadata *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_sceneIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_bundleIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_representations);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  NSStringFromSelector(sel_metadata);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC11A8], "metadataWithDataRepresentation:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_class();
  NSStringFromSelector(sel_highlightURL);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[SLShareableContentMetadata initWithSceneIdentifier:bundleIdentifier:representations:metadata:highlightURL:](self, "initWithSceneIdentifier:bundleIdentifier:representations:metadata:highlightURL:", v7, v10, v15, v19, v22);
  v24 = objc_opt_class();
  NSStringFromSelector(sel_initiatorHandle);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentMetadata setInitiatorHandle:](v23, "setInitiatorHandle:", v26);

  v27 = objc_opt_class();
  NSStringFromSelector(sel_initiatorNameComponents);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLShareableContentMetadata setInitiatorNameComponents:](v23, "setInitiatorNameComponents:", v29);
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[SLShareableContentMetadata sceneIdentifier](self, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sceneIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SLShareableContentMetadata bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bundleIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SLShareableContentMetadata representations](self, "representations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_representations);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[SLShareableContentMetadata metadata](self, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_metadata);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v13);

  -[SLShareableContentMetadata highlightURL](self, "highlightURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_highlightURL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, v15);

  -[SLShareableContentMetadata initiatorHandle](self, "initiatorHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initiatorHandle);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, v17);

  -[SLShareableContentMetadata initiatorNameComponents](self, "initiatorNameComponents");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initiatorNameComponents);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v18);

}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)representations
{
  return self->_representations;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (NSURL)highlightURL
{
  return self->_highlightURL;
}

- (NSString)initiatorHandle
{
  return self->_initiatorHandle;
}

- (void)setInitiatorHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSPersonNameComponents)initiatorNameComponents
{
  return self->_initiatorNameComponents;
}

- (void)setInitiatorNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_initiatorNameComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatorNameComponents, 0);
  objc_storeStrong((id *)&self->_initiatorHandle, 0);
  objc_storeStrong((id *)&self->_highlightURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end
