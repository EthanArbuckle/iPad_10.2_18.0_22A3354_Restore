@implementation WFLinkEntityContentItem

- (LNEntity)entity
{
  return (LNEntity *)-[WFLinkEntityContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (void)copyStateToItem:(id)a3
{
  objc_storeStrong((id *)a3 + 6, self->_displayRepresentation);
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (WFLinkEntityContentItem)initWithCoder:(id)a3
{
  id v4;
  WFLinkEntityContentItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFLinkEntityContentItem *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFLinkEntityContentItem;
  v5 = -[WFLinkEntityContentItem init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryMetadata"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityNamespace"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayedAppBundleIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "wf_contentItemClassWithQueryMetadata:appBundleIdentifier:displayedAppBundleIdentifier:", v7, v8, v9);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayRepresentation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemWithObject:", v11);
    v13 = (WFLinkEntityContentItem *)objc_claimAutoreleasedReturnValue();
    -[WFLinkEntityContentItem setDisplayRepresentation:](v13, "setDisplayRepresentation:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFLinkEntityContentItem entity](self, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entity"));

  objc_msgSend((id)objc_opt_class(), "entityMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("entityMetadata"));

  objc_msgSend((id)objc_opt_class(), "queryMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("queryMetadata"));

  objc_msgSend((id)objc_opt_class(), "appBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("appBundleIdentifier"));

  objc_msgSend((id)objc_opt_class(), "appBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("entityNamespace"));

  -[WFLinkEntityContentItem displayRepresentation](self, "displayRepresentation");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("displayRepresentation"));

}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[WFLinkEntityContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wfName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "wfName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFLinkEntityContentItem displayRepresentation](self, "displayRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wf_localizedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "localizedTypeDescription");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v10;

  }
  return v5;
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;

  v4 = (void (**)(id, void *))a3;
  -[WFLinkEntityContentItem displayRepresentation](self, "displayRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wf_localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v7)
    v4[2](v4, v7);

  return v7 != 0;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;

  v5 = (void (**)(id, void *, _QWORD))a3;
  -[WFLinkEntityContentItem displayRepresentation](self, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wf_image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v8)
    v5[2](v5, v8, 0);

  return v8 != 0;
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v8 = a3;
  v9 = a4;
  -[WFLinkEntityContentItem entity](self, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((Class)objc_opt_class() == a5)
  {
    v16 = objc_alloc(MEMORY[0x1E0D43CB0]);
    objc_msgSend(v10, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "typeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v16, "initWithIdentifier:", v18);

    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D43E38]), "initWithValue:valueType:", v10, v12);
    (*((void (**)(id, id, _QWORD, _QWORD))v8 + 2))(v8, v19, 0, 0);
    goto LABEL_26;
  }
  if ((Class)objc_opt_class() == a5 || (Class)objc_opt_class() == a5)
  {
    if (!objc_msgSend((id)objc_opt_class(), "isNoteEntity"))
    {
      objc_msgSend((id)objc_opt_class(), "entityMetadata");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "transferableContentTypes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "exportableTypes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "if_firstObjectPassingTest:", &__block_literal_global_236);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v35 = MEMORY[0x1E0C809B0];
        v36 = v8;
        objc_msgSend(v12, "wf_fileType", v35, 3221225472, __73__WFLinkEntityContentItem_generateObjectRepresentation_options_forClass___block_invoke_2, &unk_1E7AF78F8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFLinkEntityContentItem generateFileRepresentation:options:forType:](self, "generateFileRepresentation:options:forType:", &v35, v9, v23);

      }
      else
      {
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0);
      }
      goto LABEL_27;
    }
    objc_msgSend(v10, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "if_firstObjectWithValue:forKey:", CFSTR("contents"), CFSTR("identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v19 = v15;

    -[WFLinkEntityContentItem name](self, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v19 && v24)
    {
      objc_msgSend(v24, "stringByAppendingString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((Class)objc_opt_class() == a5)
      {
        objc_msgSend(v19, "string");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringByAppendingString:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, void *, void *, _QWORD))v8 + 2))(v8, v34, v25, 0);
      }
      else if ((Class)objc_opt_class() == a5)
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v26);
        v38 = 0;
        v39 = &v38;
        v40 = 0x2050000000;
        v28 = (void *)getICTextStyleClass_softClass;
        v41 = getICTextStyleClass_softClass;
        if (!getICTextStyleClass_softClass)
        {
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __getICTextStyleClass_block_invoke;
          v37[3] = &unk_1E7AF9520;
          v37[4] = &v38;
          __getICTextStyleClass_block_invoke((uint64_t)v37);
          v28 = (void *)v39[3];
        }
        v29 = objc_retainAutorelease(v28);
        _Block_object_dispose(&v38, 8);
        objc_msgSend(v29, "titleStyle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "attributes");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAttributes:range:", v31, 0, objc_msgSend(v27, "length"));

        objc_msgSend(v27, "appendAttributedString:", v19);
        v32 = (void *)objc_msgSend(v27, "copy");
        (*((void (**)(id, void *, void *, _QWORD))v8 + 2))(v8, v32, v25, 0);

      }
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0);
    }

