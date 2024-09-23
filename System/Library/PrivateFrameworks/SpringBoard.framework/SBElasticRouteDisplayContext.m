@implementation SBElasticRouteDisplayContext

+ (id)routeContextWithName:(id)a3 valueTransformer:(id)a4 glyphPackage:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBElasticRouteDisplayContext.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("glyphPackage"));

  }
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithName:glyphStateValueTransformer:glyphPackage:glyphImage:", v9, v10, v11, 0);

  return v12;
}

+ (id)routeContextWithName:(id)a3 glyphImage:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBElasticRouteDisplayContext.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("glyphImage"));

  }
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithName:glyphStateValueTransformer:glyphPackage:glyphImage:", v7, 0, 0, v8);

  return v9;
}

- (id)_initWithName:(id)a3 glyphStateValueTransformer:(id)a4 glyphPackage:(id)a5 glyphImage:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  SBElasticRouteDisplayContext *v16;
  SBElasticRouteDisplayContext *v17;
  uint64_t v18;
  id glyphStateValueTransformer;
  void *v21;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBElasticRouteDisplayContext.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedDisplayName"));

  }
  v22.receiver = self;
  v22.super_class = (Class)SBElasticRouteDisplayContext;
  v16 = -[SBElasticRouteDisplayContext init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_localizedDisplayName, a3);
    v18 = MEMORY[0x1D17E5550](v13);
    glyphStateValueTransformer = v17->_glyphStateValueTransformer;
    v17->_glyphStateValueTransformer = (id)v18;

    objc_storeStrong((id *)&v17->_glyphPackage, a5);
    objc_storeStrong((id *)&v17->_glyphImage, a6);
  }

  return v17;
}

- (NSString)description
{
  const __CFString *v2;

  v2 = CFSTR("glyphImage");
  if (self->_glyphPackage)
    v2 = CFSTR("glyphPackage");
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBElasticRouteDisplayContext with displayName: '%@', type: '%@'"), self->_localizedDisplayName, v2);
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDisplayName, a3);
}

- (id)glyphStateValueTransformer
{
  return self->_glyphStateValueTransformer;
}

- (void)setGlyphStateValueTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CCUICAPackageDescription)glyphPackage
{
  return self->_glyphPackage;
}

- (void)setGlyphPackage:(id)a3
{
  objc_storeStrong((id *)&self->_glyphPackage, a3);
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (void)setGlyphImage:(id)a3
{
  objc_storeStrong((id *)&self->_glyphImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphPackage, 0);
  objc_storeStrong(&self->_glyphStateValueTransformer, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end
