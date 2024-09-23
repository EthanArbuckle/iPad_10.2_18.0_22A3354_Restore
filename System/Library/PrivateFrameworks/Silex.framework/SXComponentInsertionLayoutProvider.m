@implementation SXComponentInsertionLayoutProvider

- (SXComponentInsertionLayoutProvider)initWithBlueprint:(id)a3 DOMObjectProvider:(id)a4 unitConverterFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXComponentInsertionLayoutProvider *v12;
  SXComponentInsertionLayoutProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXComponentInsertionLayoutProvider;
  v12 = -[SXComponentInsertionLayoutProvider init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layoutBlueprint, a3);
    objc_storeStrong((id *)&v13->_DOMObjectProvider, a4);
    objc_storeStrong((id *)&v13->_unitConverterFactory, a5);
  }

  return v13;
}

- (CGSize)viewportSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SXComponentInsertionLayoutProvider layoutBlueprint](self, "layoutBlueprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewportSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)documentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SXComponentInsertionLayoutProvider layoutBlueprint](self, "layoutBlueprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blueprintSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (SXColumnLayout)columnLayout
{
  void *v2;
  void *v3;
  void *v4;

  -[SXComponentInsertionLayoutProvider layoutBlueprint](self, "layoutBlueprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "columnLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SXColumnLayout *)v4;
}

- (CGRect)frameForComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  -[SXComponentInsertionLayoutProvider layoutBlueprint](self, "layoutBlueprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentBlueprintForComponentIdentifier:includeChildren:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)suggestedMarginForMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *i;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double MinY;
  double v22;
  double v23;
  uint64_t v24;
  SXComponentInsertionLayoutProvider *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SXInsertEdgeSpacing *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  SXComponentInsertionLayoutProvider *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXComponentInsertionLayoutProvider layoutBlueprintForMarker:](self, "layoutBlueprintForMarker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v5, "componentIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (!v11)
    {
      v8 = 0;
      v9 = 0;
      v29 = 0;
      goto LABEL_20;
    }
    v40 = self;
    v8 = 0;
    v9 = 0;
    v12 = *(_QWORD *)v43;
    v13 = 1.79769313e308;
    v14 = 1.79769313e308;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(v5, "componentBlueprintForComponentIdentifier:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "approximateLocation");
        v18 = v17;
        objc_msgSend(v16, "absoluteFrame");
        v19 = v18 - CGRectGetMaxY(v48);
        if (v19 < v14 && v19 >= 0.0)
        {
          objc_msgSend(v16, "component");
          v20 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v20;
          v14 = v19;
        }
        objc_msgSend(v16, "absoluteFrame");
        MinY = CGRectGetMinY(v49);
        objc_msgSend(v4, "approximateLocation");
        v23 = MinY - v22;
        if (v23 < v13 && v23 >= 0.0)
        {
          objc_msgSend(v16, "component");
          v24 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v24;
          v13 = v23;
        }

      }
      v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v11);

    if (v9)
    {
      v25 = v40;
      -[SXComponentInsertionLayoutProvider DOMObjectProvider](v40, "DOMObjectProvider");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layout");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentLayoutForIdentifier:", v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
LABEL_18:
        -[SXComponentInsertionLayoutProvider DOMObjectProvider](v25, "DOMObjectProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "layout");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentLayoutForIdentifier:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
LABEL_23:
        v41 = v11;
        v30 = [SXInsertEdgeSpacing alloc];
        objc_msgSend(v29, "margin");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "top");
        v34 = v33;
        objc_msgSend(v11, "margin");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "bottom");
        v7 = -[SXInsertEdgeSpacing initWithTop:bottom:](v30, v32, v34, v36, v37);

        goto LABEL_24;
      }
    }
    else
    {
      v11 = 0;
      v25 = v40;
      if (v8)
        goto LABEL_18;
    }
    v29 = 0;
    goto LABEL_23;
  }
  v7 = -[SXInsertEdgeSpacing initWithTop:bottom:]([SXInsertEdgeSpacing alloc], 0, 1, 0, 1);
  v8 = 0;
  v9 = 0;
LABEL_24:
  v38 = v7;

  return v38;
}

- (id)unitConverterForMarker:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  -[SXComponentInsertionLayoutProvider layoutBlueprintForMarker:](self, "layoutBlueprintForMarker:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentInsertionLayoutProvider unitConverterFactory](self, "unitConverterFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blueprintSize");
  v7 = v6;
  -[SXComponentInsertionLayoutProvider layoutBlueprint](self, "layoutBlueprint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createUnitConverterWithComponentWidth:parentWidth:layoutOptions:", v9, 0.0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)layoutBlueprintForMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXComponentInsertionLayoutProvider layoutBlueprint](self, "layoutBlueprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "path", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentBlueprintForComponentIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "layoutBlueprint");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (SXLayoutBlueprint)layoutBlueprint
{
  return self->_layoutBlueprint;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_layoutBlueprint, 0);
}

@end
