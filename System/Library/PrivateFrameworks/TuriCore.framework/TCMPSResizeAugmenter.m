@implementation TCMPSResizeAugmenter

- (TCMPSResizeAugmenter)initWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  TCMPSResizeAugmenter *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)TCMPSResizeAugmenter;
  result = -[TCMPSResizeAugmenter init](&v6, sel_init);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
  }
  return result;
}

- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CGAffineTransform v39;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[TCMPSResizeAugmenter size](self, "size");
  v16 = v15 / v12;
  -[TCMPSResizeAugmenter size](self, "size");
  memset(&v42, 0, sizeof(v42));
  v17 = -v8;
  v19 = v18 / v14;
  CGAffineTransformMakeTranslation(&t1, v17, -v10);
  CGAffineTransformMakeScale(&t2, v16, v19);
  CGAffineTransformConcat(&v42, &t1, &t2);
  objc_msgSend(v5, "image");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v42;
  objc_msgSend(v20, "imageByApplyingTransform:", &v39);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v21);

  objc_msgSend(v6, "image");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageBySamplingLinear");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v23);

  objc_msgSend(v5, "bounds");
  v39 = v42;
  v46 = CGRectApplyAffineTransform(v45, &v39);
  objc_msgSend(v6, "setBounds:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
  v24 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v5, "annotations");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayWithCapacity:", objc_msgSend(v25, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v5, "annotations", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v33 = (void *)objc_msgSend(v32, "copy");
        objc_msgSend(v32, "boundingBox");
        v39 = v42;
        v48 = CGRectApplyAffineTransform(v47, &v39);
        objc_msgSend(v33, "setBoundingBox:", v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);
        objc_msgSend(v26, "addObject:", v33);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v29);
  }

  objc_msgSend(v6, "setAnnotations:", v26);
  return v6;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
