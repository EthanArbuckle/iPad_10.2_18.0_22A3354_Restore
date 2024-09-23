@implementation UIKBShape

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->m_frame.origin.x;
  y = self->m_frame.origin.y;
  width = self->m_frame.size.width;
  height = self->m_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)paddedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->m_paddedFrame.origin.x;
  y = self->m_paddedFrame.origin.y;
  width = self->m_paddedFrame.size.width;
  height = self->m_paddedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)concaveCorner
{
  return self->m_concaveCorner;
}

- (CGSize)concaveCornerOffset
{
  double width;
  double height;
  CGSize result;

  width = self->m_concaveCornerOffset.width;
  height = self->m_concaveCornerOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBShape *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(UIKBShape);
  -[UIKBShape geometry](self, "geometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[UIKBShape setGeometry:](v4, "setGeometry:", v6);

  -[UIKBShape frame](self, "frame");
  -[UIKBShape setFrame:](v4, "setFrame:");
  -[UIKBShape paddedFrame](self, "paddedFrame");
  -[UIKBShape setPaddedFrame:](v4, "setPaddedFrame:");
  -[UIKBShape originalShape](self, "originalShape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBShape setOriginalShape:](v4, "setOriginalShape:", v7);

  -[UIKBShape setConcaveCorner:](v4, "setConcaveCorner:", -[UIKBShape concaveCorner](self, "concaveCorner"));
  -[UIKBShape concaveCornerOffset](self, "concaveCornerOffset");
  -[UIKBShape setConcaveCornerOffset:](v4, "setConcaveCornerOffset:");
  return v4;
}

- (void)setPaddedFrame:(CGRect)a3
{
  self->m_paddedFrame = a3;
}

- (void)setFrame:(CGRect)a3
{
  self->m_frame = a3;
}

- (UIKBShape)init
{
  UIKBShape *v2;
  UIKBShape *v3;
  CGPoint v4;
  CGSize v5;
  uint64_t v6;
  UIKBGeometry *m_geometry;
  UIKBShape *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKBShape;
  v2 = -[UIKBShape init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (CGPoint)*MEMORY[0x1E0C9D648];
    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v2->m_frame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v2->m_frame.size = v5;
    v2->m_paddedFrame.origin = v4;
    v2->m_paddedFrame.size = v5;
    v6 = UIKBNextUID_counter++;
    v2->m_uid = v6;
    m_geometry = v2->m_geometry;
    v2->m_geometry = 0;

    v3->m_concaveCorner = 0;
    v3->m_concaveCornerOffset = (CGSize)*MEMORY[0x1E0C9D820];
    v8 = v3;
  }

  return v3;
}

- (UIKBGeometry)geometry
{
  return self->m_geometry;
}

- (void)setOriginalShape:(id)a3
{
  objc_storeStrong((id *)&self->m_originalShape, a3);
}

- (UIKBShape)initWithGeometry:(id)a3 frame:(CGRect)a4 paddedFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v15;
  UIKBShape *v16;
  UIKBShape *v17;
  uint64_t v18;
  UIKBShape *v19;
  objc_super v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v15 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UIKBShape;
  v16 = -[UIKBShape init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->m_geometry, a3);
    v17->m_frame.origin.x = v12;
    v17->m_frame.origin.y = v11;
    v17->m_frame.size.width = v10;
    v17->m_frame.size.height = v9;
    v17->m_paddedFrame.origin.x = x;
    v17->m_paddedFrame.origin.y = y;
    v17->m_paddedFrame.size.width = width;
    v17->m_paddedFrame.size.height = height;
    v18 = UIKBNextUID_counter++;
    v17->m_uid = v18;
    v17->m_concaveCorner = 0;
    v17->m_concaveCornerOffset = (CGSize)*MEMORY[0x1E0C9D820];
    v19 = v17;
  }

  return v17;
}

- (BOOL)shouldUseGeometry
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  _BOOL4 v7;
  _BOOL4 v8;
  CGRect v10;
  CGRect v11;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v10.origin.y = v4;
  v10.size.width = v5;
  v10.size.height = v6;
  v7 = CGRectEqualToRect(self->m_frame, v10);
  v11.origin.x = v3;
  v11.origin.y = v4;
  v11.size.width = v5;
  v11.size.height = v6;
  v8 = v7 & CGRectEqualToRect(self->m_paddedFrame, v11);
  return self->m_geometry && v8;
}

