@implementation TYParsedLatexData

- (void)_convertFormula
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  TYParsedLatexData *v32;
  void *v33;
  id obj;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v32 = self;
  -[TYParsedLatexData string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v33 = v3;
  objc_msgSend(v3, "getBoundingBoxWithLatex:error:", v4, &v48);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v48;

  v36 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  +[TypistLatexSymbolTranslation latexSymbolMap](TypistLatexSymbolTranslation, "latexSymbolMap");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v5;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v37)
  {
    v35 = *(_QWORD *)v45;
    v7 = 0.0;
    v8 = -3.40282347e38;
    v9 = 3.40282347e38;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v45 != v35)
          objc_enumerationMutation(obj);
        v38 = v10;
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
        v12 = (void *)objc_opt_new();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v11, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v41 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_msgSend(v11, "objectForKey:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "CGRectValue");
              v22 = v20 + v21;
              v25 = v23 + v24;
              if (v22 >= v20)
                v26 = v20;
              else
                v26 = v22;
              if (v22 >= v20)
                v20 = v22;
              if (v26 < v9)
                v9 = v26;
              if (v20 >= v8)
                v8 = v20;
              if (v25 >= v7)
                v7 = v25;
              objc_msgSend(v39, "objectForKey:", v18);
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = (void *)v27;
              if (v27)
                v29 = (void *)v27;
              else
                v29 = v18;
              v30 = v29;

              objc_msgSend(v6, "appendString:", v30);
              objc_msgSend(v12, "setObject:forKey:", v19, v30);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v15);
        }

        objc_msgSend(v36, "addObject:", v12);
        v10 = v38 + 1;
      }
      while (v38 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v37);
  }
  else
  {
    v7 = 0.0;
    v8 = -3.40282347e38;
    v9 = 3.40282347e38;
  }

  -[TYParsedLatexData setLatexFormulaBoundingBoxes:](v32, "setLatexFormulaBoundingBoxes:", v36);
  -[TYParsedLatexData setConvertedString:](v32, "setConvertedString:", v6);
  -[TYParsedLatexData setBoundingSize:](v32, "setBoundingSize:", v7, v8 - v9);
  -[TYParsedLatexData setOffsetY:](v32, "setOffsetY:", v9);

}

- (TYParsedLatexData)initWithString:(id)a3 isLatex:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  TYParsedLatexData *v7;
  TYParsedLatexData *v8;
  void *v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TYParsedLatexData;
  v7 = -[TYParsedLatexData init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[TYParsedLatexData setString:](v7, "setString:", v6);
    -[TYParsedLatexData setIsLatexString:](v8, "setIsLatexString:", v4);
    if (v4)
    {
      -[TYParsedLatexData _convertFormula](v8, "_convertFormula");
      -[TYParsedLatexData setAnnotatedTextDirections:](v8, "setAnnotatedTextDirections:", 0);
    }
    else
    {
      objc_msgSend(v6, "textDirectionAnnotations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TYParsedLatexData setAnnotatedTextDirections:](v8, "setAnnotatedTextDirections:", v9);

      -[TYParsedLatexData setBoundingSize:](v8, "setBoundingSize:", 0.0, 0.0);
      -[TYParsedLatexData setConvertedString:](v8, "setConvertedString:", 0);
      -[TYParsedLatexData setLatexFormulaBoundingBoxes:](v8, "setLatexFormulaBoundingBoxes:", 0);
    }
  }

  return v8;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (NSString)convertedString
{
  return self->_convertedString;
}

- (void)setConvertedString:(id)a3
{
  objc_storeStrong((id *)&self->_convertedString, a3);
}

- (NSArray)latexFormulaBoundingBoxes
{
  return self->_latexFormulaBoundingBoxes;
}

- (void)setLatexFormulaBoundingBoxes:(id)a3
{
  objc_storeStrong((id *)&self->_latexFormulaBoundingBoxes, a3);
}

- (BOOL)isLatexString
{
  return self->_isLatexString;
}

- (void)setIsLatexString:(BOOL)a3
{
  self->_isLatexString = a3;
}

- (CGSize)boundingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_boundingSize.width;
  height = self->_boundingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBoundingSize:(CGSize)a3
{
  self->_boundingSize = a3;
}

- (double)offsetY
{
  return self->_offsetY;
}

- (void)setOffsetY:(double)a3
{
  self->_offsetY = a3;
}

- (NSArray)annotatedTextDirections
{
  return self->_annotatedTextDirections;
}

- (void)setAnnotatedTextDirections:(id)a3
{
  objc_storeStrong((id *)&self->_annotatedTextDirections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotatedTextDirections, 0);
  objc_storeStrong((id *)&self->_latexFormulaBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_convertedString, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
