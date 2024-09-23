@implementation ICNote

uint64_t __49__ICNote_UI__updateThumbnailAttachmentIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "isVisible"))
  {
    objc_msgSend(v2, "attachmentModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "showThumbnailInNoteList");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __66__ICNote_UI__textStorage_willProcessEditing_range_changeInLength___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isEmpty"));
}

uint64_t __65__ICNote_UI__textStorage_didProcessEditing_range_changeInLength___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "filterAttachmentsInTextStorage:range:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_opt_class();
  ICDynamicCast();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "styleTextInRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "didChangeNoteText");
  if (objc_msgSend(*(id *)(a1 + 32), "regenerateTitleAndSnippetIfNecessaryForEdit:range:changeInLength:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72)))objc_msgSend(*(id *)(a1 + 32), "markShareDirtyIfNeededWithReason:", CFSTR("Did process editing for text storage"));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isEmpty"));
}

void __64__ICNote_UI__updatePKDrawingsWithHandwritingRecognitionEnabled___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v3 = (void *)MEMORY[0x1AF445E78]();
  objc_msgSend(v10, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = *(unsigned __int8 *)(a1 + 40);
    v6 = v4;
    objc_msgSend(v6, "setHandwritingRecognitionEnabled:", v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(_BYTE *)(v7 + 24) == 0;
    *(_BYTE *)(v7 + 24) = 1;
    v8 = !v8 || *(_BYTE *)(a1 + 40) == 0;
    v9 = !v8;
    objc_msgSend(v6, "setTitleQueryEnabled:", v9);

  }
  objc_autoreleasePoolPop(v3);

}

void __61__ICNote_UI__checklistStyleAccessibilityDescriptionForRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  char v11;
  void *v12;
  BOOL v13;
  id v14;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    v9 = 1;
  }
  else
  {
    v9 = objc_msgSend(v14, "style") == 103;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v8 + 24) = v9;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v10 + 24))
  {
    v11 = 1;
    v12 = v14;
  }
  else
  {
    v13 = objc_msgSend(v14, "style") == 103;
    v12 = v14;
    v11 = !v13;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v10 + 24) = v11;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *a5 = 1;
  }

}

