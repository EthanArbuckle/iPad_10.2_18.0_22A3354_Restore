@implementation PBSlideBase

+ (BOOL)readColorScheme:(id)a3 colorScheme:(id)a4 colorMap:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const void *v14;
  void *v15;
  BOOL v16;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "childOfType:instance:", 2032, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12
    && (v14 = (const void *)objc_msgSend(v12, "eshObject")) != 0
  {
    +[PBColorScheme readFromColorScheme:toColorScheme:colorMap:state:](PBColorScheme, "readFromColorScheme:toColorScheme:colorMap:state:", v15, v9, v10, v11);
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (void)readDrawingGroup:(id)a3 slide:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  OADMasterBackground *v17;
  void *v18;
  void *v19;
  const void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v22, "firstChildOfType:", 1036);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  if (objc_msgSend(v11, "childCount"))
  {
    objc_opt_class();
    objc_msgSend(v11, "childAt:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTgtSlide:", v8);
    objc_msgSend(v9, "officeArtState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABDrawing readDrawablesFromDrawing:state:](OABDrawing, "readDrawablesFromDrawing:state:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[PBHeadersFooters readHeadersFootersFromSlideContainer:toMasterSlide:drawables:state:](PBHeadersFooters, "readHeadersFootersFromSlideContainer:toMasterSlide:drawables:state:", v22, v8, v14, v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "showMasterShapes"))
        +[PBHeadersFooters readHeadersFootersFromSlideContainer:toSlide:drawables:state:](PBHeadersFooters, "readHeadersFootersFromSlideContainer:toSlide:drawables:state:", v22, v8, v14, v9);
    }
    objc_msgSend(v8, "setDrawables:", v14);
    objc_msgSend(v9, "tgtPresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cacheGraphicStylesForSlideBase:", v8);

    +[OABDrawing readBackgroundPropertiesFromDrawing:state:](OABDrawing, "readBackgroundPropertiesFromDrawing:state:", v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (objc_msgSend(a1, "slideFollowsMasterBackground:", v22))
      {
        v17 = objc_alloc_init(OADMasterBackground);
        objc_msgSend(v8, "setBackground:", v17);

      }
      else
      {
        objc_msgSend(v8, "setBackground:", v16);
      }
    }

  }
  objc_msgSend(v22, "firstChildOfType:", 1017);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = (const void *)objc_msgSend(v18, "eshObject");
    if (v20)
    {
      if (v21)
        objc_msgSend(a1, "parseSlideShowInfo:slideBase:state:", v21, v8, v9);
    }
  }

}

+ (BOOL)slideFollowsMasterBackground:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  const void *v10;
  _BYTE *v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "eshObject");
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4) == 1016
    || (v5 = objc_msgSend(v3, "eshObject"), (*(unsigned int (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5) == 1008))
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(v3, "eshObject");
    v8 = (*(unsigned int (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7) == 1006;
    TCVerifyInputMeetsCondition(v8);
    objc_msgSend(v3, "firstChildOfType:", 1007);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    TCVerifyInputMeetsCondition(v9 != 0);
    v10 = (const void *)objc_msgSend(v9, "eshObject");
    if (v10)
    else
      v11 = 0;
    TCVerifyInputMeetsCondition(v11 != 0);
    v6 = v11[94] != 0;

  }
  return v6;
}

+ (void)mapSlideNumberPlaceholder:(id)a3 tgtSlideBase:(id)a4 state:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v6, "placeholderWithType:placeholderTypeIndex:overrideIndex:", 5, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v9, "placeholderWithType:placeholderTypeIndex:overrideIndex:", 5, 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v6, "addSlideNumberPlaceholder:", v8);

  }
}

+ (void)parseSlideShowInfo:(PptSSSlideInfoAtom *)a3 slideBase:(id)a4 state:(id)a5
{
  PDTransition *v7;
  PDTransition *v8;
  int var11;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = objc_alloc_init(PDTransition);
  v8 = v7;
  var11 = a3->var11;
  if (var11)
    v10 = var11 != 2;
  else
    v10 = 2;
  -[PDTransition setSpeed:](v7, "setSpeed:", v10);
  -[PDTransition setIsAdvanceOnClick:](v8, "setIsAdvanceOnClick:", (a3->var10 & 0x400) == 0);
  -[PDTransition setAdvanceAfterTime:](v8, "setAdvanceAfterTime:", a3->var6);
  -[PDTransition setType:](v8, "setType:", objc_msgSend(a1, "parseTransType:direction:", a3->var9, a3->var8));
  v11 = (void *)objc_msgSend(a1, "newOptions:transType:", a3->var8, a3->var9);
  -[PDTransition setOptions:](v8, "setOptions:", v11);
  objc_msgSend(v12, "setTransition:", v8);
  if ((a3->var10 & 4) != 0)
    objc_msgSend(v12, "setIsHidden:", 1);

}

