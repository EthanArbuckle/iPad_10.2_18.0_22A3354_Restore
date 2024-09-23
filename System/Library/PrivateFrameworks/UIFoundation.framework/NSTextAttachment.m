@implementation NSTextAttachment

- (void)dealloc
{
  NSTextAttachmentView *wrapperView;
  objc_super v4;

  if (self->_cacheKey)
    objc_msgSend(+[NSTextAttachment imageCache](NSTextAttachment, "imageCache"), "removeObjectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));
  wrapperView = self->_wrapperView;
  if (wrapperView)
  {
    -[NSTextAttachmentView removeFromSuperview](wrapperView, "removeFromSuperview");

  }
  if ((NSTextAttachment *)-[NSTextAttachmentCell attachment](self->_attachmentCell, "attachment") == self)
    -[NSTextAttachmentCell setAttachment:](self->_attachmentCell, "setAttachment:", 0);

  v4.receiver = self;
  v4.super_class = (Class)NSTextAttachment;
  -[NSTextAttachment dealloc](&v4, sel_dealloc);
}

- (void)setImage:(UIImage *)image
{
  UIImage *v5;

  if (self->_image != image)
  {
    v5 = image;

    self->_image = image;
    self->_data = 0;

    self->_uti = 0;
    objc_msgSend(+[NSTextAttachment imageCache](NSTextAttachment, "imageCache"), "removeObjectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));

    self->_fileWrapperForContents = 0;
    -[NSTextAttachment _invalidateWrapperView](self, "_invalidateWrapperView");
  }
  if (_NSTextScalingTypeForCurrentEnvironment() == 2)
    -[NSTextAttachmentView setImage:](self->_wrapperView, "setImage:", image);
}

- (id)_cacheKey
{
  id result;

  result = self->_cacheKey;
  if (!result)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p"), self);
    self->_cacheKey = (NSString *)result;
  }
  return result;
}

+ (id)imageCache
{
  if (imageCache_onceToken != -1)
    dispatch_once(&imageCache_onceToken, &__block_literal_global_33);
  return (id)imageCache__imageCache;
}

- (void)_invalidateWrapperView
{
  -[NSTextAttachmentView removeFromSuperview](self->_wrapperView, "removeFromSuperview");

  self->_wrapperView = 0;
}

- (NSTextAttachment)init
{
  return -[NSTextAttachment initWithData:ofType:](self, "initWithData:ofType:", 0, 0);
}

- (void)_showWithBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6 applicationFrameworkContext:(int64_t)a7 acceptsViewProvider:(BOOL)a8
{
  _BOOL4 v8;
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  int64_t v20;

  v8 = a8;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = -[NSTextAttachment attachmentCell](self, "attachmentCell");
  if (v18)
  {
    v19 = v18;
    v20 = -[NSTextAttachment _characterIndexForLocation:textContainer:](self, "_characterIndexForLocation:textContainer:", a5, a6);
    if (a7 == 2)
      -[NSTextAttachment _showAttachmentCell_macOS:inRect:characterIndex:](self, "_showAttachmentCell_macOS:inRect:characterIndex:", v19, v20, x, y, width, height);
    else
      -[NSTextAttachment _showAttachmentCell_iOS:inRect:characterIndex:](self, "_showAttachmentCell_iOS:inRect:characterIndex:", v19, v20, x, y, width, height);
  }
  else if (!v8
         || !-[NSTextAttachment usesTextAttachmentView](self, "usesTextAttachmentView")
         || !objc_msgSend((id)objc_msgSend(a6, "textLayoutManager"), "viewProviderForTextAttachment:location:", self, a5))
  {
    -[NSTextAttachment _drawInAlignedRect:attributes:location:textContainer:applicationFrameworkContext:](self, "_drawInAlignedRect:attributes:location:textContainer:applicationFrameworkContext:", a4, a5, a6, a7, x, y, width, height);
  }
}

- (void)_drawInAlignedRect:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6 applicationFrameworkContext:(int64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  double v16;
  CGFloat v17;
  UIImage *v18;
  void *v19;
  UIImage *v20;
  uint64_t v21;
  CGContext *v22;
  void *v23;
  objc_class *v24;
  CGContext *v25;
  double v26;
  CGContext *v27;
  double v28;
  CGPoint v29;
  double v30;
  double v31;
  CGPoint v32;
  CGPoint v33;
  NSRect v34;
  NSRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self)
  {
    -[NSTextAttachment lineLayoutPadding](self, "lineLayoutPadding");
    if (v16 != 0.0)
    {
      v17 = v16;
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      v35 = NSInsetRect(v34, v17, 0.0);
      x = v35.origin.x;
      y = v35.origin.y;
      width = v35.size.width;
      height = v35.size.height;
    }
  }
  v18 = -[NSTextAttachment imageForBounds:attributes:location:textContainer:](self, "imageForBounds:attributes:location:textContainer:", a4, a5, a6, x, y, width, height);
  v19 = (void *)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", a7);
  v20 = -[NSTextAttachment image](self, "image");
  if (a7 == 2
    && v18 == v20
    && -[UIImage conformsToProtocol:](v18, "conformsToProtocol:", &unk_1EE095188)
    && -[UIImage willProvideAdaptedImageForPresentation](v18, "willProvideAdaptedImageForPresentation"))
  {
    v18 = (UIImage *)-[UIImage imageForBounds:attributes:location:textContainer:](v18, "imageForBounds:attributes:location:textContainer:", a4, a5, a6, x, y, width, height);
  }
  v21 = objc_msgSend(v19, "CGContext");
  if (v21)
  {
    v22 = (CGContext *)v21;
    v23 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("NSColor"));
    if (!v23)
    {
      if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
      {
        v24 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", a7);
      }
      else
      {
        v24 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
      }
      v23 = (void *)-[objc_class blackColor](v24, "blackColor");
    }
    CGContextSaveGState(v22);
    objc_msgSend(v23, "set");
    v25 = (CGContext *)objc_msgSend(v19, "CGContext");
    v26 = y - height;
    if (v25)
    {
      v27 = v25;
      v28 = x;
      v29 = CGContextConvertPointToDeviceSpace(v25, *(CGPoint *)(&v26 - 1));
      v33.x = floor(v29.x + 0.5);
      v33.y = floor(v29.y + 0.5);
      v32 = CGContextConvertPointToUserSpace(v27, v33);
      v31 = v32.y;
      v30 = v32.x;
    }
    else
    {
      v30 = floor(x + 0.5);
      v31 = floor(v26 + 0.5);
    }
    -[UIImage drawInRect:](v18, "drawInRect:", v30, v31, width, height);
    CGContextRestoreGState(v22);
  }
}

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v14;
  id v15;
  id v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((*(_WORD *)&self->_taFlags & 0x400) != 0)
    return -[NSTextAttachment imageForBounds:textContainer:characterIndex:](self, "imageForBounds:textContainer:characterIndex:", a6, -[NSTextAttachment _characterIndexForLocation:textContainer:](self, "_characterIndexForLocation:textContainer:", a5, a6), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (-[NSTextAttachment usesTextAttachmentView](self, "usesTextAttachmentView"))
  {
    v14 = (void *)MEMORY[0x18D7917B4]();
    v15 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "textLayoutManager"), "_viewProviderForTextAttachment:parentView:location:textContainer:", self, objc_msgSend(a6, "textView"), a5, a6), "previewImageForBounds:attributes:location:textContainer:", a4, a5, a6, x, y, width, height);
    objc_autoreleasePoolPop(v14);
    v16 = v15;
    if (v15)
      return v15;
  }
  return -[NSTextAttachment _image](self, "_image");
}

