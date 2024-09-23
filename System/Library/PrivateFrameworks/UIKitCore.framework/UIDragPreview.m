@implementation UIDragPreview

+ (UIDragPreview)previewForURL:(NSURL *)url
{
  void *v3;
  UIDragPreview *v4;
  id v5;
  UIDragPreviewParameters *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  UIDragPreviewParameters *v18;
  UIDragPreview *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  +[UIURLDragPreviewView viewWithURL:](UIURLDragPreviewView, "viewWithURL:", url);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [UIDragPreview alloc];
  v5 = v3;
  v6 = [UIDragPreviewParameters alloc];
  v7 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v5, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v7, "valueWithCGRect:", v9, v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[UIPreviewParameters initWithTextLineRects:](v6, "initWithTextLineRects:", v17);

  v19 = -[UIDragPreview initWithView:parameters:](v4, "initWithView:parameters:", v5, v18);
  return v19;
}

+ (UIDragPreview)previewForURL:(NSURL *)url title:(NSString *)title
{
  void *v4;
  UIDragPreview *v5;
  id v6;
  UIDragPreviewParameters *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  UIDragPreviewParameters *v19;
  UIDragPreview *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  +[UIURLDragPreviewView viewWithTitle:URL:](UIURLDragPreviewView, "viewWithTitle:URL:", title, url);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [UIDragPreview alloc];
  v6 = v4;
  v7 = [UIDragPreviewParameters alloc];
  v8 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v6, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v8, "valueWithCGRect:", v10, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[UIPreviewParameters initWithTextLineRects:](v7, "initWithTextLineRects:", v18);

  v20 = -[UIDragPreview initWithView:parameters:](v5, "initWithView:parameters:", v6, v19);
  return v20;
}

- (UIDragPreview)initWithView:(UIView *)view parameters:(UIDragPreviewParameters *)parameters
{
  UIView *v8;
  UIDragPreviewParameters *v9;
  UIDragPreviewParameters *v10;
  UIDragPreview *v11;
  UIDragPreview *v12;
  uint64_t v13;
  UIDragPreviewParameters *v14;
  UIDragPreview *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v8 = view;
  v9 = parameters;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragPreview.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragPreview.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters != nil"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)UIDragPreview;
  v11 = -[UIDragPreview init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_view, view);
    v13 = -[UIDragPreviewParameters copy](v10, "copy");
    v14 = v12->_parameters;
    v12->_parameters = (UIDragPreviewParameters *)v13;

    v15 = v12;
  }

  return v12;
}

- (UIDragPreview)initWithView:(UIView *)view
{
  UIView *v4;
  UIDragPreviewParameters *v5;
  UIDragPreview *v6;

  v4 = view;
  v5 = objc_alloc_init(UIDragPreviewParameters);
  v6 = -[UIDragPreview initWithView:parameters:](self, "initWithView:parameters:", v4, v5);

  return v6;
}

- (_DUIPreview)_duiPreview
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _DUIPreview *v8;
  void *v9;
  void *v10;
  _DUIPreview *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[UIDragPreview view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (v5 != 0.0 && v7 != 0.0)
    goto LABEL_3;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    -[UIDragPreview view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412290;
    v22 = v20;
    _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "UIDragPreview does not support zero-sized previews. This is a client issue. PLEASE FIX ME. %@", (uint8_t *)&v21, 0xCu);
LABEL_15:

LABEL_16:
    goto LABEL_3;
  }
  v17 = _duiPreview___s_category;
  if (!_duiPreview___s_category)
  {
    v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v17, (unint64_t *)&_duiPreview___s_category);
  }
  v18 = *(NSObject **)(v17 + 8);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = v18;
    -[UIDragPreview view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412290;
    v22 = v20;
    _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "UIDragPreview does not support zero-sized previews. This is a client issue. PLEASE FIX ME. %@", (uint8_t *)&v21, 0xCu);
    goto LABEL_15;
  }
LABEL_3:
  v8 = [_DUIPreview alloc];
  -[UIDragPreview view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDragPreview parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_DUIPreview initWithView:container:parameters:](v8, "initWithView:container:parameters:", v9, 0, v10);

  -[_DUIPreview setAvoidAnimation:](v11, "setAvoidAnimation:", -[UIDragPreview avoidAnimation](self, "avoidAnimation"));
  if (self->_preferredAnchorPoint)
  {
    -[UIDragPreview preferredAnchorPoint](self, "preferredAnchorPoint");
    v14 = v13 / v5;
    if (v5 == 0.0)
      v14 = 0.5;
    v15 = v12 / v7;
    if (v7 == 0.0)
      v15 = 0.5;
    -[_DUIPreview setLiftAnchorPoint:](v11, "setLiftAnchorPoint:", v14, v15);
  }
  return v11;
}

+ (CGSize)defaultBoundingSize
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = 206.0;
  if (!v3)
    v4 = 160.0;
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)textBoundingSize
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = 400.0;
  if (!v3)
    v4 = 310.0;
  v5 = 206.0;
  if (!v3)
    v5 = 160.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setPreferredAnchorPoint:(CGPoint)a3
{
  NSValue *v4;
  NSValue *preferredAnchorPoint;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", a3.x, a3.y);
  v4 = (NSValue *)objc_claimAutoreleasedReturnValue();
  preferredAnchorPoint = self->_preferredAnchorPoint;
  self->_preferredAnchorPoint = v4;

}

- (CGPoint)preferredAnchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[NSValue CGPointValue](self->_preferredAnchorPoint, "CGPointValue");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)set_springboardPlatterStyle:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  -[UIPreviewParameters _setPreviewMode:](self->_parameters, "_setPreviewMode:", v3);
}

- (BOOL)_springboardPlatterStyle
{
  return -[UIPreviewParameters _previewMode](self->_parameters, "_previewMode") == 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 24), self->_view);
    -[UIDragPreview parameters](self, "parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v7;

    *(_BYTE *)(v5 + 17) = self->_avoidAnimation;
    -[UIDragPreview _springboardParameters](self, "_springboardParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    objc_storeStrong((id *)(v5 + 8), self->_preferredAnchorPoint);
    v12 = (id)v5;
  }

  return (id)v5;
}

- (UIView)view
{
  return self->_view;
}

- (UIDragPreviewParameters)parameters
{
  return self->_parameters;
}

- (BOOL)_preventAfterScreenUpdatesSnapshot
{
  return self->_preventAfterScreenUpdatesSnapshot;
}

- (void)_setPreventAfterScreenUpdatesSnapshot:(BOOL)a3
{
  self->_preventAfterScreenUpdatesSnapshot = a3;
}

- (BOOL)avoidAnimation
{
  return self->_avoidAnimation;
}

- (void)setAvoidAnimation:(BOOL)a3
{
  self->_avoidAnimation = a3;
}

- (NSDictionary)_springboardParameters
{
  return self->__springboardParameters;
}

- (void)set_springboardParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__springboardParameters, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_preferredAnchorPoint, 0);
}

@end