- (void)setScaled:(BOOL)a3
{
  self->m_scaled = a3;
}

- (BOOL)scaled
{
  return self->m_scaled;
}

- (void)setGeometry:(id)a3
{
  objc_storeStrong((id *)&self->m_geometry, a3);
}

- (void)setConcaveCornerOffset:(CGSize)a3
{
  self->m_concaveCornerOffset = a3;
}

- (void)setConcaveCorner:(unint64_t)a3
{
  self->m_concaveCorner = a3;
}

- (void)addRectFrom:(id)a3 mergeActionFactors:(id)a4 inRightToLeft:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double v27;
  double v28;
  int v29;
  double v30;
  UIKBShape *v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int v38;
  double v39;
  double v40;
  int v41;
  UIKBShape *v42;
  double v43;
  CGFloat v44;
  int v45;
  int v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  UIKBShape *v51;

  v5 = a5;
  v51 = (UIKBShape *)a3;
  v8 = a4;
  if (self != v51)
  {
    -[UIKBShape frame](self, "frame");
    v11 = v10 + v9 * 0.5;
    -[UIKBShape frame](v51, "frame");
    v14 = vabdd_f64(v11, v13 + v12 * 0.5);
    -[UIKBShape frame](self, "frame");
    v17 = v16 + v15 * 0.5;
    -[UIKBShape frame](v51, "frame");
    v20 = vabdd_f64(v17, v19 + v18 * 0.5);
    v21 = 0.0;
    v22 = v14 < 1.0;
    v23 = 0.0;
    v24 = 0.0;
    if (v22)
    {
      v25 = COERCE_DOUBLE(objc_msgSend(v8, "w"));
      objc_msgSend(v8, "w");
      if (v26 == 2)
      {
        v24 = v25 * 0.01;
      }
      else
      {
        -[UIKBShape frame](v51, "frame");
        v24 = v25 / v27;
      }
      v28 = COERCE_DOUBLE(objc_msgSend(v8, "x"));
      objc_msgSend(v8, "x");
      if (v29 == 2)
      {
        v30 = v28 * 0.01;
        v31 = v51;
      }
      else
      {
        -[UIKBShape frame](v51, "frame");
        v31 = v51;
        v30 = v28 / v32;
      }
      -[UIKBShape frame](v31, "frame");
      if (v33 >= self->m_frame.origin.x)
        v34 = v30;
      else
        v34 = -v30;
      v35 = 0.0;
      if (v5)
        v35 = v24;
      v23 = v34 - v35;
    }
    v22 = v20 < 1.0;
    v36 = 0.0;
    if (v22)
    {
      v37 = COERCE_DOUBLE(objc_msgSend(v8, "h"));
      objc_msgSend(v8, "h");
      if (v38 == 2)
      {
        v36 = v37 * 0.01;
      }
      else
      {
        -[UIKBShape frame](v51, "frame");
        v36 = v37 / v39;
      }
      v40 = COERCE_DOUBLE(objc_msgSend(v8, "y"));
      objc_msgSend(v8, "y");
      if (v41 == 2)
      {
        v21 = v40 * 0.01;
        v42 = v51;
      }
      else
      {
        -[UIKBShape frame](v51, "frame");
        v42 = v51;
        v21 = v40 / v43;
      }
      -[UIKBShape frame](v42, "frame");
      if (v44 < self->m_frame.origin.y)
        v21 = -v21;
    }
    -[UIKBShape addRectFrom:widthFraction:heightFraction:adjustOriginXFactor:adjustOriginYFactor:absoluteOriginFactors:](self, "addRectFrom:widthFraction:heightFraction:adjustOriginXFactor:adjustOriginYFactor:absoluteOriginFactors:", v51, 1, v24, v36, v23, v21);
    objc_msgSend(v8, "w");
    if (v45 == 100 || (objc_msgSend(v8, "h"), v46 == 100))
    {
      -[UIKBShape frame](v51, "frame");
      self->m_frame.size.width = v47;
      self->m_frame.size.height = v48;
      -[UIKBShape paddedFrame](v51, "paddedFrame");
      self->m_paddedFrame.size.width = v49;
      self->m_paddedFrame.size.height = v50;
    }
  }

}

