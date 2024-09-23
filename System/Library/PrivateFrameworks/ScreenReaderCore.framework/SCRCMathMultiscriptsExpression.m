@implementation SCRCMathMultiscriptsExpression

- (SCRCMathMultiscriptsExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathMultiscriptsExpression *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSArray *postScripts;
  NSArray *v25;
  NSArray *preScripts;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SCRCMathMultiscriptsExpression;
  v5 = -[SCRCMathExpression initWithDictionary:](&v36, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMBaseObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathMultiscriptsExpression setBase:](v5, "setBase:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("AXMMultiscriptPostscripts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMMultiscriptPrescripts"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          -[SCRCMathMultiscriptsExpression _subSuperscriptPairFromDictionary:](v5, "_subSuperscriptPairFromDictionary:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v10, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v14);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = v9;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          -[SCRCMathMultiscriptsExpression _subSuperscriptPairFromDictionary:](v5, "_subSuperscriptPairFromDictionary:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v22), (_QWORD)v28);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v11, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v20);
    }

    postScripts = v5->_postScripts;
    v5->_postScripts = v10;
    v25 = v10;

    preScripts = v5->_preScripts;
    v5->_preScripts = v11;

  }
  return v5;
}

- (id)_subSuperscriptPairFromDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AXMSubscriptObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AXMSuperscriptObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("AXMSubscriptObject"));

    }
  }
  if (v7)
  {
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("AXMSuperscriptObject"));

    }
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
  v9.super_class = (Class)SCRCMathMultiscriptsExpression;
  -[SCRCMathMultiscriptsExpression description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathMultiscriptsExpression base](self, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathMultiscriptsExpression preScripts](self, "preScripts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathMultiscriptsExpression postScripts](self, "postScripts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - base %@, prescripts %@, postscripts %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSUInteger v11;
  NSArray *preScripts;
  id v13;
  id v14;
  NSArray *postScripts;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v4 = a4;
  -[SCRCMathMultiscriptsExpression base](self, "base");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {
    -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", CFSTR("empty.content"));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = v8;
  v11 = -[NSArray count](self->_preScripts, "count");
  if (v11)
  {
    preScripts = self->_preScripts;
    v42 = 0;
    v43 = 0;
    -[SCRCMathMultiscriptsExpression _subSuperScriptsDescriptionFromArray:withSpeakingStyle:arePausesAllowed:outSubscripts:outSuperscripts:](self, "_subSuperScriptsDescriptionFromArray:withSpeakingStyle:arePausesAllowed:outSubscripts:outSuperscripts:", preScripts, a3, v4, &v43, &v42);
    v13 = v43;
    v14 = v42;
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  postScripts = self->_postScripts;
  v40 = 0;
  v41 = 0;
  -[SCRCMathMultiscriptsExpression _subSuperScriptsDescriptionFromArray:withSpeakingStyle:arePausesAllowed:outSubscripts:outSuperscripts:](self, "_subSuperScriptsDescriptionFromArray:withSpeakingStyle:arePausesAllowed:outSubscripts:outSuperscripts:", postScripts, a3, v4, &v41, &v40);
  v16 = v41;
  v17 = v40;
  v39 = v10;
  if (v11)
  {
    if (objc_msgSend(v13, "length"))
    {
      v18 = v10;
      v19 = (void *)MEMORY[0x24BDD1458];
      -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("left.subscript.formatter"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scrcStringWithFormat:", v20, v13, v39);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v13;
      v13 = (id)v21;

      -[SCRCMathMultiscriptsExpression _appendString:toDescription:arePausesAllowed:](self, "_appendString:toDescription:arePausesAllowed:", v13, v18, v4);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v14, "length"))
    {
      v23 = (void *)MEMORY[0x24BDD1458];
      -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("left.superscript.formatter"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "scrcStringWithFormat:", v24, v14);
      v25 = objc_claimAutoreleasedReturnValue();

      -[SCRCMathMultiscriptsExpression _appendString:toDescription:arePausesAllowed:](self, "_appendString:toDescription:arePausesAllowed:", v25, v10, v4);
      v26 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v26;
      v14 = (id)v25;
    }
  }
  if (objc_msgSend(v16, "length"))
  {
    v27 = (void *)MEMORY[0x24BDD1458];
    if (v11)
      v28 = CFSTR("right.subscript.formatter");
    else
      v28 = CFSTR("generic.subscript.formatter");
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scrcStringWithFormat:", v29, v16);
    v30 = objc_claimAutoreleasedReturnValue();

    -[SCRCMathMultiscriptsExpression _appendString:toDescription:arePausesAllowed:](self, "_appendString:toDescription:arePausesAllowed:", v30, v10, v4);
    v31 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v31;
    v16 = (id)v30;
  }
  if (objc_msgSend(v17, "length"))
  {
    v32 = (void *)MEMORY[0x24BDD1458];
    if (v11)
      v33 = CFSTR("right.superscript.formatter");
    else
      v33 = CFSTR("generic.superscript.formatter");
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scrcStringWithFormat:", v34, v17);
    v35 = objc_claimAutoreleasedReturnValue();

    -[SCRCMathMultiscriptsExpression _appendString:toDescription:arePausesAllowed:](self, "_appendString:toDescription:arePausesAllowed:", v35, v10, v4);
    v36 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v36;
    v17 = (id)v35;
  }
  v37 = v10;

  return v37;
}

- (id)_appendString:(id)a3 toDescription:(id)a4 arePausesAllowed:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD1458];
  v9 = a3;
  if (v5)
    objc_msgSend(v8, "scrcPauseString");
  else
    objc_msgSend(v8, "scrcSpaceString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrcStringByAppendingAttributedString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "scrcStringByAppendingAttributedString:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_subSuperScriptsDescriptionFromArray:(id)a3 withSpeakingStyle:(int64_t)a4 arePausesAllowed:(BOOL)a5 outSubscripts:(id *)a6 outSuperscripts:(id *)a7
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id *v27;
  void *v28;
  id obj;
  uint64_t v30;
  _BOOL4 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v32 = a5;
  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v27 = a6;
    objc_msgSend(MEMORY[0x24BDD1458], "scrcString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1458], "scrcString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v28 = v10;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v13)
    {
      v14 = v13;
      v30 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKey:", CFSTR("AXMSubscriptObject"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("AXMSuperscriptObject"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            if (objc_msgSend(v11, "length"))
            {
              objc_msgSend(MEMORY[0x24BDD1458], "scrcSpaceString");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "scrcStringByAppendingAttributedString:", v19);
              v20 = objc_claimAutoreleasedReturnValue();

              v11 = (void *)v20;
            }
            objc_msgSend(v17, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a4, v32);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "scrcStringByAppendingAttributedString:", v21);
            v22 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v22;
          }
          if (v18)
          {
            if (objc_msgSend(v12, "length"))
            {
              objc_msgSend(MEMORY[0x24BDD1458], "scrcSpaceString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "scrcStringByAppendingAttributedString:", v23);
              v24 = objc_claimAutoreleasedReturnValue();

              v12 = (void *)v24;
            }
            objc_msgSend(v18, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a4, v32);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "scrcStringByAppendingAttributedString:", v25);
            v26 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v26;
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v14);
    }

    if (v27)
    {
      *v27 = objc_retainAutorelease(v11);
      *a7 = objc_retainAutorelease(v12);
    }

    v10 = v28;
  }

}

- (SCRCMathExpression)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_storeStrong((id *)&self->_base, a3);
}

- (NSArray)postScripts
{
  return self->_postScripts;
}

- (void)setPostScripts:(id)a3
{
  objc_storeStrong((id *)&self->_postScripts, a3);
}

- (NSArray)preScripts
{
  return self->_preScripts;
}

- (void)setPreScripts:(id)a3
{
  objc_storeStrong((id *)&self->_preScripts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preScripts, 0);
  objc_storeStrong((id *)&self->_postScripts, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
