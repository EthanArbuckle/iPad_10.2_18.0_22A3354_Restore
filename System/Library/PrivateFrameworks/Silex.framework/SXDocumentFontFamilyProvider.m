@implementation SXDocumentFontFamilyProvider

- (SXDocumentFontFamilyProvider)initWithDocument:(id)a3
{
  id v4;
  SXDocumentFontFamilyProvider *v5;
  SXDocumentFontFamilyProvider *v6;
  uint64_t v7;
  NSArray *fonts;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXDocumentFontFamilyProvider;
  v5 = -[SXDocumentFontFamilyProvider init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SXDocumentFontFamilyProvider fontsFromDocument:](v5, "fontsFromDocument:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    fonts = v6->_fonts;
    v6->_fonts = (NSArray *)v7;

  }
  return v6;
}

- (id)fontsFromDocument:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  SXFontFamily *v36;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v39 = v3;
  objc_msgSend(v3, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v39, "resources");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "fontAttributes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "fontAttributes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "familyName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKey:", v16, v15);
            }
            objc_msgSend(v16, "addObject:", v12);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v7);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v4;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v41)
  {
    v38 = *(_QWORD *)v52;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v52 != v38)
          objc_enumerationMutation(obj);
        v44 = v17;
        v18 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v17);
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v43 = v18;
        objc_msgSend(obj, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v48;
          do
          {
            v23 = 0;
            v46 = v21;
            do
            {
              if (*(_QWORD *)v48 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v23);
              objc_msgSend(v24, "fontAttributes");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "familyName");
              v26 = objc_claimAutoreleasedReturnValue();
              if (!v26)
                goto LABEL_28;
              v27 = (void *)v26;
              objc_msgSend(v24, "fontAttributes");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v28, "width") == 0x7FFFFFFFFFFFFFFFLL)
                goto LABEL_27;
              objc_msgSend(v24, "fontAttributes");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v29, "weight") == 0x7FFFFFFFFFFFFFFFLL)
              {

LABEL_27:
LABEL_28:

                goto LABEL_29;
              }
              objc_msgSend(v24, "fontAttributes");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v22;
              v32 = v19;
              v33 = objc_msgSend(v30, "style");

              v34 = v33 == 0x7FFFFFFFFFFFFFFFLL;
              v19 = v32;
              v22 = v31;
              v21 = v46;
              if (!v34)
                objc_msgSend(v45, "addObject:", v24);
LABEL_29:
              ++v23;
            }
            while (v21 != v23);
            v35 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            v21 = v35;
          }
          while (v35);
        }

        v36 = -[SXFontFamily initWithFamilyName:faces:]([SXFontFamily alloc], "initWithFamilyName:faces:", v43, v45);
        objc_msgSend(v40, "addObject:", v36);

        v17 = v44 + 1;
      }
      while (v44 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    }
    while (v41);
  }

  return v40;
}

- (NSArray)fonts
{
  return self->_fonts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fonts, 0);
}

@end
