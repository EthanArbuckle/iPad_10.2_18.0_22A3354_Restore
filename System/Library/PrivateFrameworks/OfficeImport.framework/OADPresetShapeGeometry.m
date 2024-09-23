@implementation OADPresetShapeGeometry

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (int)type
{
  return self->mType;
}

- (id)equivalentCustomGeometry
{
  void *v3;
  void *v4;
  void *i;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->super.mIsEscher)
    -[OADPresetShapeGeometry escherEquivalentCustomGeometry](self, "escherEquivalentCustomGeometry");
  else
    -[OADPresetShapeGeometry oa12EquivalentCustomGeometry](self, "oa12EquivalentCustomGeometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableDictionary keyEnumerator](self->super.mAdjustValues, "keyEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; i = v6)
    {
      objc_msgSend(v4, "nextObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        break;
      v7 = objc_msgSend(v6, "unsignedIntValue");
      objc_msgSend(v3, "setAdjustValue:atIndex:", -[OADShapeGeometry adjustValueAtIndex:](self, "adjustValueAtIndex:", v7), v7);
    }
    v8 = v3;

  }
  return v3;
}

- (id)escherEquivalentCustomGeometry
{
  EshGeometryProperties *v3;
  OADCustomShapeGeometry *v4;
  uint64_t Vertices;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  int32x2_t v10;
  __int128 v11;
  _DWORD v12[20];
  uint64_t v13;

  EshGeometryProperties::EshGeometryProperties((EshGeometryProperties *)&v10);
  if (EshShapeLib::cloneShapeProperties((EshShapeLib *)LOWORD(self->mType), &v10, v3))
  {
    EshGeometryProperties::addImpliedSegments(&v10);
    v4 = objc_alloc_init(OADCustomShapeGeometry);
    -[OADShapeGeometry setIsEscher:](v4, "setIsEscher:", 1);
    Vertices = EshGeometryProperties::getVertices((EshGeometryProperties *)&v10);
    +[OABShapeGeometry readFromPathCommands:pathParams:toGeometry:](OABShapeGeometry, "readFromPathCommands:pathParams:toGeometry:", EshGeometryProperties::getSegments((EshGeometryProperties *)&v10), Vertices, v4);
    +[OABShapeGeometry readFromFormulas:toGeometry:](OABShapeGeometry, "readFromFormulas:toGeometry:", EshGeometryProperties::getFormulas((EshGeometryProperties *)&v10), v4);
    if (EshGeometryProperties::isInscribesSet((EshGeometryProperties *)&v10))
      +[OABShapeGeometry readFromTextBoxRects:toGeometry:](OABShapeGeometry, "readFromTextBoxRects:toGeometry:", EshGeometryProperties::getInscribes((EshGeometryProperties *)&v10), v4);
    v9 = v11;
    -[OADCustomShapeGeometry setGeometryCoordSpace:](v4, "setGeometryCoordSpace:", &v9);
    v8 = v13;
    +[OABShapeGeometry readFromLimo:toGeometry:](OABShapeGeometry, "readFromLimo:toGeometry:", &v8, v4);
    for (i = 0; i != 10; ++i)
      -[OADShapeGeometry setAdjustValue:atIndex:](v4, "setAdjustValue:atIndex:", v12[i], i);
  }
  else
  {
    v4 = 0;
  }
  EshGeometryProperties::~EshGeometryProperties((EshGeometryProperties *)&v10);
  return v4;
}

- (id)oa12EquivalentCustomGeometry
{
  void *v2;
  void *v3;
  _xmlDoc *v4;
  xmlNodePtr v5;
  OAXDrawingState *v6;
  void *v7;

  +[OAXGeometry stringWritingShapeType:](OAXGeometry, "stringWritingShapeType:", self->mType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCBundleResourceManager instance](TCBundleResourceManager, "instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (_xmlDoc *)objc_msgSend(v3, "xmlDocumentForResource:ofType:inPackage:", v2, CFSTR("xml"), CFSTR("OAShapeTypes"));
  if (v4)
  {
    v5 = OCXGetRootElement(v4);
    v6 = -[OAXDrawingState initWithClient:]([OAXDrawingState alloc], "initWithClient:", 0);
    +[OAXGeometry readCustomGeometryFromXmlNode:hasImplicitFormulas:drawingState:](OAXGeometry, "readCustomGeometryFromXmlNode:hasImplicitFormulas:drawingState:", v5, 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADPresetShapeGeometry;
  -[OADShapeGeometry description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
