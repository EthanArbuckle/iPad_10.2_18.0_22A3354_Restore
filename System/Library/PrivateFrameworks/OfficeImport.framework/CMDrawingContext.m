@implementation CMDrawingContext

- (CMDrawingContext)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char *v7;
  uint64_t v8;
  void *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)CMDrawingContext;
  v7 = -[CMDrawingContext init](&v17, sel_init);
  if (v7)
  {
    v8 = objc_opt_new();
    v9 = (void *)*((_QWORD *)v7 + 2);
    *((_QWORD *)v7 + 2) = v8;

    *((CGFloat *)v7 + 3) = x;
    *((CGFloat *)v7 + 4) = y;
    v10 = (_OWORD *)MEMORY[0x24BDBF090];
    *((CGFloat *)v7 + 5) = width;
    *((CGFloat *)v7 + 6) = height;
    v11 = v10[1];
    *(_OWORD *)(v7 + 56) = *v10;
    *(_OWORD *)(v7 + 72) = v11;
    v12 = objc_opt_new();
    v13 = (void *)*((_QWORD *)v7 + 15);
    *((_QWORD *)v7 + 15) = v12;

    objc_msgSend(MEMORY[0x24BDD1438], "transform");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v7 + 14);
    *((_QWORD *)v7 + 14) = v14;

  }
  return (CMDrawingContext *)v7;
}

- (void)setMapper:(id)a3
{
  objc_storeWeak((id *)&self->_mapper, a3);
}

- (CGRect)transformRectToPage:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CMDrawingContext _transformRect:withTransform:](self, "_transformRect:withTransform:", self->_currentTransform, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_transformRect:(CGRect)a3 withTransform:(id)a4
{
  double height;
  double width;
  double y;
  double x;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(v8, "transformPoint:", x, y);
  v10 = v9;
  v12 = v11;
  v13 = x + width;
  v14 = y + height;
  objc_msgSend(v8, "transformPoint:", x + width, y + height);
  v16 = v15;
  v18 = v17;
  objc_msgSend(v8, "transformPoint:", v13, y);
  v20 = v19;
  v22 = v21;
  objc_msgSend(v8, "transformPoint:", x, v14);
  if (v16 <= v10)
    v25 = v10;
  else
    v25 = v16;
  if (v16 >= v10)
    v26 = v10;
  else
    v26 = v16;
  if (v18 <= v12)
    v27 = v12;
  else
    v27 = v18;
  if (v18 >= v12)
    v28 = v12;
  else
    v28 = v18;
  if (v22 > v27)
    v27 = v22;
  if (v20 > v25)
    v25 = v20;
  if (v22 < v28)
    v28 = v22;
  if (v20 < v26)
    v26 = v20;
  if (v23 >= v26)
    v29 = v26;
  else
    v29 = v23;
  if (v24 >= v28)
    v30 = v28;
  else
    v30 = v24;
  if (v23 <= v25)
    v23 = v25;
  if (v24 <= v27)
    v24 = v27;
  v31 = v23 - v29;
  v32 = v24 - v30;

  v33 = v29;
  v34 = v30;
  v35 = v31;
  v36 = v32;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (id)copyPDF
{
  id result;
  NSMutableArray *v4;
  NSMutableArray *transforms;
  NSAffineTransform *v6;
  NSAffineTransform *currentTransform;

  result = (id)-[NSMutableArray count](self->_actions, "count");
  if (result)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    transforms = self->_transforms;
    self->_transforms = v4;

    objc_msgSend(MEMORY[0x24BDD1438], "transform");
    v6 = (NSAffineTransform *)objc_claimAutoreleasedReturnValue();
    currentTransform = self->_currentTransform;
    self->_currentTransform = v6;

    -[CMDrawingContext _copyCGContext](self, "_copyCGContext");
    -[CMDrawingContext _playbackActions](self, "_playbackActions");
    -[CMDrawingContext _closeContext](self, "_closeContext");
    result = self->_data;
    self->_data = 0;
  }
  return result;
}

- (void)dealloc
{
  CGContext *cgContext;
  CGDataConsumer *dataConsumer;
  __CFData *data;
  objc_super v6;

  cgContext = self->_cgContext;
  if (cgContext)
  {
    CGContextRelease(cgContext);
    self->_cgContext = 0;
  }
  dataConsumer = self->_dataConsumer;
  if (dataConsumer)
  {
    CGDataConsumerRelease(dataConsumer);
    self->_dataConsumer = 0;
  }
  data = self->_data;
  if (data)
  {
    CFRelease(data);
    self->_data = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CMDrawingContext;
  -[CMDrawingContext dealloc](&v6, sel_dealloc);
}

- (CGAffineTransform)currentTransform
{
  CGAffineTransform *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  result = (CGAffineTransform *)self->_currentTransform;
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
    result = (CGAffineTransform *)-[CGAffineTransform transformStruct](result, "transformStruct");
    v5 = v8;
    v6 = v9;
    v7 = v10;
  }
  else
  {
    v5 = 0uLL;
    v6 = 0uLL;
    v7 = 0uLL;
  }
  *(_OWORD *)&retstr->a = v5;
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = v7;
  return result;
}

- (void)setStrokeColor:(CGColor *)a3
{
  CMDrawingAction *v4;

  v4 = -[CMDrawingAction initWithType:andValue:]([CMDrawingAction alloc], "initWithType:andValue:", 2, a3);
  -[NSMutableArray addObject:](self->_actions, "addObject:");

}

- (void)setFillColor:(CGColor *)a3
{
  CMDrawingAction *v4;

  v4 = -[CMDrawingAction initWithType:andValue:]([CMDrawingAction alloc], "initWithType:andValue:", 3, a3);
  -[NSMutableArray addObject:](self->_actions, "addObject:");

}

- (void)addPath:(CGPath *)a3
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  CMDrawingAction *v9;
  CGRect BoundingBox;
  CGRect v11;
  CGRect v12;

  BoundingBox = CGPathGetBoundingBox(a3);
  x = BoundingBox.origin.x;
  y = BoundingBox.origin.y;
  if (BoundingBox.size.width == 0.0)
    width = 1.0;
  else
    width = BoundingBox.size.width;
  if (BoundingBox.size.height == 0.0)
    height = 1.0;
  else
    height = BoundingBox.size.height;
  if (!CGRectEqualToRect(self->_finalFrame, *MEMORY[0x24BDBF090]))
  {
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    v11 = CGRectUnion(self->_finalFrame, v12);
    x = v11.origin.x;
    y = v11.origin.y;
    width = v11.size.width;
    height = v11.size.height;
  }
  self->_finalFrame.origin.x = x;
  self->_finalFrame.origin.y = y;
  self->_finalFrame.size.width = width;
  self->_finalFrame.size.height = height;
  v9 = -[CMDrawingAction initWithType:andValue:]([CMDrawingAction alloc], "initWithType:andValue:", 8, a3);
  -[NSMutableArray addObject:](self->_actions, "addObject:");

}

