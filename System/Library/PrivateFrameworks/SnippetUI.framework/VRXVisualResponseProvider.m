@implementation VRXVisualResponseProvider

- (VRXVisualResponseProvider)init
{
  VRXVisualResponseProvider *v2;
  _TtC9SnippetUI22VisualResponseProvider *v3;
  _TtC9SnippetUI22VisualResponseProvider *provider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VRXVisualResponseProvider;
  v2 = -[VRXVisualResponseProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9SnippetUI22VisualResponseProvider);
    provider = v2->_provider;
    v2->_provider = v3;

  }
  return v2;
}

+ (void)preloadPlugins
{
  if (preloadPlugins_once[0] != -1)
    dispatch_once(preloadPlugins_once, &__block_literal_global);
}

uint64_t __43__VRXVisualResponseProvider_preloadPlugins__block_invoke()
{
  return +[VisualResponseProvider preloadPlugins](_TtC9SnippetUI22VisualResponseProvider, "preloadPlugins");
}

+ (void)preWarm:(id)a3
{
  +[VisualResponseProvider preWarm:](_TtC9SnippetUI22VisualResponseProvider, "preWarm:", a3);
}

- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[VRXVisualResponseProvider provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllerForModel:mode:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)viewControllerForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[VRXVisualResponseProvider provider](self, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewControllerForSnippetModel:bundleName:mode:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)viewControllerForModel:(id)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[VRXVisualResponseProvider provider](self, "provider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewControllerFor:mode:completion:", v9, a4, v8);

}

- (id)viewForModel:(id)a3 mode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[VRXVisualResponseProvider provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewForModel:mode:overload:", v6, a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)viewForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[VRXVisualResponseProvider provider](self, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewForSnippetModel:bundleName:mode:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)reset
{
  id v2;

  -[VRXVisualResponseProvider provider](self, "provider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (id)transformModel:(id)a3 mode:(int64_t)a4
{
  return +[VisualResponseProvider transformModel:mode:currentIdiom:](_TtC9SnippetUI22VisualResponseProvider, "transformModel:mode:currentIdiom:", a3, a4, 1);
}

+ (id)transformModel:(id)a3 mode:(int64_t)a4 currentIdiom:(int64_t)a5
{
  return +[VisualResponseProvider transformModel:mode:currentIdiom:](_TtC9SnippetUI22VisualResponseProvider, "transformModel:mode:currentIdiom:", a3, a4, a5);
}

+ (void)setPatternId:(id)a3 forViewId:(id)a4
{
  +[VisualResponseProvider setPatternId:forViewId:](_TtC9SnippetUI22VisualResponseProvider, "setPatternId:forViewId:", a3, a4);
}

- (_TtC9SnippetUI22VisualResponseProvider)provider
{
  return (_TtC9SnippetUI22VisualResponseProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
