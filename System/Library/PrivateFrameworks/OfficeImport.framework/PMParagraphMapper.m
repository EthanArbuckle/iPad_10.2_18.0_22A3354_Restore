@implementation PMParagraphMapper

- (PMParagraphMapper)initWithOadParagraph:(id)a3 parent:(id)a4
{
  id v7;
  PMParagraphMapper *v8;
  PMParagraphMapper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMParagraphMapper;
  v8 = -[CMMapper initWithParent:](&v11, sel_initWithParent_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->mParagraph, a3);

  return v9;
}

- (void)mapAt:(id)a3 withState:(id)a4 isFirstParagraph:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  PMBulletMapper *v12;
  BOOL v13;
  PMBulletMapper *v14;
  void *v15;
  unint64_t i;
  PMTextRunMapper *v17;
  void *v18;
  PMTextRunMapper *v19;
  void *v20;
  id v21;
  id v22;

  v5 = a5;
  v22 = a3;
  v8 = a4;
  if (!self->mParagraph)
    goto LABEL_14;
  v9 = (void *)MEMORY[0x22E2DDB58]();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addChild:", v10);
  v21 = -[PMParagraphMapper copyParagraphStyleWithState:isFirstParagraph:](self, "copyParagraphStyleWithState:isFirstParagraph:", v8, v5);
  if (!objc_msgSend(v10, "childrenCount"))
    -[PMParagraphMapper addEndCharacterStyleToStyle:](self, "addEndCharacterStyleToStyle:", v21);
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v10, v21);
  v11 = v10;

  -[OADParagraph properties](self->mParagraph, "properties");
  v12 = (PMBulletMapper *)objc_claimAutoreleasedReturnValue();
  if (-[PMBulletMapper hasBulletProperties](v12, "hasBulletProperties"))
  {
    v13 = -[OADParagraph isEmpty](self->mParagraph, "isEmpty");

    if (v13)
      goto LABEL_8;
    v14 = [PMBulletMapper alloc];
    -[OADParagraph properties](self->mParagraph, "properties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PMBulletMapper initWithOadProperties:fontSize:parent:](v14, "initWithOadProperties:fontSize:parent:", v15, -[PMParagraphMapper firstTextRunFontSize](self, "firstTextRunFontSize"), self);

    -[PMBulletMapper mapAt:withState:](v12, "mapAt:withState:", v11, v8);
  }

LABEL_8:
  for (i = 0; i < -[OADParagraph textRunCount](self->mParagraph, "textRunCount"); ++i)
  {
    v17 = [PMTextRunMapper alloc];
    -[OADParagraph textRunAtIndex:](self->mParagraph, "textRunAtIndex:", i);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PMTextRunMapper initWithOadTextRun:parent:](v17, "initWithOadTextRun:parent:", v18, self);

    -[PMTextRunMapper mapAt:withState:](v19, "mapAt:withState:", v11, v8);
  }
  if (!objc_msgSend(v11, "childrenCount"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 160);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStringValue:", v20);

  }
  objc_autoreleasePoolPop(v9);
  v22 = v11;
LABEL_14:

}

- (id)copyParagraphStyleWithState:(id)a3 isFirstParagraph:(BOOL)a4
{
  void *v6;
  CMStyle *v7;
  unsigned int v8;
  float v9;
  float v10;
  CMMapper **p_mParent;
  id WeakRetained;
  id v13;
  char v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;

  -[OADParagraph properties](self->mParagraph, "properties", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(CMStyle);
  if (objc_msgSend(v6, "hasAlign"))
  {
    if (objc_msgSend(v6, "align"))
    {
      v8 = objc_msgSend(v6, "align") - 1;
      if (v8 < 3)
        -[CMStyle appendPropertyForName:stringValue:](v7, "appendPropertyForName:stringValue:", 0x24F3E70D8, *(&off_24F3BFB08)[(char)v8]);
    }
  }
  if (objc_msgSend(v6, "hasLeftMargin"))
  {
    objc_msgSend(v6, "leftMargin");
    if (v9 != 0.0)
    {
      objc_msgSend(v6, "leftMargin");
      -[CMStyle appendPropertyForName:length:unit:](v7, "appendPropertyForName:length:unit:", 0x24F3D5678, 1, v10);
    }
  }
  p_mParent = &self->super.mParent;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mParent);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)p_mParent);
    v14 = objc_msgSend(v13, "isTableCellContent");

    if ((v14 & 1) != 0)
      goto LABEL_15;
  }
  else
  {

  }
  if (objc_msgSend(v6, "hasIndent"))
  {
    objc_msgSend(v6, "indent");
    if (v15 != 0.0)
    {
      objc_msgSend(v6, "indent");
      -[CMStyle appendPropertyForName:length:unit:](v7, "appendPropertyForName:length:unit:", 0x24F3E70F8, 1, v16);
    }
  }
