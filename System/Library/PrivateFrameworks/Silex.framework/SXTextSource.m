@implementation SXTextSource

- (SXTextSource)initWithString:(id)a3 smartFieldFactory:(id)a4 dataSource:(id)a5 documentLanguageProvider:(id)a6 fontAttributesConstructor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SXTextSource *v17;
  uint64_t v18;
  SXTextSourceDefaults *defaults;
  uint64_t v20;
  NSMutableIndexSet *deletedRangeOffsets;
  uint64_t v22;
  NSMutableIndexSet *insertedRangeOffsets;
  uint64_t v24;
  NSMutableIndexSet *rangesExcludedOfParagraphSpacing;
  SXDefaultFontDescribing *v26;
  SXTextStyleFontDescribing *defaultFontDescribing;
  uint64_t v28;
  NSString *string;
  objc_super v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)SXTextSource;
  v17 = -[SXTextSource init](&v31, sel_init);
  if (v17)
  {
    +[SXTextSourceDefaults defaults]();
    v18 = objc_claimAutoreleasedReturnValue();
    defaults = v17->_defaults;
    v17->_defaults = (SXTextSourceDefaults *)v18;

    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v20 = objc_claimAutoreleasedReturnValue();
    deletedRangeOffsets = v17->_deletedRangeOffsets;
    v17->_deletedRangeOffsets = (NSMutableIndexSet *)v20;

    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v22 = objc_claimAutoreleasedReturnValue();
    insertedRangeOffsets = v17->_insertedRangeOffsets;
    v17->_insertedRangeOffsets = (NSMutableIndexSet *)v22;

    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v24 = objc_claimAutoreleasedReturnValue();
    rangesExcludedOfParagraphSpacing = v17->_rangesExcludedOfParagraphSpacing;
    v17->_rangesExcludedOfParagraphSpacing = (NSMutableIndexSet *)v24;

    objc_storeWeak((id *)&v17->_dataSource, v14);
    objc_storeStrong((id *)&v17->_smartFieldFactory, a4);
    v26 = objc_alloc_init(SXDefaultFontDescribing);
    defaultFontDescribing = v17->_defaultFontDescribing;
    v17->_defaultFontDescribing = (SXTextStyleFontDescribing *)v26;

    objc_storeStrong((id *)&v17->_fontAttributeConstructor, a7);
    objc_storeStrong((id *)&v17->_documentLanguageProvider, a6);
    -[SXTextSource cleanString:](v17, "cleanString:", v12);
    v28 = objc_claimAutoreleasedReturnValue();
    string = v17->_string;
    v17->_string = (NSString *)v28;

  }
  return v17;
}

- (id)cleanString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  _QWORD v75[5];
  _QWORD v76[4];
  id v77;
  id v78;
  SXTextSource *v79;
  id v80;
  id v81;
  id v82;
  _QWORD v83[5];
  id v84;
  id v85;
  _QWORD v86[5];
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v4);
  -[SXTextSource dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentTextStyleForTextSource:inheritingFromDefaultStyles:", self, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "listStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    v69 = v7;
    v70 = v5;
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    -[SXTextSource dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inlineTextStylesForTextSource:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v89 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
          -[SXTextSource dataSource](self, "dataSource");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "textStyle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "textStyleForIdentifier:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "listStyle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count") && (v21 = objc_msgSend(v16, "range"), v21 < objc_msgSend(v4, "length")))
          {
            objc_msgSend(v16, "range");
            v23 = v22;

            if (v23 != -1)
            {
              v24 = objc_msgSend(v16, "range");
              v26 = -[SXTextSource rangeInBounds:maxLength:](self, "rangeInBounds:maxLength:", v24, v25, objc_msgSend(v4, "length"));
              objc_msgSend(v73, "addIndexesInRange:", v26, v27);
            }
          }
          else
          {

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
      }
      while (v13);
    }

    v28 = objc_msgSend(v4, "length");
    v29 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("\n\n"), 0, 0, v28);
    if (v29 == 0x7FFFFFFFFFFFFFFFLL || (v31 = v29, v32 = v30, !objc_msgSend(v4, "length")))
    {
      v35 = 0;
      v33 = v67;
    }
    else
    {
      v33 = v67;
      do
      {
        v34 = objc_msgSend(v4, "length");
        if ((objc_msgSend(v73, "intersectsIndexesInRange:", v31, v32) & 1) == 0)
          objc_msgSend(v67, "addIndexesInRange:", v31, v32);
        v35 = v31 + v32;
        v28 = v34 - (v31 + v32);
        v36 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("\n\n"), 0, v31 + v32, v28);
        if (v36 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v31 = v36;
        v32 = v37;
      }
      while (v35 < objc_msgSend(v4, "length"));
    }
    v38 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("\r\n"), 0, v35, v28);
    if (v38 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v40 = v38;
      v41 = v39;
      do
      {
        if (v35 >= objc_msgSend(v4, "length"))
          break;
        v42 = objc_msgSend(v4, "length");
        if ((objc_msgSend(v73, "intersectsIndexesInRange:", v40, v41) & 1) == 0)
          objc_msgSend(v33, "addIndexesInRange:", v40, v41);
        v35 = v40 + v41;
        v40 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("\r\n"), 0, v40 + v41, v42 - (v40 + v41));
        v41 = v43;
      }
      while (v40 != 0x7FFFFFFFFFFFFFFFLL);
    }
    v44 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("\n"), 0, 0, objc_msgSend(v4, "length"));
    if (v44 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v46 = v44;
      v47 = v45;
      v48 = 0;
      do
      {
        if (v48 >= objc_msgSend(v4, "length"))
          break;
        v49 = objc_msgSend(v4, "length");
        if ((objc_msgSend(v73, "intersectsIndexesInRange:", v46, v47) & 1) == 0
          && (objc_msgSend(v33, "intersectsIndexesInRange:", v46, v47) & 1) == 0)
        {
          objc_msgSend(v71, "addIndexesInRange:", v46, v47);
        }
        v48 = v46 + v47;
        v46 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("\n"), 0, v46 + v47, v49 - (v46 + v47));
        v47 = v50;
      }
      while (v46 != 0x7FFFFFFFFFFFFFFFLL);
    }
    v51 = MEMORY[0x24BDAC760];
    v86[0] = MEMORY[0x24BDAC760];
    v86[1] = 3221225472;
    v86[2] = __28__SXTextSource_cleanString___block_invoke;
    v86[3] = &unk_24D68DFC8;
    v86[4] = self;
    v52 = v70;
    v87 = v52;
    objc_msgSend(v33, "enumerateRangesUsingBlock:", v86);
    v83[0] = v51;
    v83[1] = 3221225472;
    v83[2] = __28__SXTextSource_cleanString___block_invoke_2;
    v83[3] = &unk_24D68DFF0;
    v83[4] = self;
    v53 = v73;
    v84 = v53;
    v54 = v52;
    v85 = v54;
    objc_msgSend(v71, "enumerateRangesUsingBlock:", v83);
    v76[0] = v51;
    v76[1] = 3221225472;
    v76[2] = __28__SXTextSource_cleanString___block_invoke_3;
    v76[3] = &unk_24D68E018;
    v74 = v71;
    v77 = v74;
    v72 = v33;
    v78 = v72;
    v79 = self;
    v80 = v53;
    v55 = v54;
    v81 = v55;
    v56 = v4;
    v82 = v56;
    v68 = v80;
    objc_msgSend(v80, "enumerateRangesUsingBlock:", v76);
    v57 = objc_msgSend(v56, "rangeOfString:options:range:", CFSTR("\u2028\n"), 0, 0, objc_msgSend(v56, "length"));
    if (v57 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v59 = v57;
      v60 = v58;
      v61 = 0;
      do
      {
        if (v61 >= objc_msgSend(v56, "length"))
          break;
        v61 = v59 + v60;
        v62 = objc_msgSend(v56, "length") - (v59 + v60);
        v63 = -[SXTextSource rangeForRange:](self, "rangeForRange:", v59, v60) + 1;
        objc_msgSend(v55, "insertString:atIndex:", CFSTR("​"), v63);
        -[SXTextSource insertedRangeOffsets](self, "insertedRangeOffsets");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addIndex:", v63);

        v59 = objc_msgSend(v56, "rangeOfString:options:range:", CFSTR("\u2028\n"), 0, v61, v62);
        v60 = v65;
      }
      while (v59 != 0x7FFFFFFFFFFFFFFFLL);
    }
    v75[0] = MEMORY[0x24BDAC760];
    v75[1] = 3221225472;
    v75[2] = __28__SXTextSource_cleanString___block_invoke_4;
    v75[3] = &unk_24D68BFA8;
    v75[4] = self;
    objc_msgSend(v68, "enumerateRangesUsingBlock:", v75);

    v7 = v69;
    v5 = v70;
  }
  if (objc_msgSend(v5, "hasSuffix:", CFSTR("\u2028\n")))
    objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 2, 2, CFSTR("\u2028\u2028"));

  return v5;
}

