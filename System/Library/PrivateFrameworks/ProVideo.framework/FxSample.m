@implementation FxSample

- (FxSample)init
{
  FxSample *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FxSample;
  v2 = -[FxSample init](&v4, sel_init);
  if (v2)
    v2->_priv = (FxSamplePriv *)malloc_type_calloc(1uLL, 0x20uLL, 0x10800409938AC02uLL);
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FxSamplePriv *priv;
  id var3;
  id var2;
  id var1;
  objc_super v13;

  FxDebugAssert(self->_priv != 0, CFSTR("_priv == NULL"), v2, v3, v4, v5, v6, v7, (char)v13.receiver);
  priv = self->_priv;
  if (priv)
  {
    var3 = priv->var3;
    if (var3)
    {

      priv = self->_priv;
    }
    var2 = priv->var2;
    if (var2)
    {

      priv = self->_priv;
    }
    var1 = priv->var1;
    if (var1)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v13.receiver = self;
  v13.super_class = (Class)FxSample;
  -[FxSample dealloc](&v13, sel_dealloc);
}

- (id)stream
{
  return self->_priv->var3;
}

- (void)setStream:(id)a3
{
  id var3;

  var3 = self->_priv->var3;
  if (var3 != a3)
  {
    if (var3)

    self->_priv->var3 = a3;
  }
}

- (double)time
{
  return self->_priv->var0;
}

- (void)setTime:(double)a3
{
  self->_priv->var0 = a3;
}

- (id)context
{
  return self->_priv->var1;
}

- (void)setContext:(id)a3
{
  id var1;

  var1 = self->_priv->var1;
  if (var1 != a3)
  {
    if (var1)

    self->_priv->var1 = a3;
  }
}

- (BOOL)supportsContextType:(int)a3
{
  return objc_msgSend((id)objc_msgSend(self->_priv->var3, "provider"), "isContextTypeSupported:bySample:", *(_QWORD *)&a3, self);
}

- (id)domainOfDefinition
{
  return (id)objc_msgSend((id)objc_msgSend(self->_priv->var3, "provider"), "domainOfDefinitionForSample:", self);
}

- (unint64_t)fieldOrder
{
  return objc_msgSend((id)objc_msgSend(self->_priv->var3, "provider"), "fieldOrderForSample:", self);
}

- (id)regionOfInterest
{
  id result;

  result = self->_priv->var2;
  if (!result)
    return +[FxShape infiniteShape](FxShape, "infiniteShape");
  return result;
}

- (void)setRegionOfInterest:(id)a3
{
  id var2;

  var2 = self->_priv->var2;
  if (var2 != a3)
  {
    if (var2)

    self->_priv->var2 = a3;
  }
}

- (BOOL)isPredetermined
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v3 = -[FxSample stream](self, "stream");
  FxDebugAssert(v3 != 0, CFSTR("stream is NULL in -requiredSamples."), v4, v5, v6, v7, v8, v9, v11);
  return objc_msgSend((id)objc_msgSend(v3, "provider"), "isSamplePredetermined:", self);
}

+ (id)_requiredSamplesForSamples:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_msgSend(a3, "objectEnumerator");
  v7 = objc_msgSend(v6, "nextObject");
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "stream"), "provider"), "requiredSamplesForSample:", v8);
      if (v9)
      {
        v10 = v9;
        if (!objc_msgSend(v9, "count"))
        {
          objc_msgSend(v10, "objectAtIndex:", 0);
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(a1, "_requiredSamplesForSamples:", v10));
        }
      }
      v8 = (void *)objc_msgSend(v6, "nextObject");
    }
    while (v8);
  }
  return v5;
}

- (id)requiredSamples
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v3 = -[FxSample stream](self, "stream") != 0;
  FxDebugAssert(v3, CFSTR("stream is NULL in -requiredSamples."), v4, v5, v6, v7, v8, v9, v11);
  return (id)objc_msgSend((id)objc_opt_class(), "_requiredSamplesForSamples:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self));
}