void __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  int v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;
  NSRange v38;
  NSRange v39;
  NSRange v40;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ic_isSystemTextAttachment");

  if ((v9 & 1) == 0)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "attachmentFromObject:createIfNecessary:", v7, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_opt_class();
    ICDynamicCast();
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_opt_class();
      ICDynamicCast();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_9;
      v14 = (void *)v13;
      v15 = (objc_class *)objc_opt_class();
      if (v15 != +[ICInlineTextAttachment textAttachmentClassForAttachment:](ICInlineTextAttachment, "textAttachmentClassForAttachment:", v12))
      {

LABEL_9:
        if (!v7
          || !+[ICTextAttachment textAttachmentIsContent:](ICTextAttachment, "textAttachmentIsContent:", v7))
        {
          goto LABEL_34;
        }
        +[ICInlineTextAttachment textAttachmentWithAttachment:](ICInlineTextAttachment, "textAttachmentWithAttachment:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          goto LABEL_12;
        v24 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_2_cold_1(v12, a3, a4);
        goto LABEL_32;
      }
LABEL_35:

      goto LABEL_36;
    }
    if (v7 && objc_msgSend((id)objc_opt_class(), "isInlineAttachment:", v7))
    {
      objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "attachmentFromObject:createIfNecessary:", v7, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setNeedsInitialFetchFromCloud:", 1);
LABEL_36:

      goto LABEL_37;
    }
    objc_opt_class();
    ICDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v18 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v18;
    if (v18 && v12)
    {
      v19 = (objc_class *)objc_opt_class();
      if (v19 == +[ICTextAttachment textAttachmentClassForAttachment:](ICTextAttachment, "textAttachmentClassForAttachment:", v12))goto LABEL_35;

      v14 = 0;
    }
    else if (v18 && !v12)
    {
      objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "attachmentFromObject:createIfNecessary:", v14, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setAttachment:", v12);
      goto LABEL_35;
    }
    if (!v7 || v14)
      goto LABEL_35;
    if (!+[ICTextAttachment textAttachmentIsContent:](ICTextAttachment, "textAttachmentIsContent:", v7))
      goto LABEL_34;
    v21 = *(void **)(a1 + 32);
    if (v12)
    {
      objc_msgSend(v21, "attachments");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "containsObject:", v12);

      if ((v23 & 1) == 0 && (objc_msgSend(*(id *)(a1 + 32), "canAddAttachment") & 1) == 0)
        goto LABEL_43;
    }
    else
    {
      if ((objc_msgSend(v21, "canAddAttachment") & 1) == 0)
      {
LABEL_43:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        v28 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "shortLoggingDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v39.location = a3;
          v39.length = a4;
          NSStringFromRange(v39);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138412546;
          v34 = v29;
          v35 = 2112;
          v36 = v30;
          _os_log_impl(&dword_1AC7A1000, v28, OS_LOG_TYPE_DEFAULT, "Removing attachment attribute for attachment that we can't add %@ at %@", (uint8_t *)&v33, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E0DC10F8], a3, a4);
        goto LABEL_34;
      }
      objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "attachmentFromObject:createIfNecessary:", v7, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v31 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v40.location = a3;
          v40.length = a4;
          NSStringFromRange(v40);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138478083;
          v34 = v7;
          v35 = 2112;
          v36 = v32;
          _os_log_impl(&dword_1AC7A1000, v31, OS_LOG_TYPE_DEFAULT, "Found an NSTextAttachment with no corresponding ICAttachment: %{private}@ at %@", (uint8_t *)&v33, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E0DC10F8], a3, a4);
        v14 = 0;
        v12 = 0;
        goto LABEL_35;
      }
    }
    +[ICTextAttachment textAttachmentWithAttachment:](ICTextAttachment, "textAttachmentWithAttachment:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
LABEL_12:
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC10F8], v16, a3, a4);
LABEL_33:

LABEL_34:
      v14 = 0;
      goto LABEL_35;
    }
    v24 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "shortLoggingDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v38.location = a3;
      v38.length = a4;
      NSStringFromRange(v38);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412546;
      v34 = v26;
      v35 = 2112;
      v36 = v27;
      _os_log_impl(&dword_1AC7A1000, v24, OS_LOG_TYPE_DEFAULT, "Found an attachment that we could not create a text attachment for: %@ at %@", (uint8_t *)&v33, 0x16u);

    }
LABEL_32:

    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E0DC10F8], a3, a4);
    goto LABEL_33;
  }
LABEL_37:

}

uint64_t __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isEmpty"));
}

uint64_t __26__ICNote_HTML__htmlString__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = CFSTR("object");
  return objc_msgSend(MEMORY[0x1E0D63BB8], "htmlObjectAttributesForAttachmentWithContentID:", a2);
}

id __45__ICNote_HTML__htmlStringWithHTMLAttachments__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "attachmentWithIdentifier:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canConvertToHTMLForSharing");

  if (v8)
  {
    objc_msgSend(v6, "attachmentModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributesForSharingHTMLWithTagName:textContent:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

intptr_t __62__ICNote_HTML__mutableAttributedStringFromHTMLString_baseURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "mutableCopy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __49__ICNote_HTML__fixDashedListsInAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  v7 = a2;
  if (v7)
  {
    v23 = v7;
    objc_msgSend(v7, "textLists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v7 = v23;
    if (v9)
    {
      objc_msgSend(v23, "textLists");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      if (objc_msgSend(v11, "count"))
      {
        v22 = a3;
        v12 = 0;
        v13 = 0;
        do
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "markerFormat");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("{upper-roman}"));

          if (v16)
          {
            v17 = (void *)objc_msgSend(objc_alloc((Class)fixDashedListsInAttributedString__NSTextListClass), "initWithMarkerFormat:options:", CFSTR("{hyphen}"), objc_msgSend(v14, "listOptions"));
            objc_msgSend(v17, "setStartingItemNumber:", objc_msgSend(v14, "startingItemNumber"));
            objc_msgSend(v11, "setObject:atIndexedSubscript:", v17, v13);

            v12 = 1;
          }

          ++v13;
        }
        while (v13 < objc_msgSend(v11, "count"));
        if ((v12 & 1) != 0)
        {
          v18 = (void *)objc_msgSend(v23, "mutableCopy");
          objc_msgSend(v18, "setTextLists:", v11);
          v19 = *(void **)(a1 + 32);
          v20 = *MEMORY[0x1E0DC1178];
          v21 = (void *)objc_msgSend(v18, "copy");
          objc_msgSend(v19, "addAttribute:value:range:", v20, v21, v22, a4);

        }
      }

      v7 = v23;
    }
  }

}