LABEL_26:
LABEL_27:

    goto LABEL_28;
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0);
LABEL_28:

}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _OWORD v45[2];
  id v46;
  void *v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend((id)objc_opt_class(), "entityMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemProtocolMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D439E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v9, "transferableContentTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exportableTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "if_map:", &__block_literal_global_241);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  WFBestFileTypeForSupportedContentTypes(v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    goto LABEL_8;
  objc_msgSend(v13, "supportedContentTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "if_map:", &__block_literal_global_243);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  WFBestFileTypeForSupportedContentTypes(v20, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
LABEL_8:
    v40 = v16;
    objc_msgSend(MEMORY[0x1E0D44188], "policyWithEntityMetadata:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v22, "connectionWithError:", &v46);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v46;
    v25 = v24;
    if (v23)
    {
      v37 = v24;
      v38 = v13;
      v39 = v8;
      -[WFLinkEntityContentItem entity](self, "entity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43C38]), "initWithContentType:", v18);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D441E0]), "initWithContentType:preferredExtractionType:", v27, 0);
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
        objc_msgSend(v29, "if_auditToken");
      else
        memset(v45, 0, sizeof(v45));
      objc_msgSend(v28, "configurationWithAuditToken:", v45);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __70__WFLinkEntityContentItem_generateFileRepresentation_options_forType___block_invoke_247;
      v41[3] = &unk_1E7AEA0B8;
      v42 = v26;
      v44 = v7;
      v43 = v9;
      v34 = v26;
      objc_msgSend(v23, "exportEntities:metadata:withConfiguration:completionHandler:", v33, v43, v32, v41);

      v13 = v38;
      v8 = v39;
      v25 = v37;
    }
    else
    {
      getWFGeneralLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "-[WFLinkEntityContentItem generateFileRepresentation:options:forType:]";
        v50 = 2112;
        v51 = v25;
        _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
      }

      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v25);
    }

    v16 = v40;
  }
  else
  {
    getWFContentGraphLogObject();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "string");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v49 = "-[WFLinkEntityContentItem generateFileRepresentation:options:forType:]";
      v50 = 2112;
      v51 = v36;
      _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_ERROR, "%s Failed to find a best file type for %@ returning nil!", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (void)setDisplayRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_displayRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
}

void __70__WFLinkEntityContentItem_generateFileRepresentation_options_forType___block_invoke_247(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exportedContent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wf_fileRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7BA8]), "initWithEntity:metadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(v10, "setMetadata:", v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    getWFGeneralLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "-[WFLinkEntityContentItem generateFileRepresentation:options:forType:]_block_invoke";
      v16 = 2112;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Unable to fetch coerced value for entity with identifier: %@ - %@", (uint8_t *)&v14, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __70__WFLinkEntityContentItem_generateFileRepresentation_options_forType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __70__WFLinkEntityContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentType");
}

