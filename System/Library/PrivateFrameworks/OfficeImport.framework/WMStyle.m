@implementation WMStyle

- (id)cssStyleString
{
  objc_super v4;

  -[WMStyle ResoveInterPropertyDependencies](self, "ResoveInterPropertyDependencies");
  v4.receiver = self;
  v4.super_class = (Class)WMStyle;
  -[CMStyle cssStyleString](&v4, sel_cssStyleString);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)ResoveInterPropertyDependencies
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  float v11;
  float v12;
  double v13;
  CMLengthProperty *v14;
  void *v15;

  -[NSMutableDictionary objectForKey:](self->super.properties, "objectForKey:", CFSTR("vertical-align"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v15 = v3;
    v5 = objc_msgSend(v3, "value");
    v4 = v15;
    if (v5)
    {
      -[NSMutableDictionary objectForKey:](self->super.properties, "objectForKey:", CFSTR("font-size"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "value");
        v9 = v8;
        v10 = objc_msgSend(v7, "unitType");
        v11 = v9;
        v12 = v11 * 0.66;
        v13 = (double)(int)v12;
      }
      else
      {
        v13 = 7.0;
        v10 = 1;
      }
      v14 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", v10, v13);
      -[NSMutableDictionary setObject:forKey:](self->super.properties, "setObject:forKey:", v14, CFSTR("font-size"));

      v4 = v15;
    }
  }

}

- (WMStyle)initWithWDStyle:(id)a3
{
  return -[WMStyle initWithWDStyle:isInTextFrame:](self, "initWithWDStyle:isInTextFrame:", a3, 0);
}

- (WMStyle)initWithWDStyle:(id)a3 isInTextFrame:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  WMStyle *v9;
  WMStyle *v10;
  void *v11;
  WMStyle *v12;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "baseStyle");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7 || (id)v7 == v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)WMStyle;
    v9 = -[CMStyle init](&v14, sel_init);
  }
  else
  {
    v9 = -[WMStyle initWithWDStyle:isInTextFrame:](self, "initWithWDStyle:isInTextFrame:", v7, v4);
  }
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v6, "characterProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMStyle addCharacterProperties:](v10, "addCharacterProperties:", v11);

    v12 = v10;
  }

  return v10;
}

