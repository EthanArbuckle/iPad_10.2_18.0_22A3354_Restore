@implementation PRSPosterGalleryItemPrototype

- (PRSPosterGalleryItemPrototype)initWithIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 galleryOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PRSPosterGalleryItemPrototype *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *extensionBundleIdentifier;
  uint64_t v19;
  NSString *containerBundleIdentifier;
  void *v21;
  void *v22;
  PRSPosterGalleryItemOptions *v23;
  PRSPosterGalleryItemOptions *galleryOptions;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PRSPosterGalleryItemPrototype;
  v14 = -[PRSPosterGalleryItemPrototype init](&v26, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    extensionBundleIdentifier = v14->_extensionBundleIdentifier;
    v14->_extensionBundleIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    containerBundleIdentifier = v14->_containerBundleIdentifier;
    v14->_containerBundleIdentifier = (NSString *)v19;

    v21 = (void *)objc_msgSend(v13, "copy");
    v22 = v21;
    if (v21)
      v23 = v21;
    else
      v23 = objc_alloc_init(PRSPosterGalleryItemOptions);
    galleryOptions = v14->_galleryOptions;
    v14->_galleryOptions = v23;

  }
  return v14;
}

- (PRSPosterGalleryItemPrototype)initWithProactiveRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PRSPosterGalleryItemPrototype *v10;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "galleryOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "posterBoardRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PRSPosterGalleryItemPrototype initWithIdentifier:extensionBundleIdentifier:containerBundleIdentifier:galleryOptions:](self, "initWithIdentifier:extensionBundleIdentifier:containerBundleIdentifier:galleryOptions:", v5, v6, v7, v9);

  return v10;
}

- (id)proactiveRepresentation
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9048]), "initWithPosterBoardRepresentation:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:extensionBundleIdentifier:containerBundleIdentifier:galleryOptions:", self->_identifier, self->_extensionBundleIdentifier, self->_containerBundleIdentifier, self->_galleryOptions);
}

- (BOOL)isEqual:(id)a3
{
  PRSPosterGalleryItemPrototype *v4;
  uint64_t v5;
  PRSPosterGalleryItemPrototype *v6;
  PRSPosterGalleryItemPrototype *v7;
  char v8;
  PRSPosterGalleryItemPrototype *v9;
  void *v10;
  NSString *identifier;
  uint64_t v12;
  PRSPosterGalleryItemPrototype *v13;
  id v14;
  NSString *extensionBundleIdentifier;
  PRSPosterGalleryItemPrototype *v16;
  id v17;
  NSString *containerBundleIdentifier;
  PRSPosterGalleryItemPrototype *v19;
  id v20;
  PRSPosterGalleryItemOptions *galleryOptions;
  id v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t);
  void *v27;
  PRSPosterGalleryItemPrototype *v28;
  _QWORD v29[4];
  PRSPosterGalleryItemPrototype *v30;
  _QWORD v31[4];
  PRSPosterGalleryItemPrototype *v32;
  _QWORD v33[4];
  PRSPosterGalleryItemPrototype *v34;

  v4 = (PRSPosterGalleryItemPrototype *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D01768], "builder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      v12 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke;
      v33[3] = &unk_1E4D426A0;
      v13 = v9;
      v34 = v13;
      v14 = (id)objc_msgSend(v10, "appendObject:counterpart:", identifier, v33);
      extensionBundleIdentifier = self->_extensionBundleIdentifier;
      v31[0] = v12;
      v31[1] = 3221225472;
      v31[2] = __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_2;
      v31[3] = &unk_1E4D426A0;
      v16 = v13;
      v32 = v16;
      v17 = (id)objc_msgSend(v10, "appendObject:counterpart:", extensionBundleIdentifier, v31);
      containerBundleIdentifier = self->_containerBundleIdentifier;
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_3;
      v29[3] = &unk_1E4D426A0;
      v19 = v16;
      v30 = v19;
      v20 = (id)objc_msgSend(v10, "appendObject:counterpart:", containerBundleIdentifier, v29);
      galleryOptions = self->_galleryOptions;
      v24 = v12;
      v25 = 3221225472;
      v26 = __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_4;
      v27 = &unk_1E4D426A0;
      v28 = v19;
      v22 = (id)objc_msgSend(v10, "appendObject:counterpart:", galleryOptions, &v24);
      v8 = objc_msgSend(v10, "isEqual", v24, v25, v26, v27);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

id __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_identifier);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_extensionBundleIdentifier);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_containerBundleIdentifier);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_galleryOptions);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGalleryItemPrototype)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PRSPosterGalleryItemPrototype *v17;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_extensionBundleIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_containerBundleIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  NSStringFromSelector(sel_galleryOptions);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[PRSPosterGalleryItemPrototype initWithIdentifier:extensionBundleIdentifier:containerBundleIdentifier:galleryOptions:](self, "initWithIdentifier:extensionBundleIdentifier:containerBundleIdentifier:galleryOptions:", v7, v10, v13, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  void *v6;
  NSString *extensionBundleIdentifier;
  void *v8;
  NSString *containerBundleIdentifier;
  void *v10;
  PRSPosterGalleryItemOptions *galleryOptions;
  id v12;

  identifier = self->_identifier;
  v5 = a3;
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", identifier, v6);

  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  NSStringFromSelector(sel_extensionBundleIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", extensionBundleIdentifier, v8);

  containerBundleIdentifier = self->_containerBundleIdentifier;
  NSStringFromSelector(sel_containerBundleIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", containerBundleIdentifier, v10);

  galleryOptions = self->_galleryOptions;
  NSStringFromSelector(sel_galleryOptions);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", galleryOptions, v12);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (PRSPosterGalleryItemOptions)galleryOptions
{
  return self->_galleryOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryOptions, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
