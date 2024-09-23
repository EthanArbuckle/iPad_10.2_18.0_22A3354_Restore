@implementation PRSPosterGallerySection

- (PRSPosterGallerySection)initWithType:(int64_t)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5 localizedDescriptiveText:(id)a6 symbolImageName:(id)a7 symbolColorName:(id)a8 unityDescription:(id)a9 items:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PRSPosterGallerySection *v23;
  PRSPosterGallerySection *v24;
  uint64_t v25;
  NSString *localizedTitle;
  uint64_t v27;
  NSString *localizedSubtitle;
  uint64_t v29;
  NSString *localizedDescriptiveText;
  uint64_t v31;
  NSString *symbolImageName;
  uint64_t v33;
  NSString *symbolColorName;
  uint64_t v35;
  NSString *unityDescription;
  uint64_t v37;
  NSArray *items;
  objc_super v40;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v40.receiver = self;
  v40.super_class = (Class)PRSPosterGallerySection;
  v23 = -[PRSPosterGallerySection init](&v40, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_type = a3;
    v25 = objc_msgSend(v16, "copy");
    localizedTitle = v24->_localizedTitle;
    v24->_localizedTitle = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    localizedSubtitle = v24->_localizedSubtitle;
    v24->_localizedSubtitle = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    localizedDescriptiveText = v24->_localizedDescriptiveText;
    v24->_localizedDescriptiveText = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    symbolImageName = v24->_symbolImageName;
    v24->_symbolImageName = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    symbolColorName = v24->_symbolColorName;
    v24->_symbolColorName = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    unityDescription = v24->_unityDescription;
    v24->_unityDescription = (NSString *)v35;

    v37 = objc_msgSend(v22, "copy");
    items = v24->_items;
    v24->_items = (NSArray *)v37;

  }
  return v24;
}

- (PRSPosterGallerySection)initWithProactiveRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PRSPosterGallerySection *v15;

  v4 = a3;
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_map:", &__block_literal_global_6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "type");
  if ((unint64_t)(v7 - 1) >= 3)
    v8 = 0;
  else
    v8 = v7;
  objc_msgSend(v4, "localizedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedSubtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescriptiveText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolImageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolColorName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unityDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PRSPosterGallerySection initWithType:localizedTitle:localizedSubtitle:localizedDescriptiveText:symbolImageName:symbolColorName:unityDescription:items:](self, "initWithType:localizedTitle:localizedSubtitle:localizedDescriptiveText:symbolImageName:symbolColorName:unityDescription:items:", v8, v9, v10, v11, v12, v13, v14, v6);

  return v15;
}

uint64_t __59__PRSPosterGallerySection_initWithProactiveRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "posterBoardRepresentation");
}

- (id)proactiveRepresentation
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E18]), "initWithPosterBoardRepresentation:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithType:localizedTitle:localizedSubtitle:localizedDescriptiveText:symbolImageName:symbolColorName:unityDescription:items:", self->_type, self->_localizedTitle, self->_localizedSubtitle, self->_localizedDescriptiveText, self->_symbolImageName, self->_symbolColorName, self->_unityDescription, self->_items);
}