void __73__WFLinkEntityContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wf_stringWithData:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__WFLinkEntityContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CEC3F8];
  objc_msgSend(a2, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC590]);
  return v5;
}

+ (LNEntityMetadata)entityMetadata
{
  return 0;
}

+ (LNQueryMetadata)queryMetadata
{
  return 0;
}

+ (NSString)appBundleIdentifier
{
  return (NSString *)&stru_1E7AFA810;
}

+ (NSString)displayedAppBundleIdentifier
{
  return (NSString *)&stru_1E7AFA810;
}

+ (BOOL)hasInMemoryFindAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "appBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WFForcedLinkEntityFindActionIdentifiers();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsObject:", v7) & 1) != 0)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_msgSend(a1, "queryMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "capabilities") & 1;

  }
  return v9;
}

+ (void)initialize
{
  _QWORD v3[5];

  if ((id)objc_opt_class() == a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __37__WFLinkEntityContentItem_initialize__block_invoke;
    v3[3] = &__block_descriptor_40_e30__24__0__WFContentProperty_8_16l;
    v3[4] = a1;
    objc_msgSend(MEMORY[0x1E0D13EB0], "registerValueMapping:", v3);
  }
}

+ (id)propertyBuilders
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "queryMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyBuildersForFilteringUsingQuery:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)propertyBuildersForFilteringUsingQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(a1, "entityMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke;
  v10[3] = &unk_1E7AE9F70;
  v11 = v4;
  v12 = a1;
  v7 = v4;
  objc_msgSend(v6, "if_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)allProperties
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFLinkEntityContentItem;
  objc_msgSendSuper2(&v7, sel_allProperties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__WFLinkEntityContentItem_allProperties__block_invoke;
  v6[3] = &__block_descriptor_40_e30__24__0__WFContentProperty_8Q16l;
  v6[4] = a1;
  objc_msgSend(v3, "if_compactMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allowedOperatorsWithQueryParameterMetadata:(id)a3 objectClass:(Class)a4 operators:(id)a5
{
  id v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  char v17;

  v8 = a3;
  v9 = (__CFString *)objc_msgSend(a5, "copy");
  if (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsObject:", &unk_1E7B8AEA0))
    {
      objc_msgSend(v10, "addObject:", &unk_1E7B8AEB8);
      objc_msgSend(v10, "addObject:", &unk_1E7B8AED0);
      objc_msgSend(v10, "addObject:", &unk_1E7B8AEE8);
    }
    objc_msgSend(v10, "array");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)v11;
  }
  if (objc_msgSend(a1, "isNotes"))
  {
    objc_msgSend(v8, "propertyIdentifier");
    v12 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 == CFSTR("creationDate")
      || v12
      && (v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("creationDate")),
          v13,
          (v14 & 1) != 0)
      || (objc_msgSend(v8, "propertyIdentifier"),
          v15 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
          v15 == CFSTR("modificationDate")))
    {

    }
    else
    {
      v16 = v15;
      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("modificationDate"));

      if ((v17 & 1) == 0)
        goto LABEL_16;
    }
    -[__CFString if_arrayByRemovingObjectsInArray:](v9, "if_arrayByRemovingObjectsInArray:", &unk_1E7B8D310);
    v13 = v9;
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_16:

  return v9;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)typeDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "entityMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithPluralizationNumber:forLocaleIdentifier:", &unk_1E7B8AF30, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pluralTypeDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "entityMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithPluralizationNumber:forLocaleIdentifier:", &unk_1E7B8AF48, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)localizedCountDescriptionWithValue:(int64_t)a3
{
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "entityMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numericFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithReplacements:forLocaleIdentifier:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "pluralTypeDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedLowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), v12, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (BOOL)hasLibrary
{
  void *v3;
  char v4;

  objc_msgSend(a1, "queryMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = objc_msgSend(a1, "hasInMemoryFindAction");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isCalendarEntity
{
  void *v3;
  int v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  objc_msgSend(a1, "appBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC7E90]);

  if (v4)
  {
    objc_msgSend(a1, "entityMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == CFSTR("EventEntity"))
    {
      LOBYTE(v4) = 1;
    }
    else if (v6)
    {
      LOBYTE(v4) = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("EventEntity"));
    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  return v4;
}

+ (BOOL)isWorkflowEntity
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(a1, "appBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = VCIsShortcutsAppBundleIdentifier();

  if (v4)
  {
    objc_msgSend(a1, "entityMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0D14290];
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
      if (v8 && v9)
        LOBYTE(v4) = objc_msgSend(v8, "isEqualToString:", v9);
    }

  }
  return v4;
}

+ (id)coercions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  if (objc_msgSend(a1, "isCalendarEntity"))
  {
    v4 = (void *)MEMORY[0x1E0D13E40];
    objc_msgSend(MEMORY[0x1E0D14020], "typeWithClassName:frameworkName:location:", CFSTR("EKEvent"), CFSTR("EventKit"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "eventCoercionHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coercionToType:handler:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (objc_msgSend(a1, "isWorkflowEntity"))
  {
    v8 = (void *)MEMORY[0x1E0D13E40];
    objc_msgSend(MEMORY[0x1E0D14020], "typeWithClassName:frameworkName:location:", CFSTR("WFWorkflowReference"), CFSTR("WorkflowKit"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "workflowCoercionHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coercionToType:handler:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

+ (id)eventCoercionHandler
{
  return (id)objc_msgSend(MEMORY[0x1E0D13E48], "block:", &__block_literal_global_226);
}

+ (id)workflowCoercionHandler
{
  return (id)objc_msgSend(MEMORY[0x1E0D13E48], "block:", &__block_literal_global_227);
}

+ (id)outputTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  objc_super v26;

  v26.receiver = a1;
  v26.super_class = (Class)&OBJC_METACLASS___WFLinkEntityContentItem;
  objc_msgSendSuper2(&v26, sel_outputTypes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  if (objc_msgSend(a1, "isNoteEntity"))
  {
    objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertObject:atIndex:", v6, 0);

  }
  objc_msgSend(a1, "entityMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transferableContentTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exportableTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "if_map:", &__block_literal_global_253);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v13 = (void *)v10;
  else
    v13 = (void *)MEMORY[0x1E0C9AA60];
  v14 = v13;

  objc_msgSend(v4, "addObjectsFromArray:", v14);
  objc_msgSend(a1, "entityMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "systemProtocolMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D439E8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  objc_msgSend(v19, "supportedContentTypes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "if_map:", &__block_literal_global_255);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (void *)v21;
  else
    v23 = v12;
  v24 = v23;

  objc_msgSend(v4, "addObjectsFromArray:", v24);
  return v4;
}

uint64_t __38__WFLinkEntityContentItem_outputTypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", a2);
}

uint64_t __38__WFLinkEntityContentItem_outputTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wf_fileType");
}

id __50__WFLinkEntityContentItem_workflowCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if (objc_msgSend((id)objc_opt_class(), "isWorkflowEntity"))
  {
    objc_msgSend(v2, "entity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "instanceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "referenceForWorkflowID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __47__WFLinkEntityContentItem_eventCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if (objc_msgSend((id)objc_opt_class(), "isCalendarEntity"))
  {
    objc_msgSend(v2, "entity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "instanceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    WFGetWorkflowEventStore();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventWithIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __40__WFLinkEntityContentItem_allProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0D14280]);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "namePropertyBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filterable:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortable:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "build");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v9 = v3;
    }
    else
    {
      getWFAppIntentsLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 136315394;
        v16 = "+[WFLinkEntityContentItem allProperties]_block_invoke";
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Ignoring entity property '%@' because it doesn't have a title.", (uint8_t *)&v15, 0x16u);

      }
      v9 = 0;
    }
  }

  return v9;
}

id __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v92;
  void *v93;
  void *v94;
  NSObject *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  unsigned int v102;
  unsigned int v103;
  char isKindOfClass;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  NSObject *v109;
  _QWORD aBlock[4];
  id v111;
  id v112;
  _QWORD v113[4];
  id v114;
  uint64_t v115;
  _QWORD v116[4];
  id v117;
  uint64_t v118;
  uint8_t buf[4];
  const char *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  void *v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wf_objectClass");

  if (v5 == objc_opt_class())
  {
    objc_msgSend(v3, "valueType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wf_entityValueType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "appBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "entityMetadataByAppBundleIdentifier:entityIdentifier:", v14, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "queryMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "appBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "displayedAppBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v16, "wf_contentItemClassWithQueryMetadata:appBundleIdentifier:displayedAppBundleIdentifier:", v17, v18, v19);

LABEL_13:
LABEL_14:

    goto LABEL_15;
  }
  v6 = objc_opt_class();
  objc_msgSend(v3, "valueType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 == v6)
  {
    objc_msgSend(v7, "wf_enumValueType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "appBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enumerationIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "enumMetadataByAppBundleIdentifier:enumIdentifier:", v24, v25);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "appBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v16, "wf_contentItemClassWithAppBundleIdentifier:", v17);
    goto LABEL_13;
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      objc_msgSend(v3, "valueType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v16 = v10;

      objc_msgSend(*(id *)(a1 + 40), "appBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v16, "wf_contentItemClassWithAppBundleIdentifier:", v12);
      goto LABEL_14;
    }
  }

  objc_msgSend(MEMORY[0x1E0D13ED0], "sharedRegistry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "contentItemClassForType:", v21);

  if (!v22)
    goto LABEL_51;
LABEL_15:
  if (!v5)
  {
    getWFAppIntentsLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "valueType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v120 = "+[WFLinkEntityContentItem propertyBuildersForFilteringUsingQuery:]_block_invoke";
      v121 = 2112;
      v122 = v35;
      v123 = 2112;
      v124 = v36;
      _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_FAULT, "%s Unable to get object class for entity with property metadata: %@, valueType: %@", buf, 0x20u);

    }
    v22 = 0;
    goto LABEL_50;
  }
  objc_msgSend(v3, "valueType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v3, "valueType");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DC7BE8], "unitTypeFromLinkMeasurementUnitType:", -[NSObject unitType](v27, "unitType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v28 = 0;
    v27 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "parameters");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "if_firstObjectWithValue:forKey:", v30, CFSTR("propertyIdentifier"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "sortingOptions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "if_firstObjectWithValue:forKey:", v33, CFSTR("propertyIdentifier"));
  v34 = objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v103 = 1;
    if (v34)
    {
LABEL_22:
      v102 = 1;
      goto LABEL_28;
    }
  }
  else
  {
    v103 = objc_msgSend(*(id *)(a1 + 40), "hasInMemoryFindAction");
    if (v34)
      goto LABEL_22;
  }
  v102 = objc_msgSend(*(id *)(a1 + 40), "hasInMemoryFindAction");
LABEL_28:
  if ((objc_msgSend(*(id *)(a1 + 40), "isNotes") & 1) != 0)
  {
    objc_msgSend(v3, "title");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "key");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v107 = (void *)v34;
  if (!v38)
  {
    getWFAppIntentsLogObject();
    v74 = objc_claimAutoreleasedReturnValue();
    v109 = v74;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "identifier");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "valueType");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v120 = "+[WFLinkEntityContentItem propertyBuildersForFilteringUsingQuery:]_block_invoke";
      v121 = 2112;
      v122 = v75;
      v123 = 2112;
      v124 = v76;
      _os_log_impl(&dword_1C15B3000, v74, OS_LOG_TYPE_FAULT, "%s Unable to get property name for entity with property metadata: %@, valueType: %@", buf, 0x20u);

    }
    v22 = 0;
    goto LABEL_49;
  }
  v39 = v31;
  v95 = v27;
  objc_msgSend(v3, "title");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "wf_localizedString");
  v41 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueType");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v106 = v38;
  v101 = v28;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_35;
  v43 = -[NSObject length](v41, "length");

  if (!v43)
  {
    objc_msgSend(v3, "valueType");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "wf_enumValueType");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "enumerationIdentifier");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "appBundleIdentifier");
    v108 = v41;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "enumMetadataByAppBundleIdentifier:enumIdentifier:", v46, v99);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "displayRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "name");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "wf_localizedString");
    v50 = v5;
    v51 = objc_claimAutoreleasedReturnValue();

    v28 = v101;
    v41 = v51;
    v5 = v50;
LABEL_35:

  }
  v52 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Not %@"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "stringWithFormat:", v53, v41);
  v54 = objc_claimAutoreleasedReturnValue();

  v55 = (void *)MEMORY[0x1E0D13EF8];
  v116[0] = MEMORY[0x1E0C809B0];
  v116[1] = 3221225472;
  v116[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_152;
  v116[3] = &unk_1E7AE9E68;
  v96 = v3;
  v56 = v3;
  v57 = *(_QWORD *)(a1 + 40);
  v117 = v56;
  v118 = v57;
  objc_msgSend(v55, "block:name:class:", v116, v106, v5);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "multipleValues:", isKindOfClass & 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "measurementUnitType:", v28);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v41;
  objc_msgSend(v98, "displayName:", v41);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (void *)v54;
  objc_msgSend(v97, "negativeName:", v54);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = a1;
  v59 = *(void **)(a1 + 40);
  v60 = v39;
  objc_msgSend(v39, "wf_supportedContentOperators");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)v5;
  objc_msgSend(v59, "allowedOperatorsWithQueryParameterMetadata:objectClass:operators:", v39, v5, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "allowedOperators:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "filterable:", v103);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "sortable:", v102);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "identifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "userInfo:", v66);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v60;
  objc_msgSend(v56, "valueType");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "wf_objectClass");
  v69 = objc_opt_class();

  if (v60 && v68 == v69)
  {
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_3;
    v113[3] = &unk_1E7AE9EF8;
    v70 = v56;
    v71 = *(_QWORD *)(v92 + 40);
    v114 = v70;
    v115 = v71;
    objc_msgSend(v22, "possibleValuesAsynchronousGetter:", v113);
    v72 = objc_claimAutoreleasedReturnValue();

    v73 = v114;
    v22 = (void *)v72;
    v27 = v95;
    v3 = v96;
  }
  else
  {
    objc_msgSend(v56, "valueType");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = objc_opt_isKindOfClass();

    v27 = v95;
    if ((v78 & 1) == 0)
    {
      v3 = v96;
      v88 = v94;
      goto LABEL_46;
    }
    objc_msgSend(v56, "valueType");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "wf_enumValueType");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v80, "enumerationIdentifier");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "appBundleIdentifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "enumMetadataByAppBundleIdentifier:enumIdentifier:", v82, v73);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_3_167;
    aBlock[3] = &unk_1E7AE9F48;
    v111 = v83;
    v112 = v80;
    v84 = v80;
    v85 = v83;
    v86 = _Block_copy(aBlock);
    objc_msgSend(v22, "possibleValuesGetter:", v86);
    v87 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v87;
    v3 = v96;
  }
  v88 = v94;

