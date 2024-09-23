@implementation _UIRectangularBoundingPath

- (CGRect)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIRectangularBoundingPath;
  v4 = a3;
  -[_UIBoundingPath encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("boundingRect"), self->_boundingRect.origin.x, self->_boundingRect.origin.y, self->_boundingRect.size.width, self->_boundingRect.size.height, v5.receiver, v5.super_class);

}

- (_UIRectangularBoundingPath)initWithCoder:(id)a3
{
  id v4;
  _UIRectangularBoundingPath *v5;
  _UIRectangularBoundingPath *v6;
  CGRect *p_boundingRect;
  objc_class *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIRectangularBoundingPath;
  v5 = -[_UIBoundingPath initWithCoder:](&v13, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    p_boundingRect = &v5->_boundingRect;
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("boundingRect"));
    *(_QWORD *)&p_boundingRect->origin.x = v8;
    v6->_boundingRect.origin.y = v9;
    v6->_boundingRect.size.width = v10;
    v6->_boundingRect.size.height = v11;
  }

  return v6;
}

- (_UIRectangularBoundingPath)initWithCoordinateSpace:(id)a3 boundingRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UIRectangularBoundingPath *v10;
  objc_super v12;
  CGRect v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIRectangularBoundingPath;
  v10 = -[_UIBoundingPath initWithCoordinateSpace:](&v12, sel_initWithCoordinateSpace_, v9);
  if (v10)
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    if (CGRectIsNull(v13))
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    -[_UIRectangularBoundingPath _validateBoundingRect:forCoordinateSpace:](v10, "_validateBoundingRect:forCoordinateSpace:", v9, x, y, width, height);
    v10->_boundingRect.origin.x = x;
    v10->_boundingRect.origin.y = y;
    v10->_boundingRect.size.width = width;
    v10->_boundingRect.size.height = height;
  }

  return v10;
}

- (id)boundingPathForCoordinateSpace:(id)a3
{
  id v5;
  void *v6;
  double x;
  double y;
  double width;
  double height;
  _UIRectangularBoundingPath *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _UIRectangularBoundingPath *v25;
  void *v27;
  void *v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIRectangularBoundingPath.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinateSpace != nil"));

  }
  -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIRectangularBoundingPath.m"), 59, CFSTR("The bounding path's coordinate space cannot be nil"));

  }
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "convertRect:fromCoordinateSpace:", v5);
  v30 = CGRectIntersection(v29, self->_boundingRect);
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  if (CGRectIsNull(v30)
    || (v31.origin.x = x, v31.origin.y = y, v31.size.width = width, v31.size.height = height, CGRectIsEmpty(v31)))
  {
    v11 = [_UIRectangularBoundingPath alloc];
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = v5;
  }
  else
  {
    objc_msgSend(v6, "convertRect:toCoordinateSpace:", v5, x, y, width, height);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v11 = [_UIRectangularBoundingPath alloc];
    v16 = v5;
    v12 = v18;
    v13 = v20;
    v14 = v22;
    v15 = v24;
  }
  v25 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v11, "initWithCoordinateSpace:boundingRect:", v16, v12, v13, v14, v15);

  return v25;
}

