@implementation _UISceneOcclusionHostComponent

- (NSArray)applicationOcclusionRects
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationOcclusionRects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setApplicationOcclusionRects:(id)a3
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
  v7[2] = __63___UISceneOcclusionHostComponent_setApplicationOcclusionRects___block_invoke;
  v7[3] = &unk_1E16B2AA0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateSettingsWithBlock:", v7);

}

- (NSArray)systemOcclusionRects
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemOcclusionRects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSystemOcclusionRects:(id)a3
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
  v7[2] = __58___UISceneOcclusionHostComponent_setSystemOcclusionRects___block_invoke;
  v7[3] = &unk_1E16B2AA0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateSettingsWithBlock:", v7);

}

@end
