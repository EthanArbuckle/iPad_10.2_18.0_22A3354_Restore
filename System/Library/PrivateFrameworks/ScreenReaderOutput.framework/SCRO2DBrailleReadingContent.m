@implementation SCRO2DBrailleReadingContent

- (SCRO2DBrailleReadingContent)initWithBrailleData:(id)a3 canvas:(id)a4 wordWrap:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  SCRO2DBrailleReadingContent *v11;
  SCRO2DBrailleReadingContent *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *strings;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t focusedIndex;
  void *v26;
  uint64_t v27;
  SCRO2DBrailleReadingContent *v28;
  id v30;
  uint64_t v31;
  objc_super v32;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SCRO2DBrailleReadingContent;
  v11 = -[SCRO2DBrailleReadingContent init](&v32, sel_init);
  v12 = v11;
  if (v11)
  {
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
    v17 = (void *)objc_opt_new();
    v18 = (void *)objc_opt_new();
    v30 = v10;
    if (-[NSArray count](v12->_strings, "count"))
    {
      v19 = 0;
      v20 = 0;
      v31 = 0;
      do
      {
        -[NSArray objectAtIndex:](v12->_strings, "objectAtIndex:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "brailleLinesForWidth:indent:focused:wordWrap:", v12->_width, 2, v19 == v12->_focusedIndex, v5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObjectsFromArray:", v22);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v23);

        v24 = objc_msgSend(v22, "count");
        if (v19 == v12->_focusedIndex)
          v31 = objc_msgSend(v22, "count");
        v20 += v24;

        ++v19;
      }
      while (v19 < -[NSArray count](v12->_strings, "count"));
    }
    else
    {
      v31 = 0;
    }
    objc_storeStrong((id *)&v12->_brailleLines, v17);
    objc_storeStrong((id *)&v12->_beginLines, v18);
    focusedIndex = v12->_focusedIndex;
    if (focusedIndex >= 0x7FFFFFFFFFFFFFFFLL)
    {
      v27 = 0;
      v10 = v30;
    }
    else
    {
      v10 = v30;
      if (focusedIndex >= -[NSArray count](v12->_beginLines, "count"))
      {
        v27 = 0;
      }
      else
      {
        -[NSArray objectAtIndex:](v12->_beginLines, "objectAtIndex:", v12->_focusedIndex);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "unsignedIntegerValue");

      }
    }
    if ((objc_msgSend(v9, "alignAtTop") & 1) == 0)
      v27 = v27 + v31 - v12->_height;
    v12->_firstDisplayedLine = v27;
    v28 = v12;

  }
  return v12;
}

- (void)drawOnCanvas:(id)a3
{
  void *v5;
  void *v6;
  int64_t firstDisplayedLine;
  void *v8;
  size_t v9;
  _BYTE *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImageData:", v5);

  v6 = (void *)objc_opt_new();
  if (self->_height >= 1)
  {
    firstDisplayedLine = self->_firstDisplayedLine;
    do
    {
      if (firstDisplayedLine < 0 || firstDisplayedLine >= -[NSArray count](self->_brailleLines, "count"))
      {
        objc_msgSend(&stru_24CC1DB88, "stringByPaddingToLength:withString:startingAtIndex:", self->_width, CFSTR("⠀"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[NSArray objectAtIndex:](self->_brailleLines, "objectAtIndex:", firstDisplayedLine);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "length") != self->_width)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_width);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCRO2DBrailleReadingContent.m"), 104, CFSTR("Each element of _brailleLine (%@, length %@) must be of length _width (%@)"), v8, v13, v12);

        }
      }
      objc_msgSend(v6, "appendString:", v8);

      ++firstDisplayedLine;
    }
    while (firstDisplayedLine < self->_height + self->_firstDisplayedLine);
  }
  v9 = objc_msgSend(v6, "length");
  v10 = malloc_type_malloc(v9, 0x100004077774924uLL);
  if (v9)
  {
    for (i = 0; i != v9; ++i)
      v10[i] = objc_msgSend(v6, "characterAtIndex:", i);
  }
  objc_msgSend(v15, "setBrailleText:length:", v10, v9);
  free(v10);

}

- (BOOL)canPanLeft
{
  return self->_firstDisplayedLine > 0;
}

- (void)panLeft
{
  if (-[SCRO2DBrailleReadingContent canPanLeft](self, "canPanLeft"))
    self->_firstDisplayedLine -= self->_height;
}

- (BOOL)canPanRight
{
  unint64_t v2;

  v2 = self->_height + self->_firstDisplayedLine;
  return v2 < -[NSArray count](self->_brailleLines, "count");
}

- (void)panRight
{
  if (-[SCRO2DBrailleReadingContent canPanRight](self, "canPanRight"))
    self->_firstDisplayedLine += self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginLines, 0);
  objc_storeStrong((id *)&self->_brailleLines, 0);
  objc_storeStrong((id *)&self->_strings, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
