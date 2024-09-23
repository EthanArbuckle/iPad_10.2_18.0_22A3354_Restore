@implementation SCRO2DBrailleListContent

- (SCRO2DBrailleListContent)initWithBrailleData:(id)a3 canvas:(id)a4 wordWrap:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  SCRO2DBrailleListContent *v11;
  SCRO2DBrailleListContent *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *strings;
  NSArray *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  NSArray *brailleLineLists;
  char v22;
  uint64_t focusedIndex;
  SCRO2DBrailleListContent *v24;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SCRO2DBrailleListContent;
  v11 = -[SCRO2DBrailleListContent init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_itemPreviewMode = 1;
    objc_storeStrong((id *)&v11->_data, a3);
    objc_msgSend(v10, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_width = objc_msgSend(v13, "numberOfCellsInRowAvailable");

    objc_msgSend(v10, "descriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_height = objc_msgSend(v14, "numberOfTextLinesAvailable");

    +[SCRO2DBrailleString brailleStringsFromBrailleData:](SCRO2DBrailleString, "brailleStringsFromBrailleData:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    strings = v12->_strings;
    v12->_strings = (NSArray *)v15;

    v12->_focusedIndex = objc_msgSend(v9, "focusedIndex");
    v17 = (NSArray *)objc_opt_new();
    if (-[NSArray count](v12->_strings, "count"))
    {
      v18 = 0;
      do
      {
        -[NSArray objectAtIndex:](v12->_strings, "objectAtIndex:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "brailleLinesForWidth:indent:focused:wordWrap:", v12->_width - 1, 0, v18 == v12->_focusedIndex, v5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v17, "addObject:", v20);

        ++v18;
      }
      while (v18 < -[NSArray count](v12->_strings, "count"));
    }
    brailleLineLists = v12->_brailleLineLists;
    v12->_brailleLineLists = v17;

    v22 = objc_msgSend(v9, "alignAtTop");
    focusedIndex = v12->_focusedIndex;
    if ((v22 & 1) == 0)
      focusedIndex = focusedIndex - v12->_height + 1;
    v12->_firstDisplayedLine = focusedIndex;
    v24 = v12;
  }

  return v12;
}

- (void)drawOnCanvas:(id)a3
{
  void *v4;
  void *v5;
  int64_t firstDisplayedLine;
  void *v7;
  uint64_t v8;
  int64_t focusedIndex;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  size_t v14;
  _BYTE *v15;
  uint64_t i;
  id v17;

  v17 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImageData:", v4);

  v5 = (void *)objc_opt_new();
  if (self->_height >= 1)
  {
    firstDisplayedLine = self->_firstDisplayedLine;
    do
    {
      if (firstDisplayedLine < 0
        || firstDisplayedLine >= -[NSArray count](self->_strings, "count")
        || (-[NSArray objectAtIndex:](self->_brailleLineLists, "objectAtIndex:", firstDisplayedLine),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "count"),
            v7,
            !v8))
      {
        objc_msgSend(&stru_24CC1DB88, "stringByPaddingToLength:withString:startingAtIndex:", self->_width, CFSTR("⠀"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        focusedIndex = self->_focusedIndex;
        -[NSArray objectAtIndex:](self->_brailleLineLists, "objectAtIndex:", firstDisplayedLine);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (firstDisplayedLine == focusedIndex)
          v12 = CFSTR("⣿");
        else
          v12 = CFSTR("⠀");
        -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v5, "appendString:", v13);

      ++firstDisplayedLine;
    }
    while (firstDisplayedLine < self->_height + self->_firstDisplayedLine);
  }
  v14 = objc_msgSend(v5, "length");
  v15 = malloc_type_malloc(v14, 0x100004077774924uLL);
  if (v14)
  {
    for (i = 0; i != v14; ++i)
      v15[i] = objc_msgSend(v5, "characterAtIndex:", i);
  }
  objc_msgSend(v17, "setBrailleText:length:", v15, v14);
  free(v15);

}

- (BOOL)canPanLeft
{
  return 0;
}

- (BOOL)canPanRight
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brailleLineLists, 0);
  objc_storeStrong((id *)&self->_strings, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
