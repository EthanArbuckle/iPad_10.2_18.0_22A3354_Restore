@implementation TCMPSHorizontalFlipAugmenter

- (TCMPSHorizontalFlipAugmenter)init
{
  TCMPSHorizontalFlipAugmenter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCMPSHorizontalFlipAugmenter;
  result = -[TCMPSHorizontalFlipAugmenter init](&v3, sel_init);
  if (result)
    result->_skipProbability = 0.5;
  return result;
}

- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4
{
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (*((double (**)(id, double, double))a4 + 2))(a4, 0.0, 1.0);
  -[TCMPSHorizontalFlipAugmenter skipProbability](self, "skipProbability");
  if (v7 >= v8)
  {
    memset(&v28, 0, sizeof(v28));
    CGAffineTransformMakeScale(&v28, -1.0, 1.0);
    v9 = (id)objc_opt_new();
    objc_msgSend(v6, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v28;
    objc_msgSend(v10, "imageByApplyingTransform:", &v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v11);

    objc_msgSend(v6, "bounds");
    v27 = v28;
    v32 = CGRectApplyAffineTransform(v31, &v27);
    objc_msgSend(v9, "setBounds:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    v12 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v6, "annotations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v6, "annotations", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v21 = (void *)objc_msgSend(v20, "copy");
          objc_msgSend(v20, "boundingBox");
          v27 = v28;
          v34 = CGRectApplyAffineTransform(v33, &v27);
          objc_msgSend(v21, "setBoundingBox:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v17);
    }

    objc_msgSend(v9, "setAnnotations:", v14);
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (double)skipProbability
{
  return self->_skipProbability;
}

- (void)setSkipProbability:(double)a3
{
  self->_skipProbability = a3;
}

@end