- (BOOL)isEqual:(id)a3
{
  PRSPosterGallerySection *v4;
  uint64_t v5;
  PRSPosterGallerySection *v6;
  PRSPosterGallerySection *v7;
  char v8;
  PRSPosterGallerySection *v9;
  void *v10;
  int64_t type;
  uint64_t v12;
  PRSPosterGallerySection *v13;
  id v14;
  NSString *localizedTitle;
  PRSPosterGallerySection *v16;
  id v17;
  NSString *localizedSubtitle;
  PRSPosterGallerySection *v19;
  id v20;
  NSString *localizedDescriptiveText;
  PRSPosterGallerySection *v22;
  id v23;
  NSString *symbolImageName;
  PRSPosterGallerySection *v25;
  id v26;
  NSString *symbolColorName;
  PRSPosterGallerySection *v28;
  id v29;
  NSString *unityDescription;
  id v31;
  id v32;
  NSArray *items;
  id v34;
  uint64_t v36;
  uint64_t v37;
  id (*v38)(uint64_t);
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  PRSPosterGallerySection *v46;
  _QWORD v47[4];
  PRSPosterGallerySection *v48;
  _QWORD v49[4];
  PRSPosterGallerySection *v50;
  _QWORD v51[4];
  PRSPosterGallerySection *v52;
  _QWORD v53[4];
  PRSPosterGallerySection *v54;

  v4 = (PRSPosterGallerySection *)a3;
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
      type = self->_type;
      v12 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __35__PRSPosterGallerySection_isEqual___block_invoke;
      v53[3] = &unk_1E4D426F0;
      v13 = v9;
      v54 = v13;
      v14 = (id)objc_msgSend(v10, "appendInteger:counterpart:", type, v53);
      localizedTitle = self->_localizedTitle;
      v51[0] = v12;
      v51[1] = 3221225472;
      v51[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_2;
      v51[3] = &unk_1E4D426A0;
      v16 = v13;
      v52 = v16;
      v17 = (id)objc_msgSend(v10, "appendObject:counterpart:", localizedTitle, v51);
      localizedSubtitle = self->_localizedSubtitle;
      v49[0] = v12;
      v49[1] = 3221225472;
      v49[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_3;
      v49[3] = &unk_1E4D426A0;
      v19 = v16;
      v50 = v19;
      v20 = (id)objc_msgSend(v10, "appendObject:counterpart:", localizedSubtitle, v49);
      localizedDescriptiveText = self->_localizedDescriptiveText;
      v47[0] = v12;
      v47[1] = 3221225472;
      v47[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_4;
      v47[3] = &unk_1E4D426A0;
      v22 = v19;
      v48 = v22;
      v23 = (id)objc_msgSend(v10, "appendObject:counterpart:", localizedDescriptiveText, v47);
      symbolImageName = self->_symbolImageName;
      v45[0] = v12;
      v45[1] = 3221225472;
      v45[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_5;
      v45[3] = &unk_1E4D426A0;
      v25 = v22;
      v46 = v25;
      v26 = (id)objc_msgSend(v10, "appendObject:counterpart:", symbolImageName, v45);
      symbolColorName = self->_symbolColorName;
      v43[0] = v12;
      v43[1] = 3221225472;
      v43[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_6;
      v43[3] = &unk_1E4D426A0;
      v28 = v25;
      v44 = v28;
      v29 = (id)objc_msgSend(v10, "appendObject:counterpart:", symbolColorName, v43);
      unityDescription = self->_unityDescription;
      v41[0] = v12;
      v41[1] = 3221225472;
      v41[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_7;
      v41[3] = &unk_1E4D426A0;
      v31 = v28;
      v42 = v31;
      v32 = (id)objc_msgSend(v10, "appendObject:counterpart:", unityDescription, v41);
      items = self->_items;
      v36 = v12;
      v37 = 3221225472;
      v38 = __35__PRSPosterGallerySection_isEqual___block_invoke_8;
      v39 = &unk_1E4D426A0;
      v40 = v31;
      v34 = (id)objc_msgSend(v10, "appendObject:counterpart:", items, &v36);
      v8 = objc_msgSend(v10, "isEqual", v36, v37, v38, v39);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

uint64_t __35__PRSPosterGallerySection_isEqual___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 56);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 64);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_type);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_localizedTitle);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_localizedSubtitle);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_localizedDescriptiveText);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_symbolImageName);
  v9 = (id)objc_msgSend(v3, "appendObject:", self->_symbolColorName);
  v10 = (id)objc_msgSend(v3, "appendObject:", self->_unityDescription);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = self->_items;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = (id)objc_msgSend(v3, "appendObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15++), (_QWORD)v19);
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = objc_msgSend(v3, "hash");
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGallerySection)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  PRSPosterGallerySection *v27;

  v3 = a3;
  NSStringFromSelector(sel_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", v4);

  v6 = objc_opt_class();
  NSStringFromSelector(sel_localizedTitle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  NSStringFromSelector(sel_localizedSubtitle);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  NSStringFromSelector(sel_localizedDescriptiveText);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_class();
  NSStringFromSelector(sel_symbolImageName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_opt_class();
  NSStringFromSelector(sel_symbolColorName);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_opt_class();
  NSStringFromSelector(sel_unityDescription);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_opt_class();
  NSStringFromSelector(sel_items);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[PRSPosterGallerySection initWithType:localizedTitle:localizedSubtitle:localizedDescriptiveText:symbolImageName:symbolColorName:unityDescription:items:](self, "initWithType:localizedTitle:localizedSubtitle:localizedDescriptiveText:symbolImageName:symbolColorName:unityDescription:items:", v5, v8, v11, v14, v17, v20, v23, v26);
  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;
  void *v6;
  NSString *localizedTitle;
  void *v8;
  NSString *localizedSubtitle;
  void *v10;
  NSString *localizedDescriptiveText;
  void *v12;
  NSString *symbolImageName;
  void *v14;
  NSString *symbolColorName;
  void *v16;
  NSString *unityDescription;
  void *v18;
  NSArray *items;
  id v20;

  type = self->_type;
  v5 = a3;
  NSStringFromSelector(sel_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", type, v6);

  localizedTitle = self->_localizedTitle;
  NSStringFromSelector(sel_localizedTitle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", localizedTitle, v8);

  localizedSubtitle = self->_localizedSubtitle;
  NSStringFromSelector(sel_localizedSubtitle);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", localizedSubtitle, v10);

  localizedDescriptiveText = self->_localizedDescriptiveText;
  NSStringFromSelector(sel_localizedDescriptiveText);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", localizedDescriptiveText, v12);

  symbolImageName = self->_symbolImageName;
  NSStringFromSelector(sel_symbolImageName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", symbolImageName, v14);

  symbolColorName = self->_symbolColorName;
  NSStringFromSelector(sel_symbolColorName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", symbolColorName, v16);

  unityDescription = self->_unityDescription;
  NSStringFromSelector(sel_unityDescription);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", unityDescription, v18);

  items = self->_items;
  NSStringFromSelector(sel_items);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", items, v20);

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)localizedDescriptiveText
{
  return self->_localizedDescriptiveText;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (NSString)symbolColorName
{
  return self->_symbolColorName;
}

- (NSString)unityDescription
{
  return self->_unityDescription;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_unityDescription, 0);
  objc_storeStrong((id *)&self->_symbolColorName, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_localizedDescriptiveText, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
