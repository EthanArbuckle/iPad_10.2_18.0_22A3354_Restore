@implementation _UIONavigationBarTitleRenamerViewMetricsUpdateAction

- (_UIONavigationBarTitleRenamerViewMetricsUpdateAction)initWithFrame:(CGRect)a3 textAlignment:(int64_t)a4 session:(id)a5 responseHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _UIONavigationBarTitleRenamerViewMetricsUpdateAction *v23;
  objc_super v25;
  _QWORD v26[4];
  id v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a6;
  v14 = (objc_class *)MEMORY[0x1E0D017D0];
  v15 = a5;
  v16 = objc_alloc_init(v14);
  objc_msgSend(v15, "sessionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setObject:forSetting:", v17, 0);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forSetting:", v18, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forSetting:", v19, 2);

  v20 = (void *)MEMORY[0x1E0D016A0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __108___UIONavigationBarTitleRenamerViewMetricsUpdateAction_initWithFrame_textAlignment_session_responseHandler___block_invoke;
  v26[3] = &unk_1E16C6A58;
  v27 = v13;
  v21 = v13;
  objc_msgSend(v20, "responderWithHandler:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)_UIONavigationBarTitleRenamerViewMetricsUpdateAction;
  v23 = -[_UIOServerAction initWithOriginContext:info:responder:](&v25, sel_initWithOriginContext_info_responder_, 0, v16, v22);

  return v23;
}

- (CGRect)frame
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[_UIONavigationBarTitleRenamerViewMetricsUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (int64_t)textAlignment
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_UIONavigationBarTitleRenamerViewMetricsUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)isPermitted
{
  return 1;
}

- (void)performActionFromConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t RenderId;
  void *v11;
  void *v12;
  uint64_t v13;
  _UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  _UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse *v29;
  void *v30;
  id v31;

  if (-[_UIONavigationBarTitleRenamerViewMetricsUpdateAction canSendResponse](self, "canSendResponse", a3))
  {
    -[_UIONavigationBarTitleRenamerViewMetricsUpdateAction info](self, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForSetting:", 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    +[_UINavigationBarTitleRenamer renameServer](_UINavigationBarTitleRenamer, "renameServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionWithIdentifier:", v31);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "existingRenamerContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIONavigationBarTitleRenamerViewMetricsUpdateAction frame](self, "frame");
      objc_msgSend(v8, "setFrame:", 0.0, 0.0);
      objc_msgSend(v8, "setTextAlignment:", -[_UIONavigationBarTitleRenamerViewMetricsUpdateAction textAlignment](self, "textAlignment"));
      objc_msgSend(v8, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      RenderId = CALayerGetRenderId();

      objc_msgSend(v8, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "contextId");

      v14 = [_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse alloc];
      objc_msgSend(v8, "intrinsicContentSize");
      v16 = v15;
      v18 = v17;
      objc_msgSend(v8, "bounds");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(v8, "horizontalTextInset");
      v28 = -[_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse initWithRenderID:contextID:intrinsicContentSize:bounds:horizontalTextInset:](v14, "initWithRenderID:contextID:intrinsicContentSize:bounds:horizontalTextInset:", RenderId, v13, v16, v18, v20, v22, v24, v26, v27);
    }
    else
    {
      v29 = [_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse alloc];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", 0x1E17342E0, 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[BSActionResponse initWithInfo:error:](v29, "initWithInfo:error:", 0, v8);
    }
    v30 = (void *)v28;
    -[_UIONavigationBarTitleRenamerViewMetricsUpdateAction sendResponse:](self, "sendResponse:", v28);

  }
}

@end
