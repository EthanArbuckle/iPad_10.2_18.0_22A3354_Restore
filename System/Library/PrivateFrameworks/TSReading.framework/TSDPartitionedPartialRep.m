@implementation TSDPartitionedPartialRep

- (TSDPartitionedPartialRep)initWithLayout:(id)a3 canvas:(id)a4
{
  void *v7;
  uint64_t v8;
  TSDPartitionedPartialRep *v9;
  void *v10;
  objc_super v12;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDPartitionedPartialRep initWithLayout:canvas:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPartitionedPartialRep.m"), 39, CFSTR("invalid nil value for '%s'"), "layout");
  }
  v12.receiver = self;
  v12.super_class = (Class)TSDPartitionedPartialRep;
  v9 = -[TSDRep initWithLayout:canvas:](&v12, sel_initWithLayout_canvas_, a3, a4);
  if (v9)
  {
    objc_opt_class();
    objc_msgSend(a3, "partitioner");
    v10 = (void *)TSUDynamicCast();
    if (v10)
      objc_msgSend(v10, "i_registerPartialRep:", v9);
  }
  return v9;
}

- (BOOL)directlyManagesLayerContent
{
  -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  return objc_msgSend((id)TSUProtocolCast(), "shouldUseCachedPartitionRendering");
}

- (CGRect)layerFrameInScaledCanvas
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
  double v14;
  CGRect v15;

  -[TSDPartitionedPartialRep p_edgeInsetsForClipping](self, "p_edgeInsetsForClipping");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSDRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  -[TSDCanvas convertUnscaledToBoundsRect:](self->super.mCanvas, "convertUnscaledToBoundsRect:", v6 + v11, v4 + v12, v13 - (v6 + v10), v14 - (v4 + v8));
  return CGRectIntegral(v15);
}

- (CGRect)clipRect
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[TSDPartitionedPartialRep p_edgeInsetsForClipping](self, "p_edgeInsetsForClipping");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSDRep naturalBounds](self, "naturalBounds");
  v12 = v6 + v11;
  v14 = v4 + v13;
  v16 = v15 - (v6 + v10);
  v18 = v17 - (v4 + v8);
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v12;
  return result;
}

- (void)willBeRemoved
{
  TSDLayout *v3;
  void *v4;
  objc_super v5;

  v3 = -[TSDRep layout](self, "layout");
  objc_opt_class();
  -[TSDLayout partitioner](v3, "partitioner");
  v4 = (void *)TSUDynamicCast();
  if (v4)
    objc_msgSend(v4, "i_unregisterPartialRep:", self);
  v5.receiver = self;
  v5.super_class = (Class)TSDPartitionedPartialRep;
  -[TSDRep willBeRemoved](&v5, sel_willBeRemoved);
}

- (void)drawInContext:(CGContext *)a3
{
  TSDLayout *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  v5 = -[TSDRep layout](self, "layout");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TSDLayout partitioner](v5, "partitioner"), "i_layout"), "geometry"), "frame");
  CGContextTranslateCTM(a3, -v6, -v7);
  -[TSDLayout bounds](v5, "bounds");
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeTranslation(&v11, -v8, -v9);
  v10 = v11;
  CGContextConcatCTM(a3, &v10);
  objc_msgSend((id)objc_msgSend((id)-[TSDLayout partitioner](v5, "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas")), "recursivelyDrawInContext:", a3);
}

- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4
{
  objc_msgSend((id)objc_msgSend((id)-[TSDLayout partitioner](-[TSDRep layout](self, "layout"), "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas")), "recursivelyPerformSelector:withObject:withObject:", sel_addBitmapsToRenderingQualityInfo_inContext_, a3, a4);
}

