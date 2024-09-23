@implementation BSUIGoalsSharableImageRenderer

- (BSUIGoalsSharableImageRenderer)initWithOptions:(id)a3 completion:(id)a4 traitCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  BSUIGoalsSharableImageRenderer *v11;
  BSUIGoalsSharableImageRenderer *v12;
  BSUIDynamicValue *v13;
  BSUIDynamicValue *v14;
  BSUIDynamicValue *currentStackName;
  JSAFeedController *v16;
  JSAFeedController *jsFeedController;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  objc_super v52;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v52.receiver = self;
  v52.super_class = (Class)BSUIGoalsSharableImageRenderer;
  v11 = -[BSUIGoalsSharableImageRenderer init](&v52, "init");
  v12 = v11;
  if (!v8 || !v11)
    goto LABEL_10;
  v13 = [BSUIDynamicValue alloc];
  v14 = -[BSUIDynamicValue initWithValue:options:](v13, "initWithValue:options:", TUIFeedContentDefaultStackName, v8);
  currentStackName = v12->_currentStackName;
  v12->_currentStackName = v14;

  v16 = (JSAFeedController *)objc_msgSend(objc_alloc((Class)JSAFeedController), "initWithOptions:completion:", v8, v9);
  jsFeedController = v12->_jsFeedController;
  v12->_jsFeedController = v16;

  objc_storeStrong((id *)&v12->_traitCollection, a5);
  v19 = objc_opt_class(NSNumber, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("shareableImageWidth")));
  v21 = BUDynamicCast(v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v24 = objc_opt_class(NSNumber, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("shareableImageHeight")));
  v26 = BUDynamicCast(v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  if (v22)
  {
    if (v27)
      goto LABEL_6;
    goto LABEL_5;
  }
  v49 = objc_opt_class(NSNumber, v28);
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("width")));
  v51 = BUDynamicCast(v49, v50);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v51);

  if (!v27)
  {
LABEL_5:
    v29 = objc_opt_class(NSNumber, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("height")));
    v31 = BUDynamicCast(v29, v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v31);

  }
LABEL_6:
  objc_msgSend(v22, "doubleValue");
  v33 = v32;
  objc_msgSend(v27, "doubleValue");
  v35 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("style")));
  v12->_useDarkStyle = objc_msgSend(v36, "isEqualToString:", CFSTR("dark"));

  v12->_viewSize.width = v33;
  v12->_viewSize.height = v35;
  v38 = objc_opt_class(NSNumber, v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("shareableImageScale")));
  v40 = BUDynamicCast(v38, v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

  if (v41
    || (v43 = objc_opt_class(NSNumber, v42),
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("scale"))),
        v45 = BUDynamicCast(v43, v44),
        v41 = (void *)objc_claimAutoreleasedReturnValue(v45),
        v44,
        v41))
  {
    objc_msgSend(v41, "doubleValue");
    v47 = v46;

  }
  else
  {
    v47 = 1.0;
  }
  v12->_scale = v47;

LABEL_10:
  return v12;
}

- (void)renderSharableImage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BSUIGoalsSharableImageRenderer jsFeedController](self, "jsFeedController"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[BSUIGoalsSharableImageRenderer feedContentLoadingState](self, "feedContentLoadingState");

    if (!v7)
    {
      objc_initWeak(&location, self);
      -[BSUIGoalsSharableImageRenderer setFeedContentLoadingState:](self, "setFeedContentLoadingState:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIGoalsSharableImageRenderer jsFeedController](self, "jsFeedController"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_67E8;
      v9[3] = &unk_2E3FD8;
      objc_copyWeak(&v11, &location);
      v9[4] = self;
      v10 = v4;
      objc_msgSend(v8, "requestEntriesWithCompletion:", v9);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

}

- (id)feedEntry:(id)a3 requestDataWithPriority:(float)a4 block:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a5;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIGoalsSharableImageRenderer jsFeedController](self, "jsFeedController"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIGoalsSharableImageRenderer jsFeedController](self, "jsFeedController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uid"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_6B2C;
      v13[3] = &unk_2E4000;
      v14 = v8;
      objc_msgSend(v10, "requestCompleteDataForEntry:completion:", v11, v13);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    }
  }

  return 0;
}

- (void)_renderContent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  TUIFeedRenderer *v15;
  TUIFeedRenderer *feedRenderer;
  TUIFeedRenderer *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)TUIEnvironment), "initWithViewSize:traitCollection:", self->_traitCollection, self->_viewSize.width, self->_viewSize.height);
  if (-[BSUIGoalsSharableImageRenderer useDarkStyle](self, "useDarkStyle"))
    v9 = 2;
  else
    v9 = 1;
  objc_msgSend(v8, "setStyle:", v9);
  objc_msgSend(v8, "contentsScale");
  objc_msgSend(v8, "setContentsScale:", v10 * self->_scale);
  v11 = objc_msgSend(objc_alloc((Class)TUIFeedRendererOptions), "initWithResourceTimeout:", 0.3);
  v12 = objc_alloc((Class)TUIFeedRenderer);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate factory](BSUITemplate, "factory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
  v15 = (TUIFeedRenderer *)objc_msgSend(v12, "initWithContent:environment:factory:manager:options:", v7, v8, v13, v14, v11);

  feedRenderer = self->_feedRenderer;
  self->_feedRenderer = v15;

  v17 = self->_feedRenderer;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_6D08;
  v19[3] = &unk_2E4028;
  v20 = v6;
  v18 = v6;
  -[TUIFeedRenderer capture:](v17, "capture:", v19);

}

- (BSUIDynamicValue)currentStackName
{
  return self->_currentStackName;
}

- (void)setCurrentStackName:(id)a3
{
  objc_storeStrong((id *)&self->_currentStackName, a3);
}

- (int64_t)feedContentLoadingState
{
  return self->_feedContentLoadingState;
}

- (void)setFeedContentLoadingState:(int64_t)a3
{
  self->_feedContentLoadingState = a3;
}

- (TUIFeedRenderer)feedRenderer
{
  return self->_feedRenderer;
}

- (void)setFeedRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_feedRenderer, a3);
}

- (JSAFeedController)jsFeedController
{
  return self->_jsFeedController;
}

- (void)setJsFeedController:(id)a3
{
  objc_storeStrong((id *)&self->_jsFeedController, a3);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (BOOL)useDarkStyle
{
  return self->_useDarkStyle;
}

- (void)setUseDarkStyle:(BOOL)a3
{
  self->_useDarkStyle = a3;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_jsFeedController, 0);
  objc_storeStrong((id *)&self->_feedRenderer, 0);
  objc_storeStrong((id *)&self->_currentStackName, 0);
}

@end
