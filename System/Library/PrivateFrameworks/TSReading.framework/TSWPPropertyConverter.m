@implementation TSWPPropertyConverter

+ (void)initialize
{
  _DWORD *v2;
  _DWORD *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = malloc_type_calloc(3uLL, 0x10uLL, 0x10800409227ACB4uLL);
    sMappedProperties = (uint64_t)v2;
    *(_QWORD *)v2 = *MEMORY[0x24BDF65D8];
    v2[2] = 33;
    *((_QWORD *)v2 + 2) = *MEMORY[0x24BDF66A0];
    v2[6] = 31;
    *((_QWORD *)v2 + 4) = *MEMORY[0x24BDF6610];
    v2[10] = 41;
    v3 = malloc_type_calloc(5uLL, 0x10uLL, 0x10800409227ACB4uLL);
    sMappedColorProperties = (uint64_t)v3;
    *(_QWORD *)v3 = *MEMORY[0x24BDF66D0];
    v3[2] = 24;
    *((_QWORD *)v3 + 2) = *MEMORY[0x24BDF6650];
    v3[6] = 28;
    *((_QWORD *)v3 + 4) = *MEMORY[0x24BDF6600];
    v3[10] = 18;
    *((_QWORD *)v3 + 6) = *MEMORY[0x24BDF6698];
    v3[14] = 32;
    *((_QWORD *)v3 + 8) = *MEMORY[0x24BDF65C8];
    v3[18] = 37;
  }
}

+ (void)mapCharacterPropertiesFromNS:(id)a3 toWP:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;

  v6 = (void *)objc_msgSend(a3, "keyEnumerator");
  v7 = objc_msgSend(v6, "nextObject");
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)*MEMORY[0x24BDF66D8];
    v10 = *MEMORY[0x24BDF6658];
    v11 = (void *)*MEMORY[0x24BDF65F8];
    v29 = (void *)*MEMORY[0x24BDF6608];
    v12 = 12.0;
    while (objc_msgSend(v9, "compare:", v8) && !objc_msgSend(v8, "isEqualToString:", v10))
    {
      if (objc_msgSend(v11, "compare:", v8))
      {
        if (objc_msgSend(v29, "compare:", v8))
        {
          v19 = v11;
          for (i = 0; i != 80; i += 16)
          {
            if (!objc_msgSend(*(id *)(sMappedColorProperties + i), "compare:", v8))
            {
              objc_opt_class();
              objc_msgSend(a3, "objectForKeyedSubscript:", v8);
              v26 = TSUDynamicCast();
              if (v26)
              {
                v27 = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithUIColor:", v26);
                objc_msgSend(a4, "setObject:forProperty:", v27, *(unsigned int *)(sMappedColorProperties + i + 8));
              }
              goto LABEL_41;
            }
          }
          v21 = 0;
          while (objc_msgSend(*(id *)(sMappedProperties + v21), "compare:", v8))
          {
            v21 += 16;
            if (v21 == 48)
              goto LABEL_41;
          }
          v28 = objc_msgSend(a3, "objectForKeyedSubscript:", v8);
          objc_msgSend(a4, "setBoxedObject:forProperty:", v28, *(unsigned int *)(sMappedProperties + v21 + 8));
LABEL_41:
          v11 = v19;
        }
        else
        {
          objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "tsu_CGFloatValue");
          objc_msgSend(a4, "setCGFloatValue:forProperty:", 35, v25 / v12);
        }
        goto LABEL_16;
      }
      v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C80], "fontWithPlatformFont:", objc_msgSend(a3, "objectForKeyedSubscript:", v8));
      objc_msgSend(a4, "setObject:forProperty:", objc_msgSend(v22, "fontName"), 16);
      objc_msgSend(v22, "pointSize");
      v12 = v23;
      objc_msgSend(a4, "setCGFloatValue:forProperty:", 17);
      if ((objc_msgSend(a4, "containsProperty:", 19) & 1) == 0)
        objc_msgSend(a4, "setIntValue:forProperty:", 0, 19);
      if ((objc_msgSend(a4, "containsProperty:", 20) & 1) == 0)
        objc_msgSend(a4, "setIntValue:forProperty:", 0, 20);
      if ((objc_msgSend(a4, "containsProperty:", 22) & 1) == 0)
        objc_msgSend(a4, "setIntValue:forProperty:", 0, 22);
      if ((objc_msgSend(a4, "containsProperty:", 31) & 1) == 0)
      {
        LODWORD(v24) = 0;
        objc_msgSend(a4, "setFloatValue:forProperty:", 31, v24);
      }
      if ((objc_msgSend(a4, "containsProperty:", 26) & 1) == 0)
      {
        v17 = a4;
        v18 = 0;
        v16 = 26;
LABEL_15:
        objc_msgSend(v17, "setIntValue:forProperty:", v18, v16);
      }
