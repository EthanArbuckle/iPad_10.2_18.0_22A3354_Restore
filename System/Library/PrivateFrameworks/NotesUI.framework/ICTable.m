@implementation ICTable

void __98__ICTable_UI__enumerateTextStoragesForColumnIndexes_rowIndexes_undoTarget_undoManager_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v13[4];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__ICTable_UI__enumerateTextStoragesForColumnIndexes_rowIndexes_undoTarget_undoManager_usingBlock___block_invoke_2;
  v6[3] = &unk_1E5C1D8D8;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 72);
  v6[4] = v4;
  v12 = a2;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v11 = v13;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v6);

  _Block_object_dispose(v13, 8);
}

void __98__ICTable_UI__enumerateTextStoragesForColumnIndexes_rowIndexes_undoTarget_undoManager_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v4;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorageForCellAtColumnIndex:rowIndex:undoTarget:undoManager:", *(_QWORD *)(a1 + 80), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v6 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v7 == a4)
  {
    v8 = CFSTR("\t");
  }
  else
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
    v8 = CFSTR("\n");
  }
  objc_msgSend(*(id *)(a1 + 32), "ic_appendString:", v8);
LABEL_6:
  objc_msgSend(v6, "attributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      if (*(_QWORD *)(a1 + 40))
      {
        v11 = *MEMORY[0x1E0DC10F8];
        v12 = objc_msgSend(v10, "length");
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke_2;
        v22[3] = &unk_1E5C1D928;
        v23 = *(id *)(a1 + 40);
        v24 = *(id *)(a1 + 48);
        v25 = v10;
        objc_msgSend(v25, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v22);

      }
      else
      {
        v13 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v10);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a4;

  return 0;
}

void __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
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
  id v18;

  v18 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v18;
    objc_opt_class();
    objc_msgSend(v7, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    ICCheckedDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0D63B40];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typeUTI");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "altText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tokenContentIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v10, "newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:", v12, v13, v14, v15, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    objc_msgSend(v16, "updateChangeCountWithReason:", CFSTR("Cloned inline attachment"));
    +[ICInlineTextAttachment textAttachmentWithAttachment:](ICInlineTextAttachment, "textAttachmentWithAttachment:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E0DC10F8], v17, a3, a4);

  }
}

void __101__ICTable_NSTextTableAdditions__attributedStringWithNSTextTablesForColumns_rows_context_forPrinting___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  if (objc_msgSend(*(id *)(a1 + 32), "isRightToLeft"))
    v4 = 2;
  else
    v4 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101__ICTable_NSTextTableAdditions__attributedStringWithNSTextTablesForColumns_rows_context_forPrinting___block_invoke_2;
  v6[3] = &unk_1E5C23948;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v10 = a2;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v11 = *(_BYTE *)(a1 + 72);
  objc_msgSend(v5, "enumerateIndexesWithOptions:usingBlock:", v4, v6);

}

void __101__ICTable_NSTextTableAdditions__attributedStringWithNSTextTablesForColumns_rows_context_forPrinting___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "identifierForColumnAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifierForRowAtIndex:", *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeableStringForColumnID:rowID:", v5, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "attributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:formatter:", *(_QWORD *)(a1 + 40), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E5C2F8C0);
  v9 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "p_attributedStringForCell:inTable:atColumn:row:shouldFilter:context:", v8, *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 64), *(_BYTE *)(a1 + 72) == 0, *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendAttributedString:", v10);

}

void __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "Trying deep-copy an inline attachment from table without providing a parent note.", a5, a6, a7, a8, 0);
}

@end
