@implementation CRLPdfHyperlinkController

- (CRLPdfHyperlinkController)init
{
  return -[CRLPdfHyperlinkController initWithTaggingRect:](self, "initWithTaggingRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (CRLPdfHyperlinkController)initWithTaggingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CRLPdfHyperlinkController *v7;
  NSMutableArray *v8;
  NSMutableArray *mHyperlinkRegions;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CRLPdfHyperlinkController;
  v7 = -[CRLPdfHyperlinkController init](&v11, "init");
  if (v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mHyperlinkRegions = v7->mHyperlinkRegions;
    v7->mHyperlinkRegions = v8;

    v7->mTaggingRect.origin.x = x;
    v7->mTaggingRect.origin.y = y;
    v7->mTaggingRect.size.width = width;
    v7->mTaggingRect.size.height = height;
  }
  return v7;
}

- (BOOL)ignoreUrl:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "absoluteString"));
  v4 = v3 == 0;

  return v4;
}

- (CGRect)taggingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mTaggingRect.origin.x;
  y = self->mTaggingRect.origin.y;
  width = self->mTaggingRect.size.width;
  height = self->mTaggingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)p_taggingRectPath
{
  void *v3;

  if (CGRectIsNull(self->mTaggingRect))
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", self->mTaggingRect.origin.x, self->mTaggingRect.origin.y, self->mTaggingRect.size.width, self->mTaggingRect.size.height));
  return v3;
}

- (void)addHyperlinksForRep:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLPdfHyperlinkController p_hyperlinkRegionsForRep:](self, "p_hyperlinkRegionsForRep:", a3));
  if (objc_msgSend(v4, "count"))
    -[NSMutableArray addObjectsFromArray:](self->mHyperlinkRegions, "addObjectsFromArray:", v4);

}

- (void)crl_commitHyperlinksToPDF:(CGContext *)a3 targetRect:(CGRect)a4
{
  double height;
  double y;
  double x;
  CRLPdfHyperlinkController *v8;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  const __CFURL *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  char *v20;
  char *i;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  char *v31;
  CRLPdfHyperlinkController *v32;
  id v33;
  CGRect v34;

  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = self;
  v33 = (id)objc_claimAutoreleasedReturnValue(-[CRLPdfHyperlinkController p_taggingRectPath](self, "p_taggingRectPath", a4.origin.x, a4.origin.y, a4.size.width));
  v9 = (char *)-[NSMutableArray count](v8->mHyperlinkRegions, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v31 = v9;
    v32 = v8;
    do
    {
      v12 = objc_autoreleasePoolPush();
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v8->mHyperlinkRegions, "objectAtIndexedSubscript:", v11));
      v14 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));
      if (v14 && !-[CRLPdfHyperlinkController ignoreUrl:](v8, "ignoreUrl:", v14))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bezierPath"));
        v16 = v15;
        if (v33)
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "intersectBezierPath:"));

          v16 = (void *)v17;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfHyperlinkController p_chopBezierIntoRects:](v8, "p_chopBezierIntoRects:", v16));
        -[CRLPdfHyperlinkController p_combineSimilarElements:](v8, "p_combineSimilarElements:", v18);
        v19 = (char *)objc_msgSend(v18, "count");
        if (v19)
        {
          v20 = v19;
          for (i = 0; i != v20; ++i)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", i));
            objc_msgSend(v22, "CGRectValue");
            v24 = v23;
            v26 = v25;
            v28 = v27;
            v30 = v29;

            v34.origin.x = v24 - x;
            v34.origin.y = height - (v26 - y) - v30;
            v34.size.width = v28;
            v34.size.height = v30;
            CGPDFContextSetURLForRect(a3, v14, v34);
          }
        }

        v10 = v31;
        v8 = v32;
      }

      objc_autoreleasePoolPop(v12);
      ++v11;
    }
    while (v11 != v10);
  }
  -[NSMutableArray removeAllObjects](v8->mHyperlinkRegions, "removeAllObjects");

}

- (id)p_hyperlinkRegionsForRep:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hyperlinkRegions"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "bezierPath", v13, v14, v15));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "transformInRoot");
        }
        else
        {
          v14 = 0u;
          v15 = 0u;
          v13 = 0u;
        }
        objc_msgSend(v9, "transformUsingAffineTransform:", &v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)p_chopBezierIntoRects:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  void *v20;

  v3 = a3;
  if (objc_msgSend(v3, "elementCount"))
  {
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (v10 / 5.0)));
    v13 = 0.0;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v5, v7 + v13, v9, 5.0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "intersectBezierPath:", v14));
      if ((objc_msgSend(v15, "isEmpty") & 1) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:", 1));
        if (objc_msgSend(v16, "count"))
        {
          v17 = 0;
          v18 = 1;
          do
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", v17));
            if ((objc_msgSend(v19, "isEmpty") & 1) == 0)
            {
              objc_msgSend(v19, "bounds");
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
              objc_msgSend(v12, "addObject:", v20);

            }
            v17 = v18;
          }
          while ((unint64_t)objc_msgSend(v16, "count") > v18++);
        }

      }
      v13 = v13 + 5.0;

    }
    while (v11 >= v13);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)p_combineSimilarElements:(id)a3
{
  char *v3;
  char *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  id v26;

  v26 = a3;
  if (v26)
  {
    if (objc_msgSend(v26, "count"))
    {
      v3 = (char *)objc_msgSend(v26, "count");
      v4 = v3 - 1;
      if (v3 != (char *)1)
      {
        v25 = 0.000000999999997;
        do
        {
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndex:", v4 - 1, *(_QWORD *)&v25));
          objc_msgSend(v5, "CGRectValue");
          v7 = v6;
          v9 = v8;
          v11 = v10;
          v13 = v12;

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndex:", v4));
          objc_msgSend(v14, "CGRectValue");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;

          if ((v7 == v16 || vabdd_f64(v7, v16) < fabs(v16 * v25))
            && (v11 == v20 || vabdd_f64(v11, v20) < fabs(v20 * v25)))
          {
            v23 = v9 + v13;
            if (v9 + v13 == v18 || (v23 = vabdd_f64(v23, v18), v23 < fabs(v18 * v25)))
            {
              objc_msgSend(v26, "removeObjectAtIndex:", v4, v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v7, v9, v11, v13 + v22));
              objc_msgSend(v26, "replaceObjectAtIndex:withObject:", v4 - 1, v24);

            }
          }
          --v4;
        }
        while (v4);
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHyperlinkRegions, 0);
}

@end