void __43__ICNote_HTML__fixFontsInAttributedString___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  id v26;

  v7 = a2;
  if (!v7)
    goto LABEL_21;
  v26 = v7;
  objc_msgSend(v7, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsString:", CFSTR("Times New Roman")) & 1) == 0)
  {
    objc_msgSend(v26, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Times")) & 1) == 0)
    {
      objc_msgSend(v26, "familyName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "containsString:", CFSTR("Helvetica")) & 1) == 0)
      {
        objc_msgSend(v26, "familyName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "containsString:", CFSTR("Noteworthy")) & 1) == 0)
        {
          objc_msgSend(v26, "familyName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "containsString:", CFSTR("Marker Felt"));

          v7 = v26;
          if ((v25 & 1) == 0)
            goto LABEL_21;
          goto LABEL_10;
        }

      }
    }

  }
LABEL_10:
  objc_msgSend(a1[4], "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63938], a3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = objc_msgSend(v12, "integerValue") == 0;
  else
    v14 = 1;
  objc_msgSend(v26, "pointSize");
  if (v15 < 18.0)
  {
    objc_msgSend(a1[5], "pointSize");
    v17 = v18;
    if (!v14)
    {
      +[ICTTTextController superscriptScaleFactor](ICTTTextController, "superscriptScaleFactor");
      v17 = round(v17 * v19);
    }
  }
  else
  {
    objc_msgSend(v26, "pointSize");
    v17 = v16;
  }
  objc_msgSend(v26, "fontDescriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "symbolicTraits");
  objc_msgSend(a1[6], "fontDescriptorWithSymbolicTraits:", v21);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(a1[6], "fontDescriptorWithSymbolicTraits:", v21 & 0xEFFFFFFF);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
      v22 = a1[6];
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v22, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v23, a3, a4);

  v7 = v26;
LABEL_21:

}

uint64_t __48__ICNote_HTML__fixTextColorsInAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "ic_isBlack");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC1140], a3, a4);
  return result;
}

void __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = a2;
    objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

  }
}