- (id)boundingPathForCoordinateSpace:(id)a3 withCornerRadii:(UIRectCornerRadii)a4 orientation:(int64_t)a5 scale:(double)a6
{
  double topRight;
  double bottomRight;
  double bottomLeft;
  double topLeft;
  _UIComplexBoundingPath *v13;
  void *v14;
  id v15;
  _UIComplexBoundingPath *v16;
  void *v17;

  topRight = a4.topRight;
  bottomRight = a4.bottomRight;
  bottomLeft = a4.bottomLeft;
  topLeft = a4.topLeft;
  if (a4.topLeft == 0.0 && a4.bottomLeft == 0.0 && a4.bottomRight == 0.0 && a4.topRight == 0.0)
  {
    v13 = (_UIComplexBoundingPath *)a3;
    -[_UIRectangularBoundingPath boundingPathForCoordinateSpace:](self, "boundingPathForCoordinateSpace:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = a3;
    v16 = [_UIComplexBoundingPath alloc];
    -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_UIComplexBoundingPath initWithRectangularCoordinateSpace:orientation:scale:](v16, "initWithRectangularCoordinateSpace:orientation:scale:", v17, a5, a6);

    -[_UIComplexBoundingPath boundingPathForCoordinateSpace:withCornerRadii:orientation:scale:](v13, "boundingPathForCoordinateSpace:withCornerRadii:orientation:scale:", v15, a5, topLeft, bottomLeft, bottomRight, topRight, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (BOOL)_validateBoundingRect:(CGRect)a3 forCoordinateSpace:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  void *v14;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  objc_msgSend(v10, "bounds");
  v26 = CGRectInset(v25, -0.001, -0.001);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v11 = CGRectContainsRect(v26, v29);
  v12 = v11;
  if (_UIBoundingPathValidationAssertsEnabled)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      NSStringFromCGRect(v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIRectangularBoundingPath.m"), 87, CFSTR("Bounding path likely out of sync with its coordinate space: The view's bounds must contain the bounding rect. Bounding rect: %@; coordinate space: %@"),
        v14,
        v10);

    }
  }
  else if (!v11 && os_variant_has_internal_diagnostics())
  {
    v16 = _validateBoundingRect_forCoordinateSpace____s_category[0];
    if (!_validateBoundingRect_forCoordinateSpace____s_category[0])
    {
      v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, _validateBoundingRect_forCoordinateSpace____s_category);
    }
    v17 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      NSStringFromCGRect(v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v19;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Bounding path likely out of sync with its coordinate space: The view's bounds must contain the bounding rect. Bounding rect: %@; coordinate space: %@",
        buf,
        0x16u);

    }
  }

  return v12;
}

- (BOOL)validateForCoordinateSpace
{
  _UIRectangularBoundingPath *v2;
  CGRect *p_boundingRect;
  void *v4;

  v2 = self;
  p_boundingRect = &self->_boundingRect;
  -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[_UIRectangularBoundingPath _validateBoundingRect:forCoordinateSpace:](v2, "_validateBoundingRect:forCoordinateSpace:", v4, p_boundingRect->origin.x, p_boundingRect->origin.y, p_boundingRect->size.width, p_boundingRect->size.height);

  return (char)v2;
}

- (void)setCoordinateSpace:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  id v8;
  objc_super v9;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  v8 = a3;
  -[_UIRectangularBoundingPath _validateBoundingRect:forCoordinateSpace:](self, "_validateBoundingRect:forCoordinateSpace:", v8, x, y, width, height);
  v9.receiver = self;
  v9.super_class = (Class)_UIRectangularBoundingPath;
  -[_UIBoundingPath setCoordinateSpace:](&v9, sel_setCoordinateSpace_, v8);

}

- (BOOL)isNonRectangular
{
  return 0;
}

