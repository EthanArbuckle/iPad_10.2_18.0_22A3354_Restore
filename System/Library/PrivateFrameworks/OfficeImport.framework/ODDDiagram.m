@implementation ODDDiagram

- (ODDDiagram)init
{
  ODDDiagram *v2;
  ODDColorTransform *v3;
  ODDColorTransform *mColorTransform;
  ODDStyleDefinition *v5;
  ODDStyleDefinition *mStyleDefinition;

  v2 = -[OADDrawable initWithPropertiesClass:](self, "initWithPropertiesClass:", objc_opt_class());
  if (v2)
  {
    v3 = objc_alloc_init(ODDColorTransform);
    mColorTransform = v2->mColorTransform;
    v2->mColorTransform = v3;

    v5 = objc_alloc_init(ODDStyleDefinition);
    mStyleDefinition = v2->mStyleDefinition;
    v2->mStyleDefinition = v5;

  }
  return v2;
}

- (id)styleDefinition
{
  return self->mStyleDefinition;
}

- (id)colorTransform
{
  return self->mColorTransform;
}

- (void)setDocumentPoint:(id)a3
{
  objc_storeStrong((id *)&self->mDocumentPoint, a3);
}

- (void)setParentTextListStyle:(id)a3
{
  -[NSArray makeObjectsPerformSelector:withObject:](self->mEquivalentDrawables, "makeObjectsPerformSelector:withObject:", sel_setParentTextListStyle_, a3);
}

- (id)documentPoint
{
  return self->mDocumentPoint;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDDiagram;
  -[OADDrawable description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)equivalentDrawables
{
  return self->mEquivalentDrawables;
}

- (void)setEquivalentDrawables:(id)a3
{
  objc_storeStrong((id *)&self->mEquivalentDrawables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEquivalentDrawables, 0);
  objc_storeStrong((id *)&self->mStyleDefinition, 0);
  objc_storeStrong((id *)&self->mColorTransform, 0);
  objc_storeStrong((id *)&self->mDocumentPoint, 0);
}

@end