- (void)setBounds:(CGRect)bounds
{
  self->_bounds = bounds;
}

_UICache *__30__NSTextAttachment_imageCache__block_invoke()
{
  _UICache *result;

  result = objc_alloc_init(_UICache);
  imageCache__imageCache = (uint64_t)result;
  return result;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  id v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat rect2;
  CGFloat v59;
  double v60;
  CGFloat v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect result;
  CGRect v68;
  CGRect v69;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  -[NSTextAttachment bounds](self, "bounds");
  v60 = v15;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[NSTextAttachment lineLayoutPadding](self, "lineLayoutPadding");
  v23 = v22;
  v24 = -[NSTextAttachment attachmentCell](self, "attachmentCell");
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  if (CGRectGetWidth(v62) <= v23 + v23)
  {
    v56 = height;
    v26 = v60;
    v25 = width;
  }
  else
  {
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    v64 = CGRectInset(v63, v23, 0.0);
    x = v64.origin.x;
    y = v64.origin.y;
    v25 = v64.size.width;
    v56 = v64.size.height;
    v26 = v60;
  }
  v27 = *MEMORY[0x1E0C9D648];
  v68 = *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D648];
  v65.origin.x = v26;
  v65.origin.y = v17;
  v65.size.width = v19;
  v65.size.height = v21;
  v59 = v68.size.width;
  v61 = v68.origin.y;
  rect2 = v68.size.height;
  if (CGRectEqualToRect(v65, *MEMORY[0x1E0C9D648])
    && -[NSTextAttachment usesTextAttachmentView](self, "usesTextAttachmentView"))
  {
    v28 = (void *)MEMORY[0x18D7917B4]();
    v29 = (void *)objc_msgSend((id)objc_msgSend(a5, "textLayoutManager"), "_viewProviderForTextAttachment:parentView:location:textContainer:", self, objc_msgSend(a5, "textView"), a4, a5);
    if (objc_msgSend(v29, "tracksTextAttachmentViewBounds"))
    {
      objc_msgSend(v29, "attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:", a3, a4, a5, x, y, v25, v56, a7.x, a7.y);
      v26 = v30;
      v17 = v31;
      v19 = v32;
      v21 = v33;
    }
    objc_autoreleasePoolPop(v28);
  }
  if (v24)
  {
    v34 = -[NSTextAttachment _characterIndexForLocation:textContainer:](self, "_characterIndexForLocation:textContainer:", a4, a5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v24, "cellFrameForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", a5, v34, x, y, v25, v56, a7.x, a7.y);
LABEL_14:
      v26 = v35;
      v17 = v36;
      v19 = v37;
      v21 = v38;
      goto LABEL_17;
    }
    objc_msgSend(v24, "cellSize");
    v19 = v39;
    v21 = v40;
    v26 = 0.0;
    v17 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v24, "cellBaselineOffset");
      v26 = v41;
      v17 = v42;
    }
  }
  else if ((*(_WORD *)&self->_taFlags & 0x200) != 0)
  {
    -[NSTextAttachment attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:](self, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", a5, -[NSTextAttachment _characterIndexForLocation:textContainer:](self, "_characterIndexForLocation:textContainer:", a4, a5), x, y, v25, v56, a7.x, a7.y);
    goto LABEL_14;
  }
LABEL_17:
  v66.origin.x = v26;
  v66.origin.y = v17;
  v66.size.width = v19;
  v66.size.height = v21;
  v69.origin.x = v27;
  v69.size.width = v59;
  v69.origin.y = v61;
  v69.size.height = rect2;
  if (CGRectEqualToRect(v66, v69))
  {
    v43 = -[NSTextAttachment _image](self, "_image");
    if (v43)
    {
      v44 = v43;
      objc_msgSend(v43, "size");
      if (v45 != *MEMORY[0x1E0C9D820] || v46 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        v21 = v46;
        v19 = v45;
      }
      if (-[NSTextAttachment adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory", *(_QWORD *)&v56)&& (objc_msgSend(v44, "_isSymbolImage") & 1) == 0)
      {
        ((void (*)(uint64_t))softLink_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection[0])(0);
        v48 = v47;
        if (v47 != 1.0 && -[UIImage _CGPDFPage](-[NSTextAttachment image](self, "image"), "_CGPDFPage"))
        {
          -[UIImage _CGPDFPageSize](-[NSTextAttachment image](self, "image"), "_CGPDFPageSize");
          v19 = v49;
          v21 = v50;
        }
        v19 = v48 * v19;
        v21 = v48 * v21;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(v44, "hasBaseline")
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v44, "baselineOffsetFromBottom");
        v17 = v17 - v51;
      }
    }
  }
  v52 = v26;
  v53 = v17;
  v54 = v19;
  v55 = v21;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (CGFloat)lineLayoutPadding
{
  return self->_layoutPadding;
}

- (id)attachmentCell
{
  id result;
  BOOL v4;

  result = self->_wrapperView;
  if (result)
    v4 = 1;
  else
    v4 = __NSTextAttachmentAlwaysUsesAttachmentView == 0;
  if (!v4)
  {
    result = (id)objc_msgSend(objc_alloc((Class)getUITextAttachmentViewClass[0]()), "initWithTextAttachment:image:", self, -[NSTextAttachment _image](self, "_image"));
    self->_wrapperView = (NSTextAttachmentView *)result;
  }
  return result;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (Class)textAttachmentViewProviderClass
{
  NSString *v3;

  v3 = -[NSTextAttachment fileType](self, "fileType");
  if (-[NSTextAttachment allowsTextAttachmentView](self, "allowsTextAttachmentView") && v3)
    return (Class)objc_msgSend((id)objc_opt_class(), "textAttachmentViewProviderClassForFileType:", v3);
  else
    return 0;
}

- (BOOL)allowsTextAttachmentView
{
  return *(_WORD *)&self->_taFlags & 1;
}

- (NSString)fileType
{
  return -[UTType identifier](self->_uti, "identifier");
}

- (BOOL)usesTextAttachmentView
{
  return -[NSTextAttachment textAttachmentViewProviderClass](self, "textAttachmentViewProviderClass")
      || -[NSTextAttachment _hasTextAttachmentViewCell](self, "_hasTextAttachmentViewCell")
      || -[NSTextAttachment allowsTextAttachmentView](self, "allowsTextAttachmentView");
}

- (BOOL)_hasTextAttachmentViewCell
{
  return 0;
}

- (id)_image
{
  UIImage *v3;
  id v4;
  uint64_t v5;
  NSFileWrapper *fileWrapperForContents;
  NSData *v7;
  NSData *data;
  uint64_t (**v9)(void);
  NSFileWrapper *v10;
  _QWORD *v11;
  UIImage *v12;

  v3 = -[NSTextAttachment image](self, "image");
  if (v3)
    return v3;
  v4 = +[NSTextAttachment imageCache](NSTextAttachment, "imageCache");
  v3 = (UIImage *)objc_msgSend(v4, "objectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));
  if (v3)
    return v3;
  v5 = _NSTextScalingTypeForCurrentEnvironment();
  if (!-[UTType conformsToType:](self->_uti, "conformsToType:", *MEMORY[0x1E0CEC520])
    && !-[UTType conformsToType:](self->_uti, "conformsToType:", *MEMORY[0x1E0CEC570]))
  {
    goto LABEL_17;
  }
  fileWrapperForContents = self->_fileWrapperForContents;
  if (fileWrapperForContents)
  {
    if (-[NSFileWrapper isSymbolicLink](fileWrapperForContents, "isSymbolicLink"))
    {
      v7 = (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", -[NSFileWrapper symbolicLinkDestinationURL](self->_fileWrapperForContents, "symbolicLinkDestinationURL"));
    }
    else
    {
      if (!-[NSFileWrapper isRegularFile](self->_fileWrapperForContents, "isRegularFile"))
        goto LABEL_17;
      v7 = -[NSFileWrapper regularFileContents](self->_fileWrapperForContents, "regularFileContents");
    }
    data = v7;
    if (v7)
      goto LABEL_13;
LABEL_17:
    if (self->_uti)
      goto LABEL_28;
    goto LABEL_18;
  }
  data = self->_data;
  if (!data)
    goto LABEL_17;
LABEL_13:
  v9 = (uint64_t (**)(void))&getNSImageClass;
  if (v5 != 2)
    v9 = &getUIImageClass_0;
  v3 = (UIImage *)objc_msgSend(objc_alloc((Class)(*v9)()), "initWithData:", data);
  if (v3)
    goto LABEL_29;

  self->_fileWrapperForContents = 0;
  self->_data = 0;

  self->_uti = 0;
LABEL_18:
  v10 = self->_fileWrapperForContents;
  if (!v10)
    goto LABEL_24;
  if (-[NSFileWrapper isDirectory](v10, "isDirectory"))
  {
    v11 = (_QWORD *)MEMORY[0x1E0CEC4B8];
  }
  else
  {
    if (!-[NSFileWrapper isSymbolicLink](self->_fileWrapperForContents, "isSymbolicLink"))
      goto LABEL_24;
    v11 = (_QWORD *)MEMORY[0x1E0CEC5F8];
  }
  if (!*v11)
  {
LABEL_24:
    if (_image_onceToken != -1)
      dispatch_once(&_image_onceToken, &__block_literal_global_8);
    v3 = 0;
    if ((_image_usesDefaultIcon & 1) != 0 || !*MEMORY[0x1E0CEC4A0])
      return v3;
  }
LABEL_28:
  v3 = -[NSTextAttachment _imageForUTType_iOS:](self, "_imageForUTType_iOS:");
  v12 = v3;
  if (v3)
  {
LABEL_29:
    objc_msgSend(v4, "setObject:forKey:", v3, -[NSTextAttachment _cacheKey](self, "_cacheKey"));

  }
  return v3;
}

- (UIImage)image
{
  if (self->_wrapperView && _NSTextScalingTypeForCurrentEnvironment() == 2)
    return (UIImage *)-[NSTextAttachmentView image](self->_wrapperView, "image");
  else
    return self->_image;
}

- (NSTextAttachment)initWithData:(NSData *)contentData ofType:(NSString *)uti
{
  NSTextAttachment *v6;
  UTType *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSTextAttachment;
  v6 = -[NSTextAttachment init](&v9, sel_init);
  if (v6)
  {
    v6->_data = (NSData *)-[NSData copy](contentData, "copy");
    if (uti)
      v7 = (UTType *)(id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", uti);
    else
      v7 = 0;
    v6->_uti = v7;
    -[NSTextAttachment setEmbeddingType:](v6, "setEmbeddingType:", 0);
    -[NSTextAttachment setStandaloneAlignment:](v6, "setStandaloneAlignment:", 1);
    -[NSTextAttachment setAllowsTextAttachmentView:](v6, "setAllowsTextAttachmentView:", 1);
    -[NSTextAttachment _setAllocatesTextContainer:](v6, "_setAllocatesTextContainer:", 1);
    -[NSTextAttachment _setupAPIPreferences](v6, "_setupAPIPreferences");
  }
  return v6;
}

- (void)setStandaloneAlignment:(int64_t)a3
{
  char v3;

  v3 = a3;
  objc_sync_enter(self);
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xFF1F | (32 * (v3 & 7));
  objc_sync_exit(self);
}

- (void)setEmbeddingType:(int64_t)a3
{
  char v3;

  v3 = a3;
  objc_sync_enter(self);
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xFFE1 | (2 * (v3 & 0xF));
  objc_sync_exit(self);
}

- (void)setAllowsTextAttachmentView:(BOOL)allowsTextAttachmentView
{
  __int16 v3;

  v3 = allowsTextAttachmentView;
  objc_sync_enter(self);
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xFFFE | v3;
  objc_sync_exit(self);
}

- (void)_setupAPIPreferences
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  _QWORD block[9];

  v3 = objc_opt_class();
  if (objc_opt_class() != v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__NSTextAttachment__setupAPIPreferences__block_invoke;
    block[3] = &unk_1E2606288;
    block[4] = v3;
    block[5] = sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_;
    block[6] = sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_;
    block[7] = sel_imageForBounds_textContainer_characterIndex_;
    block[8] = sel_imageForBounds_attributes_location_textContainer_;
    if (_setupAPIPreferences_onceToken != -1)
      dispatch_once(&_setupAPIPreferences_onceToken, block);
    v4 = -[NSTextAttachment methodForSelector:](self, "methodForSelector:", sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_);
    if (v4 == _setupAPIPreferences_baseNewAttachmentBoundsAPI)
    {
      v5 = -[NSTextAttachment methodForSelector:](self, "methodForSelector:", sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_);
      if (v5 != _setupAPIPreferences_baseOldAttachmentBoundsAPI)
        *(_WORD *)&self->_taFlags |= 0x200u;
    }
    v6 = -[NSTextAttachment methodForSelector:](self, "methodForSelector:", sel_imageForBounds_attributes_location_textContainer_);
    if (v6 == _setupAPIPreferences_baseNewImageForAttachmentAPI)
    {
      v7 = -[NSTextAttachment methodForSelector:](self, "methodForSelector:", sel_imageForBounds_textContainer_characterIndex_);
      if (v7 != _setupAPIPreferences_baseOldImageForAttachmentAPI)
        *(_WORD *)&self->_taFlags |= 0x400u;
    }
    v8 = -[NSTextAttachment methodForSelector:](self, "methodForSelector:", sel_viewProviderForParentView_location_textContainer_);
    if (v8 == _setupAPIPreferences_baseClassViewProviderMethod)
    {
      v10 = -[NSTextAttachment methodForSelector:](self, "methodForSelector:", sel_viewProviderForParentView_characterIndex_layoutManager_);
      v9 = (v10 != _setupAPIPreferences_baseClassOldViewProviderMethod) << 14;
    }
    else
    {
      v9 = 0x4000;
    }
    *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xBFFF | v9;
  }
}

- (void)_setAllocatesTextContainer:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xFEFF | v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __NSTextAttachmentAlwaysUsesAttachmentView = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("__NSTextAttachmentAlwaysUsesAttachmentView"));
}

uint64_t __40__NSTextAttachment__setupAPIPreferences__block_invoke(uint64_t a1)
{
  uint64_t result;

  _setupAPIPreferences_baseOldAttachmentBoundsAPI = objc_msgSend(*(id *)(a1 + 32), "instanceMethodForSelector:", *(_QWORD *)(a1 + 40));
  _setupAPIPreferences_baseNewAttachmentBoundsAPI = objc_msgSend(*(id *)(a1 + 32), "instanceMethodForSelector:", *(_QWORD *)(a1 + 48));
  _setupAPIPreferences_baseOldImageForAttachmentAPI = objc_msgSend(*(id *)(a1 + 32), "instanceMethodForSelector:", *(_QWORD *)(a1 + 56));
  _setupAPIPreferences_baseNewImageForAttachmentAPI = objc_msgSend(*(id *)(a1 + 32), "instanceMethodForSelector:", *(_QWORD *)(a1 + 64));
  _setupAPIPreferences_baseClassViewProviderMethod = objc_msgSend(*(id *)(a1 + 32), "instanceMethodForSelector:", sel_viewProviderForParentView_location_textContainer_);
  result = objc_msgSend(*(id *)(a1 + 32), "instanceMethodForSelector:", sel_viewProviderForParentView_characterIndex_layoutManager_);
  _setupAPIPreferences_baseClassOldViewProviderMethod = result;
  return result;
}

+ (void)registerTextAttachmentClass:(Class)a3 forFileType:(id)a4
{
  id v7;

  if (a3 && a4)
  {
    objc_sync_enter(a1);
    v7 = (id)__NSTextAttachmentClassMappings;
    if (!__NSTextAttachmentClassMappings)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      __NSTextAttachmentClassMappings = (uint64_t)v7;
    }
    objc_msgSend(v7, "setValue:forKey:", a3, a4);
    objc_sync_exit(a1);
  }
}

- (id)_imageForUTType_iOS:(id)a3
{
  uint64_t v3;
  id result;

  v3 = objc_msgSend(MEMORY[0x1E0CA58C8], "documentProxyForName:type:MIMEType:", 0, objc_msgSend(a3, "identifier"), 0);
  result = (id)objc_msgSend((Class)getUIImageClass[0](), "_iconForResourceProxy:format:", v3, 3);
  if (!result)
  {
    result = (id)objc_msgSend((Class)getUIImageClass[0](), "_iconForResourceProxy:format:", v3, 6);
    if (!result)
    {
      result = (id)objc_msgSend((Class)getUIImageClass[0](), "_iconForResourceProxy:format:", v3, 4);
      if (!result)
        return (id)objc_msgSend((Class)getUIImageClass[0](), "_iconForResourceProxy:format:", v3, 7);
    }
  }
  return result;
}

- (int64_t)embeddingType
{
  return ((unint64_t)*(_WORD *)&self->_taFlags >> 1) & 0xF;
}

+ (Class)textAttachmentViewProviderClassForFileType:(NSString *)fileType
{
  objc_class *v5;
  void *v6;

  objc_sync_enter(a1);
  v5 = (objc_class *)objc_msgSend((id)__NSTextAttachmentViewProviderClassMappings, "objectForKeyedSubscript:", fileType);
  objc_sync_exit(a1);
  if (!v5)
  {
    v6 = (void *)objc_opt_class();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return (Class)objc_msgSend(v6, "textAttachmentViewProviderClassForFileType:", fileType);
    return 0;
  }
  return v5;
}

+ (void)registerTextAttachmentViewProviderClass:(Class)textAttachmentViewProviderClass forFileType:(NSString *)fileType
{
  id v7;

  if (textAttachmentViewProviderClass && fileType)
  {
    objc_sync_enter(a1);
    v7 = (id)__NSTextAttachmentViewProviderClassMappings;
    if (!__NSTextAttachmentViewProviderClassMappings)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      __NSTextAttachmentViewProviderClassMappings = (uint64_t)v7;
    }
    objc_msgSend(v7, "setValue:forKey:", textAttachmentViewProviderClass, fileType);
    objc_sync_exit(a1);
  }
}

- (void)_showAttachmentCell_iOS:(id)a3 inRect:(CGRect)a4 characterIndex:(unint64_t)a5
{
  double height;
  double width;
  double x;
  double v9;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  v9 = a4.origin.y - a4.size.height;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL || (objc_opt_respondsToSelector() & 1) == 0)
    objc_msgSend(a3, "drawWithFrame:inView:", 0, x, v9, width, height);
  else
    objc_msgSend(a3, "drawWithFrame:inView:characterIndex:", 0, a5, x, v9, width, height);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __26__NSTextAttachment__image__block_invoke()
{
  uint64_t result;

  result = _CFExecutableLinkedOnOrAfter();
  if (!(_DWORD)result)
    _image_usesDefaultIcon = 1;
  return result;
}

- (BOOL)_allocatesTextContainer
{
  return HIBYTE(*(_WORD *)&self->_taFlags) & 1;
}

- (NSTextAttachment)initWithFileWrapper:(NSFileWrapper *)fileWrapper
{
  NSTextAttachment *v4;
  NSFileWrapper *v5;
  NSString *v6;

  v4 = -[NSTextAttachment initWithData:ofType:](self, "initWithData:ofType:", 0, 0);
  if (v4)
  {
    v5 = fileWrapper;
    v4->_fileWrapperForContents = v5;
    v6 = -[NSString pathExtension](-[NSFileWrapper preferredFilename](v5, "preferredFilename"), "pathExtension");
    if (v6)
      v6 = (NSString *)(id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v6);
    v4->_uti = (UTType *)v6;
  }
  return v4;
}

- (NSData)contents
{
  return self->_data;
}

- (void)setContents:(NSData *)contents
{
  NSData *data;

  data = self->_data;
  if (data != contents)
  {

    self->_data = (NSData *)-[NSData copy](contents, "copy");
    self->_image = 0;
    objc_msgSend(+[NSTextAttachment imageCache](NSTextAttachment, "imageCache"), "removeObjectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));

    self->_fileWrapperForContents = 0;
  }
}

- (void)setFileType:(NSString *)fileType
{
  UTType *v5;

  if (!-[NSString isEqualToString:](fileType, "isEqualToString:", -[UTType identifier](self->_uti, "identifier")))
  {

    if (fileType)
      v5 = (UTType *)(id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", fileType);
    else
      v5 = 0;
    self->_uti = v5;

    self->_image = 0;
    objc_msgSend(+[NSTextAttachment imageCache](NSTextAttachment, "imageCache"), "removeObjectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));

    self->_fileWrapperForContents = 0;
  }
}

- (NSFileWrapper)fileWrapper
{
  NSFileWrapper *fileWrapperForContents;
  UTType *uti;
  uint64_t v5;
  const __CFString *v6;
  UIImage *image;
  NSFileWrapper *v8;
  const __CFString *v9;

  fileWrapperForContents = self->_fileWrapperForContents;
  if (!fileWrapperForContents)
  {
    if (self->_data)
    {
      uti = self->_uti;
      if (uti)
      {
        v5 = -[UTType preferredFilenameExtension](uti, "preferredFilenameExtension");
        if (v5)
          v6 = (const __CFString *)objc_msgSend(CFSTR("Attachment"), "stringByAppendingPathExtension:", v5);
        else
          v6 = CFSTR("Attachment");
        v8 = (NSFileWrapper *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", self->_data);
        fileWrapperForContents = v8;
        v9 = v6;
        goto LABEL_11;
      }
    }
    image = self->_image;
    if (image)
    {
      v8 = (NSFileWrapper *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", softLinkUIImagePNGRepresentation((uint64_t)image));
      fileWrapperForContents = v8;
      v9 = CFSTR("Attachment.png");
LABEL_11:
      -[NSFileWrapper setPreferredFilename:](v8, "setPreferredFilename:", v9);
      return fileWrapperForContents;
    }
    return 0;
  }
  return fileWrapperForContents;
}

- (void)setFileWrapper:(NSFileWrapper *)fileWrapper
{
  NSFileWrapper *v5;
  NSString *v6;

  if (self->_fileWrapperForContents != fileWrapper && (-[NSFileWrapper isEqual:](fileWrapper, "isEqual:") & 1) == 0)
  {
    v5 = fileWrapper;

    self->_fileWrapperForContents = fileWrapper;
    self->_image = 0;

    self->_data = 0;
    v6 = -[NSString pathExtension](-[NSFileWrapper preferredFilename](self->_fileWrapperForContents, "preferredFilename"), "pathExtension");
    if (v6)
      v6 = (NSString *)(id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v6);
    self->_uti = (UTType *)v6;
    objc_msgSend(+[NSTextAttachment imageCache](NSTextAttachment, "imageCache"), "removeObjectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));
    -[NSTextAttachment _invalidateWrapperView](self, "_invalidateWrapperView");
  }
}

- (void)encodeWithCoder:(id)a3
{
  NSString *image;
  const __CFString *v6;
  NSTextAttachmentCell *attachmentCell;
  double v8;
  char v9;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    if (self->_data && self->_uti)
    {
      objc_msgSend(a3, "encodeObject:forKey:");
      image = -[UTType identifier](self->_uti, "identifier");
      v6 = CFSTR("NS.fileType");
    }
    else
    {
      image = (NSString *)self->_image;
      if (!image)
      {
LABEL_12:
        if (-[NSTextAttachment embeddingType](self, "embeddingType"))
          objc_msgSend(a3, "encodeInt32:forKey:", -[NSTextAttachment embeddingType](self, "embeddingType"), CFSTR("NS.embeddingType"));
        if (-[NSTextAttachment standaloneAlignment](self, "standaloneAlignment") != 1)
          objc_msgSend(a3, "encodeInt32:forKey:", -[NSTextAttachment standaloneAlignment](self, "standaloneAlignment"), CFSTR("NS.standaloneAlignment"));
        if (!-[NSTextAttachment allowsTextAttachmentView](self, "allowsTextAttachmentView"))
          objc_msgSend(a3, "encodeBool:forKey:", -[NSTextAttachment allowsTextAttachmentView](self, "allowsTextAttachmentView"), CFSTR("NS.allowsTextAttachmentView"));
        -[NSTextAttachment lineLayoutPadding](self, "lineLayoutPadding");
        if (v8 != 0.0)
        {
          -[NSTextAttachment lineLayoutPadding](self, "lineLayoutPadding");
          objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.lineLayoutPadding"));
        }
        if (-[NSTextAttachment accessibilityLabel](self, "accessibilityLabel"))
          objc_msgSend(a3, "encodeObject:forKey:", -[NSTextAttachment accessibilityLabel](self, "accessibilityLabel"), CFSTR("NS.accessibilityLabel"));
        if (-[NSTextAttachment adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory"))objc_msgSend(a3, "encodeBool:forKey:", -[NSTextAttachment adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory"), CFSTR("NS.adjustsImageSizeForAccessibilityContentSizeCategory"));
        objc_msgSend(a3, "encodeObject:forKey:", -[NSTextAttachment fileWrapper](self, "fileWrapper"), CFSTR("NSFileWrapper"));
        if (self->_attachmentCell)
        {
          if ((*(_WORD *)&self->_taFlags & 0x800) != 0)
            objc_msgSend(a3, "encodeObject:forKey:");
        }
        return;
      }
      v6 = CFSTR("NS.image");
    }
    objc_msgSend(a3, "encodeObject:forKey:", image, v6);
    goto LABEL_12;
  }
  attachmentCell = self->_attachmentCell;
  if (attachmentCell)
    LODWORD(attachmentCell) = (*(_WORD *)&self->_taFlags >> 11) & 1;
  v9 = (char)attachmentCell;
  objc_msgSend(a3, "encodeValuesOfObjCTypes:", "c@", &v9, &self->_fileWrapperForContents);
  if (v9)
    objc_msgSend(a3, "encodeObject:", self->_attachmentCell);
}

- (NSTextAttachment)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  NSTextAttachment *v10;
  NSTextAttachment *v11;

  if (!objc_msgSend(a3, "allowsKeyedCoding"))
  {

    return 0;
  }
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.contents"));
  v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.fileType"));
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v11 = -[NSTextAttachment initWithData:ofType:](self, "initWithData:ofType:", v5, v6);
LABEL_13:
    v10 = v11;
    goto LABEL_14;
  }
  if (initWithCoder__onceToken_1 != -1)
    dispatch_once(&initWithCoder__onceToken_1, &__block_literal_global_52);
  v8 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", initWithCoder__imageClasses, CFSTR("NS.image"));
  if (!v8)
  {
    v11 = -[NSTextAttachment initWithFileWrapper:](self, "initWithFileWrapper:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSFileWrapper")));
    goto LABEL_13;
  }
  v9 = v8;
  v10 = -[NSTextAttachment initWithData:ofType:](self, "initWithData:ofType:", 0, 0);
  -[NSTextAttachment setImage:](v10, "setImage:", v9);
LABEL_14:
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.embeddingType")))
    -[NSTextAttachment setEmbeddingType:](v10, "setEmbeddingType:", (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NS.embeddingType")));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.standaloneAlignment")))
    -[NSTextAttachment setStandaloneAlignment:](v10, "setStandaloneAlignment:", (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NS.standaloneAlignment")));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.allowsTextAttachmentView")))
    -[NSTextAttachment setAllowsTextAttachmentView:](v10, "setAllowsTextAttachmentView:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.allowsTextAttachmentView")));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.lineLayoutPadding")))
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NS.lineLayoutPadding"));
    -[NSTextAttachment setLineLayoutPadding:](v10, "setLineLayoutPadding:");
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.accessibilityLabel")))
    -[NSTextAttachment setAccessibilityLabel:](v10, "setAccessibilityLabel:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.accessibilityLabel")));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.adjustsImageSizeForAccessibilityContentSizeCategory")))-[NSTextAttachment setAdjustsImageSizeForAccessibilityContentSizeCategory:](v10, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.adjustsImageSizeForAccessibilityContentSizeCategory")));
  return v10;
}

