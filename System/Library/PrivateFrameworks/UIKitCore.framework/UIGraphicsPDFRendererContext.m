@implementation UIGraphicsPDFRendererContext

- (void)updateAuxInfo:(id)a3
{
  uint64_t CurrentContextAuxInfo;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  CurrentContextAuxInfo = GetCurrentContextAuxInfo(2);
  if (CurrentContextAuxInfo)
  {
    v4 = CurrentContextAuxInfo;
    objc_msgSend(v13, "documentBounds");
    *(_QWORD *)v4 = v5;
    *(_QWORD *)(v4 + 8) = v6;
    *(_QWORD *)(v4 + 16) = v7;
    *(_QWORD *)(v4 + 24) = v8;
    objc_msgSend(v13, "pageBounds");
    *(_QWORD *)(v4 + 32) = v9;
    *(_QWORD *)(v4 + 40) = v10;
    *(_QWORD *)(v4 + 48) = v11;
    *(_QWORD *)(v4 + 56) = v12;
    *(_BYTE *)(v4 + 64) = objc_msgSend(v13, "inPage");
  }

}

- (void)beginPage
{
  id v3;

  -[UIGraphicsRendererContext format](self, "format");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIGraphicsPDFRendererContext beginPageWithBounds:pageInfo:](self, "beginPageWithBounds:pageInfo:", MEMORY[0x1E0C9AA70]);

}

- (void)beginPageWithBounds:(CGRect)bounds pageInfo:(NSDictionary *)pageInfo
{
  NSDictionary *v5;
  void *v6;
  CGContext *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  NSDictionary *v30;
  CGAffineTransform v31;
  _QWORD v32[3];
  CGFloat ty;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v34 = bounds;
  v5 = pageInfo;
  -[UIGraphicsRendererContext format](self, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIGraphicsRendererContext CGContext](self, "CGContext");
  if (-[UIGraphicsPDFRendererContext inPage](self, "inPage"))
    CGPDFContextEndPage(v7);
  objc_msgSend(v6, "documentInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = &v34;
  v9 = *MEMORY[0x1E0C9DB58];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C9DB58]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "getBytes:length:", v32, 32);

  if (CGRectIsEmpty(v34))
  {
    -[UIGraphicsPDFRendererContext documentBounds](self, "documentBounds");
    v34.origin.x = v12;
    v34.origin.y = v13;
    v34.size.width = v14;
    v34.size.height = v15;
  }
  -[UIGraphicsPDFRendererContext setPageBounds:](self, "setPageBounds:");
  -[UIGraphicsPDFRendererContext setInPage:](self, "setInPage:", 1);
  -[UIGraphicsPDFRendererContext pageBounds](self, "pageBounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  *(double *)v32 = v16;
  *(double *)&v32[1] = v18;
  *(double *)&v32[2] = v20;
  ty = v22;
  -[NSDictionary objectForKey:](v5, "objectForKey:", v9);
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
LABEL_13:

    goto LABEL_14;
  }
  -[UIGraphicsPDFRendererContext documentBounds](self, "documentBounds");
  v37.origin.x = v26;
  v37.origin.y = v27;
  v37.size.width = v28;
  v37.size.height = v29;
  v35.origin.x = v17;
  v35.origin.y = v19;
  v35.size.width = v21;
  v35.size.height = v23;
  if (CGRectEqualToRect(v35, v37))
  {
    v25 = 0;
    goto LABEL_13;
  }
  v38.size.width = 612.0;
  v38.size.height = 792.0;
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v36.origin.x = v17;
  v36.origin.y = v19;
  v36.size.width = v21;
  v36.size.height = v23;
  if (!CGRectEqualToRect(v36, v38))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v32, 32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (NSDictionary *)-[NSDictionary mutableCopy](v5, "mutableCopy");

    -[NSDictionary setObject:forKey:](v30, "setObject:forKey:", v25, v9);
    v5 = v30;
    goto LABEL_13;
  }
LABEL_14:
  CGPDFContextBeginPage(v7, (CFDictionaryRef)v5);
  CGContextTranslateCTM(v7, 0.0, ty);
  CGContextScaleCTM(v7, 1.0, -1.0);
  CGAffineTransformMakeScale(&v31, 1.0, -1.0);
  CGContextSetBaseCTM();
  -[UIGraphicsPDFRendererContext updateAuxInfo:](self, "updateAuxInfo:", self);

}

- (CGRect)pdfContextBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[UIGraphicsPDFRendererContext inPage](self, "inPage"))
    -[UIGraphicsPDFRendererContext pageBounds](self, "pageBounds");
  else
    -[UIGraphicsPDFRendererContext documentBounds](self, "documentBounds");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setURL:(NSURL *)url forRect:(CGRect)rect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *v9;
  NSURL *urla;
  CGRect v11;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  urla = url;
  v9 = -[UIGraphicsRendererContext CGContext](self, "CGContext");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGPDFContextSetURLForRect(v9, (CFURLRef)urla, v11);

}

- (void)addDestinationWithName:(NSString *)name atPoint:(CGPoint)point
{
  CGFloat y;
  CGFloat x;
  CGContext *v7;
  __CFString *namea;
  CGPoint v9;

  y = point.y;
  x = point.x;
  namea = name;
  v7 = -[UIGraphicsRendererContext CGContext](self, "CGContext");
  v9.x = x;
  v9.y = y;
  CGPDFContextAddDestinationAtPoint(v7, namea, v9);

}

- (void)setDestinationWithName:(NSString *)name forRect:(CGRect)rect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *v9;
  __CFString *namea;
  CGRect v11;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  namea = name;
  v9 = -[UIGraphicsRendererContext CGContext](self, "CGContext");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGPDFContextSetDestinationForRect(v9, namea, v11);

}

- (CGRect)documentBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_documentBounds, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDocumentBounds:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_documentBounds, &v3, 32, 1, 0);
}

- (CGRect)pageBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_pageBounds, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPageBounds:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_pageBounds, &v3, 32, 1, 0);
}

- (BOOL)inPage
{
  return self->_inPage;
}

- (void)setInPage:(BOOL)a3
{
  self->_inPage = a3;
}

@end
