@implementation FBScene(SceneRelationshipManagementHostComponent)

- (id)_relationshipManagementHostComponent
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v2 = objc_opt_class();
  objc_msgSend(a1, "componentForExtension:ofClass:", v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

@end