uint64_t __34__NSTextAttachment_initWithCoder___block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  result = objc_msgSend(v0, "initWithObjects:", getUIImageClass_0(), 0);
  initWithCoder__imageClasses = result;
  return result;
}

- (void)setContentView:(id)a3
{
  uint64_t v5;
  uint64_t (**v6)(void);
  NSTextAttachmentView *v7;

  if ((id)-[NSTextAttachmentView contentView](self->_wrapperView, "contentView") != a3)
  {
    v5 = _NSTextScalingTypeForCurrentEnvironment();
    v6 = (uint64_t (**)(void))&getNSTextAttachmentViewClass;
    if (v5 != 2)
      v6 = getUITextAttachmentViewClass;
    v7 = (NSTextAttachmentView *)objc_msgSend(objc_alloc((Class)(*v6)()), "initWithContentView:", a3);
    -[NSTextAttachmentView removeFromSuperview](self->_wrapperView, "removeFromSuperview");

    self->_wrapperView = v7;
    -[NSTextAttachmentView setAttachment:](v7, "setAttachment:", self);
  }
}

- (UIView)contentView
{
  return (UIView *)-[NSTextAttachmentView contentView](self->_wrapperView, "contentView");
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  CGFloat x;
  double y;
  double width;
  double height;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
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
  CGRect v38;
  CGRect v39;
  CGRect result;
  CGRect v41;
  CGRect v42;

  -[NSTextAttachment bounds](self, "bounds");
  v41 = *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D648];
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  v13 = *MEMORY[0x1E0C9D648];
  v14 = v41.origin.y;
  v15 = v41.size.width;
  v16 = v41.size.height;
  if (CGRectEqualToRect(v38, *MEMORY[0x1E0C9D648]))
  {
    if (-[NSTextAttachment usesTextAttachmentView](self, "usesTextAttachmentView"))
    {
      if (dyld_program_sdk_at_least())
      {
        v17 = objc_msgSend(a3, "layoutManager");
        if (v17)
        {
          v18 = -[NSTextAttachment viewProviderForParentView:characterIndex:layoutManager:](self, "viewProviderForParentView:characterIndex:layoutManager:", objc_msgSend(a3, "textView"), a6, v17);
          if (objc_msgSend(v18, "tracksTextAttachmentViewBounds"))
          {
            objc_msgSend(v18, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
            x = v19;
            y = v20;
            width = v21;
            height = v22;
          }
        }
      }
    }
  }
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  v42.origin.x = v13;
  v42.origin.y = v14;
  v42.size.width = v15;
  v42.size.height = v16;
  if (CGRectEqualToRect(v39, v42))
  {
    v23 = -[NSTextAttachment _image](self, "_image");
    if (v23)
    {
      v24 = v23;
      objc_msgSend(v23, "size");
      if (v25 != *MEMORY[0x1E0C9D820] || v26 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        height = v26;
        width = v25;
      }
      if (-[NSTextAttachment adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory")&& (objc_msgSend(v24, "_isSymbolImage") & 1) == 0)
      {
        ((void (*)(uint64_t))softLink_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection[0])(0);
        v28 = v27;
        if (v27 != 1.0 && -[UIImage _CGPDFPage](-[NSTextAttachment image](self, "image"), "_CGPDFPage"))
        {
          -[UIImage _CGPDFPageSize](-[NSTextAttachment image](self, "image"), "_CGPDFPageSize");
          width = v29;
          height = v30;
        }
        width = v28 * width;
        height = v28 * height;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(v24, "hasBaseline")
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v24, "baselineOffsetFromBottom");
        y = y - v31;
      }
    }
  }
  v32 = x;
  v33 = y;
  v34 = width;
  v35 = height;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (int64_t)standaloneAlignment
{
  return *(_WORD *)&self->_taFlags >> 5;
}

- (void)setLineLayoutPadding:(CGFloat)lineLayoutPadding
{
  self->_layoutPadding = lineLayoutPadding;
}

- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5
{
  void *v9;
  objc_class *v10;

  if (!-[NSTextAttachment usesTextAttachmentView](self, "usesTextAttachmentView"))
    return 0;
  v9 = (void *)objc_msgSend(a5, "viewProviderForTextAttachment:characterIndex:", self, a4);
  if (!v9)
  {
    v10 = -[NSTextAttachment textAttachmentViewProviderClass](self, "textAttachmentViewProviderClass");
    if (v10)
    {
      v9 = (void *)objc_msgSend([v10 alloc], "initWithTextAttachment:parentView:characterIndex:layoutManager:", self, a3, a4, a5);
      objc_msgSend(a5, "setViewProvider:forTextAttachment:characterIndex:", v9, self, a4);

      return v9;
    }
    return 0;
  }
  return v9;
}

- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  NSRect v18;
  NSRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((id)objc_msgSend(a3, "superview") != a5)
    -[NSTextAttachment detachView:fromParentView:](self, "detachView:fromParentView:", a3, a5);
  if (width < 0.0)
    width = 0.0;
  if (height < 0.0)
    height = 0.0;
  objc_msgSend(a3, "frame");
  v19.origin.x = v14;
  v19.origin.y = v15;
  v19.size.width = v16;
  v19.size.height = v17;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  if (!NSEqualRects(v18, v19))
    objc_msgSend(a3, "setFrame:", x, y, width, height);
  if ((id)objc_msgSend(a3, "superview") != a5)
    objc_msgSend(a5, "addSubview:", a3);
}

- (void)detachView:(id)a3 fromParentView:(id)a4
{
  if ((id)objc_msgSend(a3, "superview") == a4)
    objc_msgSend(a3, "removeFromSuperview");
}

+ (Class)textAttachmentClassForFileType:(id)a3
{
  objc_class *v5;

  objc_sync_enter(a1);
  v5 = (objc_class *)objc_msgSend((id)__NSTextAttachmentClassMappings, "objectForKeyedSubscript:", a3);
  objc_sync_exit(a1);
  return v5;
}

- (void)setIgnoresOrientation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xEFFF | v3;
}

