@implementation _TVMonogramResourceImageGenerator

+ (BOOL)isResourceURL:(id)a3
{
  return objc_msgSend(a3, "tv_isResourceURL");
}

+ (id)tintImage:(id)a3 withColor:(id)a4
{
  id v5;
  id v6;
  double v7;
  CGFloat v8;
  CGFloat height;
  CGContext *CurrentContext;
  CGFloat v11;
  id v12;
  CGImage *v13;
  CGContext *v14;
  CGImage *Image;
  id v16;
  uint64_t v17;
  void *v18;
  CGSize v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (a4)
  {
    v5 = a4;
    v6 = a3;
    objc_msgSend(v6, "size");
    v8 = v7;
    objc_msgSend(v6, "size");
    height = v20.height;
    v20.width = v8;
    UIGraphicsBeginImageContext(v20);
    CurrentContext = UIGraphicsGetCurrentContext();
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = v8;
    v21.size.height = height;
    v11 = CGRectGetHeight(v21);
    CGContextTranslateCTM(CurrentContext, 0.0, v11);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    v12 = objc_retainAutorelease(v6);
    v13 = (CGImage *)objc_msgSend(v12, "CGImage");
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = v8;
    v22.size.height = height;
    CGContextClipToMask(CurrentContext, v22, v13);
    objc_msgSend(v5, "setFill");

    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = v8;
    v23.size.height = height;
    UIRectFill(v23);
    v14 = UIGraphicsGetCurrentContext();
    Image = CGBitmapContextCreateImage(v14);
    v16 = objc_alloc(MEMORY[0x24BDF6AC8]);
    v17 = objc_msgSend(v12, "imageOrientation");

    v18 = (void *)objc_msgSend(v16, "initWithCGImage:imageOrientation:", Image, v17);
    UIGraphicsEndImageContext();
    CGImageRelease(Image);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v31[4];
  id v32;
  id v33;
  _TVMonogramResourceImageGenerator *v34;
  id v35;
  id v36;
  uint64_t *v37;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v12 = a3;
  v13 = a7;
  v14 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v12;
  else
    v15 = 0;
  v16 = v15;
  v17 = v16;
  if (v16)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__8;
    v43 = __Block_byref_object_dispose__8;
    v44 = 0;
    objc_msgSend(v16, "imageURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "tv_isResourceURL"))
    {
      objc_msgSend(v13, "recordForResource:withInitiator:", 3, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "willSendRequest:", v20);

      objc_msgSend(v18, "tv_resourceName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = a6 == 1;
      v23 = (void *)MEMORY[0x24BDD1478];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __125___TVMonogramResourceImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
      v31[3] = &unk_24EB881A8;
      v37 = &v39;
      v24 = v21;
      v32 = v24;
      v38 = v22;
      v33 = v17;
      v34 = self;
      v25 = v19;
      v35 = v25;
      v36 = v14;
      objc_msgSend(v23, "blockOperationWithBlock:", v31);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v40[5];
      v40[5] = v26;

      -[_TVMonogramImageGenerator imageGeneratorQueue](self, "imageGeneratorQueue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addOperation:", v40[5]);

    }
    v29 = (id)v40[5];

    _Block_object_dispose(&v39, 8);
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)cancelLoad:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "cancel");

}

@end
