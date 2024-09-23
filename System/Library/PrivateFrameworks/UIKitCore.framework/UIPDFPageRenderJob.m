@implementation UIPDFPageRenderJob

- (BOOL)hasPage
{
  UIPDFPageRenderJob *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_page != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (UIPDFPageRenderJob)initWithPage:(id)a3 maxSize:(CGSize)a4 queuePriority:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  UIPDFPageRenderJob *v9;
  UIPDFPageRenderJob *v10;
  UIPDFPage *v11;
  uint64_t v12;
  uint64_t v13;
  UIPDFPageRenderOperation *v14;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v16.receiver = self;
  v16.super_class = (Class)UIPDFPageRenderJob;
  v9 = -[UIPDFPageRenderJob init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_target = 0;
    v11 = (UIPDFPage *)a3;
    v10->_page = v11;
    v12 = -[UIPDFPage pageNumber](v11, "pageNumber");
    v13 = v12 - 1;
    if (!v12)
      v13 = 0;
    v10->_pageIndex = v13;
    v10->_size.width = width;
    v10->_size.height = height;
    v10->_priority = a5;
    v14 = -[UIPDFPageRenderOperation initWithJob:]([UIPDFPageRenderOperation alloc], "initWithJob:", v10);
    v10->_operation = v14;
    -[UIPDFPageRenderOperation setQueuePriority:](v14, "setQueuePriority:", a5);
    v10->_lock._os_unfair_lock_opaque = 0;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageRenderJob;
  -[UIPDFPageRenderJob dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  UIPDFPageRenderJob *v3;
  _BOOL4 releaseWhenDone;
  UIImage *v5;
  id v6;
  SEL callback;
  id v8;
  id v9;
  int v10;
  UIPDFPageRenderOperation *operation;
  UIImage *image;
  id userData;
  id target;
  id *p_target;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v3 = self;
  if (self->_sendPending && self->_target)
  {
    releaseWhenDone = self->_releaseWhenDone;
    if (self->_callback)
    {
      v5 = self->_image;
      v6 = self->_target;
      callback = self->_callback;
      v8 = self->_userData;
      v3 = self;
      v9 = v8;
      v10 = 1;
    }
    else
    {
      v10 = 0;
      v5 = 0;
      v6 = 0;
      callback = 0;
      v9 = 0;
    }
  }
  else
  {
    v10 = 0;
    v5 = 0;
    v6 = 0;
    callback = 0;
    v9 = 0;
    releaseWhenDone = self->_sendPending && self->_releaseWhenDone;
  }
  operation = v3->_operation;
  if (operation)
  {
    -[UIPDFPageRenderOperation cancel](operation, "cancel");
    v3 = self;
    self->_operation = 0;
  }
  image = v3->_image;
  if (image)
  {

    v3 = self;
  }
  userData = v3->_userData;
  if (userData)
  {

    v3 = self;
  }
  p_target = &v3->_target;
  target = v3->_target;
  if (target)
  {

    v3 = self;
  }
  v3->_image = 0;
  p_target[1] = 0;
  p_target[2] = 0;
  *p_target = 0;
  *((_BYTE *)p_target + 24) = 0;

  self->_page = 0;
  os_unfair_lock_unlock(p_lock);
  if (v10)
  {
    objc_msgSend(v6, "performSelector:withObject:withObject:", callback, v5, v9);

  }
  if (releaseWhenDone)

}

- (void)cancelOperation
{
  os_unfair_lock_s *p_lock;
  UIPDFPageRenderJob *v3;
  _BOOL4 releaseWhenDone;
  UIImage *v5;
  id v6;
  SEL callback;
  id v8;
  id v9;
  int v10;
  UIPDFPageRenderOperation *operation;
  id userData;
  id target;
  id *p_target;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v3 = self;
  if (self->_sendPending && self->_target)
  {
    releaseWhenDone = self->_releaseWhenDone;
    if (self->_callback)
    {
      v5 = self->_image;
      v6 = self->_target;
      callback = self->_callback;
      v8 = self->_userData;
      v3 = self;
      v9 = v8;
      v10 = 1;
    }
    else
    {
      v10 = 0;
      v5 = 0;
      v6 = 0;
      callback = 0;
      v9 = 0;
    }
  }
  else
  {
    v10 = 0;
    v5 = 0;
    v6 = 0;
    callback = 0;
    v9 = 0;
    releaseWhenDone = self->_sendPending && self->_releaseWhenDone;
  }
  operation = v3->_operation;
  if (operation)
  {
    -[UIPDFPageRenderOperation cancel](operation, "cancel");
    v3 = self;
    self->_operation = 0;
  }
  userData = v3->_userData;
  if (userData)
  {

    v3 = self;
  }
  p_target = &v3->_target;
  target = v3->_target;
  if (target)
  {

    v3 = self;
  }
  *p_target = 0;
  p_target[1] = 0;
  *((_BYTE *)p_target + 24) = 0;
  p_target[2] = 0;

  self->_page = 0;
  os_unfair_lock_unlock(p_lock);
  if (v10)
  {
    objc_msgSend(v6, "performSelector:withObject:withObject:", callback, v5, v9);

  }
  if (releaseWhenDone)

}

- (void)cancelOperationForTarget:(id)a3
{
  os_unfair_lock_s *p_lock;
  UIPDFPageRenderJob *v5;
  id *p_target;
  _BOOL4 releaseWhenDone;
  UIImage *v8;
  id v9;
  SEL callback;
  id v11;
  id v12;
  int v13;
  UIPDFPageRenderOperation *operation;
  id userData;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = self;
  p_target = &self->_target;
  if (self->_target != a3)
  {
    os_unfair_lock_unlock(p_lock);
    return;
  }
  if (a3 && self->_sendPending)
  {
    releaseWhenDone = self->_releaseWhenDone;
    if (self->_callback)
    {
      v8 = self->_image;
      v9 = self->_target;
      callback = self->_callback;
      v11 = self->_userData;
      v5 = self;
      v12 = v11;
      v13 = 1;
    }
    else
    {
      v13 = 0;
      v8 = 0;
      v9 = 0;
      callback = 0;
      v12 = 0;
    }
  }
  else
  {
    v13 = 0;
    v8 = 0;
    v9 = 0;
    callback = 0;
    v12 = 0;
    releaseWhenDone = self->_sendPending && self->_releaseWhenDone;
  }
  operation = v5->_operation;
  if (operation)
  {
    -[UIPDFPageRenderOperation cancel](operation, "cancel");
    v5 = self;
    self->_operation = 0;
  }
  userData = v5->_userData;
  if (userData)
  {

    v5 = self;
  }
  if (*p_target)
  {

    v5 = self;
  }
  *p_target = 0;
  self->_callback = 0;
  self->_sendPending = 0;
  self->_userData = 0;

  self->_page = 0;
  os_unfair_lock_unlock(p_lock);
  if (v13)
  {
    objc_msgSend(v9, "performSelector:withObject:withObject:", callback, v8, v12);

    if (!releaseWhenDone)
      return;
LABEL_24:

    return;
  }
  if (releaseWhenDone)
    goto LABEL_24;
}

- (void)setTarget:(id)a3 callback:(SEL)a4 userData:(id)a5
{
  os_unfair_lock_s *p_lock;
  id v10;
  SEL callback;
  id v12;
  int v13;
  id userData;
  id target;
  UIImage *v16;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_sendPending && self->_target && self->_callback)
  {
    v16 = self->_image;
    v10 = self->_target;
    callback = self->_callback;
    v12 = self->_userData;
    v13 = 1;
  }
  else
  {
    v13 = 0;
    v16 = 0;
    v10 = 0;
    callback = 0;
    v12 = 0;
  }
  userData = self->_userData;
  if (userData)

  target = self->_target;
  if (target)

  self->_target = a3;
  self->_callback = a4;
  self->_userData = a5;
  self->_sendPending = 1;
  os_unfair_lock_unlock(p_lock);
  if (v13)
  {
    objc_msgSend(v10, "performSelector:withObject:withObject:", callback, v16, v12);

  }
}

- (void)setOperation:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_operation != a3)
  {
    v6 = a3;

    self->_operation = (UIPDFPageRenderOperation *)a3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (UIPDFPageRenderOperation)operation
{
  os_unfair_lock_s *p_lock;
  UIPDFPageRenderOperation *operation;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  operation = self->_operation;
  os_unfair_lock_unlock(p_lock);
  return operation;
}

- (void)releaseOperation
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  self->_operation = 0;
  os_unfair_lock_unlock(p_lock);
}

