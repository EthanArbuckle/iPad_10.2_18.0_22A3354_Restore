@implementation VKCImageBaseOverlayView

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[VKCImageBaseOverlayView analysisResult](self, "analysisResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> id: %d"), v4, self, objc_msgSend(v5, "analysisRequestID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VKCImageBaseOverlayView)initWithFrame:(CGRect)a3
{
  VKCImageBaseOverlayView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageBaseOverlayView;
  result = -[VKCImageBaseOverlayView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_contentsRect.origin = (CGPoint)VKMRectUnit;
    result->_contentsRect.size = *(CGSize *)&qword_1D2ED1098;
  }
  return result;
}

- (VKCImageAnalysisResult)analysisResult
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKDynamicCast(v3, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (VKCImageAnalysisResult *)v5;
}

- (BOOL)isPublicAPI
{
  void *v2;
  char v3;

  -[VKCImageBaseOverlayView baseDelegate](self, "baseDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPublicAPI");

  return v3;
}

- (CGRect)contentBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[VKCImageBaseOverlayView viewRectFromNormalizedRect:](self, "viewRectFromNormalizedRect:", 0.0, 0.0, 1.0, 1.0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_normalizedVisibleRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_normalizedVisibleRect = &self->_normalizedVisibleRect;
  if (!CGRectEqualToRect(self->_normalizedVisibleRect, a3))
  {
    p_normalizedVisibleRect->origin.x = x;
    p_normalizedVisibleRect->origin.y = y;
    p_normalizedVisibleRect->size.width = width;
    p_normalizedVisibleRect->size.height = height;
    -[VKCImageBaseOverlayView normalizedVisibleRectDidChange](self, "normalizedVisibleRectDidChange");
  }
}

- (CGPoint)normalizedPointFromViewPoint:(CGPoint)a3
{
  double y;
  double x;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[VKCImageBaseOverlayView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  VKMRectFromNormalizedSubrect(v7, v9, v11, v13, v14, v15, v16, v17);
  v21 = VKMNormalizedPointInRect(x, y, v18, v19, v20);
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)viewPointFromNormalizedPoint:(CGPoint)a3
{
  double y;
  double x;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[VKCImageBaseOverlayView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  VKMRectFromNormalizedSubrect(v7, v9, v11, v13, v14, v15, v16, v17);
  v21 = VKMPointFromNormalizedRect(x, y, v18, v19, v20);
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGRect)normalizedRectFromViewRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCImageBaseOverlayView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  VKMRectFromNormalizedSubrect(v9, v11, v13, v15, v16, v17, v18, v19);
  VKMNormalizedSubrectInRect(x, y, width, height, v20, v21, v22, v23);
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)viewRectFromNormalizedRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCImageBaseOverlayView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  VKMRectFromNormalizedSubrect(v9, v11, v13, v15, v16, v17, v18, v19);
  VKMRectFromNormalizedSubrect(v20, v21, v22, v23, x, y, width, height);
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)normalizedQuadFromViewQuad:(id)a3
{
  id v4;
  double v5;
  double v6;
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
  double v22;

  v4 = a3;
  objc_msgSend(v4, "topLeft");
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "topRight");
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "bottomLeft");
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "bottomRight");
  v18 = v17;
  v20 = v19;

  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", v18, v20);
  return -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v14, v16, v21, v22, v6, v8, v10, v12);
}

- (id)viewQuadFromNormalizedQuad:(id)a3
{
  id v4;
  double v5;
  double v6;
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
  double v22;

  v4 = a3;
  objc_msgSend(v4, "topLeft");
  -[VKCImageBaseOverlayView viewPointFromNormalizedPoint:](self, "viewPointFromNormalizedPoint:");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "topRight");
  -[VKCImageBaseOverlayView viewPointFromNormalizedPoint:](self, "viewPointFromNormalizedPoint:");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "bottomLeft");
  -[VKCImageBaseOverlayView viewPointFromNormalizedPoint:](self, "viewPointFromNormalizedPoint:");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "bottomRight");
  v18 = v17;
  v20 = v19;

  -[VKCImageBaseOverlayView viewPointFromNormalizedPoint:](self, "viewPointFromNormalizedPoint:", v18, v20);
  return -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v14, v16, v21, v22, v6, v8, v10, v12);
}

- (id)normalizedPathFromViewPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  -[VKCImageBaseOverlayView normalizedRectFromViewRect:](self, "normalizedRectFromViewRect:");
  objc_msgSend(v4, "vk_pathByFittingToRect:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)viewPathFromNormalizedPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  -[VKCImageBaseOverlayView viewRectFromNormalizedRect:](self, "viewRectFromNormalizedRect:");
  objc_msgSend(v4, "vk_pathByFittingToRect:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (VKCImageBaseOverlayViewDelegate)baseDelegate
{
  return (VKCImageBaseOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_baseDelegate);
}

- (void)setBaseDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_baseDelegate, a3);
}

- (VKCTextRecognitionResult)recognitionResult
{
  return self->_recognitionResult;
}

- (void)setRecognitionResult:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionResult, a3);
}

- (NSString)customAnalyticsIdentifier
{
  return self->_customAnalyticsIdentifier;
}

- (void)setCustomAnalyticsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (int64_t)identifierIndex
{
  return self->_identifierIndex;
}

- (void)setIdentifierIndex:(int64_t)a3
{
  self->_identifierIndex = a3;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  self->_contentsRect = a3;
}

- (CGRect)normalizedVisibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedVisibleRect.origin.x;
  y = self->_normalizedVisibleRect.origin.y;
  width = self->_normalizedVisibleRect.size.width;
  height = self->_normalizedVisibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_recognitionResult, 0);
  objc_destroyWeak((id *)&self->_baseDelegate);
}

@end