LABEL_46:
  v38 = v106;
  v28 = v101;
  if (objc_msgSend(v88, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v22, "comparableUnits:", 8444);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "timeUnits:", 8444);
    v90 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v90;
  }

LABEL_49:
LABEL_50:

LABEL_51:
  return v22;
}

void __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_152(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  objc_msgSend(v9, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_firstObjectWithValue:forKey:", v12, CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "entity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_class();

  objc_msgSend(v15, "entityMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_2;
  v19[3] = &unk_1E7AE9E40;
  v17 = *(_QWORD *)(a1 + 40);
  v20 = v7;
  v21 = v17;
  v18 = v7;
  objc_msgSend(v13, "wf_getValueForEntity:entityMetadata:completionHandler:", v14, v16, v19);

}

void __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_entityValueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "appBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entityMetadataByAppBundleIdentifier:entityIdentifier:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D44188], "policyWithEntityMetadata:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v10, "connectionWithError:", &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  if (v11)
  {
    objc_msgSend(v10, "appEntityMangledTypeName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_162;
    v15[3] = &unk_1E7AE9ED0;
    v17 = *(_QWORD *)(a1 + 40);
    v16 = v3;
    objc_msgSend(v11, "performSuggestedEntitiesQueryWithEntityMangledTypeName:completionHandler:", v13, v15);

  }
  else
  {
    getWFGeneralLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "+[WFLinkEntityContentItem propertyBuildersForFilteringUsingQuery:]_block_invoke_3";
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
    }

    (*((void (**)(id, _QWORD))v3 + 2))(v3, MEMORY[0x1E0C9AA60]);
  }

}

id __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_3_167(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "cases");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_4;
  v5[3] = &unk_1E7AE9F20;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "if_map:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0D43E38];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "displayRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithValue:valueType:displayRepresentation:", v6, v7, v8);
  return v9;
}

