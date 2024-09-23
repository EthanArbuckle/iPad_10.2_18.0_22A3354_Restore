@implementation UITextEffectsHostingInfo

- (UIWindowScene)scene
{
  return self->_scene;
}

- (BOOL)useHostedInstance
{
  return self->_hostedUseCount != 0;
}

+ (id)hostingInfoForWindowScene:(id)a3
{
  return +[_UIObjectPerCanvas objectOfClass:forCanvas:withOptions:createIfNecessary:](_UIObjectPerCanvas, "objectOfClass:forCanvas:withOptions:createIfNecessary:", a1, a3, 0, 1);
}

- (BOOL)_matchingOptions:(id)a3
{
  return 1;
}

- (id)_initWithCanvas:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  UITextEffectsHostingInfo *v9;
  UITextEffectsHostingInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UITextEffectsHostingInfo;
  v9 = -[UITextEffectsHostingInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scene, a3);
    objc_storeStrong((id *)&v10->_perSceneOptions, a4);
    v10->_hostedUseCount = 0;
  }

  return v10;
}

- (NSDictionary)_options
{
  return self->_perSceneOptions;
}

- (void)setUseHostedInstance:(BOOL)a3
{
  unint64_t hostedUseCount;
  unint64_t v4;

  hostedUseCount = self->_hostedUseCount;
  if (a3)
    v4 = hostedUseCount + 1;
  else
    v4 = hostedUseCount - 1;
  self->_hostedUseCount = v4;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (NSDictionary)perSceneOptions
{
  return self->_perSceneOptions;
}

- (void)setPerSceneOptions:(id)a3
{
  objc_storeStrong((id *)&self->_perSceneOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perSceneOptions, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
