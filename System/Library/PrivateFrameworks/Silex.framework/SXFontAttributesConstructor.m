@implementation SXFontAttributesConstructor

- (SXFontAttributesConstructor)initWithFontIndex:(id)a3
{
  id v5;
  SXFontAttributesConstructor *v6;
  SXFontAttributesConstructor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXFontAttributesConstructor;
  v6 = -[SXFontAttributesConstructor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fontIndex, a3);

  return v7;
}

- (id)fontAttributesForFontDescriptions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SXFontIndex *fontIndex;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  SXFontAttributes *v27;
  void *v29;
  id obj;
  void *v31;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v4)
  {
    v5 = v4;
    v29 = 0;
    v6 = 0;
    v33 = *(_QWORD *)v35;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v35 != v33)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v11, "fontName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          v13 = v6 == 0;
        else
          v13 = 0;
        if (v13)
        {
          fontIndex = self->_fontIndex;
          objc_msgSend(v11, "fontName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXFontIndex fontAttributesForFontName:](fontIndex, "fontAttributesForFontName:", v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v19, "familyName");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9 == 0x7FFFFFFFFFFFFFFFLL)
              v9 = objc_msgSend(v19, "width");
            if (v7 == 0x7FFFFFFFFFFFFFFFLL)
              v7 = objc_msgSend(v19, "style");
            if (v8 == 0x7FFFFFFFFFFFFFFFLL)
              v8 = -[SXFontAttributesConstructor weightByApplyingWeightLabels:toWeight:](self, "weightByApplyingWeightLabels:toWeight:", v31, objc_msgSend(v19, "weight"));
          }
          else
          {
            v6 = 0;
          }
          goto LABEL_29;
        }
        objc_msgSend(v11, "fontAttributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          if (!v6)
          {
            objc_msgSend(v11, "fontAttributes");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "familyName");
            v6 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (v9 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v11, "fontAttributes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v16, "width");

          }
          if (v7 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v11, "fontAttributes");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v17, "style");

          }
          if (v8 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v11, "fontAttributes");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = -[SXFontAttributesConstructor weightByApplyingWeightLabels:toWeight:](self, "weightByApplyingWeightLabels:toWeight:", v31, objc_msgSend(v18, "weight"));

          }
          if (!v29)
          {
            objc_msgSend(v11, "fontAttributes");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "grade");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

          }
        }
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v11, "fontAttributes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "weightLabel");

          if (v23)
          {
            v24 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v11, "fontAttributes");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "weightLabel"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v26);

          }
        }
        if (v8 != 0x7FFFFFFFFFFFFFFFLL && v6 && v9 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_41;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (!v5)
        goto LABEL_41;
    }
  }
  v29 = 0;
  v6 = 0;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_41:

  v27 = 0;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v6 && v9 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL)
    v27 = -[SXFontAttributes initWithFamilyName:weight:width:style:grade:]([SXFontAttributes alloc], "initWithFamilyName:weight:width:style:grade:", v6, v8, v9, v7, v29);

  return v27;
}

- (id)fontFaceForAttributes:(id)a3 size:(int64_t)a4
{
  return -[SXFontIndex fontFaceForFontAttributes:size:](self->_fontIndex, "fontFaceForFontAttributes:size:", a3, a4);
}

- (id)fontNameForAttributes:(id)a3 size:(int64_t)a4
{
  return -[SXFontIndex fontNameForFontAttributes:size:](self->_fontIndex, "fontNameForFontAttributes:size:", a3, a4);
}

- (int64_t)weightByApplyingWeightLabels:(id)a3 toWeight:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "reverseObjectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "integerValue");
        if (v10 == 1)
        {
          v11 = +[SXFontMatching bolderWeightForWeight:](SXFontMatching, "bolderWeightForWeight:", a4);
        }
        else
        {
          if (v10 != 2)
            goto LABEL_11;
          v11 = +[SXFontMatching lighterWeightForWeight:](SXFontMatching, "lighterWeightForWeight:", a4);
        }
        a4 = v11;
LABEL_11:
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return a4;
}

- (SXFontIndex)fontIndex
{
  return self->_fontIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontIndex, 0);
}

@end
