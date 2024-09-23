@implementation OABShapeManager

- (OABShapeManager)initWithShape:(void *)a3 masterShape:(void *)a4
{
  uint64_t ShapeType;
  OABShapeManager *result;
  objc_super v9;

  ShapeType = EshShapeProperties::getShapeType((EshShapeProperties *)((char *)a3 + 424));
  v9.receiver = self;
  v9.super_class = (Class)OABShapeManager;
  result = -[OABShapeBaseManager initWithShapeBase:shapeType:masterShape:](&v9, sel_initWithShapeBase_shapeType_masterShape_, a3, ShapeType, a4);
  if (result)
    result->mShape = a3;
  return result;
}

- (BOOL)isFilled
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OABShapeManager;
  v3 = -[OABFillPropertiesManager isFilled](&v5, sel_isFilled);
  if (v3)
    LOBYTE(v3) = -[OABShapeManager isFillOK](self, "isFillOK");
  return v3;
}

- (BOOL)isTextPath
{
  if (EshTextPath::isOnSet((EshTextPath *)((char *)self->mShape + 504)))
    return EshTextPath::getOn((EshTextPath *)((char *)self->mShape + 504));
  if (EshShapeLib::isWordArt((EshShapeLib *)LOWORD(self->super.super.mShapeType)))
    return 1;
  return -[OABPropertiesManager isTextPath](self->super.super.mMasterManager, "isTextPath");
}

- (BOOL)isStroked
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OABShapeManager;
  v3 = -[OABShapeBaseManager isStroked](&v5, sel_isStroked);
  if (v3)
    LOBYTE(v3) = -[OABShapeManager isStrokeOK](self, "isStrokeOK");
  return v3;
}

- (BOOL)isShadowed
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OABShapeManager;
  v3 = -[OABShapeBaseManager isShadowed](&v5, sel_isShadowed);
  if (v3)
    LOBYTE(v3) = -[OABShapeManager isShadowOK](self, "isShadowOK");
  return v3;
}

- (BOOL)hidden
{
  if (EshShapeProperties::isHiddenSet((EshShapeProperties *)((char *)self->mShape + 424)))
    return EshShapeProperties::getHidden((EshShapeProperties *)((char *)self->mShape + 424));
  else
    return -[OABPropertiesManager hidden](self->super.super.mMasterManager, "hidden");
}

- (BOOL)isStrokeOK
{
  int isStrokeOK;

  if (EshPath::isStrokeOKSet((EshPath *)self->mShape + 22))
  {
    LOBYTE(isStrokeOK) = EshPath::getStrokeOK((EshPath *)self->mShape + 22);
  }
  else
  {
    isStrokeOK = EshShapeLib::isStrokeOK((EshShapeLib *)LOWORD(self->super.super.mShapeType), 1);
    if (isStrokeOK)
      LOBYTE(isStrokeOK) = -[OABPropertiesManager isStrokeOK](self->super.super.mMasterManager, "isStrokeOK");
  }
  return isStrokeOK;
}

- (BOOL)isFillOK
{
  int isFillOK;

  if (EshPath::isFillOKSet((EshPath *)self->mShape + 22))
  {
    LOBYTE(isFillOK) = EshPath::getFillOK((EshPath *)self->mShape + 22);
  }
  else
  {
    isFillOK = EshShapeLib::isFillOK((EshShapeLib *)LOWORD(self->super.super.mShapeType), 1);
    if (isFillOK)
      LOBYTE(isFillOK) = -[OABPropertiesManager isFillOK](self->super.super.mMasterManager, "isFillOK");
  }
  return isFillOK;
}

- (BOOL)isShadowOK
{
  int isShadowOK;

  if (EshPath::isShadowOKSet((EshPath *)self->mShape + 22))
  {
    LOBYTE(isShadowOK) = EshPath::getShadowOK((EshPath *)self->mShape + 22);
  }
  else
  {
    isShadowOK = EshShapeLib::isShadowOK((EshShapeLib *)LOWORD(self->super.super.mShapeType), 1);
    if (isShadowOK)
      LOBYTE(isShadowOK) = -[OABPropertiesManager isShadowOK](self->super.super.mMasterManager, "isShadowOK");
  }
  return isShadowOK;
}