- (void)addRectFrom:(id)a3 widthFraction:(double)a4 heightFraction:(double)a5 adjustOriginXFactor:(double)a6 adjustOriginYFactor:(double)a7 absoluteOriginFactors:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  v8 = a8;
  v14 = a3;
  if (v14)
  {
    v25 = v14;
    objc_msgSend(v14, "frame");
    v16 = ceil(v15 * a4);
    objc_msgSend(v25, "frame");
    v18 = ceil(v17 * a5);
    v19 = self->m_frame.size.height + v18;
    self->m_frame.size.width = self->m_frame.size.width + v16;
    self->m_frame.size.height = v19;
    v20 = v18 + self->m_paddedFrame.size.height;
    self->m_paddedFrame.size.width = v16 + self->m_paddedFrame.size.width;
    self->m_paddedFrame.size.height = v20;
    if (a6 != 0.0)
    {
      if (v8)
      {
        objc_msgSend(v25, "frame");
        v16 = v21;
      }
      v22 = floor(v16 * a6);
      self->m_frame.origin.x = self->m_frame.origin.x + v22;
      self->m_paddedFrame.origin.x = v22 + self->m_paddedFrame.origin.x;
    }
    v14 = v25;
    if (a7 != 0.0)
    {
      if (v8)
      {
        objc_msgSend(v25, "frame");
        v14 = v25;
        v18 = v23;
      }
      v24 = floor(v18 * a7);
      self->m_frame.origin.y = self->m_frame.origin.y + v24;
      self->m_paddedFrame.origin.y = v24 + self->m_paddedFrame.origin.y;
    }
  }

}

- (UIKBShape)originalShape
{
  return self->m_originalShape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_originalShape, 0);
  objc_storeStrong((id *)&self->m_geometry, 0);
}

+ (id)shape
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (UIKBShape)initWithGeometry:(id)a3 frame:(CGRect)a4 paddedFrame:(CGRect)a5 concaveCorner:(unint64_t)a6 concaveCornerOffset:(CGSize)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v18;
  UIKBShape *v19;
  UIKBShape *v20;
  uint64_t v21;
  UIKBShape *v22;
  objc_super v24;
  CGFloat v25;
  CGFloat v26;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a4.size.height;
  v13 = a4.size.width;
  v14 = a4.origin.y;
  v15 = a4.origin.x;
  v18 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UIKBShape;
  v19 = -[UIKBShape init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->m_geometry, a3);
    v20->m_frame.origin.x = v15;
    v20->m_frame.origin.y = v14;
    v20->m_frame.size.width = v13;
    v20->m_frame.size.height = v12;
    v20->m_paddedFrame.origin.x = x;
    v20->m_paddedFrame.origin.y = y;
    v20->m_paddedFrame.size.width = width;
    v20->m_paddedFrame.size.height = height;
    v21 = UIKBNextUID_counter++;
    v20->m_uid = v21;
    v20->m_concaveCorner = a6;
    v20->m_concaveCornerOffset.width = v25;
    v20->m_concaveCornerOffset.height = v26;
    v22 = v20;
  }

  return v20;
}

