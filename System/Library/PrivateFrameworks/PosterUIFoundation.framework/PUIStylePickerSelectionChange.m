@implementation PUIStylePickerSelectionChange

- (BOOL)hasChanges
{
  objc_class *v3;
  objc_property_t *v4;
  uint64_t v5;
  const char *Name;
  NSString *v7;
  SEL v8;
  void *v9;
  BOOL v10;
  unsigned int outCount;

  outCount = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = class_copyPropertyList(v3, &outCount);
  if (outCount)
  {
    v5 = 0;
    while (1)
    {
      Name = property_getName(v4[v5]);
      if (Name)
      {
        v7 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", Name);
        v8 = NSSelectorFromString(v7);

        ((void (*)(PUIStylePickerSelectionChange *, SEL))-[PUIStylePickerSelectionChange methodForSelector:](self, "methodForSelector:", v8))(self, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          break;
      }
      if (++v5 >= (unint64_t)outCount)
        goto LABEL_6;
    }
    v10 = 1;
  }
  else
  {
LABEL_6:
    v10 = 0;
  }
  free(v4);
  return v10;
}

- (NSString)fontIdentifier
{
  return self->_fontIdentifier;
}

- (void)setFontIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fontIdentifier, a3);
}

- (NSNumber)preferredAlignment
{
  return self->_preferredAlignment;
}

- (void)setPreferredAlignment:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAlignment, a3);
}

- (NSNumber)preferredLayout
{
  return self->_preferredLayout;
}

- (void)setPreferredLayout:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLayout, a3);
}

- (NSNumber)fontWeight
{
  return self->_fontWeight;
}

- (void)setFontWeight:(id)a3
{
  objc_storeStrong((id *)&self->_fontWeight, a3);
}

- (NSNumber)isSystemItem
{
  return self->_isSystemItem;
}

- (void)setSystemItem:(id)a3
{
  objc_storeStrong((id *)&self->_isSystemItem, a3);
}

- (UIFont)customFont
{
  return self->_customFont;
}

- (void)setCustomFont:(id)a3
{
  objc_storeStrong((id *)&self->_customFont, a3);
}

- (PUINumberingSystem)numberingSystem
{
  return self->_numberingSystem;
}

- (void)setNumberingSystem:(id)a3
{
  objc_storeStrong((id *)&self->_numberingSystem, a3);
}

- (PUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (NSNumber)isSuggestedStyle
{
  return self->_isSuggestedStyle;
}

- (void)setSuggestedStyle:(id)a3
{
  objc_storeStrong((id *)&self->_isSuggestedStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isSuggestedStyle, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_numberingSystem, 0);
  objc_storeStrong((id *)&self->_customFont, 0);
  objc_storeStrong((id *)&self->_isSystemItem, 0);
  objc_storeStrong((id *)&self->_fontWeight, 0);
  objc_storeStrong((id *)&self->_preferredLayout, 0);
  objc_storeStrong((id *)&self->_preferredAlignment, 0);
  objc_storeStrong((id *)&self->_fontIdentifier, 0);
}

@end
