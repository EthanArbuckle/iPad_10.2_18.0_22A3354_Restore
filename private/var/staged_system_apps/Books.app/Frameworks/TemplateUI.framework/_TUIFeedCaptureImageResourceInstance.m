@implementation _TUIFeedCaptureImageResourceInstance

- (_TUIFeedCaptureImageResourceInstance)initWithDictionary:(id)a3
{
  id v4;
  _TUIFeedCaptureImageResourceInstance *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  CGFloat v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  double v35;
  CGFloat v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  double v42;
  CGFloat v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  double v49;
  CGFloat v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  double v56;
  CGFloat v57;
  void *v58;
  void *v59;
  TUIImageResourceCacheKey *v60;
  TUIImageResourceCacheKey *unsizedKey;
  uint64_t v62;
  TUIImageResourceCacheKey *sizedKey;
  objc_super v65;

  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)_TUIFeedCaptureImageResourceInstance;
  v5 = -[_TUIFeedCaptureImageResourceInstance init](&v65, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intrinsicSize")));
    v8 = objc_opt_class(NSDictionary, v7);
    v9 = TUIDynamicCast(v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = objc_opt_class(NSNumber, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("width")));
    v14 = TUIDynamicCast(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    v19 = objc_opt_class(NSNumber, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("height")));
    v21 = TUIDynamicCast(v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    v5->_intrinsicSize.width = v17;
    v5->_intrinsicSize.height = v24;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("insets")));
    v27 = objc_opt_class(NSDictionary, v26);
    v28 = TUIDynamicCast(v27, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v31 = objc_opt_class(NSNumber, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("top")));
    v33 = TUIDynamicCast(v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    objc_msgSend(v34, "doubleValue");
    v36 = v35;

    v38 = objc_opt_class(NSNumber, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("left")));
    v40 = TUIDynamicCast(v38, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    objc_msgSend(v41, "doubleValue");
    v43 = v42;

    v45 = objc_opt_class(NSNumber, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("bottom")));
    v47 = TUIDynamicCast(v45, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    objc_msgSend(v48, "doubleValue");
    v50 = v49;

    v52 = objc_opt_class(NSNumber, v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("right")));
    v54 = TUIDynamicCast(v52, v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    objc_msgSend(v55, "doubleValue");
    v57 = v56;

    v5->_insets.top = v36;
    v5->_insets.left = v43;
    v5->_insets.bottom = v50;
    v5->_insets.right = v57;

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "UUIDString"));

    v60 = -[TUIImageResourceCacheKey initWithID:]([TUIImageResourceCacheKey alloc], "initWithID:", v59);
    unsizedKey = v5->_unsizedKey;
    v5->_unsizedKey = v60;

    v62 = objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey cacheKeyWithSize:](v5->_unsizedKey, "cacheKeyWithSize:", v5->_intrinsicSize.width, v5->_intrinsicSize.height));
    sizedKey = v5->_sizedKey;
    v5->_sizedKey = (TUIImageResourceCacheKey *)v62;

  }
  return v5;
}

- (id)debugFunctionalDescription
{
  return &stru_243BF0;
}

- (TUIResource)resource
{
  return 0;
}

- (TUIImageResourceCacheKey)sizedKey
{
  return self->_sizedKey;
}

- (TUIImageResourceCacheKey)unsizedKey
{
  return self->_unsizedKey;
}

- (BOOL)isImageLoaded
{
  return 0;
}

- (BOOL)isImageLoading
{
  return 0;
}

- (NSURL)url
{
  return 0;
}

- (id)loadImage
{
  return 0;
}

- (id)imageContentWithOptions:(unint64_t)a3
{
  TUIImageContent *v3;

  if ((a3 & 2) != 0)
    v3 = -[TUIImageContent initWithIntrinsicSize:flags:]([TUIImageContent alloc], "initWithIntrinsicSize:flags:", 0, self->_intrinsicSize.width, self->_intrinsicSize.height);
  else
    v3 = 0;
  return v3;
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicSize.width;
  height = self->_intrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)contentsScale
{
  return 1.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizedKey, 0);
  objc_storeStrong((id *)&self->_unsizedKey, 0);
}

@end