void __28__SXTextSource_cleanString___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t i;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;

  if (a3)
  {
    for (i = 0; i < a3; i += 2)
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "rangeForRange:", a2 + i, 2);
      v9 = v8;
      v10 = objc_msgSend(*(id *)(a1 + 40), "length");
      if (v10 >= v9)
        v11 = v9;
      else
        v11 = v10;
      objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", v7, v11, CFSTR("\n"));
      objc_msgSend(*(id *)(a1 + 32), "deletedRangeOffsets");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addIndex:", a2 + i);

    }
  }
}

void __28__SXTextSource_cleanString___block_invoke_2(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;

  v6 = objc_msgSend(a1[4], "rangeForRange:", a2, a3);
  v8 = v7;
  v9 = objc_msgSend(a1[5], "intersectsIndexesInRange:", a2, a3 + 1);
  v10 = objc_msgSend(a1[5], "intersectsIndexesInRange:", a2 - 1, a3);
  v11 = objc_msgSend(a1[6], "length");
  if (v11 >= v8)
    v12 = v8;
  else
    v12 = v11;
  v13 = a1[6];
  if ((v9 & 1) != 0 || v10)
  {
    objc_msgSend(v13, "replaceCharactersInRange:withString:", v6, v12, &stru_24D68E0F8);
    objc_msgSend(a1[4], "deletedRangeOffsets");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addIndex:", a2);

  }
  else
  {
    objc_msgSend(v13, "replaceCharactersInRange:withString:", v6, v12, CFSTR("\u2028"));
  }
}

void __28__SXTextSource_cleanString___block_invoke_3(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id v25;

  v6 = a2 + a3;
  v7 = objc_msgSend(a1[4], "indexGreaterThanIndex:", a2 + a3);
  v8 = objc_msgSend(a1[4], "indexLessThanIndex:", a2);
  v9 = objc_msgSend(a1[5], "indexGreaterThanIndex:", v6);
  v10 = objc_msgSend(a1[5], "indexLessThanIndex:", a2);
  v11 = a1[6];
  v12 = objc_msgSend(a1[7], "firstRangeAfterIndex:", v6);
  v14 = objc_msgSend(v11, "rangeForRange:", v12, v13);
  if (a2 && v8 && v10 && v8 != a2 - 1 && v10 != a2 - 1)
  {
    v15 = objc_msgSend(a1[6], "rangeForRange:", a2, a3);
    objc_msgSend(a1[8], "length");
    objc_msgSend(a1[8], "insertString:atIndex:", CFSTR("\n"), v15);
    objc_msgSend(a1[6], "insertedRangeOffsets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addIndex:", v15);

  }
  v17 = v6 + 1;
  v19 = v7 == v6 + 1 || v9 == v17 || v14 == v17;
  if (!v19 && v17 < objc_msgSend(a1[9], "length"))
  {
    v20 = objc_msgSend(a1[6], "rangeForRange:", a2, a3);
    v22 = v21;
    v23 = objc_msgSend(a1[8], "length");
    if (v23 >= v22)
      v24 = v22;
    else
      v24 = v23;
    objc_msgSend(a1[8], "insertString:atIndex:", CFSTR("\n"), v24 + v20);
    objc_msgSend(a1[6], "insertedRangeOffsets");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addIndex:", v6);

  }
}

void __28__SXTextSource_cleanString___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = objc_msgSend(*(id *)(a1 + 32), "rangeForRange:", a2, a3);
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "rangesExcludedOfParagraphSpacing");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexesInRange:", v4, v6);

}

- (_NSRange)rangeForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  if (a3.location | a3.length)
  {
    length = a3.length;
    location = a3.location;
    -[SXTextSource deletedRangeOffsets](self, "deletedRangeOffsets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countOfIndexesInRange:", 0, location + 1);

    -[SXTextSource deletedRangeOffsets](self, "deletedRangeOffsets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countOfIndexesInRange:", location, length);

    -[SXTextSource insertedRangeOffsets](self, "insertedRangeOffsets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countOfIndexesInRange:", 0, location + 1);

    -[SXTextSource insertedRangeOffsets](self, "insertedRangeOffsets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countOfIndexesInRange:", location + 1, length);

    v14 = location - v7 + v11;
    v15 = length - v9 + v13;
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  result.length = v15;
  result.location = v14;
  return result;
}