void __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  id v52;
  id v54;
  BOOL v55;
  id v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  uint64_t *v68;
  __int128 v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v52 = a2;
  objc_msgSend(*(id *)(a1 + 72), "tagDictionariesForAttributes:attachmentConversionHandler:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v76 = 0u;
  v77 = 0u;
  v55 = v6 == 0;
  v78 = 0u;
  v79 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  if (!v7)
  {

    if (v6)
    {
      v8 = 0;
      goto LABEL_36;
    }
    goto LABEL_21;
  }
  v8 = 0;
  v9 = *(_QWORD *)v77;
  do
  {
    v10 = 0;
    v11 = v8;
    do
    {
      if (*(_QWORD *)v77 != v9)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v10);
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TagName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Attributes"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = &stru_1E5C2F8C0;
      if (v14)
        v16 = (__CFString *)v14;
      v17 = v16;

      if ((unint64_t)-[__CFString length](v17, "length") >= 2)
      {
        -[__CFString substringWithRange:](v17, "substringWithRange:", 0, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR(" "));

        if ((v19 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v17);
          v20 = objc_claimAutoreleasedReturnValue();

          v17 = (__CFString *)v20;
        }
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TextContent"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("<%@%@"), v13, v17);
      if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v13))
        objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("/"));
      else
        v55 = 1;
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(">"));

      ++v10;
      v11 = v8;
    }
    while (v7 != v10);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  }
  while (v7);

  if (v55)
  {
    if (v8)
    {
LABEL_35:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", v8);
      goto LABEL_36;
    }
LABEL_21:
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__3;
    v74 = __Block_byref_object_dispose__3;
    objc_msgSend(*(id *)(a1 + 48), "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "substringWithRange:", a3, a4);
    v75 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v71[5], "ic_stringReplacingUnsafeHTMLCharacters");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v71[5];
    v71[5] = v22;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(a1 + 56);
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke_3;
    v66[3] = &unk_1E5C1DFC0;
    v69 = *(_OWORD *)(a1 + 80);
    v68 = &v70;
    v56 = v24;
    v67 = v56;
    objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v66);
    if (objc_msgSend(v56, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "allKeys");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v54 = v28;
      v29 = 0;
      v30 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v63 != v31)
              objc_enumerationMutation(v54);
            v33 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            v34 = objc_msgSend(v33, "unsignedIntegerValue") - *(_QWORD *)(a1 + 80);
            objc_msgSend((id)v71[5], "substringWithRange:", v29, v34 - v29);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "appendFormat:", CFSTR("<span>%@</span>"), v35);
            objc_msgSend(v56, "objectForKeyedSubscript:", v33);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "appendString:", v36);

            v29 = v34 + 1;
          }
          v30 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
        }
        while (v30);
      }

      objc_msgSend((id)v71[5], "substringWithRange:", v29, objc_msgSend((id)v71[5], "length") - v29);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "length"))
        objc_msgSend(v26, "appendFormat:", CFSTR("<span>%@</span>"), v37);
      v38 = objc_msgSend(v26, "copy");
      v39 = (void *)v71[5];
      v71[5] = v38;

    }
    v40 = (void *)v71[5];
    objc_msgSend(MEMORY[0x1E0CB3940], "ic_attachmentCharacterString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringByReplacingOccurrencesOfString:withString:", v41, &stru_1E5C2F8C0);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v71[5];
    v71[5] = v42;

    v44 = (void *)v71[5];
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringByTrimmingCharactersInSet:", v45);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v8, "length"))
    {

      v8 = CFSTR("<br>");
    }

    _Block_object_dispose(&v70, 8);
    goto LABEL_35;
  }
LABEL_36:
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(obj, "reverseObjectEnumerator");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v59 != v48)
          objc_enumerationMutation(v46);
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("TagName"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v50) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("</%@>"), v50);

      }
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
    }
    while (v47);
  }

}

void __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIImage *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v5 = a3;
  v6 = objc_msgSend(v21, "unsignedIntegerValue");
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6 >= v7;
  v8 = v6 - v7;
  v9 = !v9 || v8 >= *(_QWORD *)(a1 + 56);
  if (!v9)
  {
    v10 = objc_msgSend(v21, "unsignedIntegerValue") - *(_QWORD *)(a1 + 48);
    if (v10 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("<picture>"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageContent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "appendFormat:", CFSTR("<source srcset=\"data:image/x-apple-adaptive-glyph;base64,%@\" type=\"image/x-apple-adaptive-glyph\">"),
        v13);
      v14 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v5, "imageContent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageWithData:", v15);
      v16 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "contentDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ic_stringReplacingUnsafeXMLCharacters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendFormat:", CFSTR("<img src=\"data:image/png;base64,%@\" alt=\"%@\">"), v18, v20);

      objc_msgSend(v11, "appendString:", CFSTR("</picture>"));
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v21);

    }
  }

}

