@implementation _PXStoryConcreteCompanionColorEffect

- (_PXStoryConcreteCompanionColorEffect)initWithColorLookupCube:(id)a3
{
  id v5;
  _PXStoryConcreteCompanionColorEffect *v6;
  _PXStoryConcreteCompanionColorEffect *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryConcreteCompanionColorEffect;
  v6 = -[_PXStoryConcreteCompanionColorEffect init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_colorLookupCube, a3);

  return v7;
}

- (id)createMetalTextureWithDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(off_1E50B2B30, "privateContextWithDevice:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryConcreteCompanionColorEffect colorLookupCube](self, "colorLookupCube");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createTextureWithContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXGColorLookupCube)colorLookupCube
{
  return self->_colorLookupCube;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorLookupCube, 0);
}

@end
