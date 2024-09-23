@implementation _UIGravityWellEffectDescriptor

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

  v4 = a3;
  -[_UIGravityWellEffectDescriptor targetedPreview](self, "targetedPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetedPreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v6 == v8;

  return (char)v4;
}

- (UITargetedPreview)primaryPreview
{
  return self->_primaryPreview;
}

- (void)setPrimaryPreview:(id)a3
{
  objc_storeStrong((id *)&self->_primaryPreview, a3);
}

- (NSArray)secondaryPreviews
{
  return self->_secondaryPreviews;
}

- (void)setSecondaryPreviews:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryPreviews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryPreviews, 0);
  objc_storeStrong((id *)&self->_primaryPreview, 0);
}

@end