+ (int)parseTransType:(int)a3 direction:(int64_t)a4
{
  int result;

  result = 37;
  switch(a3)
  {
    case 0:
      if (a4)
        result = 16 * (a4 == 1);
      else
        result = 13;
      break;
    case 1:
      return result;
    case 2:
    case 3:
      result = a3;
      break;
    case 4:
      result = 7;
      break;
    case 5:
      result = 13;
      break;
    case 7:
      result = 35;
      break;
    case 8:
      result = 38;
      break;
    case 9:
      result = 43;
      break;
    case 10:
      result = 52;
      break;
    case 11:
      result = 53;
      break;
    case 13:
      result = 42;
      break;
    case 17:
      result = 12;
      break;
    case 18:
      result = 32;
      break;
    case 19:
      result = 47;
      break;
    case 20:
      result = 36;
      break;
    case 21:
      result = 5;
      break;
    case 22:
      result = 26;
      break;
    case 26:
      result = 48;
      break;
    case 27:
      result = 4;
      break;
    case 29:
      result = 20;
      break;
    case 30:
      result = 9;
      break;
    default:
      result = 16;
      break;
  }
  return result;
}

+ (id)newOptions:(int64_t)a3 transType:(int)a4
{
  PDOrientationOptions *v4;
  unint64_t v5;
  PDEightDirectionOptions *v6;
  uint64_t v7;
  PDSplitDirectionOptions *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = 0;
  v5 = a3;
  switch(a4)
  {
    case 2:
      v5 = a3 == 0;
      goto LABEL_9;
    case 3:
    case 8:
    case 21:
LABEL_9:
      v4 = objc_alloc_init(PDOrientationOptions);
      -[PDOrientationOptions setOrientation:](v4, "setOrientation:", v5 != 0);
      return v4;
    case 4:
    case 7:
      v6 = objc_alloc_init(PDEightDirectionOptions);
      v4 = (PDOrientationOptions *)v6;
      if (v5 - 1 > 6)
        v7 = 1;
      else
        v7 = dword_22A4D3C68[v5 - 1];
      goto LABEL_20;
    case 6:
    case 23:
      v4 = objc_alloc_init(PDBlackOptions);
      -[PDOrientationOptions setIsThroughBlack:](v4, "setIsThroughBlack:", a4 == 6);
      return v4;
    case 9:
      v6 = objc_alloc_init(PDCornerDirectionOptions);
      v4 = (PDOrientationOptions *)v6;
      if (v5 - 1 > 6)
        v7 = 1;
      else
        v7 = dword_22A4D3C68[v5 - 1];
      goto LABEL_20;
    case 10:
    case 20:
    case 29:
    case 30:
      v6 = objc_alloc_init(PDSideDirectionOptions);
      v4 = (PDOrientationOptions *)v6;
      if (v5 - 1 > 6)
        v7 = 1;
      else
        v7 = dword_22A4D3C68[v5 - 1];
LABEL_20:
      -[PDEightDirectionOptions setDirection:](v6, "setDirection:", v7);
      break;
    case 11:
      v4 = objc_alloc_init(PDInOutDirectionOptions);
      -[PDOrientationOptions setInOut:](v4, "setInOut:", v5 == 0);
      break;
    case 13:
      v9 = objc_alloc_init(PDSplitDirectionOptions);
      v4 = (PDOrientationOptions *)v9;
      if (v5 > 3)
      {
        v10 = 0;
        v11 = 0;
      }
      else
      {
        v10 = *((unsigned int *)&xmmword_22A4BFBA0 + v5);
        v11 = dword_22A4D3C90[v5];
      }
      -[PDSplitDirectionOptions setInOut:](v9, "setInOut:", v11);
      -[PDOrientationOptions setOrientation:](v4, "setOrientation:", v10);
      break;
    case 26:
      v4 = objc_alloc_init(PDWheelDirectionOptions);
      -[PDOrientationOptions setSpokes:](v4, "setSpokes:", v5);
      break;
    default:
      return v4;
  }
  return v4;
}