LABEL_16:
      v8 = (void *)objc_msgSend(v6, "nextObject");
      if (!v8)
        return;
    }
    v13 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "intValue");
    if (v13 == 9)
      v14 = 2;
    else
      v14 = 1;
    if (v13)
      v15 = v14;
    else
      v15 = 0;
    if (objc_msgSend(v8, "isEqualToString:", v10))
      v16 = 26;
    else
      v16 = 22;
    v17 = a4;
    v18 = v15;
    goto LABEL_15;
  }
}

+ (id)mapCharacterPropertiesFromNS:(id)a3
{
  id v4;

  v4 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
  +[TSWPPropertyConverter mapCharacterPropertiesFromNS:toWP:](TSWPPropertyConverter, "mapCharacterPropertiesFromNS:toWP:", a3, v4);
  return v4;
}

+ (void)mapCharacterPropertiesFromStyles:(id *)a3 styleCount:(unsigned int)a4 toNS:(id)a5 stickyFont:(id *)a6 scale:(double)a7
{
  unint64_t v13;
  unsigned int v14;
  id v15;
  void *v17;
  uint64_t v18;
  id v19;

  if (a4)
  {
    v13 = a4;
    v14 = a4 - 1;
    do
    {
      v15 = a3[v14];
      if (v15)
        objc_msgSend(a1, "mapCharacterPropertiesFromStyle:toNS:stickyFont:scale:", v15, a5, a6, a7);
    }
    while ((unint64_t)v14--);
    if (a4 > 1)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C80]), "initWithCTFont:", TSWPCreateFontForStylesWithScale((uint64_t)a3, v13, (unint64_t)(a7 * 100.0)));
      if (v17)
      {
        v19 = v17;
        v18 = objc_msgSend(v17, "platformFont");
        objc_msgSend(a5, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDF65F8]);

      }
    }
  }
}

+ (id)propertyMapToDictionary:(id)a3
{
  void *v4;
  _QWORD v6[6];

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__TSWPPropertyConverter_propertyMapToDictionary___block_invoke;
  v6[3] = &unk_24D82E140;
  v6[4] = a3;
  v6[5] = v4;
  objc_msgSend(a3, "enumeratePropertiesAndObjectsUsingBlock:", v6);
  return v4;
}

id *__49__TSWPPropertyConverter_propertyMapToDictionary___block_invoke(id *result, int a2, uint64_t a3, void *a4)
{
  id *v5;
  uint64_t v6;
  _QWORD *v7;
  float v8;
  double v9;
  _BOOL8 v10;
  _BOOL8 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = result;
  if (a2 > 25)
  {
    if (a2 == 26)
    {
      v17 = objc_msgSend(a4, "integerValue");
      v18 = 9;
      if (v17 != 2)
        v18 = 1;
      if (v17)
        v19 = v18;
      else
        v19 = 0;
      v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
      v7 = (_QWORD *)MEMORY[0x24BDF6658];
      return (id *)objc_msgSend(v5[5], "setObject:forKeyedSubscript:", v6, *v7);
    }
    if (a2 == 37 || a2 == 98)
    {
      objc_opt_class();
      result = (id *)TSUDynamicCast();
      if (result)
      {
        v6 = objc_msgSend(result, "platformColor");
        v7 = (_QWORD *)MEMORY[0x24BDF65C8];
        return (id *)objc_msgSend(v5[5], "setObject:forKeyedSubscript:", v6, *v7);
      }
    }
  }
  else
  {
    if (a2 == 16)
    {
      objc_msgSend(result[4], "floatValueForProperty:", 17);
      v9 = v8;
      v10 = (objc_msgSend(v5[4], "intValueForProperty:", 19) & 0x7FFFFFFF) != 0;
      v11 = (objc_msgSend(v5[4], "intValueForProperty:", 20) & 0x7FFFFFFF) != 0;
      v12 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C80], "fontWithName:size:", a4, v9), "convertFontToBold:italic:", v10, v11);
      if (v12)
      {
        v13 = objc_msgSend(v12, "platformFont");
        objc_msgSend(v5[5], "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDF65F8]);
      }
LABEL_13:
      v14 = objc_msgSend(a4, "integerValue");
      v15 = 9;
      if (v14 != 2)
        v15 = 1;
      if (v14)
        v16 = v15;
      else
        v16 = 0;
      v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
      v7 = (_QWORD *)MEMORY[0x24BDF66D8];
      return (id *)objc_msgSend(v5[5], "setObject:forKeyedSubscript:", v6, *v7);
    }
    if (a2 != 18)
    {
      if (a2 != 22)
        return result;
      goto LABEL_13;
    }
    objc_opt_class();
    result = (id *)TSUDynamicCast();
    if (result)
    {
      v6 = objc_msgSend(result, "platformColor");
      v7 = (_QWORD *)MEMORY[0x24BDF6600];
      return (id *)objc_msgSend(v5[5], "setObject:forKeyedSubscript:", v6, *v7);
    }
  }
  return result;
}