- (void)applyStylingOnTextTangierStorage:(id)a3
{
  id v4;
  void *v5;
  SXTextStyleAttributesMap *v6;
  void *v7;
  SXTextStyleAttributesMap *v8;
  SXTextStyleAttributes *v9;
  void *v10;
  SXTextStyleAttributes *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t i;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int64_t v54;
  void *v55;
  void *v56;
  void *v57;
  SXTextSource *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  unint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  SXTextSource *v91;
  uint64_t v92;
  id v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  SXTextSource *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  double *v130;
  double v131;
  void *v132;
  void *v133;
  unint64_t v134;
  double v135;
  unint64_t v136;
  unint64_t v137;
  void *v138;
  uint64_t v139;
  double v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  SXTextStyleAttributes *v146;
  void *v147;
  id v148;
  void *v149;
  id obj;
  id v151;
  id v152;
  id v153;
  void *v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  id v164;
  void *v165;
  SXTextStyleAttributesMap *v166;
  SXTextSource *v167;
  void *v168;
  _QWORD v169[5];
  id v170;
  _QWORD v171[4];
  id v172;
  id v173;
  _QWORD v174[4];
  id v175;
  id v176;
  id v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  id v186;
  _BYTE v187[128];
  _BYTE v188[128];
  uint64_t v189;

  v189 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXTextSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textResizerForTextSource:", self);
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [SXTextStyleAttributesMap alloc];
  -[SXTextSource string](self, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SXTextStyleAttributesMap initWithString:](v6, "initWithString:", v7);

  v9 = [SXTextStyleAttributes alloc];
  -[SXTextSource string](self, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SXTextStyleAttributes initWithRange:](v9, "initWithRange:", 0, objc_msgSend(v10, "length"));

  +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[SXTextSource defaults](self, "defaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithDouble:", -[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextStyleAttributes addAttribute:value:](v11, "addAttribute:value:", v12, v15);

  v166 = v8;
  v146 = v11;
  -[SXTextStyleAttributesMap addAttributes:](v8, "addAttributes:", v11);
  v163 = v4;
  objc_msgSend(v4, "paragraphStyleAtParIndex:effectiveRange:", 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextSource documentLanguageProvider](self, "documentLanguageProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "language");
  v18 = objc_claimAutoreleasedReturnValue();

  if (v18
    || (-[SXTextSource locale](self, "locale"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "localeIdentifier"),
        v18 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18))
  {
    objc_msgSend(v16, "setValue:forProperty:", v18, 39);
  }
  v145 = (void *)v18;
  LODWORD(v20) = 0;
  objc_msgSend(v16, "setFloatValue:forProperty:", 81, v20);
  -[SXTextSource dataSource](self, "dataSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentTextStyleForTextSource:inheritingFromDefaultStyles:", self, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXTextSource dataSource](self, "dataSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentTextStyleForTextSource:inheritingFromDefaultStyles:", self, 0);
  v24 = objc_claimAutoreleasedReturnValue();

  -[SXTextSource dataSource](self, "dataSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "defaultComponentTextStyleForTextSource:", self);
  v26 = objc_claimAutoreleasedReturnValue();

  -[SXTextSource dataSource](self, "dataSource");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "defaultComponentTextStylesForTextSource:", self);
  v28 = objc_claimAutoreleasedReturnValue();

  v155 = (void *)v24;
  v167 = self;
  v147 = (void *)v26;
  v159 = v16;
  v161 = (void *)v28;
  if (v22)
  {
    -[SXTextSource fontDescriptionsForTextStyleFontDescription:defaultTextStyleFontDesciptions:](self, "fontDescriptionsForTextStyleFontDescription:defaultTextStyleFontDesciptions:", v24, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextSource fontAttributeConstructor](self, "fontAttributeConstructor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fontAttributesForFontDescriptions:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXTextSource fontFaceForTextStyleFontDescription:defaultTextStyleFontDescription:fontAttributes:fontSize:](self, "fontFaceForTextStyleFontDescription:defaultTextStyleFontDescription:fontAttributes:fontSize:", v24, v26, v31, -[SXTextSource fontSizeForTextStyle:](self, "fontSizeForTextStyle:", v24));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextSource string](self, "string");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = 0;
    -[SXTextSource attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:](self, "attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:", v22, v16, 0, objc_msgSend(v33, "length"), &v186, v165, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = v186;

    -[SXTextStyleAttributesMap addAttributes:](v166, "addAttributes:", v34);
    -[SXTextSource string](self, "string");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextSource transform:forTextStyle:range:](self, "transform:forTextStyle:range:", v163, v22, 0, objc_msgSend(v35, "length"));

  }
  else
  {
    v148 = 0;
  }
  v162 = v22;
  objc_msgSend(v22, "linkStyle");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  if (v154)
  {
    v184 = 0u;
    v185 = 0u;
    v182 = 0u;
    v183 = 0u;
    -[SXTextSource dataSource](self, "dataSource");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "additionsForTextSource:", self);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v156 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v182, v188, 16);
    if (v156)
    {
      v151 = *(id *)v183;
      do
      {
        for (i = 0; i != v156; ++i)
        {
          if (*(id *)v183 != v151)
            objc_enumerationMutation(v37);
          v39 = objc_msgSend(*(id *)(*((_QWORD *)&v182 + 1) + 8 * i), "range");
          v41 = -[SXTextSource rangeForRange:](self, "rangeForRange:", v39, v40);
          v43 = v42;
          -[SXTextSource string](self, "string");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[SXTextSource rangeInBounds:maxLength:](self, "rangeInBounds:maxLength:", v41, v43, objc_msgSend(v44, "length"));
          v47 = v46;

          objc_msgSend(v155, "linkStyle");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "arrayByAddingObject:", v162);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXTextSource fontDescriptionsForTextStyleFontDescription:defaultTextStyleFontDesciptions:](self, "fontDescriptionsForTextStyleFontDescription:defaultTextStyleFontDesciptions:", v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          -[SXTextSource fontAttributeConstructor](self, "fontAttributeConstructor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "fontAttributesForFontDescriptions:", v50);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v155, "linkStyle");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = -[SXTextSource fontSizeForTextStyle:](self, "fontSizeForTextStyle:", v53);

          objc_msgSend(v155, "linkStyle");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXTextSource fontFaceForTextStyleFontDescription:defaultTextStyleFontDescription:fontAttributes:fontSize:](self, "fontFaceForTextStyleFontDescription:defaultTextStyleFontDescription:fontAttributes:fontSize:", v55, v162, v52, v54);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          -[SXTextSource attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:](self, "attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:", v154, v159, v45, v47, 0, v165, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXTextStyleAttributesMap addAttributes:](v166, "addAttributes:", v57);
          -[SXTextSource transform:forTextStyle:range:](self, "transform:forTextStyle:range:", v163, v154, v45, v47);

        }
        v156 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v182, v188, 16);
      }
      while (v156);
    }

  }
  v180 = 0u;
  v181 = 0u;
  v178 = 0u;
  v179 = 0u;
  v58 = self;
  -[SXTextSource dataSource](self, "dataSource");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "inlineTextStylesForTextSource:", self);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v152 = v60;
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v178, v187, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v179;
    v64 = v148;
    do
    {
      v65 = 0;
      obj = (id)v62;
      do
      {
        if (*(_QWORD *)v179 != v63)
          objc_enumerationMutation(v152);
        v66 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * v65);
        v67 = objc_msgSend(v66, "range");
        v69 = -[SXTextSource rangeForRange:](v58, "rangeForRange:", v67, v68);
        v71 = v70;
        -[SXTextSource string](v58, "string");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "length");

        if (v69 < v73)
        {
          -[SXTextSource string](v58, "string");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = -[SXTextSource rangeInBounds:maxLength:](v58, "rangeInBounds:maxLength:", v69, v71, objc_msgSend(v74, "length"));
          v77 = v76;

          objc_msgSend(v66, "textStyle");
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXTextSource dataSource](v58, "dataSource");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "textStyleForIdentifier:", v157);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          -[SXTextSource fontDescriptionsForTextStyleFontDescription:defaultTextStyleFontDesciptions:](v58, "fontDescriptionsForTextStyleFontDescription:defaultTextStyleFontDesciptions:", v79, v161);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXTextSource fontAttributeConstructor](v58, "fontAttributeConstructor");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "fontAttributesForFontDescriptions:", v80);
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          -[SXTextSource fontFaceForTextStyleFontDescription:defaultTextStyleFontDescription:fontAttributes:fontSize:](v167, "fontFaceForTextStyleFontDescription:defaultTextStyleFontDescription:fontAttributes:fontSize:", v79, v162, v82, -[SXTextSource fontSizeForTextStyle:](v167, "fontSizeForTextStyle:", v79));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v177 = v64;
          -[SXTextSource attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:](v167, "attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:", v79, v159, v75, v77, &v177, v165, v83);
          v84 = v63;
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v177;
          v87 = v64;
          v64 = v86;

          -[SXTextStyleAttributesMap addAttributes:](v166, "addAttributes:", v85);
          v88 = v75;
          v62 = (uint64_t)obj;
          -[SXTextSource transform:forTextStyle:range:](v167, "transform:forTextStyle:range:", v163, v79, v88, v77);

          v63 = v84;
          v58 = v167;

        }
        ++v65;
      }
      while (v62 != v65);
      v62 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v178, v187, 16);
    }
    while (v62);
  }
  else
  {
    v64 = v148;
  }
  v149 = v64;

  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextSource rangesExcludedOfParagraphSpacing](v58, "rangesExcludedOfParagraphSpacing");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v58;
  v92 = MEMORY[0x24BDAC760];
  v174[0] = MEMORY[0x24BDAC760];
  v174[1] = 3221225472;
  v174[2] = __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke;
  v174[3] = &unk_24D68DFC8;
  v93 = v163;
  v175 = v93;
  v94 = v89;
  v176 = v94;
  objc_msgSend(v90, "enumerateRangesUsingBlock:", v174);

  v171[0] = v92;
  v171[1] = 3221225472;
  v171[2] = __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke_2;
  v171[3] = &unk_24D68E040;
  v95 = v159;
  v172 = v95;
  v96 = v93;
  v173 = v96;
  objc_msgSend(v94, "enumerateIndexesUsingBlock:", v171);
  -[SXTextSource applyListStylingOnTextTangierStorage:usingAttributesMap:](v91, "applyListStylingOnTextTangierStorage:usingAttributesMap:", v96, v166);
  -[SXTextStyleAttributesMap attributedString](v166, "attributedString");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "length");
  v169[0] = v92;
  v169[1] = 3221225472;
  v169[2] = __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke_3;
  v169[3] = &unk_24D68E068;
  v169[4] = v91;
  v99 = v96;
  v170 = v99;
  v100 = v98;
  v101 = v149;
  objc_msgSend(v97, "enumerateAttributesInRange:options:usingBlock:", 0, v100, 0, v169);
  objc_msgSend(v99, "paragraphStyleAtParIndex:effectiveRange:", 0, 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v149)
  {
    v105 = v145;
    v103 = v162;
    goto LABEL_75;
  }
  v103 = v162;
  if (objc_msgSend(v149, "numberOfCharacters") == 0x7FFFFFFFFFFFFFFFLL)
    v104 = 1;
  else
    v104 = objc_msgSend(v149, "numberOfCharacters");
  -[SXTextSource string](v167, "string");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "length");

  if (v104 > v107)
  {
    -[SXTextSource string](v167, "string");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v108, "length");

  }
  v109 = 10;
  if (v104 < 10)
    v109 = v104;
  v101 = v149;
  if (v104 < 1)
  {
    v105 = v145;
    goto LABEL_75;
  }
  v160 = v109;
  v164 = v94;
  objc_msgSend(MEMORY[0x24BEB3AE8], "propertyMap");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "backgroundColor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  if (v111)
  {
    v112 = (void *)MEMORY[0x24BEB3C40];
    objc_msgSend(v149, "backgroundColor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "colorWithUIColor:", v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forProperty:", v114, 38);

    v101 = v149;
  }
  objc_msgSend(v101, "textColor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    v116 = (void *)MEMORY[0x24BEB3C40];
    objc_msgSend(v101, "textColor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "colorWithUIColor:", v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forProperty:", v118, 18);

    v101 = v149;
  }
  v119 = v167;
  -[SXTextSource fontDescriptionsForTextStyleFontDescription:defaultTextStyleFontDesciptions:](v167, "fontDescriptionsForTextStyleFontDescription:defaultTextStyleFontDesciptions:", v101, v161);
  v120 = v110;
  v121 = objc_claimAutoreleasedReturnValue();
  -[SXTextSource fontAttributeConstructor](v167, "fontAttributeConstructor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = (void *)v121;
  objc_msgSend(v122, "fontAttributesForFontDescriptions:", v121);
  v123 = objc_claimAutoreleasedReturnValue();

  v124 = -[SXTextSource fontSizeForTextStyle:](v167, "fontSizeForTextStyle:", v162);
  v168 = (void *)v123;
  v125 = v120;
  -[SXTextSource fontFaceForTextStyleFontDescription:defaultTextStyleFontDescription:fontAttributes:fontSize:](v119, "fontFaceForTextStyleFontDescription:defaultTextStyleFontDescription:fontAttributes:fontSize:", v101, v147, v123, v124);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "fontDescriptorAttributes");
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  if (v127)
  {
    objc_msgSend(v126, "fontAttributes");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v128, "weight");
    if (v129 <= 499)
    {
      if (v129 > 299)
      {
        if (v129 == 300)
        {
          v130 = (double *)MEMORY[0x24BDF7878];
          goto LABEL_63;
        }
      }
      else
      {
        if (v129 == 100)
        {
          v130 = (double *)MEMORY[0x24BDF7898];
          goto LABEL_63;
        }
        if (v129 == 200)
        {
          v130 = (double *)MEMORY[0x24BDF78A8];
          goto LABEL_63;
        }
      }
    }
    else if (v129 <= 699)
    {
      if (v129 == 500)
      {
        v130 = (double *)MEMORY[0x24BDF7880];
        goto LABEL_63;
      }
      if (v129 == 600)
      {
        v130 = (double *)MEMORY[0x24BDF7890];
        goto LABEL_63;
      }
    }
    else
    {
      switch(v129)
      {
        case 700:
          v130 = (double *)MEMORY[0x24BDF7868];
          goto LABEL_63;
        case 800:
          v130 = (double *)MEMORY[0x24BDF7870];
          goto LABEL_63;
        case 900:
          v130 = (double *)MEMORY[0x24BDF7860];
LABEL_63:
          v131 = *v130;
          *(float *)&v131 = *v130;
          objc_msgSend(v125, "setFloatValue:forProperty:", 50, v131);

          objc_msgSend(v126, "fontAttributes");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "setBoolValue:forProperty:", (unint64_t)(objc_msgSend(v132, "style") - 1) < 2, 20);

          objc_msgSend(v126, "fontDescriptorAttributes");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "setBoxedObject:forProperty:", v133, 53);

          goto LABEL_64;
      }
    }
    v130 = (double *)MEMORY[0x24BDF7888];
    goto LABEL_63;
  }