- (BOOL)ignoresOrientation
{
  return (*(_WORD *)&self->_taFlags >> 12) & 1;
}

- (BOOL)_isEmojiImage
{
  return 0;
}

- (void)setAttachmentCell:(id)attachmentCell
{
  NSTextAttachmentCell *v4;
  NSTextAttachmentCell *v6;
  NSTextAttachmentCell *v7;

  v4 = self->_attachmentCell;
  if (v4 != attachmentCell)
  {
    v6 = v4;
    v7 = (NSTextAttachmentCell *)attachmentCell;
    self->_attachmentCell = v7;
    *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xF7FF | ((v7 != 0) << 11);
    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSTextAttachmentCell setAttachment:](self->_attachmentCell, "setAttachment:", self);
    }
  }
}

- (void)setAllowsEditingContents:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xDFFF | v3;
}

- (BOOL)allowsEditingContents
{
  return (*(_WORD *)&self->_taFlags >> 13) & 1;
}

- (NSString)description
{
  objc_super v3;
  objc_super v4;

  if (self->_fileWrapperForContents)
  {
    v4.receiver = self;
    v4.super_class = (Class)NSTextAttachment;
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \"%@\"), -[NSTextAttachment description](&v4, sel_description), -[NSFileWrapper preferredFilename](self->_fileWrapperForContents, "preferredFilename"));
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)NSTextAttachment;
    return -[NSTextAttachment description](&v3, sel_description);
  }
}

