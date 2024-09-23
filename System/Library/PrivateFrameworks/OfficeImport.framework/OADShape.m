@implementation OADShape

- (OADShape)init
{
  uint64_t v3;
  OADShape *v4;
  OADTextBody *v5;
  OADTextBody *mTextBody;
  objc_super v8;

  v3 = objc_opt_class();
  v8.receiver = self;
  v8.super_class = (Class)OADShape;
  v4 = -[OADDrawable initWithPropertiesClass:](&v8, sel_initWithPropertiesClass_, v3);
  if (v4)
  {
    v5 = objc_alloc_init(OADTextBody);
    mTextBody = v4->mTextBody;
    v4->mTextBody = v5;

  }
  return v4;
}

- (void)setGeometry:(id)a3
{
  objc_storeStrong((id *)&self->mGeometry, a3);
}

- (void)setTextBody:(id)a3
{
  objc_storeStrong((id *)&self->mTextBody, a3);
}

- (id)textBody
{
  return self->mTextBody;
}

- (void)setParentTextListStyle:(id)a3
{
  -[OADTextBody setParentTextListStyle:](self->mTextBody, "setParentTextListStyle:", a3);
}

- (void)removeUnnecessaryOverrides
{
  objc_super v3;

  -[OADTextBody removeUnnecessaryOverrides](self->mTextBody, "removeUnnecessaryOverrides");
  v3.receiver = self;
  v3.super_class = (Class)OADShape;
  -[OADDrawable removeUnnecessaryOverrides](&v3, sel_removeUnnecessaryOverrides);
}

- (id)shapeProperties
{
  return self->super.super.mDrawableProperties;
}

- (int)type
{
  void *v2;
  int v3;

  -[OADShape geometry](self, "geometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (id)geometry
{
  OADShapeGeometry *mGeometry;
  OADShapeGeometry *v3;

  mGeometry = self->mGeometry;
  if (mGeometry)
  {
    v3 = mGeometry;
  }
  else if (self->super.mMasterGraphic)
  {
    objc_opt_class();
    -[OADGraphic geometry](self->super.mMasterGraphic, "geometry");
    v3 = (OADShapeGeometry *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)shapeStyle
{
  return 0;
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  -[OADTextBody changeParentTextListStylePreservingEffectiveValues:ownTextListStyle:](self->mTextBody, "changeParentTextListStylePreservingEffectiveValues:ownTextListStyle:", a3, 1);
}

- (void)flattenProperties
{
  id v3;

  -[OADTextBody flattenProperties](self->mTextBody, "flattenProperties");
  -[OADShape shapeProperties](self, "shapeProperties");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flatten");

}

- (void)createPresetGeometryWithShapeType:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  OADPresetShapeGeometry *v7;
  OADShapeGeometry *mGeometry;

  v3 = *(_QWORD *)&a3;
  if (self->mGeometry)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADShape createPresetGeometryWithShapeType:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADShape.mm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 90, 0, "A geometry already exists");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v7 = objc_alloc_init(OADPresetShapeGeometry);
  mGeometry = self->mGeometry;
  self->mGeometry = &v7->super;

  -[OADShapeGeometry setType:](self->mGeometry, "setType:", v3);
}

- (BOOL)isTextBox
{
  char v3;
  void *v4;

  if (-[OADShape type](self, "type") == 202)
    return 1;
  -[OADShape shapeProperties](self, "shapeProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "isTextBox");

  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADShape;
  -[OADGraphic description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (OADOrientedBounds)textOrientedBounds
{
  return self->mTextOrientedBounds;
}

- (void)setTextOrientedBounds:(id)a3
{
  objc_storeStrong((id *)&self->mTextOrientedBounds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextOrientedBounds, 0);
  objc_storeStrong((id *)&self->mTextBody, 0);
  objc_storeStrong((id *)&self->mGeometry, 0);
}

@end
