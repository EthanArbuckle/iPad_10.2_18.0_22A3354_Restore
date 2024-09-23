@implementation UIImage

- (id)_imageWithImageAsset:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  char v16;
  UIImage *v17;

  v6 = a3;
  v7 = a4;
  -[UIImage _primitiveImageAsset](self, "_primitiveImageAsset");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v9;
  if (v8 == v9)
  {

  }
  else
  {
    v11 = v9;
    v12 = v8;
    if (!v9)
      goto LABEL_15;
    v11 = v9;
    v12 = v8;
    if (!v8)
      goto LABEL_15;
    v13 = objc_msgSend(v8, "isEqual:", v9);

    if (!v13)
      goto LABEL_16;
  }
  -[UIImage configuration](self, "configuration");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v15 = v14;
  if (v11 == v14)
  {

    goto LABEL_13;
  }
  if (!v14 || !v11)
  {

    v12 = v11;
LABEL_15:

LABEL_16:
LABEL_17:
    v17 = (UIImage *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
    -[UIImage _setImageAsset:](v17, "_setImageAsset:", v10);
    -[UIImage _setConfiguration:](v17, "_setConfiguration:", v7);
    goto LABEL_18;
  }
  v16 = objc_msgSend(v11, "isEqual:", v14);

  if ((v16 & 1) == 0)
    goto LABEL_17;
LABEL_13:
  v17 = self;
LABEL_18:

  return v17;
}

- (UIImage)imageWithTintColor:(UIColor *)color
{
  UIColor *v4;
  void *v5;

  v4 = color;
  -[UIImage _imageTintedWithColor:renderingMode:withUpdatedCGImage:](self, "_imageTintedWithColor:renderingMode:withUpdatedCGImage:", v4, -[UIImage renderingMode](self, "renderingMode"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v5;
}

- (UIImage)imageWithConfiguration:(UIImageConfiguration *)configuration
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  id v10;
  UIImageConfiguration *v11;
  UIImageConfiguration *v12;
  UIImageConfiguration *v13;
  UIImageConfiguration *v14;
  BOOL v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  int v22;
  uint64_t v23;
  UIImage *v24;
  UIImage *v25;

  +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, configuration, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIImage _isSymbolImage](self, "_isSymbolImage"))
  {
    -[UIImage symbolConfiguration](self, "symbolConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    if (!v6)
      goto LABEL_5;
    v7 = objc_opt_class();
    if (v7 == objc_opt_class())
    {

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_5:
        +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "configurationByApplyingConfiguration:", v6);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_22;
LABEL_21:
        if ((objc_msgSend(v10, "_isUnspecified") & 1) != 0)
        {
LABEL_22:
          v17 = 0;
LABEL_32:

          goto LABEL_33;
        }
        v10 = v10;
        v19 = v5;
        v20 = v19;
        if (v10 == v19)
        {

          v17 = 0;
          v10 = v20;
        }
        else
        {
          if (v19)
          {
            v21 = objc_msgSend(v10, "isEqual:", v19);

            if ((v21 & 1) != 0)
              goto LABEL_22;
          }
          else
          {

          }
          -[UIImage _primitiveImageAsset](self, "_primitiveImageAsset");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "imageWithConfiguration:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_32;
      }
    }
    v10 = v6;
    goto LABEL_21;
  }
  v11 = self->_configuration;
  v12 = v4;
  v13 = v11;
  if (v12 == v13)
  {

LABEL_16:
    v17 = 0;
    goto LABEL_39;
  }
  v14 = v13;
  if (v12)
    v15 = v13 == 0;
  else
    v15 = 1;
  if (v15)
  {

  }
  else
  {
    v16 = -[UIImageConfiguration isEqual:](v12, "isEqual:", v13);

    if (v16)
      goto LABEL_16;
  }
  -[UIImage _primitiveImageAsset](self, "_primitiveImageAsset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;
  if (v18)
  {
    objc_msgSend(v18, "imageWithConfiguration:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
    v22 = 1;
    goto LABEL_34;
  }
  v17 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
  objc_msgSend(v17, "_setConfiguration:", v12);
  v22 = 0;
LABEL_34:

  if (v17 && (objc_msgSend(v17, "isEqual:", self) & 1) == 0)
  {
    if (v22)
    {
      v23 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", v17);

      v17 = (void *)v23;
    }
    -[_UIImageContent variableValue](self->_content, "variableValue");
    objc_msgSend(v17, "_imageWithVariableValue:");
    v24 = (UIImage *)objc_claimAutoreleasedReturnValue();

    -[UIImage _configureImage:assumePreconfigured:](self, "_configureImage:assumePreconfigured:", v24, 1);
    self = v24;
    v17 = v24;
  }
LABEL_39:
  v25 = self;

  return v25;
}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  UIImageConfiguration *configuration;
  UIImageConfiguration *v4;
  uint64_t v5;
  char isKindOfClass;

  configuration = self->_configuration;
  if (configuration)
  {
    v4 = configuration;
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        configuration = 0;
        return (UIImageSymbolConfiguration *)configuration;
      }
    }
    configuration = self->_configuration;
  }
  return (UIImageSymbolConfiguration *)configuration;
}

- (int64_t)_effectiveRenderingModeWithSymbolConfiguration:(id)a3
{
  id v4;
  UIImageRenderingMode v5;

  v4 = a3;
  v5 = -[UIImage renderingMode](self, "renderingMode");
  if (v5 == UIImageRenderingModeAutomatic)
  {
    if (-[UIImage _isMultiColorSymbolImage](self, "_isMultiColorSymbolImage")
      && (objc_msgSend(v4, "_prefersMulticolor") & 1) != 0)
    {
      v5 = UIImageRenderingModeAlwaysOriginal;
    }
    else if (-[UIImage _isSymbolImage](self, "_isSymbolImage"))
    {
      v5 = UIImageRenderingModeAlwaysTemplate;
    }
    else
    {
      v5 = UIImageRenderingModeAlwaysOriginal;
    }
  }

  return v5;
}

- (BOOL)_isMultiColorSymbolImage
{
  return -[_UIImageContent containsNamedColorStyles](self->_content, "containsNamedColorStyles");
}

- (void)_configureImage:(id)a3 assumePreconfigured:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  char *v14;

  v4 = a4;
  v14 = (char *)a3;
  if (!v4)
  {
    -[UIImage configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setConfiguration:", v6);

  }
  if (-[UIImage _isSymbolImage](self, "_isSymbolImage") && !*((_QWORD *)v14 + 1))
  {
    objc_msgSend(v14, "_setImageAsset:", self->_imageAsset);
    objc_msgSend(v14, "_setNamed:", *(_DWORD *)&self->_imageFlags & 1);
    if (!v4)
      goto LABEL_9;
  }
  else if (!v4)
  {
    goto LABEL_9;
  }
  if (!-[UIImage _hasExplicitBaseline](self, "_hasExplicitBaseline"))
    goto LABEL_15;
LABEL_9:
  if (-[UIImage hasBaseline](self, "hasBaseline"))
  {
    -[UIImage baselineOffsetFromBottom](self, "baselineOffsetFromBottom");
    objc_msgSend(v14, "_setBaselineOffsetFromBottom:");
    if (!v4)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(v14, "_removeBaseline");
    if (!v4)
    {
LABEL_11:
      *((_QWORD *)v14 + 12) = *(_QWORD *)&self->_capHeight;
      *((_DWORD *)v14 + 26) = *((_DWORD *)v14 + 26) & 0xFFFDFFFF | (((*(_DWORD *)&self->_imageFlags >> 17) & 1) << 17);
      *(CGSize *)(v14 + 72) = self->_sizeInPixels;
      if (-[UIImage _hasExplicitContentInsets](self, "_hasExplicitContentInsets"))
        v7 = 0x4000;
      else
        v7 = 0;
      goto LABEL_17;
    }
  }
LABEL_15:
  if (!-[UIImage _hasExplicitContentInsets](self, "_hasExplicitContentInsets"))
    goto LABEL_18;
  v7 = 0x4000;
LABEL_17:
  -[UIImage _contentInsets](self, "_contentInsets");
  *((_QWORD *)v14 + 5) = v8;
  *((_QWORD *)v14 + 6) = v9;
  *((_QWORD *)v14 + 7) = v10;
  *((_QWORD *)v14 + 8) = v11;
  *((_DWORD *)v14 + 26) = *((_DWORD *)v14 + 26) & 0xFFFFBFFF | v7;
  if (v4)
  {
LABEL_18:
    if (!-[UIImage _hasExplicitAlignmentRectInsets](self, "_hasExplicitAlignmentRectInsets"))
      goto LABEL_20;
  }
  -[UIImage alignmentRectInsets](self, "alignmentRectInsets");
  objc_msgSend(v14, "_setAlignmentRectInsets:");
LABEL_20:
  if (-[UIImage flipsForRightToLeftLayoutDirection](self, "flipsForRightToLeftLayoutDirection"))
    objc_msgSend(v14, "_setIsFlippedInRightToLeft");
  v12 = *((_DWORD *)v14 + 26) & 0xFFFFF9FF | ((-[UIImage renderingMode](self, "renderingMode") & 3) << 9);
  *((_DWORD *)v14 + 26) = v12;
  *((_DWORD *)v14 + 26) = v12 & 0xFFFFFFDF | (32 * ((*(_DWORD *)&self->_imageFlags >> 5) & 1));
  -[UIImage _colorForFlattening](self, "_colorForFlattening");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setColorForFlattening:", v13);

  objc_msgSend(v14, "_setSuppressesAccessibilityHairlineThickening:", -[UIImage _suppressesAccessibilityHairlineThickening](self, "_suppressesAccessibilityHairlineThickening"));
}

- (BOOL)isSymbolImage
{
  return -[_UIImageContent isVectorGlyph](self->_content, "isVectorGlyph");
}

- (BOOL)isEqual:(id)a3
{
  UIImage *v4;
  UIImage *v5;
  _UIImageContent *v6;
  _UIImageContent *content;
  int v8;
  char v9;
  UIImageAsset *v10;
  int v11;
  UIImageAsset *imageAsset;
  int v13;
  _BOOL4 v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  UIImageOrientation v28;
  UIImageRenderingMode v29;
  _BOOL4 v30;
  _BOOL4 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = (UIImage *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UIImage content](v5, "content");
      v6 = (_UIImageContent *)objc_claimAutoreleasedReturnValue();
      content = self->_content;
      if (content == v6)
        v8 = 0;
      else
        v8 = !-[_UIImageContent isEqual:](content, "isEqual:", v6);
      -[UIImage _primitiveImageAsset](v5, "_primitiveImageAsset");
      v10 = (UIImageAsset *)objc_claimAutoreleasedReturnValue();
      v11 = dyld_program_sdk_at_least();
      imageAsset = self->_imageAsset;
      if (v11 && imageAsset == v10)
        v13 = 0;
      else
        v13 = !-[UIImageAsset isEqual:](imageAsset, "isEqual:", v10);
      v14 = -[UIImage hasBaseline](self, "hasBaseline");
      if (v14 == -[UIImage hasBaseline](v5, "hasBaseline"))
      {
        if (-[UIImage hasBaseline](self, "hasBaseline"))
        {
          -[UIImage baselineOffsetFromBottom](self, "baselineOffsetFromBottom");
          v17 = v16;
          -[UIImage baselineOffsetFromBottom](v5, "baselineOffsetFromBottom");
          v15 = vabdd_f64(v17, v18) > 0.0001;
        }
        else
        {
          v15 = 0;
        }
      }
      else
      {
        v15 = 1;
      }
      v19 = -[UIImage hasMidline](self, "hasMidline");
      if (v19 == -[UIImage hasMidline](v5, "hasMidline"))
      {
        if (-[UIImage hasMidline](self, "hasMidline"))
        {
          -[UIImage midlineOffsetFromCenter](self, "midlineOffsetFromCenter");
          v22 = v21;
          -[UIImage midlineOffsetFromCenter](v5, "midlineOffsetFromCenter");
          v24 = v22 != v23;
        }
        else
        {
          v24 = 0;
        }
        v9 = 0;
        if (((v8 | v13 | v15) & 1) != 0 || v24)
          goto LABEL_19;
        -[UIImage scale](self, "scale");
        v26 = v25;
        -[UIImage scale](v5, "scale");
        if (v26 == v27)
        {
          v28 = -[UIImage imageOrientation](self, "imageOrientation");
          if (v28 == -[UIImage imageOrientation](v5, "imageOrientation"))
          {
            v29 = -[UIImage renderingMode](self, "renderingMode");
            if (v29 == -[UIImage renderingMode](v5, "renderingMode"))
            {
              v30 = -[UIImage flipsForRightToLeftLayoutDirection](self, "flipsForRightToLeftLayoutDirection");
              if (v30 == -[UIImage flipsForRightToLeftLayoutDirection](v5, "flipsForRightToLeftLayoutDirection"))
              {
                v31 = -[UIImage _suppressesAccessibilityHairlineThickening](self, "_suppressesAccessibilityHairlineThickening");
                if (v31 == -[UIImage _suppressesAccessibilityHairlineThickening](v5, "_suppressesAccessibilityHairlineThickening"))
                {
                  -[UIImage alignmentRectInsets](self, "alignmentRectInsets");
                  v33 = v32;
                  v35 = v34;
                  v37 = v36;
                  v39 = v38;
                  -[UIImage alignmentRectInsets](v5, "alignmentRectInsets");
                  v9 = 0;
                  if (v35 == v43 && v33 == v40 && v39 == v42 && v37 == v41)
                  {
                    -[UIImage _colorForFlattening](self, "_colorForFlattening");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    -[UIImage _colorForFlattening](v5, "_colorForFlattening");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    if (UIEqual(v44, v45))
                    {
                      -[UIImage configuration](self, "configuration");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      -[UIImage configuration](v5, "configuration");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v9 = UIEqual(v46, v47);

                    }
                    else
                    {
                      v9 = 0;
                    }

                  }
                  goto LABEL_19;
                }
              }
            }
          }
        }
      }
      v9 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v9 = 0;
  }
LABEL_20:

  return v9;
}

- (BOOL)hasBaseline
{
  return (*((unsigned __int8 *)&self->_imageFlags + 1) >> 4) & 1;
}

- (CGFloat)scale
{
  CGFloat result;

  -[_UIImageContent scale](self->_content, "scale");
  return result;
}

- (CGSize)_sizeInPixels
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeInPixels.width;
  height = self->_sizeInPixels.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)hasMidline
{
  return 0;
}

- (id)_colorForFlattening
{
  return objc_getAssociatedObject(self, sel__colorForFlattening);
}

- (UIImageOrientation)imageOrientation
{
  unint64_t imageFlags;
  void *v6;

  imageFlags = self->_imageFlags;
  if ((imageFlags & 2) == 0)
    return (imageFlags >> 2) & 7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIImage.m"), 1862, CFSTR("Don’t know how to obtain orientation from <%p:%@>"), objc_opt_class(), self->_content);

  }
  return -[_UIImageContent orientation](self->_content, "orientation");
}

- (CGFloat)baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (UIImageConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return *((_BYTE *)&self->_imageFlags + 2) & 1;
}

- (id)_primitiveImageAsset
{
  return self->_imageAsset;
}

- (BOOL)_suppressesAccessibilityHairlineThickening
{
  double v3;

  if ((*((_BYTE *)&self->_imageFlags + 1) & 8) != 0)
    return 1;
  -[_UIImageContent scale](self->_content, "scale");
  return v3 == 1.0
      || +[UIDevice _isWatchCompanion](UIDevice, "_isWatchCompanion")
      || +[UIDevice _isWatch](UIDevice, "_isWatch")
      || -[UIImage _isSymbolImage](self, "_isSymbolImage");
}

- (UIImageRenderingMode)renderingMode
{
  return ((unint64_t)self->_imageFlags >> 9) & 3;
}

- (void)_setColorForFlattening:(id)a3
{
  objc_setAssociatedObject(self, sel__colorForFlattening, a3, (void *)1);
}

- (void)_setSuppressesAccessibilityHairlineThickening:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFF7FF | v3);
}

- (BOOL)_hasExplicitContentInsets
{
  return (*((unsigned __int8 *)&self->_imageFlags + 1) >> 6) & 1;
}

- (void)_setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void)_setAlignmentRectInsets:(UIEdgeInsets)a3
{
  if ((*((_BYTE *)&self->_imageFlags + 1) & 0x80) == 0)
    self->_alignmentRectInsets = a3;
}

- (id)_initWithOtherImage:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  UIImage *v7;
  UIImage *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIImage.m"), 1410, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherImage != nil"));

  }
  v6 = v5[2];
  if (v6)
    v7 = -[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", v6, objc_msgSend(v5, "imageOrientation"));
  else
    v7 = -[UIImage init](self, "init");
  v8 = v7;
  if (v7)
    objc_msgSend(v5, "_configureImage:assumePreconfigured:", v7, 0);

  return v8;
}

- (id)_initWithContent:(id)a3 orientation:(int64_t)a4
{
  id v6;
  UIImage *v7;
  _UIImageContent *v8;
  _UIImageContent *content;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  UIImageConfiguration *configuration;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIImage;
  v7 = -[UIImage init](&v15, sel_init);
  if (v7)
  {
    if (v6)
    {
      v8 = (_UIImageContent *)v6;
    }
    else
    {
      +[_UIImageContent empty](_UIImageContent, "empty");
      v8 = (_UIImageContent *)objc_claimAutoreleasedReturnValue();
    }
    content = v7->_content;
    v7->_content = v8;

    v7->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&v7->_imageFlags & 0xFFFFFFE3 | (4 * (a4 & 7)));
    -[_UIImageContent sizeInPixels](v7->_content, "sizeInPixels");
    +[UIImage _applyOrientation:toContentSizeInPixels:](UIImage, "_applyOrientation:toContentSizeInPixels:", a4);
    v7->_sizeInPixels.width = v10;
    v7->_sizeInPixels.height = v11;
    -[UIImage _defaultConfiguration](v7, "_defaultConfiguration");
    v12 = objc_claimAutoreleasedReturnValue();
    configuration = v7->_configuration;
    v7->_configuration = (UIImageConfiguration *)v12;

  }
  return v7;
}

+ (CGSize)_applyOrientation:(int64_t)a3 toContentSizeInPixels:(CGSize)result
{
  double height;
  double v5;

  if ((a3 & 2) != 0)
    height = result.height;
  else
    height = result.width;
  if ((a3 & 2) != 0)
    result.height = result.width;
  v5 = height;
  result.width = v5;
  return result;
}

- (id)_defaultConfiguration
{
  void *v2;
  void *v3;
  id v4;

  -[_UIImageContent scale](self->_content, "scale");
  +[UITraitCollection traitCollectionWithDisplayScale:](UITraitCollection, "traitCollectionWithDisplayScale:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (void *)objc_msgSend(v2, "imageConfiguration");
  v4 = v2;

  return v4;
}

- (void)_setImageAsset:(id)a3
{
  objc_storeStrong((id *)&self->_imageAsset, a3);
}

- (void)_setNamed:(BOOL)a3
{
  self->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFFFFE | a3);
}

- (void)_setBaselineOffsetFromBottom:(double)a3
{
  $6595B0E67A40C1ED63E9CC1684FA2626 imageFlags;

  imageFlags = self->_imageFlags;
  if ((*(_WORD *)&imageFlags & 0x2000) == 0)
  {
    self->_baselineOffsetFromBottom = a3;
    self->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&imageFlags | 0x1000);
  }
}

- (BOOL)_representsCIImageWhichSupportsIOSurfaceRendering
{
  _BOOL4 v3;

  v3 = -[_UIImageContent isCIImage](self->_content, "isCIImage");
  if (v3)
  {
    v3 = -[_UIImageContent canRenderCIImage](self->_content, "canRenderCIImage");
    if (v3)
      LOBYTE(v3) = !-[UIImage _isResizable](self, "_isResizable");
  }
  return v3;
}

- (BOOL)_hasExplicitBaseline
{
  return (*((unsigned __int8 *)&self->_imageFlags + 1) >> 5) & 1;
}

- (BOOL)_hasExplicitAlignmentRectInsets
{
  return *((unsigned __int8 *)&self->_imageFlags + 1) >> 7;
}

- (id)_imageWithVariableValue:(double)a3
{
  _UIImageContent *v4;
  UIImage *v5;
  UIImage *v6;

  -[_UIImageContent contentWithVariableValue:](self->_content, "contentWithVariableValue:", a3);
  v4 = (_UIImageContent *)objc_claimAutoreleasedReturnValue();
  if (self->_content == v4)
  {
    v5 = self;
  }
  else
  {
    -[UIImage _imageWithContent:](self, "_imageWithContent:", v4);
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_removeBaseline
{
  $6595B0E67A40C1ED63E9CC1684FA2626 imageFlags;

  imageFlags = self->_imageFlags;
  if ((*(_WORD *)&imageFlags & 0x2000) == 0)
  {
    self->_baselineOffsetFromBottom = 0.0;
    self->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&imageFlags & 0xFFFFEFFF);
  }
}

- (void)dealloc
{
  objc_super v3;

  _UISharedImageDealloc(self);
  if ((*(_BYTE *)&self->_imageFlags & 0x80) != 0)
    SetCachedPatternColor(self, 0);
  v3.receiver = self;
  v3.super_class = (Class)UIImage;
  -[UIImage dealloc](&v3, sel_dealloc);
}

- (BOOL)_isNamed
{
  return *(_DWORD *)&self->_imageFlags & 1;
}

- (id)content
{
  return self->_content;
}

- (UIEdgeInsets)_contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)_isResizable
{
  return 0;
}

- (BOOL)isHighDynamicRange
{
  return -[_UIImageContent isHDR](self->_content, "isHDR");
}

- (int64_t)_imageOrientationConsideringRTLForUserInterfaceLayoutDirection:(int64_t)a3
{
  UIImageOrientation v5;
  _BOOL4 v6;

  v5 = -[UIImage imageOrientation](self, "imageOrientation");
  if ((*((_BYTE *)&self->_imageFlags + 2) & 1) != 0
    && (v6 = +[UIView _enableRTL](UIView, "_enableRTL"), a3 == 1)
    && v6
    && !-[UIImage _isRTLImage](self, "_isRTLImage"))
  {
    return objc_msgSend((id)objc_opt_class(), "_horizontallyFlippedOrientationForOrientation:", v5);
  }
  else
  {
    return v5;
  }
}

- (NSTimeInterval)duration
{
  return 0.0;
}

+ (UIEdgeInsets)_edgeInsetsForStylePresetNames:(id)a3 scale:(double)a4 traitCollection:(id)a5
{
  id v7;
  __CFString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t j;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;
  UIEdgeInsets result;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (__CFString *)a5;
  if (objc_msgSend(v7, "count"))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v41;
      v13 = *(_QWORD *)off_1E1679120;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isEqualToString:", v13) & 1) == 0
            && !objc_msgSend(v15, "isEqualToString:", CFSTR("_UIKitBoldTintStyle")))
          {
            v23 = 0.0;
            v24 = 0.0;
            v25 = 0.0;
            v26 = 0.0;
            goto LABEL_23;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = v9;

    _UIKitGetTextEffectsCatalog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0D1A6E8]);
    objc_msgSend(v17, "setState:", 0);
    objc_msgSend(v17, "setValue:", 0);
    -[UITraitCollection _styleEffectAppearanceName](v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAppearanceName:", v18);

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      v23 = 0.0;
      v24 = 0.0;
      v25 = 0.0;
      v26 = 0.0;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v9, "styledInsetsForStylePresetName:styleConfiguration:foregroundColor:scale:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j), v17, 0, a4, (_QWORD)v36);
          v26 = v26 - v28 / a4;
          v25 = v25 - v29 / a4;
          v24 = v24 - v30 / a4;
          v23 = v23 - v31 / a4;
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v21);
    }
    else
    {
      v23 = 0.0;
      v24 = 0.0;
      v25 = 0.0;
      v26 = 0.0;
    }

LABEL_23:
  }
  else
  {
    v23 = 0.0;
    v24 = 0.0;
    v25 = 0.0;
    v26 = 0.0;
  }

  v32 = v26;
  v33 = v25;
  v34 = v24;
  v35 = v23;
  result.right = v35;
  result.bottom = v34;
  result.left = v33;
  result.top = v32;
  return result;
}

- (unint64_t)hash
{
  unint64_t result;

  result = -[_UIImageContent hash](self->_content, "hash");
  if (!result)
    return 305441741;
  return result;
}

- (BOOL)_hasBaseline
{
  return (*((unsigned __int8 *)&self->_imageFlags + 1) >> 4) & 1;
}

+ (BOOL)_isCGImageAlphaMask:(CGImage *)a3
{
  _BOOL4 IsMask;

  IsMask = CGImageIsMask(a3);
  if (IsMask)
    CGImageGetAlphaInfo(a3);
  return IsMask;
}

- (BOOL)_representsLayeredImage
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[UIImage _primitiveImageAsset](self, "_primitiveImageAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIImage imageAsset](self, "imageAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_layerStack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIGraphicsImageRendererFormat)imageRendererFormat
{
  return (UIGraphicsImageRendererFormat *)-[_UIImageContent imageRendererFormat](self->_content, "imageRendererFormat");
}

+ (id)_systemImageNamed:(id)a3 withConfiguration:(id)a4
{
  return (id)objc_msgSend(a1, "_systemImageNamed:withConfiguration:allowPrivate:", a3, a4, 1);
}

- (UITraitCollection)traitCollection
{
  return -[UIImageConfiguration _effectiveTraitCollectionForImageLookup](self->_configuration, "_effectiveTraitCollectionForImageLookup");
}

+ (id)_systemImageNamed:(id)a3
{
  return (id)objc_msgSend(a1, "_systemImageNamed:withConfiguration:", a3, 0);
}

- (NSInteger)topCapHeight
{
  double v2;

  -[UIImage capInsets](self, "capInsets");
  return (uint64_t)v2;
}

- (UIImage)imageWithTintColor:(UIColor *)color renderingMode:(UIImageRenderingMode)renderingMode
{
  return (UIImage *)-[UIImage _imageTintedWithColor:renderingMode:withUpdatedCGImage:](self, "_imageTintedWithColor:renderingMode:withUpdatedCGImage:", color, renderingMode, 0);
}

- (id)_imageTintedWithColor:(id)a3 renderingMode:(int64_t)a4 withUpdatedCGImage:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  UIGraphicsImageRenderer *v15;
  void *v16;
  id v17;
  _UIImageContent *content;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  UIImage *v29;
  double v30;
  double v31;

  v5 = a5;
  v8 = a3;
  if (v5)
  {
    -[UIImage content](self, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v11 = v10;
    v13 = v12;

    +[UIGraphicsImageRendererFormat defaultFormat](UIGraphicsImageRendererFormat, "defaultFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage scale](self, "scale");
    objc_msgSend(v14, "setScale:");
    v15 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v14, v11, v13);
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __66__UIImage__imageTintedWithColor_renderingMode_withUpdatedCGImage___block_invoke;
    v27 = &unk_1E16CAFA0;
    v30 = v11;
    v31 = v13;
    v28 = v8;
    v29 = self;
    -[UIGraphicsImageRenderer imageWithActions:](v15, "imageWithActions:", &v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease(v16);
    if (objc_msgSend(v17, "CGImage", v24, v25, v26, v27) && -[_UIImageContent isCGImage](self->_content, "isCGImage"))
    {
      content = self->_content;
      v19 = objc_retainAutorelease(v17);
      -[_UIImageContent contentWithCGImage:](content, "contentWithCGImage:", objc_msgSend(v19, "CGImage"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImage _imageWithContent:](self, "_imageWithContent:", v20);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
  }
  objc_msgSend(v17, "_setColorForFlattening:", v8);
  objc_msgSend(v17, "_setRenderingMode:", a4);
  if (-[UIImage _isResizable](self, "_isResizable"))
  {
    -[UIImage capInsets](self, "capInsets");
    objc_msgSend(v17, "resizableImageWithCapInsets:");
    v21 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v21;
  }
  if ((*((_BYTE *)&self->_imageFlags + 2) & 1) != 0)
  {
    objc_msgSend(v17, "imageFlippedForRightToLeftLayoutDirection");
    v22 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v22;
  }

  return v17;
}

- (void)_setRenderingMode:(int64_t)a3
{
  self->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFF9FF | ((a3 & 3) << 9));
}

- (void)_setSymbolMetricsFromNamedVectorGlyph:(id)a3
{
  id v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  double MinY;
  double MinX;
  double v18;
  double MaxY;
  double v20;
  double MaxX;
  double v22;
  double v23;
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
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  CGFloat width;
  CGFloat rect;
  double v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "scale");
    v40 = v5;
    objc_msgSend(v4, "contentBounds");
    v7 = v6;
    v9 = v8;
    rect = v10;
    v12 = v11;
    objc_msgSend(v4, "alignmentRect");
    x = v44.origin.x;
    width = v44.size.width;
    y = v44.origin.y;
    v38 = v44.origin.y;
    height = v44.size.height;
    v43 = v44.size.height;
    MinY = CGRectGetMinY(v44);
    v45.origin.x = v7;
    v45.origin.y = v9;
    v45.size.width = rect;
    v45.size.height = v12;
    v39 = MinY - CGRectGetMinY(v45);
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    MinX = CGRectGetMinX(v46);
    v47.origin.x = v7;
    v47.origin.y = v9;
    v47.size.width = rect;
    v47.size.height = v12;
    v18 = MinX - CGRectGetMinX(v47);
    v48.origin.x = v7;
    v48.origin.y = v9;
    v48.size.width = rect;
    v48.size.height = v12;
    MaxY = CGRectGetMaxY(v48);
    v49.origin.x = x;
    v49.origin.y = v38;
    v49.size.width = width;
    v49.size.height = v43;
    v20 = MaxY - CGRectGetMaxY(v49);
    v50.origin.x = v7;
    v50.origin.y = v9;
    v50.size.width = rect;
    v50.size.height = v12;
    MaxX = CGRectGetMaxX(v50);
    v51.origin.x = x;
    v51.origin.y = v38;
    v51.size.width = width;
    v51.size.height = v43;
    v22 = MaxX - CGRectGetMaxX(v51);
    if (v18 >= 0.0)
      v23 = v18;
    else
      v23 = 0.0;
    if (v18 >= 0.0)
      v24 = 0.0;
    else
      v24 = -v18;
    if (v22 >= 0.0)
      v25 = v22;
    else
      v25 = 0.0;
    if (v22 >= 0.0)
      v26 = 0.0;
    else
      v26 = -v22;
    -[UIImage _setContentInsets:](self, "_setContentInsets:", v39, v23, v20, v25, *(_QWORD *)&v38);
    objc_msgSend(v4, "baselineOffset");
    v28 = v27;
    v29 = v20 + v27;
    UIRoundToScale(v20 + v27, v40);
    -[UIImage _setBaselineOffsetFromBottom:](self, "_setBaselineOffsetFromBottom:");
    objc_msgSend(v4, "capHeight");
    UIRoundToScale(v30, v40);
    -[UIImage _setCapHeight:](self, "_setCapHeight:");
    objc_msgSend(v4, "pointSize");
    CTFontGetAscentForSystemFontOfSize();
    v32 = v31;
    objc_msgSend(v4, "pointSize");

    CTFontGetDescentForSystemFontOfSize();
    v34 = -v33;
    UIRoundToScale(v32, v40);
    v36 = v35;
    UIRoundToScale(v34, v40);
    -[UIImage _setAlignmentRectInsets:](self, "_setAlignmentRectInsets:", -(v36 - (v39 + v43 - v28)), v24, -(-v37 - v29), v26);
  }
}