LABEL_64:
  v134 = -[SXTextResizer resizeDropCapNumberOfLines:]((uint64_t)v165, objc_msgSend(v101, "numberOfLines"));
  v135 = (double)v134 / (double)objc_msgSend(v101, "numberOfLines");
  if (objc_msgSend(v101, "numberOfRaisedLines") == 0x7FFFFFFFFFFFFFFFLL
    || (v136 = (unint64_t)(v135 * (double)objc_msgSend(v101, "numberOfRaisedLines"))) == 0)
  {
    v136 = objc_msgSend(v101, "numberOfRaisedLines") >= 1
        && objc_msgSend(v101, "numberOfRaisedLines") != 0x7FFFFFFFFFFFFFFFLL;
  }
  v153 = v97;
  if (v136 >= v134)
    v137 = v134 - 1;
  else
    v137 = v136;
  objc_msgSend(MEMORY[0x24BEB3B10], "dropCapSpacingWithLineCount:elevatedLineCount:", v134, v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = objc_msgSend(v101, "padding");
  v140 = 0.0;
  if (v139 != 0x7FFFFFFFFFFFFFFFLL)
    v140 = v135 * (double)objc_msgSend(v101, "padding", 0.0);
  objc_msgSend(v138, "setPadding:", v140);
  objc_msgSend(MEMORY[0x24BEB3B08], "dropCapWithCharCount:characterStyleOverridePropertyMap:spacing:", v160, v125, v138);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "stylesheet");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB3AE8], "propertyMapWithPropertiesAndValues:", 109, v141, 0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "variationOfStyle:propertyMap:", v95, v143);
  v144 = objc_claimAutoreleasedReturnValue();

  v101 = v149;
  v102 = (void *)v144;
  v105 = v145;
  v103 = v162;
  v94 = v164;
  v97 = v153;
LABEL_75:
  if (v102)
    objc_msgSend(v99, "setParagraphStyle:atParIndex:undoTransaction:", v102, 0, 0);

}

uint64_t __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(*(id *)(a1 + 32), "paragraphIndexRangeForCharRange:", a2, a3);
  return objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", v4, v5);
}

void __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(*(id *)(a1 + 40), "setParagraphStyle:atParIndex:undoTransaction:", v4, a2, 0);

}

void __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = a2;
  objc_msgSend(v8, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characterStyleFromAttributes:context:", v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setCharacterStyle:range:undoTransaction:", v11, a3, a4, 0);
}

- (void)applyAdditionsOnTextTangierStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SXTextSource *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[SXTextSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = self;
  objc_msgSend(v5, "additionsForTextSource:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
        v12 = objc_opt_class();
        if (v12 != objc_opt_class() && objc_msgSend(v11, "range") != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = objc_msgSend(v11, "range");
          v15 = -[SXTextSource rangeForRange:](v26, "rangeForRange:", v13, v14);
          v17 = v16;
          -[SXTextSource string](v26, "string");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[SXTextSource rangeInBounds:maxLength:](v26, "rangeInBounds:maxLength:", v15, v17, objc_msgSend(v18, "length"));
          v21 = v20;

          -[SXTextSource smartFieldFactory](v26, "smartFieldFactory");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "context");
          v23 = v4;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "smartFieldForAddition:withContext:", v11, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v23;
          if (v25)
            objc_msgSend(v23, "addSmartField:toRange:dolcContext:undoTransaction:", v25, v19, v21, 0, 0);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

}

- (void)applyListStylingOnTextTangierStorage:(id)a3 usingAttributesMap:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  unint64_t v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  unint64_t v79;
  unint64_t v80;
  void *v81;
  double v82;
  unint64_t v83;
  void *v84;
  double v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t k;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  id obj;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  SXTextSource *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unsigned int v112;
  __CFString *v113;
  void *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[4];
  id v121;
  _QWORD v122[2];
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v93 = a4;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  -[SXTextSource dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inlineTextStylesForTextSource:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v131, v138, 16);
  if (v9)
  {
    v10 = v9;
    v98 = *(_QWORD *)v132;
    v104 = self;
    v115 = v6;
    do
    {
      v11 = 0;
      v94 = v10;
      do
      {
        if (*(_QWORD *)v132 != v98)
          objc_enumerationMutation(obj);
        v103 = v11;
        v12 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "range");
        v15 = -[SXTextSource rangeForRange:](self, "rangeForRange:", v13, v14);
        v17 = v16;
        -[SXTextSource string](self, "string");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[SXTextSource rangeInBounds:maxLength:](self, "rangeInBounds:maxLength:", v15, v17, objc_msgSend(v18, "length"));
        v21 = v20;

        v100 = v21;
        v101 = v19;
        v22 = objc_msgSend(v6, "paragraphIndexRangeForCharRange:", v19, v21);
        v24 = v23;
        objc_msgSend(v12, "textStyle");
        v25 = objc_claimAutoreleasedReturnValue();
        -[SXTextSource dataSource](self, "dataSource");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = (void *)v25;
        objc_msgSend(v26, "textStyleForIdentifier:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "listStyle");
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (void *)v28;
          objc_msgSend(v27, "listStyle");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "count");

          if (v31)
          {
            v32 = (void *)MEMORY[0x24BEB3B50];
            objc_msgSend(v6, "context");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "defaultStyleWithContext:", v33);
            v96 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXTextSource populateArray:withValue:forSize:](self, "populateArray:withValue:forSize:", v34, &unk_24D6FF1F0, 9);
            v107 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXTextSource populateArray:withValue:forSize:](self, "populateArray:withValue:forSize:", v35, &stru_24D68E0F8, 9);
            v108 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXTextSource populateArray:withValue:forSize:](self, "populateArray:withValue:forSize:", v36, &unk_24D6FF1F0, 9);
            v106 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXTextSource populateArray:withValue:forSize:](self, "populateArray:withValue:forSize:", v37, &unk_24D6FF208, 9);
            v99 = (void *)objc_claimAutoreleasedReturnValue();

            v38 = objc_msgSend(v6, "paragraphIndexAtCharIndex:", v101);
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v127 = 0u;
            v128 = 0u;
            v129 = 0u;
            v130 = 0u;
            objc_msgSend(v27, "listStyle");
            v105 = (id)objc_claimAutoreleasedReturnValue();
            v97 = v27;
            v110 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
            if (!v110)
              goto LABEL_44;
            v109 = *(_QWORD *)v128;
            while (1)
            {
              for (i = 0; i != v110; ++i)
              {
                if (*(_QWORD *)v128 != v109)
                  objc_enumerationMutation(v105);
                v40 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
                v112 = -[SXTextSource listLabelTypeForListType:](self, "listLabelTypeForListType:", objc_msgSend(v40, "style"));
                v41 = -[SXTextSource listNumberTypeForListType:](self, "listNumberTypeForListType:", objc_msgSend(v40, "style"));
                v113 = CFSTR("  ");
                if (objc_msgSend(v40, "style") != 1)
                {
                  if (objc_msgSend(v40, "style") == 2)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 8226);
                    v42 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v113 = &stru_24D68E0F8;
                    if (objc_msgSend(v40, "style") != 8)
                      goto LABEL_19;
                    objc_msgSend(v40, "character");
                    v42 = objc_claimAutoreleasedReturnValue();
                  }
                  v113 = (__CFString *)v42;
                }
LABEL_19:
                if (objc_msgSend(v40, "depth") && objc_msgSend(v40, "depth") != 0x7FFFFFFFFFFFFFFFLL
                  || (objc_msgSend(v40, "indices"),
                      v43 = (void *)objc_claimAutoreleasedReturnValue(),
                      v44 = objc_msgSend(v43, "count"),
                      v43,
                      v44))
                {
                  objc_msgSend(v40, "indices");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = objc_msgSend(v45, "count");

                  if (!v46)
                    goto LABEL_42;
                  v111 = i;
                  if (objc_msgSend(v40, "style") == 1)
                  {
                    v47 = (void *)MEMORY[0x24BEB3B50];
                    objc_msgSend(v115, "context");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "defaultStyleWithContext:", v48);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v41);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SXTextSource populateArray:withValue:forSize:](self, "populateArray:withValue:forSize:", v50, v51, 9);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "setValue:forProperty:", v52, 184);

                    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SXTextSource populateArray:withValue:forSize:](self, "populateArray:withValue:forSize:", v53, v113, 9);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "setValue:forProperty:", v54, 183);

                    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v112);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SXTextSource populateArray:withValue:forSize:](self, "populateArray:withValue:forSize:", v55, v56, 9);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "setValue:forProperty:", v57, 180);

                    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SXTextSource populateArray:withValue:forSize:](self, "populateArray:withValue:forSize:", v58, &unk_24D6FF208, 9);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "setValue:forProperty:", v59, 176);

                  }
                  else
                  {
                    v64 = objc_msgSend(v40, "depth");
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v112);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v107, "replaceObjectAtIndex:withObject:", v64, v65);

                    objc_msgSend(v108, "replaceObjectAtIndex:withObject:", objc_msgSend(v40, "depth"), v113);
                    v66 = objc_msgSend(v40, "depth");
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v41);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v106, "replaceObjectAtIndex:withObject:", v66, v58);
                    v49 = 0;
                  }

                  v125 = 0u;
                  v126 = 0u;
                  v123 = 0u;
                  v124 = 0u;
                  objc_msgSend(v40, "indices");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
                  if (v68)
                  {
                    v69 = v68;
                    v70 = *(_QWORD *)v124;
                    do
                    {
                      for (j = 0; j != v69; ++j)
                      {
                        if (*(_QWORD *)v124 != v70)
                          objc_enumerationMutation(v67);
                        v72 = objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * j), "integerValue") + v38;
                        if (v72 >= v22 && v72 - v22 < v24)
                        {
                          objc_msgSend(v115, "setParagraphLevel:atParIndex:undoTransaction:", objc_msgSend(v40, "depth"), v72, 0);
                          if (v49)
                          {
                            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v72);
                            v74 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v114, "setObject:forKey:", v49, v74);

                          }
                        }
                      }
                      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
                    }
                    while (v69);
                  }

                  self = v104;
                }
                else
                {
                  v111 = i;
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v112);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SXTextSource populateArray:withValue:forSize:](self, "populateArray:withValue:forSize:", v107, v60, 9);
                  v61 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v41);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SXTextSource populateArray:withValue:forSize:](self, "populateArray:withValue:forSize:", v106, v62, 9);
                  v63 = objc_claimAutoreleasedReturnValue();

                  v49 = v108;
                  -[SXTextSource populateArray:withValue:forSize:](self, "populateArray:withValue:forSize:", v108, v113, 9);
                  v106 = (void *)v63;
                  v107 = (void *)v61;
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                }

                i = v111;
