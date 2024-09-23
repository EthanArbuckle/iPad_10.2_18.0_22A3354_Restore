@implementation PFPosterEditConfiguration

- (PFPosterEditConfiguration)init
{
  PFPosterEditConfiguration *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFPosterEditConfiguration;
  result = -[PFPosterEditConfiguration init](&v4, sel_init);
  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  result->_normalizedVisibleFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  result->_normalizedVisibleFrame.size = v3;
  return result;
}

- (id)analyticsPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v16[0] = CFSTR("perspective_zoom_enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFPosterEditConfiguration isPerspectiveZoomEnabled](self, "isPerspectiveZoomEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v16[1] = CFSTR("depth_enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFPosterEditConfiguration isDepthEnabled](self, "isDepthEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  v16[2] = CFSTR("landscape_depth_enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFPosterEditConfiguration isLandscapeDepthEnabled](self, "isLandscapeDepthEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v6;
  v16[3] = CFSTR("depth_available");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFPosterEditConfiguration isDepthAvailable](self, "isDepthAvailable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  v16[4] = CFSTR("settling_effect_enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFPosterEditConfiguration isSettlingEffectEnabled](self, "isSettlingEffectEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v8;
  v16[5] = CFSTR("settling_effect_available");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFPosterEditConfiguration isSettlingEffectAvailable](self, "isSettlingEffectAvailable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithDictionary:", v10);

  -[PFPosterEditConfiguration style](self, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PFPosterEditConfiguration style](self, "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "kind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("style_kind"));

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PFPosterEditConfiguration *v4;
  CGPoint origin;
  CGPoint v6;

  v4 = +[PFPosterEditConfiguration allocWithZone:](PFPosterEditConfiguration, "allocWithZone:", a3);
  objc_storeStrong((id *)&v4->_style, self->_style);
  origin = self->_normalizedVisibleFrame.origin;
  v4->_normalizedVisibleFrame.size = self->_normalizedVisibleFrame.size;
  v4->_normalizedVisibleFrame.origin = origin;
  v6 = self->_normalizedLandscapeVisibleFrame.origin;
  v4->_normalizedLandscapeVisibleFrame.size = self->_normalizedLandscapeVisibleFrame.size;
  v4->_normalizedLandscapeVisibleFrame.origin = v6;
  v4->_isPerspectiveZoomEnabled = self->_isPerspectiveZoomEnabled;
  v4->_isDepthEnabled = self->_isDepthEnabled;
  v4->_isDepthAvailable = self->_isDepthAvailable;
  v4->_isLandscapeDepthEnabled = self->_isLandscapeDepthEnabled;
  v4->_isSettlingEffectEnabled = self->_isSettlingEffectEnabled;
  v4->_isSettlingEffectAvailable = self->_isSettlingEffectAvailable;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", 2, CFSTR("version"));
  -[PFPosterEditConfiguration style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("style"));

  -[PFPosterEditConfiguration normalizedVisibleFrame](self, "normalizedVisibleFrame");
  objc_msgSend(v5, "encodeRect:forKey:", CFSTR("visibleFrame"));
  -[PFPosterEditConfiguration normalizedLandscapeVisibleFrame](self, "normalizedLandscapeVisibleFrame");
  objc_msgSend(v5, "encodeRect:forKey:", CFSTR("landscapeVisibleFrame"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isPerspectiveZoomEnabled](self, "isPerspectiveZoomEnabled"), CFSTR("isPerspectiveZoomEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isDepthEnabled](self, "isDepthEnabled"), CFSTR("isDepthEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isDepthAvailable](self, "isDepthAvailable"), CFSTR("isDepthAvailable"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isLandscapeDepthEnabled](self, "isLandscapeDepthEnabled"), CFSTR("isLandscapeDepthEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isSettlingEffectEnabled](self, "isSettlingEffectEnabled"), CFSTR("isSettlingEffectEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isSettlingEffectAvailable](self, "isSettlingEffectAvailable"), CFSTR("isSettlingEffectAvailable"));

}

- (PFPosterEditConfiguration)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  char v18;
  __int16 v20[8];
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PFPosterEditConfiguration;
  v5 = -[PFPosterEditConfiguration init](&v21, sel_init);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("version")))
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  else
    v6 = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("style"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v7;

  if (v6)
  {
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("visibleFrame"));
    *((_QWORD *)v5 + 3) = v9;
    *((_QWORD *)v5 + 4) = v10;
    *((_QWORD *)v5 + 5) = v11;
    *((_QWORD *)v5 + 6) = v12;
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("landscapeVisibleFrame"));
    *((_QWORD *)v5 + 7) = v13;
    *((_QWORD *)v5 + 8) = v14;
    *((_QWORD *)v5 + 9) = v15;
    *((_QWORD *)v5 + 10) = v16;
  }
  else
  {
    v17 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v5 + 24) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v5 + 40) = v17;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v20[0] = 0;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Decoded PFPosterEditConfiguration contains legacy visible frame, ignored.", (uint8_t *)v20, 2u);
    }
  }
  v5[8] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPerspectiveZoomEnabled"));
  v5[9] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDepthEnabled"));
  v5[10] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDepthAvailable"));
  v5[11] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLandscapeDepthEnabled"));
  if (v6 < 2)
  {
    v18 = 0;
    v5[12] = 0;
  }
  else
  {
    v5[12] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSettlingEffectEnabled"));
    v18 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSettlingEffectAvailable"));
  }
  v5[13] = v18;

  return (PFPosterEditConfiguration *)v5;
}