- (void)_setContentInsets:(UIEdgeInsets)a3
{
  _UIImageContent *content;
  double v5;
  int8x16_t v6;
  float64x2_t v7;
  float64x2_t v8;

  if ((*((_BYTE *)&self->_imageFlags + 1) & 0x40) == 0)
  {
    content = self->_content;
    v7 = *(float64x2_t *)&self->_contentInsets.bottom;
    v8 = *(float64x2_t *)&self->_contentInsets.top;
    self->_contentInsets.top = fmax(a3.top, 0.0);
    self->_contentInsets.left = fmax(a3.left, 0.0);
    self->_contentInsets.bottom = fmax(a3.bottom, 0.0);
    self->_contentInsets.right = fmax(a3.right, 0.0);
    -[_UIImageContent scale](content, "scale");
    v6 = (int8x16_t)vmulq_n_f64(vsubq_f64(vaddq_f64(*(float64x2_t *)&self->_contentInsets.top, *(float64x2_t *)&self->_contentInsets.bottom), vaddq_f64(v8, v7)), v5);
    self->_sizeInPixels = (CGSize)vaddq_f64((float64x2_t)self->_sizeInPixels, (float64x2_t)vextq_s8(v6, v6, 8uLL));
  }
}

- (void)_setCapHeight:(double)a3
{
  self->_capHeight = a3;
  *(_DWORD *)&self->_imageFlags |= 0x20000u;
}

+ (UIImage)imageWithCGImage:(CGImageRef)cgImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation
{
  return -[UIImage initWithCGImage:scale:orientation:]([UIImage alloc], "initWithCGImage:scale:orientation:", cgImage, orientation, scale);
}

- (UIImage)initWithCGImage:(CGImageRef)cgImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation
{
  _UIImageCGImageContent *v7;
  UIImage *v8;

  if (cgImage)
  {
    v7 = -[_UIImageCGImageContent initWithCGImage:scale:]([_UIImageCGImageContent alloc], "initWithCGImage:scale:", cgImage, scale);
    v8 = -[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", v7, orientation);
    self = (UIImage *)v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)drawInRect:(CGRect)rect blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v12;
  double v13;
  double *CurrentContextAuxInfo;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  double *v19;
  _QWORD *ContextStack;
  CGContext *v21;
  double v22;
  double v23;
  CGFloat MinX;
  CGFloat MinY;
  void *v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  if (!CGRectIsEmpty(rect))
  {
    -[UIImage size](self, "size");
    if (v13 > 0.0 && v12 > 0.0)
    {
      CurrentContextAuxInfo = (double *)GetCurrentContextAuxInfo(1);
      if (!CurrentContextAuxInfo || (v15 = *CurrentContextAuxInfo, *CurrentContextAuxInfo == 0.0))
      {
        -[UIImage scale](self, "scale");
        v15 = v16;
      }
      +[_UIImageContentLayoutDrawingTarget targetWithSize:scale:](width, height, v15);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      +[_UIImageContentLayout layoutForSource:inTarget:withSize:](_UIImageContentLayout, "layoutForSource:inTarget:withSize:", self, width, height);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17 && (*(_BYTE *)(v17 + 8) & 1) != 0)
      {
        v19 = (double *)MEMORY[0x1E0C9D538];
        ContextStack = GetContextStack(0);
        if (*(int *)ContextStack < 1)
          v21 = 0;
        else
          v21 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
        v23 = *v19;
        v22 = v19[1];
        CGContextSaveGState(v21);
        CGContextSetBlendMode(v21, blendMode);
        CGContextSetAlpha(v21, alpha);
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = width;
        v28.size.height = height;
        MinX = CGRectGetMinX(v28);
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        MinY = CGRectGetMinY(v29);
        CGContextTranslateCTM(v21, MinX, MinY);
        objc_msgSend(v18, "contentsMultiplyColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[UIImage renderingMode](self, "renderingMode") == UIImageRenderingModeAlwaysTemplate || v26)
        {
          v30.origin.x = v23;
          v30.origin.y = v22;
          v30.size.width = width;
          v30.size.height = height;
          CGContextBeginTransparencyLayerWithRect(v21, v30, 0);
          -[UIImage _drawInContext:rect:layout:scale:applyContentsTransform:](self, "_drawInContext:rect:layout:scale:applyContentsTransform:", v21, v18, 1, v23, v22, width, height, v15);
          objc_msgSend(v26, "setFill");
          v31.origin.x = v23;
          v31.origin.y = v22;
          v31.size.width = width;
          v31.size.height = height;
          UIRectFillUsingBlendMode(v31, kCGBlendModeSourceIn);
          CGContextEndTransparencyLayer(v21);
        }
        else
        {
          -[UIImage _drawInContext:rect:layout:scale:applyContentsTransform:](self, "_drawInContext:rect:layout:scale:applyContentsTransform:", v21, v18, 1, v23, v22, width, height, v15);
        }
        CGContextRestoreGState(v21);

      }
    }
  }
}

- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3
{
  return 0;
}

- (BOOL)_isSubimage
{
  return 0;
}

- (CGRect)_contentStretchInPixels
{
  double v2;
  double v3;
  double width;
  double height;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  width = self->_sizeInPixels.width;
  height = self->_sizeInPixels.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIEdgeInsets)capInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)_imageWithContent:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
    v7 = (void *)v6;
    if (v6)
      objc_storeStrong((id *)(v6 + 16), a3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (UIImage)imageNamed:(NSString *)name
{
  return (UIImage *)objc_msgSend(a1, "imageNamed:inBundle:withConfiguration:", name, 0, 0);
}

- (UIImageSymbolConfiguration)_automaticSymbolConfiguration
{
  return -[_UIImageContent _automaticSymbolConfiguration](self->_content, "_automaticSymbolConfiguration");
}

- (UIImage)imageByApplyingSymbolConfiguration:(UIImageSymbolConfiguration *)configuration
{
  UIImageSymbolConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = configuration;
  -[UIImage symbolConfiguration](self, "symbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationByApplyingConfiguration:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = v6;
  else
    v8 = (uint64_t)v4;
  -[UIImage imageWithConfiguration:](self, "imageWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v9;
}

- (BOOL)_isHierarchicalColorSymbolImage
{
  return -[_UIImageContent numberOfHierarchyLayers](self->_content, "numberOfHierarchyLayers") > 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_siblingImages, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
}

- (NSArray)images
{
  return 0;
}

- (CGImageRef)CGImage
{
  return -[_UIImageContent CGImage](self->_content, "CGImage");
}

- (CIImage)CIImage
{
  return -[_UIImageContent CIImage](self->_content, "CIImage");
}

- (void)drawInRect:(CGRect)rect
{
  -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", 0, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, 1.0);
}

uint64_t __66__UIImage__imageTintedWithColor_renderingMode_withUpdatedCGImage___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "set");
  UIRectFillUsingOperation(1, 0.0, 0.0, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "_contentInsets");
  return objc_msgSend(*(id *)(a1 + 40), "drawAtPoint:blendMode:alpha:", 22, -v2, -v3, 1.0);
}

- (void)drawAtPoint:(CGPoint)point blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
  uint64_t v6;
  double y;
  double x;
  double v10;
  double v11;

  v6 = *(_QWORD *)&blendMode;
  y = point.y;
  x = point.x;
  -[UIImage size](self, "size");
  -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", v6, x, y, v10, v11, alpha);
}

uint64_t __27__UIImage__rasterizedImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *(double *)(a1 + 40), *(double *)(a1 + 48), 1.0);
}

- (BOOL)_isInvisibleAndGetIsTranslucent:(BOOL *)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIImage *v11;
  __int16 BitmapInfo;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  unsigned int v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  _QWORD *ContextStack;
  CGContext *v23;
  char *Data;
  int Width;
  int Height;
  int BytesPerRow;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char *v33;
  uint64_t v34;
  char v35;
  char *v36;
  uint64_t v37;
  int v38;
  int v39;
  char v40;
  int v41;
  BOOL v43;
  void *v45;
  char v46;

  objc_getAssociatedObject(self, &unk_1ECD79862);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(self, &unk_1ECD79863);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[UIImage size](self, "size");
    v8 = v7;
    v10 = v9;
    v11 = objc_retainAutorelease(self);
    BitmapInfo = CGImageGetBitmapInfo(-[UIImage CGImage](v11, "CGImage"));
    v13 = 1;
    if (v8 == 0.0)
    {
      v14 = 1;
    }
    else
    {
      v14 = 1;
      if (v10 != 0.0)
      {
        v15 = BitmapInfo;
        v16 = BitmapInfo & 0x1F;
        if (v16 <= 6 && ((1 << v16) & 0x61) != 0)
        {
          v13 = 0;
          v14 = 0;
        }
        else
        {
          -[UIImage size](v11, "size", 1);
          v18 = v17;
          v20 = v19;
          -[UIImage scale](v11, "scale");
          _UIGraphicsBeginImageContextWithOptions(0, 0, v18, v20, v21);
          -[UIImage drawInRect:](v11, "drawInRect:", 0.0, 0.0, v18, v20);
          ContextStack = GetContextStack(0);
          if (*(int *)ContextStack < 1)
            v23 = 0;
          else
            v23 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
          Data = (char *)CGBitmapContextGetData(v23);
          Width = CGBitmapContextGetWidth(v23);
          Height = CGBitmapContextGetHeight(v23);
          BytesPerRow = CGBitmapContextGetBytesPerRow(v23);
          v28 = v16 == 2 || v16 == 4;
          v29 = 3;
          if (v28)
            v29 = 0;
          if ((v15 & 0x7000) == 0x2000)
            v30 = v29 ^ 3;
          else
            v30 = v29;
          if (Height < 1)
          {
            v32 = 0;
            v35 = 1;
          }
          else
          {
            v31 = 0;
            v32 = 0;
            v33 = &Data[v30];
            v34 = Height;
            v35 = 1;
            do
            {
              if (Width <= 0)
              {
                v40 = v32;
                v41 = v35 & 1;
              }
              else
              {
                v36 = v33;
                v37 = 1;
                do
                {
                  v39 = *v36;
                  v36 += 4;
                  v38 = v39;
                  if (v39)
                    v35 = 0;
                  if (v38 != 255)
                    v32 = 1;
                  v40 = v32;
                  v41 = v35 & 1;
                  if (!(((v32 & 1) == 0) | v41))
                    break;
                }
                while (v37++ < Width);
              }
              if (v41)
                v43 = 1;
              else
                v43 = v40 == 0;
              ++v31;
              v33 += BytesPerRow;
            }
            while (v43 && v31 != v34);
          }
          UIGraphicsEndImageContext();
          v13 = v32 & 1;
          v14 = v35 & 1;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setAssociatedObject(v11, &unk_1ECD79862, v5, (void *)1);
    objc_setAssociatedObject(v11, &unk_1ECD79863, v45, (void *)1);
    v6 = v45;
  }
  if (a3)
    *a3 = objc_msgSend(v6, "BOOLValue");
  v46 = objc_msgSend(v5, "BOOLValue");

  return v46;
}

- (NSString)_asMenuElementImageName
{
  return 0;
}

- (UIImage)initWithContentsOfFile:(id)a3 cache:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CGImageSource *v7;
  id v8;
  _UIImageCGImageContent *v9;
  UIImage *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  double v19;
  uint64_t v20;

  v4 = a4;
  v6 = a3;
  v19 = 0.0;
  v20 = 0;
  v18 = 0;
  v7 = _UIImageSourceAtPath(v6, v4, (unint64_t)&v20, &v19, &v18);
  v8 = v18;
  if (v7)
  {
    v9 = [_UIImageCGImageContent alloc];
    v10 = -[_UIImageCGImageContent initWithCGImageSource:scale:](v9, "initWithCGImageSource:scale:", v7, v19);
    CFRelease(v7);
    if (v10)
    {
      v11 = -[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", v10, v20);
      if (dyld_program_sdk_at_least())
        v12 = v8;
      else
        v12 = v6;
      v13 = v12;
      _UserInterfaceTraitFromPath(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        v16 = (void *)objc_msgSend(v14, "imageConfiguration");
      else
        v16 = 0;
      objc_storeStrong(v11 + 4, v16);

      self = v11;
      v10 = self;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[UIScreen _mainScreenThreadSafeTraitCollection](UIScreen, "_mainScreenThreadSafeTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unint64_t)_scaleDefinedByPath:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("@"), 4);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "substringWithRange:", v4 + 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    if (v7)
      v5 = v7;
  }

  return v5;
}

+ (int64_t)_idiomDefinedByPath:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("~"), 4);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "substringFromIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "rangeOfString:", CFSTR("iphone")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v6, "rangeOfString:", CFSTR("ipad")) == 0x7FFFFFFFFFFFFFFFLL)
        v5 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v5 = 1;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

+ (UIImage)imageWithData:(NSData *)data
{
  NSData *v3;
  UIImage *v4;

  v3 = data;
  v4 = -[UIImage initWithData:]([UIImage alloc], "initWithData:", v3);

  return v4;
}

- (UIImage)initWithData:(NSData *)data
{
  return (UIImage *)-[UIImage _initWithData:preserveScale:cache:](self, "_initWithData:preserveScale:cache:", data, 0, 0);
}

- (id)_initWithData:(id)a3 preserveScale:(BOOL)a4 cache:(BOOL)a5
{
  return -[UIImage _initWithData:preserveScale:cache:scale:](self, "_initWithData:preserveScale:cache:scale:", a3, a4, a5, 1.0);
}

- (id)_initWithData:(id)a3 preserveScale:(BOOL)a4 cache:(BOOL)a5 scale:(double)a6
{
  double *v7;
  CGImageRef v8;
  CGImage *v9;
  _UIImageCGImageContent *v10;
  _UIImageCGImageContent *v11;
  id v12;
  uint64_t v14;
  double v15;

  v15 = a6;
  v14 = 0;
  if (a4)
    v7 = &v15;
  else
    v7 = 0;
  v8 = _UIImageRefFromData(a3, a5, (unint64_t)&v14, v7);
  if (v8)
  {
    v9 = v8;
    v10 = [_UIImageCGImageContent alloc];
    v11 = -[_UIImageCGImageContent initWithCGImage:scale:](v10, "initWithCGImage:scale:", v9, v15);
    v12 = -[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", v11, v14);

    CGImageRelease(v9);
  }
  else
  {

    return 0;
  }
  return v12;
}

+ (id)_systemImageNamed:(id)a3 fallback:(id)a4 withConfiguration:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
    goto LABEL_8;
  v10 = dyld_program_sdk_at_least();
  if (v8)
  {
    if (!v10)
      goto LABEL_8;
  }
  if (v9)
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v7, v9);
  else
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_8:
    _UIImageWithName(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)_systemImageNamed:(id)a3 withConfiguration:(id)a4 allowPrivate:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  id v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIImageCacheKey keyWithSystemName:private:configuration:](_UIImageCacheKey, "keyWithSystemName:private:configuration:", v7, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&stru_1ECD79868);
  v10 = (void *)qword_1ECD79878;
  if (!qword_1ECD79878)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 5);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)qword_1ECD79878;
    qword_1ECD79878 = v11;

    v10 = (void *)qword_1ECD79878;
  }
  objc_msgSend(v10, "objectForKey:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&stru_1ECD79868);
  if (!v13)
  {
    _UIKitCoreGlyphsManager();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageNamed:configuration:", v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_12;
    if (!v5)
    {
      if (qword_1ECD79890 != -1)
        dispatch_once(&qword_1ECD79890, &__block_literal_global_166);
      if (!byte_1ECD79861)
      {
        v13 = 0;
        goto LABEL_13;
      }
    }
    _UIKitPrivateCoreGlyphsManager();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageNamed:configuration:", v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && byte_1ECD79861)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          v21 = 138412290;
          v22 = v7;
        }

      }
      else
      {
        v18 = qword_1ECD79898;
        if (!qword_1ECD79898)
        {
          v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v18, (unint64_t *)&qword_1ECD79898);
        }
        v19 = *(NSObject **)(v18 + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v21 = 138412290;
          v22 = v7;
        }
      }

      goto LABEL_12;
    }

    if (v13)
    {
LABEL_12:
      os_unfair_lock_lock(&stru_1ECD79868);
      objc_msgSend((id)qword_1ECD79878, "setObject:forKey:", v13, v9);
      os_unfair_lock_unlock(&stru_1ECD79868);
    }
  }
LABEL_13:
  v16 = v13;

  return v16;
}

+ (UIImage)systemImageNamed:(NSString *)name withConfiguration:(UIImageConfiguration *)configuration
{
  return (UIImage *)objc_msgSend(a1, "_systemImageNamed:withConfiguration:allowPrivate:", name, configuration, 0);
}

+ (UIImage)systemImageNamed:(NSString *)name
{
  return (UIImage *)objc_msgSend(a1, "systemImageNamed:withConfiguration:", name, 0);
}

+ (UIImage)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  NSBundle *v8;
  NSString *v9;
  UIImageConfiguration *v10;
  UIImageConfiguration *v11;
  void *v12;

  v8 = bundle;
  v9 = name;
  if (traitCollection)
    v10 = -[UITraitCollection imageConfiguration](traitCollection, "imageConfiguration");
  else
    v10 = 0;
  v11 = v10;
  objc_msgSend(a1, "imageNamed:inBundle:withConfiguration:", v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v12;
}

+ (UIImage)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle withConfiguration:(UIImageConfiguration *)configuration
{
  NSString *v7;
  NSBundle *v8;
  UIImageConfiguration *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  char v23;
  id v25;

  v7 = name;
  v8 = bundle;
  v9 = configuration;
  os_unfair_lock_lock(&stru_1ECD79868);
  if (!qword_1ECD79878)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)qword_1ECD79878;
    qword_1ECD79878 = v10;

  }
  +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (NSBundle *)objc_claimAutoreleasedReturnValue();
  }
  +[_UIImageCacheKey keyWithName:configuration:bundle:](_UIImageCacheKey, "keyWithName:configuration:bundle:", v7, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD79878, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&stru_1ECD79868);
  if (!v14)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v8 == (NSBundle *)v15)
      {
        _UIKitGetApplicationAssetManager();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v8;
      }
      else
      {
        v16 = (void *)v15;
        +[_UIAssetManager assetManagerForBundle:](_UIAssetManager, "assetManagerForBundle:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      _UIKitGetApplicationAssetManager();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "imageNamed:configuration:", v7, v12);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v14 = (void *)v18;
    }
    else
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v8 = (NSBundle *)objc_claimAutoreleasedReturnValue();
      }
      if (dyld_program_sdk_at_least())
      {
        v25 = +[_UIAssetManager newAssetNamed:fromBundle:](_UIAssetManager, "newAssetNamed:fromBundle:", v7, v8);
        objc_msgSend(v25, "_defaultTraitCollection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
          v19 = (void *)objc_msgSend(v19, "imageConfiguration");
        v21 = v19;
        +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, v9, v21);
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "imageWithConfiguration:", v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)v22;
      }
      else
      {
        v23 = _UIScreenForcedMainScreenScale(2) == 1.0;
        _UIImageAtPath(v7, v8, v23, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!v14)
        goto LABEL_23;
    }
    os_unfair_lock_lock(&stru_1ECD79868);
    objc_msgSend((id)qword_1ECD79878, "setObject:forKey:", v14, v13);
    os_unfair_lock_unlock(&stru_1ECD79868);
LABEL_23:

  }
  return (UIImage *)v14;
}

- (BOOL)_isDecompressing
{
  return -[_UIImageContent isDecompressing](self->_content, "isDecompressing");
}

- (UIImage)imageFlippedForRightToLeftLayoutDirection
{
  UIImage *v2;

  if ((*((_BYTE *)&self->_imageFlags + 2) & 1) != 0)
  {
    v2 = self;
  }
  else
  {
    v2 = (UIImage *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
    -[UIImage _setIsFlippedInRightToLeft](v2, "_setIsFlippedInRightToLeft");
  }
  return v2;
}

- (void)_setIsFlippedInRightToLeft
{
  *(_DWORD *)&self->_imageFlags |= 0x10000u;
}

+ (id)kitImageNamed:(id)a3
{
  return +[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", a3, 0);
}

+ (id)_kitImageNamed:(id)a3 withTrait:(id)a4
{
  return _UIImageWithNameAndTraitCollection(a3, a4);
}

+ (UIImage)imageWithContentsOfCPBitmapFile:(id)a3 flags:(int)a4
{
  void *MappedDataFromPath;
  const __CFArray *ImagesFromData;
  const __CFArray *v6;
  CGImage *ValueAtIndex;
  CGImage *v8;
  UIImage *v9;
  UIImage *v10;
  double valuePtr;

  valuePtr = 1.0;
  MappedDataFromPath = (void *)CPBitmapCreateMappedDataFromPath();
  if (MappedDataFromPath)
  {
    ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
    if (ImagesFromData)
    {
      v6 = ImagesFromData;
      ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(ImagesFromData, 0);
      v8 = CGImageRetain(ValueAtIndex);
      CFRelease(v6);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(MappedDataFromPath);
    if (v8)
    {
      v9 = [UIImage alloc];
      v10 = -[UIImage initWithCGImage:scale:orientation:](v9, "initWithCGImage:scale:orientation:", v8, 0, valuePtr);
      CGImageRelease(v8);
      return v10;
    }
    MappedDataFromPath = 0;
  }
  return (UIImage *)MappedDataFromPath;
}

- (UIImage)init
{
  return (UIImage *)-[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", 0, 0);
}

+ (id)__systemImageNamedSwift:(id)a3
{
  return (id)objc_msgSend(a1, "systemImageNamed:withConfiguration:", a3, 0);
}

- (id)_flatImageWithColor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIImage _imageTintedWithColor:renderingMode:withUpdatedCGImage:](self, "_imageTintedWithColor:renderingMode:withUpdatedCGImage:", v4, -[UIImage renderingMode](self, "renderingMode"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  UIImageRenderingMode v9;
  const __CFString *v10;
  const __CFString *v11;
  BOOL v12;
  void *v13;
  int64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  -[UIImage _metricsDescription](self, "_metricsDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIImageContent description](self->_content, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage symbolConfiguration](self, "symbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[UIImage symbolConfiguration](self, "symbolConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR(" config=<%@>"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1E16EDF20;
  }
  if (-[UIImage renderingMode](self, "renderingMode"))
  {
    v9 = -[UIImage renderingMode](self, "renderingMode");
    v10 = CFSTR("Unknown");
    if (v9 == UIImageRenderingModeAlwaysTemplate)
      v10 = CFSTR("alwaysTemplate");
    v11 = CFSTR("alwaysOriginal");
    v12 = v9 == UIImageRenderingModeAlwaysOriginal;
  }
  else
  {
    -[UIImage symbolConfiguration](self, "symbolConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[UIImage _effectiveRenderingModeWithSymbolConfiguration:](self, "_effectiveRenderingModeWithSymbolConfiguration:", v13);

    v10 = CFSTR("automatic");
    if (v14 == 2)
      v10 = CFSTR("automatic(template)");
    v11 = CFSTR("automatic(original)");
    v12 = v14 == 1;
  }
  if (v12)
    v15 = v11;
  else
    v15 = v10;
  objc_msgSend(CFSTR(" renderingMode="), "stringByAppendingString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = objc_opt_class();
  -[UIImage _identityDescription](self, "_identityDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@:%p %@ %@%@%@>"), v18, self, v19, v3, v8, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v20;
}

- (id)_identityDescription
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  _BOOL4 v7;
  unsigned int v8;
  void *v9;
  uint64_t v11;

  if (self->_imageAsset)
  {
    _UIImageName(self);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString length](v3, "length"))
    {

      v3 = CFSTR("?");
    }
    if (_UIIsSystemSymbolImage(self))
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      _UIImageName(self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("symbol(system: %@)"), v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_22:
      return v6;
    }
    if (_UIIsKitImage(self))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIKit(%@)"), v3);
LABEL_9:
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    v7 = -[UIImage _isSymbolImage](self, "_isSymbolImage");
    v8 = _UIImageIsFromMainBundle(self);
    if (v7)
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("symbol(main: %@)"), v3);
        goto LABEL_9;
      }
      _UIImageIdentityBundleIdentifier(self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("symbol(%@: %@)"), v9, v3);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("symbol(%@)"), v3, v11);
    }
    else
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("named(main: %@)"), v3);
        goto LABEL_9;
      }
      _UIImageIdentityBundleIdentifier(self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("named(%@: %@)"), v9, v3);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("named(%@)"), v3, v11);
    }
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  v6 = CFSTR("anonymous");
  return v6;
}

