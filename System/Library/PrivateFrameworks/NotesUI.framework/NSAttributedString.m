@implementation NSAttributedString

void __74__NSAttributedString_IC_UI__ic_rangeForBaseAttachment_withTextAttachment___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  char isKindOfClass;
  void *v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    v12 = v16;
    objc_msgSend(v12, "attachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", a1[4]);

    if (v14)
    {
      v15 = *(_QWORD *)(a1[5] + 8);
      *(_QWORD *)(v15 + 32) = a3;
      *(_QWORD *)(v15 + 40) = a4;
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
      *a5 = 1;
    }

    v11 = v16;
  }

}

uint64_t __109__NSAttributedString_IC_UI___ic_attributedStringByHighlightingRegexMatches_withHighlightColor_attributeName___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "range");
  return objc_msgSend(v2, "addIndexesInRange:", v3, v4);
}

uint64_t __109__NSAttributedString_IC_UI___ic_attributedStringByHighlightingRegexMatches_withHighlightColor_attributeName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", *(_QWORD *)(a1 + 40), a2, a3);
}

void __55__NSAttributedString_IC_UI__ic_itemProviderDataForUTI___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __99__NSAttributedString_IC_UI__ic_attributedStringByFlatteningInlineAttachmentsWithContext_formatter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "setObject:forKeyedSubscript:", a3, a2);
}

id __99__NSAttributedString_IC_UI__ic_attributedStringByFlatteningInlineAttachmentsWithContext_formatter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "uiModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributedStringWithSurroundingAttributes:formatter:", v5, *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __92__NSAttributedString_IC_UI__ic_attributedStringByFlatteningCalculateAttachmentsWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "setObject:forKeyedSubscript:", a3, a2);
}

id __92__NSAttributedString_IC_UI__ic_attributedStringByFlatteningCalculateAttachmentsWithContext___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isCalculateResultAttachment") & 1) != 0
    || objc_msgSend(v4, "isCalculateGraphExpressionAttachment"))
  {
    objc_msgSend(v4, "displayText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_stringByRemovingLanguageDirectionCharacters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __108__NSAttributedString_IC_UI__ic_attributedStringByCopyingInlineAttachmentsAndUpdatingChangeCountWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v14;
  if (v14)
  {
    v9 = objc_msgSend(MEMORY[0x1E0D63C60], "isInlineAttachment:", v14);
    v8 = v14;
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0D63B40];
      objc_msgSend(v14, "attachmentIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cloneInlineAttachmentWithIdentifier:context:", v11, *(_QWORD *)(a1 + 32));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[ICInlineTextAttachment textAttachmentWithAttachment:](ICInlineTextAttachment, "textAttachmentWithAttachment:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC10F8], v13, a3, a4);
      objc_msgSend(v12, "updateChangeCountWithReason:", CFSTR("Copied inline attachment"));

      v8 = v14;
    }
  }

}

void __64__NSAttributedString_IC_UI__ic_containsBlockAttachmentsInRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  char v8;
  void *v9;

  ICProtocolCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = v7;
    v8 = objc_msgSend(MEMORY[0x1E0D63C60], "isInlineAttachment:", v7);
    v7 = v9;
    if ((v8 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }

}

uint64_t __55__NSAttributedString_IC_UI__ic_containsTextAttachment___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (*(_QWORD *)(result + 32) == a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __73__NSAttributedString_ICTableAdditions__ic_tableSizeForTextTable_inRange___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  NSUInteger v18;
  NSRange *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  NSRange v27;
  NSRange v28;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "textBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    if (a1[4])
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v3, "textBlocks", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v10, "table");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)a1[4];

            if (v11 == v12)
            {
              v7 = v10;
              goto LABEL_14;
            }
          }
          v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v7)
            continue;
          break;
        }
      }
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v3, "textBlocks");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_14:

    if (v7)
    {
      v14 = objc_msgSend(v7, "startingColumn");
      v15 = objc_msgSend(v7, "columnSpan");
      v16 = objc_msgSend(v7, "startingRow");
      v17 = objc_msgSend(v7, "rowSpan");
      v18 = v17;
      v19 = *(NSRange **)(a1[6] + 8);
      if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
      {
        v19[2].location = v14;
        v19[2].length = v15;
        v20 = *(_QWORD *)(a1[7] + 8);
        *(_QWORD *)(v20 + 32) = v16;
        *(_QWORD *)(v20 + 40) = v17;
        *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
      }
      else
      {
        v27.location = v14;
        v27.length = v15;
        *(NSRange *)(*(_QWORD *)(a1[6] + 8) + 32) = NSUnionRange(v19[2], v27);
        v28.location = v16;
        v28.length = v18;
        *(NSRange *)(*(_QWORD *)(a1[7] + 8) + 32) = NSUnionRange(*(NSRange *)(*(_QWORD *)(a1[7] + 8) + 32), v28);
      }
    }

  }
}

void __61__NSAttributedString_ICTableAdditions__ic_textTablesInRange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a2, "textBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "table");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "containsObject:", v8) & 1) == 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

@end
