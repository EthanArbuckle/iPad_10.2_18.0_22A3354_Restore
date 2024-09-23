@implementation _UISceneHostingContentSizePreferenceHostComponent

- (CGSize)preferredContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  _QWORD aBlock[5];

  v8 = a6;
  if (objc_msgSend(a4, "containsProperty:", sel_preferredContentSize))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __127___UISceneHostingContentSizePreferenceHostComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    aBlock[4] = self;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[FBSSceneComponent hostScene](self, "hostScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_uiHostingController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[_UISceneHostingController performBlock:withClientTransitionContext:]((uint64_t)v11, v9, v8);
    else
      v9[2](v9);

  }
}

- (void)setContentSizePreferenceReceiver:(id)a3
{
  _UISceneHostingContentSizePreferenceHostReceiving **p_contentSizePreferenceReceiver;
  id v5;

  p_contentSizePreferenceReceiver = &self->_contentSizePreferenceReceiver;
  v5 = a3;
  objc_storeWeak((id *)p_contentSizePreferenceReceiver, v5);
  -[_UISceneHostingContentSizePreferenceHostComponent preferredContentSize](self, "preferredContentSize");
  objc_msgSend(v5, "setPreferredContentSize:");

}

- (_UISceneHostingContentSizePreferenceHostReceiving)contentSizePreferenceReceiver
{
  return (_UISceneHostingContentSizePreferenceHostReceiving *)objc_loadWeakRetained((id *)&self->_contentSizePreferenceReceiver);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentSizePreferenceReceiver);
}

@end
