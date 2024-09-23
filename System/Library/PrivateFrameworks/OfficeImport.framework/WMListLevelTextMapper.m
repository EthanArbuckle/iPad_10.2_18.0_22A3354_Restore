@implementation WMListLevelTextMapper

- (WMListLevelTextMapper)initWithText:(id)a3
{
  return -[WMListLevelTextMapper initWithText:levelDescriptions:language:](self, "initWithText:levelDescriptions:language:", a3, 0, 1033);
}

- (WMListLevelTextMapper)initWithText:(id)a3 levelDescriptions:(id)a4 language:(int)a5
{
  id v8;
  id v9;
  WMListLevelTextMapper *v10;
  uint64_t v11;
  NSMutableArray *tokens;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  void *v32;
  NSMutableArray *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  objc_super v38;

  v8 = a3;
  v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)WMListLevelTextMapper;
  v10 = -[WMListLevelTextMapper init](&v38, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v35 = a5;
    tokens = v10->_tokens;
    v10->_tokens = (NSMutableArray *)v11;

    v37 = v9;
    v13 = objc_msgSend(v8, "length");
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = objc_msgSend(v8, "rangeOfString:options:range:", CFSTR("%"), 2, v14, v13 - v14);
      if (!v17)
        break;
      v18 = v16;
      v14 = v13;
      if (v16 != v13 - 1)
      {
        v14 = v16 + 1;
        v19 = objc_msgSend(v8, "characterAtIndex:", v16 + 1);
        if (v18 > v15)
        {
          objc_msgSend(v8, "substringWithRange:", v15, v18 - v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v10->_tokens;
          +[WMListLevelTextToken tokenWithString:level:formatter:](WMListLevelTextToken, "tokenWithString:level:formatter:", v20, 0, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v21, "addObject:", v22);

        }
        v23 = (unsigned __int16)(v19 - 58);
        if (v23 >= 0xFFF7)
          v24 = v18;
        else
          v24 = v18 + 1;
        if (v23 < 0xFFF7)
          v25 = 1;
        else
          v25 = 2;
        objc_msgSend(v8, "substringWithRange:", v24, v25);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (v19 - 48);
        if (objc_msgSend(v37, "count") >= (unint64_t)(int)v26)
        {
          v34 = v10->_tokens;
          objc_msgSend(v37, "objectAtIndexedSubscript:", v19 - 49);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[CMNumberFormatter formatterForNumberFormat:language:](CMNumberFormatter, "formatterForNumberFormat:language:", objc_msgSend(v27, "numberFormat"), v35);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[WMListLevelTextToken tokenWithString:level:formatter:](WMListLevelTextToken, "tokenWithString:level:formatter:", v36, v26, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v34, "addObject:", v29);

        }
        else
        {
          NSLog((NSString *)CFSTR("Ignoring list level: too many tokens in the format given the number of level descriptions"));
        }
        v15 = v18 + 2;

        v9 = v37;
      }
    }
    if (v13 > v15)
    {
      objc_msgSend(v8, "substringWithRange:", v15, v13 - v15);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v10->_tokens;
      +[WMListLevelTextToken tokenWithString:level:formatter:](WMListLevelTextToken, "tokenWithString:level:formatter:", v30, 0, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v31, "addObject:", v32);

    }
  }

  return v10;
}

- (id)listLevelTextForOutline:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  void *v15;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7 = -[NSMutableArray count](self->_tokens, "count");
  if (v7)
  {
    v8 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_tokens, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
        v12 = v10 == 0;
      else
        v12 = 1;
      if (!v12 && objc_msgSend(v10, "length"))
      {
        v13 = v11;
        if ((int)objc_msgSend(v9, "level") >= 1
          && objc_msgSend(v13, "characterAtIndex:", 0) == 37
          && (unint64_t)objc_msgSend(v13, "length") >= 2)
        {
          if (objc_msgSend(v13, "length") != 2)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WMListLevelTextMapper.mm"), 137, CFSTR("Invalid placeholder length"));

          }
          objc_msgSend(v9, "stringForIndex:", objc_msgSend(v5, "counterAtLevel:", (objc_msgSend(v9, "level") - 1)));
          v14 = objc_claimAutoreleasedReturnValue();

          v13 = (id)v14;
        }
        objc_msgSend(v6, "appendString:", v13);

      }
      ++v8;
    }
    while (v7 != v8);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
}

- (unint64_t)tokenCount
{
  return -[NSMutableArray count](self->_tokens, "count");
}

- (id)token:(unsigned int)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_tokens, "count") <= (unint64_t)a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_tokens, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
