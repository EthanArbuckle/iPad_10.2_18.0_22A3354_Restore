@implementation SXEmbedComponentSizer

- (SXEmbedComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 embedDataProvider:(id)a8
{
  id v15;
  SXEmbedComponentSizer *v16;
  SXEmbedComponentSizer *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)SXEmbedComponentSizer;
  v16 = -[SXComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:](&v19, sel_initWithComponent_componentLayout_componentStyle_DOMObjectProvider_layoutOptions_, a3, a4, a5, a6, a7);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_embedDataProvider, a8);

  return v17;
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  double v5;
  double v6;

  -[SXComponentSizer suggestedSize](self, "suggestedSize", a4, a3);
  if (v5 <= 0.0)
    return 100.0;
  -[SXComponentSizer suggestedSize](self, "suggestedSize");
  return v6;
}

- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4
{
  NSUInteger location;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  int64_t length;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  -[SXEmbedComponentSizer embedDataProvider](self, "embedDataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "embedType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "embedForType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "minimumWidth");
  if (v11 <= 0.0)
  {
    v13 = 1;
  }
  else
  {
    v12 = v11;
    v13 = 1;
    while (v13 <= objc_msgSend(v6, "numberOfColumns"))
    {
      -[SXComponentSizer componentLayout](self, "componentLayout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "ignoreDocumentMargin");
      -[SXComponentSizer componentLayout](self, "componentLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "ignoreDocumentMargin");
      -[SXComponentSizer componentLayout](self, "componentLayout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", location, v13, v15, v17, objc_msgSend(v18, "ignoreViewportPadding"));
      v20 = v19;

      ++v13;
      if (v20 >= v12)
      {
        --v13;
        break;
      }
    }
  }
  if ((uint64_t)v13 <= length)
    v21 = length;
  else
    v21 = v13;
  v22 = objc_msgSend(v6, "numberOfColumns");
  v23 = location - ((v21 - v22) & ~((uint64_t)(v21 - v22) >> 63));
  v24 = v23 & ~(v23 >> 63);
  v25 = objc_msgSend(v6, "numberOfColumns");
  if (v21 >= v25)
    v21 = v25;

  v26 = v24;
  v27 = v21;
  result.length = v27;
  result.location = v26;
  return result;
}

- (SXEmbedDataProvider)embedDataProvider
{
  return self->_embedDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedDataProvider, 0);
}

@end
