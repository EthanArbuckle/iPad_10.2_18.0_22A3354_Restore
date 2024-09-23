@implementation WFWorkflowRunViewSource

- (WFWorkflowRunViewSource)initWithView:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *uuid;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  WFWorkflowRunViewSource *v26;
  objc_super v28;

  v4 = a3;
  if (v4
    && (v28.receiver = self,
        v28.super_class = (Class)WFWorkflowRunViewSource,
        (self = -[WFWorkflowRunViewSource init](&v28, sel_init)) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    uuid = self->_uuid;
    self->_uuid = v5;

    objc_msgSend(v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_renderID = CALayerGetRenderId();

    objc_msgSend(v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CALayerGetContext();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_contextID = objc_msgSend(v9, "contextId");

    objc_msgSend(v4, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v4, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rootViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertRect:toView:", v21, v12, v14, v16, v18);
    self->_originFrame.origin.x = v22;
    self->_originFrame.origin.y = v23;
    self->_originFrame.size.width = v24;
    self->_originFrame.size.height = v25;

    objc_storeWeak((id *)&self->_originView, v4);
    self = self;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)updateSourceView:(id)a3
{
  void *v4;
  uint64_t RenderId;
  unint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37 = a3;
  -[WFWorkflowRunViewSource setOriginView:](self, "setOriginView:", v37);
  if (v37)
  {
    objc_msgSend(v37, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    RenderId = CALayerGetRenderId();

    v6 = -[WFWorkflowRunViewSource renderID](self, "renderID");
    v7 = v6 != RenderId;
    if (v6 != RenderId)
      -[WFWorkflowRunViewSource setRenderID:](self, "setRenderID:", RenderId);
    objc_msgSend(v37, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CALayerGetContext();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "contextId");

    v11 = -[WFWorkflowRunViewSource contextID](self, "contextID");
    if ((_DWORD)v10 && v11 != (_DWORD)v10)
    {
      -[WFWorkflowRunViewSource setContextID:](self, "setContextID:", v10);
      v7 = 1;
    }
    objc_msgSend(v37, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v37, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rootViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:toView:", v23, v14, v16, v18, v20);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    -[WFWorkflowRunViewSource originFrame](self, "originFrame");
    v40.origin.x = v25;
    v40.origin.y = v27;
    v40.size.width = v29;
    v40.size.height = v31;
    if (CGRectEqualToRect(v38, v40))
    {
      if (!v7)
        goto LABEL_16;
    }
    else
    {
      -[WFWorkflowRunViewSource setOriginFrame:](self, "setOriginFrame:", v25, v27, v29, v31);
    }
    goto LABEL_15;
  }
  -[WFWorkflowRunViewSource originFrame](self, "originFrame");
  v32 = *MEMORY[0x1E0C9D648];
  v33 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v34 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v35 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v41.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v41.origin.y = v33;
  v41.size.width = v34;
  v41.size.height = v35;
  if (!CGRectEqualToRect(v39, v41)
    || -[WFWorkflowRunViewSource renderID](self, "renderID")
    || -[WFWorkflowRunViewSource contextID](self, "contextID"))
  {
    -[WFWorkflowRunViewSource setOriginFrame:](self, "setOriginFrame:", v32, v33, v34, v35);
    -[WFWorkflowRunViewSource setRenderID:](self, "setRenderID:", 0);
    -[WFWorkflowRunViewSource setContextID:](self, "setContextID:", 0);
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "postNotificationName:object:userInfo:", CFSTR("WFWorkflowRunViewSourceUpdatedNotification"), self, MEMORY[0x1E0C9AA70]);

  }
LABEL_16:

}

- (void)refresh
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[WFWorkflowRunViewSource originView](self, "originView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunViewSource setRenderID:](self, "setRenderID:", CALayerGetRenderId());

  -[WFWorkflowRunViewSource originView](self, "originView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CALayerGetContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunViewSource setContextID:](self, "setContextID:", objc_msgSend(v7, "contextId"));

  -[WFWorkflowRunViewSource originView](self, "originView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunViewSource originView](self, "originView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[WFWorkflowRunViewSource originView](self, "originView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rootViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", v21, v11, v13, v15, v17);
  -[WFWorkflowRunViewSource setOriginFrame:](self, "setOriginFrame:");

}

- (BOOL)isInvalidated
{
  CGRect v4;

  -[WFWorkflowRunViewSource originFrame](self, "originFrame");
  return CGRectEqualToRect(v4, *MEMORY[0x1E0C9D648])
      || !-[WFWorkflowRunViewSource renderID](self, "renderID")
      || -[WFWorkflowRunViewSource contextID](self, "contextID") == 0;
}

- (BOOL)isEqual:(id)a3
{
  WFWorkflowRunViewSource *v4;
  WFWorkflowRunViewSource *v5;
  WFWorkflowRunViewSource *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (WFWorkflowRunViewSource *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[WFWorkflowRunViewSource uuid](v6, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowRunViewSource uuid](self, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFWorkflowRunViewSource uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (WFWorkflowRunViewSource)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowRunViewSource *v5;
  uint64_t v6;
  NSUUID *uuid;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  WFWorkflowRunViewSource *v20;
  WFWorkflowRunViewSource *result;
  void *v22;
  void *v23;
  objc_super v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFWorkflowRunViewSource;
  v5 = -[WFWorkflowRunViewSource init](&v24, sel_init);
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v6 = objc_claimAutoreleasedReturnValue();
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("renderID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_renderID = objc_msgSend(v8, "unsignedLongLongValue");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_contextID = objc_msgSend(v9, "unsignedIntValue");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originFrame"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v11 = getCGRectFromStringSymbolLoc_ptr;
  v28 = getCGRectFromStringSymbolLoc_ptr;
  if (!getCGRectFromStringSymbolLoc_ptr)
  {
    v12 = UIKitCoreLibrary();
    v11 = dlsym(v12, "CGRectFromString");
    v26[3] = (uint64_t)v11;
    getCGRectFromStringSymbolLoc_ptr = v11;
  }
  _Block_object_dispose(&v25, 8);
  if (v11)
  {
    v13 = ((double (*)(id))v11)(v10);
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v5->_originFrame.origin.x = v13;
    v5->_originFrame.origin.y = v15;
    v5->_originFrame.size.width = v17;
    v5->_originFrame.size.height = v19;
    v20 = v5;

LABEL_6:
    return v5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGRect WFCGRectFromString(NSString *__strong)");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("WFWorkflowRunViewSource.m"), 21, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = a3;
  -[WFWorkflowRunViewSource uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[WFWorkflowRunViewSource renderID](self, "renderID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("renderID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[WFWorkflowRunViewSource contextID](self, "contextID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("contextID"));

  -[WFWorkflowRunViewSource originFrame](self, "originFrame");
  WFStringFromCGRect(v8, v9, v10, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("originFrame"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[WFWorkflowRunViewSource uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v7;

  *(_QWORD *)(v5 + 32) = -[WFWorkflowRunViewSource renderID](self, "renderID");
  *(_DWORD *)(v5 + 8) = -[WFWorkflowRunViewSource contextID](self, "contextID");
  -[WFWorkflowRunViewSource originFrame](self, "originFrame");
  *(_QWORD *)(v5 + 40) = v9;
  *(_QWORD *)(v5 + 48) = v10;
  *(_QWORD *)(v5 + 56) = v11;
  *(_QWORD *)(v5 + 64) = v12;
  return (id)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowRunViewSource;
  -[WFWorkflowRunViewSource description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFWorkflowRunViewSource renderID](self, "renderID");
  v6 = -[WFWorkflowRunViewSource contextID](self, "contextID");
  -[WFWorkflowRunViewSource originFrame](self, "originFrame");
  WFStringFromCGRect(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, renderID: %llu, contextID: %u, originFrame: %@>"), v4, v5, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (UIView)originView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_originView);
}

- (void)setOriginView:(id)a3
{
  objc_storeWeak((id *)&self->_originView, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)renderID
{
  return self->_renderID;
}

- (void)setRenderID:(unint64_t)a3
{
  self->_renderID = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (CGRect)originFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originFrame.origin.x;
  y = self->_originFrame.origin.y;
  width = self->_originFrame.size.width;
  height = self->_originFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginFrame:(CGRect)a3
{
  self->_originFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_originView);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