void __57__ICNote_UI__rangesModifiedAfterTimestamp_inTextStorage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  if (a3)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __51__ICNote_UI__noteDidMergeNoteDocumentWithUserInfo___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        objc_msgSend(a1[5], "authorHighlightsController", (_QWORD)v18);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "rangeValue");
        v11 = v10;
        objc_msgSend(a1[6], "textStorage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "extendHighlightsForRange:inTextStorage:", v9, v11, v12);

        if (objc_msgSend(a1[6], "isSharedViaICloud")
          && (objc_msgSend(a1[6], "isFastSyncSessionActive") & 1) == 0)
        {
          objc_msgSend(a1[5], "authorHighlightsController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v7, "rangeValue");
          v16 = v15;
          objc_msgSend(a1[6], "textStorage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "flashHighlightsForRange:withDuration:inTextStorage:", v14, v16, 0, v17);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

}

void __39__ICNote_UI__hasMentionForParticipant___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = objc_msgSend(v10, "attachmentType") == 2;
  v8 = v10;
  if (v7)
  {
    objc_msgSend(v10, "tokenContentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", a1[4]) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", a1[5]))
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      *a5 = 1;
    }

    v8 = v10;
  }

}

uint64_t __55__ICNote_UI__outlineControllerCollapsedStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveOutlineState");
}

id __58__ICNote_UI__noteActivityItemsForSharingWithNoteExporter___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "isSharable"))
  {
    objc_msgSend(WeakRetained, "textStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "standardizedAttributedStringFixingTextAttachmentsInContext:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __39__ICNote_UI__airDropActivityItemSource__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_msgSend(WeakRetained, "newAirDropDocument");

  return v2;
}

void __56__ICNote_UI__attachmentActivityItemsForSharingForRange___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  NSRange v20;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v20.location = a3;
  v20.length = a4;
  if (NSIntersectionRange(*(NSRange *)(a1 + 40), v20).length && (objc_msgSend(v7, "isTable") & 1) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v7, "activityItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v13, "isFileURL"))
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

void __51__ICNote_UI__appendAttributedString_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSuffix:", CFSTR("\n\n"));

  if (v6)
  {
    --v3;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasSuffix:", CFSTR("\n"));

  if ((v10 & 1) != 0)
  {
LABEL_7:
    v12 = v3;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "replaceCharactersInRange:withString:", v3, 0, CFSTR("\n"));

  v12 = v3 + 1;
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v12, 0, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimestamp:range:", v14, v3, objc_msgSend(v15, "length") - v3);

}

uint64_t __78__ICNote_UI__duplicateNote_intoFolder_isPasswordProtected_removeOriginalNote___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:]_block_invoke", 1, 1, CFSTR("Saved while duplicating note"));
}

void __49__ICNote_UI__updateThumbnailAttachmentIdentifier__block_invoke_215(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  if (v7)
  {
    v17 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v17, "attachmentIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attachmentWithIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "attachment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
    }
    objc_msgSend(v10, "attachmentModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "showThumbnailInNoteList");

    if (v12)
    {
      objc_msgSend(v10, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      *a5 = 1;
    }

    v7 = v17;
  }

}

void __140__ICNote_UI__thumbnailImageWithMinSize_scale_appearanceType_requireAppearance_imageScaling_showAsFileIcon_isMovie_movieDuration_attachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  int v19;
  void *v20;
  void (**v21)(_QWORD, double);
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id obj;

  v7 = a2;
  objc_msgSend(v7, "attachmentModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "showThumbnailInNoteList");

  if (v9)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(double *)(a1 + 48);
    v12 = *(double *)(a1 + 56);
    v13 = *(unsigned __int8 *)(a1 + 112);
    v14 = *(_QWORD *)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 72);
    v16 = *(_QWORD *)(a1 + 80);
    v17 = *(_QWORD *)(a1 + 88);
    v18 = *(double *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 96);
    obj = *(id *)(v10 + 40);
    v19 = objc_msgSend(v7, "thumbnailImage:minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:", &obj, v14, v13, v15, v16, v17, v18, v11, v12, v25);
    objc_storeStrong((id *)(v10 + 40), obj);
    *a5 = v19;
    if (v19)
    {
      if (!*(_QWORD *)(a1 + 104) || (**(_QWORD **)(a1 + 104) = objc_retainAutorelease(v7), *a5))
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
        {
          objc_msgSend(v7, "attachmentModel");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "genericListThumbnailCreator");
          v21 = (void (**)(_QWORD, double))objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v21[2](v21, *(double *)(a1 + 56));
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v24 = *(void **)(v23 + 40);
            *(_QWORD *)(v23 + 40) = v22;

            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
            {
              **(_QWORD **)(a1 + 72) = 1;
              **(_BYTE **)(a1 + 80) = 0;
            }
          }

        }
      }
    }
  }

}