- (void)_copyCGContext
{
  __CFData *Mutable;
  CGDataConsumer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGContext *cgContext;
  CGRect v13;

  if (!self->_cgContext)
  {
    Mutable = CFDataCreateMutable(0, 0);
    self->_data = Mutable;
    v4 = CGDataConsumerCreateWithCFData(Mutable);
    self->_dataConsumer = v4;
    if (v4)
    {
      -[CMDrawingContext pdfFrame](self, "pdfFrame");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v13.origin.x = 0.0;
      v13.origin.y = 0.0;
      v13.size.width = v11;
      v13.size.height = v9;
      cgContext = CGPDFContextCreate(self->_dataConsumer, &v13, 0);
      self->_cgContext = cgContext;
      if (!cgContext)
      {
        CFShow(CFSTR("Cannot create PDF context"));
        CFRelease(self->_data);
        CFRelease(self->_dataConsumer);
        cgContext = self->_cgContext;
      }
      CGContextBeginPage(cgContext, &v13);
      CGContextSetShouldAntialias(self->_cgContext, 1);
      CGContextTranslateCTM(self->_cgContext, -v6, v8 + v10);
      CGContextScaleCTM(self->_cgContext, 1.0, -1.0);
      -[CMDrawingContext _applyTransform:](self, "_applyTransform:", self->_currentTransform);
    }
    else
    {
      CFShow(CFSTR("Cannot create DataConsumer"));
      CFRelease(self->_data);
    }
  }
}

- (CGRect)pdfFrame
{
  return CGRectInset(self->_finalFrame, -20.0, -20.0);
}

- (void)_applyTransform:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGContext *cgContext;
  CGAffineTransform v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v4 = a3;
  v5 = v4;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  if (v4)
  {
    objc_msgSend(v4, "transformStruct");
    v6 = *((double *)&v14 + 1);
    v7 = *(double *)&v14;
    v8 = *((double *)&v15 + 1);
    v9 = *(double *)&v15;
    v10 = *((double *)&v16 + 1);
    v11 = *(double *)&v16;
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
  }
  CGContextSaveGState(self->_cgContext);
  cgContext = self->_cgContext;
  v13.a = v7;
  v13.b = v6;
  v13.c = v9;
  v13.d = v8;
  v13.tx = v11;
  v13.ty = v10;
  CGContextConcatCTM(cgContext, &v13);

}

