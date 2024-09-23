@implementation SXPresentationAttributes

- (SXPresentationAttributes)init
{
  SXPresentationAttributes *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXPresentationAttributes;
  result = -[SXPresentationAttributes init](&v3, sel_init);
  if (result)
    result->_contentScaleFactor = 1.0;
  return result;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[SXPresentationAttributes contentSizeCategory](self, "contentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SXPresentationAttributes presentationMode](self, "presentationMode") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  SXPresentationAttributes *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  void *v15;
  int v16;
  unint64_t v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;

  v7 = (SXPresentationAttributes *)a3;
  if (v7 == self)
  {
    LOBYTE(v13) = 1;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v13) = 0;
    goto LABEL_25;
  }
  -[SXPresentationAttributes canvasSize](self, "canvasSize");
  v9 = v8;
  v11 = v10;
  -[SXPresentationAttributes canvasSize](v7, "canvasSize");
  LOBYTE(v13) = 0;
  if (v9 == v14 && v11 == v12)
  {
    -[SXPresentationAttributes contentSizeCategory](self, "contentSizeCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15
      || (-[SXPresentationAttributes contentSizeCategory](v7, "contentSizeCategory"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SXPresentationAttributes contentSizeCategory](self, "contentSizeCategory");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXPresentationAttributes contentSizeCategory](v7, "contentSizeCategory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isEqualToString:", v5))
      {
        LOBYTE(v13) = 0;
        goto LABEL_21;
      }
      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
    v17 = -[SXPresentationAttributes presentationMode](self, "presentationMode");
    if (v17 == -[SXPresentationAttributes presentationMode](v7, "presentationMode")
      && (v18 = -[SXPresentationAttributes fadeInComponents](self, "fadeInComponents"),
          v18 == -[SXPresentationAttributes fadeInComponents](v7, "fadeInComponents"))
      && (v19 = -[SXPresentationAttributes enableViewportDebugging](self, "enableViewportDebugging"),
          v19 == -[SXPresentationAttributes enableViewportDebugging](v7, "enableViewportDebugging"))
      && (v20 = -[SXPresentationAttributes testingConditionEnabled](self, "testingConditionEnabled"),
          v20 == -[SXPresentationAttributes testingConditionEnabled](v7, "testingConditionEnabled"))
      && (-[SXPresentationAttributes contentScaleFactor](self, "contentScaleFactor"),
          v22 = v21,
          -[SXPresentationAttributes contentScaleFactor](v7, "contentScaleFactor"),
          v22 == v23))
    {
      v24 = -[SXPresentationAttributes useTransparentToolbar](self, "useTransparentToolbar");
      v13 = v24 ^ -[SXPresentationAttributes useTransparentToolbar](v7, "useTransparentToolbar") ^ 1;
      if ((v16 & 1) == 0)
        goto LABEL_22;
    }
    else
    {
      LOBYTE(v13) = 0;
      if (!v16)
      {
LABEL_22:
        if (!v15)

        goto LABEL_25;
      }
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_25:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SXPresentationAttributes *v4;
  void *v5;

  v4 = objc_alloc_init(SXPresentationAttributes);
  -[SXPresentationAttributes canvasSize](self, "canvasSize");
  -[SXPresentationAttributes setCanvasSize:](v4, "setCanvasSize:");
  -[SXPresentationAttributes contentSizeCategory](self, "contentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXPresentationAttributes setContentSizeCategory:](v4, "setContentSizeCategory:", v5);

  -[SXPresentationAttributes setPresentationMode:](v4, "setPresentationMode:", -[SXPresentationAttributes presentationMode](self, "presentationMode"));
  -[SXPresentationAttributes setFadeInComponents:](v4, "setFadeInComponents:", -[SXPresentationAttributes fadeInComponents](self, "fadeInComponents"));
  -[SXPresentationAttributes setEnableViewportDebugging:](v4, "setEnableViewportDebugging:", -[SXPresentationAttributes enableViewportDebugging](self, "enableViewportDebugging"));
  -[SXPresentationAttributes setTestingConditionEnabled:](v4, "setTestingConditionEnabled:", -[SXPresentationAttributes testingConditionEnabled](self, "testingConditionEnabled"));
  -[SXPresentationAttributes contentScaleFactor](self, "contentScaleFactor");
  -[SXPresentationAttributes setContentScaleFactor:](v4, "setContentScaleFactor:");
  -[SXPresentationAttributes setUseTransparentToolbar:](v4, "setUseTransparentToolbar:", -[SXPresentationAttributes useTransparentToolbar](self, "useTransparentToolbar"));
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CGSize v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; attributes: \n"), objc_opt_class(), self);
  -[SXPresentationAttributes canvasSize](self, "canvasSize");
  NSStringFromCGSize(v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  canvasSize: %@; \n"), v4);

  -[SXPresentationAttributes contentSizeCategory](self, "contentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  contentSizeCategory: %@; \n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("  presentationMode: %i; \n"),
    -[SXPresentationAttributes presentationMode](self, "presentationMode"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  fadeInComponents: %i; \n"),
    -[SXPresentationAttributes fadeInComponents](self, "fadeInComponents"));
  -[SXPresentationAttributes contentScaleFactor](self, "contentScaleFactor");
  objc_msgSend(v3, "appendFormat:", CFSTR("  contentScaleFactor: %f; \n"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("  useTransparentToolbar: %i; \n"),
    -[SXPresentationAttributes useTransparentToolbar](self, "useTransparentToolbar"));
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_contentSizeCategory, a3);
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (BOOL)fadeInComponents
{
  return self->_fadeInComponents;
}

- (void)setFadeInComponents:(BOOL)a3
{
  self->_fadeInComponents = a3;
}

- (double)contentScaleFactor
{
  return self->_contentScaleFactor;
}

- (void)setContentScaleFactor:(double)a3
{
  self->_contentScaleFactor = a3;
}

- (BOOL)useTransparentToolbar
{
  return self->_useTransparentToolbar;
}

- (void)setUseTransparentToolbar:(BOOL)a3
{
  self->_useTransparentToolbar = a3;
}

- (BOOL)enableViewportDebugging
{
  return self->_enableViewportDebugging;
}

- (void)setEnableViewportDebugging:(BOOL)a3
{
  self->_enableViewportDebugging = a3;
}

- (BOOL)testingConditionEnabled
{
  return self->_testingConditionEnabled;
}

- (void)setTestingConditionEnabled:(BOOL)a3
{
  self->_testingConditionEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
}

@end