- (id)_metricsDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGSize v22;
  CGSize v23;
  UIEdgeInsets v24;
  UIEdgeInsets v25;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIImage hasBaseline](self, "hasBaseline"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[UIImage baselineOffsetFromBottom](self, "baselineOffsetFromBottom");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("baseline=%g"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  if (-[UIImage _hasContentInsets](self, "_hasContentInsets"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[UIImage _contentInsets](self, "_contentInsets");
    NSStringFromUIEdgeInsets(v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("contentInsets=%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[UIImage alignmentRectInsets](self, "alignmentRectInsets");
  if (v13 != 0.0 || v11 != 0.0 || v10 != 0.0 || v12 != 0.0)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[UIImage alignmentRectInsets](self, "alignmentRectInsets");
    NSStringFromUIEdgeInsets(v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("alignmentRectInsets=%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
  if (objc_msgSend(v3, "count"))
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[UIImage size](self, "size");
    NSStringFromCGSize(v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ %@"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIImage size](self, "size");
    NSStringFromCGSize(v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (BOOL)_hasContentInsets
{
  double top;
  BOOL result;

  top = self->_contentInsets.top;
  result = 1;
  if (top == 0.0 && self->_contentInsets.bottom == 0.0 && self->_contentInsets.left == 0.0)
    return self->_contentInsets.right != 0.0;
  return result;
}

- (UIImageAsset)imageAsset
{
  UIImageAsset *v3;
  UIImageAsset *imageAsset;

  if (!self->_imageAsset
    && dyld_program_sdk_at_least()
    && (-[_UIImageContent isCGImage](self->_content, "isCGImage") || dyld_program_sdk_at_least())
    && !-[_UIImageContent isPreparedCGImage](self->_content, "isPreparedCGImage"))
  {
    v3 = objc_alloc_init(UIImageAsset);
    imageAsset = self->_imageAsset;
    self->_imageAsset = v3;

    -[UIImageAsset _registerImage:withConfiguration:](self->_imageAsset, "_registerImage:withConfiguration:", self, self->_configuration);
  }
  return self->_imageAsset;
}

- (UIImageResizingMode)resizingMode
{
  return 0;
}

+ (id)_cachedImageForKey:(id)a3 fromBlock:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  _QWORD block[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (qword_1ECD7E248 != -1)
    dispatch_once(&qword_1ECD7E248, &__block_literal_global_281);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__111;
  v26 = __Block_byref_object_dispose__111;
  v27 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v8 = qword_1ECD7E240;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__UIImage__UIImageTintedInterfaceExtension___cachedImageForKey_fromBlock___block_invoke_3;
  block[3] = &unk_1E16BACE0;
  v21 = &v22;
  v9 = v5;
  v20 = v9;
  dispatch_sync(v8, block);
  v10 = (void *)v23[5];
  if (!v10)
  {
    v6[2](v6);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v23[5];
    v23[5] = v11;

    v13 = qword_1ECD7E240;
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __74__UIImage__UIImageTintedInterfaceExtension___cachedImageForKey_fromBlock___block_invoke_2;
    v16[3] = &unk_1E16BC3A0;
    v17 = v9;
    v18 = &v22;
    dispatch_sync(v13, v16);

    v10 = (void *)v23[5];
  }
  v14 = v10;

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (UIImage)imageWithRenderingMode:(UIImageRenderingMode)renderingMode
{
  UIImage *v4;
  NSMapTable *siblingImages;
  NSMapTable *v7;
  NSMapTable *v8;

  if ((((unint64_t)self->_imageFlags >> 9) & 3) == renderingMode)
  {
    v4 = self;
  }
  else
  {
    os_unfair_lock_lock(&stru_1ECD79868);
    -[NSMapTable objectForKey:](self->_siblingImages, "objectForKey:", renderingMode + 1);
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&stru_1ECD79868);
    if (!v4)
    {
      v4 = (UIImage *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
      -[UIImage _setRenderingMode:](v4, "_setRenderingMode:", renderingMode);
      objc_storeStrong((id *)&v4->_siblingImages, self->_siblingImages);
      os_unfair_lock_lock(&stru_1ECD79868);
      siblingImages = self->_siblingImages;
      if (!siblingImages)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 256, 5);
        v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_siblingImages;
        self->_siblingImages = v7;

        -[NSMapTable setObject:forKey:](self->_siblingImages, "setObject:forKey:", self, (((unint64_t)self->_imageFlags >> 9) & 3) + 1);
        siblingImages = self->_siblingImages;
      }
      -[NSMapTable setObject:forKey:](siblingImages, "setObject:forKey:", v4, renderingMode + 1);
      os_unfair_lock_unlock(&stru_1ECD79868);
    }
  }
  return v4;
}

- (UIImage)imageWithAlignmentRectInsets:(UIEdgeInsets)alignmentInsets
{
  double right;
  double bottom;
  double left;
  double top;
  void *v7;

  right = alignmentInsets.right;
  bottom = alignmentInsets.bottom;
  left = alignmentInsets.left;
  top = alignmentInsets.top;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
  objc_msgSend(v7, "_setAlignmentRectInsetsExplicitly:", top, left, bottom, right);
  return (UIImage *)v7;
}

- (void)_setAlignmentRectInsetsExplicitly:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
  *(_DWORD *)&self->_imageFlags |= 0x8000u;
}

- (UIImage)resizableImageWithCapInsets:(UIEdgeInsets)capInsets
{
  return -[UIImage resizableImageWithCapInsets:resizingMode:](self, "resizableImageWithCapInsets:resizingMode:", 0, capInsets.top, capInsets.left, capInsets.bottom, capInsets.right);
}

- (id)_stretchableImageWithCapInsets:(UIEdgeInsets)a3
{
  void *v3;

  -[UIImage resizableImageWithCapInsets:](self, "resizableImageWithCapInsets:", a3.top, a3.left, a3.bottom, a3.right);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAlwaysStretches:", 1);
  return v3;
}

- (UIImage)resizableImageWithCapInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode
{
  _UIResizableImage *v5;
  _UIResizableImage *v6;

  v5 = -[_UIResizableImage initWithImage:capInsets:]([_UIResizableImage alloc], "initWithImage:capInsets:", self, capInsets.top, capInsets.left, capInsets.bottom, capInsets.right);
  v6 = v5;
  if (resizingMode == UIImageResizingModeStretch)
    -[_UIResizableImage _setAlwaysStretches:](v5, "_setAlwaysStretches:", 1);
  return (UIImage *)v6;
}

- (NSInteger)leftCapWidth
{
  double v2;

  -[UIImage capInsets](self, "capInsets");
  return (uint64_t)v2;
}

+ (UIImage)imageWithCGImage:(CGImageRef)cgImage
{
  return -[UIImage initWithCGImage:]([UIImage alloc], "initWithCGImage:", cgImage);
}

- (UIImage)initWithCGImage:(CGImageRef)cgImage
{
  return -[UIImage initWithCGImage:scale:orientation:](self, "initWithCGImage:scale:orientation:", cgImage, 0, 1.0);
}

+ (UIImage)imageWithData:(NSData *)data scale:(CGFloat)scale
{
  NSData *v5;
  UIImage *v6;

  v5 = data;
  v6 = -[UIImage initWithData:scale:]([UIImage alloc], "initWithData:scale:", v5, scale);

  return v6;
}

- (UIImage)initWithData:(NSData *)data scale:(CGFloat)scale
{
  return (UIImage *)-[UIImage _initWithData:preserveScale:cache:scale:](self, "_initWithData:preserveScale:cache:scale:", data, 0, 0, scale);
}

- (UIImage)imageByPreparingForDisplay
{
  _UIImageContent *v3;
  _UIImageContent *v4;
  UIImage *v5;
  UIImage *v6;

  -[_UIImageContent contentPreparedForDisplay](self->_content, "contentPreparedForDisplay");
  v3 = (_UIImageContent *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == self->_content)
  {
    v5 = self;
  }
  else
  {
    if (!v3)
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[UIImage _imageWithContent:](self, "_imageWithContent:", v3);
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (void)prepareForDisplayWithCompletionHandler:(void *)completionHandler
{
  id v4;
  _UIImageContent *content;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = completionHandler;
  content = self->_content;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__UIImage_prepareForDisplayWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E16CAFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[_UIImageContent prepareContentForDisplayWithCompletionHandler:](content, "prepareContentForDisplayWithCompletionHandler:", v7);

}

void __50__UIImage_prepareForDisplayWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v7 = v3;
  if ((id)v4[2] == v3)
  {
    (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      objc_msgSend(v4, "_imageWithContent:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
    }
  }

}

+ (void)initialize
{
  id v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__flushCache_, CFSTR("UIApplicationDidReceiveMemoryWarningNotification"), UIApp);
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__flushCache_, CFSTR("UIApplicationDidEnterBackgroundNotification"), UIApp);

  }
}

- (id)_imageThatSuppressesAccessibilityHairlineThickening
{
  UIImage *v2;
  UIImage *v3;

  v2 = objc_retainAutorelease(self);
  if (-[UIImage CGImage](v2, "CGImage"))
  {
    v3 = (UIImage *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", v2);
    -[UIImage _setSuppressesAccessibilityHairlineThickening:](v3, "_setSuppressesAccessibilityHairlineThickening:", 1);
  }
  else
  {
    v3 = v2;
  }
  return v3;
}

void __74__UIImage__UIImageTintedInterfaceExtension___cachedImageForKey_fromBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)_MergedGlobals_1086, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (UIImage)systemImageNamed:(NSString *)name compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  NSString *v6;
  UIImageConfiguration *v7;
  UIImageConfiguration *v8;
  void *v9;

  v6 = name;
  if (traitCollection)
    v7 = -[UITraitCollection imageConfiguration](traitCollection, "imageConfiguration");
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v9;
}

+ (UIImage)imageWithContentsOfFile:(NSString *)path
{
  NSString *v3;
  UIImage *v4;

  v3 = path;
  v4 = -[UIImage initWithContentsOfFile:]([UIImage alloc], "initWithContentsOfFile:", v3);

  return v4;
}

- (UIImage)initWithContentsOfFile:(NSString *)path
{
  return -[UIImage initWithContentsOfFile:cache:](self, "initWithContentsOfFile:cache:", path, 0);
}

- (CGColor)_tiledPatternColor
{
  UIImage *v3;
  CGColor *PatternColorFromImage;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIGraphicsImageRenderer *v17;
  void *v18;
  UIGraphicsImageRenderer *v19;
  void *v20;
  _QWORD v22[16];

  if (!-[_UIImageContent isCGImage](self->_content, "isCGImage"))
    return 0;
  if (!qword_1ECD798A8
    || (v3 = self,
        os_unfair_lock_lock(&stru_1ECD7986C),
        PatternColorFromImage = (CGColor *)CFDictionaryGetValue((CFDictionaryRef)qword_1ECD798A8, v3),
        v3,
        os_unfair_lock_unlock(&stru_1ECD7986C),
        !PatternColorFromImage))
  {
    -[UIImage size](self, "size");
    v6 = v5;
    v8 = v7;
    -[UIImage scale](self, "scale");
    v10 = v9;
    if (((unint64_t)v6 & ((unint64_t)v6 - 1)) != 0
      || ((unint64_t)v8 & ((unint64_t)v8 - 1)) != 0)
    {
      -[UIImage scale](self, "scale");
      if (v6 < v11 * 32.0 || (-[UIImage scale](self, "scale"), v8 < v12 * 32.0))
      {
        -[UIImage scale](self, "scale");
        v14 = v6 * ceil(v13 * 32.0 / v6);
        -[UIImage scale](self, "scale");
        v16 = v8 * ceil(v15 * 32.0 / v8);
        v17 = [UIGraphicsImageRenderer alloc];
        -[UIImage imageRendererFormat](self, "imageRendererFormat");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[UIGraphicsImageRenderer initWithSize:format:](v17, "initWithSize:format:", v18, v14, v16);

        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __55__UIImage_UIImageDeprecatedPrivate___tiledPatternColor__block_invoke;
        v22[3] = &unk_1E16CAFF0;
        v22[5] = 0;
        v22[6] = 0;
        *(double *)&v22[7] = v14;
        *(double *)&v22[8] = v16;
        v22[4] = self;
        *(double *)&v22[9] = v6;
        v22[10] = v10;
        *(double *)&v22[11] = v8;
        v22[12] = 0;
        v22[13] = 0;
        *(double *)&v22[14] = v6;
        *(double *)&v22[15] = v8;
        -[UIGraphicsImageRenderer imageWithActions:](v19, "imageWithActions:", v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        PatternColorFromImage = createPatternColorFromImage(v20);

        if (!PatternColorFromImage)
          return PatternColorFromImage;
        goto LABEL_12;
      }
    }
    PatternColorFromImage = createPatternColorFromImage(self);
    if (PatternColorFromImage)
    {
LABEL_12:
      SetCachedPatternColor(self, PatternColorFromImage);
      CGColorRelease(PatternColorFromImage);
    }
  }
  return PatternColorFromImage;
}

- (void)drawAtPoint:(CGPoint)point
{
  -[UIImage drawAtPoint:blendMode:alpha:](self, "drawAtPoint:blendMode:alpha:", 0, point.x, point.y, 1.0);
}

- (UIImage)imageWithBaselineOffsetFromBottom:(CGFloat)baselineOffset
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
  objc_msgSend(v4, "_setBaselineOffsetFromBottomExplicitly:", baselineOffset);
  return (UIImage *)v4;
}

- (void)_setBaselineOffsetFromBottomExplicitly:(double)a3
{
  self->_baselineOffsetFromBottom = a3;
  *(_DWORD *)&self->_imageFlags |= 0x3000u;
}

void __74__UIImage__UIImageTintedInterfaceExtension___cachedImageForKey_fromBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  id v4;
  void *v5;

  objc_msgSend((id)_MergedGlobals_1086, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    v5 = v2;
    objc_storeStrong(v3, v2);
LABEL_5:
    v2 = v5;
    goto LABEL_6;
  }
  v4 = *v3;
  if (v4)
  {
    v5 = 0;
    objc_setAssociatedObject(v4, &_MergedGlobals_1086, *(id *)(a1 + 32), (void *)1);
    objc_msgSend((id)_MergedGlobals_1086, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
    goto LABEL_5;
  }
LABEL_6:

}

+ (UIImage)animatedImageWithImages:(NSArray *)images duration:(NSTimeInterval)duration
{
  NSArray *v5;
  _UIAnimatedImage *v6;

  v5 = images;
  if (-[NSArray count](v5, "count"))
    v6 = -[_UIAnimatedImage initWithImages:duration:]([_UIAnimatedImage alloc], "initWithImages:duration:", v5, duration);
  else
    v6 = 0;

  return (UIImage *)v6;
}

- (BOOL)writeToCPBitmapFile:(id)a3 flags:(int)a4
{
  id v5;
  CGImage *v6;
  BOOL v7;
  const __CFAllocator *v8;
  CFArrayRef v9;
  CFArrayRef v10;
  CGColorSpace *ColorSpace;
  double v12;
  CFNumberRef v13;
  uint64_t v14;
  double v16;
  void *values;

  v5 = a3;
  v6 = -[_UIImageContent CGImage](self->_content, "CGImage");
  v7 = 0;
  values = v6;
  if (v5 && v6)
  {
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v9 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, MEMORY[0x1E0C9B378]);
    if (v9)
    {
      v10 = v9;
      CGImageHasAlpha();
      ColorSpace = CGImageGetColorSpace((CGImageRef)values);
      CGColorSpaceGetNumberOfComponents(ColorSpace);
      CGImageGetBitsPerComponent((CGImageRef)values);
      -[_UIImageContent scale](self->_content, "scale");
      v16 = v12;
      if (v12 == 1.0)
      {
        v14 = CPBitmapWriteImagesToPath();
      }
      else
      {
        v13 = CFNumberCreate(v8, kCFNumberCGFloatType, &v16);
        v14 = CPBitmapWriteImagesToPath();
        if (v13)
          CFRelease(v13);
      }
      v7 = v14 != 0;
      CFRelease(v10);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_rasterizedImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIImage *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  UIGraphicsImageRenderer *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[7];

  if (-[_UIImageContent isCGImage](self->_content, "isCGImage")
    && (-[UIImage _contentInsets](self, "_contentInsets"), v6 == 0.0)
    && v4 == 0.0
    && v3 == 0.0
    && v5 == 0.0)
  {
    v7 = self;
  }
  else
  {
    -[UIImage size](self, "size");
    v9 = v8;
    v11 = v10;
    +[UIGraphicsImageRendererFormat defaultFormat](UIGraphicsImageRendererFormat, "defaultFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage scale](self, "scale");
    objc_msgSend(v12, "setScale:");
    v13 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v12, v9, v11);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __27__UIImage__rasterizedImage__block_invoke;
    v17[3] = &unk_1E16C4E18;
    v17[4] = self;
    *(double *)&v17[5] = v9;
    *(double *)&v17[6] = v11;
    -[UIGraphicsImageRenderer imageWithActions:](v13, "imageWithActions:", v17);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[UIImage _configureImage:assumePreconfigured:](self, "_configureImage:assumePreconfigured:", v14, 0);
      v15 = *(void **)(v14 + 8);
      *(_QWORD *)(v14 + 8) = 0;

      *(_DWORD *)(v14 + 104) &= ~1u;
      objc_msgSend((id)v14, "_imageWithContentInsets:", 0.0, 0.0, 0.0, 0.0);
      v7 = (UIImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)_imageWithContentInsets:(UIEdgeInsets)a3 withUpdatedCGImage:(BOOL)a4
{
  _BOOL4 v4;
  double right;
  double bottom;
  double left;
  double top;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  BOOL v19;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIGraphicsImageRenderer *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  UIImage *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UIImage *v37;
  double v39;
  double v40;
  double v41;
  _QWORD v42[9];

  v4 = a4;
  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (-[UIImage _isResizable](self, "_isResizable"))
    goto LABEL_15;
  v10 = fmax(top, 0.0);
  v11 = fmax(left, 0.0);
  v12 = fmax(bottom, 0.0);
  v13 = fmax(right, 0.0);
  -[UIImage _contentInsets](self, "_contentInsets");
  v18 = v11 == v17 && v10 == v14;
  v19 = v18 && v13 == v16;
  if (v19 && v12 == v15)
  {
LABEL_15:
    v32 = self;
    return v32;
  }
  if (v4)
  {
    v21 = v10 - self->_contentInsets.top;
    v22 = v11 - self->_contentInsets.left;
    v23 = v12 - self->_contentInsets.bottom;
    v24 = v13 - self->_contentInsets.right;
    -[_UIImageContent size](self->_content, "size");
    v27 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v24 + v22 + v25, v23 + v21 + v26);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __54__UIImage__imageWithContentInsets_withUpdatedCGImage___block_invoke;
    v42[3] = &unk_1E16B55B8;
    v42[4] = self;
    *(double *)&v42[5] = v21;
    *(double *)&v42[6] = v22;
    *(double *)&v42[7] = v23;
    *(double *)&v42[8] = v24;
    -[UIGraphicsImageRenderer imageWithActions:](v27, "imageWithActions:", v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImage content](self, "content");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_retainAutorelease(v28);
    objc_msgSend(v29, "contentWithCGImage:", objc_msgSend(v30, "CGImage"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage _imageWithContent:](self, "_imageWithContent:", v31);
    v32 = (UIImage *)objc_claimAutoreleasedReturnValue();

    if (-[_UIImageContent canScaleImageToTargetResolution](self->_content, "canScaleImageToTargetResolution"))
      goto LABEL_19;
    v33 = 0.0;
    v34 = 0.0;
    v35 = 0.0;
    v36 = 0.0;
    v37 = v32;
  }
  else
  {
    v37 = (UIImage *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
    v32 = v37;
    v33 = v10;
    v34 = v11;
    v35 = v12;
    v36 = v13;
  }
  -[UIImage _setContentInsetsExplicitly:](v37, "_setContentInsetsExplicitly:", v33, v34, v35, v36);
LABEL_19:
  if (-[UIImage hasBaseline](self, "hasBaseline"))
  {
    -[UIImage baselineOffsetFromBottom](self, "baselineOffsetFromBottom");
    v40 = v39;
    -[UIImage _contentInsets](self, "_contentInsets");
    -[UIImage _setBaselineOffsetFromBottom:](v32, "_setBaselineOffsetFromBottom:", v12 + v40 + v41);
  }
  return v32;
}

- (void)_setContentInsetsExplicitly:(UIEdgeInsets)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;

  self->_contentInsets.top = fmax(a3.top, 0.0);
  self->_contentInsets.left = fmax(a3.left, 0.0);
  self->_contentInsets.bottom = fmax(a3.bottom, 0.0);
  self->_contentInsets.right = fmax(a3.right, 0.0);
  -[_UIImageContent scale](self->_content, "scale");
  v5 = v4 * self->_contentInsets.top;
  v6 = v4 * self->_contentInsets.left;
  v7 = v4 * self->_contentInsets.bottom;
  v8 = v4 * self->_contentInsets.right;
  -[_UIImageContent sizeInPixels](self->_content, "sizeInPixels");
  self->_sizeInPixels.width = v8 + v6 + v9;
  self->_sizeInPixels.height = v7 + v5 + v10;
  +[UIImage _applyOrientation:toContentSizeInPixels:](UIImage, "_applyOrientation:toContentSizeInPixels:", ((unint64_t)self->_imageFlags >> 2) & 7);
  self->_sizeInPixels.width = v11;
  self->_sizeInPixels.height = v12;
  *(_DWORD *)&self->_imageFlags |= 0x4000u;
}

- (id)_imageWithContentInsets:(UIEdgeInsets)a3
{
  return -[UIImage _imageWithContentInsets:withUpdatedCGImage:](self, "_imageWithContentInsets:withUpdatedCGImage:", 0, a3.top, a3.left, a3.bottom, a3.right);
}

void __74__UIImage__UIImageTintedInterfaceExtension___cachedImageForKey_fromBlock___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 5, 16);
  v1 = (void *)_MergedGlobals_1086;
  _MergedGlobals_1086 = v0;

  v2 = dispatch_queue_create("weak image cache queue", 0);
  v3 = (void *)qword_1ECD7E240;
  qword_1ECD7E240 = (uint64_t)v2;

}

- (id)_applicationIconImageForFormat:(int)a3 precomposed:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  -[UIImage _applicationIconImageForFormat:precomposed:scale:](self, "_applicationIconImageForFormat:precomposed:scale:", v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_applicationIconImageForFormat:(int)a3 precomposed:(BOOL)a4 scale:(double)a5
{
  uint64_t v6;
  id v8;
  UIImage *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v6 = *(_QWORD *)&a3;
  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc(MEMORY[0x1E0D3A810]);
  v9 = objc_retainAutorelease(self);
  v10 = -[UIImage CGImage](v9, "CGImage");
  -[UIImage scale](v9, "scale");
  v11 = (void *)objc_msgSend(v8, "initWithCGImage:scale:", v10);
  v12 = objc_alloc(MEMORY[0x1E0D3A820]);
  v20[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithImages:", v13);

  +[UIImage _baseImageDescriptorForUIApplicationIconFormat:](UIImage, "_baseImageDescriptorForUIApplicationIconFormat:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a5 > 0.0)
  {
    objc_msgSend(v15, "setScale:", a5);
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    objc_msgSend(v16, "setScale:");

  }
  +[UIImage _imageWithIcon:descriptor:]((uint64_t)UIImage, v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (int)_iconVariantForUIApplicationIconFormat:(int)a3 scale:(double *)a4
{
  uint64_t v5;
  void *v7;

  v5 = *(_QWORD *)&a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(a1, "_iconVariantForUIApplicationIconFormat:idiom:scale:", v5, objc_msgSend(v7, "userInterfaceIdiom"), a4);

  return (int)a4;
}

+ (int)_iconVariantForUIApplicationIconFormat:(int)a3 idiom:(int64_t)a4 scale:(double *)a5
{
  double v6;
  int v7;
  BOOL v8;
  int v9;
  BOOL v10;
  int v11;
  int v12;
  int v13;
  BOOL v15;
  int v16;
  int v17;
  void *v18;
  double v19;
  void *v20;
  double Height;
  CGRect v22;
  CGRect v23;

  v6 = *a5;
  switch(a3)
  {
    case 0:
      if (v6 < 3.0)
        v7 = 17;
      else
        v7 = 34;
      v8 = v6 < 2.0;
      v9 = 4;
      goto LABEL_33;
    case 5:
      if (v6 < 3.0)
        v7 = 23;
      else
        v7 = 35;
      v8 = v6 < 2.0;
      v9 = 22;
      goto LABEL_33;
    case 11:
      if (v6 < 3.0)
        v7 = 56;
      else
        v7 = 57;
      v8 = v6 < 2.0;
      v9 = 55;
      goto LABEL_33;
    case 12:
      v10 = v6 < 2.0;
      v11 = 58;
      v12 = 59;
LABEL_18:
      if (v10)
        return v11;
      else
        return v12;
    case 13:
      if (v6 < 3.0)
        v7 = 61;
      else
        v7 = 62;
      v8 = v6 < 2.0;
      v9 = 60;
      goto LABEL_33;
    case 15:
      if (v6 < 3.0)
        v7 = 74;
      else
        v7 = 75;
      v8 = v6 < 2.0;
      v9 = 73;
      goto LABEL_33;
    case 16:
      if (v6 < 3.0)
        v7 = 77;
      else
        v7 = 78;
      v8 = v6 < 2.0;
      v9 = 76;
LABEL_33:
      if (v8)
        v13 = v9;
      else
        v13 = v7;
      break;
    default:
      if (a4 == 1)
      {
        switch(a3)
        {
          case 1:
            v10 = v6 < 2.0;
            v11 = 3;
            v12 = 25;
            goto LABEL_18;
          case 3:
            v10 = v6 < 2.0;
            v11 = 5;
            v12 = 26;
            goto LABEL_18;
          case 4:
            v10 = v6 < 2.0;
            v11 = 7;
            v12 = 28;
            goto LABEL_18;
          case 6:
            v10 = v6 < 2.0;
            v11 = 6;
            v12 = 27;
            goto LABEL_18;
          case 7:
            v10 = v6 < 2.0;
            v11 = 8;
            v12 = 29;
            goto LABEL_18;
          case 8:
            goto LABEL_48;
          case 9:
            goto LABEL_49;
          case 10:
            if (v6 < 2.0)
              return 1;
            else
              return 24;
          case 14:
            v13 = 71;
            if (v6 >= 2.0)
            {
              +[UIScreen mainScreen](UIScreen, "mainScreen");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "_referenceBounds");
              Height = CGRectGetHeight(v23);

              if (Height < 1366.0)
                return 71;
              else
                return 72;
            }
            return v13;
          default:
            if (v6 >= 2.0)
            {
              +[UIScreen mainScreen](UIScreen, "mainScreen");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "_referenceBounds");
              v19 = CGRectGetHeight(v22);

              v10 = v19 < 1366.0;
              v11 = 24;
              v12 = 63;
              goto LABEL_18;
            }
            v13 = 1;
            break;
        }
      }
      else
      {
        if (qword_1ECD798A0 != -1)
          dispatch_once(&qword_1ECD798A0, &__block_literal_global_845);
        switch(a3)
        {
          case 1:
            if (v6 < 3.0)
              v7 = 16;
            else
              v7 = 33;
            v8 = v6 < 2.0;
            v9 = 2;
            goto LABEL_33;
          case 3:
          case 6:
            if (v6 < 3.0)
              v7 = 19;
            else
              v7 = 36;
            v8 = v6 < 2.0;
            v9 = 18;
            goto LABEL_33;
          case 4:
          case 7:
            if (v6 < 3.0)
              v7 = 21;
            else
              v7 = 37;
            v8 = v6 < 2.0;
            v9 = 20;
            goto LABEL_33;
          case 8:
LABEL_48:
            v10 = v6 < 3.0;
            v11 = 30;
            v12 = 53;
            goto LABEL_18;
          case 9:
LABEL_49:
            v10 = v6 < 3.0;
            v11 = 31;
            v12 = 54;
            goto LABEL_18;
          case 14:
            if (v6 < 3.0)
              v7 = 69;
            else
              v7 = 70;
            v8 = v6 < 2.0;
            v9 = 68;
            goto LABEL_33;
          default:
            if (v6 < 3.0)
            {
              if (v6 < 2.0)
                return 0;
              v15 = byte_1ECD79864 == 0;
              v16 = 79;
              v17 = 15;
            }
            else
            {
              v15 = byte_1ECD79864 == 0;
              v16 = 80;
              v17 = 32;
            }
            if (v15)
              v13 = v17;
            else
              v13 = v16;
            break;
        }
      }
      break;
  }
  return v13;
}

void __60__UIImage__systemImageNamed_withConfiguration_allowPrivate___block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  _UIKitPreferencesOnce();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("UIAllowPublicUseOfPrivateSystemSymbols"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    v2 = objc_msgSend(v3, "BOOLValue");
    v1 = v3;
  }
  else
  {
    v2 = 0;
  }
  byte_1ECD79861 = v2;

}

- (UIImage)stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[UIImage size](self, "size");
  v9 = v8 - (double)topCapHeight + -1.0;
  if (topCapHeight)
    v10 = v9;
  else
    v10 = 0.0;
  v11 = v7 - (double)leftCapWidth + -1.0;
  if (leftCapWidth)
    v12 = v11;
  else
    v12 = 0.0;
  return (UIImage *)-[UIImage _stretchableImageWithCapInsets:](self, "_stretchableImageWithCapInsets:", (double)topCapHeight, (double)leftCapWidth, v10, v12);
}

void __88__UIImage_UIApplicationIconPrivate___iconVariantForUIApplicationIconFormat_idiom_scale___block_invoke()
{
  id v0;

  +[UIScreen _embeddedScreen](UIScreen, "_embeddedScreen");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECD79864 = _UIScreenIsPhyiscallyLargePhone(objc_msgSend(v0, "_screenType"));

}

- (id)_initWithData:(id)a3 immediateLoadWithMaxSize:(CGSize)a4 scale:(double)a5 renderingIntent:(unint64_t)a6 cache:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  id v13;
  void *v14;
  _UIImageAsyncCGImageContent *v15;
  _DWORD *v16;
  UIImage *v17;

  v7 = a7;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = v13;
  if (v13 && objc_msgSend(v13, "length"))
  {
    v15 = -[_UIImageAsyncCGImageContent initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:]([_UIImageAsyncCGImageContent alloc], "initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:", v14, a6, v7, width, height, a5);
    v16 = -[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", v15, 0);
    if (v16)
      v16[26] |= 2u;
    self = v16;

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_iconForResourceProxy:(id)a3 format:(int)a4 options:(unint64_t)a5
{
  char v5;
  uint64_t v6;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v8 = (objc_class *)MEMORY[0x1E0D3A820];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithResourceProxy:", v9);

  objc_msgSend(a1, "_baseImageDescriptorForUIApplicationIconFormat:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  objc_msgSend(v11, "setScale:");

  if ((v5 & 1) != 0)
    objc_msgSend(v11, "setVariantOptions:", objc_msgSend(v11, "variantOptions") | 1);
  +[UIImage _imageWithIcon:descriptor:]((uint64_t)UIImage, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_iconForResourceProxy:(id)a3 format:(int)a4
{
  return (id)objc_msgSend(a1, "_iconForResourceProxy:format:options:", a3, *(_QWORD *)&a4, 0);
}

+ (id)imageNamed:(id)a3 withConfiguration:(id)a4
{
  return (id)objc_msgSend(a1, "imageNamed:inBundle:withConfiguration:", a3, 0, a4);
}

+ (id)_imageNamed:(id)a3 withTrait:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  if (a4)
    v7 = (void *)objc_msgSend(a4, "imageConfiguration");
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(a1, "imageNamed:inBundle:withConfiguration:", v6, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)__systemImageNamed:(id)a3
{
  return (id)objc_msgSend(a1, "systemImageNamed:withConfiguration:", a3, 0);
}

+ (UIImage)systemImageNamed:(NSString *)name variableValue:(double)value withConfiguration:(UIImageConfiguration *)configuration
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "systemImageNamed:withConfiguration:", name, configuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_imageWithVariableValue:", value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

+ (id)_systemImageNamed:(id)a3 variableValue:(double)a4 withConfiguration:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "_systemImageNamed:withConfiguration:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_imageWithVariableValue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (UIImage)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle variableValue:(double)value withConfiguration:(UIImageConfiguration *)configuration
{
  void *v7;
  void *v8;

  objc_msgSend(a1, "imageNamed:inBundle:withConfiguration:", name, bundle, configuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_imageWithVariableValue:", value);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v8;
}

- (double)variableValue
{
  double result;

  -[_UIImageContent variableValue](self->_content, "variableValue");
  return result;
}

+ (id)_systemImageNamed:(id)a3 fallback:(id)a4
{
  return (id)objc_msgSend(a1, "_systemImageNamed:fallback:withConfiguration:", a3, a4, 0);
}

- (id)_initWithFilledSystemImageNamed:(id)a3 fillColor:(id)a4
{
  return -[UIImage _initWithFilledSystemImageNamed:fillColor:symbolColor:withName:](self, "_initWithFilledSystemImageNamed:fillColor:symbolColor:withName:", a3, a4, 0, 0);
}

- (id)_initWithFilledSystemImageNamed:(id)a3 fillColor:(id)a4 symbolColor:(id)a5
{
  return -[UIImage _initWithFilledSystemImageNamed:fillColor:symbolColor:withName:](self, "_initWithFilledSystemImageNamed:fillColor:symbolColor:withName:", a3, a4, a5, 0);
}

- (id)_initWithFilledSystemImageNamed:(id)a3 fillColor:(id)a4 symbolColor:(id)a5 withName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  UIImage *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_21;
  if ((objc_msgSend(v10, "containsString:", CFSTR(".circle")) & 1) != 0)
  {
    v15 = CFSTR("circle.fill");
  }
  else if ((objc_msgSend(v10, "containsString:", CFSTR(".square.stack")) & 1) != 0)
  {
    v15 = CFSTR("square.stack.fill");
  }
  else if ((objc_msgSend(v10, "containsString:", CFSTR(".rectangle.stack")) & 1) != 0)
  {
    v15 = CFSTR("rectangle.stack.fill");
  }
  else if ((objc_msgSend(v10, "containsString:", CFSTR(".square")) & 1) != 0)
  {
    v15 = CFSTR("square.fill");
  }
  else if ((objc_msgSend(v10, "containsString:", CFSTR(".rectangle")) & 1) != 0)
  {
    v15 = CFSTR("rectangle.fill");
  }
  else
  {
    if (!objc_msgSend(v10, "containsString:", CFSTR(".triangle")))
    {
LABEL_21:
      v24 = 0;
      goto LABEL_22;
    }
    v15 = CFSTR("arrowtriangle.up.fill");
  }
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_21;
  v17 = (void *)v16;
  v26 = self;
  if (objc_msgSend(v10, "containsString:", CFSTR(".fill")))
    v18 = 0.85;
  else
    v18 = 0.95;
  v19 = *MEMORY[0x1E0C9D538];
  v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  +[_UIImageSymbolLayer _symbolLayerWithImage:color:offset:scaleFactor:](_UIImageSymbolLayer, "_symbolLayerWithImage:color:offset:scaleFactor:", v14, v12, *MEMORY[0x1E0C9D538], v20, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  +[_UIImageSymbolLayer _symbolLayerWithImage:color:offset:scaleFactor:](_UIImageSymbolLayer, "_symbolLayerWithImage:color:offset:scaleFactor:", v17, v11, v19, v20, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v10, "stringByAppendingString:", CFSTR(".composite"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = -[UIImage _initWithCompositedSymbolImageLayers:name:alignUsingBaselines:]([UIImage alloc], "_initWithCompositedSymbolImageLayers:name:alignUsingBaselines:", v23, v13, 0);

  self = v26;
LABEL_22:

  return v24;
}

- (id)_initWithCompositedSymbolImageLayers:(id)a3 name:(id)a4
{
  return -[UIImage _initWithCompositedSymbolImageLayers:name:alignUsingBaselines:](self, "_initWithCompositedSymbolImageLayers:name:alignUsingBaselines:", a3, a4, 1);
}

- (id)_initWithCompositedSymbolImageLayers:(id)a3 name:(id)a4 alignUsingBaselines:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  id (*v27)(uint64_t, uint64_t, uint64_t);
  void *v28;
  id v29;
  BOOL v30;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lowercaseString");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(CFSTR("_."), "stringByAppendingString:", v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __73__UIImage__initWithCompositedSymbolImageLayers_name_alignUsingBaselines___block_invoke;
    v28 = &unk_1E16CAF28;
    v14 = v8;
    v29 = v14;
    v30 = a5;
    +[UIImageAsset _dynamicAssetNamed:generator:](UIImageAsset, "_dynamicAssetNamed:generator:", v13, &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject", v25, v26, v27, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "content");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = v18;

    +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection traitCollectionWithDisplayScale:](UITraitCollection, "traitCollectionWithDisplayScale:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "configurationWithTraitCollection:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "imageWithConfiguration:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)v13;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

id __73__UIImage__initWithCompositedSymbolImageLayers_name_alignUsingBaselines___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIImage _generateCompositedSymbolImageForAsset:usingLayers:configuration:alignUsingBaselines:](UIImage, "_generateCompositedSymbolImageForAsset:usingLayers:configuration:alignUsingBaselines:", a2, *(_QWORD *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

+ (id)_generateCompositedSymbolImageForAsset:(id)a3 usingLayers:(id)a4 configuration:(id)a5 alignUsingBaselines:(BOOL)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
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
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  CGFloat v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGFloat v80;
  double x;
  double y;
  double width;
  double height;
  double v85;
  double MaxX;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  _UIImageMultiVectorGlyphContent *v95;
  id v96;
  _BOOL4 v98;
  void *v99;
  id v100;
  id obj;
  CGFloat v102;
  CGFloat v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  CGFloat v110;
  double MinX;
  CGFloat v112;
  double MinY;
  CGFloat r1;
  double r1a;
  CGRect v116;
  CGFloat v117;
  double MaxY;
  double v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  uint64_t v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;

  v98 = a6;
  v125 = *MEMORY[0x1E0C80C00];
  v100 = a3;
  v8 = a5;
  objc_msgSend(a4, "reverseObjectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:", CFSTR("color"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  obj = v10;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
  if (!v17)
  {
    v116.size.width = v15;
    v116.size.height = v16;
    v116.origin.x = v14;
    v116.origin.y = v13;
    goto LABEL_32;
  }
  v18 = v17;
  v19 = *(_QWORD *)v121;
  v102 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v103 = *MEMORY[0x1E0C9D538];
  v116.size.width = v15;
  v116.size.height = v16;
  v116.origin.x = v14;
  v116.origin.y = v13;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      v112 = v13;
      if (*(_QWORD *)v121 != v19)
        objc_enumerationMutation(obj);
      v117 = v15;
      v110 = v14;
      r1 = v16;
      v21 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
      objc_msgSend(v21, "asset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageWithConfiguration:", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "traitCollection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "displayScale");
      v26 = v25;
      if (v25 == 0.0)
      {
        objc_msgSend(v23, "scale");
        v26 = v27;
      }

      objc_msgSend(v23, "content");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "content");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "addObject:", v29);

      objc_msgSend(v21, "offset");
      v31 = v30;
      objc_msgSend(v28, "glyphScaleFactor");
      UICeilToScale(v31 * v32, v26);
      v34 = v33;
      objc_msgSend(v21, "offset");
      v36 = v35;
      objc_msgSend(v28, "glyphScaleFactor");
      UICeilToScale(v36 * v37, v26);
      v106 = v34;
      v108 = v38;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v34);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v39);

      objc_msgSend(v23, "size");
      v41 = v40;
      v43 = v42;
      objc_msgSend(v23, "_contentInsets");
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      objc_msgSend(v21, "scaleFactor");
      v53 = v52;
      if (v52 < 1.0)
      {
        v54 = v41 * v52 - 2.0 / v26;
        if (v54 >= v41 + -2.0)
          v54 = v41 + -2.0;
        v55 = v43 * v53 - 2.0 / v26;
        if (v55 >= v43 + -2.0)
          v55 = v43 + -2.0;
        v56 = v54 / v41;
        v57 = v55 / v43;
        if (v56 >= v57)
          v53 = v57;
        else
          v53 = v56;
        UIFloorToScale(v41 * v53, v26);
        v41 = v58;
        UIFloorToScale(v43 * v53, v26);
        v43 = v59;
        UICeilToScale(v45 * v53, v26);
        v45 = v60;
        UICeilToScale(v49 * v53, v26);
        v105 = v61;
        UICeilToScale(v47 * v53, v26);
        v47 = v62;
        UICeilToScale(v51 * v53, v26);
LABEL_26:
        v51 = v63;
        goto LABEL_28;
      }
      if (v52 > 1.0)
      {
        v64 = 2.0 / v26 + v41 * v52;
        if (v64 < v41 + 2.0)
          v64 = v41 + 2.0;
        v65 = 2.0 / v26 + v43 * v53;
        if (v65 < v43 + 2.0)
          v65 = v43 + 2.0;
        v66 = v64 / v41;
        v67 = v65 / v43;
        if (v66 >= v67)
          v53 = v66;
        else
          v53 = v67;
        UICeilToScale(v41 * v53, v26);
        v41 = v68;
        UICeilToScale(v43 * v53, v26);
        v43 = v69;
        UIFloorToScale(v45 * v53, v26);
        v45 = v70;
        UIFloorToScale(v49 * v53, v26);
        v105 = v71;
        UIFloorToScale(v47 * v53, v26);
        v47 = v72;
        UIFloorToScale(v51 * v53, v26);
        goto LABEL_26;
      }
      v105 = v49;
LABEL_28:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v73);

      UIRoundToScale(v106 + v41 * -0.5, v26);
      v75 = v74;
      objc_msgSend(v23, "baselineOffsetFromBottom");
      v77 = v76;
      objc_msgSend(v23, "size");
      UIRoundToScale(v108 + v77 - v78, v26);
      v80 = v79;
      v126.origin.y = v102;
      v126.origin.x = v103;
      v126.size.width = v41;
      v126.size.height = v43;
      v127 = CGRectOffset(v126, v75, v80);
      x = v127.origin.x;
      y = v127.origin.y;
      width = v127.size.width;
      height = v127.size.height;
      v116 = CGRectUnion(v116, v127);
      v134.origin.x = v47 + x;
      v134.origin.y = v45 + y;
      v134.size.width = width - (v51 + v47);
      v134.size.height = height - (v105 + v45);
      v128.origin.x = v110;
      v128.origin.y = v112;
      v128.size.width = v117;
      v128.size.height = r1;
      v129 = CGRectUnion(v128, v134);
      v14 = v129.origin.x;
      v13 = v129.origin.y;
      v15 = v129.size.width;
      v16 = v129.size.height;

    }
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
  }
  while (v18);
LABEL_32:

  r1a = CGRectGetMinY(v116);
  v130.origin.x = v14;
  v130.origin.y = v13;
  v130.size.width = v15;
  v130.size.height = v16;
  MinY = CGRectGetMinY(v130);
  MinX = CGRectGetMinX(v116);
  v131.origin.x = v14;
  v131.origin.y = v13;
  v131.size.width = v15;
  v131.size.height = v16;
  v109 = CGRectGetMinX(v131);
  v132.origin.x = v14;
  v132.origin.y = v13;
  v132.size.width = v15;
  v132.size.height = v16;
  MaxY = CGRectGetMaxY(v132);
  v85 = MaxY - CGRectGetMaxY(v116);
  if (v85 < 0.0)
    v85 = -v85;
  v107 = v85;
  v133.origin.x = v14;
  v133.origin.y = v13;
  v119 = v15;
  v133.size.width = v15;
  v133.size.height = v16;
  MaxX = CGRectGetMaxX(v133);
  v87 = CGRectGetMaxX(v116);
  v88 = CGRectGetMaxY(v116);
  v89 = v88;
  if (v98)
  {
    v90 = v107;
    v91 = (v107 + v16 - v88) / v16;
  }
  else
  {
    v91 = 0.5;
    v90 = v107;
  }
  if (MaxX - v87 >= 0.0)
    v92 = MaxX - v87;
  else
    v92 = -(MaxX - v87);
  if (MinX - v109 >= 0.0)
    v93 = MinX - v109;
  else
    v93 = -(MinX - v109);
  if (r1a - MinY >= 0.0)
    v94 = r1a - MinY;
  else
    v94 = -(r1a - MinY);
  v95 = -[_UIImageMultiVectorGlyphContent initWithSize:glyphs:colors:offsets:scaleFactors:anchorPoint:]([_UIImageMultiVectorGlyphContent alloc], "initWithSize:glyphs:colors:offsets:scaleFactors:anchorPoint:", v104, v99, v11, v12, v119, v16, 0.5, v91);
  v96 = -[UIImage _initWithContent:orientation:]([UIImage alloc], "_initWithContent:orientation:", v95, 0);
  objc_msgSend(v96, "_setRenderingMode:", 0);
  objc_msgSend(v96, "_setContentInsets:", v94, v93, v90, v92);
  objc_msgSend(v96, "_setBaselineOffsetFromBottom:", v89);
  objc_msgSend(v96, "_setConfiguration:", v8);
  objc_msgSend(v96, "_setNamed:", 1);
  objc_msgSend(v96, "_setImageAsset:", v100);

  return v96;
}

+ (UIImage)imageWithCIImage:(CIImage *)ciImage
{
  CIImage *v3;
  UIImage *v4;

  v3 = ciImage;
  v4 = -[UIImage initWithCIImage:]([UIImage alloc], "initWithCIImage:", v3);

  return v4;
}

+ (UIImage)imageWithCIImage:(CIImage *)ciImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation
{
  CIImage *v7;
  UIImage *v8;

  v7 = ciImage;
  v8 = -[UIImage initWithCIImage:scale:orientation:]([UIImage alloc], "initWithCIImage:scale:orientation:", v7, orientation, scale);

  return v8;
}

+ (void)_loadImageFromURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIImage.m"), 1333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

  }
  objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__UIImage__loadImageFromURL_completionHandler___block_invoke;
  v13[3] = &unk_1E16CAF50;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "downloadTaskWithURL:completionHandler:", v7, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "resume");
}

void __47__UIImage__loadImageFromURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v11 && objc_msgSend(v11, "isFileURL"))
  {
    objc_msgSend(v11, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (UIImage)initWithCIImage:(CIImage *)ciImage
{
  return -[UIImage initWithCIImage:scale:orientation:](self, "initWithCIImage:scale:orientation:", ciImage, 0, 0.0);
}

- (UIImage)initWithCIImage:(CIImage *)ciImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation
{
  CIImage *v8;
  _UIImageCIImageContent *v9;
  UIImage *v10;

  v8 = ciImage;
  if (v8)
  {
    v9 = -[_UIImageCIImageContent initWithCIImage:scale:]([_UIImageCIImageContent alloc], "initWithCIImage:scale:", v8, scale);
    v10 = -[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", v9, orientation);
    self = (UIImage *)v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_canEncodeWithName:(id)a3 coder:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = (_UIIsSystemSymbolImage(self) & 1) != 0
    || (objc_msgSend(v7, "_ui_isInterprocess") & 1) == 0
    && -[UIImage _isNamed](self, "_isNamed")
    && objc_msgSend(v6, "length") != 0;

  return v8;
}

- (void)_encodeDataWithCoder:(id)a3 imageName:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  UIImagePNGRepresentation(self);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("UIImageData"));

}

- (void)_encodePropertiesWithCoder:(id)a3
{
  double v4;
  double top;
  double baselineOffsetFromBottom;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UIKitWantsProperties"));
  -[_UIImageContent scale](self->_content, "scale");
  *(float *)&v4 = v4;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("UIScale"), v4);
  objc_msgSend(v9, "encodeCGSize:forKey:", CFSTR("UIImageSizeInPixels"), self->_sizeInPixels.width, self->_sizeInPixels.height);
  objc_msgSend(v9, "encodeInt:forKey:", -[UIImage imageOrientation](self, "imageOrientation"), CFSTR("UIImageOrientation"));
  objc_msgSend(v9, "encodeBool:forKey:", (*(_DWORD *)&self->_imageFlags >> 7) & 1, CFSTR("UIHasPattern"));
  objc_msgSend(v9, "encodeInt:forKey:", (*(_DWORD *)&self->_imageFlags >> 9) & 3, CFSTR("UIRenderingMode"));
  top = self->_alignmentRectInsets.top;
  if (self->_alignmentRectInsets.left != 0.0
    || top != 0.0
    || self->_alignmentRectInsets.right != 0.0
    || self->_alignmentRectInsets.bottom != 0.0)
  {
    objc_msgSend(v9, "encodeUIEdgeInsets:forKey:", CFSTR("UIImageAlignmentRectInsets"), top);
  }
  if (-[UIImage hasBaseline](self, "hasBaseline"))
  {
    baselineOffsetFromBottom = self->_baselineOffsetFromBottom;
    *(float *)&baselineOffsetFromBottom = baselineOffsetFromBottom;
    objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("UIBaselineOffsetFromBottom"), baselineOffsetFromBottom);
  }
  -[UIImage symbolConfiguration](self, "symbolConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "_isUnspecified") & 1) == 0)
    objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("UIImageSymbolConfiguration"));
  if (-[UIImage _hasContentInsets](self, "_hasContentInsets"))
    objc_msgSend(v9, "encodeUIEdgeInsets:forKey:", CFSTR("UIImageContentInsets"), self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "encodeBool:forKey:", 1, CFSTR("UIKitDidEncode"));
  _UIImageName(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _UIIsKitImage(self);
  v6 = _UIIsSystemSymbolImage(self);
  if (!-[UIImage _canEncodeWithName:coder:](self, "_canEncodeWithName:coder:", v4, v17))
    goto LABEL_18;
  if (v6)
  {
    if (_UIIsPrivateSystemSymbolImage(self))
      objc_msgSend(v17, "encodeBool:forKey:", 1, CFSTR("UIIsPrivateSystemImage"));
    v7 = CFSTR("UIIsSystemImage");
    goto LABEL_8;
  }
  if (!v5)
  {
    if (!dyld_program_sdk_at_least())
    {
      _UIPathForImageWithCacheName(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "encodeObject:forKey:", v9, CFSTR("UIImageName"));
LABEL_16:

      goto LABEL_19;
    }
    -[UIImageAsset _assetManager](self->_imageAsset, "_assetManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "bundlePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v17, "encodeObject:forKey:", v4, CFSTR("UIImageName"));
      objc_msgSend(v9, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "encodeObject:forKey:", v11, CFSTR("UIImageBundleIdentifier"));

      objc_msgSend(v9, "executablePath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("UIImageBundleLibraryName"));

LABEL_15:
      goto LABEL_16;
    }
    _UIPathForImageWithCacheName(v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(v17, "encodeObject:forKey:", v12, CFSTR("UIImageName"));
      goto LABEL_15;
    }

LABEL_18:
    -[UIImage _encodeDataWithCoder:imageName:](self, "_encodeDataWithCoder:imageName:", v17, v4);
    goto LABEL_19;
  }
  v7 = CFSTR("UIIsKitImage");
LABEL_8:
  objc_msgSend(v17, "encodeBool:forKey:", 1, v7);
  objc_msgSend(v17, "encodeObject:forKey:", v4, CFSTR("UIImageName"));
LABEL_19:
  if (!-[UIImage _canEncodeWithName:coder:](self, "_canEncodeWithName:coder:", v4, v17)
    || !-[UIImage isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class())
    || -[UIImage _isSymbolImage](self, "_isSymbolImage"))
  {
    -[UIImage _encodePropertiesWithCoder:](self, "_encodePropertiesWithCoder:", v17);
  }
  objc_msgSend(v17, "encodeObject:forKey:", self->_configuration, CFSTR("UIImageConfiguration"));
  -[UIImageConfiguration _effectiveTraitCollectionForImageLookup](self->_configuration, "_effectiveTraitCollectionForImageLookup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v14, CFSTR("UIImageTraitCollection"));

  -[_UIImageContent variableValue](self->_content, "variableValue");
  objc_msgSend(v17, "encodeDouble:forKey:", CFSTR("UIImageVariableValue"));
  objc_msgSend(v17, "encodeBool:forKey:", HIWORD(*(_DWORD *)&self->_imageFlags) & 1, CFSTR("UIImageIsFlippedInRightToLeft"));
  -[NSObject accessibilityLabel](self, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v15, CFSTR("UIImageAccessibilityLabel"));

  -[NSObject accessibilityLanguage](self, "accessibilityLanguage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v16, CFSTR("UIImageAccessibilityLanguage"));

}

- (UIImage)initWithCoder:(id)a3
{
  id v4;
  UIImage *v5;
  UIImage *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  UIImage *v17;
  int v18;
  CGImage *v19;
  uint64_t v20;
  _UIImageContent *v21;
  void *v22;
  float v23;
  _UIImageCGImageContent *v24;
  _UIImageContent *content;
  CGFloat v26;
  CGFloat v27;
  unint64_t v28;
  int v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  float v38;
  int v39;
  void *v40;
  uint64_t v41;

  v4 = a3;
  if (!objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIKitDidEncode")))
  {
    v5 = 0;
    goto LABEL_49;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIImageData")))
  {
    v5 = -[UIImage init](self, "init");
    v6 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIImageName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    v6 = 0;
    goto LABEL_24;
  }
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIIsSystemImage"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIIsKitImage"));
  if (v8)
  {
    +[UIImage _systemImageNamed:withConfiguration:allowPrivate:](UIImage, "_systemImageNamed:withConfiguration:allowPrivate:", v7, 0, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIIsPrivateSystemImage")));
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v9)
  {
    _UIImageWithName(v7);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v6 = (UIImage *)v10;
    if (!v10)
      goto LABEL_24;
    goto LABEL_17;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIImageBundleIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIImageBundleLibraryName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "_bundleWithIdentifier:andLibraryName:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v13, 0);
  else
    +[UIImage imageNamed:](UIImage, "imageNamed:", v7);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_24:

    v5 = -[UIImage init](self, "init");
    if (!v6)
      goto LABEL_30;
    goto LABEL_27;
  }
LABEL_17:
  if (!objc_msgSend(v7, "length"))
    goto LABEL_24;
  v14 = -[UIImage isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());

  if ((v14 & 1) == 0)
  {
    v5 = -[UIImage init](self, "init");
LABEL_27:
    if (-[_UIImageContent isCGImage](v6->_content, "isCGImage"))
    {
      v6 = objc_retainAutorelease(v6);
      v19 = CGImageRetain(-[UIImage CGImage](v6, "CGImage"));
      if (v19)
      {
LABEL_31:
        objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIScale"));
        v24 = -[_UIImageCGImageContent initWithCGImage:scale:]([_UIImageCGImageContent alloc], "initWithCGImage:scale:", v19, v23);
        content = v5->_content;
        v5->_content = &v24->super;

        CGImageRelease(v19);
        goto LABEL_32;
      }
      goto LABEL_29;
    }
LABEL_30:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIImageData"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = _UIImageRefFromData(v22, 0, 0, 0);

    if (v19)
      goto LABEL_31;
LABEL_29:
    +[_UIImageContent empty](_UIImageContent, "empty");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v5->_content;
    v5->_content = (_UIImageContent *)v20;

    goto LABEL_32;
  }
  v15 = (id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIImageConfigurationClass"));
  if (!objc_msgSend(v15, "conformsToProtocol:", &unk_1EDF69E00)
    || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("UIImageConfiguration")),
        (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIImageSymbolConfiguration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v5 = v6;
      v6 = v5;
LABEL_46:

      self = v6;
      goto LABEL_47;
    }
  }
  v17 = (UIImage *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", v6);

  -[UIImage imageWithConfiguration:](v17, "imageWithConfiguration:", v16);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIKitWantsProperties"));
  v6 = v17;
  self = v17;
  if (v18)
  {
LABEL_32:
    v5->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&v5->_imageFlags & 0xFFFFFFE3 | (4 * (objc_msgSend(v4, "decodeIntForKey:", CFSTR("UIImageOrientation")) & 7)));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIImageSizeInPixels")))
    {
      objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("UIImageSizeInPixels"));
    }
    else
    {
      v28 = ((unint64_t)v5->_imageFlags >> 2) & 7;
      -[_UIImageContent sizeInPixels](v5->_content, "sizeInPixels");
      +[UIImage _applyOrientation:toContentSizeInPixels:](UIImage, "_applyOrientation:toContentSizeInPixels:", v28);
    }
    v5->_sizeInPixels.width = v26;
    v5->_sizeInPixels.height = v27;
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIHasPattern")))
      v29 = 128;
    else
      v29 = 0;
    v5->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&v5->_imageFlags & 0xFFFFFF7F | v29);
    v5->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&v5->_imageFlags & 0xFFFFF9FF | ((objc_msgSend(v4, "decodeIntForKey:", CFSTR("UIRenderingMode")) & 3) << 9));
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIImageAlignmentRectInsets"));
    v5->_alignmentRectInsets.top = v30;
    v5->_alignmentRectInsets.left = v31;
    v5->_alignmentRectInsets.bottom = v32;
    v5->_alignmentRectInsets.right = v33;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIImageContentInsets")))
    {
      objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIImageContentInsets"));
      v5->_contentInsets.top = v34;
      v5->_contentInsets.left = v35;
      v5->_contentInsets.bottom = v36;
      v5->_contentInsets.right = v37;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBaselineOffsetFromBottom")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIBaselineOffsetFromBottom"));
      v5->_baselineOffsetFromBottom = v38;
      *(_DWORD *)&v5->_imageFlags |= 0x1000u;
    }
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIImageIsFlippedInRightToLeft")))
      v39 = 0x10000;
    else
      v39 = 0;
    v5->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&v5->_imageFlags & 0xFFFEFFFF | v39);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIImageAccessibilityLabel"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAccessibilityLabel:](v5, "setAccessibilityLabel:", v40);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIImageAccessibilityLanguage"));
    self = (UIImage *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAccessibilityLanguage:](v5, "setAccessibilityLanguage:", self);
    goto LABEL_46;
  }
LABEL_47:
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIImageVariableValue")))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UIImageVariableValue"));
    -[UIImage _imageWithVariableValue:](v5, "_imageWithVariableValue:");
    v41 = objc_claimAutoreleasedReturnValue();

    v5 = (UIImage *)v41;
  }
LABEL_49:

  return v5;
}

- (BOOL)_isCGImageOnly
{
  return -[_UIImageContent isCGImageOnly](self->_content, "isCGImageOnly");
}

- (CGSize)_fullSize
{
  _UIImageContent *v3;
  _UIImageContent *content;
  UIImage *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  if (!self->_content)
  {
    if (dyld_program_sdk_at_least())
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("This UIImage instance unexpectedly has nil content. Did calling code create an image with [UIImage alloc] without also sending -init? That's unsupported. %p"), self);
    if (self->_configuration)
    {
      +[_UIImageContent empty](_UIImageContent, "empty");
      v3 = (_UIImageContent *)objc_claimAutoreleasedReturnValue();
      content = self->_content;
      self->_content = v3;
    }
    else
    {
      v5 = self;
      content = -[UIImage _initWithContent:orientation:](v5, "_initWithContent:orientation:", 0, -[UIImage imageOrientation](v5, "imageOrientation"));
    }

  }
  -[UIImage _sizeInPixels](self, "_sizeInPixels");
  v7 = v6;
  v9 = v8;
  -[UIImage scale](self, "scale");
  v11 = v9 / v10;
  v12 = v7 / v10;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)setFlipsForRightToLeftLayoutDirection:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  v3 = a3;
  -[UIImage willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("flipsForRightToLeftLayoutDirection"));
  if (v3)
    v5 = 0x10000;
  else
    v5 = 0;
  self->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFEFFFF | v5);
  -[UIImage didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("flipsForRightToLeftLayoutDirection"));
}