- (void)_playbackActions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  CGColor *v7;
  CGContext *cgContext;
  CGContext *v9;
  CGContext *v10;
  float v11;
  void *v12;
  size_t v13;
  CGFloat *v14;
  CGContext *v15;
  const CGPath *v16;
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  const CGPath *v21;
  uint64_t j;
  void *v23;
  void *v24;
  float v25;
  CGRect BoundingBox;
  CGRect v27;

  v3 = -[NSMutableArray count](self->_actions, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_actions, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v6, "type"))
      {
        case 0u:
          objc_msgSend(v6, "value");
          v7 = (CGColor *)objc_claimAutoreleasedReturnValue();
          -[CMDrawingContext _addTransform:](self, "_addTransform:", v7);
          goto LABEL_9;
        case 1u:
          -[CMDrawingContext _restoreLastTransform](self, "_restoreLastTransform");
          break;
        case 2u:
          cgContext = self->_cgContext;
          objc_msgSend(v6, "value");
          v7 = (CGColor *)objc_claimAutoreleasedReturnValue();
          CGContextSetStrokeColorWithColor(cgContext, v7);
          goto LABEL_9;
        case 3u:
          v9 = self->_cgContext;
          objc_msgSend(v6, "value");
          v7 = (CGColor *)objc_claimAutoreleasedReturnValue();
          CGContextSetFillColorWithColor(v9, v7);
LABEL_9:

          break;
        case 4u:
          self->_fillImage = (CGImage *)objc_msgSend(v6, "value");
          break;
        case 5u:
          self->_fillImage = 0;
          break;
        case 6u:
          v10 = self->_cgContext;
          objc_msgSend(v6, "floatValue");
          CGContextSetLineWidth(v10, v11);
          break;
        case 7u:
          objc_msgSend(v6, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
          {
            if (8 * v13 / v13 == 8)
              v14 = (CGFloat *)malloc_type_malloc(8 * v13, 0xD809582AuLL);
            else
              v14 = 0;
            for (j = 0; j != v13; ++j)
            {
              objc_msgSend(v6, "value");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectAtIndex:", j);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "floatValue");
              v14[j] = v25;

            }
          }
          else
          {
            v14 = 0;
          }
          CGContextSetLineDash(self->_cgContext, 0.0, v14, v13);
          free(v14);
          break;
        case 8u:
          v15 = self->_cgContext;
          if (self->_fillImage)
          {
            CGContextSaveGState(self->_cgContext);
            v16 = (const CGPath *)objc_msgSend(v6, "value");
            BoundingBox = CGPathGetBoundingBox(v16);
            x = BoundingBox.origin.x;
            y = BoundingBox.origin.y;
            width = BoundingBox.size.width;
            height = BoundingBox.size.height;
            CGContextAddPath(self->_cgContext, v16);
            CGContextClip(self->_cgContext);
            CGContextScaleCTM(self->_cgContext, 1.0, -1.0);
            v27.origin.y = -height - y;
            v27.origin.x = x;
            v27.size.width = width;
            v27.size.height = height;
            CGContextDrawImage(self->_cgContext, v27, self->_fillImage);
            CGContextRestoreGState(self->_cgContext);
          }
          else
          {
            objc_msgSend(v6, "value");
            v21 = (const CGPath *)objc_claimAutoreleasedReturnValue();
            CGContextAddPath(v15, v21);

            CGContextDrawPath(self->_cgContext, kCGPathFillStroke);
          }
          break;
        default:
          break;
      }

    }
  }
}

- (void)_closeContext
{
  CGContext *cgContext;
  CGContext *v4;
  CGDataConsumer *dataConsumer;

  cgContext = self->_cgContext;
  if (cgContext)
  {
    CGContextEndPage(cgContext);
    v4 = self->_cgContext;
    if (v4)
    {
      CGContextRelease(v4);
      self->_cgContext = 0;
    }
    dataConsumer = self->_dataConsumer;
    if (dataConsumer)
    {
      CGDataConsumerRelease(dataConsumer);
      self->_dataConsumer = 0;
    }
  }
}

- (void)addTransform:(id)a3
{
  CMDrawingAction *v4;
  id v5;

  v5 = a3;
  -[CMDrawingContext _addTransform:](self, "_addTransform:");
  v4 = -[CMDrawingAction initWithType:andValue:]([CMDrawingAction alloc], "initWithType:andValue:", 0, v5);
  -[NSMutableArray addObject:](self->_actions, "addObject:", v4);

}

