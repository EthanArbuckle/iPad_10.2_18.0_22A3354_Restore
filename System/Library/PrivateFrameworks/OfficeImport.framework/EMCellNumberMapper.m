@implementation EMCellNumberMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  _BOOL4 v5;
  EDStyle *edStyle;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v5 = -[EDStyle isContentFormatApplied](self->edStyle, "isContentFormatApplied");
  edStyle = self->edStyle;
  if (v5)
  {
    v7 = -[EDStyle contentFormatId](edStyle, "contentFormatId");
    if (!v7)
    {
LABEL_15:
      v16 = 0;
      -[EMCellNumberMapper formatValueAsNumber](self, "formatValueAsNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      if (v15)
        goto LABEL_16;
LABEL_14:
      v17 = 0;
      v11 = v16;
      goto LABEL_21;
    }
  }
  else
  {
    -[EDStyle parent](edStyle, "parent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "contentFormatId");

    if (!v7)
      goto LABEL_15;
  }
  -[EDStyle contentFormat](self->edStyle, "contentFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formatString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "string");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (v7 != 30)
      goto LABEL_15;
    v11 = CFSTR("GenericDate");
  }
  +[EMNumberFormatter formatterForFormat:](EMNumberFormatter, "formatterForFormat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v17 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v12, "isNegativeRed"))
  {
    -[EMCellNumberMapper insertRedSpanIfNegativeAt:](self, "insertRedSpanIfNegativeAt:", v20);
    v14 = objc_claimAutoreleasedReturnValue();

    v20 = (id)v14;
  }
  if (objc_msgSend(v13, "formatType") != 1)
  {
    objc_msgSend(v13, "formatValue:inWorkbook:", self->workbook, self->edValue);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_17;
  }
  -[EMCellNumberMapper formatValueAsNumber](self, "formatValueAsNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  if (!v15)
    goto LABEL_14;
LABEL_16:
  v11 = v16;
LABEL_17:
  v18 = v15;
  if (objc_msgSend(v15, "length"))
  {
    +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addChild:", v19);

  }
  v17 = v18;
LABEL_21:

}

- (id)insertRedSpanIfNegativeAt:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (self->edValue >= 0.0)
  {
    v6 = v4;
  }
  else
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addChild:", v6);
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3C9458, v6, CFSTR("color:red"));

  }
  return v6;
}

- (id)formatValueAsNumber
{
  void *v3;
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v10;

  +[EMNumberFormatter formatterForFormat:](EMNumberFormatter, "formatterForFormat:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatDefault:", self->edValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "optimalNumberOfDigitsForValue:", self->edValue);
  +[EMCellStyle contentWidthForColumnWidth:](EMCellStyle, "contentWidthForColumnWidth:", self->_columnWidth);
  v7 = v6;
  if ((objc_msgSend(v3, "useBigNumberFormatterForValue:", self->edValue) & 1) != 0
    || round(self->edValue) != self->edValue)
  {
    while (1)
    {
      +[EMCellTextMapper contentWidthForString:style:](EMCellTextMapper, "contentWidthForString:style:", v4, self->edStyle);
      if (v8 <= v7 || v5 < 2)
        break;
      objc_msgSend(v3, "formatDefault:showingNumberOfDigits:", --v5, self->edValue);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
  }

  return v4;
}

- (EMCellNumberMapper)initWithDoubleValue:(double)a3 style:(id)a4 columnWidth:(double)a5 workbook:(id)a6 parent:(id)a7
{
  id v13;
  id v14;
  EMCellNumberMapper *v15;
  EMCellNumberMapper *v16;
  objc_super v18;

  v13 = a4;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EMCellNumberMapper;
  v15 = -[CMMapper initWithParent:](&v18, sel_initWithParent_, a7);
  v16 = v15;
  if (v15)
  {
    v15->edValue = a3;
    objc_storeStrong((id *)&v15->edStyle, a4);
    objc_storeStrong((id *)&v16->workbook, a6);
    v16->_columnWidth = a5;
  }

  return v16;
}

- (double)columnWidth
{
  return self->_columnWidth;
}

- (void)setColumnWidth:(double)a3
{
  self->_columnWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->workbook, 0);
  objc_storeStrong((id *)&self->edStyle, 0);
}

@end