- (UIKBShape)initWithCoder:(id)a3
{
  id v4;
  UIKBGeometry *v5;
  UIKBGeometry *m_geometry;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  unint64_t v22;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("geometry"));
  v5 = (UIKBGeometry *)objc_claimAutoreleasedReturnValue();
  m_geometry = self->m_geometry;
  self->m_geometry = v5;

  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("frame.x"));
  v8 = v7;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("frame.y"));
  v10 = v9;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("frame.w"));
  v12 = v11;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("frame.h"));
  self->m_frame.origin.x = v8;
  self->m_frame.origin.y = v10;
  self->m_frame.size.width = v12;
  self->m_frame.size.height = v13;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("paddedFrame.x"));
  v15 = v14;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("paddedFrame.y"));
  v17 = v16;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("paddedFrame.w"));
  v19 = v18;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("paddedFrame.h"));
  v21 = v20;

  self->m_paddedFrame.origin.x = v15;
  self->m_paddedFrame.origin.y = v17;
  self->m_paddedFrame.size.width = v19;
  self->m_paddedFrame.size.height = v21;
  v22 = UIKBNextUID_counter++;
  self->m_uid = v22;
  self->m_concaveCorner = 0;
  self->m_concaveCornerOffset = (CGSize)*MEMORY[0x1E0C9D820];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  UIKBGeometry *m_geometry;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v13;

  m_geometry = self->m_geometry;
  v13 = a3;
  objc_msgSend(v13, "encodeObject:forKey:", m_geometry, CFSTR("geometry"));
  x = self->m_frame.origin.x;
  *(float *)&x = x;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("frame.x"), x);
  y = self->m_frame.origin.y;
  *(float *)&y = y;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("frame.y"), y);
  width = self->m_frame.size.width;
  *(float *)&width = width;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("frame.w"), width);
  height = self->m_frame.size.height;
  *(float *)&height = height;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("frame.h"), height);
  v9 = self->m_paddedFrame.origin.x;
  *(float *)&v9 = v9;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("paddedFrame.x"), v9);
  v10 = self->m_paddedFrame.origin.y;
  *(float *)&v10 = v10;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("paddedFrame.y"), v10);
  v11 = self->m_paddedFrame.size.width;
  *(float *)&v11 = v11;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("paddedFrame.w"), v11);
  v12 = self->m_paddedFrame.size.height;
  *(float *)&v12 = v12;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("paddedFrame.h"), v12);

}

- (void)makeLikeOther:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  id v27;
  CGRect v28;
  CGRect v29;

  v27 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v27;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v27;
    -[UIKBShape geometry](self, "geometry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v6, "geometry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");
      -[UIKBShape setGeometry:](self, "setGeometry:", v9);

      objc_msgSend(v6, "geometry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");
      -[UIKBShape geometry](self, "geometry");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setName:", v12);

    }
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v28.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
    v28.origin.y = v15;
    v28.size.width = v16;
    v28.size.height = v17;
    if (!CGRectEqualToRect(self->m_frame, v28))
    {
      objc_msgSend(v6, "frame");
      self->m_frame.origin.x = v18;
      self->m_frame.origin.y = v19;
      self->m_frame.size.width = v20;
      self->m_frame.size.height = v21;
    }
    v29.origin.x = v14;
    v29.origin.y = v15;
    v29.size.width = v16;
    v29.size.height = v17;
    if (!CGRectEqualToRect(self->m_paddedFrame, v29))
    {
      objc_msgSend(v6, "paddedFrame");
      self->m_paddedFrame.origin.x = v22;
      self->m_paddedFrame.origin.y = v23;
      self->m_paddedFrame.size.width = v24;
      self->m_paddedFrame.size.height = v25;
    }
    objc_msgSend(v6, "originalShape");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBShape setOriginalShape:](self, "setOriginalShape:", v26);

    v5 = v27;
  }

}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = -[UIKBShape uid](self, "uid");
  v3 = 9 * ((v2 + ~(v2 << 15)) ^ ((v2 + ~(v2 << 15)) >> 10));
  v4 = (v3 ^ (v3 >> 6)) + ~((v3 ^ (v3 >> 6)) << 11);
  return v4 ^ (v4 >> 16);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  _BOOL4 v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  _BOOL4 v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  char v40;
  void *v41;
  void *v42;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[UIKBShape frame](self, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, "frame");
    v46.origin.x = v14;
    v46.origin.y = v15;
    v46.size.width = v16;
    v46.size.height = v17;
    v44.origin.x = v7;
    v44.origin.y = v9;
    v44.size.width = v11;
    v44.size.height = v13;
    v18 = CGRectEqualToRect(v44, v46);
    -[UIKBShape paddedFrame](self, "paddedFrame");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(v5, "paddedFrame");
    v47.origin.x = v27;
    v47.origin.y = v28;
    v47.size.width = v29;
    v47.size.height = v30;
    v45.origin.x = v20;
    v45.origin.y = v22;
    v45.size.width = v24;
    v45.size.height = v26;
    v31 = CGRectEqualToRect(v45, v47);
    v32 = -[UIKBShape concaveCorner](self, "concaveCorner");
    v33 = objc_msgSend(v5, "concaveCorner");
    -[UIKBShape concaveCornerOffset](self, "concaveCornerOffset");
    v35 = v34;
    v37 = v36;
    objc_msgSend(v5, "concaveCornerOffset");
    v40 = 0;
    if (v18 && v31 && v32 == v33 && v35 == v38 && v37 == v39)
    {
      -[UIKBShape geometry](self, "geometry");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "geometry");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v41, "isEqual:", v42);

    }
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (void)setConcaveCornerSize:(CGSize)a3
{
  self->m_concaveCornerOffset = a3;
}

