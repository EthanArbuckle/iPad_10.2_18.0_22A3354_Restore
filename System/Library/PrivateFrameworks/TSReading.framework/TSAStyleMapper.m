@implementation TSAStyleMapper

- (id)pTargetParentForStyle:(id)a3 withParentIdentifier:(id)a4
{
  id result;
  id v8;
  objc_super v9;

  result = -[TSSStylesheet cascadedStyleWithIdentifier:](self->super._targetStylesheet, "cascadedStyleWithIdentifier:", a4);
  if (result)
    return result;
  result = (id)String(a4);
  if (!result)
    return result;
  v8 = result;
  if (objc_msgSend(result, "isEqualToString:", TSWPTextPackageStringForPreset()))
  {
    if (String(a4))
    {
LABEL_6:
      result = -[TSSStylesheet cascadedStyleWithIdentifier:componentMask:](self->super._targetStylesheet, "cascadedStyleWithIdentifier:componentMask:", a4, 13);
      if (result)
        return result;
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        result = -[TSSStylesheet defaultListStyle](-[TSSStyleMapper targetStylesheet](self, "targetStylesheet"), "defaultListStyle");
        if (result)
          return result;
        goto LABEL_14;
      }
      goto LABEL_6;
    }
LABEL_13:
    result = -[TSSStylesheet defaultParagraphStyle](-[TSSStyleMapper targetStylesheet](self, "targetStylesheet"), "defaultParagraphStyle");
    if (result)
      return result;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_msgSend(v8, "isEqualToString:", TSTTableNameStylePrefix[0]) & 1) != 0
     || objc_msgSend(v8, "isEqualToString:", TSTTextStylePrefix)))
  {
    goto LABEL_13;
  }
LABEL_14:
  v9.receiver = self;
  v9.super_class = (Class)TSAStyleMapper;
  result = -[TSSStyleMapper pTargetParentForStyle:withParentIdentifier:](&v9, sel_pTargetParentForStyle_withParentIdentifier_, a3, a4);
  if (!result)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      return -[TSSStylesheet defaultParagraphStyle](-[TSSStyleMapper targetStylesheet](self, "targetStylesheet"), "defaultParagraphStyle");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        return -[TSSStylesheet defaultCharacterStyle](-[TSSStyleMapper targetStylesheet](self, "targetStylesheet"), "defaultCharacterStyle");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          return -[TSSStylesheet defaultListStyle](-[TSSStyleMapper targetStylesheet](self, "targetStylesheet"), "defaultListStyle");
        else
          return 0;
      }
    }
  }
  return result;
}

@end
