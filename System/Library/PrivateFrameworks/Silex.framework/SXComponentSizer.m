@implementation SXComponentSizer

- (SXComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SXComponentSizer *v17;
  SXComponentSizer *v18;
  uint64_t v19;
  NSMutableDictionary *infoForRendering;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SXComponentSizer;
  v17 = -[SXComponentSizer init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_component, a3);
    objc_storeStrong((id *)&v18->_componentLayout, a4);
    objc_storeStrong((id *)&v18->_componentStyle, a5);
    objc_storeStrong((id *)&v18->_DOMObjectProvider, a6);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    infoForRendering = v18->_infoForRendering;
    v18->_infoForRendering = (NSMutableDictionary *)v19;

    objc_storeStrong((id *)&v18->_layoutOptions, a7);
  }

  return v18;
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  return 0.0;
}

- (id)snapLines
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (BOOL)allowComponentIntersection
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SXComponentSizer component](self, "component");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "classification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsIntersection");

  return v5;
}

- (unint64_t)shouldIgnoreMarginsForColumnLayout:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SXComponentSizer componentLayout](self, "componentLayout", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreDocumentMargin");

  return v4;
}

- (unint64_t)shouldIgnoreViewportPaddingForColumnLayout:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SXComponentSizer componentLayout](self, "componentLayout", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreViewportPadding");

  return v4;
}

- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  result.length = length;
  result.location = location;
  return result;
}

- (int64_t)minimumColumnLength
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[SXComponentSizer component](self, "component");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "classification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "minimumColumnSpan");

  return v5;
}

- (UIEdgeInsets)contentInsetsWithUnitConverter:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  __int16 v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  UIEdgeInsets result;

  v4 = a3;
  objc_msgSend(v4, "convertValueToPoints:", 0x4049000000000000, 6);
  v6 = v5;
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "contentInset");

  v9 = v6;
  v10 = v6;
  v11 = v6;
  if ((v8 & 1) == 0)
  {
    v11 = *MEMORY[0x24BDF7718];
    v10 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v9 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v12 = *(double *)(MEMORY[0x24BDF7718] + 24);
    -[SXComponentSizer componentLayout](self, "componentLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "contentInset");

    if ((v14 & 0x100) != 0)
      v10 = v6;
    -[SXComponentSizer componentLayout](self, "componentLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "contentInset");

    if ((*(_QWORD *)&v16 & 0x10000) != 0)
      v11 = v6;
    -[SXComponentSizer componentLayout](self, "componentLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "contentInset");

    if ((v18 & 0x1000000) != 0)
      v12 = v6;
    -[SXComponentSizer componentLayout](self, "componentLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "contentInset");

    if ((v20 & 0x100000000) != 0)
      v9 = v6;
    v6 = v12;
  }
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "padding");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "left");
  objc_msgSend(v4, "convertValueToPoints:", v23, v24);
  if (v10 >= v25)
    v26 = v10;
  else
    v26 = v25;
  v27 = objc_msgSend(v22, "top");
  objc_msgSend(v4, "convertValueToPoints:", v27, v28);
  if (v11 >= v29)
    v30 = v11;
  else
    v30 = v29;
  v31 = objc_msgSend(v22, "right");
  objc_msgSend(v4, "convertValueToPoints:", v31, v32);
  if (v6 >= v33)
    v34 = v6;
  else
    v34 = v33;
  v35 = objc_msgSend(v22, "bottom");
  objc_msgSend(v4, "convertValueToPoints:", v35, v36);
  if (v9 >= v37)
    v38 = v9;
  else
    v38 = v37;
  -[SXComponentSizer layoutMarginsWithUnitConverter:](self, "layoutMarginsWithUnitConverter:", v4);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;

  v47 = v30 + v40;
  v48 = v26 + v42;
  v49 = v38 + v44;
  v50 = v34 + v46;
  result.right = v50;
  result.bottom = v49;
  result.left = v48;
  result.top = v47;
  return result;
}

- (UIEdgeInsets)bordersInsetsWithUnitConverter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  UIEdgeInsets result;

  v4 = a3;
  -[SXComponentSizer componentStyle](self, "componentStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "border");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "all");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "width");
    objc_msgSend(v4, "convertValueToPoints:", v8, v9);
    v11 = v10;

    objc_msgSend(v6, "top");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v11;
    if (v12)
    {
      objc_msgSend(v6, "top");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "width");
      objc_msgSend(v4, "convertValueToPoints:", v15, v16);
      v13 = v17;

    }
    objc_msgSend(v6, "right");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v11;
    if (v18)
    {
      objc_msgSend(v6, "right");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "width");
      objc_msgSend(v4, "convertValueToPoints:", v21, v22);
      v19 = v23;

    }
    objc_msgSend(v6, "bottom");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v11;
    if (v24)
    {
      objc_msgSend(v6, "bottom");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "width");
      objc_msgSend(v4, "convertValueToPoints:", v27, v28);
      v25 = v29;

    }
    objc_msgSend(v6, "left");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v6, "left");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "width");
      objc_msgSend(v4, "convertValueToPoints:", v32, v33);
      v11 = v34;

    }
  }
  else
  {
    v13 = *MEMORY[0x24BDF7718];
    v11 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v25 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v19 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }

  v35 = v13;
  v36 = v11;
  v37 = v25;
  v38 = v19;
  result.right = v38;
  result.bottom = v37;
  result.left = v36;
  result.top = v35;
  return result;
}

- (BOOL)requiresSizeChangeForStateChange:(id)a3 fromState:(id)a4
{
  return 0;
}

- (void)saveInfo:(id)a3 forRenderingPhaseWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SXComponentSizer infoForRendering](self, "infoForRendering");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (SXComponent)component
{
  return self->_component;
}

- (SXComponentLayout)componentLayout
{
  return self->_componentLayout;
}

- (SXComponentStyle)componentStyle
{
  return self->_componentStyle;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXComponentState)componentState
{
  return self->_componentState;
}

- (void)setComponentState:(id)a3
{
  objc_storeStrong((id *)&self->_componentState, a3);
}

- (CGSize)suggestedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_suggestedSize.width;
  height = self->_suggestedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSuggestedSize:(CGSize)a3
{
  self->_suggestedSize = a3;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (NSMutableDictionary)infoForRendering
{
  return self->_infoForRendering;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoForRendering, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_componentState, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_componentStyle, 0);
  objc_storeStrong((id *)&self->_componentLayout, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
