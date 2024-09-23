@implementation ICTable(NSTextTableAdditions)

- (uint64_t)attributedStringWithNSTextTablesForColumns:()NSTextTableAdditions rows:context:
{
  return objc_msgSend(a1, "attributedStringWithNSTextTablesForColumns:rows:context:forPrinting:", a3, a4, a5, 0);
}

- (id)attributedStringWithNSTextTablesForColumns:()NSTextTableAdditions rows:context:forPrinting:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v14 = objc_alloc_init(MEMORY[0x1E0DC1330]);
  if (v10)
    v15 = objc_msgSend(v10, "count");
  else
    v15 = objc_msgSend(a1, "columnCount");
  objc_msgSend(v14, "setNumberOfColumns:", v15);
  objc_msgSend(v14, "setCollapsesBorders:", 1);
  if (v10)
    v16 = v10;
  else
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(a1, "columnCount"));
  v17 = v16;
  if (v11)
    v18 = v11;
  else
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(a1, "rowCount"));
  v19 = v18;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __101__ICTable_NSTextTableAdditions__attributedStringWithNSTextTablesForColumns_rows_context_forPrinting___block_invoke;
  v29 = &unk_1E5C23970;
  v30 = a1;
  v31 = v17;
  v32 = v12;
  v33 = v13;
  v34 = v14;
  v35 = a6;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  v23 = v17;
  objc_msgSend(v19, "enumerateIndexesUsingBlock:", &v26);
  v24 = (void *)objc_msgSend(v21, "copy", v26, v27, v28, v29, v30);

  return v24;
}

- (id)p_attributedStringForCell:()NSTextTableAdditions inTable:atColumn:row:shouldFilter:context:
{
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  ICTextController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v13 = a8;
  v14 = (objc_class *)MEMORY[0x1E0DC1338];
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend([v14 alloc], "initWithTable:startingRow:rowSpan:startingColumn:columnSpan:", v15, a6, 1, a5, 1);

  objc_msgSend(v17, "setWidth:type:forLayer:", 0, 0, 1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBorderColor:", v18);

  objc_msgSend(v17, "setWidth:type:forLayer:edge:", 0, -1, 0, 5.0);
  objc_msgSend(v17, "setWidth:type:forLayer:edge:", 0, -1, 2, 5.0);
  objc_msgSend(v17, "setWidth:type:forLayer:edge:", 0, -1, 1, 1.0);
  objc_msgSend(v17, "setWidth:type:forLayer:edge:", 0, -1, 3, 1.0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\r"));
  v20 = objc_alloc_init(ICTextController);
  -[ICTTTextController setDisableSingleLineA:](v20, "setDisableSingleLineA:", 1);
  -[ICTTTextController setKeepNSTextTableAttributes:](v20, "setKeepNSTextTableAttributes:", 1);
  if (a7)
  {
    +[ICTTTextStorage standardizedAttributedStringFromAttributedString:withStyler:fixAttachments:translateICTTFont:context:](ICTTTextStorage, "standardizedAttributedStringFromAttributedString:withStyler:fixAttachments:translateICTTFont:context:", v16, v20, 1, 1, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(v21, "mutableCopy");
  }
  else
  {
    v22 = (void *)objc_msgSend(v16, "mutableCopy");

    -[ICTTTextController styleFontInAttributedString:inRange:contentSizeCategory:](v20, "styleFontInAttributedString:inRange:contentSizeCategory:", v22, 0, objc_msgSend(v22, "length"), 0);
  }
  if ((unint64_t)objc_msgSend(v22, "length") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "characterIsMember:", objc_msgSend(v24, "characterAtIndex:", 0));

    if (v25)
      objc_msgSend(v22, "insertAttributedString:atIndex:", v19, 0);
  }
  objc_msgSend(v22, "appendAttributedString:", v19);
  v29[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ic_addTextBlocks:range:", v26, 0, objc_msgSend(v22, "length"));

  v27 = (void *)objc_msgSend(v22, "copy");
  return v27;
}

@end
