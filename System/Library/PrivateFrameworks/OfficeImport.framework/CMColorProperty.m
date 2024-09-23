@implementation CMColorProperty

+ (id)nsColorFromOADColor:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "colorMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorScheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[OADColor tsuColorWithColor:colorMap:colorScheme:colorPalette:](OADColor, "tsuColorWithColor:colorMap:colorScheme:colorPalette:", v5, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)cssStringFromTSUColor:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "redComponent");
  v5 = v4;
  objc_msgSend(v3, "greenComponent");
  v7 = v6;
  objc_msgSend(v3, "blueComponent");
  v8 = v5;
  *(float *)&v9 = v7;
  *(float *)&v11 = v10;
  *(float *)&v10 = v8;
  +[CMColorProperty cssStringFromRed:green:blue:](CMColorProperty, "cssStringFromRed:green:blue:", v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)cssStringFromRed:(float)a3 green:(float)a4 blue:(float)a5
{
  float v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3 * 255.0;
  if (v5 > 255.0)
    v5 = 255.0;
  if (v5 < 0.0)
    v5 = 0.0;
  v6 = (int)v5;
  v7 = a4 * 255.0;
  if ((float)(a4 * 255.0) > 255.0)
    v7 = 255.0;
  if (v7 < 0.0)
    v7 = 0.0;
  v8 = (int)v7;
  v9 = a5 * 255.0;
  if ((float)(a5 * 255.0) > 255.0)
    v9 = 255.0;
  if (v9 < 0.0)
    v9 = 0.0;
  v10 = (int)v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", ((_DWORD)v6 << 16) | ((_DWORD)v8 << 8) | v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMGlobalCache colorPropertyCache](CMGlobalCache, "colorPropertyCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR(":%c%02x%02x%02x;"),
                35,
                v6,
                v8,
                v10);
    objc_msgSend(v12, "setObject:forKey:", v15, v11);
  }

  return v15;
}

+ (id)nsColorFromOADFill:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  float v35;
  double v36;
  void *v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  id obj;
  int v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v43 = a4;
  v38 = v5;
  if (!v5)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMColorProperty nsColorFromOADColor:state:](CMColorProperty, "nsColorFromOADColor:state:", v8, v43);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "stops");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v37, "count");
    v10 = v9;
    if (v9)
    {
      if (v9 == 1)
      {
        objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "color");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[CMColorProperty nsColorFromOADColor:state:](CMColorProperty, "nsColorFromOADColor:state:", v12, v43);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        obj = v37;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v13)
        {
          v42 = 0;
          v14 = *(_QWORD *)v49;
          v15 = 0.0;
          v16 = 0.0;
          v17 = 0.0;
          v18 = 0.0;
          v39 = v10;
          v40 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v49 != v14)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "color");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              +[CMColorProperty nsColorFromOADColor:state:](CMColorProperty, "nsColorFromOADColor:state:", v20, v43);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "redComponent");
              v23 = v22;
              objc_msgSend(v21, "greenComponent");
              v25 = v24;
              objc_msgSend(v21, "blueComponent");
              v27 = v26;
              objc_msgSend(v20, "transforms");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if (v28)
              {
                v46 = 0u;
                v47 = 0u;
                v44 = 0u;
                v45 = 0u;
                v30 = v28;
                v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
                if (v31)
                {
                  v32 = *(_QWORD *)v45;
                  while (2)
                  {
                    for (j = 0; j != v31; ++j)
                    {
                      if (*(_QWORD *)v45 != v32)
                        objc_enumerationMutation(v30);
                      v34 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
                      if (objc_msgSend(v34, "type") == 6)
                      {
                        objc_msgSend(v34, "value");
                        v10 = v39;
                        v14 = v40;
                        ++v42;
                        v18 = v18 + v35;
                        goto LABEL_28;
                      }
                    }
                    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
                    if (v31)
                      continue;
                    break;
                  }
                  v10 = v39;
                  v14 = v40;
                }
LABEL_28:

              }
              v15 = v23 + v15;
              v16 = v25 + v16;
              v17 = v27 + v17;
            }
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          }
          while (v13);
        }
        else
        {
          v42 = 0;
          v15 = 0.0;
          v16 = 0.0;
          v17 = 0.0;
          v18 = 0.0;
        }

        v36 = 1.0;
        if (v42 >= 1)
          v36 = (float)(v18 / (float)v42);
        +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", (float)(v15 / (float)v10), (float)(v16 / (float)v10), (float)(v17 / (float)v10), v36);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
LABEL_3:
    v6 = 0;
  }
