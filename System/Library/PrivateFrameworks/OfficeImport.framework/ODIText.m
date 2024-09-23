@implementation ODIText

+ (void)mapTextFromPoint:(id)a3 toShape:(id)a4 isCentered:(BOOL)a5 includeChildren:(BOOL)a6 state:(id)a7
{
  objc_msgSend(a1, "mapTextFromPoint:toShape:isCenteredHorizontally:isCenteredVertically:includeChildren:state:", a3, a4, a5, a5, a6, a7);
}

+ (void)mapTextFromPoint:(id)a3 toShape:(id)a4 isCenteredHorizontally:(BOOL)a5 isCenteredVertically:(BOOL)a6 includeChildren:(BOOL)a7 state:(id)a8
{
  _BOOL8 v9;
  _BOOL4 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  double v26;
  double v27;
  float v28;
  unsigned int v29;
  float v30;
  int v31;
  int v32;
  void *v33;
  double v34;
  void *v35;
  int v36;
  void *v37;
  id v38;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v38 = a3;
  v14 = a4;
  v15 = a8;
  objc_msgSend(v38, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMergedWithParent:", 0);
  if ((objc_msgSend(v17, "hasTextAnchorType") & 1) == 0)
  {
    if (v10)
    {
      objc_msgSend(v38, "children");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count") == 0;

    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v17, "setTextAnchorType:", v19);
  }
  objc_msgSend(v14, "textBody");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setProperties:", v17);
  objc_msgSend(a1, "baseListStyleForPoint:shape:isCentered:state:", v38, v14, v11, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addTextFromPoint:level:includeChildren:toShape:baseListStyle:state:", v38, 0, v9, v14, v21, v15);
  objc_msgSend(v16, "setProperties:", 0);
  objc_msgSend(v14, "drawableProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "orientedBounds");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "rotation");
  v25 = v24;
  objc_msgSend(v23, "flipY");
  TSUNormalizeAngleInDegrees(v25);
  *(float *)&v26 = v26;
  TSUNormalizeAngleInDegrees((float)(*(float *)&v26 + 45.0));
  v28 = v27 / 90.0;
  v29 = vcvtms_s32_f32(v28);
  v30 = (float)(int)floorf(v28);
  v31 = (v29 + 3) & 3;
  if ((int)(v29 + 3) <= 0)
    v31 = -(-(v29 + 3) & 3);
  if (v30 != v28)
    v31 = v29;
  if ((v29 & 1) != 0)
    v32 = v29;
  else
    v32 = v31;
  objc_msgSend(v20, "properties");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v33;
  if (v32 >= 0)
    v36 = v32;
  else
    v36 = v32 + 1;
  *(float *)&v34 = (float)(180 * (v36 >> 1));
  objc_msgSend(v33, "setRotation:", v34);

  objc_msgSend(v20, "properties");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFlowType:", (v32 << 31 >> 31) & 3);

}

+ (id)baseListStyleForPoint:(id)a3 shape:(id)a4 isCentered:(BOOL)a5 state:(id)a6
{
  _BOOL4 v6;
  id v8;
  id v9;
  OADTextListStyle *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  float v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  uint64_t v22;
  float v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  OADCharacterBulletProperties *v28;
  __int16 v30;

  v6 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(OADTextListStyle);
  +[OAITOrientedBounds absoluteOrientedBoundsOfDrawable:](OAITOrientedBounds, "absoluteOrientedBoundsOfDrawable:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;

  if (v13 >= v15)
    v16 = v15;
  else
    v16 = v13;
  v17 = v16 * 0.200000003;
  if (v17 >= 9.0)
    v18 = v17;
  else
    v18 = 9.0;
  if (v6)
  {
    objc_msgSend(v8, "children");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count") == 0;

  }
  else
  {
    v20 = 0;
  }
  v30 = 8226;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v30, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = fminf(v18, 100.0);
  do
  {
    -[OADTextListStyle propertiesForListLevel:](v10, "propertiesForListLevel:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v25 = v23;
    objc_msgSend(v24, "setSize:", v25);
    objc_msgSend(v24, "setAlign:", v20);
    if (v22)
    {
      v26 = v23 * 0.8 * (double)(v22 - 1);
      *(float *)&v26 = v26;
      objc_msgSend(v24, "setLeftMargin:", v26);
      *(float *)&v27 = v23;
      objc_msgSend(v24, "setIndent:", v27);
      v28 = -[OADCharacterBulletProperties initWithBullet:]([OADCharacterBulletProperties alloc], "initWithBullet:", v21);
      objc_msgSend(v24, "setBulletProperties:", v28);

    }
    ++v22;
  }
  while (v22 != 9);

  return v10;
}

+ (void)addTextFromPoint:(id)a3 level:(unsigned int)a4 includeChildren:(BOOL)a5 toShape:(id)a6 baseListStyle:(id)a7 state:(id)a8
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  id v37;

  v34 = a5;
  v35 = a3;
  v37 = a6;
  v12 = a7;
  v13 = a8;
  objc_msgSend(v35, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v13, "textStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applyToTextBody:", v14);

    v16 = objc_msgSend(v14, "paragraphCount");
    objc_msgSend(v14, "textListStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 || (objc_msgSend(v14, "overrideTextListStyle"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      for (i = 0; i != 9; ++i)
      {
        objc_msgSend(v17, "propertiesForListLevel:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (a4 + i >= 8)
          v20 = 8;
        else
          v20 = a4 + i;
        objc_msgSend(v12, "propertiesForListLevel:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setParent:", v21);

      }
      v22 = v17;
    }
    else if (v16)
    {
      for (j = 0; j != v16; ++j)
      {
        v28 = v14;
        objc_msgSend(v14, "paragraphAtIndex:", j);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "properties");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "level") + a4;
        if (v31 >= 8)
          v32 = 8;
        else
          v32 = v31;
        objc_msgSend(v12, "propertiesForListLevel:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setParent:", v33);

        v14 = v28;
      }
      v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v37, "textBody");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addParagraphsFromTextBody:", v14);

    if (v34)
    {
      objc_msgSend(v35, "children");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectEnumerator");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      while (1)
      {
        objc_msgSend(v25, "nextObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
          break;
        objc_msgSend(a1, "addTextFromPoint:level:includeChildren:toShape:baseListStyle:state:", v26, a4 + 1, 1, v37, v12, v13);

      }
    }

  }
}

@end