void __113__ICNote_UI__fetchThumbnailImageWithMinSize_scale_cache_appearanceInfo_cacheKey_processingBlock_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  int v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "attachmentModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showThumbnailInNoteList");

  v9 = v20;
  if (v8)
  {
    v10 = *(double *)(a1 + 104);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v20, "attachmentModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "genericListThumbnailCreator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v20, "fetchThumbnailImageWithMinSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:", v11, v12, v13, v14, v15, v17, *(double *)(a1 + 88), *(double *)(a1 + 96), v10, 0);

    v18 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    if (v18)
    {
      objc_msgSend(v20, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setThumbnailAttachmentIdentifier:", v19);

      v18 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    }
    *a5 = v18;
    v9 = v20;
  }

}

void __60__ICNote_UI__noteDidApplyAttachmentViewTypeToAllAttachments__block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSRange v13;
  void *v14;
  NSRange v15;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v14;
  if (v14)
  {
    v9 = objc_msgSend(v14, "supportsMultiplePresentationSizes");
    v8 = v14;
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
      v10 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13.location = *(_QWORD *)(v12 + 32);
      if (v13.location == 0x7FFFFFFFFFFFFFFFLL)
      {
        *(_QWORD *)(v12 + 32) = a3;
        *(_QWORD *)(v12 + 40) = a4;
      }
      else
      {
        v13.length = *(_QWORD *)(v12 + 40);
        v15.location = a3;
        v15.length = a4;
        *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = NSUnionRange(v13, v15);
      }
      v8 = v14;
    }
  }

}

void __18__ICNote_UI__save__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "hasChanges"))
  {
    objc_msgSend(v9, "changedValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }

}

uint64_t __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_236(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isEmpty"));
}

uint64_t __36__ICNote_UI__textStorageWillChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isEmpty"));
}

uint64_t __35__ICNote_UI__textStorageDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isEmpty"));
}

void __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EECADDB0))
  {
    ICProtocolCast();
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject attachmentIdentifier](v4, "attachmentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0D639F0];
      -[NSObject attachmentIdentifier](v4, "attachmentIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attachmentWithIdentifier:context:", v7, v8);
      v9 = (os_log_t)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_2(a1, v9);

        -[NSObject updateMarkedForDeletionStateAttachmentIsInUse:](v9, "updateMarkedForDeletionStateAttachmentIsInUse:", *(_BYTE *)(a1 + 40) == 0);
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0D63B40];
        -[NSObject attachmentIdentifier](v4, "attachmentIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "attachmentWithIdentifier:context:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_2(a1, v14);

          objc_msgSend(v14, "updateMarkedForDeletionStateInlineAttachmentIsInUse:", *(_BYTE *)(a1 + 40) == 0);
        }

      }
    }
    else
    {
      v9 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_1();

    }
LABEL_19:

    goto LABEL_20;
  }
  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_4();
    goto LABEL_19;
  }
LABEL_20:

}

void __42__ICNote_UI__firstAttachmentInTextStorage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a5 = 1;
}