LABEL_42:

                v6 = v115;
              }
              v110 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
              if (!v110)
              {
LABEL_44:

                objc_msgSend(v96, "setValue:forProperty:", v106, 184);
                objc_msgSend(v96, "setValue:forProperty:", v108, 183);
                objc_msgSend(v96, "setValue:forProperty:", v107, 180);
                objc_msgSend(v96, "setValue:forProperty:", v99, 176);
                objc_msgSend(v93, "attributesMapWithAttributesForRange:", v101, v100);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v122[0] = 0;
                v122[1] = 0;
                objc_msgSend(v75, "attributedString");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "attributesAtIndex:effectiveRange:", v101, v122);
                v77 = (void *)objc_claimAutoreleasedReturnValue();

                v120[0] = MEMORY[0x24BDAC760];
                v120[1] = 3221225472;
                v120[2] = __72__SXTextSource_applyListStylingOnTextTangierStorage_usingAttributesMap___block_invoke;
                v120[3] = &unk_24D68E090;
                v78 = v96;
                v121 = v78;
                objc_msgSend(v77, "enumerateKeysAndObjectsUsingBlock:", v120);
                objc_msgSend(v6, "setListStyle:forCharRange:undoTransaction:", v78, v101, v100, 0);
                v79 = v22 + 1;
                if (v22 + 1 < v22 + v24)
                {
                  v80 = v24 - 1;
                  do
                  {
                    objc_msgSend(v6, "paragraphStyleAtParIndex:effectiveRange:", v79, 0);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v82) = 0;
                    objc_msgSend(v81, "setFloatValue:forProperty:", 87, v82);

                    ++v79;
                    --v80;
                  }
                  while (v80);
                }
                if (v22 < v22 + v24 - 1)
                {
                  v83 = v24 - 1;
                  do
                  {
                    objc_msgSend(v6, "paragraphStyleAtParIndex:effectiveRange:", v22, 0);
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v85) = 0;
                    objc_msgSend(v84, "setFloatValue:forProperty:", 88, v85);

                    ++v22;
                    --v83;
                  }
                  while (v83);
                }
                v118 = 0u;
                v119 = 0u;
                v116 = 0u;
                v117 = 0u;
                v86 = v114;
                v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v116, v135, 16);
                if (v87)
                {
                  v88 = v87;
                  v89 = *(_QWORD *)v117;
                  do
                  {
                    for (k = 0; k != v88; ++k)
                    {
                      if (*(_QWORD *)v117 != v89)
                        objc_enumerationMutation(v86);
                      v91 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * k);
                      objc_msgSend(v86, "objectForKey:", v91);
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "setListStyle:atParIndex:undoTransaction:", v92, (int)objc_msgSend(v91, "intValue"), 0);

                    }
                    v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v116, v135, 16);
                  }
                  while (v88);
                }

                self = v104;
                v10 = v94;
                v27 = v97;
                break;
              }
            }
          }
        }

        v11 = v103 + 1;
      }
      while (v103 + 1 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v138, 16);
    }
    while (v10);
  }

}

void __72__SXTextSource_applyListStylingOnTextTangierStorage_usingAttributesMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BEB3B50], "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsProperty:", +[SXCharacterStyle propertyFromString:](SXCharacterStyle, "propertyFromString:", v8));

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "setValue:forProperty:", v5, +[SXCharacterStyle propertyFromString:](SXCharacterStyle, "propertyFromString:", v8));

}

- (id)populateArray:(id)a3 withValue:(id)a4 forSize:(unint64_t)a5
{
  id v7;
  id v8;
  unint64_t v9;

  v7 = a3;
  v8 = a4;
  if (a5)
  {
    v9 = 0;
    do
    {
      if (objc_msgSend(v7, "count") <= v9)
        objc_msgSend(v7, "addObject:", v8);
      else
        objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v9, v8);
      ++v9;
    }
    while (a5 != v9);
  }

  return v7;
}

- (int)listLabelTypeForListType:(unint64_t)a3
{
  if (a3 <= 8 && ((1 << a3) & 0x106) != 0)
    return 2;
  else
    return 3;
}

- (int)listNumberTypeForListType:(unint64_t)a3
{
  if (a3 - 4 > 3)
    return 0;
  else
    return dword_21713C890[a3 - 4];
}

- (id)characterStyleFromAttributes:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  SXCharacterStyle *v7;
  SXCharacterStyle *v8;
  _QWORD v10[4];
  SXCharacterStyle *v11;

  v5 = a4;
  v6 = a3;
  v7 = -[TSSStyle initWithContext:]([SXCharacterStyle alloc], "initWithContext:", v5);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__SXTextSource_characterStyleFromAttributes_context___block_invoke;
  v10[3] = &unk_24D68E090;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  return v8;
}

void __53__SXTextSource_characterStyleFromAttributes_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = +[SXCharacterStyle propertyFromString:](SXCharacterStyle, "propertyFromString:", a2);
  switch(+[SXCharacterStyle typeOfProperty:](SXCharacterStyle, "typeOfProperty:", v5))
  {
    case 0u:
      objc_msgSend(*(id *)(a1 + 32), "setValue:forProperty:", v8, v5);
      break;
    case 1u:
      objc_msgSend(*(id *)(a1 + 32), "setIntValue:forProperty:", objc_msgSend(v8, "intValue"), v5);
      break;
    case 2u:
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v8, "floatValue");
      objc_msgSend(v6, "setFloatValue:forProperty:", v5);
      break;
    case 3u:
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v8, "doubleValue");
      objc_msgSend(v7, "setDoubleValue:forProperty:", v5);
      break;
    default:
      break;
  }

}