- (int64_t)_characterIndexForLocation:(id)a3 textContainer:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend(a4, "textLayoutManager"), "textContentManager");
  if (v5)
    return objc_msgSend(v5, "offsetFromLocation:toLocation:", objc_msgSend((id)objc_msgSend(v5, "documentRange"), "location"), a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a3, "characterIndex");
  else
    return 0;
}

- (void)_showWithBounds:(CGRect)a3 attributes:(__CFDictionary *)a4 runRange:(id)a5 textLayoutFragment:(id)a6 inContext:(CGContext *)a7
{
  id v8;
  int64_t var0;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v16;
  NSCountableTextLocation *v17;
  uint64_t v18;
  _NSCGTextGraphicsContext *v19;
  _QWORD v20[14];

  v8 = a6;
  var0 = a5.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a6
    && (v16 = (void *)objc_msgSend(a6, "textLayoutManager", a4, a5.var0, a5.var1),
        v17 = (NSCountableTextLocation *)(id)objc_msgSend((id)objc_msgSend(v8, "textParagraph"), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", var0, 0, 0), v8 = (id)objc_msgSend(v16, "applicationFrameworkContext"), v17))
  {
    v18 = objc_msgSend(v16, "textContainerForLocation:", v17);
  }
  else
  {
    v17 = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", var0);
    v18 = 0;
  }
  v19 = -[_NSCGTextGraphicsContext initWithCGContext:]([_NSCGTextGraphicsContext alloc], "initWithCGContext:", a7);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__NSTextAttachment__showWithBounds_attributes_runRange_textLayoutFragment_inContext___block_invoke;
  v20[3] = &unk_1E26062D0;
  v20[7] = v18;
  v20[8] = a7;
  *(CGFloat *)&v20[9] = x;
  *(CGFloat *)&v20[10] = y;
  *(CGFloat *)&v20[11] = width;
  *(CGFloat *)&v20[12] = height;
  v20[4] = self;
  v20[5] = a4;
  v20[6] = v17;
  v20[13] = v8;
  +[NSTextGraphicsContextProvider setCurrentTextGraphicsContext:duringBlock:](NSTextGraphicsContextProvider, "setCurrentTextGraphicsContext:duringBlock:", v19, v20);

}

uint64_t __85__NSTextAttachment__showWithBounds_attributes_runRange_textLayoutFragment_inContext___block_invoke(uint64_t a1)
{
  unsigned int Type;
  uint64_t v3;

  if (*(_QWORD *)(a1 + 64))
  {
    Type = CGContextGetType();
    if (Type <= 9)
      v3 = (0x1E9u >> Type) & 1;
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_showWithBounds:attributes:location:textContainer:applicationFrameworkContext:acceptsViewProvider:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 104), v3, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v14;
  uint64_t v15;

  v9 = -[NSTextAttachment usesTextAttachmentView](self, "usesTextAttachmentView");
  if (a5 && v9)
  {
    v10 = objc_msgSend(a5, "textLayoutManager");
    if (v10)
    {
      v11 = v10;
      v12 = -[NSTextAttachment textAttachmentViewProviderClass](self, "textAttachmentViewProviderClass");
      if (v12)
        return (id)objc_msgSend([v12 alloc], "initWithTextAttachment:parentView:textLayoutManager:location:", self, a3, v11, a4);
    }
    else
    {
      v14 = objc_msgSend(a5, "layoutManager");
      if (v14)
      {
        v15 = v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          return -[NSTextAttachment viewProviderForParentView:characterIndex:layoutManager:](self, "viewProviderForParentView:characterIndex:layoutManager:", a3, objc_msgSend(a4, "characterIndex"), v15);
      }
    }
  }
  return 0;
}

- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 location:(id)a6 textContainer:(id)a7 applicationFrameworkContext:(int64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  NSRect v19;
  NSRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((id)objc_msgSend(a3, "superview") != a5)
    -[NSTextAttachment detachView:fromParentView:](self, "detachView:fromParentView:", a3, a5);
  if (width < 0.0)
    width = 0.0;
  if (height < 0.0)
    height = 0.0;
  objc_msgSend(a3, "frame");
  v20.origin.x = v15;
  v20.origin.y = v16;
  v20.size.width = v17;
  v20.size.height = v18;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  if (!NSEqualRects(v19, v20))
    objc_msgSend(a3, "setFrame:", x, y, width, height);
  if ((id)objc_msgSend(a3, "superview") != a5)
    objc_msgSend(a5, "addSubview:", a3);
}

- (id)adaptiveImageGlyph
{
  NSAdaptiveImageGlyph *v3;
  NSAdaptiveImageGlyph *adaptiveImageGlyph;
  NSData *data;
  NSString *v6;
  NSAdaptiveImageGlyph *v7;

  objc_sync_enter(self);
  v3 = (NSAdaptiveImageGlyph *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  adaptiveImageGlyph = self->_adaptiveImageGlyph;
  if (adaptiveImageGlyph)
    goto LABEL_13;
  if (self->_data
    && -[UTType conformsToType:](self->_uti, "conformsToType:", +[NSAdaptiveImageGlyph contentType](NSAdaptiveImageGlyph, "contentType")))
  {
    data = self->_data;
    if (!data)
      goto LABEL_11;
  }
  else
  {
    v6 = -[NSString pathExtension](-[NSFileWrapper preferredFilename](self->_fileWrapperForContents, "preferredFilename"), "pathExtension");
    if (!v6
      || !objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v6), "conformsToType:", +[NSAdaptiveImageGlyph contentType](NSAdaptiveImageGlyph, "contentType"))|| (data = -[NSFileWrapper regularFileContents](self->_fileWrapperForContents, "regularFileContents")) == 0)
    {
LABEL_11:
      adaptiveImageGlyph = self->_adaptiveImageGlyph;
      if (adaptiveImageGlyph)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  adaptiveImageGlyph = -[NSAdaptiveImageGlyph initWithImageContent:]([NSAdaptiveImageGlyph alloc], "initWithImageContent:", data);
  self->_adaptiveImageGlyph = adaptiveImageGlyph;
  if (adaptiveImageGlyph)
    goto LABEL_13;
LABEL_12:
  adaptiveImageGlyph = v3;
  self->_adaptiveImageGlyph = adaptiveImageGlyph;
LABEL_13:
  if (v3 == adaptiveImageGlyph)
    v7 = 0;
  else
    v7 = adaptiveImageGlyph;
  objc_sync_exit(self);
  return v7;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_setAssociatedObject(self, &AccessibilityLabel, a3, (void *)0x301);
}

- (id)accessibilityLabel
{
  return objc_getAssociatedObject(self, &AccessibilityLabel);
}

@end
