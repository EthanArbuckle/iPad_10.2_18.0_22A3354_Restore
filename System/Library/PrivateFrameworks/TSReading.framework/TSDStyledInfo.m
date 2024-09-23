@implementation TSDStyledInfo

- (Class)styleClass
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo styleClass]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 36, CFSTR("Subclasses must implement styleClass"));
  return 0;
}

- (TSSStyle)style
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo style]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 43, CFSTR("Subclasses must implement style"));
  return 0;
}

- (void)setStyle:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo setStyle:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 50, CFSTR("Subclasses must implement setStyle:"));
}

- (id)stylesForCopyStyle
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = -[TSDStyledInfo style](self, "style");
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

- (TSDStroke)stroke
{
  void *v3;
  uint64_t v4;

  if (!-[TSDStyledInfo style](self, "style"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo stroke]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 73, CFSTR("invalid nil value for '%s'"), "self.style");
  }
  return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSDStyledInfo style](self, "style"), "valueForProperty:", 517);
}

- (void)setStroke:(id)a3
{
  -[TSDStyledInfo i_setValue:forProperty:](self, "i_setValue:forProperty:", a3, 517);
}

- (float)opacity
{
  void *v3;
  uint64_t v4;
  float result;

  if (!-[TSDStyledInfo style](self, "style"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo opacity]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 85, CFSTR("invalid nil value for '%s'"), "self.style");
  }
  -[TSSStyle floatValueForProperty:](-[TSDStyledInfo style](self, "style"), "floatValueForProperty:", 518);
  return result;
}

- (void)setOpacity:(float)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  TSSPropertyMap *v8;
  TSSPropertyMap *v9;
  id v10;
  void *v11;
  uint64_t v12;
  float v13;

  v13 = a3;
  if (!-[TSDStyledInfo style](self, "style"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo setOpacity:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 92, CFSTR("invalid nil value for '%s'"), "self.style");
  }
  if (!-[TSSStyle stylesheet](-[TSDStyledInfo style](self, "style"), "stylesheet"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo setOpacity:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 93, CFSTR("invalid nil value for '%s'"), "self.style.stylesheet");
  }
  -[TSSStyle validateFloatValue:forProperty:](-[TSDStyledInfo style](self, "style"), "validateFloatValue:forProperty:", &v13, 518);
  -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 518);
  v8 = [TSSPropertyMap alloc];
  v9 = -[TSSPropertyMap initWithPropertiesAndValues:](v8, "initWithPropertiesAndValues:", 518, v13, 0, 0);
  v10 = -[TSSStylesheet variationOfStyle:propertyMap:](-[TSSStyle stylesheet](-[TSDStyledInfo style](self, "style"), "stylesheet"), "variationOfStyle:propertyMap:", -[TSDStyledInfo style](self, "style"), v9);
  -[TSDStyledInfo style](self, "style");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo setOpacity:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 100, CFSTR("Variation style is wrong style."));
  }
  -[TSDStyledInfo setStyle:](self, "setStyle:", v10);

}

- (TSDReflection)reflection
{
  void *v3;
  uint64_t v4;
  TSDReflection *v5;

  if (!-[TSDStyledInfo style](self, "style"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo reflection]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 109, CFSTR("invalid nil value for '%s'"), "self.style");
  }
  v5 = -[TSSStyle valueForProperty:](-[TSDStyledInfo style](self, "style"), "valueForProperty:", 519);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  else
    return v5;
}

- (void)setReflection:(id)a3
{
  if (!a3)
    a3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  -[TSDStyledInfo i_setValue:forProperty:](self, "i_setValue:forProperty:", a3, 519);
}

- (TSDShadow)shadow
{
  void *v3;
  uint64_t v4;
  TSDShadow *v5;

  if (!-[TSDStyledInfo style](self, "style"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo shadow]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 128, CFSTR("invalid nil value for '%s'"), "self.style");
  }
  v5 = -[TSSStyle valueForProperty:](-[TSDStyledInfo style](self, "style"), "valueForProperty:", 520);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  else
    return v5;
}

- (void)setShadow:(id)a3
{
  if (!a3)
    a3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  -[TSDStyledInfo i_setValue:forProperty:](self, "i_setValue:forProperty:", a3, 520);
}

- (id)boxedValueForProperty:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  if (!-[TSDStyledInfo style](self, "style"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo boxedValueForProperty:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 147, CFSTR("invalid nil value for '%s'"), "self.style");
  }
  if (-[TSSStyle containsProperty:](-[TSDStyledInfo style](self, "style"), "containsProperty:", v3))
    return -[TSSStyle boxedValueForProperty:](-[TSDStyledInfo style](self, "style"), "boxedValueForProperty:", v3);
  v8.receiver = self;
  v8.super_class = (Class)TSDStyledInfo;
  return -[TSDDrawableInfo boxedObjectForProperty:](&v8, sel_boxedObjectForProperty_, v3);
}

- (id)objectForProperty:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 515)
    return -[TSDStyledInfo style](self, "style");
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)TSDStyledInfo;
  return -[TSDDrawableInfo objectForProperty:](&v6, sel_objectForProperty_);
}