- (int64_t)_imageOrientationConsideringRTL
{
  return -[UIImage _imageOrientationConsideringRTLForUserInterfaceLayoutDirection:](self, "_imageOrientationConsideringRTLForUserInterfaceLayoutDirection:", objc_msgSend((id)UIApp, "userInterfaceLayoutDirection"));
}

- (int64_t)_imageOrientationForSymbolLayerConsideringRTLForUserInterfaceLayoutDirection:(int64_t)a3
{
  int64_t v4;

  v4 = -[UIImage _imageOrientationConsideringRTLForUserInterfaceLayoutDirection:](self, "_imageOrientationConsideringRTLForUserInterfaceLayoutDirection:", a3);
  if (-[UIImage isSymbolImage](self, "isSymbolImage") && (*(_BYTE *)&self->_imageFlags & 0x20) != 0)
    return +[UIImage _horizontallyFlippedOrientationForOrientation:](UIImage, "_horizontallyFlippedOrientationForOrientation:", v4);
  else
    return v4;
}

- (BOOL)_isRTLImage
{
  BOOL v3;
  void *v4;
  void *v5;

  if ((-[UIImage imageOrientation](self, "imageOrientation") & 4) == 0)
    return 0;
  -[UIImage configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "layoutDirection") == 1;

  return v3;
}

+ (int64_t)_mirroredImageOrientationForOrientation:(int64_t)a3
{
  return a3 ^ 4;
}

+ (int64_t)_horizontallyFlippedOrientationForOrientation:(int64_t)a3
{
  int64_t result;

  result = 7;
  switch(a3)
  {
    case 0:
    case 1:
    case 4:
    case 5:
      result = objc_msgSend(a1, "_mirroredImageOrientationForOrientation:");
      break;
    case 2:
      return result;
    case 3:
      result = 6;
      break;
    case 6:
      result = 3;
      break;
    case 7:
      result = 2;
      break;
    default:
      result = a3;
      break;
  }
  return result;
}

- (void)_horizontallyFlipImageOrientation
{
  self->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFFFE1 | (4 * (+[UIImage _horizontallyFlippedOrientationForOrientation:](UIImage, "_horizontallyFlippedOrientationForOrientation:", -[UIImage imageOrientation](self, "imageOrientation")) & 7)));
}

- (void)_mirrorImageOrientation
{
  self->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFFFE1 | (4 * (+[UIImage _mirroredImageOrientationForOrientation:](UIImage, "_mirroredImageOrientationForOrientation:", -[UIImage imageOrientation](self, "imageOrientation")) & 7)));
}

- (UIImage)imageWithHorizontallyFlippedOrientation
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
  objc_msgSend(v2, "_mirrorImageOrientation");
  return (UIImage *)v2;
}

- (CGRect)_contentRectInPixels
{
  double v2;
  double v3;
  double width;
  double height;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  width = self->_sizeInPixels.width;
  height = self->_sizeInPixels.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIEdgeInsets)_subimageInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)_bundle
{
  void *v2;
  void *v3;
  void *v4;

  -[UIImage _primitiveImageAsset](self, "_primitiveImageAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_assetManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_imageWithCGPDFPage:(CGPDFPage *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithCGPDFPage:", a3);
}

+ (id)_imageWithCGPDFPage:(CGPDFPage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithCGPDFPage:scale:orientation:", a3, a5, a4);
}

- (id)_initWithCGPDFPage:(CGPDFPage *)a3
{
  return -[UIImage _initWithCGPDFPage:scale:orientation:](self, "_initWithCGPDFPage:scale:orientation:", a3, 0, 1.0);
}

