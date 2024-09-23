@implementation _UIWindowSceneActivationEffectDescriptor

+ (id)descriptorWithPreview:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  objc_msgSend(v3, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppliesShadow:", 1);

  v6 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

- (NSArray)compatibleDescriptors
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canTransitionInPlaceToEffectWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[_UIWindowSceneActivationEffectDescriptor targetedPreview](self, "targetedPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetedPreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  return v9;
}

- (UITargetedPreview)targetedPreview
{
  return self->_targetedPreview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetedPreview, 0);
}

@end
