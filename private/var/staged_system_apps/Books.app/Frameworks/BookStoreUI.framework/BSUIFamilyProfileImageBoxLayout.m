@implementation BSUIFamilyProfileImageBoxLayout

- (void)computeLayout
{
  double v3;
  double v4;
  double v5;

  -[BSUIFamilyProfileImageBoxLayout computeWidth](self, "computeWidth");
  v4 = v3;
  -[BSUIFamilyProfileImageBoxLayout computeHeight](self, "computeHeight");
  -[BSUIFamilyProfileImageBoxLayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v5);
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BSUIFamilyProfileImageLayerConfig *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _BSUIFamilyProfileImageLayerConfig *v18;
  id v19;
  void *v20;
  void *v21;

  v5 = a4;
  -[BSUIFamilyProfileImageBoxLayout computedNaturalSize](self, "computedNaturalSize");
  v7 = v6;
  v9 = v8;
  v10 = [_BSUIFamilyProfileImageLayerConfig alloc];
  objc_msgSend(v5, "contentsScale");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFamilyProfileImageBoxLayout box](self, "box"));
  objc_msgSend(v13, "cornerRadius");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFamilyProfileImageBoxLayout box](self, "box"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "urlString"));
  v18 = -[_BSUIFamilyProfileImageLayerConfig initWithSize:contentsScale:cornerRadius:urlString:](v10, "initWithSize:contentsScale:cornerRadius:urlString:", v17, v7, v9, v12, v15);

  v19 = objc_msgSend(objc_alloc((Class)TUIRenderModelLayer), "initWithSubmodels:config:erasableInsets:", 0, v18, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  objc_msgSend(v19, "setSize:", v7, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFamilyProfileImageBoxLayout box](self, "box"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
  objc_msgSend(v19, "setIdentifier:", v21);

  return v19;
}

@end
