@implementation OABShape

+ (void)readGraphicDefaults:(id)a3 to:(id)a4 state:(id)a5
{
  id v7;
  const void *v8;
  void *v9;
  OABShapeBaseManager *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  v8 = (const void *)objc_msgSend(a3, "eshObject");
  if (v8)
  {
    if (v9)
    {
      v10 = -[OABShapeBaseManager initWithShapeBase:shapeType:masterShape:]([OABShapeBaseManager alloc], "initWithShapeBase:shapeType:masterShape:", v9, 1, 0);
      +[OABFill readFillFromFillPropertiesManager:state:](OABFill, "readFillFromFillPropertiesManager:state:", v10, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFill:", v11);

      +[OABStroke readStrokeFromShapeBaseManager:state:](OABStroke, "readStrokeFromShapeBaseManager:state:", v10, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setStroke:", v12);

      +[OABShadow readShadowFromShapeBaseManager:state:](OABShadow, "readShadowFromShapeBaseManager:state:", v10, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEffects:", v13);

    }
  }

}

+ (id)readShape:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "readShapeFromXml:state:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_opt_class();
    TSUDynamicCast(v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = v8;
      goto LABEL_6;
    }

  }
  +[OABShape readShapeFromBinary:state:](OABShape, "readShapeFromBinary:state:", v6, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = v11;

  return v12;
}

+ (id)readShapeFromBinary:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  CHDChart *v9;
  CHDChart *v10;
  EshShapeImageData *v11;
  CHDChart *v12;
  CHDChart *v13;
  int isConnector;
  __objc2_class **v15;
  uint64_t MasterId;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  OABShapeManager *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CHDChart *v30;
  CHDChart *v32;
  EshContentProperties *v33;
  void *v34;

  v5 = a3;
  v6 = a4;
  v34 = v5;
  v7 = objc_msgSend(v5, "eshShape");
  v33 = (EshContentProperties *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 160))(v7);
  v8 = objc_msgSend(v5, "eshShape");
  if (objc_msgSend(v5, "isChart"))
  {
    v9 = 0;
    v10 = objc_alloc_init(CHDChart);
  }
  else
  {
    v11 = (EshShapeImageData *)(v8 + 480);
    if ((EshShapeImageData::isBlipSet(v11) & 1) == 0
      && (EshShapeImageData::isBlipNameSet(v11) & 1) == 0
      && EshShapeProperties::getShapeType((EshShapeProperties *)(v7 + 424)) != 75)
    {
      v9 = 0;
      goto LABEL_10;
    }
    v10 = objc_alloc_init(OADImage);
    v9 = v10;
  }
  v12 = v10;
  if (v10)
  {
    v13 = 0;
    goto LABEL_13;
  }
LABEL_10:
  isConnector = EshShape::isConnector((EshShape *)v7);
  v15 = off_24F399328;
  if (!isConnector)
    v15 = off_24F399360;
  v13 = (CHDChart *)objc_alloc_init(*v15);
  v12 = v13;
LABEL_13:
  if (EshShapeProperties::isMasterIdSet((EshShapeProperties *)(v7 + 424)))
  {
    MasterId = EshShapeProperties::getMasterId((EshShapeProperties *)(v7 + 424));
    objc_msgSend(v6, "drawableForShapeId:", MasterId);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[OADGraphic setMasterGraphic:](v12, "setMasterGraphic:", v17);
    objc_msgSend(v6, "contentObjectForId:", MasterId);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "eshObject");
    if (v19 && (*(unsigned int (**)(uint64_t))(*(_QWORD *)v19 + 16))(v19) == 7)
      v20 = objc_msgSend(v18, "eshShape");
    else
      v20 = 0;

  }
  else
  {
    v20 = 0;
  }
  +[OABContent readFromContentObject:toDrawable:state:](OABContent, "readFromContentObject:toDrawable:state:", v34, v12, v6);
  -[OADGraphic graphicProperties](v12, "graphicProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[OABShapeManager initWithShape:masterShape:]([OABShapeManager alloc], "initWithShape:masterShape:", v7, v20);
  +[OABFill readFillFromFillPropertiesManager:state:](OABFill, "readFillFromFillPropertiesManager:state:", v22, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFill:", v23);

  if (-[OABShapeManager isTextPath](v22, "isTextPath"))
  {
    +[OABWordArt readFromShapeManager:toShape:state:](OABWordArt, "readFromShapeManager:toShape:state:", v22, v13, v6);
  }
  else
  {
    if (v13)
      +[OABShapeGeometry readFromShape:toShape:](OABShapeGeometry, "readFromShape:toShape:", v7, v13);
    +[OABStroke readStrokeFromShapeBaseManager:state:](OABStroke, "readStrokeFromShapeBaseManager:state:", v22, v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setStroke:", v24);

    +[OABShadow readShadowFromShapeBaseManager:state:](OABShadow, "readShadowFromShapeBaseManager:state:", v22, v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setEffects:", v25);

    if (v9)
      +[OABImage readfromShape:toImage:state:](OABImage, "readfromShape:toImage:state:", v34, v9, v6);
  }
  if (EshContentProperties::isBehindTextSet(v33))
    objc_msgSend(v21, "setIsBehindText:", EshContentProperties::getBehindText(v33));
  if (EshShapeProperties::isAltSet((EshShapeProperties *)(v7 + 424)))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", EshShapeProperties::getAlt((EshShapeProperties *)(v7 + 424)));
    objc_msgSend(v21, "setAltTitle:", v26);

  }
  -[OADDrawable setDrawableProperties:](v12, "setDrawableProperties:", v21);
  objc_msgSend((id)objc_msgSend(v6, "client"), "readClientDataFromShape:toGraphic:state:", v34, v12, v6);
  if (v13 && !-[OABShapeManager isTextPath](v22, "isTextPath"))
  {
    v32 = v13;
    -[CHDChart textBody](v13, "textBody");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "properties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphic masterGraphic](v13, "masterGraphic");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABTextBodyProperties readTextBodyProperties:textBox:useDefaults:state:](OABTextBodyProperties, "readTextBodyProperties:textBox:useDefaults:state:", v28, v7 + 272, v29 == 0, v6);

    v13 = v32;
  }
  -[OADDrawable setHidden:](v12, "setHidden:", -[OABShapeManager hidden](v22, "hidden"));
  v30 = v12;

  return v30;
}

+ (id)readShapeFromXml:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  EshContentProperties *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "eshShape");
  if (objc_msgSend((id)objc_msgSend(v6, "client"), "xmlEquivalentOfDrawableCanBeUsed")
    && (v8 = (EshContentProperties *)(v7 + 424), EshContentProperties::isXmlEquivalentSet(v8)))
  {
    +[OABDrawable readDrawableFromZipPackageData:foundInObject:state:](OABDrawable, "readDrawableFromZipPackageData:foundInObject:state:", EshContentProperties::getXmlEquivalent(v8), v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_opt_class();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