uint64_t __49__ICNote_UI__addHashtagToNoteBody_onlyIfMissing___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = objc_msgSend(a2, "isHashtagAttachment");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "paragraphRangeForRange:", a3, a4);
    v14 = v13;

    result = objc_msgSend(*(id *)(a1 + 32), "isHashtagRowAtRange:outRangeForAppending:outIndex:forHashtagAttachment:outHashtagCount:", v12, v14, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32, 0, 0, 0);
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      *a5 = 1;
    }
  }
  return result;
}

void __28__ICNote_UI__removeHashtag___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  __CFString *v30;
  char v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  char v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  int v49;
  BOOL v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  __CFString *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;

  v7 = a2;
  if (objc_msgSend(v7, "attachmentType") == 1)
  {
    objc_msgSend(v7, "tokenContentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "standardizedContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      v64 = 0;
      v65 = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(a1[4], "displayText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ic_withHashtagPrefix");
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[5], "textStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "paragraphRangeForRange:", a3, a4);
      v63 = v7;
      v16 = v15;

      if (objc_msgSend(a1[5], "isHashtagRowAtRange:outRangeForAppending:outIndex:forHashtagAttachment:outHashtagCount:", v14, v16, 0, &v65, v7, &v64))
      {
        if (a3)
        {
          while (1)
          {
            v17 = a3 - 1;
            objc_msgSend(a1[5], "textStorage", v62);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "string");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "characterAtIndex:", a3 - 1);

            if (a3 - 2 < 0)
            {
              v25 = 1;
            }
            else
            {
              objc_msgSend(a1[5], "textStorage");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "string");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "characterAtIndex:", a3 - 2);

              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "characterIsMember:", v23);

            }
            if (v64 == 1)
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "characterIsMember:", v20) & v25;

              if (v27 == 1)
                break;
            }
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "characterIsMember:", v20);

            if (!v29)
            {
              v17 = a3;
              goto LABEL_17;
            }
            ++a4;
            --a3;
            if (!v17)
              goto LABEL_17;
          }
          ++a4;
        }
        else
        {
          v17 = 0;
        }
LABEL_17:
        v31 = 0;
        while (1)
        {
          objc_msgSend(a1[5], "textStorage", v62);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "string");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "length");

          if (v17 + a4 >= v34 || (v31 & 1) != 0)
            break;
          objc_msgSend(a1[5], "textStorage");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "string");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "characterAtIndex:", v17 + a4);

          objc_msgSend(a1[5], "textStorage");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "string");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "length");

          if (v40 >= v17 + a4 + 2)
          {
            objc_msgSend(a1[5], "textStorage");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "string");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "characterAtIndex:", v17 + a4 + 1);

            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v45, "characterIsMember:", v44);

          }
          else
          {
            v41 = 1;
          }
          if (v64 == 1
            && (objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet"),
                v46 = (void *)objc_claimAutoreleasedReturnValue(),
                v47 = objc_msgSend(v46, "characterIsMember:", v37) & v41,
                v46,
                (v47 & 1) != 0))
          {
            v31 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "characterIsMember:", v37);

            if (!v49)
              break;
            v31 = 0;
          }
          ++a4;
        }
        v50 = v65 == v64 - 1 || v65 == 0;
        v51 = CFSTR(" ");
        if (v50)
          v51 = &stru_1E5C2F8C0;
        v30 = v51;

        v7 = v63;
      }
      else
      {
        v17 = a3;
        v30 = v62;
      }
      objc_msgSend(a1[5], "textStorage", v62);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "replaceCharactersInRange:withString:", v17, a4, v30);

      objc_msgSend(a1[6], "addObject:", v7);
      objc_msgSend(a1[5], "textStorage");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "string");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "stringByTrimmingCharactersInSet:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "length");

      if (!v57)
      {
        objc_msgSend(a1[5], "textStorage");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "textStorage");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "ic_range");
        objc_msgSend(v58, "replaceCharactersInRange:withString:", v60, v61, &stru_1E5C2F8C0);

      }
    }
  }

}