- (id)evaluateWithOptions:(id)a3
{
  FxSample *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __CFString *v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  id v42;
  CGImage *v43;
  CGContext *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  char v55;
  CGRect v56;

  v4 = self;
  v5 = -[FxSample stream](self, "stream");
  FxDebugAssert(v5 != 0, CFSTR("stream is NULL in -evaluateWithOptions:."), v6, v7, v8, v9, v10, v11, v53);
  v12 = (void *)objc_msgSend(v5, "provider");
  v13 = -[FxSample context](v4, "context");
  if (!v13)
    return (id)objc_msgSend(v12, "evaluateSample:withOptions:", v4, a3);
  v14 = v13;
  v15 = objc_msgSend(v13, "contextType");
  if (objc_msgSend(v12, "isContextTypeSupported:bySample:", v15, v4))
    return (id)objc_msgSend(v12, "evaluateSample:withOptions:", v4, a3);
  v17 = objc_msgSend(v14, "options");
  v18 = (void *)objc_msgSend(-[FxSample regionOfInterest](v4, "regionOfInterest"), "intersectWithShape:", -[FxSample domainOfDefinition](v4, "domainOfDefinition"));
  v19 = objc_msgSend(v18, "isInfinite");
  if (FxDebugAssert(v19 ^ 1u, CFSTR(" Cannot render an infinite DOD into an infinite ROI."), v20, v21, v22, v23, v24, v25, v54))
  {
    objc_msgSend(v18, "extent");
    switch((int)v15)
    {
      case 0:
        v37 = CFSTR("Unsupported FxContext conversion: kFxContextType_Invalid to anything");
        goto LABEL_64;
      case 1:
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 2, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: CGContext to CGImage");
          goto LABEL_64;
        }
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 3, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: GLTexture to CGImage");
          goto LABEL_64;
        }
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 4, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: GLContext to CGImage");
          goto LABEL_64;
        }
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 5, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: Bitmap to CGImage");
          goto LABEL_64;
        }
        if (!objc_msgSend(v12, "isContextTypeSupported:bySample:", 6, v4))
          return 0;
        v37 = CFSTR("Unsupported FxContext conversion: CIImage to CGImage");
        goto LABEL_64;
      case 2:
        v38 = v33;
        v39 = v34;
        v40 = v35;
        v41 = v36;
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 1, v4))
        {
          v42 = +[FxContext contextForCGImageWithOptions:](FxContext, "contextForCGImageWithOptions:", v17);
          -[FxSample setContext:](v4, "setContext:", v42);
          if (objc_msgSend((id)objc_msgSend(v5, "provider"), "evaluateSample:withOptions:", v4, a3))
          {
            v43 = (CGImage *)objc_msgSend(v42, "cgImage");
            v44 = (CGContext *)objc_msgSend(v14, "cgContext");
            v56.origin.x = v38;
            v56.origin.y = v39;
            v56.size.width = v40;
            v56.size.height = v41;
            CGContextDrawImage(v44, v56, v43);
            v45 = v14;
          }
          else
          {
            v45 = 0;
          }
          -[FxSample setContext:](v4, "setContext:", v14);
          return v45;
        }
        if ((objc_msgSend(v12, "isContextTypeSupported:bySample:", 6, v4) & 1) != 0)
          return v4;
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 3, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: GLTexture to CGContext");
          goto LABEL_64;
        }
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 4, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: GLContext to CGContext");
          goto LABEL_64;
        }
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 5, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: Bitmap to CGContext");
          goto LABEL_64;
        }
        return 0;
      case 3:
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 1, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: CGImage to GLTexture");
          goto LABEL_64;
        }
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 2, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: CGContext to GLTexture");
          goto LABEL_64;
        }
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 4, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: GLContext to GLTexture");
          goto LABEL_64;
        }
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 5, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: Bitmap to GLTexture");
          goto LABEL_64;
        }
        if (!objc_msgSend(v12, "isContextTypeSupported:bySample:", 6, v4))
          return 0;
        v37 = CFSTR("Unsupported FxContext conversion: CIImage to GLTexture");
        goto LABEL_64;
      case 4:
        if ((objc_msgSend(v12, "isContextTypeSupported:bySample:", 6, v4) & 1) != 0)
          return v4;
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 1, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: CGImage to GLContext");
          goto LABEL_64;
        }
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 2, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: CGContext to GLContext");
          goto LABEL_64;
        }
        if (!objc_msgSend(v12, "isContextTypeSupported:bySample:", 3, v4)
          && !objc_msgSend(v12, "isContextTypeSupported:bySample:", 5, v4))
        {
          return 0;
        }
        v37 = CFSTR("Unsupported FxContext conversion: Bitmap to GLContext");
        goto LABEL_64;
      case 5:
        if ((objc_msgSend(v12, "isContextTypeSupported:bySample:", 6, v4) & 1) != 0)
          return v4;
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 1, v4))
          FxDebugLog(CFSTR("Unsupported FxContext conversion: CGImage to Bitmap"), v46, v47, v48, v49, v50, v51, v52, v55);
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 2, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: CGContext to Bitmap");
          goto LABEL_64;
        }
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 3, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: GLTexture to Bitmap");
          goto LABEL_64;
        }
        if (!objc_msgSend(v12, "isContextTypeSupported:bySample:", 4, v4))
          return 0;
        v37 = CFSTR("Unsupported FxContext conversion: GLContext to Bitmap");
        goto LABEL_64;
      case 6:
        if ((objc_msgSend(v12, "isContextTypeSupported:bySample:", 3, v4) & 1) != 0
          || (objc_msgSend(v12, "isContextTypeSupported:bySample:", 5, v4) & 1) != 0)
        {
          return v4;
        }
        if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 1, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: CGImage to CIImage");
        }
        else if (objc_msgSend(v12, "isContextTypeSupported:bySample:", 2, v4))
        {
          v37 = CFSTR("Unsupported FxContext conversion: CGContext to CIImage");
        }
        else
        {
          if (!objc_msgSend(v12, "isContextTypeSupported:bySample:", 4, v4))
            return 0;
          v37 = CFSTR("Unsupported FxContext conversion: GLContext to CIImage");
        }
LABEL_64:
        FxDebugLog(&v37->isa, v26, v27, v28, v29, v30, v31, v32, v55);
        break;
      default:
        return 0;
    }
  }
  return 0;
}

@end
