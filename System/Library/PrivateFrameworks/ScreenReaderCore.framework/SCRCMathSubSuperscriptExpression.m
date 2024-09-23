@implementation SCRCMathSubSuperscriptExpression

- (SCRCMathSubSuperscriptExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathSubSuperscriptExpression *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCRCMathSubSuperscriptExpression;
  v5 = -[SCRCMathExpression initWithDictionary:](&v13, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMBaseObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathSubSuperscriptExpression setBase:](v5, "setBase:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("AXMSubscriptObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathSubSuperscriptExpression setSubscript:](v5, "setSubscript:", v9);

    objc_msgSend(v4, "objectForKey:", CFSTR("AXMSuperscriptObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathSubSuperscriptExpression setSuperscript:](v5, "setSuperscript:", v11);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCRCMathSubSuperscriptExpression;
  -[SCRCMathSubSuperscriptExpression description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathSubSuperscriptExpression base](self, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathSubSuperscriptExpression subscript](self, "subscript");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - base %@, subscript %@, superscript %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isRangeSubSuperscript
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[SCRCMathSubSuperscriptExpression base](self, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[SCRCMathSubSuperscriptExpression subscript](self, "subscript"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      LOBYTE(v6) = objc_msgSend(v3, "canBeUsedWithRange");
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (BOOL)isBaseSubSuperscript
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  -[SCRCMathSubSuperscriptExpression base](self, "base");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[SCRCMathSubSuperscriptExpression subscript](self, "subscript");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v8 = 0;
LABEL_7:

    return v8;
  }
  v6 = (void *)v5;
  -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[SCRCMathSubSuperscriptExpression base](self, "base");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "canBeUsedWithBase");
    goto LABEL_7;
  }
  return 0;
}

- (BOOL)isNumber
{
  void *v4;
  char v5;

  if (-[SCRCMathExpression isNumberOverride](self, "isNumberOverride"))
    return 1;
  -[SCRCMathSubSuperscriptExpression base](self, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNumber");

  return v5;
}

- (unint64_t)fractionLevel
{
  void *v2;
  unint64_t v3;

  -[SCRCMathSubSuperscriptExpression base](self, "base");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fractionLevel");

  return v3;
}

- (id)subExpressions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SCRCMathSubSuperscriptExpression base](self, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathSubSuperscriptExpression subscript](self, "subscript");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression arrayWithoutNilsFromFirstChild:secondChild:thirdChild:](self, "arrayWithoutNilsFromFirstChild:secondChild:thirdChild:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stringToAddForSuperscript:(id)a3 withPriorDescription:(id)a4 updatedDescription:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  int v17;
  const __CFString *v18;
  const __CFString *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  id v33;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "length"))
  {
    v20 = 0;
    goto LABEL_21;
  }
  -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isNumber");

  -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    v14 = objc_msgSend(v12, "isInteger");

    if (v14)
    {
      -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      if (v16 == 2)
      {
        v17 = objc_msgSend(v9, "scrcContainsPause");
        v18 = CFSTR("superscript.squared.formatter");
        v19 = CFSTR("superscript.squared.with.long.base.formatter");
LABEL_12:
        if (v17)
          v27 = v19;
        else
          v27 = v18;
        v28 = (void *)MEMORY[0x24BDD1458];
        -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
        objc_msgSend(v28, "scrcStringWithFormat:", v29, v9, v33);
        v31 = objc_claimAutoreleasedReturnValue();

        v20 = 0;
        v9 = (id)v31;
        goto LABEL_21;
      }
      -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "integerValue");

      if (v26 == 3)
      {
        v17 = objc_msgSend(v9, "scrcContainsPause");
        v18 = CFSTR("superscript.cubed.formatter");
        v19 = CFSTR("superscript.cubed.with.long.base.formatter");
        goto LABEL_12;
      }
    }
    if (objc_msgSend(v9, "scrcContainsPause"))
      v30 = CFSTR("raised.to.power.with.long.base.formatter");
    else
      v30 = CFSTR("raised.to.power.formatter");
    v28 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v8;
    goto LABEL_20;
  }
  v21 = objc_msgSend(v12, "isNaturalSuperscript");

  if (v21)
  {
    v20 = v8;
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("generic.superscript.formatter"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scrcStringWithFormat:", v23, v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "scrcStringByAddingAttribute:value:", CFSTR("kSCRCMathStringAttributeSpeakWithPitchInflection"), &unk_24CB305E8);
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_21:
  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return v20;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t i;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v38;
  void *v39;
  SCRCMathSubSuperscriptExpression *v40;
  _BOOL4 v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v7 = -[SCRCMathSubSuperscriptExpression isRangeSubSuperscript](self, "isRangeSubSuperscript");
  v8 = v7 | -[SCRCMathSubSuperscriptExpression isBaseSubSuperscript](self, "isBaseSubSuperscript");
  v41 = v4;
  v9 = v4 & (v8 ^ 1u);
  -[SCRCMathSubSuperscriptExpression base](self, "base");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "length"))
  {
    -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", CFSTR("empty.content"));
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  -[SCRCMathSubSuperscriptExpression subscript](self, "subscript");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
      v17 = CFSTR("range.sub.superscript.formatter");
    else
      v17 = CFSTR("base.sub.superscript.formatter");
    v18 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scrcStringWithFormat:", v19, v11, v14, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38 = v16;
    v39 = v14;
    -[SCRCMathExpression localizedSegmentOrderingForKey:](self, "localizedSegmentOrderingForKey:", CFSTR("SubSuperscript"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v22)
    {
      v23 = v22;
      v40 = self;
      v20 = 0;
      v24 = *(_QWORD *)v44;
      v25 = 1;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v44 != v24)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (objc_msgSend(v27, "isEqualToString:", CFSTR("base")))
          {
            v28 = v11;
          }
          else if (objc_msgSend(v27, "isEqualToString:", CFSTR("subscript")))
          {
            if (objc_msgSend(v39, "length"))
            {
              v29 = (void *)MEMORY[0x24BDD1458];
              -[SCRCMathExpression localizedStringForKey:](v40, "localizedStringForKey:", CFSTR("generic.subscript.formatter"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "scrcStringWithFormat:", v30, v39);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v31, "scrcStringByAddingAttribute:value:", CFSTR("kSCRCMathStringAttributeSpeakWithPitchInflection"), &unk_24CB30600);
              v28 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v28 = 0;
            }
          }
          else if (objc_msgSend(v27, "isEqualToString:", CFSTR("superscript")))
          {
            v42 = v20;
            -[SCRCMathSubSuperscriptExpression _stringToAddForSuperscript:withPriorDescription:updatedDescription:](v40, "_stringToAddForSuperscript:withPriorDescription:updatedDescription:", v38, v20, &v42);
            v28 = (id)objc_claimAutoreleasedReturnValue();
            v32 = v42;

            v20 = v32;
          }
          else
          {
            NSLog(CFSTR("AX: VoiceOver: Math: Unrecognized segment identifier %@ found in segment ordering for sub/superscript."), v27);
            v28 = 0;
          }
          if (objc_msgSend(v28, "length"))
          {
            if ((v25 & 1) != 0)
            {
              v33 = v28;
            }
            else
            {
              if (v41)
                objc_msgSend(MEMORY[0x24BDD1458], "scrcPauseString");
              else
                objc_msgSend(MEMORY[0x24BDD1458], "scrcSpaceString");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "scrcStringByAppendingAttributedString:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v35, "scrcStringByAppendingAttributedString:", v28);
              v33 = (id)objc_claimAutoreleasedReturnValue();
              v20 = v35;
            }

            v25 = 0;
            v20 = v33;
          }

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v23);
    }
    else
    {
      v20 = 0;
    }

    v14 = v39;
    v16 = v38;
  }
  v36 = v20;

  return v36;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  const __CFString *v13;
  const __CFString *v14;
  BOOL v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void **v53;
  int v54;
  void *v55;
  uint64_t v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  id v65;
  void *v66;
  uint64_t v67;
  _BOOL4 v69;
  const __CFString *v70;
  const __CFString *v71;
  int64_t v72;
  SCRCMathSubSuperscriptExpression *v73;
  unint64_t v74;
  id v75;
  void *v76;
  id obj;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  objc_super v93;
  _BYTE v94[128];
  void *v95;
  void *v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  if (!a4)
  {
    v10 = 0;
    goto LABEL_72;
  }
  v9 = a4 - 1;
  if (a4 != 1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SCRCMathSubSuperscriptExpression isRangeSubSuperscript](self, "isRangeSubSuperscript");
    v12 = -[SCRCMathSubSuperscriptExpression isBaseSubSuperscript](self, "isBaseSubSuperscript");
    v13 = CFSTR("SubSuperscript");
    if (v12)
      v13 = CFSTR("BaseSubSuperscript");
    v69 = v11;
    if (v11)
      v14 = CFSTR("RangeSubSuperscript");
    else
      v14 = v13;
    -[SCRCMathExpression localizedSegmentOrderingForKey:](self, "localizedSegmentOrderingForKey:", v14);
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
    if (!v79)
    {
LABEL_71:

      goto LABEL_72;
    }
    v15 = v11 || v12;
    v16 = CFSTR("segment.subscript.prefix");
    v78 = *(_QWORD *)v90;
    v17 = CFSTR("segment.subscript.suffix");
    if (v12)
    {
      v16 = CFSTR("segment.base.subscript.prefix");
      v17 = CFSTR("segment.base.subscript.suffix");
    }
    if (v11)
      v18 = CFSTR("segment.range.subscript.prefix");
    else
      v18 = v16;
    if (v11)
      v17 = CFSTR("segment.range.subscript.suffix");
    v70 = v17;
    v71 = v18;
    v72 = a3;
    v73 = self;
    v74 = v9;
    v75 = v8;
