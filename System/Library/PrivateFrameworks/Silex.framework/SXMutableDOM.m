@implementation SXMutableDOM

- (SXMutableDOM)initWithComponents:(id)a3 componentLayouts:(id)a4 componentStyles:(id)a5 componentTextStyles:(id)a6 textStyles:(id)a7 resources:(id)a8 autoPlacement:(id)a9 documentStyle:(id)a10 analysis:(id)a11 metadata:(id)a12
{
  id v18;
  id v19;
  SXMutableDOM *v20;
  SXMutableDOM *v21;
  uint64_t v22;
  SXComponents *components;
  uint64_t v24;
  NSDictionary *componentLayouts;
  uint64_t v26;
  NSDictionary *componentStyles;
  uint64_t v28;
  NSDictionary *componentTextStyles;
  uint64_t v30;
  NSDictionary *textStyles;
  uint64_t v32;
  NSDictionary *resources;
  uint64_t v34;
  SXDOMAnalysis *analysis;
  uint64_t v36;
  SXMetadata *metadata;
  objc_super v40;

  v18 = a9;
  v40.receiver = self;
  v40.super_class = (Class)SXMutableDOM;
  v19 = a10;
  v20 = -[SXDOM initWithComponents:componentLayouts:componentStyles:componentTextStyles:textStyles:resources:autoPlacement:documentStyle:analysis:metadata:](&v40, sel_initWithComponents_componentLayouts_componentStyles_componentTextStyles_textStyles_resources_autoPlacement_documentStyle_analysis_metadata_, a3, a4, a5, a6, a7, a8, v18, v19, a11, a12);
  v21 = v20;
  if (v20)
  {
    v22 = -[SXComponents mutableCopy](v20->super._components, "mutableCopy");
    components = v21->super._components;
    v21->super._components = (SXComponents *)v22;

    v24 = -[NSDictionary mutableCopy](v21->super._componentLayouts, "mutableCopy");
    componentLayouts = v21->super._componentLayouts;
    v21->super._componentLayouts = (NSDictionary *)v24;

    v26 = -[NSDictionary mutableCopy](v21->super._componentStyles, "mutableCopy");
    componentStyles = v21->super._componentStyles;
    v21->super._componentStyles = (NSDictionary *)v26;

    v28 = -[NSDictionary mutableCopy](v21->super._componentTextStyles, "mutableCopy");
    componentTextStyles = v21->super._componentTextStyles;
    v21->super._componentTextStyles = (NSDictionary *)v28;

    v30 = -[NSDictionary mutableCopy](v21->super._textStyles, "mutableCopy");
    textStyles = v21->super._textStyles;
    v21->super._textStyles = (NSDictionary *)v30;

    v32 = -[NSDictionary mutableCopy](v21->super._resources, "mutableCopy");
    resources = v21->super._resources;
    v21->super._resources = (NSDictionary *)v32;

    objc_storeStrong((id *)&v21->super._autoPlacement, a9);
    objc_storeStrong((id *)&v21->super._documentStyle, a10);
    v34 = -[SXDOMAnalysis mutableCopy](v21->super._analysis, "mutableCopy");
    analysis = v21->super._analysis;
    v21->super._analysis = (SXDOMAnalysis *)v34;

    v36 = -[SXMetadata mutableCopy](v21->super._metadata, "mutableCopy");
    metadata = v21->super._metadata;
    v21->super._metadata = (SXMetadata *)v36;

  }
  return v21;
}

- (void)setAutoPlacement:(id)a3
{
  objc_storeStrong((id *)&self->super._autoPlacement, a3);
}

- (void)setDocumentStyle:(id)a3
{
  objc_storeStrong((id *)&self->super._documentStyle, a3);
}

- (void)setAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->super._analysis, a3);
}

@end
