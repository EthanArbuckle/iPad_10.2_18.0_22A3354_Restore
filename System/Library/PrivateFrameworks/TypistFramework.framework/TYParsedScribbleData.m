@implementation TYParsedScribbleData

- (id)_latexRegularExpression
{
  if (_latexRegularExpression_onceToken != -1)
    dispatch_once(&_latexRegularExpression_onceToken, &__block_literal_global_4);
  return (id)_latexRegularExpression_latexRegularExpression;
}

void __47__TYParsedScribbleData__latexRegularExpression__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?<!\\\\)((?:((?<!\\$)\\${1}(?!\\$)))(.*?)(?<!\\\\)(?:((?<!\\$)\\${1}(?!\\$)))|(?:((?<!\\$)\\${2}(?!\\$)))(.*?)(?<!\\\\)(?:((?<!\\$)\\${2}(?!\\$)))|(?:(\\\\begin\\{equation\\}))(.*?)(?<!\\\\)(?:(\\\\end\\{equation\\})))"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_latexRegularExpression_latexRegularExpression;
  _latexRegularExpression_latexRegularExpression = v0;

}

- (unint64_t)_calculateTotalWidthWithPathMap:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  unint64_t v14;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TYParsedScribbleData parsedData](self, "parsedData");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v9, "isLatexString"))
        {
          objc_msgSend(v9, "boundingSize");
          v6 = (unint64_t)(v10 + (double)v6);
        }
        else
        {
          objc_msgSend(v9, "string");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[TYParsedScribbleData isCursive](self, "isCursive");
          -[TYParsedScribbleData regionCode](self, "regionCode");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = +[TypistPathUtilities getTotalWidthForText:isCursive:withRegion:fromPathMap:](TypistPathUtilities, "getTotalWidthForText:isCursive:withRegion:fromPathMap:", v11, v12, v13, v16);

          objc_msgSend(v9, "setBoundingSize:", (double)v14, 0.0);
          v6 += v14;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (TYParsedScribbleData)initWithText:(id)a3 regionCode:(id)a4 isCursive:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  TYParsedScribbleData *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  TYParsedLatexData *v23;
  void *v24;
  TYParsedLatexData *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  TYParsedLatexData *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  TYParsedLatexData *v33;
  void *v34;
  TYParsedLatexData *v35;
  void *v36;
  TYParsedLatexData *v37;
  void *v38;
  void *v39;
  void *v41;
  _BOOL4 v42;
  TYParsedScribbleData *v43;
  id v44;
  id obj;
  uint64_t v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  uint64_t v55;

  v5 = a5;
  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v53.receiver = self;
  v53.super_class = (Class)TYParsedScribbleData;
  v10 = -[TYParsedScribbleData init](&v53, sel_init);
  if (v10)
  {
    v42 = v5;
    v44 = v9;
    v48 = (void *)objc_opt_new();
    v47 = (void *)objc_opt_new();
    v43 = v10;
    -[TYParsedScribbleData _latexRegularExpression](v10, "_latexRegularExpression");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v46 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v50 != v46)
            objc_enumerationMutation(obj);
          v15 = v8;
          v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "range");
          v19 = v18;
          v20 = 2;
          if (objc_msgSend(v16, "rangeAtIndex:", 2) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend(v16, "rangeAtIndex:", 5) == 0x7FFFFFFFFFFFFFFFLL)
              v20 = 8;
            else
              v20 = 5;
          }
          v21 = objc_msgSend(v16, "rangeAtIndex:", v20);
          v22 = v21 - v13;
          if (v21 > v13)
          {
            v23 = [TYParsedLatexData alloc];
            objc_msgSend(v15, "substringWithRange:", v13, v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[TYParsedLatexData initWithString:isLatex:](v23, "initWithString:isLatex:", v24, 0);

            -[TYParsedLatexData string](v25, "string");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "appendString:", v26);

            objc_msgSend(v48, "addObject:", v25);
          }
          v27 = 9;
          if (v20 == 5)
            v27 = 6;
          if (v20 == 2)
            v28 = 3;
          else
            v28 = v27;
          v29 = [TYParsedLatexData alloc];
          v30 = objc_msgSend(v16, "rangeAtIndex:", v28);
          v8 = v15;
          objc_msgSend(v15, "substringWithRange:", v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[TYParsedLatexData initWithString:isLatex:](v29, "initWithString:isLatex:", v32, 1);

          -[TYParsedLatexData convertedString](v33, "convertedString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "appendString:", v34);

          objc_msgSend(v48, "addObject:", v33);
          v13 = v17 + v19;

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }
    if (v13 < objc_msgSend(v8, "length"))
    {
      v35 = [TYParsedLatexData alloc];
      objc_msgSend(v8, "substringFromIndex:", v13);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[TYParsedLatexData initWithString:isLatex:](v35, "initWithString:isLatex:", v36, 0);

      -[TYParsedLatexData string](v37, "string");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "appendString:", v38);

      objc_msgSend(v48, "addObject:", v37);
    }
    v9 = v44;
    +[TypistPathUtilities getPathDataForCharacters:withRegion:isCursive:](TypistPathUtilities, "getPathDataForCharacters:withRegion:isCursive:", v47, v44, v42);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v43;
    -[TYParsedScribbleData setParsedData:](v43, "setParsedData:", v48);
    -[TYParsedScribbleData setConvertedString:](v43, "setConvertedString:", v47);
    -[TYParsedScribbleData setPathMap:](v43, "setPathMap:", v39);
    -[TYParsedScribbleData setIsCursive:](v43, "setIsCursive:", v42);
    -[TYParsedScribbleData setRegionCode:](v43, "setRegionCode:", v44);
    -[TYParsedScribbleData setTotalWidth:](v43, "setTotalWidth:", -[TYParsedScribbleData _calculateTotalWidthWithPathMap:](v43, "_calculateTotalWidthWithPathMap:", v39));

  }
  return v10;
}

- (NSArray)parsedData
{
  return self->_parsedData;
}

- (void)setParsedData:(id)a3
{
  objc_storeStrong((id *)&self->_parsedData, a3);
}

- (NSDictionary)pathMap
{
  return self->_pathMap;
}

- (void)setPathMap:(id)a3
{
  objc_storeStrong((id *)&self->_pathMap, a3);
}

- (NSString)convertedString
{
  return self->_convertedString;
}

- (void)setConvertedString:(id)a3
{
  objc_storeStrong((id *)&self->_convertedString, a3);
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isCursive
{
  return self->_isCursive;
}

- (void)setIsCursive:(BOOL)a3
{
  self->_isCursive = a3;
}

- (unint64_t)totalWidth
{
  return self->_totalWidth;
}

- (void)setTotalWidth:(unint64_t)a3
{
  self->_totalWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_convertedString, 0);
  objc_storeStrong((id *)&self->_pathMap, 0);
  objc_storeStrong((id *)&self->_parsedData, 0);
}

@end
