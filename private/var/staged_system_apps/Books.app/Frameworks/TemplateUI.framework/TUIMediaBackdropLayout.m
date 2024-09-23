@implementation TUIMediaBackdropLayout

- (TUIMediaBackdropLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  TUIMediaBackdropLayout *v5;
  TUIMediaBackdropLayout *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIMediaBackdropLayout;
  v5 = -[TUILayout initWithModel:parent:controller:](&v8, "initWithModel:parent:controller:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[TUILayout setSpecifiedWidthComputeInherited:](v5, "setSpecifiedWidthComputeInherited:", 1);
    -[TUILayout setSpecifiedHeightComputeInherited:](v6, "setSpecifiedHeightComputeInherited:", 1);
  }
  return v6;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  TUIImageLayerConfig *v26;
  TUIRenderModelLayer *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  void *v32;
  void *v33;
  TUIImageLayerConfig *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;

  if (a3 < 3)
    return 0;
  v5 = a4;
  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v5);
  v7 = v6;
  v9 = v8;
  v39 = -[TUIMediaBackdropLayout _newImageResourcesWithContext:](self, "_newImageResourcesWithContext:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "url"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v36 = TUIResourceLoadForURL(v10, (uint64_t)objc_msgSend(v11, "load"));

  v34 = [TUIImageLayerConfig alloc];
  objc_msgSend(v5, "contentsScale");
  v13 = v12;

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v38, "cornerRadius");
  v15 = v14;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fallbackColor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "contentsGravity"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v17 = objc_msgSend(v16, "crossfadesContents");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v18, "opacity");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  LOBYTE(v10) = objc_msgSend(v21, "continuousCorners");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v23 = objc_msgSend(v22, "shouldRasterize");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "blendMode"));
  BYTE1(v31) = v23;
  LOBYTE(v31) = (_BYTE)v10;
  v26 = -[TUIImageLayerConfig initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:](v34, "initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:", v39, v36, v33, v32, 0, v17, v13, v15, v20, v31, v25);

  v27 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v26, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  -[TUIRenderModelLayer setSize:](v27, "setSize:", v7, v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
  -[TUIRenderModelLayer setIdentifier:](v27, "setIdentifier:", v29);

  return v27;
}

- (id)_newImageResourcesWithContext:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v32;

  v4 = a3;
  -[TUILayout computedNaturalSize](self, "computedNaturalSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "contentsScale");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "manager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageResourceCache"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "urlString"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v17 = v16;
  if (v15)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "urlString"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "baseURL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageResourceForTemplatedURL:baseURL:naturalSize:contentsScale:", v18, v20, v6, v8, v10));
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "resourceKind"));

    if (!v22)
    {
LABEL_7:
      v30 = 0;
      goto LABEL_8;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resourceKind"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "resourceInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "resourceOptions"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageResourceForKind:naturalSize:contentsScale:instance:options:", v19, v32, v24, v6, v8, v10));

  }
  if (!v21)
    goto LABEL_7;
  -[TUILayout computedNaturalSize](self, "computedNaturalSize");
  v26 = v25;
  v28 = v27;
  objc_msgSend(v4, "contentsScale");
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mediaBackdropImageResourceFrom:naturalSize:contentScale:", v21, v26, v28, v29));

LABEL_8:
  return v30;
}

@end
