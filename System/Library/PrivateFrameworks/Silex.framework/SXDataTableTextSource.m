@implementation SXDataTableTextSource

- (SXDataTableTextSource)initWithFormattedText:(id)a3 indexPath:(id)a4 smartFieldFactory:(id)a5 dataSource:(id)a6 documentLangaugeProvider:(id)a7 fontAttributesConstructor:(id)a8
{
  unint64_t var0;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  SXDataTableTextSource *v20;
  unint64_t var1;
  objc_super v23;

  var1 = a4.var1;
  var0 = a4.var0;
  v14 = a3;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  objc_msgSend(v14, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)SXDataTableTextSource;
  v20 = -[SXTextSource initWithString:smartFieldFactory:dataSource:documentLanguageProvider:fontAttributesConstructor:](&v23, sel_initWithString_smartFieldFactory_dataSource_documentLanguageProvider_fontAttributesConstructor_, v19, v18, v17, v16, v15);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_formattedText, a3);
    v20->_indexPath.rowIndex = var0;
    v20->_indexPath.columnIndex = var1;
  }

  return v20;
}

- (void)applyStylingOnTextTangierStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXDataTableTextSource;
  -[SXTextSource applyStylingOnTextTangierStorage:](&v10, sel_applyStylingOnTextTangierStorage_, v4);
  -[SXTextSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentTextStyleForTextSource:inheritingFromDefaultStyles:", self, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SXDataTableTextSource defaultTextAlignment](self, "defaultTextAlignment") && !objc_msgSend(v6, "textAlignment"))
  {
    v7 = -[SXDataTableTextSource defaultTextAlignment](self, "defaultTextAlignment");
    if (v7 == 3)
      v8 = 1;
    else
      v8 = 2 * (v7 == 2);
    objc_msgSend(v4, "paragraphStyleAtParIndex:effectiveRange:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIntValue:forProperty:", v8, 86);

  }
}

- (SXFormattedText)formattedText
{
  return self->_formattedText;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPath
{
  $0B682AF404CBA3A98798DEF43C12D12A *p_indexPath;
  unint64_t rowIndex;
  unint64_t columnIndex;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  p_indexPath = &self->_indexPath;
  rowIndex = self->_indexPath.rowIndex;
  columnIndex = p_indexPath->columnIndex;
  result.var1 = columnIndex;
  result.var0 = rowIndex;
  return result;
}

- (unint64_t)defaultTextAlignment
{
  return self->_defaultTextAlignment;
}

- (void)setDefaultTextAlignment:(unint64_t)a3
{
  self->_defaultTextAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedText, 0);
}

@end