- (void)addCharacterProperties:(id)a3
{
  CMToggleProperty *v4;
  void *v5;
  CMToggleProperty *v6;
  void *v7;
  CMToggleProperty *v8;
  void *v9;
  CMToggleProperty *v10;
  void *v11;
  CMLengthProperty *v12;
  WMEnumProperty *v13;
  CMStringProperty *v14;
  void *v15;
  void *v16;
  CMStringProperty *v17;
  WMEnumProperty *v18;
  void *v19;
  CMColorProperty *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CMColorProperty *v25;
  id v26;

  v26 = a3;
  if (objc_msgSend(v26, "isRightToLeftOverridden") && objc_msgSend(v26, "rightToLeft"))
    -[CMStyle appendPropertyForName:stringValue:](self, "appendPropertyForName:stringValue:", CFSTR("direction"), CFSTR("rtl"));
  if (objc_msgSend(v26, "isBoldOverridden"))
  {
    v4 = -[CMToggleProperty initWithCMTogglePropertyValue:]([CMToggleProperty alloc], "initWithCMTogglePropertyValue:", objc_msgSend(v26, "bold"));
    -[CMStyle propertyForName:](self, "propertyForName:", 0x24F3D62D8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMToggleProperty resolveWithBaseProperty:](v4, "resolveWithBaseProperty:", v5);
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v4, 0x24F3D62D8);

  }
  if (objc_msgSend(v26, "isItalicOverridden"))
  {
    v6 = -[CMToggleProperty initWithCMTogglePropertyValue:]([CMToggleProperty alloc], "initWithCMTogglePropertyValue:", objc_msgSend(v26, "italic"));
    -[CMStyle propertyForName:](self, "propertyForName:", 0x24F3D6318);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMToggleProperty resolveWithBaseProperty:](v6, "resolveWithBaseProperty:", v7);
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v6, 0x24F3D6318);

  }
  if (objc_msgSend(v26, "isStrikeThroughOverridden"))
  {
    v8 = -[CMToggleProperty initWithCMTogglePropertyValue:]([CMToggleProperty alloc], "initWithCMTogglePropertyValue:", objc_msgSend(v26, "strikeThrough"));
    -[CMStyle propertyForName:](self, "propertyForName:", 0x24F3E7198);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMToggleProperty resolveWithBaseProperty:](v8, "resolveWithBaseProperty:", v9);
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v8, 0x24F3E7198);

  }
  if (objc_msgSend(v26, "isDoubleStrikeThroughOverridden"))
  {
    v10 = -[CMToggleProperty initWithCMTogglePropertyValue:]([CMToggleProperty alloc], "initWithCMTogglePropertyValue:", objc_msgSend(v26, "doubleStrikeThrough"));
    -[CMStyle propertyForName:](self, "propertyForName:", 0x24F3E7198);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMToggleProperty resolveWithBaseProperty:](v10, "resolveWithBaseProperty:", v11);
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v10, 0x24F3E7198);

  }
  if (objc_msgSend(v26, "isFontSizeOverridden"))
  {
    v12 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 6, (double)objc_msgSend(v26, "fontSize"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v12, 0x24F3D6298);

  }
  if (objc_msgSend(v26, "isVerticalAlignOverridden"))
  {
    v13 = -[WMEnumProperty initWithEnum:]([WMEnumProperty alloc], "initWithEnum:", objc_msgSend(v26, "verticalAlign"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v13, 0x24F3E6698);

  }
  if (objc_msgSend(v26, "isFontOverridden"))
  {
    v14 = [CMStringProperty alloc];
    objc_msgSend(v26, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CMStringProperty initWithString:](v14, "initWithString:", v16);

    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v17, 0x24F3D6278);
  }
  if (objc_msgSend(v26, "isUnderlineOverridden"))
  {
    v18 = -[WMEnumProperty initWithEnum:]([WMEnumProperty alloc], "initWithEnum:", objc_msgSend(v26, "underline"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v18, 0x24F3D6358);

  }
  if (objc_msgSend(v26, "isSmallCapsOverridden") && (objc_msgSend(v26, "smallCaps") & 0xFFFFFF7F) == 1)
    -[CMStyle appendPropertyForName:stringWithColons:](self, "appendPropertyForName:stringWithColons:", CFSTR("font-variant"), CFSTR(":small-caps;"));
  if (objc_msgSend(v26, "isCapsOverridden") && (objc_msgSend(v26, "caps") & 0xFFFFFF7F) == 1)
    -[CMStyle appendPropertyForName:stringWithColons:](self, "appendPropertyForName:stringWithColons:", CFSTR("text-transform"), CFSTR(":uppercase;"));
  if (objc_msgSend(v26, "isColorOverridden"))
  {
    objc_msgSend(v26, "color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CMColorProperty initWithColor:]([CMColorProperty alloc], "initWithColor:", v19);
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v20, CFSTR("color"));

  }
  if (objc_msgSend(v26, "isShadingOverridden"))
  {
    objc_msgSend(v26, "shading");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "background");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "alphaComponent");
      if (v24 == 1.0)
      {
        v25 = -[CMColorProperty initWithColor:]([CMColorProperty alloc], "initWithColor:", v23);
        -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v25, 0x24F3E6CB8);

      }
    }

  }
}

- (WMStyle)initWithWMStyle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WMStyle;
  return -[CMStyle initWithStyle:](&v4, sel_initWithStyle_, a3);
}

- (WMStyle)initWithWDCharacterProperties:(id)a3
{
  id v4;
  WMStyle *v5;
  WMStyle *v6;
  WMStyle *v7;

  v4 = a3;
  v5 = -[CMStyle init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[WMStyle addCharacterProperties:](v5, "addCharacterProperties:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)cascadeWithStyle:(id)a3
{
  void *v4;
  void *v5;
  void *i;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; i = (void *)v7)
  {
    objc_msgSend(v5, "nextObject");
    v7 = objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    objc_msgSend(v4, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CMStyle attributeForName:](self, "attributeForName:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resolveWithBaseProperty:", v9);

    }
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v8, v7);

  }
}

@end
