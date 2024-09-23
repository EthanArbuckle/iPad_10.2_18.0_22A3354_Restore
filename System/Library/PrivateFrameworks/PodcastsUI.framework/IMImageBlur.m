@implementation IMImageBlur

- (IMImageBlur)initWithStyle:(int64_t)a3 radius:(double)a4
{
  IMImageBlur *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMImageBlur;
  result = -[IMImageBlur init](&v7, sel_init);
  if (result)
  {
    result->_style = a3;
    result->_radius = a4;
  }
  return result;
}

- (id)modificationCacheKey
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[IMImageBlur hasModifications](self, "hasModifications"))
  {
LABEL_10:
    v10 = 0;
    return v10;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  v6 = -[IMImageBlur style](self, "style");
  if (!v6)
  {
    v8 = CFSTR("none");
    goto LABEL_6;
  }
  v7 = v6;
  if (v6 != 1)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "defaultCategory");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v7;
      _os_log_impl(&dword_1DA478000, v11, OS_LOG_TYPE_ERROR, "Invalid or unimplemented blurStyle encountered (%d)", buf, 8u);
    }

    goto LABEL_10;
  }
  v8 = CFSTR("light");
LABEL_6:
  -[IMImageBlur radius](self, "radius");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("blur{%@,radius-%f}@%dx"), v8, v9, (int)v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (BOOL)hasModifications
{
  int64_t v3;
  double v4;

  v3 = -[IMImageBlur style](self, "style");
  if (v3)
  {
    -[IMImageBlur radius](self, "radius");
    LOBYTE(v3) = v4 > 0.00000011920929;
  }
  return v3;
}

- (id)_blurredImageFromSourceImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMImageBlur _backdropBlurSettings](self, "_backdropBlurSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "_applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:", v5, 1, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_backdropBlurSettings
{
  id v3;

  if (-[IMImageBlur hasModifications](self, "hasModifications"))
  {
    v3 = -[IMImageBlur _newBackdropSettings](self, "_newBackdropSettings");
    -[IMImageBlur radius](self, "radius");
    objc_msgSend(v3, "setBlurRadius:");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_newBackdropSettings
{
  int64_t style;
  NSObject *v5;
  int64_t v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  style = self->_style;
  if (style)
  {
    if (style == 1)
    {
      -[IMImageBlur _lightBackdropBlurSettings](self, "_lightBackdropBlurSettings");
      return (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0D7F1C0], "defaultCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = self->_style;
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_ERROR, "Invalid or unimplemented blurStyle encountered (%d)", (uint8_t *)v7, 8u);
    }

  }
  return 0;
}

- (id)_lightBackdropBlurSettings
{
  return (id)objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:", 2020);
}

- (int64_t)style
{
  return self->_style;
}

- (double)radius
{
  return self->_radius;
}

@end