- (int)textPathTextAlignment
{
  if (EshTextPath::isAlignSet((EshTextPath *)((char *)self->mShape + 504)))
    return EshTextPath::getAlign((EshTextPath *)((char *)self->mShape + 504));
  else
    return -[OABPropertiesManager textPathTextAlignment](self->super.super.mMasterManager, "textPathTextAlignment");
}

- (id)textPathUnicodeString
{
  void *String;

  if (EshTextPath::isStringSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    String = EshTextPath::getString((EshTextPath *)((char *)self->mShape + 504));
    if (String)
      String = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", String);
  }
  else
  {
    -[OABPropertiesManager textPathUnicodeString](self->super.super.mMasterManager, "textPathUnicodeString");
    String = (void *)objc_claimAutoreleasedReturnValue();
  }
  return String;
}

- (id)textPathFontFamily
{
  void *Font;

  if (EshTextPath::isFontSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    Font = EshTextPath::getFont((EshTextPath *)((char *)self->mShape + 504));
    if (Font)
      Font = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", Font);
  }
  else
  {
    -[OABPropertiesManager textPathFontFamily](self->super.super.mMasterManager, "textPathFontFamily");
    Font = (void *)objc_claimAutoreleasedReturnValue();
  }
  return Font;
}

- (int)textPathFontSize
{
  if (EshTextPath::isSizeSet((EshTextPath *)((char *)self->mShape + 504)))
    return EshTextPath::getSize((EshTextPath *)((char *)self->mShape + 504));
  else
    return -[OABPropertiesManager textPathFontSize](self->super.super.mMasterManager, "textPathFontSize");
}

- (BOOL)textPathBold
{
  if (EshTextPath::isBoldSet((EshTextPath *)((char *)self->mShape + 504)))
    return EshTextPath::getBold((EshTextPath *)((char *)self->mShape + 504));
  else
    return -[OABPropertiesManager textPathBold](self->super.super.mMasterManager, "textPathBold");
}

- (BOOL)textPathItalic
{
  if (EshTextPath::isItalicSet((EshTextPath *)((char *)self->mShape + 504)))
    return EshTextPath::getItalic((EshTextPath *)((char *)self->mShape + 504));
  else
    return -[OABPropertiesManager textPathItalic](self->super.super.mMasterManager, "textPathItalic");
}

- (BOOL)textPathSmallcaps
{
  if (EshTextPath::isSmallcapsSet((EshTextPath *)((char *)self->mShape + 504)))
    return EshTextPath::getSmallcaps((EshTextPath *)((char *)self->mShape + 504));
  else
    return -[OABPropertiesManager textPathSmallcaps](self->super.super.mMasterManager, "textPathSmallcaps");
}

- (OABShapeManager)initWithShape:(void *)a3
{
  return -[OABShapeManager initWithShape:masterShape:](self, "initWithShape:masterShape:", a3, 0);
}

- (BOOL)textPathUnderline
{
  if (EshTextPath::isUnderlineSet((EshTextPath *)((char *)self->mShape + 504)))
    return EshTextPath::getUnderline((EshTextPath *)((char *)self->mShape + 504));
  else
    return -[OABPropertiesManager textPathUnderline](self->super.super.mMasterManager, "textPathUnderline");
}

- (BOOL)textPathStrikethrough
{
  if (EshTextPath::isStrikethroughSet((EshTextPath *)((char *)self->mShape + 504)))
    return EshTextPath::getStrikethrough((EshTextPath *)((char *)self->mShape + 504));
  else
    return -[OABPropertiesManager textPathStrikethrough](self->super.super.mMasterManager, "textPathStrikethrough");
}

@end