void __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_162(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v7 = v6;
  v8 = v7;

  if (!objc_msgSend((id)objc_opt_class(), "isNotes"))
    goto LABEL_11;
  v9 = *(void **)(a1 + 40);
  objc_msgSend(v16, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "wf_entityValueType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "isNoteFolderEntityIdentifier:", v13);

  if ((_DWORD)v9)
  {
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "if_map:", &__block_literal_global);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
  else
  {
LABEL_11:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

id __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_2_163(uint64_t a1, void *a2)
{
  return WFNotesFolderIntentsValueFromLinkValue(a2);
}

void __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v23 = a2;
  objc_msgSend(v23, "valueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "memberValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v23, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v22 = v8;

    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v22, "valueForKeyPath:", CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  objc_msgSend(v23, "valueType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v23, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    goto LABEL_20;
  }
  objc_msgSend(v23, "valueType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "appBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "displayedAppBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "wf_contentCollectionFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:", v23, v14, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v12, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  objc_msgSend(v12, "items");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18 == 1)
  {
    objc_msgSend(v19, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v21);

  }
  else
  {
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v19);
  }

LABEL_20:
}

id __37__WFLinkEntityContentItem_initialize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v5 = a3;
  v6 = (void *)objc_msgSend(a2, "propertyClass");
  if (!objc_msgSend(v6, "isSubclassOfClass:", *(_QWORD *)(a1 + 32)))
    goto LABEL_17;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(v7, "entity");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entityMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isNotes"))
    {
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "isNoteFolderEntityIdentifier:", v10);

      if ((v11 & 1) != 0)
      {
        v12 = objc_alloc(MEMORY[0x1E0D43E38]);
        v13 = objc_alloc(MEMORY[0x1E0D43CB0]);
        objc_msgSend(v9, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithIdentifier:", v14);
        objc_msgSend(v7, "displayRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v12, "initWithValue:valueType:displayRepresentation:", v8, v15, v16);

        WFNotesFolderIntentsValueFromLinkValue(v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
        goto LABEL_21;
      }
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    objc_msgSend(v5, "value");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v7;
      else
        v19 = 0;
    }
    else
    {
      v19 = 0;
    }
    v8 = v19;
  }

  if (v8)
  {
    if (objc_msgSend(v8, "isTransient"))
    {
      v20 = v8;
      v8 = v20;
    }
    else
    {
      objc_msgSend(v8, "identifier");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v20;
    goto LABEL_20;
  }
LABEL_17:
  v18 = v5;
LABEL_21:

  return v18;
}

+ (BOOL)isNotes
{
  void *v2;
  char v3;

  objc_msgSend(a1, "appBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0DC7F18]);

  return v3;
}

+ (BOOL)isNoteEntity
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  char v6;

  if (!objc_msgSend(a1, "isNotes"))
    return 0;
  objc_msgSend(a1, "entityMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == CFSTR("NoteEntity"))
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("NoteEntity"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isNoteFolderEntityIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  char v5;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == CFSTR("FolderEntity"))
  {
    v5 = 1;
  }
  else if (v3)
  {
    v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("FolderEntity"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