- (CGRect)_inscribedRectInBoundingPathAndRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5 withOptions:(unint64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v20 = CGRectIntersection(a3, self->_boundingRect);
  -[_UIBoundingPath _inscribedRectInBoundingRect:byInsettingRect:onEdges:](self, "_inscribedRectInBoundingRect:byInsettingRect:onEdges:", a5, v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, x, y, width, height);
  v12 = v21.origin.x;
  v13 = v21.origin.y;
  v14 = v21.size.width;
  v15 = v21.size.height;
  if (CGRectIsNull(v21) || v14 <= 0.0 || v15 <= 0.0)
  {
    v12 = *MEMORY[0x1E0C9D628];
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)_largestInscribedRectInBoundingPathAndRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5
{
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  double width;
  double height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v17 = CGRectIntersection(a3, self->_boundingRect);
  -[_UIBoundingPath _largestInscribedRectInBoundingRect:withCenter:aspectRatio:](self, "_largestInscribedRectInBoundingRect:withCenter:aspectRatio:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height, x, y, a5);
  v9 = v18.origin.x;
  v10 = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  if (CGRectIsNull(v18) || width <= 0.0 || height <= 0.0)
  {
    v9 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v13 = v9;
  v14 = v10;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(CGSize)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  double height;
  double width;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect result;

  height = a5.height;
  width = a5.width;
  v15 = CGRectIntersection(a4, self->_boundingRect);
  -[_UIBoundingPath _rectTuckedInCorner:ofBoundingRect:withSize:minimumPadding:](self, "_rectTuckedInCorner:ofBoundingRect:withSize:minimumPadding:", a3, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height, width, height, a7);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(double)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect result;

  v14 = CGRectIntersection(a4, self->_boundingRect);
  -[_UIBoundingPath _rectTuckedAgainstEdge:ofBoundingRect:withSize:minimumPadding:](self, "_rectTuckedAgainstEdge:ofBoundingRect:withSize:minimumPadding:", a3, v14.origin.x, v14.origin.y, v14.size.width, v14.size.height, a5, a7);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (UIEdgeInsets)_centerEdgeInsetsOfBoundingPathAndRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MinY;
  double v16;
  double MaxX;
  CGFloat v18;
  double v19;
  double MaxY;
  double MinX;
  double v22;
  CGFloat v23;
  CGFloat rect;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  UIEdgeInsets result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIRectangularBoundingPath _inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:](self, "_inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:", 15, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v25.origin.x;
  v8 = v25.origin.y;
  v9 = v25.size.width;
  v10 = v25.size.height;
  if (CGRectIsNull(v25))
  {
    v11 = INFINITY;
    v12 = INFINITY;
    v13 = INFINITY;
    v14 = INFINITY;
  }
  else
  {
    v26.origin.x = v7;
    v26.origin.y = v8;
    v26.size.width = v9;
    v26.size.height = v10;
    v23 = v8;
    rect = v7;
    MinY = CGRectGetMinY(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v11 = MinY - CGRectGetMinY(v27);
    v28.origin.x = v7;
    v28.origin.y = v23;
    v28.size.width = v9;
    v28.size.height = v10;
    MinX = CGRectGetMinX(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v22 = MinX - CGRectGetMinX(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    MaxY = CGRectGetMaxY(v30);
    v31.origin.x = v7;
    v31.origin.y = v23;
    v31.size.width = v9;
    v31.size.height = v10;
    v16 = MaxY - CGRectGetMaxY(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    MaxX = CGRectGetMaxX(v32);
    v33.origin.y = v23;
    v33.origin.x = rect;
    v33.size.width = v9;
    v33.size.height = v10;
    v18 = CGRectGetMaxX(v33);
    v13 = v16;
    v12 = v22;
    v14 = MaxX - v18;
  }
  v19 = v11;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v19;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_boundingRect);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p coordinateSpace=%@; boundingRect=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_imageRepresentation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIGraphicsImageRendererFormat *v8;
  UIGraphicsImageRenderer *v9;
  void *v10;
  _QWORD v12[7];

  -[_UIBoundingPath coordinateSpace](self, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = objc_alloc_init(UIGraphicsImageRendererFormat);
  -[UIGraphicsImageRendererFormat setOpaque:](v8, "setOpaque:", 1);
  -[UIGraphicsImageRendererFormat setPreferredRange:](v8, "setPreferredRange:", 2);
  v9 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v8, v5, v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50___UIRectangularBoundingPath__imageRepresentation__block_invoke;
  v12[3] = &unk_1E16C4E18;
  *(double *)&v12[5] = v5;
  *(double *)&v12[6] = v7;
  v12[4] = self;
  -[UIGraphicsImageRenderer imageWithActions:](v9, "imageWithActions:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
