@implementation OABFillPropertiesManager

- (OABFillPropertiesManager)initWithFill:(const EshFill *)a3 shapeType:(int)a4 masterShape:(EshShape *)a5
{
  OABFillPropertiesManager *v8;
  OABFillPropertiesManager *v9;
  OABShapeManager *v10;
  OABPropertiesManager *mMasterManager;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)OABFillPropertiesManager;
  v8 = -[OABFillPropertiesManager init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->mFill = a3;
    v8->mShapeType = a4;
    if (a5)
      v10 = -[OABShapeManager initWithShape:masterShape:]([OABShapeManager alloc], "initWithShape:masterShape:", a5, 0);
    else
      v10 = objc_alloc_init(OABDefaultsManager);
    mMasterManager = v9->mMasterManager;
    v9->mMasterManager = (OABPropertiesManager *)v10;

  }
  return v9;
}

- (int)fillType
{
  if (EshFill::isFillTypeSet((EshFill *)self->mFill))
    return EshFill::getFillType((EshFill *)self->mFill);
  else
    return -[OABPropertiesManager fillType](self->mMasterManager, "fillType");
}

- (BOOL)isFilled
{
  int isFillOn;

  if (EshFill::isOnSet((EshFill *)self->mFill))
  {
    LOBYTE(isFillOn) = EshFill::getOn((EshFill *)self->mFill);
  }
  else
  {
    isFillOn = EshShapeLib::isFillOn((EshShapeLib *)LOWORD(self->mShapeType), 1);
    if (isFillOn)
      LOBYTE(isFillOn) = -[OABPropertiesManager isFilled](self->mMasterManager, "isFilled");
  }
  return isFillOn;
}

- (EshColor)fillFgColor
{
  EshColor *v2;
  EshColor *v4;
  const EshColor *Color;
  OABPropertiesManager *mMasterManager;

  v4 = v2;
  if (EshFill::isColorSet((EshFill *)self->mFill))
  {
    Color = (const EshColor *)EshFill::getColor((EshFill *)self->mFill);
    return (EshColor)EshColor::EshColor(v4, Color);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    if (mMasterManager)
      return (EshColor)-[OABPropertiesManager fillFgColor](mMasterManager, "fillFgColor");
    else
      *v4 = 0;
  }
  return (EshColor)mMasterManager;
}

- (int)fillFgAlpha
{
  if (EshFill::isOpacitySet((EshFill *)self->mFill))
    return EshFill::getOpacity((EshFill *)self->mFill);
  else
    return -[OABPropertiesManager fillFgAlpha](self->mMasterManager, "fillFgAlpha");
}

- (unsigned)fillBlipID
{
  if (EshFill::isBlipSet((EshFill *)self->mFill)
    && EshFill::isBlipId((EshFill *)self->mFill))
  {
    return EshFill::getBlipId((EshFill *)self->mFill);
  }
  else
  {
    return -[OABPropertiesManager fillBlipID](self->mMasterManager, "fillBlipID");
  }
}

- (id)fillBlipName
{
  void *BlipName;

  if (EshFill::isBlipNameSet((EshFill *)self->mFill))
  {
    BlipName = EshFill::getBlipName((EshFill *)self->mFill);
    if (BlipName)
      BlipName = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", BlipName);
  }
  else
  {
    -[OABPropertiesManager fillBlipName](self->mMasterManager, "fillBlipName");
    BlipName = (void *)objc_claimAutoreleasedReturnValue();
  }
  return BlipName;
}

- (EshBlip)fillBlipDataReference
{
  if (EshFill::isBlipSet((EshFill *)self->mFill) && (EshFill::isBlipId((EshFill *)self->mFill) & 1) == 0)
    return (EshBlip *)EshFill::getBlipRecordReference((EshFill *)self->mFill);
  else
    return 0;
}

- (int)fillAngle
{
  if (EshFill::isAngleSet((EshFill *)self->mFill))
    return EshFill::getAngle((EshFill *)self->mFill);
  else
    return -[OABPropertiesManager fillAngle](self->mMasterManager, "fillAngle");
}