LABEL_4:

  return v6;
}

- (CMColorProperty)initWithColor:(id)a3
{
  id v5;
  CMColorProperty *v6;
  CMColorProperty *v7;
  CMColorProperty *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMColorProperty;
  v6 = -[CMColorProperty init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->wdValue, a3);
    v8 = v7;
  }

  return v7;
}

- (id)cssStringForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CMColorProperty cssString](self, "cssString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)cssString
{
  return +[CMColorProperty cssStringFromTSUColor:](CMColorProperty, "cssStringFromTSUColor:", self->wdValue);
}

+ (id)cssStringFromOADGradientFill:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  double v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  char v42;
  void *v43;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "stops");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") != 2)
  {
    v19 = 0;
LABEL_32:
    v19 = v19;
    v43 = v19;
    goto LABEL_33;
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CMColorProperty nsColorFromOADColor:state:](CMColorProperty, "nsColorFromOADColor:state:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[CMColorProperty nsColorFromOADColor:state:](CMColorProperty, "nsColorFromOADColor:state:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shade");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "angle");
    v16 = v15 * 3.14159265 / 180.0;
    v17 = v16;
    v18 = CFSTR("left top, right top");
    if (v17 >= 0.392699082)
    {
      if (v17 >= 1.17809725)
      {
        if (v17 >= 5.10508806)
        {
          if (v17 < 5.89048623)
            v18 = CFSTR("left bottom, right top");
        }
        else
        {
          v18 = CFSTR("left bottom, left top");
        }
      }
      else
      {
        v18 = CFSTR("left top, right bottom");
      }
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "fillToRect");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "left");
      if (v22 == 1.0)
      {
        objc_msgSend(v21, "top");
        if (v23 == 1.0)
        {
          v18 = CFSTR("right bottom, left top");
LABEL_26:

LABEL_27:
          v30 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v10, "redComponent");
          v32 = v31;
          objc_msgSend(v10, "greenComponent");
          v34 = v33;
          objc_msgSend(v10, "blueComponent");
          v36 = v35;
          objc_msgSend(v13, "redComponent");
          v38 = v37;
          objc_msgSend(v13, "greenComponent");
          v40 = v39;
          objc_msgSend(v13, "blueComponent");
          objc_msgSend(v30, "stringWithFormat:", CFSTR(":-webkit-gradient(linear, %@, from(#%02x%02x%02x), to(#%02x%02x%02x));"),
            v18,
            (int)(v32 * 255.0),
            (int)(v34 * 255.0),
            (int)(v36 * 255.0),
            (int)(v38 * 255.0),
            (int)(v40 * 255.0),
            (int)(v41 * 255.0));
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          goto LABEL_30;
        }
      }
      objc_msgSend(v21, "right");
      if (v24 == 1.0)
      {
        objc_msgSend(v21, "top");
        if (v25 == 1.0)
        {
          v18 = CFSTR("left bottom, right top");
          goto LABEL_26;
        }
      }
      objc_msgSend(v21, "left");
      if (v26 == 1.0)
      {
        objc_msgSend(v21, "bottom");
        if (v27 == 1.0)
        {
          v18 = CFSTR("right top, left bottom");
          goto LABEL_26;
        }
      }
      objc_msgSend(v21, "right");
      if (v28 == 1.0)
      {
        objc_msgSend(v21, "bottom");
        if (v29 == 1.0)
        {
          v18 = CFSTR("left top, right bottom");
          goto LABEL_26;
        }
      }
    }

  }
  v19 = 0;
  v42 = 1;
LABEL_30:

  if ((v42 & 1) == 0)
    goto LABEL_32;
  v43 = 0;
LABEL_33:

  return v43;
}

+ (float)transformedAlphaFromOADColor:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  float v9;

  objc_msgSend(a3, "transforms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 1.0;
  if (v3)
  {
    v6 = objc_msgSend(v3, "count");
    if (v6)
    {
      v7 = 0;
      while (1)
      {
        objc_msgSend(v4, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "type") == 6)
          break;

        if (v6 == ++v7)
          goto LABEL_8;
      }
      objc_msgSend(v8, "value");
      v5 = v9;

    }
  }
LABEL_8:

  return v5;
}

+ (id)cssStringFromOADColor:(id)a3
{
  id v3;
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  double v11;
  double v12;
  __CFString *v13;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "red");
    v6 = v5;
    objc_msgSend(v4, "green");
    v8 = v7;
    objc_msgSend(v4, "blue");
    LODWORD(v10) = v9;
    LODWORD(v11) = v6;
    LODWORD(v12) = v8;
    +[CMColorProperty cssStringFromRed:green:blue:](CMColorProperty, "cssStringFromRed:green:blue:", v11, v12, v10);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = CFSTR(":white;");
  }

  return v13;
}