- (void)_addTransform:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)-[NSAffineTransform copy](self->_currentTransform, "copy");
  -[NSMutableArray addObject:](self->_transforms, "addObject:", v4);
  -[NSAffineTransform prependTransform:](self->_currentTransform, "prependTransform:", v5);

}

- (void)restoreLastTransform
{
  CMDrawingAction *v3;

  -[CMDrawingContext _restoreLastTransform](self, "_restoreLastTransform");
  v3 = -[CMDrawingAction initWithType:andValue:]([CMDrawingAction alloc], "initWithType:andValue:", 1, 0);
  -[NSMutableArray addObject:](self->_actions, "addObject:");

}

- (void)_restoreLastTransform
{
  NSAffineTransform *v3;
  NSAffineTransform *currentTransform;

  -[NSMutableArray lastObject](self->_transforms, "lastObject");
  v3 = (NSAffineTransform *)objc_claimAutoreleasedReturnValue();
  currentTransform = self->_currentTransform;
  self->_currentTransform = v3;

  -[NSMutableArray removeLastObject](self->_transforms, "removeLastObject");
}

- (void)setLineWidth:(float)a3
{
  CMDrawingAction *v5;
  double v6;
  CMDrawingAction *v7;

  v5 = [CMDrawingAction alloc];
  *(float *)&v6 = a3;
  v7 = -[CMDrawingAction initWithType:andFloatValue:](v5, "initWithType:andFloatValue:", 6, v6);
  -[NSMutableArray addObject:](self->_actions, "addObject:");

}

- (void)setLineDash:(id)a3
{
  CMDrawingAction *v4;
  id v5;

  v5 = a3;
  v4 = -[CMDrawingAction initWithType:andValue:]([CMDrawingAction alloc], "initWithType:andValue:", 7, v5);
  -[NSMutableArray addObject:](self->_actions, "addObject:", v4);

}

- (CMDrawableMapper)mapper
{
  return (CMDrawableMapper *)objc_loadWeakRetained((id *)&self->_mapper);
}

- (void)setFillImage:(CGImage *)a3
{
  CMDrawingAction *v5;
  CMDrawingAction *v6;

  v5 = [CMDrawingAction alloc];
  if (a3)
    v6 = -[CMDrawingAction initWithType:andValue:](v5, "initWithType:andValue:", 4, a3);
  else
    v6 = -[CMDrawingAction initWithType:andValue:](v5, "initWithType:andValue:", 5, 0);
  -[NSMutableArray addObject:](self->_actions, "addObject:");

}

- (CGRect)transformRectToGroup:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[CMDrawingContext _transformRect:withTransform:](self, "_transformRect:withTransform:", self->_currentTransform, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6 - self->_frame.origin.x;
  v9 = v8 - self->_frame.origin.y;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v9;
  result.origin.x = v7;
  return result;
}

- (CGContext)_cgContext
{
  return self->_cgContext;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)currentScaleFactor
{
  NSAffineTransform *currentTransform;

  currentTransform = self->_currentTransform;
  if (currentTransform)
    -[NSAffineTransform transformStruct](currentTransform, "transformStruct");
  return sqrt(0.0 * 0.0 + 0.0 * 0.0);
}

- (void)addDebugPath:(CGPath *)a3
{
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  CMDrawingAction *v13;
  CGRect BoundingBox;
  CGRect v15;
  CGRect v16;

  BoundingBox = CGPathGetBoundingBox(a3);
  if (BoundingBox.size.width == 0.0)
    BoundingBox.size.width = 1.0;
  if (BoundingBox.size.height == 0.0)
    BoundingBox.size.height = 1.0;
  -[CMDrawingContext _transformRect:withTransform:](self, "_transformRect:withTransform:", self->_currentTransform, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  if (!CGRectEqualToRect(self->_finalFrame, *MEMORY[0x24BDBF090]))
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v15 = CGRectUnion(self->_finalFrame, v16);
    x = v15.origin.x;
    y = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
  }
  self->_finalFrame.origin.x = x;
  self->_finalFrame.origin.y = y;
  self->_finalFrame.size.width = width;
  self->_finalFrame.size.height = height;
  v13 = -[CMDrawingAction initWithType:andValue:]([CMDrawingAction alloc], "initWithType:andValue:", 8, a3);
  -[NSMutableArray addObject:](self->_actions, "addObject:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_currentTransform, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_destroyWeak((id *)&self->_mapper);
}

@end