LABEL_15:
  if (objc_msgSend(v6, "hasLineSpacing"))
  {
    objc_msgSend(v6, "lineSpacing");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMStyle appendPropertyForName:oadTextSpacing:](v7, "appendPropertyForName:oadTextSpacing:", 0x24F3E6F58, v17);

  }
  if (objc_msgSend(v6, "hasBeforeSpacing") && !a4)
  {
    objc_msgSend(v6, "beforeSpacing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    -[CMStyle appendPropertyForName:oadTextSpacing:lineHeight:unit:](v7, "appendPropertyForName:oadTextSpacing:lineHeight:unit:", 0x24F3E70B8, v18, 1);

  }
  if (objc_msgSend(v6, "hasAfterSpacing"))
  {
    objc_msgSend(v6, "afterSpacing");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    -[CMStyle appendPropertyForName:oadTextSpacing:lineHeight:unit:](v7, "appendPropertyForName:oadTextSpacing:lineHeight:unit:", 0x24F3E7058, v19, 1);

  }
  return v7;
}

- (void)addEndCharacterStyleToStyle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  OADSchemeFontReference *v7;
  NSString *v8;
  unint64_t v9;
  unint64_t v10;
  void *v12;
  uint64_t v13;
  CMStringProperty *v14;
  CMLengthProperty *v15;
  float v16;
  CMLengthProperty *v17;
  id v18;

  v18 = a3;
  -[OADParagraph paragraphEndCharacterProperties](self->mParagraph, "paragraphEndCharacterProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMParagraphMapper fontScheme](self, "fontScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasLatinFont"))
  {
    objc_msgSend(v4, "latinFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "latinFont");
      v7 = (OADSchemeFontReference *)objc_claimAutoreleasedReturnValue();
      v9 = OADSchemeFontReference::schemeFontReferenceWithString(v7, v8);
      v10 = HIDWORD(v9);
      if ((_DWORD)v9 != -1 && HIDWORD(v9) != -1)
      {
        objc_msgSend(v5, "fontForId:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "baseFontForId:", v10);
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = (OADSchemeFontReference *)v13;
      }
      v14 = -[CMStringProperty initWithString:]([CMStringProperty alloc], "initWithString:", v7);
      objc_msgSend(v18, "addProperty:forKey:", v14, 0x24F3D6278);

    }
  }
  if (objc_msgSend(v4, "hasSize"))
  {
    v15 = [CMLengthProperty alloc];
    objc_msgSend(v4, "size");
    v17 = -[CMLengthProperty initWithNumber:unit:](v15, "initWithNumber:unit:", 1, v16);
    objc_msgSend(v18, "addProperty:forKey:", v17, 0x24F3D6298);

  }
}

- (id)fontScheme
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CMMapper parent](self, "parent");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v3, "parent");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
      if (!v4)
        goto LABEL_5;
    }
    objc_msgSend(v3, "defaultTheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "baseStyles");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fontScheme");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
LABEL_5:
    v5 = 0;
  }
  return v5;
}

- (int)firstTextRunFontSize
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  int v7;

  if (!-[OADParagraph textRunCount](self->mParagraph, "textRunCount"))
    return 0;
  -[OADParagraph textRunAtIndex:](self->mParagraph, "textRunAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasSize"))
    {
      objc_msgSend(v5, "size");
      v7 = (int)v6;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mParagraph, 0);
}

@end