void __101__ICNote_UI__isHashtagRowAtRange_outRangeForAppending_outIndex_forHashtagAttachment_outHashtagCount___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;

  v9 = a2;
  objc_opt_class();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v13;
  if (v13 && (v11 = objc_msgSend(v13, "isHashtagAttachment"), v10 = v13, (v11 & 1) != 0))
  {
    v12 = *(_QWORD *)(a1[6] + 8);
    *(_QWORD *)(v12 + 32) = a3;
    *(_QWORD *)(v12 + 40) = a4;
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    if (v13 == (void *)a1[4])
      *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) - 1;
  }
  else
  {
    *a5 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }

}

id __26__ICNote_UI__ic_wordCount__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "ic_trimmedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void __52__ICNote_SearchIndexable_UI__dataForTypeIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __52__ICNote_SearchIndexable_UI__dataForTypeIdentifier___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 40), "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5 = *(void **)(a1 + 40);
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterAttachmentsInTextStorage:range:", v6, 0, v4);

  objc_msgSend(*(id *)(a1 + 40), "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copyDataForUTI:range:persistenceHelper:", *(_QWORD *)(a1 + 32), 0, v4, *(_QWORD *)(a1 + 40));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length");
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "shortLoggingDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218498;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_debug_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEBUG, "Got %ld bytes for %@ %@", (uint8_t *)&v15, 0x20u);

  }
}

uint64_t __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  ICCopyModernNotesToLegacyAccountOperation *v27;
  void *v28;
  uint64_t v29;
  ICCopyModernNotesToLegacyAccountOperation *v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v11)
  {
    if (v12)
    {
      v23 = os_log_create("com.apple.notes", "Export");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke_cold_1(v13, v23);

    }
    goto LABEL_16;
  }
  objc_msgSend(v10, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "replaceCharactersInRange:withAttributedString:", 0, objc_msgSend(v15, "length"), v11);

  objc_msgSend(v10, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resetUndoManager");

  objc_msgSend(v10, "markAsCallNoteIfAttachmentIsCallRecording");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v10, "attachments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v21++), "setRemoteFileURL:", 0);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v19);
  }

  if (!v9)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "defaultStoreForNewNote");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v25;
    v27 = [ICCopyModernNotesToLegacyAccountOperation alloc];
    v39 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke_2;
    v33[3] = &unk_1E5C20A80;
    v29 = *(_QWORD *)(a1 + 32);
    v34 = *(id *)(a1 + 40);
    v30 = -[ICCopyModernNotesToLegacyAccountOperation initWithNotes:toFolder:legacyContext:didCopyBlock:](v27, "initWithNotes:toFolder:legacyContext:didCopyBlock:", v28, v26, v29, v33);

    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addOperation:", v30);

LABEL_16:
    v22 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v10, "setFolder:", v9);
  v22 = 1;
LABEL_17:

  return v22;
}

void __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D63BB8], "deleteNote:", a2);
  v5 = v7;
  if (v7)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
      v5 = v7;
    }
  }

}

void __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_2_cold_1(void *a1, NSUInteger a2, NSUInteger a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSRange v13;

  objc_msgSend(a1, "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13.location = a2;
  v13.length = a3;
  NSStringFromRange(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v7, v8, "Found a token text attachment that we could not create a text attachment for: %@ at %@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_4();
}

void __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_opt_class();
  ICDynamicCast();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v2, v3, "attempted to update an attachment without an identifier: %@ %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

void __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "ic_loggingIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1AC7A1000, v3, v4, "Ensuring markedForDeletion=%d for inline attachment %@ after finding it in an attributed string", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

void __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1AC7A1000, v0, OS_LOG_TYPE_ERROR, "found a non-ICTTAttachment attachment: %@", v1, 0xCu);
}

void __52__ICNote_SearchIndexable_UI__dataForTypeIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_DEBUG, "Getting %@ data for %@", (uint8_t *)&v5, 0x16u);

}

void __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Error copying values to note %@", (uint8_t *)&v4, 0xCu);

}

@end