- (id)_initWithCGPDFPage:(CGPDFPage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  _UIImageCGPDFPageContent *v7;
  id v8;

  if (a3)
  {
    v7 = -[_UIImageCGPDFPageContent initWithCGPDFPage:scale:]([_UIImageCGPDFPageContent alloc], "initWithCGPDFPage:scale:", a3, a4);
    v8 = -[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", v7, a5);
    self = (UIImage *)v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGPDFPage)_CGPDFPage
{
  return -[_UIImageContent CGPDFPage](self->_content, "CGPDFPage");
}

- (BOOL)_isPDFVector
{
  return -[_UIImageContent isCGPDFPage](self->_content, "isCGPDFPage");
}

- (CGSize)_CGPDFPageSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UIImageContent CGPDFPageSize](self->_content, "CGPDFPageSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_scaleFromPDF
{
  double result;

  if (!-[_UIImageContent isCGPDFPage](self->_content, "isCGPDFPage"))
    return 1.0;
  -[_UIImageContent scale](self->_content, "scale");
  return result;
}

- (CGSize)_sizeInPixelsFromPDF
{
  double v3;
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
  CGSize result;

  if (-[_UIImageContent isCGPDFPage](self->_content, "isCGPDFPage"))
  {
    -[UIImage scale](self, "scale");
    v4 = v3;
    -[UIImage _contentInsets](self, "_contentInsets");
    v6 = v5;
    v8 = v7;
    -[_UIImageContent sizeInPixels](self->_content, "sizeInPixels");
    v9 = v4 * (v6 + v8);
    v11 = v10 + v9;
    v13 = v12 + v9;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v13;
  result.width = v11;
  return result;
}

+ (id)_imageWithCGSVGDocument:(CGSVGDocument *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithCGSVGDocument:", a3);
}

+ (id)_imageWithCGSVGDocument:(CGSVGDocument *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithCGSVGDocument:scale:orientation:", a3, a5, a4);
}

- (id)_initWithCGSVGDocument:(CGSVGDocument *)a3
{
  return -[UIImage _initWithCGSVGDocument:scale:orientation:](self, "_initWithCGSVGDocument:scale:orientation:", a3, 0, 1.0);
}

- (id)_initWithCGSVGDocument:(CGSVGDocument *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  _UIImageCGSVGDocumentContent *v7;
  id v8;

  if (a3)
  {
    v7 = -[_UIImageCGSVGDocumentContent initWithCGSVGDocument:scale:]([_UIImageCGSVGDocumentContent alloc], "initWithCGSVGDocument:scale:", a3, a4);
    v8 = -[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", v7, a5);
    self = (UIImage *)v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGSVGDocument)_CGSVGDocument
{
  return -[_UIImageContent CGSVGDocument](self->_content, "CGSVGDocument");
}

- (BOOL)_isSVGVector
{
  return -[_UIImageContent isCGSVGDocument](self->_content, "isCGSVGDocument");
}

- (CGSize)_CGSVGDocumentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UIImageContent CGSVGDocumentSize](self->_content, "CGSVGDocumentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIImage)imageRestrictedToStandardDynamicRange
{
  UIImage *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  if (-[UIImage isHighDynamicRange](v2, "isHighDynamicRange"))
  {
    -[_UIImageContent makeSDRVersion](v2->_content, "makeSDRVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage _imageWithContent:](v2, "_imageWithContent:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (UIImage *)v4;
  }
  return v2;
}

- (id)_imageWithStylePresets:(id)a3 tintColor:(id)a4 traitCollection:(id)a5
{
  id v8;
  __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  UIImage *v14;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIImage *v35;
  uint64_t v36;
  uint64_t v37;
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
  UIImage *v52;
  void *v53;
  __CFString *v54;
  id v55;
  id obj;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v57 = a4;
  v9 = (__CFString *)a5;
  if (-[UIImage renderingMode](self, "renderingMode") == UIImageRenderingModeAlwaysOriginal
    || (-[UIImage content](self, "content"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isCGImage"),
        v10,
        (v11 & 1) == 0))
  {
    v35 = self;
  }
  else
  {
    _UIKitGetTextEffectsCatalog();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v54 = v9;
      -[UITraitCollection _styleEffectAppearanceName](v9);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = objc_retainAutorelease(self);
      v15 = -[UIImage CGImage](v14, "CGImage");
      v16 = objc_alloc_init(MEMORY[0x1E0D1A6E8]);
      objc_msgSend(v16, "setState:", 0);
      objc_msgSend(v16, "setValue:", 0);
      v53 = (void *)v13;
      objc_msgSend(v16, "setAppearanceName:", v13);
      v52 = v14;
      -[UIImage scale](v14, "scale");
      v18 = v17;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v55 = v8;
      obj = v8;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v22 = *(_QWORD *)v59;
        v23 = 0.0;
        v24 = 0.0;
        v25 = 0.0;
        v26 = 0.0;
        v27 = -1.0 / v18;
        do
        {
          v28 = 0;
          v29 = v21;
          do
          {
            if (*(_QWORD *)v59 != v22)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v28);
            objc_msgSend(v16, "setForegroundColorShouldTintEffects:", objc_msgSend(v30, "isEqualToString:", CFSTR("_UIKitBoldTintStyle")));
            objc_msgSend(v12, "imageByStylingImage:stylePresetName:styleConfiguration:foregroundColor:scale:", v15, v30, v16, objc_msgSend(objc_retainAutorelease(v57), "CGColor"), v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
              v15 = objc_msgSend(v21, "image");
            objc_msgSend(v12, "styledInsetsForStylePresetName:styleConfiguration:foregroundColor:scale:", v30, v16, 0, v18);
            v23 = v23 + v27 * v31;
            v24 = v24 + v27 * v32;
            v25 = v25 + v27 * v33;
            v26 = v26 + v27 * v34;
            ++v28;
            v29 = v21;
          }
          while (v20 != v28);
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        }
        while (v20);
      }
      else
      {
        v21 = 0;
        v23 = 0.0;
        v24 = 0.0;
        v25 = 0.0;
        v26 = 0.0;
      }

      v36 = objc_msgSend(v21, "image");
      if (v36
        && (v37 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCGImage:scale:orientation:", v36, -[UIImage imageOrientation](v52, "imageOrientation"), v18)) != 0)
      {
        v35 = (UIImage *)v37;
        *(_DWORD *)(v37 + 104) = *(_DWORD *)(v37 + 104) & 0xFFFFF9FF | 0x200;
        v8 = v55;
        if (-[UIImage _isResizable](v52, "_isResizable"))
        {
          -[UIImage capInsets](v52, "capInsets");
          v42 = v38;
          if (v39 != 0.0 || v38 != 0.0 || v41 != 0.0 || (v43 = v23, v44 = v24, v45 = v25, v46 = v26, v40 != 0.0))
          {
            if (v42 == 0.0 && v40 == 0.0)
            {
              v44 = v24 + v39;
              v46 = v26 + v41;
              v43 = v42;
              v45 = v40;
            }
            else
            {
              v43 = v23 + v42;
              if (v39 == 0.0 && v41 == 0.0)
              {
                v45 = v25 + v40;
                v44 = v39;
                v46 = v41;
              }
              else
              {
                v44 = v24 + v39;
                v45 = v25 + v40;
                v46 = v26 + v41;
              }
            }
          }
          -[UIImage _setCapInsets:](v35, "_setCapInsets:", v43, v44, v45, v46);
          if (-[UIImage resizingMode](v52, "resizingMode") == UIImageResizingModeStretch)
            -[UIImage _setAlwaysStretches:](v35, "_setAlwaysStretches:", 1);
        }
        -[UIImage alignmentRectInsets](v52, "alignmentRectInsets");
        -[UIImage _setAlignmentRectInsets:](v35, "_setAlignmentRectInsets:", v23 + v47, v24 + v48, v25 + v49, v26 + v50);
      }
      else
      {
        NSLog(CFSTR("%s. Unexpectedly failed to get a letterpress image from the CUIImage."), "-[UIImage _imageWithStylePresets:tintColor:traitCollection:]");
        v35 = v52;
        v8 = v55;
      }
      v9 = v54;

    }
    else
    {
      if (_imageWithStylePresets_tintColor_traitCollection__once != -1)
        dispatch_once(&_imageWithStylePresets_tintColor_traitCollection__once, &__block_literal_global_338);
      v35 = self;
    }

  }
  return v35;
}

void __60__UIImage__imageWithStylePresets_tintColor_traitCollection___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = NSTextEffectBoldTintStyle_block_invoke___s_category;
  if (!NSTextEffectBoldTintStyle_block_invoke___s_category)
  {
    v0 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&NSTextEffectBoldTintStyle_block_invoke___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    v2 = 136315138;
    v3 = "-[UIImage _imageWithStylePresets:tintColor:traitCollection:]_block_invoke";
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "%s. Unexpectedly missing the text-effects catalog.", (uint8_t *)&v2, 0xCu);
  }
}

- (CGSize)_sizeWithHairlineThickening:(BOOL)a3 forTraitCollection:(id)a4
{
  _BOOL4 v4;
  id v6;
  UIImage *v7;
  void *v8;
  UIImageAsset *imageAsset;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  void *v16;
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
  _QWORD v27[2];
  CGSize result;

  v4 = a3;
  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = self;
  v8 = v7;
  if (v6)
  {
    imageAsset = v7->_imageAsset;
    if (imageAsset)
    {
      -[UIImageAsset imageWithTraitCollection:](imageAsset, "imageWithTraitCollection:", v6);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
  }
  objc_msgSend(v8, "size");
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v8, "_suppressesAccessibilityHairlineThickening");
  v16 = (void *)MEMORY[0x1E0C9AA60];
  if (!v15 && v4)
  {
    v27[0] = CFSTR("_UIKitBoldTintStyle");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "scale");
  +[UIImage _edgeInsetsForStylePresetNames:scale:traitCollection:](UIImage, "_edgeInsetsForStylePresetNames:scale:traitCollection:", v16, v6);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v12 + v20 + v24;
  v26 = v14 + v18 + v22;
  result.height = v26;
  result.width = v25;
  return result;
}

- (UIEdgeInsets)_inverseAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -self->_alignmentRectInsets.top;
  v3 = -self->_alignmentRectInsets.left;
  v4 = -self->_alignmentRectInsets.bottom;
  v5 = -self->_alignmentRectInsets.right;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_isColoredSymbolImage
{
  return -[UIImage _isMultiColorSymbolImage](self, "_isMultiColorSymbolImage")
      || -[UIImage _isHierarchicalColorSymbolImage](self, "_isHierarchicalColorSymbolImage")
      || -[UIImage _isPaletteColorSymbolImage](self, "_isPaletteColorSymbolImage");
}

- (BOOL)_isPaletteColorSymbolImage
{
  return -[_UIImageContent numberOfPaletteLayers](self->_content, "numberOfPaletteLayers") > 1;
}

- (id)_outlinePath
{
  void *v3;
  void *v4;
  double v5;
  CGAffineTransform v7;

  -[UIImage content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outlinePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImage scale](self, "scale");
  CGAffineTransformMakeScale(&v7, 1.0 / v5, 1.0 / v5);
  objc_msgSend(v4, "applyTransform:", &v7);
  return v4;
}

- (BOOL)_isSameSymbolImageExceptVariableValue:(id)a3
{
  _UIImageContent *content;
  void *v4;

  content = self->_content;
  objc_msgSend(a3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(content) = -[_UIImageContent _isSameSymbolImageContentExceptVariableValue:](content, "_isSameSymbolImageContentExceptVariableValue:", v4);

  return (char)content;
}

- (double)_baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (double)__baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (double)_capHeight
{
  double v3;
  double v4;
  double v5;

  if ((*((_BYTE *)&self->_imageFlags + 2) & 2) != 0)
    return self->_capHeight;
  -[UIImage size](self, "size");
  v4 = v3;
  -[UIImage baselineOffsetFromBottom](self, "baselineOffsetFromBottom");
  return v4 - v5;
}

- (UIImage)imageWithoutBaseline
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
  objc_msgSend(v2, "_removeBaselineExplicitly");
  return (UIImage *)v2;
}

- (void)_removeBaselineExplicitly
{
  self->_baselineOffsetFromBottom = 0.0;
  self->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFCFFF | 0x2000);
}

- (id)_imageWithSymbolMetricsFromNamedVectorGlyph:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
  objc_msgSend(v5, "_setSymbolMetricsFromNamedVectorGlyph:", v4);

  return v5;
}

- (double)midlineOffsetFromCenter
{
  return 0.0;
}

- (id)_flatImageWithWhite:(double)a3 alpha:(double)a4
{
  void *v5;
  void *v6;

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage _flatImageWithColor:](self, "_flatImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_colorForName:(id)a3 withTraitCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[UIImage _primitiveImageAsset](self, "_primitiveImageAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_assetManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorNamed:withTraitCollection:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __54__UIImage__imageWithContentInsets_withUpdatedCGImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 17, *(double *)(a1 + 48), *(double *)(a1 + 64), 1.0);
}

- (BOOL)hasContentInsets
{
  return 0;
}

- (UIEdgeInsets)padding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)hasPadding
{
  return 0;
}

+ (UIImage)animatedImageNamed:(NSString *)name duration:(NSTimeInterval)duration
{
  return (UIImage *)objc_msgSend(a1, "_animatedImageNamed:inBundle:compatibleWithTraitCollection:duration:", name, 0, 0, duration);
}

+ (id)_animatedImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5 duration:(double)a6
{
  void *v8;
  void *v9;

  LoadImageSequence(a3, a4, a5, 0, 0, 0.0, 0.0, 0.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(a1, "animatedImageWithImages:duration:", v8, a6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (UIImage)animatedResizableImageNamed:(NSString *)name capInsets:(UIEdgeInsets)capInsets duration:(NSTimeInterval)duration
{
  return +[UIImage animatedResizableImageNamed:capInsets:resizingMode:duration:](UIImage, "animatedResizableImageNamed:capInsets:resizingMode:duration:", name, 0, capInsets.top, capInsets.left, capInsets.bottom, capInsets.right, duration);
}

+ (UIImage)animatedResizableImageNamed:(NSString *)name capInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode duration:(NSTimeInterval)duration
{
  return (UIImage *)+[UIImage _animatedResizableImageNamed:inBundle:compatibleWithTraitCollection:capInsets:resizingMode:duration:](UIImage, "_animatedResizableImageNamed:inBundle:compatibleWithTraitCollection:capInsets:resizingMode:duration:", name, 0, 0, resizingMode, capInsets.top, capInsets.left, capInsets.bottom, capInsets.right, duration);
}

+ (id)_animatedResizableImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5 capInsets:(UIEdgeInsets)a6 resizingMode:(int64_t)a7 duration:(double)a8
{
  void *v10;
  void *v11;

  LoadImageSequence(a3, a4, a5, 1, a7, a6.top, a6.left, a6.bottom, a6.right);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(a1, "animatedImageWithImages:duration:", v10, a8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_drawInContext:(CGContext *)a3 rect:(CGRect)a4 layout:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  id v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a5;
  -[UIImage scale](self, "scale");
  -[UIImage _drawInContext:rect:layout:scale:applyContentsTransform:](self, "_drawInContext:rect:layout:scale:applyContentsTransform:", a3, v12, 0, x, y, width, height, v11);

}

- (void)_drawInContext:(CGContext *)a3 rect:(CGRect)a4 layout:(id)a5 scale:(double)a6 applyContentsTransform:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v15;
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
  _BOOL4 v27;
  int v28;
  _BOOL4 v29;
  int v30;
  int v31;
  CGImage *v32;
  CGImage *v33;
  id v34;
  id v35;
  CGFloat v36;
  CGFloat v37;
  CGImage *v38;
  uint64_t v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  CGAffineTransform transform;
  CGRect v46;
  CGRect v47;
  CGRect slice;
  CGRect remainder;
  CGRect v50;

  v7 = a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a5;
  -[UIImage size](self, "size");
  if (v16 > 0.0 && v17 > 0.0)
  {
    v18 = v16;
    v42 = x;
    v43 = y;
    v44 = v17;
    -[UIImage capInsets](self, "capInsets");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v27 = -[UIImage _isTiledWhenStretchedToSize:](self, "_isTiledWhenStretchedToSize:", width, height);
    v28 = v27;
    v29 = v22 > 0.0;
    if (v26 > 0.0)
      v29 = 1;
    v30 = v29 || v27;
    if (v24 > 0.0)
      v30 = 1;
    if (v20 <= 0.0)
      v31 = v30;
    else
      v31 = 1;
    CGContextTranslateCTM(a3, 0.0, height);
    CGContextScaleCTM(a3, 1.0, -1.0);
    if (v7)
    {
      if (v15)
        objc_msgSend(v15, "contentsTransform");
      else
        memset(&transform, 0, sizeof(transform));
      CGContextConcatCTM(a3, &transform);
    }
    if (v31)
    {
      v32 = (CGImage *)objc_retainAutorelease(v15);
      v33 = v32;
      if (v32)
      {
        -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)v32);
        if ((*((_BYTE *)v33 + 8) & 1) != 0)
          v33 = (CGImage *)*((_QWORD *)v33 + 4);
        else
          v33 = 0;
      }
      v39 = (uint64_t)a6;
      remainder.origin = (CGPoint)*MEMORY[0x1E0C9D538];
      remainder.size.width = width;
      remainder.size.height = height;
      memset(&slice, 0, sizeof(slice));
      memset(&v47, 0, sizeof(v47));
      memset(&v46, 0, sizeof(v46));
      v50.origin.x = remainder.origin.x;
      v50.origin.y = remainder.origin.y;
      v50.size.width = width;
      v50.size.height = height;
      CGRectDivide(v50, &slice, &remainder, v20, CGRectMaxYEdge);
      CGRectDivide(remainder, &v46, &v47, v24, CGRectMinYEdge);
      if (!CGRectIsEmpty(slice))
        Draw3PartSlice(a3, v33, v39, v28, 0.0, 0.0, v18, v20, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, v20, v22, v24, v26);
      Draw3PartSlice(a3, v33, v39, v28, 0.0, v20, v18, v44 - v20 - v24, v47.origin.x, v47.origin.y, v47.size.width, v47.size.height, v20, v22, v24, v26);
      if (!CGRectIsEmpty(v46))
        Draw3PartSlice(a3, v33, v39, v28, 0.0, v44 - v24, v18, v24, v46.origin.x, v46.origin.y, v46.size.width, v46.size.height, v20, v22, v24, v26);
    }
    else if (-[UIImage _shouldDrawVectorContentDirectly](self, "_shouldDrawVectorContentDirectly"))
    {
      objc_msgSend(v15, "drawInContext:withSize:", a3, width, height);
    }
    else
    {
      v34 = objc_retainAutorelease(v15);
      if (v34)
      {
        v35 = v34;
        -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)v34);
        v36 = v42;
        v37 = v43;
        if ((*((_BYTE *)v35 + 8) & 1) != 0)
          v38 = (CGImage *)*((_QWORD *)v35 + 4);
        else
          v38 = 0;
      }
      else
      {
        v38 = 0;
        v36 = v42;
        v37 = v43;
      }
      v40 = width;
      v41 = height;
      CGContextDrawImage(a3, *(CGRect *)&v36, v38);
    }
  }

}

- (BOOL)_shouldDrawVectorContentDirectly
{
  return 0;
}

- (void)drawAsPatternInRect:(CGRect)rect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  _QWORD *ContextStack;
  CGContext *v9;
  id v10;
  CGRect v11;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  +[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = v7;
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v9 = 0;
    else
      v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSetFillColorWithColor(v9, (CGColorRef)objc_msgSend(objc_retainAutorelease(v10), "CGColor"));
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    CGContextFillRect(v9, v11);
    v7 = v10;
  }

}

- (id)_imageWithImageAsset:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  UIImage *v10;
  void *v12;

  v5 = a3;
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIImage.m"), 3258, CFSTR("This code path should not be taken when linked against iOS 14 or newer."));

  }
  -[UIImage imageAsset](self, "imageAsset");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (!v7 || !v6)
    {

LABEL_11:
      v10 = (UIImage *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithOtherImage:", self);
      -[UIImage _setImageAsset:](v10, "_setImageAsset:", v8);
      goto LABEL_12;
    }
    v9 = objc_msgSend(v6, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_11;
  }
  v10 = self;
LABEL_12:

  return v10;
}

- (BOOL)_hasImageAsset
{
  return self->_imageAsset != 0;
}

+ (void)_dropResourceReferencesForURL:(id)a3
{
  +[_UIAssetManager _dropResourceReferencesForURL:](_UIAssetManager, "_dropResourceReferencesForURL:", a3);
}

- (BOOL)_isAlphaMask
{
  return +[UIImage _isCGImageAlphaMask:](UIImage, "_isCGImageAlphaMask:", -[_UIImageContent CGImage](self->_content, "CGImage"));
}

+ (id)symbolImageNamed:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__UIImage_symbolImageNamed___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  v4 = symbolImageNamed__once;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&symbolImageNamed__once, block);
  objc_msgSend(a1, "systemImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __28__UIImage_symbolImageNamed___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = NSTextEffectBoldTintStyle_block_invoke_2___s_category;
  if (!NSTextEffectBoldTintStyle_block_invoke_2___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&NSTextEffectBoldTintStyle_block_invoke_2___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(const char **)(a1 + 32);
    v5 = v3;
    NSStringFromSelector(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v7, 0xCu);

  }
}

+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 weight:(int64_t)a5 compatibleWithFontSize:(double)a6
{
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__UIImage_symbolImageNamed_size_weight_compatibleWithFontSize___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  v10 = symbolImageNamed_size_weight_compatibleWithFontSize__once;
  v11 = a3;
  if (v10 != -1)
    dispatch_once(&symbolImageNamed_size_weight_compatibleWithFontSize__once, block);
  +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", a5, a4, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __63__UIImage_symbolImageNamed_size_weight_compatibleWithFontSize___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = NSTextEffectBoldTintStyle_block_invoke_3___s_category;
  if (!NSTextEffectBoldTintStyle_block_invoke_3___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&NSTextEffectBoldTintStyle_block_invoke_3___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(const char **)(a1 + 32);
    v5 = v3;
    NSStringFromSelector(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v7, 0xCu);

  }
}

+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 weight:(int64_t)a5 compatibleWithFontSize:(double)a6 traitCollection:(id)a7 inBundle:(id)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[5];

  v15 = a3;
  v16 = a7;
  v17 = a8;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__UIImage_symbolImageNamed_size_weight_compatibleWithFontSize_traitCollection_inBundle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (symbolImageNamed_size_weight_compatibleWithFontSize_traitCollection_inBundle__once != -1)
    dispatch_once(&symbolImageNamed_size_weight_compatibleWithFontSize_traitCollection_inBundle__once, block);
  +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", a5, a4, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:", v15, v17, v16);
  else
    objc_msgSend(a1, "systemImageNamed:compatibleWithTraitCollection:", v15, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "imageWithConfiguration:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __88__UIImage_symbolImageNamed_size_weight_compatibleWithFontSize_traitCollection_inBundle___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = NSTextEffectBoldTintStyle_block_invoke_4___s_category;
  if (!NSTextEffectBoldTintStyle_block_invoke_4___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&NSTextEffectBoldTintStyle_block_invoke_4___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(const char **)(a1 + 32);
    v5 = v3;
    NSStringFromSelector(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v7, 0xCu);

  }
}

+ (id)preferredSymbolImageNamed:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__UIImage_preferredSymbolImageNamed___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  v4 = preferredSymbolImageNamed__once;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&preferredSymbolImageNamed__once, block);
  +[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __37__UIImage_preferredSymbolImageNamed___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = NSTextEffectBoldTintStyle_block_invoke_5___s_category;
  if (!NSTextEffectBoldTintStyle_block_invoke_5___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&NSTextEffectBoldTintStyle_block_invoke_5___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(const char **)(a1 + 32);
    v5 = v3;
    NSStringFromSelector(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v7, 0xCu);

  }
}

+ (id)preferredSymbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithTextStyle:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__UIImage_preferredSymbolImageNamed_size_compatibleWithTextStyle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  v8 = preferredSymbolImageNamed_size_compatibleWithTextStyle__once;
  v9 = a5;
  v10 = a3;
  if (v8 != -1)
    dispatch_once(&preferredSymbolImageNamed_size_compatibleWithTextStyle__once, block);
  +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "systemImageNamed:withConfiguration:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __66__UIImage_preferredSymbolImageNamed_size_compatibleWithTextStyle___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = NSTextEffectBoldTintStyle_block_invoke_6___s_category;
  if (!NSTextEffectBoldTintStyle_block_invoke_6___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&NSTextEffectBoldTintStyle_block_invoke_6___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(const char **)(a1 + 32);
    v5 = v3;
    NSStringFromSelector(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v7, 0xCu);

  }
}

+ (id)preferredSymbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithTextStyle:(id)a5 traitCollection:(id)a6 inBundle:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[5];

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__UIImage_preferredSymbolImageNamed_size_compatibleWithTextStyle_traitCollection_inBundle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (preferredSymbolImageNamed_size_compatibleWithTextStyle_traitCollection_inBundle__once != -1)
    dispatch_once(&preferredSymbolImageNamed_size_compatibleWithTextStyle_traitCollection_inBundle__once, block);
  +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", v14, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:", v13, v16, v15);
  else
    objc_msgSend(a1, "systemImageNamed:compatibleWithTraitCollection:", v13, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageWithConfiguration:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __91__UIImage_preferredSymbolImageNamed_size_compatibleWithTextStyle_traitCollection_inBundle___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = NSTextEffectBoldTintStyle_block_invoke_7___s_category;
  if (!NSTextEffectBoldTintStyle_block_invoke_7___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&NSTextEffectBoldTintStyle_block_invoke_7___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(const char **)(a1 + 32);
    v5 = v3;
    NSStringFromSelector(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v7, 0xCu);

  }
}

+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithFont:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UIImage_symbolImageNamed_size_compatibleWithFont___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  v8 = symbolImageNamed_size_compatibleWithFont__once;
  v9 = a5;
  v10 = a3;
  if (v8 != -1)
    dispatch_once(&symbolImageNamed_size_compatibleWithFont__once, block);
  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "systemImageNamed:withConfiguration:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __52__UIImage_symbolImageNamed_size_compatibleWithFont___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = NSTextEffectBoldTintStyle_block_invoke_8___s_category;
  if (!NSTextEffectBoldTintStyle_block_invoke_8___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&NSTextEffectBoldTintStyle_block_invoke_8___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(const char **)(a1 + 32);
    v5 = v3;
    NSStringFromSelector(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v7, 0xCu);

  }
}

+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithFont:(id)a5 traitCollection:(id)a6 inBundle:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[5];

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__UIImage_symbolImageNamed_size_compatibleWithFont_traitCollection_inBundle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (symbolImageNamed_size_compatibleWithFont_traitCollection_inBundle__once != -1)
    dispatch_once(&symbolImageNamed_size_compatibleWithFont_traitCollection_inBundle__once, block);
  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v14, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:", v13, v16, v15);
  else
    objc_msgSend(a1, "systemImageNamed:compatibleWithTraitCollection:", v13, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageWithConfiguration:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __77__UIImage_symbolImageNamed_size_compatibleWithFont_traitCollection_inBundle___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = NSTextEffectBoldTintStyle_block_invoke_9___s_category;
  if (!NSTextEffectBoldTintStyle_block_invoke_9___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&NSTextEffectBoldTintStyle_block_invoke_9___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(const char **)(a1 + 32);
    v5 = v3;
    NSStringFromSelector(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v7, 0xCu);

  }
}

- (id)_initWithData:(id)a3 preserveScale:(BOOL)a4
{
  return -[UIImage _initWithData:preserveScale:cache:](self, "_initWithData:preserveScale:cache:", a3, a4, 0);
}

- (id)_initWithData:(id)a3 scale:(double)a4
{
  return -[UIImage _initWithData:preserveScale:cache:scale:](self, "_initWithData:preserveScale:cache:scale:", a3, 0, 0, a4);
}

- (UIImage)initWithCGImage:(CGImage *)a3 imageOrientation:(int64_t)a4
{
  return -[UIImage initWithCGImage:scale:orientation:](self, "initWithCGImage:scale:orientation:", a3, a4, 1.0);
}

- (id)_initWithIOSurface:(__IOSurface *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  _UIImageIOSurfaceContent *v6;
  id v8;

  v6 = (_UIImageIOSurfaceContent *)a3;
  if (a3)
    v6 = -[_UIImageIOSurfaceContent initWithIOSurface:scale:]([_UIImageIOSurfaceContent alloc], "initWithIOSurface:scale:", a3, a4);
  v8 = -[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", v6, a5, a4);

  return v8;
}

- (id)_initWithIOSurface:(__IOSurface *)a3 imageOrientation:(int64_t)a4
{
  double Scale;

  Scale = _UIRenderingBufferGetScale(a3);
  if (Scale == 0.0)
    Scale = 1.0;
  return -[UIImage _initWithIOSurface:scale:orientation:](self, "_initWithIOSurface:scale:orientation:", a3, a4, Scale);
}

- (UIImage)initWithIOSurface:(__IOSurface *)a3
{
  return (UIImage *)-[UIImage _initWithIOSurface:imageOrientation:](self, "_initWithIOSurface:imageOrientation:", a3, 0);
}

- (__IOSurface)ioSurface
{
  return -[_UIImageContent IOSurface](self->_content, "IOSurface");
}

- (__IOSurface)_copyIOSurface
{
  __IOSurface *v3;
  UIImage *v4;
  CGImage *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  CGContext *v15;
  CGContext *v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  _QWORD v21[3];
  _QWORD v22[4];
  CGRect v23;

  v22[3] = *MEMORY[0x1E0C80C00];
  if (-[_UIImageContent isIOSurface](self->_content, "isIOSurface"))
    return 0;
  v4 = objc_retainAutorelease(self);
  v5 = -[UIImage CGImage](v4, "CGImage");
  -[UIImage scale](v4, "scale");
  v7 = v6;
  -[UIImage size](v4, "size");
  v9 = v7 * v8;
  -[UIImage size](v4, "size");
  v11 = v7 * v10;
  v21[0] = CFSTR("dst-scale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = &unk_1E1A97E78;
  v21[1] = CFSTR("dst-gamut");
  v21[2] = CFSTR("dst-opaque");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CGImageHasAlpha() ^ 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UIRenderingBufferCreate(v14, v9, v11);

  if (v3)
  {
    IOSurfaceLock(v3, 0, 0);
    CGImageGetColorSpace(v5);
    v15 = (CGContext *)CGIOSurfaceContextCreate();
    if (v15)
    {
      v16 = v15;
      CGContextScaleCTM(v15, v7, v7);
      -[UIImage size](v4, "size");
      v18 = v17;
      -[UIImage size](v4, "size");
      v23.size.height = v19;
      v23.origin.x = 0.0;
      v23.origin.y = 0.0;
      v23.size.width = v18;
      CGContextDrawImage(v16, v23, v5);
      CGContextRelease(v16);
    }
    IOSurfaceUnlock(v3, 0, 0);
  }
  return v3;
}

+ (id)_backgroundGradientWithStartColor:(id)a3 andEndColor:(id)a4
{
  id v5;
  id v6;
  _QWORD *ContextStack;
  CGContext *v8;
  void *v9;
  CGColorSpace *DeviceRGB;
  CGGradient *v11;
  void *v12;
  CGFloat components;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  CGPoint v22;
  CGPoint v23;

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  _UIGraphicsBeginImageContextWithOptions(1, 0, 16.0, 1024.0, 0.0);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v8 = 0;
  else
    v8 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  objc_msgSend(v6, "getRed:green:blue:alpha:", &components, &v15, &v16, &v17);

  objc_msgSend(v5, "getRed:green:blue:alpha:", &v18, &v19, &v20, v21);
  +[UIColor clearColor](UIColor, "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "set");

  UIRectFillUsingOperation(1, 0.0, 0.0, 16.0, 1024.0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = CGGradientCreateWithColorComponents(DeviceRGB, &components, 0, 2uLL);
  v22.x = 0.0;
  v22.y = 0.0;
  v23.x = 0.0;
  v23.y = 1024.0;
  CGContextDrawLinearGradient(v8, v11, v22, v23, 0);
  CGGradientRelease(v11);
  CGColorSpaceRelease(DeviceRGB);
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v12;
}

+ (id)_defaultBackgroundGradient
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)_defaultBackgroundGradient___defaultBackgroundGradient;
  if (!_defaultBackgroundGradient___defaultBackgroundGradient)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.88627451, 0.898039216, 0.917647059, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0.815686275;
      v8 = 0.823529412;
      v9 = 0.847058824;
    }
    else
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.843137255, 0.862745098, 0.898039216, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0.784313725;
      v8 = 0.803921569;
      v9 = 0.839215686;
    }
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v7, v8, v9, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_backgroundGradientWithStartColor:andEndColor:", v6, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_defaultBackgroundGradient___defaultBackgroundGradient;
    _defaultBackgroundGradient___defaultBackgroundGradient = v11;

    v3 = (void *)_defaultBackgroundGradient___defaultBackgroundGradient;
  }
  return v3;
}

