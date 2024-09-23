@implementation _UICAMLPackageView

- (_UICAMLPackageView)initWithPackageName:(id)a3 inBundle:(id)a4
{
  void *v5;
  _UICAMLPackageView *v6;

  objc_msgSend(a4, "URLForResource:withExtension:", a3, CFSTR("ca"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UICAMLPackageView initWithURL:](self, "initWithURL:", v5);

  return v6;
}

- (_UICAMLPackageView)initWithURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _UICAMLPackageView *v9;
  _UICAMLPackageView *v10;
  id *p_rootLayer;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSDictionary *publishedObjectMap;
  uint64_t v25;
  CAStateController *stateController;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CD3078];
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v4, v5, 0, &v35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v35;
  objc_msgSend(v6, "rootLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v34.receiver = self;
  v34.super_class = (Class)_UICAMLPackageView;
  v9 = -[UIView initWithFrame:](&v34, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    v28 = v7;
    v29 = v4;
    p_rootLayer = (id *)&v9->_rootLayer;
    objc_storeStrong((id *)&v9->_rootLayer, v8);
    objc_msgSend(v8, "frame");
    v10->_originalSize.width = v12;
    v10->_originalSize.height = v13;
    objc_msgSend(*p_rootLayer, "setGeometryFlipped:", objc_msgSend(v6, "isGeometryFlipped"));
    -[UIView layer](v10, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", *p_rootLayer);

    objc_msgSend(v6, "publishedObjectNames");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v15);
          v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v6, "publishedObjectWithName:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            if (!v18)
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
            objc_msgSend(v18, "setObject:forKey:", v22, v21);
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }
    v23 = objc_msgSend(v18, "copy");
    publishedObjectMap = v10->_publishedObjectMap;
    v10->_publishedObjectMap = (NSDictionary *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD2868]), "initWithLayer:", v10->_rootLayer);
    stateController = v10->_stateController;
    v10->_stateController = (CAStateController *)v25;

    v7 = v28;
    v4 = v29;
  }

  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_originalSize.width;
  height = self->_originalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CALayer *rootLayer;
  CATransform3D v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICAMLPackageView;
  -[UIView layoutSubviews](&v8, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  if (v3 / self->_originalSize.width >= v4 / self->_originalSize.height)
    v5 = v4 / self->_originalSize.height;
  else
    v5 = v3 / self->_originalSize.width;
  -[CALayer setPosition:](self->_rootLayer, "setPosition:", v3 * 0.5, v4 * 0.5);
  rootLayer = self->_rootLayer;
  CATransform3DMakeScale(&v7, v5, v5, 1.0);
  -[CALayer setTransform:](rootLayer, "setTransform:", &v7);
}

- (id)publishedObjectWithName:(id)a3
{
  return -[NSDictionary objectForKey:](self->_publishedObjectMap, "objectForKey:", a3);
}

- (NSArray)publishedObjectNames
{
  return -[NSDictionary allKeys](self->_publishedObjectMap, "allKeys");
}

- (BOOL)setState:(id)a3
{
  return -[_UICAMLPackageView setState:animated:](self, "setState:animated:", a3, 1);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  CAStateController *stateController;
  CALayer *rootLayer;

  v4 = a4;
  -[CALayer stateWithName:](self->_rootLayer, "stateWithName:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    stateController = self->_stateController;
    rootLayer = self->_rootLayer;
    if (v4)
    {
      LODWORD(v7) = 1.0;
      -[CAStateController setState:ofLayer:transitionSpeed:](stateController, "setState:ofLayer:transitionSpeed:", v6, rootLayer, v7);
    }
    else
    {
      -[CAStateController setState:ofLayer:](stateController, "setState:ofLayer:", v6, rootLayer);
    }
  }

  return v6 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishedObjectMap, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end