LABEL_19:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v90 != v78)
        objc_enumerationMutation(obj);
      v80 = v19;
      v20 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v19);
      if (objc_msgSend(v20, "isEqualToString:", CFSTR("base"))
        && (-[SCRCMathSubSuperscriptExpression base](self, "base"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v21,
            v21))
      {
        -[SCRCMathSubSuperscriptExpression base](self, "base");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "indexPathByAddingIndex:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:", a3, v9, v23);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v24);
      }
      else
      {
        if (!objc_msgSend(v20, "isEqualToString:", CFSTR("subscript"))
          || (-[SCRCMathSubSuperscriptExpression subscript](self, "subscript"),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              v25,
              !v25))
        {
          if (!objc_msgSend(v20, "isEqualToString:", CFSTR("superscript")))
            goto LABEL_69;
          -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v37)
            goto LABEL_69;
          objc_msgSend(v8, "indexPathByAddingIndex:", 2);
          v38 = objc_claimAutoreleasedReturnValue();
          -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39;
          v76 = (void *)v38;
          if (v69)
          {
            v41 = a3;
            v42 = v9;
            v43 = v38;
            v44 = CFSTR("segment.range.superscript.prefix");
            v45 = CFSTR("segment.range.superscript.suffix");
            goto LABEL_54;
          }
          v46 = objc_msgSend(v39, "isNumber");

          -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v46)
          {
            v49 = objc_msgSend(v47, "isInteger");

            v9 = v74;
            if (!v49)
              goto LABEL_53;
            -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "integerValue");

            if (v51 == 2)
            {
              -[SCRCMathExpression localizedAttributedStringForKey:treePosition:](self, "localizedAttributedStringForKey:treePosition:", CFSTR("segment.superscript.squared"), v76);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = v40;
              v52 = (void *)MEMORY[0x24BDBCE30];
              v53 = &v96;
              goto LABEL_52;
            }
            -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "integerValue");

            if (v60 == 3)
            {
              -[SCRCMathExpression localizedAttributedStringForKey:treePosition:](self, "localizedAttributedStringForKey:treePosition:", CFSTR("segment.superscript.cubed"), v76);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = v40;
              v52 = (void *)MEMORY[0x24BDBCE30];
              v53 = &v95;
LABEL_52:
              objc_msgSend(v52, "arrayWithObjects:count:", v53, 1);
              v56 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
LABEL_53:
              -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v39;
              v41 = a3;
              v42 = v74;
              v43 = (uint64_t)v76;
              v44 = CFSTR("segment.raised.to.power.prefix");
              v45 = CFSTR("segment.raised.to.power.suffix");
LABEL_54:
              objc_msgSend(v39, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:localizablePrefix:localizableSuffix:", v41, v42, v43, v44, v45);
              v56 = objc_claimAutoreleasedReturnValue();
            }
LABEL_55:
            v57 = (void *)v56;
            v58 = 0;
          }
          else
          {
            v54 = objc_msgSend(v47, "isNaturalSuperscript");

            -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v55;
            if (v54)
            {
              v9 = v74;
              objc_msgSend(v55, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:", a3, v74, v76);
              v56 = objc_claimAutoreleasedReturnValue();
              goto LABEL_55;
            }
            v9 = v74;
            objc_msgSend(v55, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:localizablePrefix:localizableSuffix:", a3, v74, v76, CFSTR("segment.superscript.prefix"), CFSTR("segment.superscript.suffix"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = 1;
          }

          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v24 = v57;
          v61 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
          if (v61)
          {
            v62 = v61;
            v63 = *(_QWORD *)v82;
            do
            {
              for (i = 0; i != v62; ++i)
              {
                if (*(_QWORD *)v82 != v63)
                  objc_enumerationMutation(v24);
                v65 = *(id *)(*((_QWORD *)&v81 + 1) + 8 * i);
                v66 = v65;
                if (v58)
                {
                  objc_msgSend(v65, "scrcStringByAddingAttribute:value:", CFSTR("kSCRCMathStringAttributeSpeakWithPitchInflection"), &unk_24CB305E8);
                  v67 = objc_claimAutoreleasedReturnValue();

                  v66 = (void *)v67;
                }
                objc_msgSend(v10, "addObject:", v66);

              }
              v62 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
            }
            while (v62);
            v23 = v24;
            v9 = v74;
            v8 = v75;
            a3 = v72;
            self = v73;
          }
          else
          {
            v23 = v24;
            self = v73;
          }
          v22 = v76;
          goto LABEL_68;
        }
        objc_msgSend(v8, "indexPathByAddingIndex:", 1);
        v26 = objc_claimAutoreleasedReturnValue();
        -[SCRCMathSubSuperscriptExpression subscript](self, "subscript");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)v26;
        objc_msgSend(v27, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:localizablePrefix:localizableSuffix:", a3, v9, v26, v71, v70);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v24 = v29;
        v30 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v86;
          do
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v86 != v32)
                objc_enumerationMutation(v24);
              v34 = *(id *)(*((_QWORD *)&v85 + 1) + 8 * j);
              v35 = v34;
              if (!v15)
              {
                objc_msgSend(v34, "scrcStringByAddingAttribute:value:", CFSTR("kSCRCMathStringAttributeSpeakWithPitchInflection"), &unk_24CB30600);
                v36 = objc_claimAutoreleasedReturnValue();

                v35 = (void *)v36;
              }
              objc_msgSend(v10, "addObject:", v35);

            }
            v31 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
          }
          while (v31);
          v23 = v24;
          a3 = v72;
          self = v73;
          v9 = v74;
        }
        else
        {
          v23 = v24;
        }
        v22 = v28;
        v8 = v75;
      }
