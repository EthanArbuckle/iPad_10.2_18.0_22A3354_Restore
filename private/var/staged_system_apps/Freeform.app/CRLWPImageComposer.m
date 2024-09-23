@implementation CRLWPImageComposer

- (CRLWPImageComposer)initWithBaseImage:(id)a3 screenScale:(double)a4
{
  id v6;
  CRLWPImageComposer *v7;
  double v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLWPImageComposer;
  v7 = -[CRLWPImageComposer init](&v11, "init");
  if (v7)
  {
    objc_msgSend(v6, "scale");
    if (v8 != a4)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", objc_msgSend(v6, "CGImageForContentsScale:", a4)));

      v6 = (id)v9;
    }
    objc_storeStrong((id *)&v7->_baseImage, v6);
    objc_storeStrong((id *)&v7->_compositedImage, v6);
    v7->_screenScale = a4;
  }

  return v7;
}

- (id)overlayImage:(id)a3 usingFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGContext *v45;
  void *v46;
  CGImage *v47;
  CGImage *v48;
  CGImage *Image;
  void *v50;
  void *v51;
  CGFloat v53;
  CGFloat v54;
  CGRect v55;
  CGRect v56;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  if (sub_10006178C(x, y, width, height))
  {
    objc_msgSend(v9, "scale");
    v11 = v10;
    -[CRLWPImageComposer screenScale](self, "screenScale");
    if (v11 != v12)
    {
      -[CRLWPImageComposer screenScale](self, "screenScale");
      v13 = objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", objc_msgSend(v9, "CGImageForContentsScale:")));

      v9 = (id)v13;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPImageComposer compositedImage](self, "compositedImage"));
    objc_msgSend(v14, "size");
    v15 = sub_10005FDDC();
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPImageComposer compositedImage](self, "compositedImage"));
    objc_msgSend(v22, "scale");
    v24 = sub_100060FD8(v15, v17, v19, v21, v23);
    v53 = v25;
    v54 = v24;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPImageComposer compositedImage](self, "compositedImage"));
    objc_msgSend(v31, "scale");
    v33 = sub_100060FD8(x, y, width, height, v32);
    v35 = v34;
    v37 = v36;
    v39 = v38;

    v40 = sub_100060C2C(v24, v26, v28, v30, v33, v35, v37, v39);
    v42 = v41;
    v45 = sub_10040FA64(3, v43, v44);
    CGContextTranslateCTM(v45, -v40, -v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPImageComposer compositedImage](self, "compositedImage"));
    v47 = (CGImage *)objc_msgSend(v46, "CGImage");
    v55.origin.y = v53;
    v55.origin.x = v54;
    v55.size.width = v28;
    v55.size.height = v30;
    CGContextDrawImage(v45, v55, v47);

    -[CRLWPImageComposer screenScale](self, "screenScale");
    v48 = (CGImage *)objc_msgSend(v9, "CGImageForContentsScale:");
    v56.origin.x = v33;
    v56.origin.y = v35;
    v56.size.width = v37;
    v56.size.height = v39;
    CGContextDrawImage(v45, v56, v48);
    Image = CGBitmapContextCreateImage(v45);
    CGContextRelease(v45);
    -[CRLWPImageComposer screenScale](self, "screenScale");
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:scale:orientation:](CRLImage, "imageWithCGImage:scale:orientation:", Image, 0));
    CGImageRelease(Image);
    -[CRLWPImageComposer setCompositedImage:](self, "setCompositedImage:", v50);
  }
  else
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_10124F618);
    v51 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEBUG))
      sub_100E1D138(v51, x, y, width, height);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPImageComposer compositedImage](self, "compositedImage"));
  }

  return v50;
}

- (CRLImage)compositedImage
{
  return self->_compositedImage;
}

- (void)setCompositedImage:(id)a3
{
  objc_storeStrong((id *)&self->_compositedImage, a3);
}

- (CRLImage)baseImage
{
  return self->_baseImage;
}

- (void)setBaseImage:(id)a3
{
  objc_storeStrong((id *)&self->_baseImage, a3);
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImage, 0);
  objc_storeStrong((id *)&self->_compositedImage, 0);
}

@end