- (id)attributesForTextStyle:(id)a3 onParagraphStyle:(id)a4 forRange:(_NSRange)a5 resultingDropCapStyle:(id *)a6 textResizer:(id)a7 fontFace:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  id *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id *v25;
  double v26;
  float v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  double *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  void *v118;
  double v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  int64_t v131;
  uint64_t v132;
  void *v133;

  length = a5.length;
  location = a5.location;
  v13 = a3;
  v14 = a4;
  v15 = a8;
  +[SXTextStyleAttributes attributesWithRange:](SXTextStyleAttributes, "attributesWithRange:", location, length);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SXTextSource fontSizeForTextStyle:](self, "fontSizeForTextStyle:", v13);
  v18 = -[SXTextSource scaledFontSizeForFontSize:](self, "scaledFontSizeForFontSize:", v17);
  objc_opt_class();
  v133 = v15;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_42;
  v131 = v18;
  v19 = a6;
  v20 = v13;
  -[SXTextSource dataSource](self, "dataSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "textRulesForTextSource:", self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "shouldHyphenate") && !objc_msgSend(v20, "hyphenation"))
  {

  }
  else
  {
    v23 = objc_msgSend(v20, "hyphenation", v131);

    if (v23 != 1)
    {
      v24 = 0;
      goto LABEL_8;
    }
  }
  v24 = 1;
LABEL_8:
  v15 = v133;
  v25 = v19;
  objc_msgSend(v14, "setIntValue:forProperty:", v24, 93, v131);
  objc_msgSend(v14, "setIntValue:forProperty:", objc_msgSend(v20, "hyphenationMinimumCharactersBefore"), String());
  objc_msgSend(v14, "setIntValue:forProperty:", objc_msgSend(v20, "hyphenationMinimumCharactersAfter"), String());
  objc_msgSend(v14, "setIntValue:forProperty:", objc_msgSend(v20, "hyphenationMinimumWordLength"), String());
  objc_msgSend(v20, "hyphenationZone");
  v27 = v26;
  v28 = String();
  *(float *)&v29 = v27;
  objc_msgSend(v14, "setFloatValue:forProperty:", v28, v29);
  objc_msgSend(v20, "relativeLineHeight");
  v31 = v30;
  v32 = objc_msgSend(v20, "exactLineHeight");
  v18 = v132;
  if (objc_msgSend(v20, "lineHeight") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v36 = objc_msgSend(v20, "lineHeight");
LABEL_15:
    v35 = (double)v36;
    v33 = (double)v17;
LABEL_16:
    v37 = (double)v132 / v33 * v35;
    v38 = 1.79769313e308;
    if (v37 != 1.79769313e308)
    {
      if (v37 >= 1.0)
        v38 = v37;
      else
        v38 = 1.0;
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3B48]), "initWithMode:amount:", 2, v38);
      objc_msgSend(v14, "setValue:forProperty:", v39, 85);

    }
    goto LABEL_21;
  }
  if (v31 != 1.79769313e308 && v32 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v33 = (double)v17;
    objc_msgSend(v20, "relativeLineHeight");
    v35 = (v34 + -1.0) * v33 + v33 * 1.25;
    goto LABEL_16;
  }
  if (v32 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v36 = objc_msgSend(v20, "exactLineHeight");
    goto LABEL_15;
  }
  v38 = 1.79769313e308;
LABEL_21:
  if (objc_msgSend(v20, "textAlignment"))
    objc_msgSend(v14, "setIntValue:forProperty:", -[SXTextSource paragraphAlignmentForTextAlignment:](self, "paragraphAlignmentForTextAlignment:", objc_msgSend(v20, "textAlignment")), 86);
  if (objc_msgSend(v20, "paragraphSpacingBefore") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v40 = (double)v132 / (double)v17 * (double)objc_msgSend(v20, "paragraphSpacingBefore");
    *(float *)&v40 = v40;
    objc_msgSend(v14, "setFloatValue:forProperty:", 87, v40);
  }
  if (objc_msgSend(v20, "paragraphSpacingAfter") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v41 = (double)v132 / (double)v17 * (double)objc_msgSend(v20, "paragraphSpacingAfter");
    *(float *)&v41 = v41;
    objc_msgSend(v14, "setFloatValue:forProperty:", 88, v41);
  }
  if (objc_msgSend(v20, "paragraphSpacingBefore") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v20, "paragraphSpacingAfter") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v42 = (double)v132 * 1.25;
    if (v38 != 1.79769313e308)
      v42 = v38;
    *(float *)&v42 = v42;
    objc_msgSend(v14, "setFloatValue:forProperty:", 88, v42);
  }
  objc_msgSend(v20, "dropCapStyle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && v43)
  {
    objc_msgSend(v20, "dropCapStyle");
    *v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v20, "firstLineIndent") != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(float *)&v44 = (float)objc_msgSend(v20, "firstLineIndent");
    objc_msgSend(v14, "setFloatValue:forProperty:", 80, v44);
  }
  if (objc_msgSend(v20, "hangingPunctuation"))
    objc_msgSend(v14, "setIntValue:forProperty:", 1, 110);
  if (objc_msgSend(v20, "lineBalancing"))
    objc_msgSend(v14, "setIntValue:forProperty:", 1, 51);

LABEL_42:
  objc_msgSend(v15, "fontDescriptorAttributes");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v46 = v15;
    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 50);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v46, "fontAttributes");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "weight");
    if (v50 <= 499)
    {
      if (v50 > 299)
      {
        if (v50 == 300)
        {
          v51 = (double *)MEMORY[0x24BDF7878];
          goto LABEL_64;
        }
      }
      else
      {
        if (v50 == 100)
        {
          v51 = (double *)MEMORY[0x24BDF7898];
          goto LABEL_64;
        }
        if (v50 == 200)
        {
          v51 = (double *)MEMORY[0x24BDF78A8];
          goto LABEL_64;
        }
      }
    }
    else if (v50 <= 699)
    {
      if (v50 == 500)
      {
        v51 = (double *)MEMORY[0x24BDF7880];
        goto LABEL_64;
      }
      if (v50 == 600)
      {
        v51 = (double *)MEMORY[0x24BDF7890];
        goto LABEL_64;
      }
    }
    else
    {
      switch(v50)
      {
        case 700:
          v51 = (double *)MEMORY[0x24BDF7868];
          goto LABEL_64;
        case 800:
          v51 = (double *)MEMORY[0x24BDF7870];
          goto LABEL_64;
        case 900:
          v51 = (double *)MEMORY[0x24BDF7860];
LABEL_64:
          objc_msgSend(v48, "numberWithDouble:", *v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addAttribute:value:", v47, v52);

          +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 20);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v133, "fontAttributes");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "numberWithBool:", (unint64_t)(objc_msgSend(v55, "style") - 1) < 2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addAttribute:value:", v53, v56);

          +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 53);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "fontDescriptorAttributes");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addAttribute:value:", v57, v58);

          goto LABEL_65;
      }
    }
    v51 = (double *)MEMORY[0x24BDF7888];
    goto LABEL_64;
  }
LABEL_65:
  if (v18 && v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 17);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v59, v60);

  }
  objc_msgSend(v13, "textColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 18);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)MEMORY[0x24BEB3C40];
    objc_msgSend(v13, "textColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "colorWithUIColor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v62, v65);

  }
  objc_msgSend(v13, "backgroundColor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 37);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)MEMORY[0x24BEB3C40];
    objc_msgSend(v13, "backgroundColor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "colorWithUIColor:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v67, v70);

  }
  if (objc_msgSend(v13, "textTransform") == 4)
  {
    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 48);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v71, &unk_24D6FF220);

    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 21);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v72, &unk_24D6FF208);

  }
  objc_msgSend(v13, "tracking");
  if (v73 != 1.79769313e308)
  {
    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 35);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v13, "tracking");
    objc_msgSend(v75, "numberWithDouble:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v74, v76);

    objc_msgSend(v13, "tracking");
    if (v77 != 0.0)
    {
      +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 41);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAttribute:value:", v78, &unk_24D6FF1F0);

    }
  }
  if (objc_msgSend(v13, "verticalAlignment"))
  {
    v79 = objc_msgSend(v13, "verticalAlignment");
    if (v79 == 3)
      v80 = 2;
    else
      v80 = v79 == 2;
    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 36);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v80);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v81, v82);

  }
  objc_msgSend(v13, "textShadow");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    objc_msgSend(v13, "textShadow");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "TSDShadow");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 40);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v86, v85);

  }
  objc_msgSend(v13, "strikethrough");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 26);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v88, &unk_24D6FF220);

    objc_msgSend(v13, "strikethrough");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "color");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 28);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = (void *)MEMORY[0x24BEB3C40];
      objc_msgSend(v13, "strikethrough");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "color");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "colorWithUIColor:", v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAttribute:value:", v91, v95);

    }
    objc_msgSend(v13, "strikethrough");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "width");

    if (v97 == 0x7FFFFFFFFFFFFFFFLL)
      v98 = 1;
    else
      v98 = v97;
    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 27);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v98);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v99, v100);

  }
  objc_msgSend(v13, "underline");
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (v101)
  {
    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 22);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v102, &unk_24D6FF220);

    objc_msgSend(v13, "underline");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "color");
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    if (v104)
    {
      +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 24);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = (void *)MEMORY[0x24BEB3C40];
      objc_msgSend(v13, "underline");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "color");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "colorWithUIColor:", v108);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAttribute:value:", v105, v109);

    }
    objc_msgSend(v13, "underline");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v110, "width");

    if (v111 == 0x7FFFFFFFFFFFFFFFLL)
      v112 = 1;
    else
      v112 = v111;
    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 23);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v112);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v113, v114);

  }
  objc_msgSend(v13, "stroke");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    objc_msgSend(v13, "stroke");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "width");
    if (v117 == 9.22337204e18)
    {
      v120 = 1;
    }
    else
    {
      objc_msgSend(v13, "stroke");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "width");
      v120 = (uint64_t)v119;

    }
    objc_msgSend(v13, "stroke");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "color");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (v122)
    {
      objc_msgSend(v13, "stroke");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "color");
      v124 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v124 = 0;
    }

    +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 31);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v120);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:", v125, v126);

    if (v124)
    {
      +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 32);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEB3C40], "colorWithUIColor:", v124);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAttribute:value:", v127, v128);

      +[SXCharacterStyle stringFromProperty:](SXCharacterStyle, "stringFromProperty:", 49);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAttribute:value:", v129, &unk_24D6FF220);

    }
  }

  return v16;
}

