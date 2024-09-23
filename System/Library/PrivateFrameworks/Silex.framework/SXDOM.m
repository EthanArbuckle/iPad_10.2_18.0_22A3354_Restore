@implementation SXDOM

- (SXDOM)init
{
  return -[SXDOM initWithComponents:componentLayouts:componentStyles:componentTextStyles:textStyles:resources:autoPlacement:documentStyle:analysis:metadata:](self, "initWithComponents:componentLayouts:componentStyles:componentTextStyles:textStyles:resources:autoPlacement:documentStyle:analysis:metadata:", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (SXDOM)initWithComponents:(id)a3 componentLayouts:(id)a4 componentStyles:(id)a5 componentTextStyles:(id)a6 textStyles:(id)a7 resources:(id)a8 autoPlacement:(id)a9 documentStyle:(id)a10 analysis:(id)a11 metadata:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  SXDOM *v25;
  SXComponents *v26;
  SXComponents *components;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  SXDOMAnalysis *v46;
  SXDOMAnalysis *analysis;
  id v49;
  void *v50;
  id v51;
  id v52;
  objc_super v53;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v52 = a9;
  v51 = a10;
  v24 = a11;
  v53.receiver = self;
  v53.super_class = (Class)SXDOM;
  v25 = -[SXDOM init](&v53, sel_init);
  if (v25)
  {
    v50 = v20;
    if (v18)
      v26 = (SXComponents *)v18;
    else
      v26 = (SXComponents *)objc_opt_new();
    components = v25->_components;
    v25->_components = v26;

    v49 = v19;
    v28 = objc_msgSend(v19, "copy");
    v29 = (void *)v28;
    v30 = (void *)MEMORY[0x24BDBD1B8];
    if (v28)
      v31 = (void *)v28;
    else
      v31 = (void *)MEMORY[0x24BDBD1B8];
    objc_storeStrong((id *)&v25->_componentLayouts, v31);

    v32 = objc_msgSend(v50, "copy");
    v33 = (void *)v32;
    if (v32)
      v34 = (void *)v32;
    else
      v34 = v30;
    objc_storeStrong((id *)&v25->_componentStyles, v34);

    v35 = objc_msgSend(v21, "copy");
    v36 = (void *)v35;
    if (v35)
      v37 = (void *)v35;
    else
      v37 = v30;
    objc_storeStrong((id *)&v25->_componentTextStyles, v37);

    v38 = objc_msgSend(v22, "copy");
    v39 = (void *)v38;
    if (v38)
      v40 = (void *)v38;
    else
      v40 = v30;
    objc_storeStrong((id *)&v25->_textStyles, v40);

    v41 = objc_msgSend(v23, "copy");
    v42 = (void *)v41;
    if (v41)
      v43 = (void *)v41;
    else
      v43 = v30;
    objc_storeStrong((id *)&v25->_resources, v43);

    objc_storeStrong((id *)&v25->_autoPlacement, a9);
    objc_storeStrong((id *)&v25->_documentStyle, a10);
    v44 = (void *)objc_msgSend(v24, "copy");
    v45 = v44;
    if (v44)
      v46 = v44;
    else
      v46 = (SXDOMAnalysis *)objc_opt_new();
    analysis = v25->_analysis;
    v25->_analysis = v46;

    objc_storeStrong((id *)&v25->_metadata, v25->_metadata);
    v19 = v49;
    v20 = v50;
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SXDOM initWithComponents:componentLayouts:componentStyles:componentTextStyles:textStyles:resources:autoPlacement:documentStyle:analysis:metadata:]([SXDOM alloc], "initWithComponents:componentLayouts:componentStyles:componentTextStyles:textStyles:resources:autoPlacement:documentStyle:analysis:metadata:", self->_components, self->_componentLayouts, self->_componentStyles, self->_componentTextStyles, self->_textStyles, self->_resources, self->_autoPlacement, self->_documentStyle, self->_analysis, self->_metadata);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SXMutableDOM initWithComponents:componentLayouts:componentStyles:componentTextStyles:textStyles:resources:autoPlacement:documentStyle:analysis:metadata:]([SXMutableDOM alloc], "initWithComponents:componentLayouts:componentStyles:componentTextStyles:textStyles:resources:autoPlacement:documentStyle:analysis:metadata:", self->_components, self->_componentLayouts, self->_componentStyles, self->_componentTextStyles, self->_textStyles, self->_resources, self->_autoPlacement, self->_documentStyle, self->_analysis, self->_metadata);
}

- (id)debugDescription
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
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p;\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDOM components](self, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ncomponents: %@"), v5);

  -[SXDOM componentLayouts](self, "componentLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ncomponentLayouts: %@"), v6);

  -[SXDOM componentStyles](self, "componentStyles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ncomponentStyles: %@"), v7);

  -[SXDOM componentTextStyles](self, "componentTextStyles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ncomponentTextStyles: %@"), v8);

  -[SXDOM textStyles](self, "textStyles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ntextStyles: %@"), v9);

  -[SXDOM resources](self, "resources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nresources: %@"), v10);

  -[SXDOM autoPlacement](self, "autoPlacement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nautoPlacement: %@"), v11);

  -[SXDOM documentStyle](self, "documentStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ndocumentStyle: %@"), v12);

  -[SXDOM analysis](self, "analysis");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nanalysis: %@"), v13);

  -[SXDOM metadata](self, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nmetadata: %@"), v14);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (SXComponents)components
{
  return self->_components;
}

- (NSDictionary)textStyles
{
  return self->_textStyles;
}

- (NSDictionary)componentStyles
{
  return self->_componentStyles;
}

- (NSDictionary)componentLayouts
{
  return self->_componentLayouts;
}

- (NSDictionary)componentTextStyles
{
  return self->_componentTextStyles;
}

- (NSDictionary)resources
{
  return self->_resources;
}

- (SXAutoPlacement)autoPlacement
{
  return self->_autoPlacement;
}

- (SXDocumentStyle)documentStyle
{
  return self->_documentStyle;
}

- (SXDOMAnalysis)analysis
{
  return self->_analysis;
}

- (SXMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_documentStyle, 0);
  objc_storeStrong((id *)&self->_autoPlacement, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_textStyles, 0);
  objc_storeStrong((id *)&self->_componentTextStyles, 0);
  objc_storeStrong((id *)&self->_componentStyles, 0);
  objc_storeStrong((id *)&self->_componentLayouts, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end