- (void)didUpdateLayer:(id)a3
{
  TSDLayout *v5;
  CGImage *v6;
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
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)TSDPartitionedPartialRep;
  -[TSDRep didUpdateLayer:](&v27, sel_didUpdateLayer_);
  if (-[TSDPartitionedPartialRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    v5 = -[TSDRep layout](self, "layout");
    v6 = (CGImage *)objc_msgSend((id)-[TSDLayout partitioner](v5, "partitioner"), "i_cachedImageForCanvas:", -[TSDRep canvas](self, "canvas"));
    if (!v6)
    {
      v6 = -[TSDPartitionedPartialRep p_newImageForCachingBaseRep](self, "p_newImageForCachingBaseRep");
      objc_msgSend((id)-[TSDLayout partitioner](v5, "partitioner"), "i_setCachedImage:forCanvas:", v6, -[TSDRep canvas](self, "canvas"));
      CFRelease(v6);
    }
    objc_msgSend(a3, "setContents:", v6);
    -[TSDLayout bounds](v5, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[TSDPartitionedPartialRep p_edgeInsetsForClipping](self, "p_edgeInsetsForClipping");
    v16 = v8 + v15;
    v18 = v10 + v17;
    v20 = v12 - (v15 + v19);
    v22 = v14 - (v17 + v21);
    -[TSDPartitionedPartialRep p_clipRect](self, "p_clipRect");
    objc_msgSend(a3, "setContentsRect:", (v16 - v23) / v24, (v18 - v25) / v26, v20 / v24, v22 / v26);
  }
}

- (void)resetCachedPartitionedRendering
{
  TSDLayout *v3;

  v3 = -[TSDRep layout](self, "layout");
  -[TSDLayout invalidate](v3, "invalidate");
  -[TSDRep setNeedsDisplay](self, "setNeedsDisplay");
  objc_msgSend((id)-[TSDLayout partitioner](v3, "partitioner"), "i_removeCachedImageForCanvas:", -[TSDRep canvas](self, "canvas"));
}

- (id)i_queueForTileProvider
{
  return (id)objc_msgSend((id)objc_msgSend((id)-[TSDLayout partitioner](-[TSDRep layout](self, "layout"), "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas")), "i_queueForTileProvider");
}

- (UIEdgeInsets)p_edgeInsetsForClipping
{
  TSDLayout *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double MinY;
  double v31;
  double MaxY;
  double v33;
  CGFloat v34;
  CGFloat v35;
  double MinX;
  double v37;
  double MaxX;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat rect;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  UIEdgeInsets result;

  v3 = -[TSDRep layout](self, "layout");
  -[TSDLayout bounds](v3, "bounds");
  v50 = v5;
  v51 = v4;
  v7 = v6;
  v44 = v8;
  v9 = (void *)objc_msgSend((id)-[TSDLayout partitioner](v3, "partitioner"), "i_layout");
  v10 = (void *)objc_msgSend((id)-[TSDLayout partitioner](v3, "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas"));
  objc_msgSend((id)objc_msgSend(v9, "geometry"), "frame");
  v54 = v12;
  v55 = v11;
  v52 = v14;
  v53 = v13;
  -[TSDPartitionedPartialRep p_clipRect](self, "p_clipRect");
  v16 = v15;
  v18 = v17;
  v56 = v19;
  v21 = v20;
  objc_msgSend(v10, "naturalBounds");
  -[TSDPartitionedPartialRep p_convertBaseToNaturalRect:](self, "p_convertBaseToNaturalRect:");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v57.size.height = v50;
  v57.origin.x = v51;
  v57.origin.y = v7;
  v57.size.width = v44;
  v48 = v16;
  v49 = v21;
  rect = v29;
  v46 = v18;
  if (fabs(CGRectGetMinY(v57)) >= 0.00999999978)
  {
    v31 = 0.0;
  }
  else
  {
    v58.origin.x = v16;
    v58.origin.y = v18;
    v58.size.width = v56;
    v58.size.height = v21;
    MinY = CGRectGetMinY(v58);
    v59.origin.x = v23;
    v59.origin.y = v25;
    v59.size.width = v27;
    v59.size.height = v29;
    v31 = MinY - CGRectGetMinY(v59);
  }
  v60.origin.x = v51;
  v60.origin.y = v7;
  v60.size.width = v44;
  v60.size.height = v50;
  MaxY = CGRectGetMaxY(v60);
  v61.origin.y = v54;
  v61.origin.x = v55;
  v61.size.height = v52;
  v61.size.width = v53;
  if (vabdd_f64(MaxY, CGRectGetHeight(v61)) >= 0.00999999978)
  {
    v45 = 0.0;
    v34 = v46;
  }
  else
  {
    v62.origin.x = v23;
    v62.size.width = v27;
    v62.origin.y = v25;
    v62.size.height = v29;
    v33 = CGRectGetMaxY(v62);
    v63.origin.x = v48;
    v63.size.height = v21;
    v34 = v46;
    v63.origin.y = v46;
    v63.size.width = v56;
    v45 = v33 - CGRectGetMaxY(v63);
  }
  v35 = v23;
  v64.origin.x = v51;
  v64.origin.y = v7;
  v64.size.width = v44;
  v64.size.height = v50;
  if (fabs(CGRectGetMinX(v64)) >= 0.00999999978)
  {
    v37 = 0.0;
  }
  else
  {
    v65.origin.x = v48;
    v65.size.height = v21;
    v65.origin.y = v34;
    v65.size.width = v56;
    MinX = CGRectGetMinX(v65);
    v66.origin.x = v35;
    v66.size.width = v27;
    v66.origin.y = v25;
    v66.size.height = rect;
    v37 = MinX - CGRectGetMinX(v66);
  }
  v67.origin.x = v51;
  v67.origin.y = v7;
  v67.size.width = v44;
  v67.size.height = v50;
  MaxX = CGRectGetMaxX(v67);
  v68.origin.y = v54;
  v68.origin.x = v55;
  v68.size.height = v52;
  v68.size.width = v53;
  if (vabdd_f64(MaxX, CGRectGetWidth(v68)) >= 0.00999999978)
  {
    v40 = 0.0;
  }
  else
  {
    v69.origin.x = v35;
    v69.size.width = v27;
    v69.origin.y = v25;
    v69.size.height = rect;
    v39 = CGRectGetMaxX(v69);
    v70.origin.x = v48;
    v70.size.height = v49;
    v70.origin.y = v34;
    v70.size.width = v56;
    v40 = v39 - CGRectGetMaxX(v70);
  }
  v41 = v31;
  v42 = v37;
  v43 = v45;
  result.right = v40;
  result.bottom = v43;
  result.left = v42;
  result.top = v41;
  return result;
}

- (CGRect)p_clipRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = (void *)objc_msgSend((id)-[TSDLayout partitioner](-[TSDRep layout](self, "layout"), "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas"));
  if (objc_msgSend(v3, "masksToBounds"))
    objc_msgSend(v3, "clipRect");
  else
    objc_msgSend(v3, "i_partition_deepClipRect");
  -[TSDPartitionedPartialRep p_convertBaseToNaturalRect:](self, "p_convertBaseToNaturalRect:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGImage)p_newImageForCachingBaseRep
{
  TSDLayout *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double x;
  double y;
  double v16;
  double v17;
  CGContext *v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGImage *Image;
  CGRect v29;
  CGRect v30;

  v3 = -[TSDRep layout](self, "layout");
  v4 = (void *)objc_msgSend((id)-[TSDLayout partitioner](v3, "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas"));
  -[TSDPartitionedPartialRep p_clipRect](self, "p_clipRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v29.origin.x = TSDMultiplyRectScalar(v6, v8, v10, v12, v13);
  x = v29.origin.x;
  y = v29.origin.y;
  v30 = CGRectIntegral(v29);
  v16 = v30.origin.x;
  v17 = v30.origin.y;
  v18 = TSDBitmapContextCreate(11, v30.size.width);
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  TSDSetCGContextInfo((uint64_t)v18, 0, 0, 0, 0, v19);
  CGContextTranslateCTM(v18, x - v16, y - v17);
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v21 = v20;
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  CGContextScaleCTM(v18, v21, v22);
  objc_msgSend(v4, "naturalBounds");
  CGContextTranslateCTM(v18, v23 - v6, v24 - v8);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TSDLayout partitioner](v3, "partitioner"), "i_layout"), "geometry"), "frame");
  CGContextTranslateCTM(v18, -v25, -v26);
  objc_msgSend(v4, "recursivelyDrawInContext:", v18);
  Image = CGBitmapContextCreateImage(v18);
  CGContextRelease(v18);
  return Image;
}

- (CGRect)p_convertBaseToNaturalRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)-[TSDLayout partitioner](-[TSDRep layout](self, "layout"), "partitioner"), "i_layout"), "geometry");
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "transform");
  else
    memset(&v20, 0, sizeof(v20));
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v22 = CGRectApplyAffineTransform(v21, &v20);
  v9 = v22.origin.x;
  v10 = v22.origin.y;
  v11 = v22.size.width;
  v12 = v22.size.height;
  objc_msgSend(v8, "frame");
  v14 = v9 - v13;
  objc_msgSend(v8, "frame");
  v16 = v10 - v15;
  v17 = v14;
  v18 = v11;
  v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

@end
