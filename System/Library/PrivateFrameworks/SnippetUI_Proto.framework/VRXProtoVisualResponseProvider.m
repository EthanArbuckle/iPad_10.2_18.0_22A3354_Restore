@implementation VRXProtoVisualResponseProvider

- (VRXProtoVisualResponseProvider)init
{
  VRXProtoVisualResponseProvider *v2;
  _TtC15SnippetUI_Proto27ProtoVisualResponseProvider *v3;
  _TtC15SnippetUI_Proto27ProtoVisualResponseProvider *provider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VRXProtoVisualResponseProvider;
  v2 = -[VRXProtoVisualResponseProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC15SnippetUI_Proto27ProtoVisualResponseProvider);
    provider = v2->_provider;
    v2->_provider = v3;

  }
  return v2;
}

+ (void)preWarm:(id)a3
{
  +[ProtoVisualResponseProvider preWarm:](_TtC15SnippetUI_Proto27ProtoVisualResponseProvider, "preWarm:", a3);
}

- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[VRXProtoVisualResponseProvider provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllerForModel:mode:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)viewControllerForModel:(id)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[VRXProtoVisualResponseProvider provider](self, "provider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewControllerFor:mode:completion:", v9, a4, v8);

}

- (id)viewForModel:(id)a3 mode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[VRXProtoVisualResponseProvider provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewForModel:mode:overload:", v6, a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)reset
{
  id v2;

  -[VRXProtoVisualResponseProvider provider](self, "provider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

+ (id)transformModel:(id)a3 mode:(int64_t)a4 currentIdiom:(int64_t)a5
{
  return +[ProtoVisualResponseProvider transformModel:mode:currentIdiom:](_TtC15SnippetUI_Proto27ProtoVisualResponseProvider, "transformModel:mode:currentIdiom:", a3, a4, a5);
}

+ (void)setPatternId:(id)a3 forViewId:(id)a4
{
  +[ProtoVisualResponseProvider setPatternId:forViewId:](_TtC15SnippetUI_Proto27ProtoVisualResponseProvider, "setPatternId:forViewId:", a3, a4);
}

- (_TtC15SnippetUI_Proto27ProtoVisualResponseProvider)provider
{
  return (_TtC15SnippetUI_Proto27ProtoVisualResponseProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