- (NSString)description
{
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v21;
  void *v22;
  id v23;

  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterEditConfiguration style](self, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterEditConfiguration normalizedVisibleFrame](self, "normalizedVisibleFrame");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), v4, v5, v6, v7);
  -[PFPosterEditConfiguration normalizedLandscapeVisibleFrame](self, "normalizedLandscapeVisibleFrame");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), v9, v10, v11, v12);
  if (-[PFPosterEditConfiguration isPerspectiveZoomEnabled](self, "isPerspectiveZoomEnabled"))
    v14 = CFSTR("Y");
  else
    v14 = CFSTR("N");
  v15 = CFSTR("A");
  if (-[PFPosterEditConfiguration isDepthAvailable](self, "isDepthAvailable"))
    v16 = CFSTR("A");
  else
    v16 = CFSTR("NA");
  if (-[PFPosterEditConfiguration isDepthEnabled](self, "isDepthEnabled"))
    v17 = CFSTR("Y");
  else
    v17 = CFSTR("N");
  if (!-[PFPosterEditConfiguration isSettlingEffectAvailable](self, "isSettlingEffectAvailable"))
    v15 = CFSTR("NA");
  if (-[PFPosterEditConfiguration isSettlingEffectEnabled](self, "isSettlingEffectEnabled"))
    v18 = CFSTR("Y");
  else
    v18 = CFSTR("N");
  v19 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("<%@ %p; style: %@; norm. visible frame: %@; land. norm. visible frame: %@; zoom: %@; depth: %@|%@; settle: %@|%@>"),
                  v22,
                  self,
                  v21,
                  v8,
                  v13,
                  v14,
                  v16,
                  v17,
                  v15,
                  v18);

  return (NSString *)v19;
}

- (PFParallaxLayerStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (CGRect)normalizedVisibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedVisibleFrame.origin.x;
  y = self->_normalizedVisibleFrame.origin.y;
  width = self->_normalizedVisibleFrame.size.width;
  height = self->_normalizedVisibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedVisibleFrame:(CGRect)a3
{
  self->_normalizedVisibleFrame = a3;
}

- (CGRect)normalizedLandscapeVisibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedLandscapeVisibleFrame.origin.x;
  y = self->_normalizedLandscapeVisibleFrame.origin.y;
  width = self->_normalizedLandscapeVisibleFrame.size.width;
  height = self->_normalizedLandscapeVisibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedLandscapeVisibleFrame:(CGRect)a3
{
  self->_normalizedLandscapeVisibleFrame = a3;
}

- (BOOL)isPerspectiveZoomEnabled
{
  return self->_isPerspectiveZoomEnabled;
}

- (void)setIsPerspectiveZoomEnabled:(BOOL)a3
{
  self->_isPerspectiveZoomEnabled = a3;
}

- (BOOL)isDepthEnabled
{
  return self->_isDepthEnabled;
}

- (void)setIsDepthEnabled:(BOOL)a3
{
  self->_isDepthEnabled = a3;
}

- (BOOL)isDepthAvailable
{
  return self->_isDepthAvailable;
}

- (void)setIsDepthAvailable:(BOOL)a3
{
  self->_isDepthAvailable = a3;
}

- (BOOL)isLandscapeDepthEnabled
{
  return self->_isLandscapeDepthEnabled;
}

- (void)setIsLandscapeDepthEnabled:(BOOL)a3
{
  self->_isLandscapeDepthEnabled = a3;
}

- (BOOL)isSettlingEffectEnabled
{
  return self->_isSettlingEffectEnabled;
}

- (void)setIsSettlingEffectEnabled:(BOOL)a3
{
  self->_isSettlingEffectEnabled = a3;
}

- (BOOL)isSettlingEffectAvailable
{
  return self->_isSettlingEffectAvailable;
}

- (void)setIsSettlingEffectAvailable:(BOOL)a3
{
  self->_isSettlingEffectAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