+ (id)imageFromAlbumArtData:(id)a3 height:(int)a4 width:(int)a5 bytesPerRow:(int)a6 cache:(BOOL)a7
{
  const __CFData *v10;
  const __CFData *v11;
  UIImage *v12;
  CGColorSpace *DeviceRGB;
  CGDataProvider *v14;
  CGImage *v15;
  UIImage *v16;
  void *v17;

  v10 = (const __CFData *)a3;
  v11 = v10;
  if (a4 < 1)
  {
    v12 = 0;
  }
  else
  {
    v12 = 0;
    if (v10 && a5 >= 1)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v14 = CGDataProviderCreateWithCFData(v11);
      v15 = CGImageCreate(a5, a4, 5uLL, 0x10uLL, a6, DeviceRGB, 0x1006u, v14, 0, 0, kCGRenderingIntentDefault);
      CGDataProviderRelease(v14);
      v16 = [UIImage alloc];
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scale");
      v12 = -[UIImage initWithCGImage:scale:orientation:](v16, "initWithCGImage:scale:orientation:", v15, 0);

      CGImageRelease(v15);
      CGColorSpaceRelease(DeviceRGB);
    }
  }

  return v12;
}

- (id)_resizableImageWithSubimageInsets:(UIEdgeInsets)a3 resizeInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  _UIResizableImage *v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = -[_UIResizableImage initWithImage:capInsets:]([_UIResizableImage alloc], "initWithImage:capInsets:", self, a4.top, a4.left, a4.bottom, a4.right);
  -[_UIResizableImage _setSubimageInsets:](v8, "_setSubimageInsets:", top, left, bottom, right);
  return v8;
}