LABEL_68:

LABEL_69:
      v19 = v80 + 1;
      if (v80 + 1 == v79)
      {
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
        if (!v79)
          goto LABEL_71;
        goto LABEL_19;
      }
    }
  }
  v93.receiver = self;
  v93.super_class = (Class)SCRCMathSubSuperscriptExpression;
  -[SCRCMathExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:](&v93, sel_speakableSegmentsWithSpeakingStyle_upToDepth_treePosition_, a3, 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_72:

  return v10;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1688], "scrcString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathSubSuperscriptExpression base](self, "base");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SCRCMathSubSuperscriptExpression base](self, "base");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathByAddingIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v11);

  }
  -[SCRCMathSubSuperscriptExpression subscript](self, "subscript");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "indexPathByAddingIndex:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("bs"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v14);

    -[SCRCMathSubSuperscriptExpression subscript](self, "subscript");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a3, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v16);

    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("be"), v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v17);

  }
  -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v6, "indexPathByAddingIndex:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("ps"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v20);

    -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a3, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v22);

    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("pe"), v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v23);

  }
  return v7;
}

- (id)mathMLString
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;

  -[SCRCMathSubSuperscriptExpression subscript](self, "subscript");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[SCRCMathSubSuperscriptExpression superscript](self, "superscript"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[SCRCMathSubSuperscriptExpression base](self, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mathMLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathSubSuperscriptExpression subscript](self, "subscript");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mathMLString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mathMLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@%@"), v8, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWrappedInMathMLTag:", CFSTR("msubsup"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SCRCMathSubSuperscriptExpression subscript](self, "subscript");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      -[SCRCMathSubSuperscriptExpression base](self, "base");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mathMLString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathSubSuperscriptExpression subscript](self, "subscript");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mathMLString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@"), v8, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
      v18 = CFSTR("msub");
    }
    else
    {
      -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v14 = &stru_24CB26880;
        return v14;
      }
      v20 = (void *)MEMORY[0x24BDD17C8];
      -[SCRCMathSubSuperscriptExpression base](self, "base");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mathMLString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathSubSuperscriptExpression superscript](self, "superscript");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mathMLString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@"), v8, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
      v18 = CFSTR("msup");
    }
    objc_msgSend(v17, "stringWrappedInMathMLTag:", v18);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)latexMathModeDescription
{
  void *v3;
  void *v4;
  SCRCMathExpression *subscript;
  void *v6;
  SCRCMathExpression *superscript;
  void *v8;

  -[SCRCMathExpression latexDescriptionInMathMode:](self->_base, "latexDescriptionInMathMode:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  subscript = self->_subscript;
  if (subscript)
  {
    -[SCRCMathExpression latexDescriptionInMathMode:](subscript, "latexDescriptionInMathMode:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("_{%@}"), v6);

  }
  superscript = self->_superscript;
  if (superscript)
  {
    -[SCRCMathExpression latexDescriptionInMathMode:](superscript, "latexDescriptionInMathMode:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("^{%@}"), v8);

  }
  return v4;
}

- (SCRCMathExpression)subscript
{
  return self->_subscript;
}

- (void)setSubscript:(id)a3
{
  objc_storeStrong((id *)&self->_subscript, a3);
}

- (SCRCMathExpression)superscript
{
  return self->_superscript;
}

- (void)setSuperscript:(id)a3
{
  objc_storeStrong((id *)&self->_superscript, a3);
}

- (SCRCMathExpression)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_storeStrong((id *)&self->_base, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superscript, 0);
  objc_storeStrong((id *)&self->_subscript, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
