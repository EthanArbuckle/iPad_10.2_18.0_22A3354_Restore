@implementation UIGraphicsRenderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusePool, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

- (UIGraphicsRenderer)initWithBounds:(CGRect)bounds format:(UIGraphicsRendererFormat *)format
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIGraphicsRendererFormat *v10;
  UIGraphicsRenderer *v11;
  uint64_t v12;
  UIGraphicsRendererFormat *v13;
  UIGraphicsRendererFormat *v14;
  void *v16;
  objc_super v17;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  v10 = format;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIGraphicsRenderer.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("format != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)UIGraphicsRenderer;
  v11 = -[UIGraphicsRenderer init](&v17, sel_init);
  if (v11)
  {
    v12 = -[UIGraphicsRendererFormat copy](v10, "copy");
    v13 = v11->_format;
    v11->_format = (UIGraphicsRendererFormat *)v12;

    v14 = v11->_format;
    v14->_bounds.origin.x = x;
    v14->_bounds.origin.y = y;
    v14->_bounds.size.width = width;
    v14->_bounds.size.height = height;
    -[UIGraphicsRenderer _configureReuseState](v11, "_configureReuseState");
  }

  return v11;
}

- (void)_configureReuseState
{
  _UIReusePool *v3;
  _UIReusePool *reusePool;

  if (objc_msgSend((id)objc_opt_class(), "_supportsContextReuse"))
  {
    v3 = -[_UIReusePool initWithPolicy:]([_UIReusePool alloc], "initWithPolicy:", 3);
    reusePool = self->_reusePool;
    self->_reusePool = v3;

  }
}

+ (BOOL)_supportsContextReuse
{
  return 1;
}

- (BOOL)runDrawingActions:(UIGraphicsDrawingActions)drawingActions completionActions:(UIGraphicsDrawingActions)completionActions error:(NSError *)error
{
  UIGraphicsDrawingActions v8;
  UIGraphicsDrawingActions v9;
  void *v10;

  v8 = completionActions;
  v9 = drawingActions;
  -[UIGraphicsRenderer format](self, "format");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(error) = -[UIGraphicsRenderer runDrawingActions:completionActions:format:error:](self, "runDrawingActions:completionActions:format:error:", v9, v8, v10, error);

  return (char)error;
}

- (UIGraphicsRendererFormat)format
{
  return self->_format;
}

- (BOOL)runDrawingActions:(id)a3 completionActions:(id)a4 format:(id)a5 error:(id *)a6
{
  void (**v10)(id, void *);
  void (**v11)(id, void *);
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, void *))a3;
  v11 = (void (**)(id, void *))a4;
  v12 = a5;
  v13 = (void *)objc_msgSend((id)objc_opt_class(), "rendererContextClass");
  if ((objc_msgSend(v13, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("*** Attempting to use a Class (%@) that is not a UIGraphicsRendererContext subclass as a UIGraphicsRenderer context."), v13);
  v14 = (void *)objc_opt_class();
  -[UIGraphicsRenderer format](self, "format");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "_contextWithFormat:renderer:", v15, self);

  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc((Class)v13), "initWithCGContext:format:", v16, v12);
    objc_msgSend(v17, "set__createsImages:", -[UIGraphicsRenderer allowsImageOutput](self, "allowsImageOutput"));
    objc_msgSend((id)objc_opt_class(), "prepareCGContext:withRendererContext:", v16, v17);
    if (v10)
    {
      -[UIGraphicsRenderer pushContext:](self, "pushContext:", v17);
      v10[2](v10, v17);
      -[UIGraphicsRenderer popContext:](self, "popContext:", v17);
    }
    if (v11)
      v11[2](v11, v17);
    objc_msgSend((id)objc_opt_class(), "_destroyCGContext:withRenderer:", v16, self);

  }
  else if (a6)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB28A8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("Could not create CGContextRef");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_retainAutorelease(v21);
    *a6 = v22;

  }
  return v16 != 0;
}

+ (CGContext)_contextWithFormat:(id)a3 renderer:(id)a4
{
  id v6;
  uint64_t v7;
  CGContext *v8;

  v6 = a3;
  v7 = objc_msgSend(a4, "_dequeueContextForReuse");
  if (v7)
  {
    v8 = (CGContext *)v7;
    CGContextResetState();
    CGContextClear();
  }
  else
  {
    v8 = (CGContext *)objc_msgSend(a1, "contextWithFormat:", v6);
  }

  return v8;
}

- (CGContext)_dequeueContextForReuse
{
  -[_UIReusePool reusableObject](self->_reusePool, "reusableObject");
  return (CGContext *)objc_claimAutoreleasedReturnValue();
}

- (void)popContext:(id)a3
{
  int *ContextStack;

  ContextStack = (int *)GetContextStack(0);
  PopContextFromStack(ContextStack);
}

+ (void)_destroyCGContext:(CGContext *)a3 withRenderer:(id)a4
{
  _QWORD *v5;
  id v6;

  v5 = a4;
  if (v5[2])
  {
    v6 = v5;
    objc_msgSend(v5, "_prepareContextForReuse:", a3);
    objc_msgSend(v6, "_enqueueContextForReuse:", a3);
LABEL_5:
    v5 = v6;
    goto LABEL_6;
  }
  if (a3)
  {
    v6 = v5;
    CGContextRelease(a3);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_enqueueContextForReuse:(CGContext *)a3
{
  -[_UIReusePool addObject:](self->_reusePool, "addObject:");

}

- (void)pushContext:(id)a3
{
  id v3;
  int v4;
  CGContext *v5;
  int *ContextStack;
  CGContextRef v7;
  int v8;
  int *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "__createsImages");
  v5 = (CGContext *)objc_msgSend(v3, "CGContext");

  ContextStack = (int *)GetContextStack(1);
  v7 = CGContextRetain(v5);
  v8 = *ContextStack;
  v9 = &ContextStack[6 * *ContextStack];
  *((_QWORD *)v9 + 1) = v7;
  v9[4] = v4;
  *((_QWORD *)v9 + 3) = 0;
  *ContextStack = v8 + 1;
}

+ (Class)rendererContextClass
{
  return (Class)objc_opt_class();
}

+ (CGContextRef)contextWithFormat:(UIGraphicsRendererFormat *)format
{
  return 0;
}

- (UIGraphicsRenderer)init
{
  return -[UIGraphicsRenderer initWithBounds:](self, "initWithBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (UIGraphicsRenderer)initWithBounds:(CGRect)bounds
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  UIGraphicsRenderer *v9;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  +[UIGraphicsRendererFormat preferredFormat](UIGraphicsRendererFormat, "preferredFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIGraphicsRenderer initWithBounds:format:](self, "initWithBounds:format:", v8, x, y, width, height);

  return v9;
}

- (BOOL)allowsImageOutput
{
  return 0;
}

@end