+ (id)_deviceSpecificImageNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  _UIImageDeviceSpecificName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(v4, "stringByAppendingString:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "imageNamed:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    objc_msgSend(a1, "imageNamed:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)_deviceSpecificImageNamed:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  _UIImageDeviceSpecificName();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (objc_msgSend(v6, "stringByAppendingString:", v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "imageNamed:inBundle:", v9, v7),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    objc_msgSend(a1, "imageNamed:inBundle:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- ($8452678F12DBC466148836A9D382CAFC)_calculateStatistics
{
  return -[UIImage _calculateStatisticsOfEdge:](self, "_calculateStatisticsOfEdge:", 0);
}

- ($8452678F12DBC466148836A9D382CAFC)_calculateEdgeStatistics
{
  return -[UIImage _calculateStatisticsOfEdge:](self, "_calculateStatisticsOfEdge:", 1);
}

- ($8452678F12DBC466148836A9D382CAFC)_calculateStatisticsOfEdge:(SEL)a3
{
  double v7;
  size_t v8;
  double v9;
  size_t v10;
  size_t v11;
  __IOSurface *v12;
  __IOSurface *v13;
  OSType PixelFormat;
  OSType v15;
  void *v16;
  $8452678F12DBC466148836A9D382CAFC *v17;
  $8452678F12DBC466148836A9D382CAFC *result;
  unsigned __int8 *v19;
  CGColorSpace *DeviceRGB;
  CGContext *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unsigned __int8 *v31;
  uint64_t v33;
  size_t v34;
  unsigned __int8 *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 *v42;
  uint64_t v44;
  size_t v45;
  unsigned __int8 *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  size_t v51;
  uint64_t v52;
  size_t v53;
  unsigned __int8 *v54;
  size_t j;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  size_t v60;
  uint64_t v61;
  size_t v62;
  unsigned __int8 *v63;
  size_t i;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  unint64_t v69;
  unint64_t v70;
  double v71;
  double v72;
  float v73;
  double v74;
  float v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  int v81;
  double v82;
  double v83;
  double v84;
  double v85;
  char *BaseAddress;
  uint64_t v87;
  double v88;
  double v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  uint64_t v94;
  _QWORD v95[3];
  CGRect v96;

  v95[1] = *MEMORY[0x1E0C80C00];
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  -[UIImage size](self, "size");
  v8 = (unint64_t)v7;
  v10 = (unint64_t)v9;
  v11 = 4 * (unint64_t)v7;
  v12 = -[UIImage ioSurface](self, "ioSurface");
  v13 = v12;
  if (!v12)
    goto LABEL_7;
  IOSurfaceLock(v12, 1u, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(v13);
  PixelFormat = IOSurfaceGetPixelFormat(v13);
  v15 = PixelFormat;
  if (PixelFormat != 1999843442)
  {
    v87 = 0;
    if (PixelFormat != 1647534392)
      goto LABEL_22;
  }
  v94 = *MEMORY[0x1E0CBC750];
  v95[0] = &unk_1E1A97E90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1, BaseAddress);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = CGImageCreateFromIOSurface();
  IOSurfaceUnlock(v13, 1u, 0);

  if (v15 != 1999843442 && v15 != 1647534392)
  {
LABEL_22:
    if (a4)
    {
      v19 = (unsigned __int8 *)BaseAddress;
      if (v10)
      {
        v41 = 0;
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v27 = 0;
        v28 = 0;
        v29 = 0;
        v30 = 0;
        v42 = (unsigned __int8 *)(BaseAddress + 3);
        do
        {
          if (v41 == v10 - 1 || v41 == 0)
            v44 = 1;
          else
            v44 = v8 - 1;
          if (v8)
          {
            v45 = 0;
            v46 = v42;
            do
            {
              v47 = *(v46 - 1);
              v30 += v47;
              v48 = *(v46 - 2);
              v29 += v48;
              v49 = *(v46 - 3);
              v28 += v49;
              v27 += *v46;
              v26 += (v47 * v47);
              v25 += (v48 * v48);
              v24 += (v49 * v49);
              ++v23;
              v45 += v44;
              v46 += 4 * v44;
            }
            while (v45 < v8);
          }
          ++v41;
          v42 += v11;
        }
        while (v41 != v10);
        LODWORD(v40) = 0;
      }
      else
      {
        LODWORD(v40) = 0;
        v30 = 0;
        v29 = 0;
        v28 = 0;
        v27 = 0;
        v26 = 0;
        v25 = 0;
        v24 = 0;
        v23 = 0;
      }
      LODWORD(v39) = 1;
    }
    else
    {
      v39 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v30 = 0;
      LOBYTE(v40) = 1;
      do
      {
        v59 = v40;
        v60 = qword_18667DD00[v39];
        if (v60 < v10)
        {
          v61 = (uint64_t)&BaseAddress[(v11 + 4) * v60 + 1];
          v62 = qword_18667DD00[v39];
          do
          {
            v63 = (unsigned __int8 *)v61;
            for (i = v60; i < v8; v63 += 4 * v60)
            {
              v65 = v63[1];
              v30 += v65;
              v66 = *v63;
              v29 += v66;
              v67 = *(v63 - 1);
              v28 += v67;
              v27 += v63[2];
              v26 += (v65 * v65);
              v25 += (v66 * v66);
              v24 += (v67 * v67);
              ++v23;
              i += v60;
            }
            v62 += v60;
            v61 += v11 * v60;
          }
          while (v62 < v10);
        }
        LODWORD(v40) = 0;
        v39 = 1;
      }
      while ((v59 & 1) != 0);
      v19 = (unsigned __int8 *)BaseAddress;
    }
    goto LABEL_55;
  }
  v17 = ($8452678F12DBC466148836A9D382CAFC *)v87;
  if (!v87)
  {
LABEL_7:
    result = ($8452678F12DBC466148836A9D382CAFC *)CGImageRetain(-[UIImage CGImage](objc_retainAutorelease(self), "CGImage"));
    v17 = result;
    if (!result)
      return result;
  }
  v19 = (unsigned __int8 *)malloc_type_malloc(v11 * v10, 0x44CC45B5uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v21 = CGBitmapContextCreate(v19, v8, v10, 8uLL, v11, DeviceRGB, 0x4001u);
  v96.size.width = (double)v8;
  v96.size.height = (double)v10;
  v96.origin.x = 0.0;
  v96.origin.y = 0.0;
  CGContextDrawImage(v21, v96, (CGImageRef)v17);
  CGContextRelease(v21);
  CGColorSpaceRelease(DeviceRGB);
  if (a4)
  {
    if (v10)
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v30 = 0;
      v31 = v19 + 3;
      do
      {
        if (v22 == v10 - 1 || v22 == 0)
          v33 = 1;
        else
          v33 = v8 - 1;
        if (v8)
        {
          v34 = 0;
          v35 = v31;
          do
          {
            v36 = *(v35 - 3);
            v30 += v36;
            v37 = *(v35 - 2);
            v29 += v37;
            v38 = *(v35 - 1);
            v28 += v38;
            v27 += *v35;
            v26 += (v36 * v36);
            v25 += (v37 * v37);
            v24 += (v38 * v38);
            ++v23;
            v34 += v33;
            v35 += 4 * v33;
          }
          while (v34 < v8);
        }
        ++v22;
        v31 += v11;
      }
      while (v22 != v10);
      LODWORD(v39) = 0;
      LODWORD(v40) = 1;
    }
    else
    {
      LODWORD(v39) = 0;
      v30 = 0;
      v29 = 0;
      v28 = 0;
      v27 = 0;
      v26 = 0;
      v25 = 0;
      v24 = 0;
      v23 = 0;
      LODWORD(v40) = 1;
    }
    goto LABEL_56;
  }
  v87 = (uint64_t)v17;
  v40 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  LOBYTE(v39) = 1;
  do
  {
    v50 = v39;
    v51 = qword_18667DD00[v40];
    if (v51 < v10)
    {
      v52 = (uint64_t)&v19[(v11 + 4) * v51 + 1];
      v53 = qword_18667DD00[v40];
      do
      {
        v54 = (unsigned __int8 *)v52;
        for (j = v51; j < v8; v54 += 4 * v51)
        {
          v56 = *(v54 - 1);
          v30 += v56;
          v57 = *v54;
          v29 += v57;
          v58 = v54[1];
          v28 += v58;
          v27 += v54[2];
          v26 += (v56 * v56);
          v25 += (v57 * v57);
          v24 += (v58 * v58);
          ++v23;
          j += v51;
        }
        v53 += v51;
        v52 += v11 * v51;
      }
      while (v53 < v10);
    }
    LODWORD(v39) = 0;
    v40 = 1;
  }
  while ((v50 & 1) != 0);
LABEL_55:
  v17 = ($8452678F12DBC466148836A9D382CAFC *)v87;
LABEL_56:
  v68 = 1.0 / (double)v23;
  v69 = (unint64_t)(v68 * (double)v30);
  v70 = (unint64_t)(v68 * (double)v29);
  v71 = v68 * (double)v28;
  v72 = v68 * (double)v27;
  v73 = fmax(v68 * (double)v26 - (double)(v69 * v69), 0.0);
  v74 = sqrtf(v73);
  v75 = fmax(v68 * (double)v25 - (double)(v70 * v70), 0.0);
  v76 = sqrtf(v75);
  *(float *)&v68 = fmax(v68 * (double)v24 - (double)((unint64_t)v71 * (unint64_t)v71), 0.0);
  v77 = sqrtf(*(float *)&v68);
  v92 = 0.0;
  v93 = 0.0;
  v90 = 0;
  v91 = 0.0;
  v88 = 0.0;
  v89 = 0.0;
  v78 = (double)v69 * 0.00392156863;
  v79 = (double)v70 * 0.00392156863;
  v80 = (double)(unint64_t)v71 * 0.00392156863;
  __RGBtoHSV(&v93, &v92, &v91, v78, v79, v80);
  result = ($8452678F12DBC466148836A9D382CAFC *)__RGBtoHSV((double *)&v90, &v89, &v88, v74 * 0.00392156863, v76 * 0.00392156863, v77 * 0.00392156863);
  if (v13 && (_DWORD)v39)
    result = ($8452678F12DBC466148836A9D382CAFC *)IOSurfaceUnlock(v13, 1u, 0);
  if (v17)
    v81 = v40;
  else
    v81 = 0;
  if (v81 == 1)
  {
    free(v19);
    CGImageRelease((CGImageRef)v17);
  }
  retstr->var0 = v78;
  retstr->var1 = v79;
  v82 = v93;
  retstr->var2 = v80;
  retstr->var3 = v82;
  v83 = v91;
  retstr->var4 = v92;
  retstr->var5 = v83;
  v84 = v88;
  v85 = v89;
  retstr->var6 = (double)(unint64_t)v72 * 0.00392156863;
  retstr->var7 = v84;
  retstr->var8 = v85;
  return result;
}

- (id)_imagePaddedByInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (-[UIImage _isResizable](self, "_isResizable"))
  {
    NSLog(CFSTR("_imagePaddedByInsets: does not support resizable images"));
    v8 = 0;
  }
  else
  {
    -[UIImage _contentInsets](self, "_contentInsets");
    -[UIImage _imageWithContentInsets:withUpdatedCGImage:](self, "_imageWithContentInsets:withUpdatedCGImage:", 1, top + v9, left + v10, bottom + v11, right + v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)_imageWithSize:(CGSize)a3
{
  UIImage *v4;
  double height;
  double width;
  double v7;
  double v8;

  v4 = 0;
  if (a3.width >= 0.0)
  {
    height = a3.height;
    if (a3.height >= 0.0)
    {
      width = a3.width;
      -[UIImage size](self, "size");
      if (width == v8 && height == v7)
      {
        v4 = self;
      }
      else
      {
        -[UIImage _imageWithSize:content:](self, "_imageWithSize:content:", self->_content, width, height);
        v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v4;
}

- (id)_imageWithSize:(CGSize)a3 content:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double *v17;
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
  double v28;
  double v29;
  double v30;
  double v31;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[UIImage size](self, "size");
  v9 = v8;
  v11 = v10;
  v12 = v8 <= 0.0;
  v13 = 1.0;
  if (v12)
    v14 = 1.0;
  else
    v14 = v9;
  v15 = width / v14;
  if (v11 > 0.0)
    v13 = v11;
  v16 = height / v13;
  -[UIImage _imageWithContent:](self, "_imageWithContent:", v7);
  v17 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v19 = v18;

  v17[9] = width * v19;
  v17[10] = height * v19;
  v20 = v15 * 0.5;
  v21 = v16 * 0.5;
  objc_msgSend(v17, "_setContentInsets:", v16 * 0.5 * self->_contentInsets.top, v15 * 0.5 * self->_contentInsets.left, v16 * 0.5 * self->_contentInsets.bottom, v15 * 0.5 * self->_contentInsets.right);
  if (-[UIImage _isResizable](self, "_isResizable"))
  {
    -[UIImage capInsets](self, "capInsets");
    objc_msgSend(v17, "_setCapInsets:", v21 * v24, v20 * v22, v21 * v25, v20 * v23);
  }
  if (-[UIImage _isSubimage](self, "_isSubimage"))
  {
    -[UIImage _subimageInsets](self, "_subimageInsets");
    objc_msgSend(v17, "_setSubimageInsets:", v21 * v28, v20 * v26, v21 * v29, v20 * v27);
  }
  if (-[UIImage hasBaseline](self, "hasBaseline") && v11 != 0.0)
  {
    -[UIImage baselineOffsetFromBottom](self, "baselineOffsetFromBottom");
    objc_msgSend(v17, "_setBaselineOffsetFromBottom:", v16 * v30);
  }
  if (-[UIImage hasMidline](self, "hasMidline") && v9 != 0.0)
  {
    -[UIImage midlineOffsetFromCenter](self, "midlineOffsetFromCenter");
    objc_msgSend(v17, "_setMidlineOffsetFromCenter:", v15 * v31);
  }
  return v17;
}

+ (id)_noiseImage
{
  return +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UIBackgroundNoise"));
}

- (UIImage)imageByPreparingThumbnailOfSize:(CGSize)size
{
  void *v3;
  void *v5;
  void *v6;

  v3 = 0;
  if (size.width >= 0.0 && size.height >= 0.0)
  {
    -[_UIImageContent contentOptimizedForImageSize:](self->_content, "contentOptimizedForImageSize:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "size");
      -[UIImage _imageWithSize:content:](self, "_imageWithSize:content:", v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return (UIImage *)v3;
}

- (void)prepareThumbnailOfSize:(CGSize)size completionHandler:(void *)completionHandler
{
  double height;
  double width;
  void *v7;
  void *v8;
  _UIImageContent *content;
  _QWORD v10[5];
  id v11;

  height = size.height;
  width = size.width;
  v7 = completionHandler;
  v8 = v7;
  if (width < 0.0 || height < 0.0)
  {
    (*((void (**)(void *, _QWORD))v7 + 2))(v7, 0);
  }
  else
  {
    content = self->_content;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__UIImage_prepareThumbnailOfSize_completionHandler___block_invoke;
    v10[3] = &unk_1E16CAFC8;
    v10[4] = self;
    v11 = v7;
    -[_UIImageContent optimizeContentForImageSize:completionHandler:](content, "optimizeContentForImageSize:completionHandler:", v10, width, height);

  }
}

void __52__UIImage_prepareThumbnailOfSize_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v7 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "size");
    objc_msgSend(v5, "_imageWithSize:content:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

- (void)_prepareForScreen:(id)a3 completionHandler:(id)a4
{
  -[UIImage prepareForDisplayWithCompletionHandler:](self, "prepareForDisplayWithCompletionHandler:", a4);
}

- (id)_imageWithBitmapRepresentation
{
  void *v3;
  void *v4;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage _imagePreparedForScreen:](self, "_imagePreparedForScreen:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_initWithData:(id)a3 immediateLoadWithMaxSize:(CGSize)a4 scale:(double)a5 renderingIntent:(unint64_t)a6
{
  return -[UIImage _initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:](self, "_initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:", a3, a6, 1, a4.width, a4.height, a5);
}

+ (id)imageAtPath:(id)a3
{
  return _UIImageAtPath(a3, 0, 0, 0);
}

- (UIImage)initWithData:(id)a3 cache:(BOOL)a4
{
  return (UIImage *)-[UIImage _initWithData:preserveScale:cache:](self, "_initWithData:preserveScale:cache:", a3, 0, a4);
}

- (CGImage)imageRef
{
  return -[_UIImageContent CGImage](self->_content, "CGImage");
}

- (void)compositeToRect:(CGRect)a3 fromRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6
{
  uint64_t v6;
  double width;
  double y;
  double x;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v15;
  double v16;
  CGImage *v17;
  _BOOL4 IsEmpty;
  _BOOL4 v19;
  size_t v20;
  double v21;
  size_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  CGFloat v37;
  CGImage *v38;
  CGFloat v39;
  CGFloat v40;
  double height;
  CGRect v42;

  v6 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (-[_UIImageContent isCGImage](self->_content, "isCGImage"))
  {
    v39 = v11;
    v40 = v10;
    -[UIImage scale](self, "scale");
    v16 = v15;
    v17 = -[_UIImageContent CGImage](self->_content, "CGImage");
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    IsEmpty = CGRectIsEmpty(v42);
    v19 = v16 != 0.0 && v16 != 1.0;
    if (IsEmpty)
    {
      v20 = CGImageGetWidth(v17);
      v21 = (double)v20;
      v22 = CGImageGetHeight(v17);
      v23 = (double)v22;
      v24 = 0.0;
      if (v19)
      {
        v25 = 1.0;
        v24 = 1.0 / v16 * 0.0;
        if (v20 <= 1)
          v26 = 1.0;
        else
          v26 = 1.0 / v16;
        v21 = v26 * v21;
        if (v22 > 1)
          v25 = 1.0 / v16;
        v23 = v25 * v23;
      }
      compositeCGImageRefInRect(v17, v13, v12, v11, v40, v24, v24, v21, v23, v6, -[UIImage imageOrientation](self, "imageOrientation"), a6);
    }
    else
    {
      if (v19)
      {
        v27 = x;
        v28 = x * v16;
        v29 = y * v16;
        if (width <= 1.0)
          v30 = 1.0;
        else
          v30 = v16;
        v31 = width * v30;
        v32 = height;
        v33 = v12;
        v34 = v13;
        v35 = a6;
        if (height <= 1.0)
          v36 = height;
        else
          v36 = height * v16;
        v37 = v27;
      }
      else
      {
        v36 = height;
        v31 = width;
        v29 = y;
        v28 = x;
        v37 = x;
        v32 = height;
        v33 = v12;
        v34 = v13;
        v35 = a6;
      }
      v38 = CGImageCreateWithImageInRect(v17, *(CGRect *)&v28);
      compositeCGImageRefInRect(v38, v34, v33, v39, v40, v37, y, width, v32, v6, -[UIImage imageOrientation](self, "imageOrientation"), v35);
      CGImageRelease(v38);
    }
  }
}

- (void)compositeToPoint:(CGPoint)a3 fromRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6
{
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v15;
  double v16;
  CGImage *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGImage *v23;

  v7 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3.y;
  v13 = a3.x;
  if (-[_UIImageContent isCGImage](self->_content, "isCGImage"))
  {
    -[UIImage scale](self, "scale");
    v16 = v15;
    v17 = -[_UIImageContent CGImage](self->_content, "CGImage");
    if (v16 == 1.0 || v16 == 0.0)
    {
      v22 = height;
      v21 = width;
      v19 = y;
      v18 = x;
    }
    else
    {
      v18 = x * v16;
      v19 = y * v16;
      if (width <= 1.0)
        v20 = 1.0;
      else
        v20 = v16;
      v21 = width * v20;
      if (height <= 1.0)
        v22 = height;
      else
        v22 = height * v16;
    }
    v23 = CGImageCreateWithImageInRect(v17, *(CGRect *)&v18);
    compositeCGImageRef(v23, v13, v12, x, y, width, height, a6, v7, -[UIImage imageOrientation](self, "imageOrientation"));
    CGImageRelease(v23);
  }
}

- (void)compositeToPoint:(CGPoint)a3 operation:(int)a4 fraction:(double)a5
{
  uint64_t v6;
  double y;
  double x;
  CGImage *v10;
  size_t Width;
  double v12;
  size_t Height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v6 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  if (-[_UIImageContent isCGImage](self->_content, "isCGImage"))
  {
    v10 = -[_UIImageContent CGImage](self->_content, "CGImage");
    Width = CGImageGetWidth(v10);
    v12 = (double)Width;
    Height = CGImageGetHeight(v10);
    v14 = (double)Height;
    -[UIImage scale](self, "scale");
    v16 = 0.0;
    if (v15 != 1.0 && v15 != 0.0)
    {
      v17 = 1.0 / v15;
      v16 = v17 * 0.0;
      if (Width <= 1)
        v18 = 1.0;
      else
        v18 = v17;
      v12 = v18 * v12;
      if (Height <= 1)
        v17 = 1.0;
      v14 = v17 * v14;
    }
    compositeCGImageRef(v10, x, y, v16, v16, v12, v14, a5, v6, -[UIImage imageOrientation](self, "imageOrientation"));
  }
}

- (void)compositeToPoint:(CGPoint)a3 operation:(int)a4
{
  -[UIImage compositeToPoint:operation:fraction:](self, "compositeToPoint:operation:fraction:", *(_QWORD *)&a4, a3.x, a3.y, 1.0);
}

- (void)draw9PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _BYTE v9[288];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  memcpy(v9, a3, sizeof(v9));
  -[UIImage draw9PartImageWithSliceRects:inRect:fraction:](self, "draw9PartImageWithSliceRects:inRect:fraction:", v9, x, y, width, height, 1.0);
}

- (void)draw9PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 fraction:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  _BYTE v11[288];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  memcpy(v11, a3, sizeof(v11));
  -[UIImage draw9PartImageWithSliceRects:inRect:operation:fraction:](self, "draw9PartImageWithSliceRects:inRect:operation:fraction:", v11, 2, x, y, width, height, a5);
}

- (void)draw9PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6
{
  uint64_t v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v14;
  CGSize size;
  CGSize v16;
  CGSize v17;
  CGSize v18;
  CGSize v19;
  CGFloat v20;
  CGSize v21;
  CGSize v22;
  UIImage *v23;
  CGPoint v24;
  CGFloat v25;
  CGFloat v26;
  CGPoint v27;
  CGSize v28;
  CGPoint v29;
  CGSize v30;
  CGPoint origin;
  CGSize v32;
  CGPoint v33;
  CGSize v34;
  CGPoint v35;
  CGSize v36;
  CGRect slice;
  CGRect remainder;
  CGPoint v39;
  CGSize v40;
  CGPoint v41;
  CGSize v42;
  CGPoint v43;
  CGSize v44;
  CGPoint v45;
  CGSize v46;
  CGPoint v47;
  CGSize v48;
  uint64_t v49;
  CGRect v50;

  v7 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v49 = *MEMORY[0x1E0C80C00];
  if (-[_UIImageContent isCGImage](self->_content, "isCGImage"))
  {
    origin = a3->var0.var0.origin;
    v32.width = a3->var0.var0.size.width;
    v14 = a3->var0.var0.size.height;
    size = a3->var1.var1.size;
    v45 = a3->var1.var1.origin;
    v46 = size;
    v16 = a3->var1.var2.size;
    v47 = a3->var1.var2.origin;
    v48 = v16;
    v17 = a3->var0.var2.size;
    v41 = a3->var0.var2.origin;
    v42 = v17;
    v18 = a3->var1.var0.size;
    v43 = a3->var1.var0.origin;
    v44 = v18;
    v19 = a3->var0.var1.size;
    v39 = a3->var0.var1.origin;
    v40 = v19;
    v24 = a3->var2.var0.origin;
    v25 = a3->var2.var0.size.width;
    v20 = a3->var2.var0.size.height;
    v21 = a3->var2.var1.size;
    v27 = a3->var2.var1.origin;
    v28 = v21;
    v22 = a3->var2.var2.size;
    v29 = a3->var2.var2.origin;
    v30 = v22;
    remainder.origin.x = x;
    remainder.origin.y = y;
    remainder.size.width = width;
    remainder.size.height = height;
    memset(&slice, 0, sizeof(slice));
    v23 = self;
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    CGRectDivide(v50, &slice, &remainder, v14, CGRectMinYEdge);
    v32.height = v14;
    v33 = v39;
    v34 = v40;
    v35 = v41;
    v36 = v42;
    draw9PartSlice(v23, &origin.x, v7, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, a6);
    CGRectDivide(remainder, &slice, &remainder, v20, CGRectMaxYEdge);
    v33 = v45;
    v34 = v46;
    v35 = v47;
    v36 = v48;
    origin = v43;
    v32 = v44;
    draw9PartSlice(v23, &origin.x, v7, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, a6);
    v26 = v20;
    draw9PartSlice(v23, &v24.x, v7, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, a6);

  }
}

- (void)draw3PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4
{
  CGSize size;
  CGSize v5;
  CGSize v6;
  _OWORD v7[6];

  size = a3->var1.size;
  v7[2] = a3->var1.origin;
  v7[3] = size;
  v5 = a3->var2.size;
  v7[4] = a3->var2.origin;
  v7[5] = v5;
  v6 = a3->var0.size;
  v7[0] = a3->var0.origin;
  v7[1] = v6;
  -[UIImage draw3PartImageWithSliceRects:inRect:fraction:](self, "draw3PartImageWithSliceRects:inRect:fraction:", v7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 1.0);
}

- (void)draw3PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 fraction:(double)a5
{
  CGSize size;
  CGSize v6;
  CGSize v7;
  _OWORD v8[6];

  size = a3->var1.size;
  v8[2] = a3->var1.origin;
  v8[3] = size;
  v6 = a3->var2.size;
  v8[4] = a3->var2.origin;
  v8[5] = v6;
  v7 = a3->var0.size;
  v8[0] = a3->var0.origin;
  v8[1] = v7;
  -[UIImage draw3PartImageWithSliceRects:inRect:operation:fraction:](self, "draw3PartImageWithSliceRects:inRect:operation:fraction:", v8, 2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
}

- (void)draw3PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6
{
  uint64_t v7;
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  double v21;
  double v23;
  double v24;
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
  UIImage *v36;

  v7 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (-[_UIImageContent isCGImage](self->_content, "isCGImage"))
  {
    v26 = width;
    v27 = height;
    v14 = a3->var0.origin.x;
    v15 = a3->var0.size.width;
    v31 = a3->var0.size.height;
    v32 = a3->var0.origin.y;
    v16 = a3->var1.size.width;
    v28 = a3->var1.origin.x;
    v29 = a3->var1.origin.y;
    v18 = a3->var1.size.height;
    v17 = a3->var2.origin.x;
    v30 = a3->var2.origin.y;
    v34 = a3->var2.size.height;
    v35 = a3->var2.size.width;
    v36 = self;
    -[UIImage compositeToPoint:fromRect:operation:fraction:](v36, "compositeToPoint:fromRect:operation:fraction:", v7, x, y, v14, v32, v15, v31, a6);
    v33 = v17;
    if (v16 > v18 && v14 == v17)
    {
      v23 = y + v31;
      v24 = y + v27 - v34;
      if (v18 <= 1.0 && v23 < v24)
      {
        -[UIImage compositeToRect:fromRect:operation:fraction:](v36, "compositeToRect:fromRect:operation:fraction:", v7, x, v23, v16, v24 - v23, v28, v29, v16, v18, *(_QWORD *)&a6);
        v23 = v24;
      }
      else
      {
        for (; v23 < v24; v23 = v23 + v18)
        {
          if (v18 + v23 > v24)
            v18 = v24 - v23;
          -[UIImage compositeToPoint:fromRect:operation:fraction:](v36, "compositeToPoint:fromRect:operation:fraction:", v7, x, v23, v28, v29, v16, v18, a6);
        }
      }
      y = floor(v23);
    }
    else
    {
      v20 = x + v15;
      v21 = x + v26 - v35;
      if (v16 <= 1.0 && v20 < v21)
      {
        -[UIImage compositeToRect:fromRect:operation:fraction:](v36, "compositeToRect:fromRect:operation:fraction:", v7, v20, y, v21 - v20, v18, v28, v29, v16, v18, *(_QWORD *)&a6);
        v20 = v21;
      }
      else
      {
        for (; v20 < v21; v20 = v20 + v16)
        {
          if (v16 + v20 > v21)
            v16 = v21 - v20;
          -[UIImage compositeToPoint:fromRect:operation:fraction:](v36, "compositeToPoint:fromRect:operation:fraction:", v7, v20, y, v28, v29, v16, v18, a6);
        }
      }
      x = floor(v20);
    }
    -[UIImage compositeToPoint:fromRect:operation:fraction:](v36, "compositeToPoint:fromRect:operation:fraction:", v7, x, y, v33, v30, v35, v34, a6);

  }
}

- (void)draw1PartImageInRect:(CGRect)a3
{
  -[UIImage draw1PartImageInRect:fraction:](self, "draw1PartImageInRect:fraction:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 1.0);
}

- (void)draw1PartImageInRect:(CGRect)a3 fraction:(double)a4
{
  -[UIImage draw1PartImageInRect:fraction:operation:](self, "draw1PartImageInRect:fraction:operation:", 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (void)draw1PartImageInRect:(CGRect)a3 fraction:(double)a4 operation:(int)a5
{
  uint64_t v5;
  CGFloat height;
  double width;
  double y;
  double x;
  UIImage *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIImage *i;
  double v21;
  UIImage *v22;

  v5 = *(_QWORD *)&a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[_UIImageContent isCGImage](self->_content, "isCGImage"))
  {
    v21 = height;
    v12 = self;
    v13 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v22 = v12;
    -[UIImage size](v12, "size");
    v17 = v15;
    v18 = v16;
    if (v15 <= 1.0)
    {
      -[UIImage compositeToRect:fromRect:operation:fraction:](v22, "compositeToRect:fromRect:operation:fraction:", v5, x, y, width, v21, v13, v14, v15, v16, *(_QWORD *)&a4);
      i = v22;
    }
    else
    {
      v19 = x + width;
      for (i = v22; x < v19; x = x + v17)
      {
        if (x + v17 > v19)
          v17 = v19 - x;
        -[UIImage compositeToPoint:fromRect:operation:fraction:](v22, "compositeToPoint:fromRect:operation:fraction:", v5, x, y, v13, v14, v17, v18, a4);
        i = v22;
      }
    }

  }
}

- (id)patternColor
{
  return +[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:", self);
}

void __55__UIImage_UIImageDeprecatedPrivate___tiledPatternColor__block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGFloat MinX;
  CGFloat MaxY;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  CGFloat v11;
  double v12;
  CGAffineTransform v13;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
  MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 40));
  CGContextTranslateCTM(v3, MinX, MaxY);
  CGContextScaleCTM(v3, 1.0, -1.0);
  v6 = objc_msgSend(*(id *)(a1 + 32), "imageOrientation");
  if (v6)
  {
    v7 = *(double *)(a1 + 80);
    v8 = *(double *)(a1 + 72) * v7;
    if (v8 > 0.0)
    {
      v9 = v7 * *(double *)(a1 + 88);
      if (v9 > 0.0)
      {
        v10 = xmmword_18667DCB0;
        v11 = -1.0;
        v12 = 0.0;
        switch(v6)
        {
          case 1:
            break;
          case 2:
            v12 = v9 / v8;
            *((_QWORD *)&v10 + 1) = 0;
            *(double *)&v10 = -v8 / v9;
            v9 = 0.0;
            goto LABEL_13;
          case 3:
            v12 = -v9 / v8;
            *((_QWORD *)&v10 + 1) = 0;
            *(double *)&v10 = v8 / v9;
            goto LABEL_12;
          case 4:
            v10 = xmmword_18666F250;
            v9 = 0.0;
            break;
          case 5:
            v11 = 1.0;
            v8 = 0.0;
            break;
          case 6:
            v12 = -v9 / v8;
            *((_QWORD *)&v10 + 1) = 0;
            *(double *)&v10 = -v8 / v9;
            goto LABEL_13;
          case 7:
            v12 = v9 / v8;
            *((_QWORD *)&v10 + 1) = 0;
            *(double *)&v10 = v8 / v9;
            v9 = 0.0;
LABEL_12:
            v8 = 0.0;
LABEL_13:
            v11 = 0.0;
            break;
          default:
            v11 = *MEMORY[0x1E0C9BAA8];
            v12 = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
            v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
            v8 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
            v9 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
            break;
        }
        v13.a = v11;
        v13.b = v12;
        *(_OWORD *)&v13.c = v10;
        v13.tx = v8;
        v13.ty = v9;
        CGContextConcatCTM(v3, &v13);
      }
    }
  }
  CGContextDrawTiledImage(v3, *(CGRect *)(a1 + 96), (CGImageRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage"));
}

+ (void)_flushSharedImageCache
{
  _UISharedImageFlushAll();
  +[_UIOldCGImageDecompressor flushCaches]();
}

+ (void)_flushCache:(id)a3
{
  _UISharedImageFlushAll();
  +[_UIOldCGImageDecompressor flushCaches]();
}

- (id)_swizzleContent:(id)a3
{
  _UIImageContent *v4;
  _UIImageContent *v5;
  _UIImageContent *content;
  _UIImageContent *v7;

  v4 = (_UIImageContent *)a3;
  v5 = self->_content;
  content = self->_content;
  self->_content = v4;
  v7 = v4;

  return v5;
}

- (void)_setCached:(BOOL)a3
{
  int v3;
  UIImage *v4;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFFFBF | v3);
  if (a3)
    v4 = self;
  else
    v4 = 0;
  objc_setAssociatedObject(self, &UIImageTableCachedRetainCycleAssociationKey, v4, (void *)1);
}

- (BOOL)_isCached
{
  return (*(_BYTE *)&self->_imageFlags >> 6) & 1;
}

- (BOOL)_hasVisibleContentInRect:(CGRect)a3 atScale:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  BOOL v10;
  __IOSurface *v11;
  char *BaseAddress;
  size_t v13;
  size_t v14;
  size_t BytesPerRow;
  size_t BytesPerElement;
  int v17;
  double v18;
  int v19;
  double MinX;
  double v21;
  int v22;
  int v23;
  char *v24;
  int v25;
  uint64_t v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
    return 0;
  v11 = -[UIImage ioSurface](self, "ioSurface");
  IOSurfaceLock(v11, 1u, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(v11);
  v13 = IOSurfaceGetHeight(v11);
  v14 = IOSurfaceGetWidth(v11);
  BytesPerRow = IOSurfaceGetBytesPerRow(v11);
  BytesPerElement = IOSurfaceGetBytesPerElement(v11);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v17 = (int)fmax(CGRectGetMinY(v28) * a4, 0.0);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v18 = CGRectGetMaxY(v29) * a4;
  if (v18 >= (double)v13)
    v18 = (double)v13;
  v19 = (int)v18;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MinX = CGRectGetMinX(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v21 = CGRectGetMaxX(v31) * a4;
  if (v21 >= (double)v14)
    v21 = (double)v14;
  if (v17 >= v19)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    v22 = (int)v21;
    v23 = (int)fmax(MinX * a4, 0.0);
    v24 = &BaseAddress[BytesPerRow * v17];
    do
    {
      v25 = v22 - v23;
      v26 = BytesPerElement * v23 + 3;
      if (v22 > v23)
      {
        while (v24[v26] < 0x1Au)
        {
          v26 += BytesPerElement;
          if (!--v25)
            goto LABEL_14;
        }
        v10 = 1;
      }
LABEL_14:
      v24 += BytesPerRow;
      ++v17;
    }
    while (v17 != v19);
  }
  IOSurfaceUnlock(v11, 1u, 0);
  return v10;
}

- (BOOL)_probeIsSeeThrough
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIImage *v8;
  char BitmapInfo;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD *ContextStack;
  CGContext *v19;
  unsigned __int8 *Data;
  int Width;
  int Height;
  int BytesPerRow;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  unsigned int v27;
  char v28;

  objc_getAssociatedObject(self, &__imageSeeThroughKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIImage size](self, "size");
    v5 = v4;
    v7 = v6;
    v8 = objc_retainAutorelease(self);
    BitmapInfo = CGImageGetBitmapInfo(-[UIImage CGImage](v8, "CGImage"));
    v10 = 1;
    if (v5 != 0.0 && v7 != 0.0)
    {
      if ((BitmapInfo & 0x1Fu) <= 6 && ((1 << (BitmapInfo & 0x1F)) & 0x61) != 0)
      {
        v10 = 0;
      }
      else
      {
        if (v5 > 50.0 || v7 > 50.0)
        {
          v11 = v5 / v7;
          if (v5 / v7 >= 1.0)
          {
            v5 = 50.0;
            v13 = 50.0 / v11;
            if (v13 >= 1.0)
              v7 = v13;
            else
              v7 = 1.0;
          }
          else
          {
            v7 = 50.0;
            v12 = v11 * 50.0;
            if (v12 >= 1.0)
              v5 = v12;
            else
              v5 = 1.0;
          }
        }
        v14 = v5 * 0.8;
        if (v5 * 0.8 < 1.0)
          v14 = 1.0;
        v15 = v7 * 0.8;
        if (v7 * 0.8 < 1.0)
          v15 = 1.0;
        v16 = (v5 - v14) * -0.5;
        v17 = (v7 - v15) * -0.5;
        _UIGraphicsBeginImageContextWithOptions(0, 1, v14, v15, 1.0);
        ContextStack = GetContextStack(0);
        if (*(int *)ContextStack < 1)
          v19 = 0;
        else
          v19 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
        CGContextSetInterpolationQuality(v19, kCGInterpolationNone);
        -[UIImage drawInRect:](v8, "drawInRect:", v16, v17, v5, v7);
        Data = (unsigned __int8 *)CGBitmapContextGetData(v19);
        Width = CGBitmapContextGetWidth(v19);
        Height = CGBitmapContextGetHeight(v19);
        BytesPerRow = CGBitmapContextGetBytesPerRow(v19);
        if (Height < 1)
        {
LABEL_29:
          v10 = 0;
        }
        else
        {
          v24 = 0;
          while (1)
          {
            v25 = Width;
            v26 = Data;
            if (Width >= 1)
              break;
LABEL_28:
            ++v24;
            Data += BytesPerRow;
            if (v24 == Height)
              goto LABEL_29;
          }
          while (1)
          {
            v27 = *v26++;
            if (v27 <= 0xE5)
              break;
            if (!--v25)
              goto LABEL_28;
          }
          v10 = 1;
        }
        UIGraphicsEndImageContext();
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v8, &__imageSeeThroughKey, v3, (void *)1);
  }
  v28 = objc_msgSend(v3, "BOOLValue");

  return v28;
}

- (id)_bezeledImageWithShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 fillRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 drawShadow:(BOOL)a11
{
  _BOOL4 v11;
  void *v17;
  void *v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  int *ContextStack;
  CGContext *v27;
  CGColor *v28;
  void *v29;
  CGSize v31;

  v11 = a11;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", a3, a4, a5, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", a7, a8, a9, a10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage size](self, "size");
  v21 = v20;
  v22 = v19;
  v23 = 0.0;
  if (v11)
    v23 = 1.0;
  v24 = v23 + v19;
  -[UIImage scale](self, "scale");
  _UIGraphicsBeginImageContextWithOptions(0, 0, v21, v24, v25);
  ContextStack = (int *)GetContextStack(0);
  if (*ContextStack < 1)
  {
    v27 = 0;
    if (v11)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(v18, "set");
    UIRectFillUsingOperation(1, 0.0, 0.0, v21, v22);
    -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v21, v22, 1.0);
    goto LABEL_8;
  }
  v27 = *(CGContext **)&ContextStack[6 * (*ContextStack - 1) + 2];
  if (!v11)
    goto LABEL_7;
LABEL_5:
  v28 = (CGColor *)objc_msgSend(objc_retainAutorelease(v17), "CGColor");
  v31.width = 0.0;
  v31.height = -1.0;
  CGContextSetShadowWithColor(v27, v31, 0.0, v28);
  CGContextBeginTransparencyLayer(v27, 0);
  objc_msgSend(v18, "set");
  UIRectFillUsingOperation(1, 0.0, 1.0, v21, v22);
  -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", 22, 0.0, 1.0, v21, v22, 1.0);
  CGContextEndTransparencyLayer(v27);
LABEL_8:
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v29;
}

- (id)_doubleBezeledImageWithExteriorShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 interiorShadowRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 fillRed:(double)a11 green:(double)a12 blue:(double)a13 alpha:(double)a14
{
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  _QWORD *ContextStack;
  CGContext *v29;
  id v30;
  CGColor *v31;
  void *v32;
  double v33;
  id v34;
  CGImage *v35;
  CGFloat v36;
  id v37;
  CGColor *v38;
  void *v39;
  CGSize v41;
  CGSize v42;
  CGRect v43;

  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", a3, a4, a5, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", a11, a12, a13, a14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", a7, a8, a9, a10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage size](self, "size");
  v23 = v22;
  v25 = v24;
  v26 = v24 + 1.0;
  -[UIImage scale](self, "scale");
  _UIGraphicsBeginImageContextWithOptions(0, 0, v23, v26, v27);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v29 = 0;
  else
    v29 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v30 = objc_retainAutorelease(v19);
  v31 = (CGColor *)objc_msgSend(v30, "CGColor");
  v41.width = 0.0;
  v41.height = 1.0;
  CGContextSetShadowWithColor(v29, v41, 0.0, v31);
  CGContextBeginTransparencyLayer(v29, 0);
  objc_msgSend(v20, "set");
  UIRectFillUsingOperation(1, 0.0, 0.0, v23, v25);
  -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v23, v25, 1.0);
  CGContextEndTransparencyLayer(v29);
  -[UIImage _bezeledImageWithShadowRed:green:blue:alpha:fillRed:green:blue:alpha:drawShadow:](self, "_bezeledImageWithShadowRed:green:blue:alpha:fillRed:green:blue:alpha:drawShadow:", 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextScaleCTM(v29, 1.0, -1.0);
  objc_msgSend(v32, "size");
  CGContextTranslateCTM(v29, 0.0, -v33);
  v34 = objc_retainAutorelease(v32);
  v35 = (CGImage *)objc_msgSend(v34, "CGImage");
  v43.origin.x = 0.0;
  v43.origin.y = 0.0;
  v43.size.width = v23;
  v43.size.height = v25;
  CGContextClipToMask(v29, v43, v35);
  objc_msgSend(v34, "size");
  CGContextTranslateCTM(v29, 0.0, v36);
  CGContextScaleCTM(v29, 1.0, -1.0);
  v37 = objc_retainAutorelease(v21);
  v38 = (CGColor *)objc_msgSend(v37, "CGColor");
  v42.width = 0.0;
  v42.height = 1.0;
  CGContextSetShadowWithColor(v29, v42, 0.0, v38);
  CGContextBeginTransparencyLayer(v29, 0);
  objc_msgSend(v20, "set");
  UIRectFillUsingOperation(1, 0.0, -1.0, v23, v26 + 1.0);
  -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", 23, 0.0, 0.0, v23, v25, 1.0);
  CGContextEndTransparencyLayer(v29);
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v39;
}

- (id)_imageScaledToProportion:(double)a3 interpolationQuality:(int)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD *ContextStack;
  CGContext *v13;
  void *v14;
  void *v15;

  -[UIImage size](self, "size");
  v8 = ceil(v7 * a3);
  v10 = ceil(v9 * a3);
  -[UIImage scale](self, "scale");
  _UIGraphicsBeginImageContextWithOptions(0, 0, v8, v10, v11);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v13 = 0;
  else
    v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSetInterpolationQuality(v13, (CGInterpolationQuality)a4);
  -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, v8, v10);
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v14, "imageWithRenderingMode:", -[UIImage renderingMode](self, "renderingMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_serializedData
{
  UIImage *v3;
  UIImage *v4;
  void *v5;

  if ((_UIIsKitImage(self) & 1) != 0 || (_UIIsSystemSymbolImage(self) & 1) != 0)
    v3 = self;
  else
    v3 = -[_UIImageSerializationWrapper initWithImage:]([_UIImageSerializationWrapper alloc], "initWithImage:", self);
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_imageByApplyingSymbolVariant:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id *v9;
  id v10;
  uint64_t v11;
  void *v12;
  UIImage *v13;
  UIImage *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  UIImage *v20;

  v4 = a3;
  if (!-[UIImage isSymbolImage](self, "isSymbolImage") || !v4)
    goto LABEL_12;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_12;
  }
  v6 = objc_msgSend(v4, "isUnspecified");

  if (v6)
  {
LABEL_12:
    v13 = self;
    goto LABEL_13;
  }
  if (_UIIsSystemSymbolImage(self))
  {
    _UIImageName(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _UIIsPrivateSystemSymbolImage(self);
    v9 = (id *)MEMORY[0x1E0D89798];
    if (!v8)
      v9 = (id *)MEMORY[0x1E0D89790];
    v10 = *v9;
    v11 = objc_msgSend(v4, "fillVariant");
    if (v11 == 2)
    {
      objc_msgSend(v10, "allKeysForObject:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v11 != 1)
      {
        v12 = 0;
        goto LABEL_21;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v12 && (objc_msgSend(v7, "isEqualToString:", v12) & 1) == 0)
    {
      -[UIImage variableValue](self, "variableValue");
      v18 = v17;
      -[UIImage configuration](self, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        +[UIImage _systemImageNamed:variableValue:withConfiguration:](UIImage, "_systemImageNamed:variableValue:withConfiguration:", v12, v19, v18);
      else
        +[UIImage systemImageNamed:variableValue:withConfiguration:](UIImage, "systemImageNamed:variableValue:withConfiguration:", v12, v19, v18);
      v15 = (UIImage *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
LABEL_21:
    v15 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v15 = 0;
LABEL_23:
  if (v15)
    v20 = v15;
  else
    v20 = self;
  v13 = v20;

LABEL_13:
  return v13;
}

+ (id)_ISImageDescriptorNameForUIApplicationIconFormat:(int)a3
{
  id *v3;

  if (a3 > 0x10)
    v3 = (id *)MEMORY[0x1E0D3A870];
  else
    v3 = (id *)qword_1E16CB0F8[a3];
  return *v3;
}

+ (id)_baseImageDescriptorForUIApplicationIconFormat:(int)a3
{
  void *v4;
  void *v5;

  +[UIImage _ISImageDescriptorNameForUIApplicationIconFormat:](UIImage, "_ISImageDescriptorNameForUIApplicationIconFormat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDrawBorder:", (a3 < 0x11) & (0x1C001u >> a3));

  return v5;
}

+ (id)_imageWithIcon:(void *)a3 descriptor:
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  objc_msgSend(v5, "prepareImageForDescriptor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "CGImage");
  objc_msgSend(v6, "scale");
  +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_applicationIconImageForBundleIdentifier:(id)a3 format:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  objc_msgSend(a1, "_applicationIconImageForBundleIdentifier:format:scale:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_applicationIconImageForBundleIdentifier:(id)a3 format:(int)a4 scale:(double)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  double v21;
  int v22;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AppIcon(bundleID=%@, format=%d, scale=%.1lf)"), v8, v6, *(_QWORD *)&a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__UIImage_UIApplicationIconPrivate___applicationIconImageForBundleIdentifier_format_scale___block_invoke;
  v17[3] = &unk_1E16CB018;
  v19 = v8;
  v20 = a1;
  v18 = v10;
  v22 = v6;
  v21 = a5;
  v11 = v8;
  v12 = v10;
  +[UIImageAsset _dynamicAssetNamed:generator:](UIImageAsset, "_dynamicAssetNamed:generator:", v9, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageConfiguration _unspecifiedConfiguration](UIImageConfiguration, "_unspecifiedConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageWithConfiguration:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __91__UIImage_UIApplicationIconPrivate___applicationIconImageForBundleIdentifier_format_scale___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceStyle") == 2)
  {
    objc_msgSend(v4, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == 3)
      v8 = 1;
    else
      v8 = 2;
  }
  else
  {

    v8 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 48), "_applicationIconImageForBundleIdentifier:format:scale:style:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), v8, *(double *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v9);
  }

  return v10;
}

+ (id)_applicationIconImageForBundleIdentifier:(id)a3 format:(int)a4 scale:(double)a5 style:(int64_t)a6
{
  uint64_t v8;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = *(_QWORD *)&a4;
  v10 = (objc_class *)MEMORY[0x1E0D3A820];
  v11 = a3;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithBundleIdentifier:", v11);

  objc_msgSend(a1, "_baseImageDescriptorForUIApplicationIconFormat:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAppearance:", a6 == 2);
  if (a5 > 0.0)
  {
    objc_msgSend(v13, "setScale:", a5);
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    objc_msgSend(v13, "setScale:");

  }
  +[UIImage _imageWithIcon:descriptor:]((uint64_t)UIImage, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (UIImage)actionsImage
{
  _QWORD *v2;
  void *v3;

  objc_opt_self();
  +[_UIImageSystemImageVisualStyle _iosVisualStyle]();
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[_UIImageSystemImageVisualStyle actionsImage](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

+ (UIImage)addImage
{
  _QWORD *v2;
  void *v3;

  objc_opt_self();
  +[_UIImageSystemImageVisualStyle _iosVisualStyle]();
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[_UIImageSystemImageVisualStyle addImage](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

+ (UIImage)removeImage
{
  _QWORD *v2;
  void *v3;

  objc_opt_self();
  +[_UIImageSystemImageVisualStyle _iosVisualStyle]();
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[_UIImageSystemImageVisualStyle removeImage](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

+ (UIImage)checkmarkImage
{
  _QWORD *v2;
  void *v3;

  objc_opt_self();
  +[_UIImageSystemImageVisualStyle _iosVisualStyle]();
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[_UIImageSystemImageVisualStyle checkmarkImage](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

+ (UIImage)strokedCheckmarkImage
{
  _QWORD *v2;
  void *v3;

  objc_opt_self();
  +[_UIImageSystemImageVisualStyle _iosVisualStyle]();
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[_UIImageSystemImageVisualStyle strokedCheckmarkImage](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (id)_imageByApplyingVariant:(unint64_t)a3 allowNone:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  void *v9;
  void (**v10)(void *, unint64_t);
  UIImage *v11;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  UIImage *v17;

  if (!a3 && !a4)
    return self;
  _UIImageName(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _UIImageVariantValueForName(v6);

  if ((a3 & ~v7) == 0)
    return self;
  _UIImageName(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
    goto LABEL_15;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __61__UIImage_UIImageVariant___imageByApplyingVariant_allowNone___block_invoke;
  v15 = &unk_1E16CB040;
  v16 = v9;
  v17 = self;
  v10 = (void (**)(void *, unint64_t))_Block_copy(&v12);
  v10[2](v10, a3);
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v10[2](v10, a3 & 0xFFFFFFFFFFFEFFFFLL);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v10[2](v10, a3 & 0xFFFFFFFFBFFFFFFFLL);
      v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v10[2](v10, a3 & 0xFFFFFFFFFFFFFFF1);
        v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v10[2](v10, a3 & 0xFFFFFFFFBFFEFFFFLL);
          v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            v10[2](v10, a3 & 0xFFFFFFFFFFFEFFF1);
            v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
            if (!v11)
            {
              v10[2](v10, a3 & 0xFFFFFFFFBFFFFFF1);
              v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
              if (!v11)
              {

LABEL_15:
                v11 = self;
                goto LABEL_16;
              }
            }
          }
        }
      }
    }
  }
  -[UIImage _configureImage:assumePreconfigured:](self, "_configureImage:assumePreconfigured:", v11, 1, v12, v13, v14, v15);

LABEL_16:
  return v11;
}

id __61__UIImage_UIImageVariant___imageByApplyingVariant_allowNone___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  _UIImageVariantName(*(void **)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _UIIsSystemSymbolImage(*(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v3, v5);
  else
    +[UIImage imageNamed:withConfiguration:](UIImage, "imageNamed:withConfiguration:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_systemImageNamed:(id)a3 variant:(unint64_t)a4
{
  void *v4;
  void *v5;

  _UIImageVariantName(a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_systemImageNamed:(id)a3 variant:(unint64_t)a4 withConfiguration:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  _UIImageVariantName(a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_systemImageNamed:(id)a3 shape:(int64_t)a4
{
  uint64_t v4;

  if ((unint64_t)(a4 - 1) > 2)
    v4 = 0;
  else
    v4 = qword_18667DC90[a4 - 1];
  return (id)objc_msgSend(a1, "_systemImageNamed:variant:", a3, v4);
}

+ (id)_systemImageNamed:(id)a3 shape:(int64_t)a4 fill:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;

  if ((unint64_t)(a4 - 1) > 2)
    v5 = 0;
  else
    v5 = qword_18667DC90[a4 - 1];
  if (a5 == 1)
    v6 = v5 | 0x40000000;
  else
    v6 = v5;
  return (id)objc_msgSend(a1, "_systemImageNamed:variant:", a3, v6);
}

+ (id)_systemImageNamed:(id)a3 shape:(int64_t)a4 fill:(int64_t)a5 withConfiguration:(id)a6
{
  uint64_t v6;
  uint64_t v7;

  if ((unint64_t)(a4 - 1) > 2)
    v6 = 0;
  else
    v6 = qword_18667DC90[a4 - 1];
  if (a5 == 1)
    v7 = v6 | 0x40000000;
  else
    v7 = v6;
  return (id)objc_msgSend(a1, "_systemImageNamed:variant:withConfiguration:", a3, v7, a6);
}

- (id)_applyBackdropViewSettings:(id)a3 allowImageResizing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  UIImage *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  int v34;
  double v35;
  int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  UIImage *v42;
  int v43;
  float v44;
  float v45;
  double v46;
  float v47;
  float v48;
  double v49;
  _BOOL4 v50;
  void *v51;
  _QWORD *ContextStack;
  CGContext *v53;
  void *v54;
  UIImage *v55;
  CGImage *v56;
  _QWORD *v57;
  CGContext *v58;
  double v59;
  double v60;
  double v61;
  BOOL v62;
  double v63;
  int v64;
  uint32_t v65;
  double v66;
  double v67;
  _QWORD *v68;
  CGContext *v69;
  _QWORD *v70;
  CGContext *v71;
  uint64_t v72;
  double v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v83;
  float64x2_t *v84;
  float64x2_t v85;
  int32x2_t v86;
  int32x2_t v87;
  int32x2_t v88;
  int32x2_t v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  double v94;
  void *v95;
  double v96;
  void *v97;
  double v98;
  void *v99;
  void *v100;
  int v101;
  CGFloat v102;
  CGFloat v103;
  double v104;
  double v105;
  _QWORD *v106;
  CGContext *v107;
  CGImage *v108;
  void *v109;
  id v110;
  CGImage *v111;
  CGImage *v112;
  double v113;
  CGFloat v114;
  CGFloat v115;
  void *v116;
  id v117;
  CGImage *v118;
  void *v119;
  void *v120;
  double v121;
  void *v122;
  id v123;
  CGImage *v124;
  void *v125;
  CGBitmapInfo v126;
  uint64_t v127;
  vImage_Buffer v128;
  vImage_Buffer dest;
  vImage_Buffer src;
  vImage_Buffer v131;
  float64x2_t v132;
  __int128 v133;
  uint64_t v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  uint64_t v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;

  v4 = a4;
  v139 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[UIImage size](self, "size");
  if (v7 < 1.0 || (-[UIImage size](self, "size"), v8 < 1.0))
  {
    -[UIImage size](self, "size");
    v10 = v9;
    -[UIImage size](self, "size");
    NSLog(CFSTR("*** _applyBackdropViewSettings error: invalid size: (%.2f x %.2f). Both dimensions must be >= 1: %@"), v10, v11, self);
LABEL_4:
    v12 = 0;
    goto LABEL_5;
  }
  v14 = objc_retainAutorelease(self);
  if (!-[UIImage CGImage](v14, "CGImage"))
  {
    NSLog(CFSTR("*** _applyBackdropViewSettings error: image must be backed by a CGImage: %@"), v14);
    goto LABEL_4;
  }
  objc_msgSend(v6, "grayscaleTintMaskImage");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v6, "grayscaleTintMaskImage");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "CGImage");

    if (!v18)
    {
      objc_msgSend(v6, "grayscaleTintMaskImage");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("*** _applyBackdropViewSettings error: settings.grayscaleTintMaskImage must be backed by a CGImage: %@"), v54);
LABEL_30:

      goto LABEL_4;
    }
  }
  objc_msgSend(v6, "colorTintMaskImage");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_msgSend(v6, "colorTintMaskImage");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "CGImage");

    if (!v22)
    {
      objc_msgSend(v6, "colorTintMaskImage");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("*** _applyBackdropViewSettings error: settings.colorTintMaskImage must be backed by a CGImage: %@"), v54);
      goto LABEL_30;
    }
  }
  objc_msgSend(v6, "filterMaskImage");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    objc_msgSend(v6, "filterMaskImage");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = objc_msgSend(v25, "CGImage");

    if (!v26)
    {
      objc_msgSend(v6, "filterMaskImage");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("*** _applyBackdropViewSettings error: settings.filterMaskImage must be backed by a CGImage: %@"), v54);
      goto LABEL_30;
    }
  }
  objc_msgSend(v6, "blurRadius");
  v28 = v27;
  objc_msgSend(v6, "saturationDeltaFactor");
  v30 = v29;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "scale");
  v33 = v32;

  v34 = objc_msgSend(v6, "usesBackdropEffectView");
  v35 = fabs(v30 + -1.0);
  if (v28 > 0.00000011920929)
    v36 = v34;
  else
    v36 = 0;
  if ((v36 & v4) != 0)
    v37 = 0.25;
  else
    v37 = 1.0;
  -[UIImage size](v14, "size");
  v39 = v38;
  -[UIImage size](v14, "size");
  v41 = v40;
  v42 = v14;
  v43 = objc_msgSend(v6, "usesBackdropEffectView");
  v44 = v39 * v37;
  v45 = ceilf(v44);
  v46 = v45;
  v47 = v41 * v37;
  v48 = ceilf(v47);
  v49 = v48;
  v50 = v35 > 0.00000011920929 || v28 > 0.00000011920929;
  v51 = v42;
  if (v43)
  {
    v51 = v42;
    if (v50)
    {
      _UIGraphicsBeginImageContextWithOptions(0, 0, v45, v48, v33);
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1)
        v53 = 0;
      else
        v53 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      CGContextScaleCTM(v53, 1.0, -1.0);
      CGContextTranslateCTM(v53, 0.0, -v49);
      v55 = objc_retainAutorelease(v42);
      v56 = -[UIImage CGImage](v55, "CGImage");
      v140.origin.x = 0.0;
      v140.origin.y = 0.0;
      v140.size.width = v45;
      v140.size.height = v48;
      CGContextDrawImage(v53, v140, v56);
      src.data = CGBitmapContextGetData(v53);
      src.width = CGBitmapContextGetWidth(v53);
      src.height = CGBitmapContextGetHeight(v53);
      src.rowBytes = CGBitmapContextGetBytesPerRow(v53);
      _UIGraphicsBeginImageContextWithOptions(0, 0, v45, v48, v33);
      v57 = GetContextStack(0);
      if (*(int *)v57 < 1)
        v58 = 0;
      else
        v58 = (CGContext *)v57[3 * (*(_DWORD *)v57 - 1) + 1];
      dest.data = CGBitmapContextGetData(v58);
      dest.width = CGBitmapContextGetWidth(v58);
      dest.height = CGBitmapContextGetHeight(v58);
      dest.rowBytes = CGBitmapContextGetBytesPerRow(v58);
      if (v28 > 0.00000011920929)
      {
        objc_msgSend(v6, "blurRadius");
        v60 = v33 * (v59 * 0.25);
        v61 = v60 * 3.0 * 2.50662827 * 0.25 + 0.5;
        v62 = v60 < 2.0;
        v63 = 4.25994241;
        if (!v62)
          v63 = v61;
        v64 = vcvtmd_u64_f64(v63);
        v65 = v64 | 1;
        if (v4)
        {
          vImageBoxConvolve_ARGB8888(&src, &dest, 0, 0, 0, v64 | 1, v64 | 1, 0, 8u);
          vImageBoxConvolve_ARGB8888(&dest, &src, 0, 0, 0, v65, v65, 0, 8u);
          vImageBoxConvolve_ARGB8888(&src, &dest, 0, 0, 0, v65, v65, 0, 8u);
        }
        else
        {
          v66 = ceilf(v45 * 0.25);
          v67 = ceilf(v48 * 0.25);
          _UIGraphicsBeginImageContextWithOptions(0, 0, v66, v67, v33);
          v68 = GetContextStack(0);
          if (*(int *)v68 < 1)
            v69 = 0;
          else
            v69 = (CGContext *)v68[3 * (*(_DWORD *)v68 - 1) + 1];
          v131.data = CGBitmapContextGetData(v69);
          v131.width = CGBitmapContextGetWidth(v69);
          v131.height = CGBitmapContextGetHeight(v69);
          v131.rowBytes = CGBitmapContextGetBytesPerRow(v69);
          _UIGraphicsBeginImageContextWithOptions(0, 0, v66, v67, v33);
          v70 = GetContextStack(0);
          if (*(int *)v70 < 1)
            v71 = 0;
          else
            v71 = (CGContext *)v70[3 * (*(_DWORD *)v70 - 1) + 1];
          v128.data = CGBitmapContextGetData(v71);
          v128.width = CGBitmapContextGetWidth(v71);
          v128.height = CGBitmapContextGetHeight(v71);
          v128.rowBytes = CGBitmapContextGetBytesPerRow(v71);
          vImageScale_ARGB8888(&src, &v131, 0, 0);
          vImageBoxConvolve_ARGB8888(&v131, &v128, 0, 0, 0, v65, v65, 0, 8u);
          vImageBoxConvolve_ARGB8888(&v128, &v131, 0, 0, 0, v65, v65, 0, 8u);
          vImageBoxConvolve_ARGB8888(&v131, &v128, 0, 0, 0, v65, v65, 0, 8u);
          vImageScale_ARGB8888(&v128, &dest, 0, 0);
          UIGraphicsEndImageContext();
          UIGraphicsEndImageContext();
        }
      }
      if (v35 > 0.00000011920929)
      {
        v72 = objc_msgSend(v6, "saturationDeltaFactor");
        v74 = vmulq_n_f64((float64x2_t)xmmword_18667DCC0, v73);
        v75.f64[0] = 0.7152;
        *(_QWORD *)&v75.f64[0] = *(_OWORD *)&vsubq_f64(v75, v74);
        *(double *)&v131.data = v73 * 0.9278 + 0.0722;
        *(double *)&v131.height = 0.0722 - v73 * 0.0722;
        v133 = *(unint64_t *)&v75.f64[0];
        v75.f64[1] = vaddq_f64(v74, (float64x2_t)vdupq_n_s64(0x3FE6E2EB1C432CA5uLL)).f64[1];
        v131.width = v131.height;
        v132 = v75;
        v76.f64[0] = 0.2126;
        v131.rowBytes = 0;
        v77 = vmulq_n_f64((float64x2_t)xmmword_18667DCD0, v73);
        *(_QWORD *)&v78 = *(_OWORD *)&vsubq_f64(v76, v77);
        v134 = v78;
        *((_QWORD *)&v78 + 1) = *(_QWORD *)&vaddq_f64(v77, (float64x2_t)vdupq_n_s64(0x3FCB367A0F9096BCuLL)).f64[1];
        v135 = v78;
        v136 = 0u;
        v137 = 0u;
        v138 = 0x3FF0000000000000;
        MEMORY[0x1E0C80A78](v72);
        v83 = 0;
        v84 = (float64x2_t *)&v131;
        v85 = (float64x2_t)vdupq_n_s64(0x4070000000000000uLL);
        do
        {
          v86 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmulq_f64(v84[3], v85))));
          v87 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmulq_f64(v84[2], v85))));
          v88 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmulq_f64(v84[1], v85))));
          v89 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmulq_f64(*v84, v85))));
          *(int8x16_t *)((char *)&v127 + v83) = vqtbl4q_s8(*(int8x16x4_t *)(&v79 - 1), (int8x16_t)xmmword_18667DCE0);
          v84 += 4;
          v83 += 16;
        }
        while (v83 != 32);
        if (v28 > 0.00000011920929)
        {
          vImageMatrixMultiply_ARGB8888(&dest, &src, (const int16_t *)&v127, 256, 0, 0, 0);
          UIGraphicsEndImageContext();
          _UIGraphicsGetImageFromCurrentImageContext(0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_54:
          UIGraphicsEndImageContext();
          goto LABEL_55;
        }
        vImageMatrixMultiply_ARGB8888(&src, &dest, (const int16_t *)&v127, 256, 0, 0, 0);
      }
      _UIGraphicsGetImageFromCurrentImageContext(0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      UIGraphicsEndImageContext();
      goto LABEL_54;
    }
  }
LABEL_55:
  +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", objc_msgSend(v6, "style", v128.data, v128.height, v128.width, v128.rowBytes, dest.data, dest.height, dest.width, dest.rowBytes, src.data, src.height, src.width, src.rowBytes, v131.data, v131.height,
      v131.width,
      v131.rowBytes));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setValuesFromModel:", v6);
  +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", objc_msgSend(v6, "style"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v91, "requiresColorStatistics"))
  {
    v134 = 0;
    v132 = 0u;
    v133 = 0u;
    memset(&v131, 0, sizeof(v131));
    if (v51)
    {
      objc_msgSend(v51, "_calculateStatistics");
      v92 = *(double *)&v131.rowBytes;
    }
    else
    {
      v92 = 0.0;
    }
    objc_msgSend(v90, "colorSettings");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setAverageHue:", v92);

    v94 = v132.f64[0];
    objc_msgSend(v90, "colorSettings");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setAverageSaturation:", v94);

    v96 = v132.f64[1];
    objc_msgSend(v90, "colorSettings");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setAverageBrightness:", v96);

    v98 = *((double *)&v133 + 1);
    objc_msgSend(v90, "colorSettings");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setContrast:", v98);

  }
  objc_msgSend(v91, "computeOutputSettingsUsingModel:", v90);
  objc_msgSend(v6, "grayscaleTintMaskImage");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (v100 || (objc_msgSend(v6, "colorTintMaskImage"), (v100 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v6, "filterMaskImage");
    v125 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v125)
    {
      v126 = CGImageGetBitmapInfo(-[UIImage CGImage](objc_retainAutorelease(v42), "CGImage")) & 0x1F;
      v101 = v126 - 5 < 2 || v126 == 0;
      goto LABEL_64;
    }
  }
  v101 = 0;
LABEL_64:
  v102 = 0.0;
  v103 = 0.0;
  if (!v4)
  {
    v102 = *MEMORY[0x1E0C9D538];
    v103 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIImage size](v42, "size");
    v46 = v104;
    v49 = v105;
  }
  _UIGraphicsBeginImageContextWithOptions(v101, 0, v46, v49, v33);
  v106 = GetContextStack(0);
  if (*(int *)v106 < 1)
    v107 = 0;
  else
    v107 = (CGContext *)v106[3 * (*(_DWORD *)v106 - 1) + 1];
  CGContextScaleCTM(v107, 1.0, -1.0);
  CGContextTranslateCTM(v107, 0.0, -v49);
  v108 = -[UIImage CGImage](objc_retainAutorelease(v42), "CGImage");
  v141.origin.x = v102;
  v141.origin.y = v103;
  v141.size.width = v46;
  v141.size.height = v49;
  CGContextDrawImage(v107, v141, v108);
  if (objc_msgSend(v91, "usesBackdropEffectView"))
  {
    CGContextSaveGState(v107);
    objc_msgSend(v6, "filterMaskImage");
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (v109)
    {
      objc_msgSend(v6, "filterMaskImage");
      v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v111 = (CGImage *)objc_msgSend(v110, "CGImage");
      v142.origin.x = v102;
      v142.origin.y = v103;
      v142.size.width = v46;
      v142.size.height = v49;
      CGContextClipToMask(v107, v142, v111);

    }
    v112 = (CGImage *)objc_msgSend(objc_retainAutorelease(v51), "CGImage");
    v143.origin.x = v102;
    v143.origin.y = v103;
    v143.size.width = v46;
    v143.size.height = v49;
    CGContextDrawImage(v107, v143, v112);
    CGContextRestoreGState(v107);
  }
  if (objc_msgSend(v91, "usesGrayscaleTintView"))
  {
    CGContextSaveGState(v107);
    objc_msgSend(v91, "grayscaleTintAlpha");
    v114 = v113;
    objc_msgSend(v91, "grayscaleTintLevel");
    CGContextSetGrayFillColor(v107, v115, v114);
    objc_msgSend(v6, "grayscaleTintMaskImage");
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    if (v116)
    {
      objc_msgSend(v6, "grayscaleTintMaskImage");
      v117 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v118 = (CGImage *)objc_msgSend(v117, "CGImage");
      v144.origin.x = v102;
      v144.origin.y = v103;
      v144.size.width = v46;
      v144.size.height = v49;
      CGContextClipToMask(v107, v144, v118);

    }
    v145.origin.x = v102;
    v145.origin.y = v103;
    v145.size.width = v46;
    v145.size.height = v49;
    CGContextFillRect(v107, v145);
    CGContextRestoreGState(v107);
  }
  if (objc_msgSend(v91, "usesColorTintView"))
  {
    objc_msgSend(v91, "colorTint");
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    if (v119)
    {
      CGContextSaveGState(v107);
      v131.data = 0;
      src.data = 0;
      dest.data = 0;
      v128.data = 0;
      objc_msgSend(v91, "colorTint");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "getRed:green:blue:alpha:", &v131, &src, &dest, &v128);

      objc_msgSend(v91, "colorTintAlpha");
      *(double *)&v128.data = v121 * *(double *)&v128.data;
      CGContextSetRGBFillColor(v107, *(CGFloat *)&v131.data, *(CGFloat *)&src.data, *(CGFloat *)&dest.data, *(CGFloat *)&v128.data);
      objc_msgSend(v6, "colorTintMaskImage");
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      if (v122)
      {
        objc_msgSend(v6, "colorTintMaskImage");
        v123 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v124 = (CGImage *)objc_msgSend(v123, "CGImage");
        v146.origin.x = v102;
        v146.origin.y = v103;
        v146.size.width = v46;
        v146.size.height = v49;
        CGContextClipToMask(v107, v146, v124);

      }
      v147.origin.x = v102;
      v147.origin.y = v103;
      v147.size.width = v46;
      v147.size.height = v49;
      CGContextFillRect(v107, v147);
      CGContextRestoreGState(v107);
    }
  }
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