+ (unint64_t)authorIdForName:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  objc_msgSend(a4, "tgtPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "commentAuthorCount");
  if (v7)
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v6, "commentAuthorAtIndex:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v9) = objc_msgSend(v10, "isEqualToString:", v5);
      if ((v9 & 1) != 0)
        break;
      if (v7 == ++v8)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v8 = -1;
  }

  return v8;
}

+ (void)readComments:(id)a3 slide:(id)a4 state:(id)a5
{
  unint64_t v5;
  void *v8;
  unsigned int i;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  id v13;
  PDComment *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v22;
  id v23;

  v20 = a3;
  v23 = a4;
  v22 = a5;
  +[PBProgTag binaryTagDataWithName:inProgTagsParent:](PBProgTag, "binaryTagDataWithName:inProgTagsParent:", L"___PPT10", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; i = v10 + 1)
  {
    v10 = i;
    if (objc_msgSend(v8, "childCount", v20) <= (unint64_t)i)
      break;
    objc_msgSend(v8, "childAt:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "eshObject");
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v12 + 16))(v12) == 12000)
    {
      v13 = v11;
      v14 = objc_alloc_init(PDComment);
      +[PBUtils readStringWithInstance:fromContainer:](PBUtils, "readStringWithInstance:fromContainer:", 0, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[PDComment setAuthor:](v14, "setAuthor:", v15);
        -[PDComment setAuthorId:](v14, "setAuthorId:", objc_msgSend(a1, "authorIdForName:state:", v15, v22));
      }
      +[PBUtils readStringWithInstance:fromContainer:](PBUtils, "readStringWithInstance:fromContainer:", 1, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        -[PDComment setText:](v14, "setText:", v16);
      objc_msgSend(v13, "firstChildOfType:", 12001);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "eshObject");

      if (v18)
      {
        v5 = v5 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(v18 + 60);
        NSDateWithCsDateTime(*(_QWORD *)(v18 + 52));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDComment setDate:](v14, "setDate:", v19);
        -[PDComment setPosition:](v14, "setPosition:", (double)(*(_DWORD *)(v18 + 64) / 8), (double)(*(_DWORD *)(v18 + 68) / 8));
        -[PDComment setIndex:](v14, "setIndex:", (*(_DWORD *)(v18 + 48) - 1));

      }
      objc_msgSend(v23, "addComment:", v14);

    }
  }

}

+ (id)nonPlaceholderDrawablesAmongDrawables:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "clientData", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "placeholder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11 || objc_msgSend(v11, "type") == -1)
          objc_msgSend(v4, "addObject:", v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v4;
}

+ (unsigned)mapDirection:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  unint64_t v6;
  BOOL v7;
  int v8;
  int v9;
  char v10;
  unsigned int v11;

  v3 = a3;
  if (objc_msgSend(v3, "type"))
  {
    if (objc_msgSend(v3, "hasTransitionOptions"))
    {
      objc_msgSend(v3, "options");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = objc_msgSend(v4, "spokes");
        if (v5 < 8)
        {
          v6 = 0x706050402030001uLL >> (8 * v5);
LABEL_32:

          goto LABEL_33;
        }
LABEL_31:
        LOBYTE(v6) = 0;
        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        LOBYTE(v6) = objc_msgSend(v4, "isThroughBlack");
        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v4, "orientation") == 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v8 = objc_msgSend(v4, "orientation");
            v9 = objc_msgSend(v4, "inOut");
            if (v9 == 1)
              v10 = 2;
            else
              v10 = 3;
            if (v8)
              LOBYTE(v6) = v10;
            else
              LOBYTE(v6) = v9 != 1;
            goto LABEL_32;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v11 = objc_msgSend(v4, "direction");
            if (v11 < 8)
            {
              v6 = 0x706050402030001uLL >> (8 * v11);
              goto LABEL_32;
            }
          }
          goto LABEL_31;
        }
        if (objc_msgSend(v3, "type") == 4)
          goto LABEL_31;
        v7 = objc_msgSend(v4, "inOut") == 0;
      }
      LOBYTE(v6) = v7;
      goto LABEL_32;
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 2;
  }
LABEL_33:

  return v6;
}

@end
