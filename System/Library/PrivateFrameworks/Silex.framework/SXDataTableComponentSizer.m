@implementation SXDataTableComponentSizer

- (SXDataTableComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 textComponentLayoutHosting:(id)a8 textSourceFactory:(id)a9 recordValueTransformerFactory:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  SXDataTableComponentSizer *v22;
  SXDataTableComponentSizer *v23;
  id v24;
  SXJSONObjectMerger *v25;
  SXJSONObjectMerger *v26;
  SXDataTableComponentStyleFactory *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  SXDataTableComponentStyleFactory *v34;
  SXDataTableComponentController *v35;
  SXDataTableComponentController *dataTableComponentController;
  SXDataTableLayouter *v37;
  SXDataTableLayouter *layouter;
  void *v40;
  id v41;
  SXJSONObjectMerger *v42;
  void *v43;
  id v44;
  objc_super v45;

  v16 = a3;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v44 = a10;
  v45.receiver = self;
  v45.super_class = (Class)SXDataTableComponentSizer;
  v20 = a4;
  v21 = v17;
  v22 = -[SXComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:](&v45, sel_initWithComponent_componentLayout_componentStyle_DOMObjectProvider_layoutOptions_, v16, v20, a5, v17, a7);
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_textComponentLayoutHosting, v18);
    v24 = v16;
    -[SXDataTableComponentSizer tableStyleForComponent:](v23, "tableStyleForComponent:", v24);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v18;
    v42 = -[SXJSONObjectMerger initWithObjectClass:exclusionKeys:]([SXJSONObjectMerger alloc], "initWithObjectClass:exclusionKeys:", objc_opt_class(), 0);
    v25 = -[SXJSONObjectMerger initWithObjectClass:exclusionKeys:]([SXJSONObjectMerger alloc], "initWithObjectClass:exclusionKeys:", objc_opt_class(), 0);
    v26 = -[SXJSONObjectMerger initWithObjectClass:exclusionKeys:]([SXJSONObjectMerger alloc], "initWithObjectClass:exclusionKeys:", objc_opt_class(), 0);
    +[SXJSONObjectTransformer concatenatingTransformerWithKey:](SXJSONObjectTransformer, "concatenatingTransformerWithKey:", CFSTR("textStyles"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXJSONObjectMerger addTransformer:keyPath:](v26, "addTransformer:keyPath:", v40, CFSTR("textStyle"));
    v27 = [SXDataTableComponentStyleFactory alloc];
    objc_msgSend(v24, "data");
    v28 = v16;
    v29 = v19;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v21;
    v32 = objc_msgSend(v24, "dataOrientation");

    v33 = v32;
    v21 = v31;
    v34 = -[SXDataTableComponentStyleFactory initWithRecordStore:tableStyle:dataOrientation:rowStyleMerger:columnStyleMerger:cellStyleMerger:](v27, "initWithRecordStore:tableStyle:dataOrientation:rowStyleMerger:columnStyleMerger:cellStyleMerger:", v30, v43, v33, v42, v25, v26);

    v19 = v29;
    v16 = v28;
    v35 = -[SXDataTableComponentController initWithStyleFactory:textSourceFactory:dataSource:recordValueTransformerFactory:DOMObjectProvider:]([SXDataTableComponentController alloc], "initWithStyleFactory:textSourceFactory:dataSource:recordValueTransformerFactory:DOMObjectProvider:", v34, v19, v23, v44, v31);
    dataTableComponentController = v23->_dataTableComponentController;
    v23->_dataTableComponentController = v35;

    v37 = -[SXDataTableLayouter initWithDataSource:]([SXDataTableLayouter alloc], "initWithDataSource:", v23->_dataTableComponentController);
    layouter = v23->_layouter;
    v23->_layouter = v37;

    v18 = v41;
  }

  return v23;
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v6 = a4;
  -[SXDataTableComponentSizer dataTableComponentController](self, "dataTableComponentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareForLayout");

  -[SXDataTableComponentSizer layouter](self, "layouter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reset");

  -[SXDataTableComponentSizer setCurrentLayoutContext:](self, "setCurrentLayoutContext:", v6);
  -[SXDataTableComponentSizer layouter](self, "layouter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "blueprintForWidth:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SXComponentSizer saveInfo:forRenderingPhaseWithIdentifier:](self, "saveInfo:forRenderingPhaseWithIdentifier:", v10, CFSTR("blueprint"));
    -[SXDataTableComponentSizer dataTableComponentController](self, "dataTableComponentController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentSizer saveInfo:forRenderingPhaseWithIdentifier:](self, "saveInfo:forRenderingPhaseWithIdentifier:", v11, CFSTR("component_controller"));

  }
  objc_msgSend(v10, "tableSize");
  v13 = v12;

  return v13;
}

- (id)documentColumnLayoutForDataTableComponentController:(id)a3
{
  void *v3;
  void *v4;

  -[SXComponentSizer layoutOptions](self, "layoutOptions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "columnLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contentSizeCategoryForDataTableComponentController:(id)a3
{
  void *v3;
  void *v4;

  -[SXComponentSizer layoutOptions](self, "layoutOptions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)unitConverterForDataTableComponentController:(id)a3
{
  void *v3;
  void *v4;

  -[SXDataTableComponentSizer currentLayoutContext](self, "currentLayoutContext", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitConverter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tableStyleForComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentStyleForComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tableStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  return (SXTextComponentLayoutHosting *)objc_loadWeakRetained((id *)&self->_textComponentLayoutHosting);
}

- (SXDataTableLayouter)layouter
{
  return self->_layouter;
}

- (void)setLayouter:(id)a3
{
  objc_storeStrong((id *)&self->_layouter, a3);
}

- (SXDataTableComponentController)dataTableComponentController
{
  return self->_dataTableComponentController;
}

- (void)setDataTableComponentController:(id)a3
{
  objc_storeStrong((id *)&self->_dataTableComponentController, a3);
}

- (SXLayoutContext)currentLayoutContext
{
  return self->_currentLayoutContext;
}

- (void)setCurrentLayoutContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayoutContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayoutContext, 0);
  objc_storeStrong((id *)&self->_dataTableComponentController, 0);
  objc_storeStrong((id *)&self->_layouter, 0);
  objc_destroyWeak((id *)&self->_textComponentLayoutHosting);
}

@end