- (void)setBoxedValue:(id)a3 forProperty:(int)a4
{
  uint64_t v4;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  TSSPropertyMap *v16;

  v4 = *(_QWORD *)&a4;
  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo setBoxedValue:forProperty:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 169, CFSTR("invalid nil value for '%s'"), "value");
  }
  if (!-[TSDStyledInfo style](self, "style"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo setBoxedValue:forProperty:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 170, CFSTR("invalid nil value for '%s'"), "self.style");
  }
  if (!-[TSSStyle stylesheet](-[TSDStyledInfo style](self, "style"), "stylesheet"))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo setBoxedValue:forProperty:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 171, CFSTR("invalid nil value for '%s'"), "self.style.stylesheet");
  }
  -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", v4);
  v16 = -[TSSPropertyMap initWithCapacity:]([TSSPropertyMap alloc], "initWithCapacity:", 1);
  -[TSSPropertyMap setBoxedObject:forProperty:](v16, "setBoxedObject:forProperty:", a3, v4);
  v13 = -[TSSStylesheet variationOfStyle:propertyMap:](-[TSSStyle stylesheet](-[TSDStyledInfo style](self, "style"), "stylesheet"), "variationOfStyle:propertyMap:", -[TSDStyledInfo style](self, "style"), v16);
  -[TSDStyledInfo style](self, "style");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo setBoxedValue:forProperty:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 180, CFSTR("Variation style is wrong style."));
  }
  -[TSDStyledInfo setStyle:](self, "setStyle:", v13);

}

- (void)setValuesForProperties:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;

  if (!-[TSDStyledInfo style](self, "style"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo setValuesForProperties:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 189, CFSTR("invalid nil value for '%s'"), "self.style");
  }
  if (!-[TSSStyle stylesheet](-[TSDStyledInfo style](self, "style"), "stylesheet"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo setValuesForProperties:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 190, CFSTR("invalid nil value for '%s'"), "self.style.stylesheet");
  }
  -[TSDDrawableInfo willChangeProperties:](self, "willChangeProperties:", objc_msgSend(a3, "allProperties"));
  v9 = -[TSSStylesheet variationOfStyle:propertyMap:](-[TSSStyle stylesheet](-[TSDStyledInfo style](self, "style"), "stylesheet"), "variationOfStyle:propertyMap:", -[TSDStyledInfo style](self, "style"), a3);
  -[TSDStyledInfo style](self, "style");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo setValuesForProperties:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 195, CFSTR("Variation style is wrong style."));
  }
  -[TSDStyledInfo setStyle:](self, "setStyle:", v9);
}

- (void)i_setValue:(id)a3 forProperty:(int)a4
{
  uint64_t v4;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  TSSPropertyMap *v16;

  v4 = *(_QWORD *)&a4;
  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo i_setValue:forProperty:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 202, CFSTR("invalid nil value for '%s'"), "value");
  }
  if (!-[TSDStyledInfo style](self, "style"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo i_setValue:forProperty:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 203, CFSTR("invalid nil value for '%s'"), "self.style");
  }
  if (!-[TSSStyle stylesheet](-[TSDStyledInfo style](self, "style"), "stylesheet"))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo i_setValue:forProperty:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 204, CFSTR("invalid nil value for '%s'"), "self.style.stylesheet");
  }
  -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", v4);
  v16 = -[TSSPropertyMap initWithPropertiesAndValues:]([TSSPropertyMap alloc], "initWithPropertiesAndValues:", v4, a3, 0);
  v13 = -[TSSStylesheet variationOfStyle:propertyMap:](-[TSSStyle stylesheet](-[TSDStyledInfo style](self, "style"), "stylesheet"), "variationOfStyle:propertyMap:", -[TSDStyledInfo style](self, "style"), v16);
  -[TSDStyledInfo style](self, "style");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo i_setValue:forProperty:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 210, CFSTR("Variation style is wrong style."));
  }
  -[TSDStyledInfo setStyle:](self, "setStyle:", v13);

}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__TSDStyledInfo_adoptStylesheet_withMapper___block_invoke;
  v4[3] = &unk_24D82CC90;
  v4[4] = a4;
  -[TSDStyledInfo replaceReferencedStylesUsingBlock:](self, "replaceReferencedStylesUsingBlock:", v4);
}

uint64_t __44__TSDStyledInfo_adoptStylesheet_withMapper___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mappedStyleForStyle:", a2);
}

- (id)propertyMapForNewPreset
{
  return -[TSSStyle fullPropertyMap](-[TSDStyledInfo style](self, "style"), "fullPropertyMap");
}

- (id)styleIdentifierTemplateForNewPreset
{
  return -[TSSStyle styleIdentifier](-[TSSStyle baseStyleForVariation](-[TSDStyledInfo style](self, "style"), "baseStyleForVariation"), "styleIdentifier");
}

- (id)referencedStyles
{
  if (-[TSDStyledInfo style](self, "style"))
    return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", -[TSDStyledInfo style](self, "style"));
  else
    return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (void)replaceReferencedStylesUsingBlock:(id)a3
{
  TSSStyle *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;

  v5 = -[TSDStyledInfo style](self, "style");
  v6 = (*((uint64_t (**)(id, TSSStyle *))a3 + 2))(a3, v5);
  if (!v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo replaceReferencedStylesUsingBlock:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 246, CFSTR("Failed to map style %@"), v5);
  }
  -[TSDStyledInfo styleClass](self, "styleClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledInfo replaceReferencedStylesUsingBlock:]");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m");
    v12 = (objc_class *)objc_opt_class();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 247, CFSTR("style mapped returned style of class %@ for %@"), NSStringFromClass(v12), v5);
  }
  -[TSDStyledInfo setStyle:](self, "setStyle:", v6);
}

@end