- (BOOL)isEmpty
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  BOOL v7;
  BOOL v8;
  UIKBGeometry *m_geometry;
  void *v10;
  char v11;
  CGRect v13;
  CGRect v14;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v13.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v13.origin.y = v4;
  v13.size.width = v5;
  v13.size.height = v6;
  v7 = CGRectEqualToRect(self->m_frame, v13);
  v14.origin.x = v3;
  v14.origin.y = v4;
  v14.size.width = v5;
  v14.size.height = v6;
  v8 = CGRectEqualToRect(self->m_paddedFrame, v14);
  m_geometry = self->m_geometry;
  if (m_geometry)
  {
    +[UIKBGeometry geometry](UIKBGeometry, "geometry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[UIKBGeometry isEqual:](m_geometry, "isEqual:", v10);

  }
  else
  {
    v11 = 1;
  }
  return (v7 && v8) & v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  objc_super v14;
  CGSize v15;
  CGRect v16;
  CGRect v17;

  -[UIKBShape geometry](self, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBShape geometry](self, "geometry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIKBShape;
    -[UIKBShape description](&v14, sel_description);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBShape frame](self, "frame");
    NSStringFromCGRect(v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBShape paddedFrame](self, "paddedFrame");
    NSStringFromCGRect(v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" - %@_%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UIKBShape concaveCorner](self, "concaveCorner"))
    {
      v11 = -[UIKBShape concaveCorner](self, "concaveCorner");
      -[UIKBShape concaveCornerOffset](self, "concaveCornerOffset");
      NSStringFromCGSize(v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("_concaveCorner=%lux_concaveCornerOffset=%@"), v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
    }
    return v10;
  }
}

- (void)addRectFrom:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGRect v17;
  CGRect v18;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "frame");
    v17.origin.x = v5;
    v17.origin.y = v6;
    v17.size.width = v7;
    v17.size.height = v8;
    self->m_frame = CGRectUnion(self->m_frame, v17);
    objc_msgSend(v4, "paddedFrame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v18.origin.x = v10;
    v18.origin.y = v12;
    v18.size.width = v14;
    v18.size.height = v16;
    self->m_paddedFrame = CGRectUnion(self->m_paddedFrame, v18);
  }
}

- (void)addRectFrom:(id)a3 widthFraction:(double)a4 heightFraction:(double)a5 adjustOriginXFactor:(double)a6 adjustOriginYFactor:(double)a7
{
  -[UIKBShape addRectFrom:widthFraction:heightFraction:adjustOriginXFactor:adjustOriginYFactor:absoluteOriginFactors:](self, "addRectFrom:widthFraction:heightFraction:adjustOriginXFactor:adjustOriginYFactor:absoluteOriginFactors:", a3, 0, a4, a5, a6, a7);
}

- (void)scaleWidth:(double)a3
{
  double width;
  double v4;

  width = self->m_paddedFrame.size.width;
  v4 = width * a3;
  self->m_frame.size.width = self->m_frame.size.width - v4;
  self->m_paddedFrame.size.width = width - v4;
}