+ (void)mapCharacterPropertiesFromStyle:(id)a3 toNS:(id)a4 stickyFont:(id *)a5 scale:(double)a6
{
  +[TSWPPropertyConverter mapCharacterPropertiesFromStyle:secondaryStyle:toNS:stickyFont:scale:](TSWPPropertyConverter, "mapCharacterPropertiesFromStyle:secondaryStyle:toNS:stickyFont:scale:", a3, 0, a4, a5, a6);
}

+ (void)mapCharacterPropertiesFromStyle:(id)a3 secondaryStyle:(id)a4 toNS:(id)a5 stickyFont:(id *)a6 scale:(double)a7
{
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t j;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  double v35;
  double v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (!a3 || !a5)
    return;
  v40 = 0;
  if (objc_msgSend(a3, "valueForProperty:", 16) || objc_msgSend(a4, "valueForProperty:", 16))
  {
    v41 = a3;
    v42 = a4;
    v13 = a4 ? 2 : 1;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C80]), "initWithCTFont:", TSWPCreateFontForStylesWithScale((uint64_t)&v41, v13, (unint64_t)(a7 * 100.0)));
    v40 = v14;
    if (v14)
    {
      v15 = v14;
      v16 = objc_msgSend(v14, "platformFont");
      objc_msgSend(a5, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDF65F8]);
      if (a6)
        *a6 = v15;

      v40 = 0;
    }
  }
  for (i = 0; i != 80; i += 16)
  {
    if (objc_msgSend(a3, "definesProperty:", *(unsigned int *)(sMappedColorProperties + i + 8), v40, v41, v42, v43))
    {
      objc_opt_class();
      objc_msgSend(a3, "valueForProperty:", *(unsigned int *)(sMappedColorProperties + i + 8));
      v18 = (void *)TSUDynamicCast();
      if (v18)
      {
        v19 = objc_msgSend(v18, "platformColor");
        objc_msgSend(a5, "setObject:forKeyedSubscript:", v19, *(_QWORD *)(sMappedColorProperties + i));
      }
    }
  }
  for (j = 0; j != 48; j += 16)
  {
    if (!objc_msgSend(a3, "definesProperty:", *(unsigned int *)(sMappedProperties + j + 8)))
      continue;
    v21 = String(*(_DWORD *)(sMappedProperties + j + 8));
    switch(v21)
    {
      case 2:
        objc_msgSend(a3, "floatValueForProperty:", *(unsigned int *)(sMappedProperties + j + 8));
        v25 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
        goto LABEL_27;
      case 1:
        v24 = objc_msgSend(a3, "intValueForProperty:", *(unsigned int *)(sMappedProperties + j + 8));
        v25 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v24);
LABEL_27:
        objc_msgSend(a5, "setValue:forKey:", v25, *(_QWORD *)(sMappedProperties + j));
        continue;
      case 0:
        v22 = objc_msgSend(a3, "valueForProperty:", *(unsigned int *)(sMappedProperties + j + 8));
        if (v22)
        {
          v23 = v22;
          if (v22 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
            objc_msgSend(a5, "setObject:forKeyedSubscript:", v23, *(_QWORD *)(sMappedProperties + j));
        }
        break;
    }
  }
  if (objc_msgSend(a3, "definesProperty:", 22))
  {
    v26 = objc_msgSend(a3, "intValueForProperty:", 22);
    if (v26 == 2)
      v27 = 9;
    else
      v27 = 1;
    if (v26)
      v28 = v27;
    else
      v28 = 0;
    v29 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v28);
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BDF66D8]);
  }
  if (objc_msgSend(a3, "definesProperty:", 26))
  {
    v30 = objc_msgSend(a3, "intValueForProperty:", 26);
    if (v30 == 2)
      v31 = 9;
    else
      v31 = 1;
    if (v30)
      v32 = v31;
    else
      v32 = 0;
    v33 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v32);
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BDF6658]);
  }
  if (objc_msgSend(a3, "definesProperty:", 35))
  {
    objc_msgSend(a3, "floatValueForProperty:", 35);
    v35 = v34;
    v36 = 12.0;
    if (a6 && *a6)
      objc_msgSend(*a6, "pointSize", 12.0);
    v37 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36 * v35);
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BDF6608]);
  }
  v41 = a3;
  v42 = a4;
  v38 = (void *)TSWPResolvePropertyForStyles((uint64_t)&v41, 2uLL, 41, 0);
  if (v38)
    v39 = objc_msgSend(v38, "intValue");
  else
    v39 = 0;
  objc_msgSend(a1, "mapFontFeaturesFromStyle:secondaryStyle:toNS:ioFont:ligatures:", a3, a4, a5, &v40, v39);
  if (a6)
    *a6 = v40;
}

+ (id)newFontWithFeaturesFromFont:(id)a3 primaryStyle:(id)a4 secondaryStyle:(id)a5 ligatures:(int)a6
{
  return 0;
}

@end