- (void)transform:(id)a3 forTextStyle:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  length = a5.length;
  location = a5.location;
  v13 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "textTransform"))
  {
    objc_msgSend(v13, "substringWithRange:", location, length);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "textTransform");
    switch(v10)
    {
      case 1:
        objc_msgSend(v9, "localizedUppercaseString");
        v11 = objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        objc_msgSend(v9, "localizedCapitalizedString");
        v11 = objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        objc_msgSend(v9, "localizedLowercaseString");
        v11 = objc_claimAutoreleasedReturnValue();
        break;
      default:
LABEL_9:
        objc_msgSend(v13, "replaceCharactersInRange:withString:undoTransaction:", location, length, v9, 0);

        goto LABEL_10;
    }
    v12 = (void *)v11;

    v9 = v12;
    goto LABEL_9;
  }
LABEL_10:

}

- (NSLocale)locale
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;

  -[SXTextSource documentLanguageProvider](self, "documentLanguageProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "language");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("en");
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLocale *)v5;
}

- (_NSRange)rangeInBounds:(_NSRange)a3 maxLength:(unint64_t)a4
{
  unint64_t location;
  NSUInteger length;
  _NSRange result;

  if (a3.location >= a4 - 1)
    location = a4 - 1;
  else
    location = a3.location;
  if (a3.length >= a4 - location)
    length = a4 - location;
  else
    length = a3.length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)fontFaceForTextStyleFontDescription:(id)a3 defaultTextStyleFontDescription:(id)a4 fontAttributes:(id)a5 fontSize:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "fontAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 || (objc_msgSend(v11, "fontAttributes"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    && (v13, v12))
  {
    if (a6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SXTextSource defaults](self, "defaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (uint64_t)-[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v14);

    }
    else
    {
      v15 = -[SXTextSource scaledFontSizeForFontSize:](self, "scaledFontSizeForFontSize:", a6);
    }
    -[SXTextSource fontAttributeConstructor](self, "fontAttributeConstructor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fontFaceForAttributes:size:", v12, v15);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "fontName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v11, "fontName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v18 = 0;
        goto LABEL_12;
      }
    }
    +[SXTextSourceFontFace fontFaceWithFontName:](SXTextSourceFontFace, "fontFaceWithFontName:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

LABEL_12:
  return v18;
}

- (id)fontDescriptionsForTextStyleFontDescription:(id)a3 defaultTextStyleFontDesciptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "addObject:", v6);
  objc_msgSend(v9, "addObjectsFromArray:", v7);
  -[SXTextSource defaultFontDescribing](self, "defaultFontDescribing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  v11 = (void *)objc_msgSend(v9, "copy");
  return v11;
}

- (unsigned)paragraphAlignmentForTextAlignment:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2)
    return 0;
  else
    return dword_21713C884[a3 - 2];
}

- (int64_t)scaledFontSizeForFontSize:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int64_t v17;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[SXTextSource dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textRulesForTextSource:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXTextSource dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textResizerForTextSource:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXTextSource dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentSizeCategoryForTextSource:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fontResizingTresholdFactor");
  v13 = v12;
  objc_msgSend(v7, "fontSizeConstant");
  v15 = v14;
  objc_msgSend(v7, "fontTextStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SXTextResizer resizeTextSize:fontResizingThreshold:fontSizeConstant:contentSizeCategory:fontTextStyle:]((uint64_t)v9, a3, v11, v16, v13, v15);

  return v17;
}

- (int64_t)fontSizeForTextStyle:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "fontSize");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SXTextSource defaults](self, "defaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (uint64_t)-[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v6);

    }
    else
    {
      v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v5;
}

- (id)randomColorWithAlpha:(double)a3
{
  double v4;
  double v5;

  v4 = (double)arc4random() * 0.00390625;
  v5 = (double)(arc4random() & 0x7F) * 0.00390625 + 0.5;
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", v4, v5, (double)(arc4random() & 0x7F) * 0.00390625 + 0.5, a3);
}

- (SXTextSourceDataSource)dataSource
{
  return (SXTextSourceDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSString)string
{
  return self->_string;
}

- (SXTextSourceDefaults)defaults
{
  return self->_defaults;
}

- (SXSmartFieldFactory)smartFieldFactory
{
  return self->_smartFieldFactory;
}

- (NSMutableIndexSet)deletedRangeOffsets
{
  return self->_deletedRangeOffsets;
}

- (void)setDeletedRangeOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_deletedRangeOffsets, a3);
}

- (NSMutableIndexSet)insertedRangeOffsets
{
  return self->_insertedRangeOffsets;
}

- (void)setInsertedRangeOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_insertedRangeOffsets, a3);
}

- (NSMutableIndexSet)rangesExcludedOfParagraphSpacing
{
  return self->_rangesExcludedOfParagraphSpacing;
}

- (void)setRangesExcludedOfParagraphSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_rangesExcludedOfParagraphSpacing, a3);
}

- (SXFontAttributesConstructor)fontAttributeConstructor
{
  return self->_fontAttributeConstructor;
}

- (SXTextStyleFontDescribing)defaultFontDescribing
{
  return self->_defaultFontDescribing;
}

- (SXDocumentLanguageProviding)documentLanguageProvider
{
  return self->_documentLanguageProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentLanguageProvider, 0);
  objc_storeStrong((id *)&self->_defaultFontDescribing, 0);
  objc_storeStrong((id *)&self->_fontAttributeConstructor, 0);
  objc_storeStrong((id *)&self->_rangesExcludedOfParagraphSpacing, 0);
  objc_storeStrong((id *)&self->_insertedRangeOffsets, 0);
  objc_storeStrong((id *)&self->_deletedRangeOffsets, 0);
  objc_storeStrong((id *)&self->_smartFieldFactory, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)initWithString:(void *)a3 smartFieldFactory:dataSource:documentLanguageProvider:fontAttributesConstructor:.cold.1(void *a1, uint8_t *buf, void *a3)
{
  *(_DWORD *)buf = 136315906;
  *(_QWORD *)(buf + 4) = "-[SXTextSource initWithString:smartFieldFactory:dataSource:documentLanguageProvider:fontAttribu"
                         "tesConstructor:]";
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = "SXTextSource.m";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 142;
  *((_WORD *)buf + 14) = 2114;
  *(_QWORD *)(buf + 30) = a1;
  _os_log_fault_impl(&dword_217023000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: StringCleaning) : %s %s:%d %{public}@", buf, 0x26u);

}

@end
