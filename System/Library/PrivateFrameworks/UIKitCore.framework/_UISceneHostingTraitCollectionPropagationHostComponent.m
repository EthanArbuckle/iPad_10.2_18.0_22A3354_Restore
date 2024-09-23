@implementation _UISceneHostingTraitCollectionPropagationHostComponent

- (void)setTraitCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77___UISceneHostingTraitCollectionPropagationHostComponent_setTraitCollection___block_invoke;
  v7[3] = &unk_1E16E7D30;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateSettingsWithBlock:", v7);

}

@end