LABEL_5:
  return v12;
}

- (id)_applyBackdropViewSettings:(id)a3
{
  return -[UIImage _applyBackdropViewSettings:allowImageResizing:](self, "_applyBackdropViewSettings:allowImageResizing:", a3, 0);
}

- (id)_applyBackdropViewSettings:(id)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5
{
  return -[UIImage _applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:](self, "_applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:", a3, a4, a5, 0);
}

- (id)_applyBackdropViewSettings:(id)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5 allowImageResizing:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  UIImage *v12;
  UIImage *v13;

  v6 = a6;
  v10 = a3;
  v11 = v10;
  if (a4 || a5)
  {
    if (!a4)
    {
      objc_msgSend(v10, "setUsesGrayscaleTintView:", 0);
      objc_msgSend(v11, "setUsesColorTintView:", 0);
    }
    if (!a5)
    {
      objc_msgSend(v11, "setBlurRadius:", 0.0);
      objc_msgSend(v11, "setSaturationDeltaFactor:", 1.0);
    }
    -[UIImage _applyBackdropViewSettings:allowImageResizing:](self, "_applyBackdropViewSettings:allowImageResizing:", v11, v6);
    v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = self;
  }
  v13 = v12;

  return v13;
}

- (id)_applyBackdropViewStyle:(int64_t)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  void *v10;

  v5 = a5;
  v6 = a4;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage _applyBackdropViewStyle:includeTints:includeBlur:graphicsQuality:](self, "_applyBackdropViewStyle:includeTints:includeBlur:graphicsQuality:", a3, v6, v5, objc_msgSend(v9, "_graphicsQuality"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_applyBackdropViewStyle:(int64_t)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5 graphicsQuality:(int64_t)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v10;
  void *v11;

  v6 = a5;
  v7 = a4;
  +[UIDevice currentDevice](UIDevice, "currentDevice", a3, a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage _applyBackdropViewStyle:includeTints:includeBlur:graphicsQuality:allowImageResizing:](self, "_applyBackdropViewStyle:includeTints:includeBlur:graphicsQuality:allowImageResizing:", a3, v7, v6, objc_msgSend(v10, "_graphicsQuality"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_applyBackdropViewStyle:(int64_t)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5 graphicsQuality:(int64_t)a6 allowImageResizing:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  UIImage *v11;
  void *v12;

  v7 = a7;
  v8 = a5;
  v9 = a4;
  if (a4 || a5)
  {
    +[_UIBackdropViewSettings settingsForPrivateStyle:graphicsQuality:](_UIBackdropViewSettings, "settingsForPrivateStyle:graphicsQuality:", a3, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage _applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:](self, "_applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:", v12, v9, v8, v7);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = self;
  }
  return v11;
}

+ (id)_tintedImageForSize:(CGSize)a3 withTint:(id)a4 effectsImage:(id)a5 maskImage:(id)a6 style:(int)a7
{
  void *v7;
  CGFloat height;
  CGFloat width;
  CGFloat v13;
  CGFloat v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int *ContextStack;

  v7 = 0;
  if (a3.width > 0.0)
  {
    height = a3.height;
    if (a3.height > 0.0)
    {
      width = a3.width;
      v13 = *MEMORY[0x1E0C9D538];
      v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v15 = a6;
      v16 = a5;
      v17 = a4;
      _UIGraphicsBeginImageContextWithOptions(0, 0, width, height, 0.0);
      _UIImagePressedTintColor(v17, a7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "set");
      UIRectFillUsingOperation(1, v13, v14, width, height);
      objc_msgSend(v16, "drawInRect:", v13, v14, width, height);

      objc_msgSend(v15, "drawInRect:blendMode:alpha:", 22, v13, v14, width, height, 1.0);
      _UIGraphicsGetImageFromCurrentImageContext(0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ContextStack = (int *)GetContextStack(0);
      PopContextFromStack(ContextStack);

    }
  }
  return v7;
}

+ (id)_tintedImageForSize:(CGSize)a3 withTint:(id)a4 maskImage:(id)a5 effectsImage:(id)a6 style:(int)a7
{
  void *v7;
  CGFloat height;
  CGFloat width;
  CGFloat v13;
  CGFloat v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int *ContextStack;

  v7 = 0;
  if (a3.width > 0.0)
  {
    height = a3.height;
    if (a3.height > 0.0)
    {
      width = a3.width;
      v13 = *MEMORY[0x1E0C9D538];
      v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v15 = a6;
      v16 = a5;
      v17 = a4;
      _UIGraphicsBeginImageContextWithOptions(0, 0, width, height, 0.0);
      _UIImagePressedTintColor(v17, a7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "set");
      UIRectFillUsingOperation(1, v13, v14, width, height);
      objc_msgSend(v16, "drawInRect:blendMode:alpha:", 22, v13, v14, width, height, 1.0);

      objc_msgSend(v15, "drawInRect:", v13, v14, width, height);
      _UIGraphicsGetImageFromCurrentImageContext(0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ContextStack = (int *)GetContextStack(0);
      PopContextFromStack(ContextStack);

    }
  }
  return v7;
}

+ (id)_tintedImageForSize:(CGSize)a3 withTint:(id)a4 maskImage:(id)a5 effectsImage:(id)a6 style:(int)a7 edgeInsets:(UIEdgeInsets)a8
{
  void *v8;
  CGFloat height;
  double left;
  double top;
  CGFloat width;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  id v20;
  id v21;
  id v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  int *ContextStack;

  v8 = 0;
  if (a3.width > 0.0)
  {
    height = a3.height;
    if (a3.height > 0.0)
    {
      left = a8.left;
      top = a8.top;
      width = a3.width;
      v16 = *MEMORY[0x1E0C9D538];
      v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v18 = a3.width - (a8.left + a8.right);
      v19 = a3.height - (a8.top + a8.bottom);
      v20 = a6;
      v21 = a5;
      v22 = a4;
      _UIGraphicsBeginImageContextWithOptions(0, 0, v18, v19, 0.0);
      v23 = v16 - left;
      v24 = v17 - top;
      _UIImagePressedTintColor(v22, a7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "set");
      UIRectFillUsingOperation(1, v23, v24, width, height);
      objc_msgSend(v21, "drawInRect:blendMode:alpha:", 22, v23, v24, width, height, 1.0);

      objc_msgSend(v20, "drawInRect:", v23, v24, width, height);
      _UIGraphicsGetImageFromCurrentImageContext(0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ContextStack = (int *)GetContextStack(0);
      PopContextFromStack(ContextStack);

    }
  }
  return v8;
}

+ (CGSize)_legibilityImageSizeForSize:(CGSize)a3 style:(int64_t)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = +[_UILegibilitySettings sharedInstanceForStyle:](_UILegibilitySettings, "sharedInstanceForStyle:", a4);
  objc_msgSend(v6, "imageOutset");
  v8 = width + v7;
  objc_msgSend(v6, "imageOutset");
  v10 = height + v9;
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (id)_imageForLegibilityStyle:(int64_t)a3
{
  double v5;
  double v6;

  -[UIImage size](self, "size");
  if (v5 >= 1.0 && (-[UIImage size](self, "size"), v6 >= 1.0))
    return -[UIImage _imageForLegibilitySettings:strength:](self, "_imageForLegibilitySettings:strength:", +[_UILegibilitySettings sharedInstanceForStyle:](_UILegibilitySettings, "sharedInstanceForStyle:", a3), 1.5);
  else
    return self;
}

- (id)_imageForLegibilitySettings:(id)a3 strength:(double)a4
{
  return -[UIImage _imageForLegibilitySettings:strength:alphaOnly:](self, "_imageForLegibilitySettings:strength:alphaOnly:", a3, 0, a4);
}

- (id)_imageForLegibilitySettings:(id)a3 strength:(double)a4 alphaOnly:(BOOL)a5
{
  _BOOL4 v5;
  UIImage *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v22[9];
  BOOL v23;

  v5 = a5;
  v8 = self;
  -[UIImage size](self, "size");
  if (v9 >= 1.0)
  {
    -[UIImage size](v8, "size");
    if (v10 >= 1.0)
    {
      v11 = objc_msgSend(a3, "style");
      if (a4 != 0.0)
      {
        if (v11)
        {
          -[UIImage size](v8, "size");
          v13 = v12;
          objc_msgSend(a3, "imageOutset");
          v15 = v13 + v14;
          -[UIImage size](v8, "size");
          v17 = v16;
          objc_msgSend(a3, "imageOutset");
          v19 = v17 + v18;
          -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __73__UIImage__UILegibility___imageForLegibilitySettings_strength_alphaOnly___block_invoke;
          v22[3] = &unk_1E16CB308;
          v22[4] = v8;
          v22[5] = a3;
          *(double *)&v22[6] = a4;
          *(double *)&v22[7] = v15;
          *(double *)&v22[8] = v19;
          v23 = v5;
          return _UIGraphicsDrawIntoImageContextWithMoreOptions(0, v5, v22, v15, v19, v20);
        }
      }
    }
  }
  return v8;
}

uint64_t __73__UIImage__UILegibility___imageForLegibilitySettings_strength_alphaOnly___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drawImageForLegibilitySettings:strength:size:alphaOnly:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_drawImageForLegibilityStyle:(int64_t)a3 size:(CGSize)a4
{
  -[UIImage _drawImageForLegibilitySettings:strength:size:](self, "_drawImageForLegibilitySettings:strength:size:", +[_UILegibilitySettings sharedInstanceForStyle:](_UILegibilitySettings, "sharedInstanceForStyle:", a3), 1.5, a4.width, a4.height);
}

- (void)_drawImageForLegibilitySettings:(id)a3 strength:(double)a4 size:(CGSize)a5
{
  -[UIImage _drawImageForLegibilitySettings:strength:size:alphaOnly:](self, "_drawImageForLegibilitySettings:strength:size:alphaOnly:", a3, 0, a4, a5.width, a5.height);
}

- (void)_drawImageForLegibilitySettings:(id)a3 strength:(double)a4 size:(CGSize)a5 alphaOnly:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  uint64_t v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  UIImage *v27;
  double v28;
  double v29;
  float v30;
  double v31;
  double i;
  double v33;
  _QWORD v34[8];
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  uint64_t v49;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v12 = objc_msgSend(a3, "style");
  if (a4 != 0.0 && v12 != 0)
  {
    -[UIImage size](self, "size");
    v15 = v14;
    -[UIImage size](self, "size");
    v17 = v16;
    -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
    v19 = v18;
    v20 = UIRectCenteredIntegralRectScale(0.0, 0.0, v15, v17, 0.0, 0.0, width, height, v18);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v27 = self;
    if (!v6)
      v27 = -[UIImage _flatImageWithColor:](self, "_flatImageWithColor:", objc_msgSend(a3, "shadowColor"));
    v44 = 0;
    v45 = &v44;
    v46 = 0x3052000000;
    v47 = __Block_byref_object_copy__112;
    v48 = __Block_byref_object_dispose__112;
    v49 = 0;
    -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
    v29 = v28;
    *(float *)&v28 = width * 0.25;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __82__UIImage__UILegibility___drawImageForLegibilitySettings_strength_size_alphaOnly___block_invoke;
    v34[3] = &unk_1E16CB358;
    v30 = height * 0.25;
    v35 = ceilf(*(float *)&v28);
    v36 = ceilf(v30);
    v37 = 0x3FD0000000000000;
    v34[4] = self;
    v34[5] = a3;
    v38 = v19;
    v39 = v20;
    v40 = v22;
    v41 = v24;
    v42 = v26;
    v43 = v6;
    v34[6] = v27;
    v34[7] = &v44;
    _UIGraphicsDrawIntoImageContextWithMoreOptions(0, v6, v34, v35, v36, v29);
    objc_msgSend(a3, "shadowAlpha");
    for (i = v31 * a4; i > 0.00000011920929; i = i + -1.0)
    {
      if (i + 0.00000011920929 <= 1.0)
        v33 = i;
      else
        v33 = 1.0;
      objc_msgSend((id)v45[5], "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, width, height, v33);
    }
    _Block_object_dispose(&v44, 8);
  }
}

id __82__UIImage__UILegibility___drawImageForLegibilitySettings_strength_size_alphaOnly___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  _QWORD *ContextStack;
  CGContext *v16;
  double Height;
  double v18;
  CGImage *v19;
  void *Data;
  size_t Width;
  size_t v22;
  size_t BytesPerRow;
  int v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  _QWORD v30[11];
  char v31;
  CGRect v32;
  CGRect v33;

  v2 = *(double *)(a1 + 64);
  v3 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "size");
  *(float *)&v4 = v4 * *(double *)(a1 + 80);
  v5 = ceilf(*(float *)&v4);
  objc_msgSend(*(id *)(a1 + 32), "size");
  v7 = v6 * *(double *)(a1 + 80);
  v8 = UIRectCenteredIntegralRectScale(0.0, 0.0, v5, ceilf(v7), 0.0, 0.0, v2, v3, *(double *)(a1 + 88));
  v10 = v9;
  v12 = v11;
  v14 = v13;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v16 = 0;
  else
    v16 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSetFillColorWithColor(v16, (CGColorRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "shadowColor"), "CGColor"));
  Height = CGRectGetHeight(*(CGRect *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 40), "minFillHeight");
  if (Height >= v18)
  {
    objc_msgSend(*(id *)(a1 + 40), "shadowRadius");
    CGContextScaleCTM(v16, 1.0, -1.0);
    CGContextTranslateCTM(v16, 0.0, -*(double *)(a1 + 72));
    v19 = (CGImage *)objc_msgSend(*(id *)(a1 + 48), "CGImage");
    v33.origin.x = v8;
    v33.origin.y = v10;
    v33.size.width = v12;
    v33.size.height = v14;
    CGContextDrawImage(v16, v33, v19);
  }
  else
  {
    v32.origin.x = v8;
    v32.origin.y = v10;
    v32.size.width = v12;
    v32.size.height = v14;
    CGContextFillRect(v16, v32);
  }
  Data = CGBitmapContextGetData(v16);
  Width = CGBitmapContextGetWidth(v16);
  v22 = CGBitmapContextGetHeight(v16);
  BytesPerRow = CGBitmapContextGetBytesPerRow(v16);
  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v24 = *(unsigned __int8 *)(a1 + 128);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __82__UIImage__UILegibility___drawImageForLegibilitySettings_strength_size_alphaOnly___block_invoke_2;
  v30[3] = &unk_1E16CB330;
  v25 = *(_QWORD *)(a1 + 40);
  v26 = *(double *)(a1 + 72);
  v30[6] = *(_QWORD *)(a1 + 80);
  v31 = v24;
  v30[7] = Data;
  v30[8] = v22;
  v30[9] = Width;
  v30[10] = BytesPerRow;
  v27 = *(_QWORD *)(a1 + 56);
  v30[4] = v25;
  v30[5] = v27;
  return _UIGraphicsDrawIntoImageContextWithMoreOptions(0, v24, v30, *(double *)(a1 + 64), v26, v28);
}

id __82__UIImage__UILegibility___drawImageForLegibilitySettings_strength_size_alphaOnly___block_invoke_2(uint64_t a1)
{
  _QWORD *ContextStack;
  CGContext *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  const vImage_Buffer *v11;
  uint32_t v12;
  id result;
  vImage_Buffer dest;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v3 = 0;
  else
    v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  dest.data = CGBitmapContextGetData(v3);
  dest.width = CGBitmapContextGetWidth(v3);
  dest.height = CGBitmapContextGetHeight(v3);
  dest.rowBytes = CGBitmapContextGetBytesPerRow(v3);
  objc_msgSend(*(id *)(a1 + 32), "shadowRadius");
  v5 = v4 * *(double *)(a1 + 48);
  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v7 = v5 * v6;
  v8 = v7 * 3.0 * 2.50662827 * 0.25 + 0.5;
  v9 = v7 < 2.0;
  v10 = 4.25994241;
  if (!v9)
    v10 = v8;
  v11 = (const vImage_Buffer *)(a1 + 56);
  v12 = vcvtmd_u64_f64(v10) | 1;
  if (*(_BYTE *)(a1 + 88))
    vImageTentConvolve_Planar8(v11, &dest, 0, 0, 0, v12, v12, 0, 8u);
  else
    vImageTentConvolve_ARGB8888(v11, &dest, 0, 0, 0, v12, v12, 0, 8u);
  result = _UIGraphicsGetImageFromCurrentImageContext(0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_imageWithBrightnessModifiedForLegibilityStyle:(int64_t)a3
{
  double v5;
  double v6;
  UIImage *v7;
  void *v8;
  UIColor *v9;
  id v10;
  CGBitmapInfo v11;
  uint64_t v12;
  double v13;
  double v14;
  _QWORD v16[6];

  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v6 = v5;
  v7 = self;
  if (a3 != 2)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIWhitePointAdjust"));
    v9 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.92, 1.0);
    objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithCGColor:", -[UIColor CGColor](v9, "CGColor")), CFSTR("inputColor"));
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithImage:", self);
    objc_msgSend(v8, "setValue:forKey:", v10, *MEMORY[0x1E0C9E1F8]);
    v7 = +[UIImage imageWithCIImage:scale:orientation:](UIImage, "imageWithCIImage:scale:orientation:", objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0C9E298]), 0, v6);
  }
  if (v7)
  {
    if (-[UIImage CGImage](self, "CGImage"))
    {
      v11 = CGImageGetBitmapInfo(-[UIImage CGImage](self, "CGImage")) & 0x1F;
      v12 = v11 - 5 < 2 || v11 == 0;
    }
    else
    {
      v12 = 0;
    }
    -[UIImage size](self, "size");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__UIImage__UILegibility___imageWithBrightnessModifiedForLegibilityStyle___block_invoke;
    v16[3] = &unk_1E16C3CF0;
    v16[4] = v7;
    v16[5] = self;
    return _UIGraphicsDrawIntoImageContextWithMoreOptions(v12, 0, v16, v13, v14, v6);
  }
  return self;
}

uint64_t __73__UIImage__UILegibility___imageWithBrightnessModifiedForLegibilityStyle___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "size");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "size");
  return objc_msgSend(v2, "drawInRect:", 0.0, 0.0, v4, v5);
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  if (qword_1ECD7F510 != -1)
    dispatch_once(&qword_1ECD7F510, &__block_literal_global_405);
  return (NSArray *)(id)qword_1ECD7F508;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", CFSTR("com.apple.uikit.image"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToType:", v10))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v7, 0);
    objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishDecoding");

  }
  else
  {
    v13 = v9;
    if (qword_1ECD7F510 != -1)
      dispatch_once(&qword_1ECD7F510, &__block_literal_global_405);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = (id)_MergedGlobals_1169;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          if ((objc_msgSend(v13, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20) & 1) != 0)
          {

            v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:", v7);
            goto LABEL_15;
          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v15)
          continue;
        break;
      }
    }

    v12 = 0;
  }
LABEL_15:
  v18 = v12;

  return v18;
}

- (UIImage)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  UIImage *v10;
  void *v11;
  UIImage *v12;

  v8 = a4;
  v9 = a3;
  v10 = -[UIImage init](self, "init");
  objc_msgSend((id)objc_opt_class(), "objectWithItemProviderData:typeIdentifier:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  return v12;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("com.apple.uikit.image");
  objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.uikit.image")))
  {
    +[_UIInterprocessKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](_UIInterprocessKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqualToString:", v9);

    if (v10)
    {
      UIImagePNGRepresentation(self);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "isEqualToString:", v11);

      if (v12)
      {
        _UIImageJPEGRepresentation(self, 0, 0.8);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "isEqualToString:", v13);

        if (!v14)
        {
          (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
          goto LABEL_10;
        }
        UIImageHEICRepresentation(self);
        v8 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v15 = (void *)v8;
  (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, v8, 0);

LABEL_10:
  return 0;
}

- (BOOL)isFromStatusBarImageProvider
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

@end