+ (id)nsColorFromShading:(id)a3
{
  id v5;
  void *v6;
  int v7;
  double v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "style");
    LODWORD(v8) = 0;
    switch(v7)
    {
      case 0:
        goto LABEL_47;
      case 1:
        LODWORD(v8) = 1.0;
        goto LABEL_47;
      case 2:
        LODWORD(v8) = 1028443341;
        goto LABEL_47;
      case 3:
        LODWORD(v8) = 1036831949;
        goto LABEL_47;
      case 4:
        LODWORD(v8) = 1045220557;
        goto LABEL_47;
      case 5:
      case 20:
      case 21:
      case 22:
      case 23:
        LODWORD(v8) = 0.25;
        goto LABEL_47;
      case 6:
        LODWORD(v8) = 1050253722;
        goto LABEL_47;
      case 7:
        LODWORD(v8) = 1053609165;
        goto LABEL_47;
      case 8:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 25:
        LODWORD(v8) = 0.5;
        goto LABEL_47;
      case 9:
      case 19:
        LODWORD(v8) = 1058642330;
        goto LABEL_47;
      case 10:
        LODWORD(v8) = 1060320051;
        goto LABEL_47;
      case 11:
        LODWORD(v8) = 0.75;
        goto LABEL_47;
      case 12:
        LODWORD(v8) = 1061997773;
        goto LABEL_47;
      case 13:
        LODWORD(v8) = *(_DWORD *)"fff?";
        goto LABEL_47;
      case 24:
      case 43:
        LODWORD(v8) = 1051931443;
        goto LABEL_47;
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
        goto LABEL_8;
      case 35:
        LODWORD(v8) = 1020054733;
        goto LABEL_47;
      case 36:
        LODWORD(v8) = 1033476506;
        goto LABEL_47;
      case 37:
        LODWORD(v8) = 0.125;
        goto LABEL_47;
      case 38:
        LODWORD(v8) = 1041865114;
        goto LABEL_47;
      case 39:
        LODWORD(v8) = 1043542835;
        goto LABEL_47;
      case 40:
        LODWORD(v8) = 1046898278;
        goto LABEL_47;
      case 41:
        LODWORD(v8) = 1049414861;
        goto LABEL_47;
      case 42:
        LODWORD(v8) = 1051092582;
        goto LABEL_47;
      case 44:
        LODWORD(v8) = 0.375;
        goto LABEL_47;
      case 45:
        LODWORD(v8) = 1054448026;
        goto LABEL_47;
      case 46:
        LODWORD(v8) = 1055286886;
        goto LABEL_47;
      case 47:
        LODWORD(v8) = 1056125747;
        goto LABEL_47;
      case 48:
        LODWORD(v8) = 1057384038;
        goto LABEL_47;
      case 49:
        LODWORD(v8) = 1057803469;
        goto LABEL_47;
      case 50:
        LODWORD(v8) = 1058222899;
        goto LABEL_47;
      case 51:
        LODWORD(v8) = 0.625;
        goto LABEL_47;
      case 52:
        LODWORD(v8) = 1059481190;
        goto LABEL_47;
      case 53:
        LODWORD(v8) = 1059900621;
        goto LABEL_47;
      case 54:
        LODWORD(v8) = 1060739482;
        goto LABEL_47;
      case 55:
        LODWORD(v8) = 1061578342;
        goto LABEL_47;
      case 56:
        LODWORD(v8) = 1062417203;
        goto LABEL_47;
      case 57:
        LODWORD(v8) = 1062836634;
        goto LABEL_47;
      case 58:
        LODWORD(v8) = 0.875;
        goto LABEL_47;
      case 59:
        LODWORD(v8) = 1064094925;
        goto LABEL_47;
      case 60:
        LODWORD(v8) = 1064514355;
        goto LABEL_47;
      case 61:
        LODWORD(v8) = 1064933786;
        goto LABEL_47;
      case 62:
        LODWORD(v8) = 1064849900;
LABEL_47:
        objc_msgSend(a1, "resolveStyleColorWithPercentage:shading:", v6, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      default:
        if (v7 == 0xFFFF)
          break;
LABEL_8:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CMColorProperty.mm"), 306, CFSTR("Bad shading style encountered."));

        break;
    }
  }
  v10 = 0;
LABEL_48:

  return v10;
}

