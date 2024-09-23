@implementation OABShapeBaseManager

- (OABShapeBaseManager)initWithShapeBase:(void *)a3 shapeType:(int)a4 masterShape:(EshShape *)a5
{
  OABShapeBaseManager *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OABShapeBaseManager;
  result = -[OABFillPropertiesManager initWithFill:shapeType:masterShape:](&v7, sel_initWithFill_shapeType_masterShape_, (char *)a3 + 296, *(_QWORD *)&a4, a5);
  if (result)
    result->mShapeBase = a3;
  return result;
}

- (EshColor)strokeFgColor
{
  EshColor *v2;
  EshColor *v4;
  const EshColor *Color;
  OABPropertiesManager *mMasterManager;

  v4 = v2;
  if (EshStroke::isColorSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    Color = (const EshColor *)EshStroke::getColor((EshStroke *)((char *)self->mShapeBase + 320));
    return (EshColor)EshColor::EshColor(v4, Color);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    if (mMasterManager)
      return (EshColor)-[OABPropertiesManager strokeFgColor](mMasterManager, "strokeFgColor");
    else
      *v4 = 0;
  }
  return (EshColor)mMasterManager;
}

- (int)strokeFgAlpha
{
  if (EshStroke::isOpacitySet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getOpacity((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeFgAlpha](self->super.mMasterManager, "strokeFgAlpha");
}

- (BOOL)isStroked
{
  int isStrokeOn;

  if (EshStroke::isOnSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    LOBYTE(isStrokeOn) = EshStroke::getOn((EshStroke *)((char *)self->mShapeBase + 320));
  }
  else
  {
    isStrokeOn = EshShapeLib::isStrokeOn((EshShapeLib *)LOWORD(self->super.mShapeType), 1);
    if (isStrokeOn)
      LOBYTE(isStrokeOn) = -[OABPropertiesManager isStroked](self->super.mMasterManager, "isStroked");
  }
  return isStrokeOn;
}

- (int)strokeFillType
{
  if (EshStroke::isFillTypeSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getFillType((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeFillType](self->super.mMasterManager, "strokeFillType");
}

- (const)strokeCustomDash
{
  if (EshStroke::isDashStyleSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getDashStyle((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return (const void *)-[OABPropertiesManager strokeCustomDash](self->super.mMasterManager, "strokeCustomDash");
}

- (int)strokePresetDash
{
  if (EshStroke::isPredefDashStyleSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getPredefDashStyle((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokePresetDash](self->super.mMasterManager, "strokePresetDash");
}

- (int)strokeJoinStyle
{
  if (EshStroke::isJoinStyleSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getJoinStyle((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeJoinStyle](self->super.mMasterManager, "strokeJoinStyle");
}

- (int)strokeStartArrowType
{
  if (EshStroke::isStartArrowSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getStartArrow((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeStartArrowType](self->super.mMasterManager, "strokeStartArrowType");
}

- (int)strokeStartArrowWidth
{
  if (EshStroke::isStartArrowWidthSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getStartArrowWidth((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeStartArrowWidth](self->super.mMasterManager, "strokeStartArrowWidth");
}

- (int)strokeStartArrowLength
{
  if (EshStroke::isStartArrowLengthSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getStartArrowLength((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeStartArrowLength](self->super.mMasterManager, "strokeStartArrowLength");
}

- (int)strokeEndArrowType
{
  if (EshStroke::isEndArrowSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getEndArrow((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeEndArrowType](self->super.mMasterManager, "strokeEndArrowType");
}

- (int)strokeEndArrowWidth
{
  if (EshStroke::isEndArrowWidthSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getEndArrowWidth((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeEndArrowWidth](self->super.mMasterManager, "strokeEndArrowWidth");
}

- (int)strokeEndArrowLength
{
  if (EshStroke::isEndArrowLengthSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getEndArrowLength((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeEndArrowLength](self->super.mMasterManager, "strokeEndArrowLength");
}

- (int)strokeWidth
{
  if (EshStroke::isWeightSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getWeight((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeWidth](self->super.mMasterManager, "strokeWidth");
}

- (int)strokeCapStyle
{
  if (EshStroke::isCapStyleSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getCapStyle((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeCapStyle](self->super.mMasterManager, "strokeCapStyle");
}

- (int)strokeCompoundType
{
  if (EshStroke::isLineStyleSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getLineStyle((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeCompoundType](self->super.mMasterManager, "strokeCompoundType");
}

- (BOOL)isShadowed
{
  if (EshShadow::isOnSet((EshShadow *)((char *)self->mShapeBase + 344)))
    return EshShadow::getOn((EshShadow *)((char *)self->mShapeBase + 344));
  else
    return -[OABPropertiesManager isShadowed](self->super.mMasterManager, "isShadowed");
}

- (EshColor)shadowColor
{
  EshColor *v2;
  EshColor *v4;
  const EshColor *Color;
  OABPropertiesManager *mMasterManager;

  v4 = v2;
  if (EshShadow::isColorSet((EshShadow *)((char *)self->mShapeBase + 344)))
  {
    Color = (const EshColor *)EshShadow::getColor((EshShadow *)((char *)self->mShapeBase + 344));
    return (EshColor)EshColor::EshColor(v4, Color);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    if (mMasterManager)
      return (EshColor)-[OABPropertiesManager shadowColor](mMasterManager, "shadowColor");
    else
      *v4 = 0;
  }
  return (EshColor)mMasterManager;
}

- (int)shadowAlpha
{
  if (EshShadow::isOpacitySet((EshShadow *)((char *)self->mShapeBase + 344)))
    return EshShadow::getOpacity((EshShadow *)((char *)self->mShapeBase + 344));
  else
    return -[OABPropertiesManager shadowAlpha](self->super.mMasterManager, "shadowAlpha");
}

- (int)shadowSoftness
{
  if (EshShadow::isSoftnessSet((EshShadow *)((char *)self->mShapeBase + 344)))
    return EshShadow::getSoftness((EshShadow *)((char *)self->mShapeBase + 344));
  else
    return -[OABPropertiesManager shadowSoftness](self->super.mMasterManager, "shadowSoftness");
}

- (int)shadowOffsetX
{
  if (EshShadow::isOffsetXSet((EshShadow *)((char *)self->mShapeBase + 344)))
    return EshShadow::getOffsetX((EshShadow *)((char *)self->mShapeBase + 344));
  else
    return -[OABPropertiesManager shadowOffsetX](self->super.mMasterManager, "shadowOffsetX");
}

- (int)shadowOffsetY
{
  if (EshShadow::isOffsetYSet((EshShadow *)((char *)self->mShapeBase + 344)))
    return EshShadow::getOffsetY((EshShadow *)((char *)self->mShapeBase + 344));
  else
    return -[OABPropertiesManager shadowOffsetY](self->super.mMasterManager, "shadowOffsetY");
}

- (int)shadowType
{
  if (EshShadow::isShadowTypeSet((EshShadow *)((char *)self->mShapeBase + 344)))
    return EshShadow::getShadowType((EshShadow *)((char *)self->mShapeBase + 344));
  else
    return -[OABPropertiesManager shadowType](self->super.mMasterManager, "shadowType");
}

- (int)strokeMiterLimit
{
  if (EshStroke::isMiterLimitSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getMiterLimit((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeMiterLimit](self->super.mMasterManager, "strokeMiterLimit");
}

- (unsigned)strokeFillBlipID
{
  if (EshStroke::isBlipSet((EshStroke *)((char *)self->mShapeBase + 320)))
    return EshStroke::getBlipId((EshStroke *)((char *)self->mShapeBase + 320));
  else
    return -[OABPropertiesManager strokeFillBlipID](self->super.mMasterManager, "strokeFillBlipID");
}

- (id)strokeFillBlipName
{
  void *BlipName;

  if (EshStroke::isBlipNameSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    BlipName = EshStroke::getBlipName((EshStroke *)((char *)self->mShapeBase + 320));
    if (BlipName)
      BlipName = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", BlipName);
  }
  else
  {
    -[OABPropertiesManager strokeFillBlipName](self->super.mMasterManager, "strokeFillBlipName");
    BlipName = (void *)objc_claimAutoreleasedReturnValue();
  }
  return BlipName;
}

- (EshColor)strokeBgColor
{
  EshColor *v2;
  EshColor *v4;
  const EshColor *Color2;
  OABPropertiesManager *mMasterManager;

  v4 = v2;
  if (EshStroke::isColor2Set((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    Color2 = (const EshColor *)EshStroke::getColor2((EshStroke *)((char *)self->mShapeBase + 320));
    return (EshColor)EshColor::EshColor(v4, Color2);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    if (mMasterManager)
      return (EshColor)-[OABPropertiesManager strokeBgColor](mMasterManager, "strokeBgColor");
    else
      *v4 = 0;
  }
  return (EshColor)mMasterManager;
}

- (EshBlip)strokeFillBlipDataReference
{
  if (EshStroke::isBlipSet((EshStroke *)((char *)self->mShapeBase + 320))
    && (EshStroke::isBlipId((EshStroke *)((char *)self->mShapeBase + 320)) & 1) == 0)
  {
    return (EshBlip *)EshStroke::getBlipRecordReference((EshStroke *)((char *)self->mShapeBase + 320));
  }
  else
  {
    return (EshBlip *)-[OABPropertiesManager strokeFillBlipDataReference](self->super.mMasterManager, "strokeFillBlipDataReference");
  }
}

@end