- (int)fillFocus
{
  if (EshFill::isFocusSet((EshFill *)self->mFill))
    return EshFill::getFocus((EshFill *)self->mFill);
  else
    return -[OABPropertiesManager fillFocus](self->mMasterManager, "fillFocus");
}

- (EshColor)fillBgColor
{
  EshColor *v2;
  EshColor *v4;
  const EshColor *Color2;
  OABPropertiesManager *mMasterManager;

  v4 = v2;
  if (EshFill::isColor2Set((EshFill *)self->mFill))
  {
    Color2 = (const EshColor *)EshFill::getColor2((EshFill *)self->mFill);
    return (EshColor)EshColor::EshColor(v4, Color2);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    if (mMasterManager)
      return (EshColor)-[OABPropertiesManager fillBgColor](mMasterManager, "fillBgColor");
    else
      *v4 = 0;
  }
  return (EshColor)mMasterManager;
}

- (const)fillGradientColors
{
  if (EshFill::isColorsSet((EshFill *)self->mFill))
    return EshFill::getColors((EshFill *)self->mFill);
  else
    return (const void *)-[OABPropertiesManager fillGradientColors](self->mMasterManager, "fillGradientColors");
}

- (int)fillBgAlpha
{
  if (EshFill::isOpacity2Set((EshFill *)self->mFill))
    return EshFill::getOpacity2((EshFill *)self->mFill);
  else
    return -[OABPropertiesManager fillBgAlpha](self->mMasterManager, "fillBgAlpha");
}

- (int)fillFocusLeft
{
  if (EshFill::isFocusLeftSet((EshFill *)self->mFill))
    return EshFill::getFocusLeft((EshFill *)self->mFill);
  else
    return -[OABPropertiesManager fillFocusLeft](self->mMasterManager, "fillFocusLeft");
}

- (int)fillFocusTop
{
  if (EshFill::isFocusTopSet((EshFill *)self->mFill))
    return EshFill::getFocusTop((EshFill *)self->mFill);
  else
    return -[OABPropertiesManager fillFocusTop](self->mMasterManager, "fillFocusTop");
}

- (int)fillFocusRight
{
  if (EshFill::isFocusRightSet((EshFill *)self->mFill))
    return EshFill::getFocusRight((EshFill *)self->mFill);
  else
    return -[OABPropertiesManager fillFocusRight](self->mMasterManager, "fillFocusRight");
}

- (int)fillFocusBottom
{
  if (EshFill::isFocusBottomSet((EshFill *)self->mFill))
    return EshFill::getFocusBottom((EshFill *)self->mFill);
  else
    return -[OABPropertiesManager fillFocusBottom](self->mMasterManager, "fillFocusBottom");
}

- (BOOL)isStroked
{
  return 0;
}

- (EshColor)strokeFgColor
{
  _QWORD *v2;
  OABPropertiesManager *mMasterManager;

  mMasterManager = self->mMasterManager;
  if (mMasterManager)
    return (EshColor)-[OABPropertiesManager strokeFgColor](mMasterManager, "strokeFgColor");
  else
    *v2 = 0;
  return (EshColor)mMasterManager;
}

- (EshColor)strokeBgColor
{
  _QWORD *v2;
  OABPropertiesManager *mMasterManager;

  mMasterManager = self->mMasterManager;
  if (mMasterManager)
    return (EshColor)-[OABPropertiesManager strokeBgColor](mMasterManager, "strokeBgColor");
  else
    *v2 = 0;
  return (EshColor)mMasterManager;
}

- (EshColor)shadowColor
{
  _QWORD *v2;
  OABPropertiesManager *mMasterManager;

  mMasterManager = self->mMasterManager;
  if (mMasterManager)
    return (EshColor)-[OABPropertiesManager shadowColor](mMasterManager, "shadowColor");
  else
    *v2 = 0;
  return (EshColor)mMasterManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMasterManager, 0);
}

@end