+ (id)resolveStyleColorWithPercentage:(float)a3 shading:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;

  v6 = a4;
  objc_msgSend(v6, "foreground");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = a3;
  objc_msgSend(a1, "resolveStyleColorWithPercentage:foregroundColor:backgroundColor:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)resolveStyleColorWithPercentage:(float)a3 foregroundColor:(id)a4 backgroundColor:(id)a5
{
  id v9;
  id v10;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;

  v9 = a4;
  v10 = a5;
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    if (v9)
      goto LABEL_6;
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CMColorProperty.mm"), 430, CFSTR("Foreground color is not set."));

    if (v10)
      goto LABEL_7;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CMColorProperty.mm"), 429, CFSTR("Percentage out of range."));

  if (!v9)
    goto LABEL_14;
LABEL_6:
  if (v10)
    goto LABEL_7;
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CMColorProperty.mm"), 431, CFSTR("Background color is not set."));

LABEL_7:
  objc_msgSend(v10, "alphaComponent");
  if (v12 == 0.0)
  {
    +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v13;
  }
  else
  {
    v14 = v10;
  }
  objc_msgSend(v9, "alphaComponent");
  if (v15 == 0.0)
  {
    +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v16;
  }
  objc_msgSend(v9, "redComponent");
  v18 = v17;
  objc_msgSend(v14, "redComponent");
  *(float *)&v19 = v18;
  *(float *)&v21 = v20;
  *(float *)&v20 = a3;
  objc_msgSend(a1, "resolveColorValueWithPercentage:foregroundComponent:backgroundComponent:", v20, v19, v21);
  LODWORD(v18) = v22;
  objc_msgSend(v9, "greenComponent");
  v24 = v23;
  objc_msgSend(v14, "greenComponent");
  *(float *)&v25 = v24;
  *(float *)&v27 = v26;
  *(float *)&v26 = a3;
  objc_msgSend(a1, "resolveColorValueWithPercentage:foregroundComponent:backgroundComponent:", v26, v25, v27);
  LODWORD(v24) = v28;
  objc_msgSend(v9, "blueComponent");
  v30 = v29;
  objc_msgSend(v14, "blueComponent");
  *(float *)&v31 = v30;
  *(float *)&v33 = v32;
  *(float *)&v32 = a3;
  objc_msgSend(a1, "resolveColorValueWithPercentage:foregroundComponent:backgroundComponent:", v32, v31, v33);
  +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", *(float *)&v18, *(float *)&v24, v34, 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (float)resolveColorValueWithPercentage:(float)a3 foregroundComponent:(float)a4 backgroundComponent:(float)a5
{
  void *v13;
  void *v14;
  void *v15;

  if (a3 < 0.0 || a3 > 1.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CMColorProperty.mm"), 462, CFSTR("Percentage out of range."));

  }
  if (a4 < 0.0 || a4 > 1.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CMColorProperty.mm"), 464, CFSTR("Foreground component out of range."));

  }
  if (a5 < 0.0 || a5 > 1.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CMColorProperty.mm"), 466, CFSTR("Background component out of range."));

  }
  return (float)(a3 * a4) + (float)((float)(1.0 - a3) * a5);
}

+ (CGColor)copyCGColorFromOADFill:(id)a3 state:(id)a4
{
  void *v4;
  CGColorSpace *DeviceRGB;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGColor *v10;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "nsColorFromOADFill:state:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  objc_msgSend(v4, "redComponent");
  components[0] = v6;
  objc_msgSend(v4, "greenComponent");
  components[1] = v7;
  objc_msgSend(v4, "blueComponent");
  components[2] = v8;
  objc_msgSend(v4, "alphaComponent");
  components[3] = v9;
  v10 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);

  return v10;
}

+ (CGColor)copyCGColorFromOADColor:(id)a3 state:(id)a4
{
  void *v4;
  CGColorSpace *DeviceRGB;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGColor *v10;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "nsColorFromOADColor:state:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  objc_msgSend(v4, "redComponent");
  components[0] = v6;
  objc_msgSend(v4, "greenComponent");
  components[1] = v7;
  objc_msgSend(v4, "blueComponent");
  components[2] = v8;
  objc_msgSend(v4, "alphaComponent");
  components[3] = v9;
  v10 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);

  return v10;
}

- (id)value
{
  return self->wdValue;
}

- (BOOL)isEqualTo:(id)a3
{
  OITSUColor *wdValue;
  void *v4;

  wdValue = self->wdValue;
  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(wdValue) = -[OITSUColor isEqual:](wdValue, "isEqual:", v4);

  return (char)wdValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->wdValue, 0);
}

@end
