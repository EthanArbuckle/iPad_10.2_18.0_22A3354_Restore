@implementation _TUIFeedCaptureSection

- (_TUIFeedCaptureSection)initWithEntry:(id)a3 bindings:(id)a4 template:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TUIFeedCaptureSection *v12;
  _TUIFeedCaptureSection *v13;
  NSMutableArray *v14;
  NSMutableArray *dynamicStates;
  NSMutableArray *v16;
  NSMutableArray *imageResources;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_TUIFeedCaptureSection;
  v12 = -[_TUIFeedCaptureSection init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entry, a3);
    objc_storeStrong((id *)&v13->_bindings, a4);
    objc_storeStrong((id *)&v13->_aTemplate, a5);
    v14 = objc_opt_new(NSMutableArray);
    dynamicStates = v13->_dynamicStates;
    v13->_dynamicStates = v14;

    v16 = objc_opt_new(NSMutableArray);
    imageResources = v13->_imageResources;
    v13->_imageResources = v16;

  }
  return v13;
}

- (void)captureDynamicState:(id)a3 forKind:(id)a4 instance:(id)a5 parameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TUIFeedCaptureDynamicState *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[_TUIFeedCaptureDynamicState initWithValue:kind:instance:parameters:]([_TUIFeedCaptureDynamicState alloc], "initWithValue:kind:instance:parameters:", v13, v12, v11, v10);

  -[NSMutableArray addObject:](self->_dynamicStates, "addObject:", v14);
}

- (void)captureImageResource:(id)a3 forKind:(id)a4 naturalSize:(CGSize)a5 contentsScale:(double)a6 instance:(id)a7 options:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  id v18;
  _TUIFeedCaptureImageResource *v19;

  height = a5.height;
  width = a5.width;
  v15 = a8;
  v16 = a7;
  v17 = a4;
  v18 = a3;
  v19 = -[_TUIFeedCaptureImageResource initWithResource:kind:naturalSize:contentsScale:instance:options:]([_TUIFeedCaptureImageResource alloc], "initWithResource:kind:naturalSize:contentsScale:instance:options:", v18, v17, v16, v15, width, height, a6);

  -[NSMutableArray addObject:](self->_imageResources, "addObject:", v19);
}

- (void)captureIntrinsicImageResource:(id)a3 forKind:(id)a4 instance:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TUIFeedCaptureImageResource *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[_TUIFeedCaptureImageResource initWithResource:kind:instance:options:]([_TUIFeedCaptureImageResource alloc], "initWithResource:kind:instance:options:", v13, v12, v11, v10);

  -[NSMutableArray addObject:](self->_imageResources, "addObject:", v14);
}

- (id)dictionaryRepresentation
{
  NSMutableDictionary *v3;
  NSMutableSet *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = objc_opt_new(NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIBindings data](self->_bindings, "data"));
  v6 = sub_72DD8(v5, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("bindings"));

  if (-[NSMutableSet count](v4, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v4, "allObjects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingSelector:", "compare:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, CFSTR("bindingsDynamicKeyPaths"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplate package](self->_aTemplate, "package"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "url"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByDeletingLastPathComponent"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByDeletingLastPathComponent"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplate package](self->_aTemplate, "package"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "url"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplate url](self->_aTemplate, "url"));
  v17 = sub_72EE0(v15, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v18, CFSTR("package"));

  v19 = sub_72EE0(v16, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v20, CFSTR("template"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry stackNames](self->_entry, "stackNames"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allObjects"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v22, CFSTR("stackNames"));

  return v3;
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (TUIBindings)bindings
{
  return self->_bindings;
}

- (TUITemplate)aTemplate
{
  return self->_aTemplate;
}

- (NSMutableArray)dynamicStates
{
  return self->_dynamicStates;
}

- (NSMutableArray)imageResources
{
  return self->_imageResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageResources, 0);
  objc_storeStrong((id *)&self->_dynamicStates, 0);
  objc_storeStrong((id *)&self->_aTemplate, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