- (UIImage)image
{
  os_unfair_lock_s *p_lock;
  UIImage *image;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  image = self->_image;
  os_unfair_lock_unlock(p_lock);
  return image;
}

- (void)renderImage
{
  os_unfair_lock_s *p_lock;
  UIPDFPage *page;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGColorSpace *DeviceRGB;
  CGContext *v14;
  unint64_t v15;
  double v16;
  double v17;
  CGPDFPage *v18;
  UIPDFPageRenderJob *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  CGImage *Image;
  UIImage *v27;
  UIImage *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGAffineTransform transform;
  CGAffineTransform v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v36 = *MEMORY[0x1E0C80C00];
  if (self->_page)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    page = self->_page;
    if (page)
    {
      v5 = trunc(self->_size.width);
      v6 = trunc(self->_size.height);
      v7 = 1.0;
      if (v5 >= 1.0)
        v8 = v5;
      else
        v8 = 1.0;
      if (v6 >= 1.0)
        v9 = v6;
      else
        v9 = 1.0;
      -[UIPDFPage cropBoxAccountForRotation](page, "cropBoxAccountForRotation");
      if (v10 <= 0.0)
        v12 = 1.0;
      else
        v12 = v8 / v10;
      if (v11 > 0.0)
        v7 = v9 / v11;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v14 = CGBitmapContextCreate(0, (unint64_t)v8, (unint64_t)v9, 8uLL, 0, DeviceRGB, 0x4001u);
      CGContextSetFillColorWithColor(v14, -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
      v37.origin.x = 0.0;
      v37.origin.y = 0.0;
      v37.size.width = v8;
      v37.size.height = v9;
      CGContextFillRect(v14, v37);
      CGContextScaleCTM(v14, v12, v7);
      v15 = -[UIPDFPage rotation](self->_page, "rotation");
      if (v15)
      {
        memset(&v34, 0, sizeof(v34));
        CGAffineTransformMakeRotation(&v34, (double)v15 * -0.0174532925);
        -[UIPDFPage cropBox](self->_page, "cropBox");
        transform = v34;
        v39 = CGRectApplyAffineTransform(v38, &transform);
        CGContextTranslateCTM(v14, -v39.origin.x, -v39.origin.y);
        transform = v34;
        CGContextConcatCTM(v14, &transform);
      }
      else
      {
        -[UIPDFPage cropBox](self->_page, "cropBox");
        CGContextTranslateCTM(v14, -v16, -v17);
      }
      v18 = CGPDFPageRetain(-[UIPDFPage CGPage](self->_page, "CGPage"));
      v19 = self;
      os_unfair_lock_unlock(p_lock);
      CGContextDrawPDFPageWithProgressCallback();
      CGPDFPageRelease(v18);
      if (self->_userData)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(self->_userData, "objectForKey:", kUIPDFPageRenderAnnotationToImage))
          {
            v20 = -[UIPDFPage annotations](self->_page, "annotations");
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v30;
              do
              {
                v24 = 0;
                do
                {
                  if (*(_QWORD *)v30 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v24);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    objc_msgSend(v25, "drawInContext:", v14);
                  ++v24;
                }
                while (v22 != v24);
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
              }
              while (v22);
            }
          }
        }
      }
      os_unfair_lock_lock(p_lock);
      if (self->_page)
        Image = CGBitmapContextCreateImage(v14);
      else
        Image = 0;
      CGContextRelease(v14);
      CGColorSpaceRelease(DeviceRGB);
      if (Image)
        v27 = -[UIImage initWithCGImage:]([UIImage alloc], "initWithCGImage:", Image);
      else
        v27 = 0;
      v28 = self->_image;
      if (v28)

      self->_image = v27;
      self->_page = 0;

      os_unfair_lock_unlock(p_lock);
      CGImageRelease(Image);
    }
    else
    {
      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (void)sendImage
{
  os_unfair_lock_s *p_lock;
  UIPDFPageRenderJob *v3;
  _BOOL4 releaseWhenDone;
  UIImage *v5;
  id v6;
  SEL callback;
  id v8;
  int v9;
  id userData;
  id target;
  id *p_target;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v3 = self;
  if (self->_sendPending && self->_target)
  {
    releaseWhenDone = self->_releaseWhenDone;
    if (self->_callback)
    {
      v5 = self->_image;
      v6 = self->_target;
      callback = self->_callback;
      v8 = self->_userData;
      v3 = self;
      v9 = 1;
    }
    else
    {
      v9 = 0;
      v5 = 0;
      v6 = 0;
      callback = 0;
      v8 = 0;
    }
  }
  else
  {
    v9 = 0;
    v5 = 0;
    v6 = 0;
    callback = 0;
    v8 = 0;
    releaseWhenDone = self->_sendPending && self->_releaseWhenDone;
  }
  userData = v3->_userData;
  if (userData)
  {

    v3 = self;
  }
  p_target = &v3->_target;
  target = v3->_target;
  if (target)

  *p_target = 0;
  p_target[1] = 0;
  *((_BYTE *)p_target + 24) = 0;
  p_target[2] = 0;
  os_unfair_lock_unlock(p_lock);
  if (v9)
  {
    objc_msgSend(v6, "performSelector:withObject:withObject:", callback, v5, v8);

  }
  if (releaseWhenDone)

}

- (void)sendImageTo:(id)a3 callback:(SEL)a4 userData:(id)a5
{
  os_unfair_lock_s *p_lock;
  UIImage *image;
  UIImage *v11;
  id target;
  SEL callback;
  id v14;
  int v15;
  id userData;
  id v17;
  UIPDFPageRenderOperation *operation;
  UIImage *v19;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  image = self->_image;
  if (image)
  {
    v19 = self->_image;
    v11 = image;
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(a3, "performSelector:withObject:withObject:", a4, v19, a5);
LABEL_16:

    return;
  }
  if (self->_sendPending && (target = self->_target) != 0 && self->_callback)
  {
    v19 = (UIImage *)target;
    callback = self->_callback;
    v14 = self->_userData;
    v15 = 1;
  }
  else
  {
    v15 = 0;
    v19 = 0;
    callback = 0;
    v14 = 0;
  }
  userData = self->_userData;
  if (userData)

  v17 = self->_target;
  if (v17)

  self->_target = a3;
  self->_callback = a4;
  self->_userData = a5;
  self->_sendPending = 1;
  operation = self->_operation;
  if (!operation || -[UIPDFPageRenderOperation isExecuting](operation, "isExecuting"))
  {
    os_unfair_lock_unlock(p_lock);
    if (!v15)
      return;
    goto LABEL_15;
  }
  -[UIPDFPageRenderOperation setQueuePriority:](self->_operation, "setQueuePriority:", 4);
  os_unfair_lock_unlock(p_lock);
  if ((v15 & 1) != 0)
  {
LABEL_15:
    -[UIImage performSelector:withObject:withObject:](v19, "performSelector:withObject:withObject:", callback, 0, v14);

    goto LABEL_16;
  }
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)releaseWhenDone
{
  return self->_releaseWhenDone;
}

- (void)setReleaseWhenDone:(BOOL)a3
{
  self->_releaseWhenDone = a3;
}

- (CGSize)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

@end
