@implementation PXTilingControllerDebugInfo

- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat MidX;
  CGFloat MidY;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v72 = *MEMORY[0x1E0C80C00];
  CGContextSaveGState(a4);
  CGContextSetRGBFillColor(a4, 1.0, 1.0, 1.0, 1.0);
  v73.origin.x = x;
  v73.origin.y = y;
  v73.size.width = width;
  v73.size.height = height;
  CGContextFillRect(a4, v73);
  PXEdgeInsetsMake();
  PXEdgeInsetsInsetRect();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PXTilingControllerDebugInfo visibleRect](self, "visibleRect");
  v19 = v18;
  -[PXTilingControllerDebugInfo visibleRect](self, "visibleRect");
  PXRectGetCenter();
  v21 = v20;
  v23 = v22;
  v48 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v67.a = *MEMORY[0x1E0C9BAA8];
  v47 = *(_OWORD *)&v67.a;
  *(_OWORD *)&v67.c = v48;
  *(_OWORD *)&v67.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v46 = *(_OWORD *)&v67.tx;
  v74.origin.x = v11;
  v74.origin.y = v13;
  v74.size.width = v15;
  v74.size.height = v17;
  MidX = CGRectGetMidX(v74);
  v75.origin.x = v11;
  v75.origin.y = v13;
  v75.size.width = v15;
  v75.size.height = v17;
  MidY = CGRectGetMidY(v75);
  *(_OWORD *)&v66.a = *(_OWORD *)&v67.a;
  *(_OWORD *)&v66.c = v48;
  *(_OWORD *)&v66.tx = *(_OWORD *)&v67.tx;
  CGAffineTransformTranslate(&v67, &v66, MidX, MidY);
  v65 = v67;
  CGAffineTransformScale(&v66, &v65, v15 / v19, v15 / v19);
  v67 = v66;
  v65 = v66;
  CGAffineTransformTranslate(&v66, &v65, -v21, -v23);
  v67 = v66;
  CGContextSetLineWidth(a4, 1.0);
  CGContextSetRGBFillColor(a4, 0.8, 0.8, 0.8, 1.0);
  -[PXTilingControllerDebugInfo contentBounds](self, "contentBounds");
  v66 = v67;
  v77 = CGRectApplyAffineTransform(v76, &v66);
  CGContextFillRect(a4, v77);
  CGContextSetRGBStrokeColor(a4, 0.4, 0.4, 0.4, 1.0);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[PXTilingControllerDebugInfo pagedItems](self, "pagedItems");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v62;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v62 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v30), "CGRectValue", v46, v47, v48);
        v66 = v67;
        v79 = CGRectApplyAffineTransform(v78, &v66);
        CGContextStrokeRect(a4, v79);
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    }
    while (v28);
  }

  CGContextSetRGBStrokeColor(a4, 1.0, 0.0, 0.0, 0.5);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[PXTilingControllerDebugInfo preheatedItems](self, "preheatedItems");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v58;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v58 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v35), "CGRectValue", v46, v47, v48);
        v66 = v67;
        v81 = CGRectApplyAffineTransform(v80, &v66);
        CGContextStrokeRect(a4, v81);
        ++v35;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    }
    while (v33);
  }

  CGContextSetRGBStrokeColor(a4, 0.0, 0.0, 1.0, 0.5);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[PXTilingControllerDebugInfo activeItems](self, "activeItems");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v54;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v54 != v39)
          objc_enumerationMutation(v36);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v40), "CGRectValue", v46, v47, v48);
        v66 = v67;
        v83 = CGRectApplyAffineTransform(v82, &v66);
        CGContextStrokeRect(a4, v83);
        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
    }
    while (v38);
  }

  CGContextSetRGBStrokeColor(a4, 0.4, 0.4, 0.4, 1.0);
  -[PXTilingControllerDebugInfo pagedRect](self, "pagedRect");
  v66 = v67;
  v85 = CGRectApplyAffineTransform(v84, &v66);
  CGContextStrokeRect(a4, v85);
  CGContextSetRGBStrokeColor(a4, 1.0, 0.0, 1.0, 1.0);
  -[PXTilingControllerDebugInfo cachedRect](self, "cachedRect");
  v66 = v67;
  v87 = CGRectApplyAffineTransform(v86, &v66);
  CGContextStrokeRect(a4, v87);
  CGContextSetRGBStrokeColor(a4, 1.0, 0.0, 0.0, 1.0);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[PXTilingControllerDebugInfo preheatRects](self, "preheatRects");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v68, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v50;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v50 != v44)
          objc_enumerationMutation(v41);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v45), "CGRectValue", v46, v47, v48);
        v66 = v67;
        v89 = CGRectApplyAffineTransform(v88, &v66);
        CGContextStrokeRect(a4, v89);
        ++v45;
      }
      while (v43 != v45);
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v68, 16);
    }
    while (v43);
  }

  CGContextSetRGBStrokeColor(a4, 0.0, 0.0, 1.0, 0.5);
  -[PXTilingControllerDebugInfo activeRect](self, "activeRect");
  v66 = v67;
  v91 = CGRectApplyAffineTransform(v90, &v66);
  CGContextStrokeRect(a4, v91);
  CGContextRestoreGState(a4);
}

- (id)debugQuickLookObject
{
  void *v3;
  CGSize v5;

  v5.width = 50.0;
  v5.height = 640.0;
  UIGraphicsBeginImageContextWithOptions(v5, 1, 2.0);
  -[PXTilingControllerDebugInfo drawInRect:inContext:](self, "drawInRect:inContext:", UIGraphicsGetCurrentContext(), 0.0, 0.0, 50.0, 640.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v3;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (CGRect)activeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_activeRect.origin.x;
  y = self->_activeRect.origin.y;
  width = self->_activeRect.size.width;
  height = self->_activeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setActiveRect:(CGRect)a3
{
  self->_activeRect = a3;
}

- (CGRect)pagedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_pagedRect.origin.x;
  y = self->_pagedRect.origin.y;
  width = self->_pagedRect.size.width;
  height = self->_pagedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPagedRect:(CGRect)a3
{
  self->_pagedRect = a3;
}

- (CGRect)cachedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedRect.origin.x;
  y = self->_cachedRect.origin.y;
  width = self->_cachedRect.size.width;
  height = self->_cachedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedRect:(CGRect)a3
{
  self->_cachedRect = a3;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (NSArray)preheatRects
{
  return self->_preheatRects;
}

- (void)setPreheatRects:(id)a3
{
  objc_storeStrong((id *)&self->_preheatRects, a3);
}

- (NSArray)pagedItems
{
  return self->_pagedItems;
}

- (void)setPagedItems:(id)a3
{
  objc_storeStrong((id *)&self->_pagedItems, a3);
}

- (NSArray)preheatedItems
{
  return self->_preheatedItems;
}

- (void)setPreheatedItems:(id)a3
{
  objc_storeStrong((id *)&self->_preheatedItems, a3);
}

- (NSArray)activeItems
{
  return self->_activeItems;
}

- (void)setActiveItems:(id)a3
{
  objc_storeStrong((id *)&self->_activeItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeItems, 0);
  objc_storeStrong((id *)&self->_preheatedItems, 0);
  objc_storeStrong((id *)&self->_pagedItems, 0);
  objc_storeStrong((id *)&self->_preheatRects, 0);
}

@end