- (CGRect)_scaleRect:(CGRect)a3 inYAxis:(BOOL)a4
{
  _BOOL4 v4;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double height;
  CGRect result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
    v8 = a3.origin.y;
  else
    v8 = a3.origin.x;
  if (a4)
    v9 = a3.size.height;
  else
    v9 = a3.size.width;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferencesActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rivenSizeFactor:", v8);
  v13 = v12;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferencesActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rivenSizeFactor:", v9);
  v17 = v16;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preferencesActions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rivenSizeFactor:", 1.0);
  v21 = v20;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "preferencesActions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rivenSizeFactor:", 1.0);
  v25 = v9 * v24;
  v26 = v25 <= 150.0;
  v27 = v8 * v21 - v13 + v25 - v17;
  if (v4 && v26)
    v27 = 0.0;
  v28 = v17 + round(v27);
  if (v4)
    v29 = x;
  else
    v29 = v13;
  if (v4)
    y = v13;
  else
    width = v28;
  if (v4)
    v30 = v28;
  else
    v30 = height;

  v31 = v29;
  v32 = y;
  v33 = width;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)scaleIfNeeded:(double)a3 onlyYAxis:(BOOL)a4
{
  BOOL v7;
  double x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;

  if (!self->m_scaled)
  {
    v7 = a3 == 0.0 || a4;
    x = self->m_frame.origin.x;
    if (!v7)
    {
      x = x - a3;
      self->m_frame.origin.x = x;
      self->m_paddedFrame.origin.x = self->m_paddedFrame.origin.x - a3;
    }
    -[UIKBShape _scaleRect:inYAxis:](self, "_scaleRect:inYAxis:", 1, x, self->m_frame.origin.y, self->m_frame.size.width, self->m_frame.size.height);
    self->m_frame.origin.x = v9;
    self->m_frame.origin.y = v10;
    self->m_frame.size.width = v11;
    self->m_frame.size.height = v12;
    -[UIKBShape _scaleRect:inYAxis:](self, "_scaleRect:inYAxis:", 1, self->m_paddedFrame.origin.x, self->m_paddedFrame.origin.y, self->m_paddedFrame.size.width, self->m_paddedFrame.size.height);
    self->m_paddedFrame.origin.x = v13;
    self->m_paddedFrame.origin.y = v14;
    self->m_paddedFrame.size.width = v15;
    self->m_paddedFrame.size.height = v16;
    if (!a4)
    {
      -[UIKBShape _scaleRect:inYAxis:](self, "_scaleRect:inYAxis:", 0, self->m_frame.origin.x, self->m_frame.origin.y, self->m_frame.size.width, self->m_frame.size.height);
      self->m_frame.origin.x = v17;
      self->m_frame.origin.y = v18;
      self->m_frame.size.width = v19;
      self->m_frame.size.height = v20;
      -[UIKBShape _scaleRect:inYAxis:](self, "_scaleRect:inYAxis:", 0, self->m_paddedFrame.origin.x, self->m_paddedFrame.origin.y, self->m_paddedFrame.size.width, self->m_paddedFrame.size.height);
      self->m_paddedFrame.origin.x = v21;
      self->m_paddedFrame.origin.y = v22;
      self->m_paddedFrame.size.width = v23;
      self->m_paddedFrame.size.height = v24;
      if (!v7)
      {
        self->m_frame.origin.x = self->m_frame.origin.x + a3;
        self->m_paddedFrame.origin.x = v21 + a3;
      }
    }
    self->m_scaled = 1;
  }
}

+ (id)shapeByCombining:(id)a3 withShape:(id)a4
{
  id v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double height;
  double width;
  double y;
  double x;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "frame");
  v44.origin.x = v15;
  v44.origin.y = v16;
  v44.size.width = v17;
  v44.size.height = v18;
  v40.origin.x = v8;
  v40.origin.y = v10;
  v40.size.width = v12;
  v40.size.height = v14;
  v41 = CGRectUnion(v40, v44);
  y = v41.origin.y;
  x = v41.origin.x;
  height = v41.size.height;
  width = v41.size.width;
  objc_msgSend(v6, "paddedFrame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  objc_msgSend(v5, "paddedFrame");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v42.origin.x = v20;
  v42.origin.y = v22;
  v42.size.width = v24;
  v42.size.height = v26;
  v45.origin.x = v28;
  v45.origin.y = v30;
  v45.size.width = v32;
  v45.size.height = v34;
  v43 = CGRectUnion(v42, v45);
  return -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, x, y, width, height, v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
}

+ (id)shapeByResizingShape:(id)a3 byAmount:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(v6, "frame");
  v23 = v7;
  v9 = v8;
  objc_msgSend(v6, "frame");
  v11 = v10 - width;
  objc_msgSend(v6, "frame");
  v13 = v12 - height;
  objc_msgSend(v6, "paddedFrame");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v6, "paddedFrame");
  v19 = v18 - width;
  objc_msgSend(v6, "paddedFrame");
  v21 = v20;

  return -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, v23, v9, v11, v13, v15, v17, v19, v21 - height);
}

- (unint64_t)uid
{
  return self->m_uid;
}

@end
