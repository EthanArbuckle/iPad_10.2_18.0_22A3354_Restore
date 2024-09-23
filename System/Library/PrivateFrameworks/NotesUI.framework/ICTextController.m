@implementation ICTextController

- (id)nsParagraphStyleForICTTParagraphStyle:(id)a3 range:(_NSRange)a4 attributedString:(id)a5 textView:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v25;
  void *v26;
  ICTK2TodoTextAttachment *v27;
  void *v28;
  ICTK2TodoTextAttachment *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  ICTK2BulletTextAttachment *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[2];

  length = a4.length;
  location = a4.location;
  v48[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v11, "isList") & 1) != 0
    || location >= objc_msgSend(v12, "length")
    || (objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], location, 0),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    -[ICTTTextController preferredAttributesForICTTTextStyle:](self, "preferredAttributesForICTTTextStyle:", objc_msgSend(v11, "style"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v17, "mutableCopy");

  }
  else
  {
    objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1178], location, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
  }

  if (objc_msgSend(v11, "isList"))
  {
    objc_msgSend(v16, "setAlignment:", objc_msgSend(v11, "alignmentAdjustedForLists"));
    objc_msgSend(v16, "setBaseWritingDirection:", objc_msgSend(v11, "layoutWritingDirection"));
    if (!ICInternalSettingsIsTextKit2Enabled()
      || -[ICTTTextController isInPreviewMode](self, "isInPreviewMode")
      || -[ICTextController isForPrint](self, "isForPrint"))
    {
      if (objc_msgSend(v11, "style") == 103)
      {
        -[ICTTTextController zoomController](self, "zoomController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "checklistZoomFactor");
        v20 = 5.0 * v19;

        objc_msgSend(v16, "setParagraphSpacingBefore:", v20);
        objc_msgSend(v16, "setParagraphSpacing:", v20);
      }
    }
    else if (objc_msgSend(v11, "style") == 103)
    {
      v25 = objc_alloc(MEMORY[0x1E0DC1300]);
      v26 = (void *)objc_msgSend(v25, "initWithMarkerFormat:options:", *MEMORY[0x1E0DC1220], 0);
      v27 = [ICTK2TodoTextAttachment alloc];
      objc_msgSend(v11, "todo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[ICTK2TodoTextAttachment initWithTodo:](v27, "initWithTodo:", v28);
      objc_msgSend(v26, "setMarkerTextAttachment:", v29);

      v48[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTextLists:", v30);

      -[ICTTTextController zoomController](self, "zoomController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "checklistZoomFactor");
      v33 = 3.5 * v32;

      objc_msgSend(v16, "setParagraphSpacingBefore:", v33);
      objc_msgSend(v16, "setParagraphSpacing:", v33);

    }
    else if (objc_msgSend(v11, "style") == 100)
    {
      v34 = objc_alloc(MEMORY[0x1E0DC1300]);
      v35 = (void *)objc_msgSend(v34, "initWithMarkerFormat:options:", *MEMORY[0x1E0DC1220], 0);
      objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], location, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTTTextController zoomController](self, "zoomController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "zoomFactor");
      +[ICTTTextStorage bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:](ICTTTextStorage, "bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:", v36, v11);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "listBulletInAttributedString:atIndex:", v12, location);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v39, v38);
      v41 = -[ICTK2BulletTextAttachment initWithMarker:]([ICTK2BulletTextAttachment alloc], "initWithMarker:", v40);
      objc_msgSend(v35, "setMarkerTextAttachment:", v41);

      v47 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTextLists:", v42);

    }
    else
    {
      objc_msgSend(v11, "listBulletInAttributedString:atIndex:", v12, location);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1300]), "initWithMarkerFormat:options:", v43, 0);
      v46 = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTextLists:", v45);

    }
  }
  else
  {
    objc_msgSend(v16, "setAlignment:", objc_msgSend(v11, "alignment"));
    objc_msgSend(v16, "setBaseWritingDirection:", objc_msgSend(v11, "writingDirection"));
    if (-[ICTextController shouldUpdateIndentFor:](self, "shouldUpdateIndentFor:", v11))
    {
      objc_msgSend((id)objc_opt_class(), "indentForStyle:range:attributedString:textView:", v11, location, length, v12, v13);
      v22 = v21;
      objc_msgSend(v16, "setHeadIndent:");
      objc_msgSend(v16, "setFirstLineHeadIndent:", v22);
    }
  }
  v23 = (void *)objc_msgSend(v16, "copy");

  return v23;
}

void __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke(uint64_t a1, NSUInteger a2, uint64_t a3)
{
  NSUInteger location;
  _QWORD *v6;
  void *v7;
  NSUInteger length;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSRange v23;
  NSRange v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSRange v33;
  NSRange v34;
  uint64_t v35;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, void *);
  void *v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;
  NSRange v60;
  NSRange v61;

  location = a2;
  v59 = *MEMORY[0x1E0C80C00];
  v6 = (_QWORD *)MEMORY[0x1E0D63928];
  objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], a2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  length = a3 - location;
  objc_msgSend(*(id *)(a1 + 40), "trackedToDoParagraphs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "todoTrackingUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_7:
    objc_msgSend(v7, "todoTrackingUUID");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      objc_msgSend(*(id *)(a1 + 40), "trackedToDoParagraphs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "todoTrackingUUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        objc_msgSend(*(id *)(a1 + 40), "createToDoItemForCharacterRange:paragraphStyle:textStorage:", location, length, v7, *(_QWORD *)(a1 + 32));
        v30 = *(void **)(a1 + 48);
        objc_msgSend(v7, "todoTrackingUUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v31);

        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v33.location = *(_QWORD *)(v32 + 32);
        if (v33.location != 0x7FFFFFFFFFFFFFFFLL)
        {
          v33.length = *(_QWORD *)(v32 + 40);
          v61.location = location;
          v61.length = length;
          v34 = NSUnionRange(v33, v61);
          location = v34.location;
          length = v34.length;
          v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        }
        *(_QWORD *)(v32 + 32) = location;
        *(_QWORD *)(v32 + 40) = length;
      }
    }
    goto LABEL_27;
  }
  v12 = *(void **)(a1 + 48);
  objc_msgSend(v11, "paragraph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "todoTrackingUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v12, "containsObject:", v14);

  if ((v12 & 1) != 0)
  {
    v15 = *(void **)(a1 + 48);
    objc_msgSend(v11, "paragraph");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "todoTrackingUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v15, "containsObject:", v17);

    if ((_DWORD)v15)
    {
      v18 = (void *)objc_msgSend(v7, "mutableCopy");
      v19 = objc_alloc_init(MEMORY[0x1E0D63CC0]);
      objc_msgSend(v18, "setTodo:", v19);

      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *v6, v18, location, length);
      objc_msgSend(*(id *)(a1 + 40), "createToDoItemForCharacterRange:paragraphStyle:textStorage:", location, length, v18, *(_QWORD *)(a1 + 32));
      v20 = *(void **)(a1 + 48);
      objc_msgSend(v18, "todoTrackingUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v21);

      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v23.location = *(_QWORD *)(v22 + 32);
      if (v23.location != 0x7FFFFFFFFFFFFFFFLL)
      {
        v23.length = *(_QWORD *)(v22 + 40);
        v60.location = location;
        v60.length = length;
        v24 = NSUnionRange(v23, v60);
        location = v24.location;
        length = v24.length;
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      *(_QWORD *)(v22 + 32) = location;
      *(_QWORD *)(v22 + 40) = length;

      goto LABEL_27;
    }
    goto LABEL_7;
  }
  objc_msgSend(v11, "setParagraph:", v7);
  if (objc_msgSend(v11, "characterRange") != location || v35 != length)
  {
    objc_msgSend(v11, "setCharacterRange:", location, length);
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_opt_class();
      ICDynamicCast();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "textLayoutManagers");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v55;
        do
        {
          v42 = 0;
          do
          {
            if (*(_QWORD *)v55 != v41)
              objc_enumerationMutation(v38);
            ICProtocolCast();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "textController:updatedTrackedAttribute:", *(_QWORD *)(a1 + 40), v11);

            ++v42;
          }
          while (v40 != v42);
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        }
        while (v40);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "layoutManagers");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = MEMORY[0x1E0C809B0];
      v49 = 3221225472;
      v50 = __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_2;
      v51 = &unk_1E5C219A8;
      v52 = *(_QWORD *)(a1 + 40);
      v53 = v11;
      objc_msgSend(v44, "enumerateObjectsUsingBlock:", &v48);

    }
  }
  v45 = *(void **)(a1 + 48);
  objc_msgSend(v11, "paragraph", v48, v49, v50, v51, v52);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "todoTrackingUUID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObject:", v47);

LABEL_27:
}

- (NSMutableDictionary)trackedToDoParagraphs
{
  return self->_trackedToDoParagraphs;
}

- (_NSRange)addExtraLinesIfNeededToTextStorage:(id)a3 editedRange:(_NSRange)a4 actualLengthIncrease:(int64_t *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  NSRange v10;
  NSObject *v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSUInteger v26;
  NSUInteger v27;
  unint64_t v28;
  void *v29;
  void *v30;
  NSUInteger v31;
  void *v32;
  int v33;
  int isKindOfClass;
  int v35;
  BOOL v36;
  ICTextController *v37;
  void *v38;
  NSUInteger v39;
  void *v40;
  uint64_t v41;
  NSUInteger v43;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  NSUInteger v49;
  void *v50;
  NSUInteger v51;
  unint64_t v52;
  NSUInteger v53;
  void *v54;
  NSUInteger v55;
  void *v56;
  void *v57;
  NSUInteger v58;
  unint64_t v59;
  NSUInteger v60;
  void *v61;
  NSRange v62;
  void *v63;
  NSUInteger v64;
  NSUInteger v65;
  NSUInteger v66;
  int64_t *v67;
  int v68;
  NSUInteger v69;
  NSUInteger v70;
  uint64_t v71;
  NSUInteger v72;
  uint64_t v73;
  NSRange v74;
  uint64_t v75;
  NSUInteger v76;
  NSUInteger v77;
  NSRange v78;
  uint64_t v79;
  _QWORD v80[2];
  NSRange v81;
  NSRange v82;
  _NSRange result;
  NSRange v84;
  NSRange v85;
  NSRange v86;

  length = a4.length;
  location = a4.location;
  v80[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (location + length > objc_msgSend(v9, "length"))
  {
    v84.length = objc_msgSend(v9, "length");
    v81.location = location;
    v81.length = length;
    v84.location = 0;
    v10 = NSIntersectionRange(v81, v84);
    location = v10.location;
    length = v10.length;
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ICTextController addExtraLinesIfNeededToTextStorage:editedRange:actualLengthIncrease:].cold.1(v11);

  }
  *a5 = 0;
  objc_msgSend(v9, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "paragraphRangeForRange:", location, length);
  v15 = v14;

  if (objc_msgSend(v9, "length"))
  {
    v16 = v15;
    v67 = a5;
    objc_msgSend(v9, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "paragraphRangeForRange:", objc_msgSend(v9, "length"), 0);
    v20 = v19;

    if (v20)
    {
      objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v18, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21
        && objc_msgSend(v21, "wantsFollowingNewLine")
        && (objc_msgSend(v9, "shouldInhibitAddingExtraNewlinesAtEndDuringFixup") & 1) == 0)
      {
        v23 = v18 + v20;
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
        objc_msgSend(v9, "replaceCharactersInRange:withAttributedString:", v23, 0, v24);

        -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", v23, 1);
      }

    }
    v70 = length;
    v78.location = 0;
    v78.length = 0;
    v73 = objc_msgSend(v9, "length", location);
    -[ICTextController note](self, "note");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v25, "attachmentViewType");

    if (v13 < objc_msgSend(v9, "length"))
    {
      v71 = *MEMORY[0x1E0DC10F8];
      v26 = v13;
      v27 = v16;
      v69 = v13;
      do
      {
        v28 = v27 + v13;
        if (v26 > v27 + v13)
          break;
        objc_opt_class();
        objc_msgSend(v9, "attribute:atIndex:longestEffectiveRange:inRange:", v71, v26, &v78, 0, v73);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v82.location = v13;
        v72 = v27;
        v82.length = v27;
        v31 = NSIntersectionRange(v82, v78).length;
        objc_opt_class();
        ICDynamicCast();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = PKIsInlineDrawingOrPaperAttachment();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if (v32)
          v35 = 1;
        else
          v35 = v33;
        if (((v35 | isKindOfClass) & 1) != 0 && v31)
        {
          v36 = isKindOfClass;
          v37 = self;
          v76 = 0;
          v77 = 0;
          v75 = 0;
          objc_msgSend(v9, "string");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "getParagraphStart:end:contentsEnd:forRange:", &v77, &v75, &v76, v78.location, v78.length);

          if (v32 && objc_msgSend(v32, "supportsMultipleThumbnailsOnSameLine") && v68 == 1)
          {
            v39 = v26 + 1;
            while (v39 < objc_msgSend(v9, "length"))
            {
              v74.location = 0;
              v74.length = 0;
              objc_msgSend(v9, "attribute:atIndex:longestEffectiveRange:inRange:", v71, v39, &v74, 0, v73);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_opt_class();
              if (v41 != objc_opt_class() || v74.location != v39)
              {

                break;
              }
              v85.length = v74.length;
              v85.location = v39;
              v78 = NSUnionRange(v78, v85);
              v39 = v78.length + v78.location;

            }
          }
          if (v76 > v78.length + v78.location || v75 == v76)
          {
            self = v37;
            v52 = 0x1E0CB3000uLL;
            if (!v36 && (v33 & 1) != 0)
            {
              v43 = v78.length + v78.location;
              v36 = v43 < objc_msgSend(v9, "length");
            }
            v13 = v69;
            if (v32 || v36)
            {
              v45 = objc_alloc(MEMORY[0x1E0CB3498]);
              v79 = *MEMORY[0x1E0D63928];
              objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", 3);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v80[0] = v46;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = (void *)objc_msgSend(v45, "initWithString:attributes:", CFSTR("\n"), v47);

              v49 = v78.length + v78.location;
              objc_msgSend(v48, "string");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v49) = -[ICTextController shouldChangeTextInTextStorage:range:replacementString:](self, "shouldChangeTextInTextStorage:range:replacementString:", v9, v49, 0, v50);

              if ((_DWORD)v49)
              {
                objc_msgSend(v9, "insertAttributedString:atIndex:", v48, v78.length + v78.location);
                -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", v78.length + v78.location, 1);
                ++v78.length;
                ++v73;
              }
              v51 = v72;
              v52 = 0x1E0CB3000;
              if (v28 < objc_msgSend(v9, "length"))
              {
                v51 = v72 + 1;
                ++v70;
                ++*v67;
              }
              v72 = v51;

            }
          }
          else
          {
            self = v37;
            v13 = v69;
            v52 = 0x1E0CB3000uLL;
          }
          v53 = v78.location;
          if (v77 < v78.location)
          {
            v54 = (void *)objc_msgSend(objc_alloc(*(Class *)(v52 + 1176)), "initWithString:", CFSTR("\n"));
            v55 = v78.location;
            objc_msgSend(v54, "string");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v55) = -[ICTextController shouldChangeTextInTextStorage:range:replacementString:](self, "shouldChangeTextInTextStorage:range:replacementString:", v9, v55, 0, v56);

            if ((_DWORD)v55)
            {
              v57 = (void *)objc_msgSend(objc_alloc(*(Class *)(v52 + 1176)), "initWithString:", CFSTR("\n"));
              objc_msgSend(v9, "insertAttributedString:atIndex:", v57, v78.location);

              -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", v78.location++, 1);
              ++v73;
            }
            if (v72 + v13 < objc_msgSend(v9, "length"))
            {
              ++v72;
              ++v70;
              ++*v67;
            }

            v53 = v78.location;
          }
          v74.location = 0;
          v74.length = 0;
          v58 = v78.length;
          v59 = v78.length + v53;
          if (v59 >= objc_msgSend(v9, "length"))
            v60 = v58;
          else
            v60 = 2;
          objc_msgSend(v9, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0D63928], v78.location, &v74, v53, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (objc_msgSend(v61, "style") != 3
              || (v86.location = v53, v86.length = v60, v62 = NSIntersectionRange(v74, v86), v62.location != v53)
              || v62.length != v60)
            {
              v63 = (void *)objc_msgSend(v61, "mutableCopy");
              objc_msgSend(v63, "setBlockQuoteLevel:", objc_msgSend(v61, "blockQuoteLevel"));
              objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E0D63928], v63, v53, v60);

            }
          }

        }
        v26 = v78.length + v78.location;

        v27 = v72;
      }
      while (v26 < objc_msgSend(v9, "length"));
    }
    length = v70;
    location = v66;
  }

  v64 = location;
  v65 = length;
  result.length = v65;
  result.location = v64;
  return result;
}

- (ICAuthorHighlightsController)authorHighlightsController
{
  return (ICAuthorHighlightsController *)objc_loadWeakRetained((id *)&self->_authorHighlightsController);
}

- (BOOL)isForPrint
{
  return self->_isForPrint;
}

void __43__ICTextController_updateAttachmentsInNote__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EECADDB0))
    {
      ICProtocolCast();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachmentIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = *(void **)(a1 + 32);
        objc_msgSend(v5, "attachmentIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

        if ((_DWORD)v7)
        {
          objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 6);
          v9 = (void *)MEMORY[0x1E0D641A0];
          objc_msgSend(v5, "attachmentIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "attachmentUTI");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTextController updateAttachmentsInNote]_block_invoke", 1, 0, CFSTR("Same attachment is referenced twice in note body {attachmentIdentifier: %@, attachmentUTI: %@}"), v10, v11);

        }
        else
        {
          v15 = *(void **)(a1 + 32);
          objc_msgSend(v5, "attachmentIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v10);
        }

      }
      else
      {
        v14 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __43__ICTextController_updateAttachmentsInNote__block_invoke_cold_1((uint64_t)v4, v14);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }

    }
    else
    {
      v12 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __43__ICTextController_updateAttachmentsInNote__block_invoke_cold_2((uint64_t)v4, v12, v13);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

- (void)updateAttachmentsInNote
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Attachments deleted or revived. Updating note title and snippet", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "nsParagraphStyleForICTTParagraphStyle:range:attributedString:textView:", *(_QWORD *)(a1 + 40), a3, a4, *(_QWORD *)(a1 + 48), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v7, a3, a4);
    v7 = v8;
  }

}

void __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int IsBlockQuoteEnabled;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v18 = a2;
  if (objc_msgSend(v18, "isList"))
  {
    if (!ICInternalSettingsIsTextKit2Enabled()
      || objc_msgSend(v18, "style") != 102
      || (v7 = (uint64_t *)MEMORY[0x1E0D63D40],
          objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D40], a3, 0),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v8))
    {
      objc_msgSend(*(id *)(a1 + 40), "nsParagraphStyleForICTTParagraphStyle:range:attributedString:textView:", v18, a3, a4, *(_QWORD *)(a1 + 32), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v17, a3, a4);

      goto LABEL_15;
    }
    v9 = *v7;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke_2;
    v22[3] = &unk_1E5C21A70;
    v10 = *(void **)(a1 + 32);
    v22[4] = *(_QWORD *)(a1 + 40);
    v23 = v18;
    v24 = *(id *)(a1 + 32);
    objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v9, a3, a4, 0, v22);

    v11 = v23;
LABEL_11:

LABEL_15:
    v13 = v18;
    goto LABEL_16;
  }
  if (objc_msgSend(v18, "style") == 3
    || objc_msgSend(v18, "style") == 4
    || (v12 = objc_msgSend(v18, "isBlockQuote"), v13 = v18, v12)
    && (IsBlockQuoteEnabled = ICInternalSettingsIsBlockQuoteEnabled(), v13 = v18, IsBlockQuoteEnabled))
  {
    v15 = *MEMORY[0x1E0DC1178];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke_3;
    v19[3] = &unk_1E5C21A98;
    v16 = *(void **)(a1 + 32);
    v19[4] = *(_QWORD *)(a1 + 40);
    v20 = v18;
    v21 = *(id *)(a1 + 32);
    objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v15, a3, a4, 0, v19);

    v11 = v20;
    goto LABEL_11;
  }
LABEL_16:

}

uint64_t __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _BYTE *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[7];

  v5 = (_BYTE *)a1[6];
  if (!a3)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *v5 = 1;
    *a4 = 1;
  }
  v6 = *MEMORY[0x1E0DC10F8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke_3;
  v9[3] = &unk_1E5C215A0;
  v7 = (void *)a1[4];
  v9[4] = a1[5];
  v9[5] = v5;
  v9[6] = a4;
  return objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v6, a2, a3, 0x100000, v9);
}

void __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v11;
  _QWORD v12[4];
  __int128 v13;
  _BYTE *v14;

  v6 = objc_msgSend(a2, "rangeValue");
  v8 = v7;
  if (v6 <= objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke_2;
    v12[3] = &unk_1E5C215C8;
    v14 = a4;
    v11 = *(_OWORD *)(a1 + 32);
    v10 = (id)v11;
    v13 = v11;
    objc_msgSend(v9, "ic_enumerateContentLineRangesInRange:usingBlock:", v6, v8, v12);

  }
  else
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __58__ICTextController_numberListsInAttributedString_inRange___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;

  if (a2)
  {
    v7 = objc_msgSend(a2, "intValue");
    v8 = a3 + a4;
    v22 = a3 + a4;
    v23 = 0;
    v9 = (uint64_t *)MEMORY[0x1E0D63D08];
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v8 - 1, &v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "indent");
      v12 = v11 + 1;
      while (v12 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count", v22))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeLastObject");
      while (v12 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", &unk_1E5C71E50);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      if (!(_DWORD)v14)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:atIndexedSubscript:", v15, v11);

        v14 = v7;
      }
      objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *v9, v22, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      v18 = floor(log10((double)v17));
      if (v18 != floor(log10((double)(int)v14)))
      {
        v19 = *(void **)(a1 + 32);
        v20 = *v9;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAttribute:value:range:", v20, v21, v22, v23);

      }
      v8 = v22;
    }
    while (v22 > a3);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeAllObjects");
  }
}

void __58__ICTextController_numberListsInAttributedString_inRange___block_invoke(uint64_t a1, void *a2, NSUInteger a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  char v26;
  NSUInteger v27;
  char v28;
  uint64_t *v29;
  NSUInteger v30;
  void *v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _BYTE *v45;
  _BYTE *v46;
  id v47;
  NSRange v48;
  NSRange v49;

  v9 = a2;
  v47 = v9;
  if (!v9 || !objc_msgSend(v9, "isList"))
  {
    v17 = a3 + a4;
    if (a3 >= a3 + a4)
    {
      v19 = a3;
    }
    else
    {
      v18 = *MEMORY[0x1E0DC10F8];
      v19 = a3;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "string");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "paragraphRangeForRange:", v19, 0);
        v23 = v22;

        objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", v18, v19, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
          break;
        v19 = v21 + v23;

      }
      while (v21 + v23 < v17);
    }
    if (v19 < v17)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeAllObjects");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", &unk_1E5C71E50);
    }
    goto LABEL_21;
  }
  v10 = objc_msgSend(v47, "indent") + 1;
  if (v10 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
  {
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", &unk_1E5C71E50);
      v11 = objc_msgSend(v47, "indent") + 1;
    }
    while (v11 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"));
  }
  v12 = objc_msgSend(v47, "indent") + 1;
  if (v12 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObjectsInRange:", objc_msgSend(v47, "indent") + 1, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count") + ~objc_msgSend(v47, "indent"));
  v13 = objc_msgSend(v47, "style");
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v13 != 102)
  {
    if (objc_msgSend(v14, "count"))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "replaceObjectAtIndex:withObject:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count") - 1, &unk_1E5C71E50);
LABEL_21:
    v25 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  if (!v16)
  {
    if (objc_msgSend(v47, "startingItemNumber"))
      v16 = objc_msgSend(v47, "startingItemNumber");
    else
      v16 = 1;
  }
  v45 = a5;
  v27 = a3 + a4;
  if (a3 >= a3 + a4)
  {
    v28 = 0;
  }
  else
  {
    v28 = 0;
    v29 = (uint64_t *)MEMORY[0x1E0D63D40];
    v30 = a3;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "string", v45);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "paragraphRangeForRange:", v30, 0);
      v34 = v33;

      objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *v29, v30, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "unsignedIntegerValue");

      if (v16 != v36)
      {
        v37 = *(void **)(a1 + 32);
        v38 = *v29;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addAttribute:value:range:", v38, v39, v32, v34);

        v48.location = v32;
        v48.length = v34;
        *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = NSUnionRange(*(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)+ 8)+ 32), v48);
        v28 = 1;
      }
      objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v32, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "startingItemNumber") && v16 != objc_msgSend(v40, "startingItemNumber"))
      {
        v41 = (void *)objc_msgSend(v40, "mutableCopy");
        objc_msgSend(v41, "setStartingItemNumber:", 0);
        objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0D63928], v41, v32, v34);
        v49.location = v32;
        v49.length = v34;
        *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = NSUnionRange(*(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)+ 8)+ 32), v49);

      }
      ++v16;
      v30 = v32 + v34;

    }
    while (v32 + v34 < v27);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count", v45))
  {
    v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v43 = objc_msgSend(v42, "count") - 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "replaceObjectAtIndex:withObject:", v43, v44);

  }
  v25 = v28 & 1;
  a5 = v46;
LABEL_22:
  if (a3 > *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 64))
  {
    if (objc_msgSend(v47, "indent"))
      v26 = 1;
    else
      v26 = v25;
    if ((v26 & 1) == 0)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a3
                                                                  - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 32);
      *a5 = 1;
    }
  }

}

- (void)updateTrackingInTextStorage:(id)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  -[ICTextController updateAttachmentsInNote](self, "updateAttachmentsInNote");
  -[ICTextController updateTrackedAttributesInTextStorage:range:changeInLength:](self, "updateTrackedAttributesInTextStorage:range:changeInLength:", v9, location, length, a5);
  -[ICTextController ensureUniqueParagraphStyleUUIDsInTextStorage:range:](self, "ensureUniqueParagraphStyleUUIDsInTextStorage:range:", v9, 0, objc_msgSend(v9, "length"));

}

- (void)updateTrackedAttributesInTextStorage:(id)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  NSRange v9;
  NSUInteger v10;
  NSUInteger v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  void *v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSRange v21;
  NSUInteger v22;
  NSRange v23;
  NSRange v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  ICTextController *v44;
  NSUInteger v45;
  NSUInteger v46;
  _QWORD v47[4];
  id v48;
  ICTextController *v49;
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  const char *v55;
  __int128 v56;
  NSRange v57;
  NSRange v58;
  NSRange v59;
  NSRange v60;
  NSRange v61;
  NSRange v62;
  NSRange v63;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v52 = 0;
  v53 = &v52;
  v54 = 0x3010000000;
  v55 = "";
  v56 = xmmword_1ACA582A0;
  v60.length = objc_msgSend(v8, "length");
  v57.location = location;
  v57.length = length;
  v60.location = 0;
  v9 = NSIntersectionRange(v57, v60);
  v10 = v9.location;
  v11 = v9.length;
  if (!(v9.location + v9.length))
  {
    v12 = objc_msgSend(v8, "length");
    v11 = 0;
    if (location >= v12)
      v10 = v12;
    else
      v10 = location;
  }
  objc_msgSend(v8, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "paragraphRangeForRange:", v10, v11);
  v16 = v15;

  if (v14 + v16 < objc_msgSend(v8, "length"))
  {
    objc_msgSend(v8, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "paragraphRangeForRange:", v14 + v16, 0);
    v20 = v19;

    v58.location = v14;
    v58.length = v16;
    v61.location = v18;
    v61.length = v20;
    v21 = NSUnionRange(v58, v61);
    v14 = v21.location;
    v16 = v21.length;
  }
  v22 = ((1 - a5) & ~((1 - a5) >> 63)) + length;
  v59.location = location;
  v59.length = v22;
  v62.location = v14;
  v62.length = v16;
  v23 = NSUnionRange(v59, v62);
  v63.length = objc_msgSend(v8, "length");
  v63.location = 0;
  v24 = NSIntersectionRange(v23, v63);
  objc_opt_class();
  ICDynamicCast();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "beginSkippingTimestampUpdates");

  objc_msgSend(v8, "beginEditing");
  objc_msgSend(v8, "string");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke;
  v47[3] = &unk_1E5C219D0;
  v28 = v8;
  v48 = v28;
  v49 = self;
  v29 = v38;
  v50 = v29;
  v51 = &v52;
  objc_msgSend(v26, "ic_enumerateParagraphsInRange:usingBlock:", v24.location, v24.length, v47);

  if (a5 >= 1)
    -[ICTextController updateTrackedToDoParagraphsAfterIndex:byDelta:excludingSeenParagraphs:](self, "updateTrackedToDoParagraphsAfterIndex:byDelta:excludingSeenParagraphs:", v10, a5, v29);
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[ICTextController trackedToDoParagraphs](self, "trackedToDoParagraphs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v27;
  v40[1] = 3221225472;
  v40[2] = __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_3;
  v40[3] = &unk_1E5C219F8;
  v45 = location;
  v46 = v22;
  v32 = v29;
  v41 = v32;
  v33 = v30;
  v42 = v33;
  v34 = v28;
  v43 = v34;
  v44 = self;
  objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v40);

  -[ICTextController trackedToDoParagraphs](self, "trackedToDoParagraphs");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeObjectsForKeys:", v33);

  if (a5 < 0)
    -[ICTextController updateTrackedToDoParagraphsAfterIndex:byDelta:excludingSeenParagraphs:](self, "updateTrackedToDoParagraphsAfterIndex:byDelta:excludingSeenParagraphs:", v10, a5, v32);
  v36 = v53[4];
  if (v36 != 0x7FFFFFFFFFFFFFFFLL)
    -[ICTextController styleListsAndIndentsInAttributedString:inRange:](self, "styleListsAndIndentsInAttributedString:inRange:", v34, v36, v53[5]);
  objc_msgSend(v34, "endEditing");
  objc_opt_class();
  ICDynamicCast();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "endSkippingTimestampUpdates");

  _Block_object_dispose(&v52, 8);
}

- (void)uniqueParagraphStylesInTextStorage:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  char v21;
  unint64_t v22;
  char v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "paragraphRangeForRange:", location, length);
  v10 = v9;

  v36 = 0;
  v37 = 0;
  v31 = v10;
  v32 = v8;
  v30 = v8 + v10;
  if (v8 < v8 + v10)
  {
    v11 = v8;
    while (1)
    {
      objc_msgSend(v6, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0D63928], v11, &v36, v32, v31, v30);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "paragraphRangeForRange:", v36, v37);
      v16 = v15;

      objc_msgSend(v6, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "paragraphRangeForRange:", v36, 0);
      v20 = v36 == v18 && v37 == v19;
      v21 = v20;

      if (v12)
      {
        v22 = v14 + v16;
        if (objc_msgSend(v12, "uniqueToLine") && v11 < v22)
          break;
      }
LABEL_27:
      v11 = v14 + v16;

      if (v14 + v16 >= v30)
        goto LABEL_28;
    }
    v24 = 1;
    while (1)
    {
      v34 = 0;
      v35 = 0;
      v33 = 0;
      objc_msgSend(v6, "string");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "getParagraphStart:end:contentsEnd:forRange:", &v33, &v34, &v35, v11, 0);

      v34 -= v33;
      if (objc_msgSend(v12, "style") != 103)
        break;
      objc_msgSend(v12, "todo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        v27 = v21;
      else
        v27 = 1;
      if ((v27 & 1) != 0)
      {
        if (v26)
          break;
      }
      else if ((v24 & 1) != 0 && v35 != v33)
      {
        break;
      }
      v28 = (void *)objc_msgSend(v12, "mutableCopy");
      v29 = objc_alloc_init(MEMORY[0x1E0D63CC0]);
      objc_msgSend(v28, "setTodo:", v29);

      objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E0D63928], v28, v33, v34);
LABEL_26:
      v11 = v34 + v33;
      if (v34 + v33 >= v22)
        goto LABEL_27;
    }
    v24 = 0;
    goto LABEL_26;
  }
LABEL_28:

}

- (void)styleListsAndIndentsInAttributedString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ICTextController *v17;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = -[ICTextController numberListsInAttributedString:inRange:](self, "numberListsInAttributedString:inRange:", v7, location, length);
  v10 = v9;
  objc_opt_class();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginSkippingTimestampUpdates");

  v12 = *MEMORY[0x1E0D63928];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke;
  v15[3] = &unk_1E5C21AC0;
  v16 = v7;
  v17 = self;
  v14 = v7;
  objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v12, v8, v10, 0, v15);
  objc_opt_class();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endSkippingTimestampUpdates");

}

- (BOOL)shouldUpdateIndentFor:(id)a3
{
  return objc_msgSend(a3, "style") != 4;
}

- (void)setNote:(id)a3
{
  objc_storeWeak((id *)&self->_note, a3);
}

- (void)setMentionsController:(id)a3
{
  objc_storeWeak((id *)&self->_mentionsController, a3);
}

- (void)setHashtagController:(id)a3
{
  objc_storeWeak((id *)&self->_hashtagController, a3);
}

- (void)setAuthorHighlightsController:(id)a3
{
  objc_storeWeak((id *)&self->_authorHighlightsController, a3);
}

- (void)setAttachmentInsertionController:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentInsertionController, a3);
}

- (void)resetTrackedToDoParagraphs
{
  NSMutableDictionary *v3;
  NSMutableDictionary *trackedToDoParagraphs;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  trackedToDoParagraphs = self->_trackedToDoParagraphs;
  self->_trackedToDoParagraphs = v3;

}

- (void)refreshTextStylingForTextStorage:(id)a3 withTextController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "beginSkippingTimestampUpdates");
  objc_msgSend(v5, "updateTrackedAttributesInTextStorage:range:changeInLength:", v6, 0, objc_msgSend(v6, "length"), 0);
  objc_msgSend(v5, "ensureUniqueParagraphStyleUUIDsInTextStorage:range:", v6, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v5, "styleText:inRange:fixModelAttributes:", v6, 0, objc_msgSend(v6, "length"), 0);

  objc_msgSend(v6, "endSkippingTimestampUpdates");
}

- (_NSRange)numberListsInAttributedString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  int64_t location;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t *v24;
  id v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  unint64_t *v37;
  int64_t v38;
  NSUInteger v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  unint64_t v46;
  unint64_t *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  const char *v55;
  int64_t v56;
  NSUInteger v57;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3010000000;
  v55 = "";
  v56 = location;
  v57 = length;
  v7 = (uint64_t *)MEMORY[0x1E0D63928];
  v8 = location;
  if (location >= 1)
  {
    v9 = *MEMORY[0x1E0DC10F8];
    v8 = location;
    do
    {
      v46 = 0;
      v47 = 0;
      objc_msgSend(v6, "attribute:atIndex:longestEffectiveRange:inRange:", *v7, v8, &v46, 0, objc_msgSend(v6, "length"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        if (objc_msgSend(v10, "style") != 102
          && (!objc_msgSend(v11, "isList") || !objc_msgSend(v11, "indent")))
        {
          goto LABEL_22;
        }
        if (v46)
          v8 = v46 - 1;
        else
          v8 = 0;
      }
      else
      {
        v12 = v46;
        for (i = v8; i > v46; i = v15 ? v15 - 1 : 0)
        {
          objc_msgSend(v6, "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "paragraphRangeForRange:", i, 0);

          objc_msgSend(v6, "attribute:atIndex:effectiveRange:", v9, v15, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v46;
          if (!v16)
            break;
        }
        v17 = v12 - 1;
        if (!v12)
          v17 = 0;
        if (i > v12)
        {
LABEL_22:

          break;
        }
        v8 = v17;
      }

    }
    while (v8 > 0);
  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x3010000000;
  v50 = 0;
  v51 = 0;
  v49 = "";
  v18 = objc_msgSend(v6, "length");
  v50 = v8;
  v51 = (v18 - v8) & ~((v18 - v8) >> 63);
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__46;
  v44 = __Block_byref_object_dispose__46;
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)v41[5], "addObject:", &unk_1E5C71E50);
  v19 = *v7;
  v20 = objc_msgSend(v6, "length") - v8;
  v21 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __58__ICTextController_numberListsInAttributedString_inRange___block_invoke;
  v33[3] = &unk_1E5C21AE8;
  v35 = &v40;
  v22 = v6;
  v34 = v22;
  v36 = &v52;
  v38 = location;
  v39 = length;
  v37 = &v46;
  objc_msgSend(v22, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v19, v8, v20, 0, v33);
  objc_msgSend((id)v41[5], "removeAllObjects");
  v23 = *MEMORY[0x1E0D63D40];
  v24 = v47;
  v30[0] = v21;
  v30[1] = 3221225472;
  v30[2] = __58__ICTextController_numberListsInAttributedString_inRange___block_invoke_2;
  v30[3] = &unk_1E5C21B10;
  v25 = v22;
  v31 = v25;
  v32 = &v40;
  objc_msgSend(v25, "enumerateAttribute:inRange:options:usingBlock:", v23, v24[4], v24[5], 2, v30);
  v26 = v53[4];
  v27 = v53[5];

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  v28 = v26;
  v29 = v27;
  result.length = v29;
  result.location = v28;
  return result;
}

- (ICNote)note
{
  return (ICNote *)objc_loadWeakRetained((id *)&self->_note);
}

- (ICTextController)init
{
  ICTextController *v2;
  ICTextController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICTextController;
  v2 = -[ICTTTextController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_userChangedWritingDirection = 0;
    -[ICTextController resetTrackedToDoParagraphs](v2, "resetTrackedToDoParagraphs");
  }
  return v3;
}

- (void)fixTextStorage:(id)a3 afterProcessingEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  length = a5.length;
  location = a5.location;
  v11 = a3;
  objc_msgSend(v11, "beginEditing");
  objc_msgSend(v11, "setDisableUndoCoalesceBreaking:", 1);
  v18 = 0;
  v12 = -[ICTextController cleanupTextStorage:afterProcessingEditing:range:changeInLength:changeInLengthAfterCleanup:](self, "cleanupTextStorage:afterProcessingEditing:range:changeInLength:changeInLengthAfterCleanup:", v11, a4, location, length, a6, &v18);
  v14 = v13;
  if (-[ICTextController disableAddingExtraLinesIfNeeded](self, "disableAddingExtraLinesIfNeeded"))
  {
    v15 = v18;
  }
  else
  {
    v17 = 0;
    v12 = -[ICTextController addExtraLinesIfNeededToTextStorage:editedRange:actualLengthIncrease:](self, "addExtraLinesIfNeededToTextStorage:editedRange:actualLengthIncrease:", v11, v12, v14, &v17);
    v14 = v16;
    v15 = v18 + v17;
    v18 += v17;
  }
  -[ICTextController updateTrackingInTextStorage:range:changeInLength:](self, "updateTrackingInTextStorage:range:changeInLength:", v11, v12, v14, v15);
  objc_msgSend(v11, "setDisableUndoCoalesceBreaking:", 0);
  objc_msgSend(v11, "endEditing");

}

- (void)fixModelAttributesInTextStorage:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  _QWORD *v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  NSUInteger v36;
  uint64_t v37;
  NSUInteger v38;
  uint64_t v39;
  uint64_t v40;
  NSRange v41;
  NSRange v42;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v36 = objc_msgSend(v6, "beforeEndEditedRange");
  objc_msgSend(v6, "beginEditing");
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "paragraphRangeForRange:", location, length);
  v10 = v9;

  v41.location = 0;
  v41.length = 0;
  v11 = v8 + v10;
  if (v8 < v8 + v10)
  {
    v12 = (_QWORD *)MEMORY[0x1E0D63928];
    v37 = *MEMORY[0x1E0DC10F8];
    v13 = v8;
    v34 = v10;
    do
    {
      objc_msgSend(v6, "attribute:atIndex:longestEffectiveRange:inRange:", *v12, v13, &v41, v8, v10, v34);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v42.length = v11 - v13;
      v42.location = v13;
      v41 = NSIntersectionRange(v41, v42);
      v39 = 0;
      v40 = 0;
      v38 = 0;
      objc_msgSend(v6, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "getParagraphStart:end:contentsEnd:forRange:", &v39, &v40, &v38, v41.location, v41.length);

      v40 -= v39;
      objc_msgSend(v6, "attribute:atIndex:effectiveRange:", v37, v13, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ICProtocolCast();
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        v18 = objc_msgSend(MEMORY[0x1E0D63C60], "isInlineAttachment:", v17) ^ 1;
      else
        v18 = 0;
      v20 = v39 == v41.location && v40 == v41.length;
      if ((v18 & 1) != 0 || v20)
      {
        if (v18)
        {
          objc_opt_class();
          ICDynamicCast();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "attachment");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isTable");

          if (v32 && v14)
          {
            v33 = (void *)objc_msgSend(v14, "mutableCopy");
            objc_msgSend(v33, "setStyle:", 3);
            objc_msgSend(v6, "addAttribute:value:range:", *v12, v33, v39, v40);

          }
        }
      }
      else
      {
        if (v41.location >= v36 && v41.length + v41.location < v38)
        {
          objc_msgSend(v6, "string");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "paragraphRangeForRange:", v38, 0);
          v24 = v23;

          objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *v12, v38, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            v27 = v12;
            v28 = v25;

            v39 = v22;
            v40 = v24;
            v14 = v28;
            v12 = v27;
            v10 = v34;
          }

        }
        v29 = *v12;
        if (v14)
          objc_msgSend(v6, "addAttribute:value:range:", v29, v14, v39, v40);
        else
          objc_msgSend(v6, "removeAttribute:range:", v29, v39, v40);
      }
      v13 = v40 + v39;

    }
    while (v13 < v11);
  }
  -[ICTextController uniqueParagraphStylesInTextStorage:inRange:](self, "uniqueParagraphStylesInTextStorage:inRange:", v6, v8, v10);
  objc_msgSend(v6, "endEditing");

}

- (BOOL)disableAddingExtraLinesIfNeeded
{
  return self->_disableAddingExtraLinesIfNeeded;
}

- (_NSRange)cleanupTextStorage:(id)a3 afterProcessingEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 changeInLengthAfterCleanup:(int64_t *)a7
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  unint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  int v21;
  void *v22;
  unint64_t v23;
  unint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  int64_t v35;
  void *v36;
  NSUInteger v37;
  NSUInteger v38;
  int64_t *v39;
  NSUInteger v40;
  uint64_t v42;
  unint64_t v43;
  _NSRange result;

  length = a5.length;
  location = a5.location;
  v11 = a3;
  v42 = 0;
  v43 = 0;
  if (objc_msgSend(v11, "length"))
  {
    v39 = a7;
    v40 = location;
    v12 = 0;
    v13 = 0;
    v14 = (_QWORD *)MEMORY[0x1E0D63928];
    do
    {
      v15 = v12;
      objc_msgSend(v11, "attribute:atIndex:longestEffectiveRange:inRange:", *v14, v13, &v42, 0, objc_msgSend(v11, "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "needsParagraphCleanup"))
      {
        objc_msgSend(v11, "string");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "paragraphRangeForRange:", v42, v43);
        v19 = v18;

        if (v17 == v42 && v19 == v43)
        {
          v20 = (id)objc_msgSend(v12, "mutableCopy");
          objc_msgSend(v20, "setNeedsParagraphCleanup:", 0);
          objc_msgSend(v11, "addAttribute:value:range:", *v14, v20, v42, v43);
        }
        else
        {
          v20 = v11;
          v21 = objc_msgSend(v20, "convertAttributes");
          objc_msgSend(v20, "setConvertAttributes:", 0);
          objc_msgSend(v20, "removeAttribute:range:", *v14, v42, v43);
          -[ICTTTextController styleText:inExactRange:fixModelAttributes:](self, "styleText:inExactRange:fixModelAttributes:", v20, v42, v43, 1);
          if (v21)
            objc_msgSend(v20, "setConvertAttributes:", 1);
        }

      }
      if (objc_msgSend(v12, "isList") && objc_msgSend(v12, "needsListCleanup"))
      {
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^\t\\S+?\t"), 0, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v42;
        for (i = v43 + v42; v23 < i; i = v33 + v42)
        {
          objc_msgSend(v11, "string");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "paragraphRangeForRange:", v23, 0);
          v28 = v27;

          objc_msgSend(v11, "string");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v22, "rangeOfFirstMatchInString:options:range:", v29, 4, v26, v28);
          v32 = v31;

          if (v30 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v23 = v26 + v28;
            v33 = v43;
          }
          else
          {
            objc_msgSend(v11, "deleteCharactersInRange:", v30, v32);
            if (v43 >= v32)
              v34 = v32;
            else
              v34 = v43;
            v33 = v43 - v34;
            v43 -= v34;
            length -= v34;
            v35 = (a6 - v34) & ~((uint64_t)(a6 - v34) >> 63);
            if (a6 > 0)
              a6 = v35;
            v23 = v26 + v28 - v32;
          }
        }
        v36 = (void *)objc_msgSend(v12, "mutableCopy");
        objc_msgSend(v36, "setNeedsListCleanup:", 0);
        v14 = (_QWORD *)MEMORY[0x1E0D63928];
        objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0D63928], v36, v42, v43);

      }
      v13 = v43 + v42;
    }
    while (v13 < objc_msgSend(v11, "length"));

    a7 = v39;
    location = v40;
  }
  *a7 = a6;

  v37 = location;
  v38 = length;
  result.length = v38;
  result.location = v37;
  return result;
}

- (BOOL)canChangeStyleForSelectedRanges:(id)a3 inTextStorage:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke;
  v10[3] = &unk_1E5C215F0;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (double)indentForStyle:(id)a3 range:(_NSRange)a4 attributedString:(id)a5 textView:(id)a6
{
  NSUInteger location;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  unint64_t v26;

  location = a4.location;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "style") == 103)
  {
    if (ICInternalSettingsIsTextKit2Enabled()
      && (objc_msgSend(v12, "textLayoutManager"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      v14 = 36.0 * (double)(unint64_t)objc_msgSend(v10, "indent");
    }
    else
    {
      v14 = (double)(unint64_t)objc_msgSend(v10, "indent") * 36.0 + 36.0;
    }
    goto LABEL_26;
  }
  if (!objc_msgSend(v10, "indent"))
  {
    v14 = 0.0;
    if (!objc_msgSend(v10, "isList"))
      goto LABEL_26;
  }
  if (location >= objc_msgSend(v11, "length"))
  {
    if (v12)
    {
      objc_msgSend(v12, "typingAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyText");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], location, 0);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v15;
LABEL_14:
  v18 = 0.0;
  if (objc_msgSend(v10, "style") == 102 && location <= objc_msgSend(v11, "length"))
  {
    v19 = *MEMORY[0x1E0D63D08];
    v20 = objc_msgSend(v11, "length");
    if (location)
      v21 = location >= v20;
    else
      v21 = 0;
    v22 = v21;
    objc_msgSend(v11, "attribute:atIndex:effectiveRange:", v19, location - v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "extraBulletWidthForNumberedListWithMaxItemNumber:textFont:", v23, v17);
    v18 = v24;

  }
  objc_msgSend(v12, "textLayoutManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v10, "indent");
  if (!v25)
    v26 += objc_msgSend(v10, "isList");
  v14 = v18 + (double)v26 * 36.0;

LABEL_26:
  return v14;
}

- (void)convertNSTablesToICTables:(id)a3 pasteboardTypes:(id)a4 filterPastedAttributes:(BOOL)a5 isReadingSelectionFromPasteboard:(BOOL)a6
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  ICTextController *v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  _BOOL4 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v6 = a6;
  v35 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!-[ICTextController isConvertingTables](self, "isConvertingTables"))
  {
    -[ICTextController setIsConvertingTables:](self, "setIsConvertingTables:", 1);
    v30 = v10;
    if (objc_msgSend(v10, "containsObject:", CFSTR("SFVNativePBMetaDataPBType09")))
      -[ICTextController workAroundSageTables:](self, "workAroundSageTables:", v9);
    if (objc_msgSend(v9, "ic_numberOfTables"))
    {
      v34 = *MEMORY[0x1E0DC10F8];
      v32 = v6;
      v31 = self;
      do
      {
        v44 = 0;
        v45 = 0;
        v11 = v9;
        objc_msgSend(v9, "ic_nextTableStringFromIndex:tableRange:", 0, &v44);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ic_textTablesInRange:", 0, objc_msgSend(v12, "length"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v33 = v13;
        objc_msgSend(v13, "reverseObjectEnumerator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v41 != v18)
                objc_enumerationMutation(v15);
              -[ICTextController addTableAttachmentWithNSTextTable:attributedString:filterPastedAttributes:isReadingSelectionFromPasteboard:](self, "addTableAttachmentWithNSTextTable:attributedString:filterPastedAttributes:isReadingSelectionFromPasteboard:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), v12, v35, v6);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
                objc_msgSend(v14, "addObject:", v20);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
          }
          while (v17);
        }

        v9 = v11;
        objc_msgSend(v11, "deleteCharactersInRange:", v44, v45);
        v21 = v44;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v22 = v14;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v37 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = (void *)objc_msgSend(v28, "mutableCopy");

              objc_msgSend(v29, "addAttribute:value:range:", v34, v27, 0, objc_msgSend(v29, "length"));
              v9 = v11;
              objc_msgSend(v11, "insertAttributedString:atIndex:", v29, v21);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          }
          while (v24);
        }

        v6 = v32;
        self = v31;
      }
      while (objc_msgSend(v9, "ic_numberOfTables"));
    }
    -[ICTextController setIsConvertingTables:](self, "setIsConvertingTables:", 0);
    v10 = v30;
  }

}

- (void)workAroundSageTables:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "ic_numberOfTables"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "length");
    v6 = 0;
    do
    {
      v7 = objc_msgSend(v3, "ic_rangeofNextTableFromIndex:", v6);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v9 = v7;
      v10 = v8;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v11);

      v6 = v9 + v10;
    }
    while (v9 + v10 < v5);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v4, "reverseObjectEnumerator", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16), "rangeValue");
          v19 = v17 + v18;
          if (v17 + v18 + 1 <= (unint64_t)objc_msgSend(v3, "length"))
          {
            objc_msgSend(v3, "attributedSubstringFromRange:", v19, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "string");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v21, "characterAtIndex:", 0) == 10)
              objc_msgSend(v3, "deleteCharactersInRange:", v19, 1);

          }
          if (v17)
          {
            v22 = v17 - 1;
            objc_msgSend(v3, "attributedSubstringFromRange:", v22, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "string");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v24, "characterAtIndex:", 0) == 10)
              objc_msgSend(v3, "deleteCharactersInRange:", v22, 1);

          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

  }
}

- (id)addTableAttachmentWithNSTextTable:(id)a3 attributedString:(id)a4 filterPastedAttributes:(BOOL)a5 isReadingSelectionFromPasteboard:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v29;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v29 = 0;
  v12 = objc_msgSend(v11, "ic_numRowsForTextTable:outNumColumns:", v10, &v29);
  v13 = 0;
  if (v12 && v29)
  {
    v14 = v12;
    -[ICTextController note](self, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentReplicaID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

    v20 = objc_alloc(MEMORY[0x1E0D63CD8]);
    v21 = (void *)objc_msgSend(v20, "initWithColumnCount:rowCount:replicaID:", v29, v14, v19);
    objc_msgSend(v21, "table");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextController p_populateTable:withNSTextTable:attributedString:filterPastedAttributes:isReadingSelectionFromPasteboard:](self, "p_populateTable:withNSTextTable:attributedString:filterPastedAttributes:isReadingSelectionFromPasteboard:", v22, v10, v11, v7, v6);
    objc_msgSend(v21, "serialize");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextController note](self, "note");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[ICTextController note](self, "note");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addTableAttachmentWithTableData:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "updateChangeCountWithReason:", CFSTR("Created table from text table"));
      +[ICTextAttachment textAttachmentWithAttachment:](ICTextAttachment, "textAttachmentWithAttachment:", v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = objc_alloc(MEMORY[0x1E0DC12B0]);
      v13 = (void *)objc_msgSend(v27, "initWithData:ofType:", v23, *MEMORY[0x1E0D636B8]);
    }

  }
  return v13;
}

- (void)p_populateTable:(id)a3 withNSTextTable:(id)a4 attributedString:(id)a5 filterPastedAttributes:(BOOL)a6 isReadingSelectionFromPasteboard:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  ICTextController *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v7 = a6;
  v53 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v11 = a4;
  v12 = a5;
  v38 = objc_msgSend(v12, "length");
  if (v38)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v36 = v12;
    v37 = *MEMORY[0x1E0DC1178];
    while (1)
    {
      v50 = 0;
      v51 = 0;
      objc_msgSend(v12, "attribute:atIndex:effectiveRange:", v37, v13, &v50);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textBlocks");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count"))
        break;
      objc_msgSend(v12, "attributedSubstringFromRange:", v50, v51);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v35) = a7;
      v14 = -[ICTextController p_setCellsInTable:fromAttributedString:textTable:atCellOffset:filterPastedAttributes:isReadingSelectionFromPasteboard:](self, "p_setCellsInTable:fromAttributedString:textTable:atCellOffset:filterPastedAttributes:isReadingSelectionFromPasteboard:", v45, v33, 0, v14, v15, v7, v35);
      v15 = v34;
      v13 = v51 + v50;
LABEL_18:

      if (v13 >= v38)
        goto LABEL_19;
    }
    v42 = v17;
    v43 = v16;
    objc_msgSend(v17, "objectAtIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "table");
    v19 = objc_claimAutoreleasedReturnValue();

    v41 = (void *)v19;
    v20 = objc_msgSend(v12, "rangeOfTextTable:atIndex:", v19, v50);
    v39 = v21;
    v40 = v20;
    objc_msgSend(v12, "attributedSubstringFromRange:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ic_textTablesInRange:", 0, objc_msgSend(v22, "length"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (!v24)
      goto LABEL_16;
    v25 = v24;
    v26 = *(_QWORD *)v47;
LABEL_6:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v26)
        objc_enumerationMutation(v23);
      v28 = *(id *)(*((_QWORD *)&v46 + 1) + 8 * v27);
      if (!v11)
        break;
      if (v28 == v11)
      {
        LOBYTE(v35) = a7;
        v29 = self;
        v30 = v45;
        v31 = v22;
        v28 = v11;
LABEL_13:
        v14 = -[ICTextController p_setCellsInTable:fromAttributedString:textTable:atCellOffset:filterPastedAttributes:isReadingSelectionFromPasteboard:](v29, "p_setCellsInTable:fromAttributedString:textTable:atCellOffset:filterPastedAttributes:isReadingSelectionFromPasteboard:", v30, v31, v28, v14, v15, v7, v35);
        v15 = v32;
      }
      if (v25 == ++v27)
      {
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        if (!v25)
        {
LABEL_16:
          v13 = v40 + v39;

          v12 = v36;
          v17 = v42;
          v16 = v43;
          v33 = v41;
          goto LABEL_18;
        }
        goto LABEL_6;
      }
    }
    LOBYTE(v35) = a7;
    v29 = self;
    v30 = v45;
    v31 = v22;
    goto LABEL_13;
  }
LABEL_19:

}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)p_setCellsInTable:(id)a3 fromAttributedString:(id)a4 textTable:(id)a5 atCellOffset:(id)a6 filterPastedAttributes:(BOOL)a7 isReadingSelectionFromPasteboard:(BOOL)a8
{
  _BOOL4 v8;
  unint64_t var1;
  unint64_t var0;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  ICTextController *v34;
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  BOOL v41;
  BOOL v42;
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[4];
  uint64_t v46;
  uint64_t v47;
  _QWORD aBlock[7];
  _QWORD v49[3];
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v8 = a7;
  var1 = a6.var1;
  var0 = a6.var0;
  v29 = a3;
  v14 = a4;
  v15 = a5;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3010000000;
  v61 = 0;
  v62 = 0;
  v60 = "";
  v51 = 0;
  v52 = &v51;
  v53 = 0x3010000000;
  v55 = 0;
  v56 = 0;
  v54 = "";
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v50 = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __156__ICTextController_ICTableAdditions__p_setCellsInTable_fromAttributedString_textTable_atCellOffset_filterPastedAttributes_isReadingSelectionFromPasteboard___block_invoke;
  aBlock[3] = &unk_1E5C1FAA0;
  aBlock[4] = v49;
  aBlock[5] = &v57;
  aBlock[6] = &v51;
  v16 = _Block_copy(aBlock);
  v46 = 0;
  v47 = 0;
  v17 = *MEMORY[0x1E0DC1178];
  objc_msgSend(v14, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1178], 0, &v46);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v8;
  objc_msgSend(v18, "textBlocks");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count"))
  {
    v19 = var0;
    v20 = objc_msgSend(v14, "length");
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v45[3] = 0x7FFFFFFFFFFFFFFFLL;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v44[3] = 0x7FFFFFFFFFFFFFFFLL;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v43[3] = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __156__ICTextController_ICTableAdditions__p_setCellsInTable_fromAttributedString_textTable_atCellOffset_filterPastedAttributes_isReadingSelectionFromPasteboard___block_invoke_2;
    v30[3] = &unk_1E5C1FAC8;
    v31 = v15;
    v39 = var0;
    v40 = var1;
    v32 = v29;
    v35 = v16;
    v36 = v44;
    v37 = v45;
    v38 = v43;
    v33 = v14;
    v34 = self;
    v41 = v28;
    v42 = a8;
    objc_msgSend(v33, "enumerateAttribute:inRange:options:usingBlock:", v17, 0, v20, 0, v30);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(v45, 8);
  }
  else
  {
    (*((void (**)(void *, unint64_t, uint64_t, unint64_t, uint64_t))v16 + 2))(v16, var0, 1, var1, 1);
    objc_msgSend(v14, "attributedSubstringFromRange:", v46, v47);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = a8;
    -[ICTextController updateCellInTable:atColumnIndex:rowIndex:fromAttributedString:andTextTableBlock:filterPastedAttributes:isReadingSelectionFromPasteboard:](self, "updateCellInTable:atColumnIndex:rowIndex:fromAttributedString:andTextTableBlock:filterPastedAttributes:isReadingSelectionFromPasteboard:", v29, var0, var1, v21, 0, v8, v26);
    v19 = var0;

  }
  v22 = v52[5];
  if (v58[5] && v22)
  {
    v23 = var1 + 1;
  }
  else
  {
    v19 = 0;
    v23 = v22 + v52[4];
  }

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  v24 = v19;
  v25 = v23;
  result.var1 = v25;
  result.var0 = v24;
  return result;
}

void __156__ICTextController_ICTableAdditions__p_setCellsInTable_fromAttributedString_textTable_atCellOffset_filterPastedAttributes_isReadingSelectionFromPasteboard___block_invoke(int a1, NSRange range2, uint64_t a3, NSUInteger a4)
{
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger length;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger location;
  NSRange v20;
  uint64_t v21;
  NSRange v22;

  v6 = v5;
  length = range2.length;
  range2.length = range2.location;
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(v8 + 32) + 8);
  if (*(_BYTE *)(v10 + 24))
  {
    *(_BYTE *)(v10 + 24) = 0;
    v12 = *(_QWORD *)(*(_QWORD *)(v11 + 40) + 8);
    *(_QWORD *)(v12 + 32) = range2.location;
    *(_QWORD *)(v12 + 40) = v13;
    v14 = v11 + 48;
  }
  else
  {
    v16 = *(_QWORD *)(*(_QWORD *)(v15 + 40) + 8);
    v17 = *(_QWORD *)(v16 + 32);
    range2.location = *(_QWORD *)(v16 + 40);
    *(NSRange *)(*(_QWORD *)(*(_QWORD *)(v9 + 40) + 8) + 32) = NSUnionRange(range2, *(NSRange *)&range2.length);
    v18 = *(_QWORD *)(v9 + 48);
    v14 = v9 + 48;
    v22.location = v6;
    v22.length = a4;
    v20 = NSUnionRange(*(NSRange *)(*(_QWORD *)(v18 + 8) + 32), v22);
    location = v20.location;
    v6 = v20.location;
    a4 = v20.length;
  }
  v21 = *(_QWORD *)(*(_QWORD *)v14 + 8);
  *(_QWORD *)(v21 + 32) = v6;
  *(_QWORD *)(v21 + 40) = a4;
}

void __156__ICTextController_ICTableAdditions__p_setCellsInTable_fromAttributedString_textTable_atCellOffset_filterPastedAttributes_isReadingSelectionFromPasteboard___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  objc_msgSend(a2, "textBlocks");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    v8 = objc_msgSend(v5, "startingColumn");
    v9 = *(_QWORD *)(a1 + 96);
    v10 = *(_QWORD *)(a1 + 104) + objc_msgSend(v5, "startingRow");
    v11 = v10 + objc_msgSend(v5, "rowSpan");
    if (v11 <= objc_msgSend(*(id *)(a1 + 40), "rowCount"))
    {
      v12 = v9 + v8;
      v13 = objc_msgSend(v5, "columnSpan") + v12;
      if (v13 <= objc_msgSend(*(id *)(a1 + 40), "columnCount"))
      {
        objc_msgSend(v5, "columnSpan");
        objc_msgSend(v5, "rowSpan");
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == v10)
        {
          v15 = a3;
          if (*(_QWORD *)(v14 + 24) == v12)
            v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
        }
        else
        {
          v15 = a3;
        }
        *(_QWORD *)(v14 + 24) = v12;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v10;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v15;
        objc_msgSend(*(id *)(a1 + 48), "attributedSubstringFromRange:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "ic_stringByTrimmingLeadingTrailingWhitespace");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v18) = *(_BYTE *)(a1 + 113);
        objc_msgSend(*(id *)(a1 + 56), "updateCellInTable:atColumnIndex:rowIndex:fromAttributedString:andTextTableBlock:filterPastedAttributes:isReadingSelectionFromPasteboard:", *(_QWORD *)(a1 + 40), v12, v10, v17, v5, *(unsigned __int8 *)(a1 + 112), v18);

      }
    }
  }

}

- (void)updateCellInTable:(id)a3 atColumnIndex:(unint64_t)a4 rowIndex:(unint64_t)a5 fromAttributedString:(id)a6 andTextTableBlock:(id)a7 filterPastedAttributes:(BOOL)a8 isReadingSelectionFromPasteboard:(BOOL)a9
{
  _BOOL8 v9;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a8;
  v17 = a3;
  v14 = a6;
  v15 = v14;
  if (objc_msgSend(v14, "containsAttachmentsInRange:", 0, objc_msgSend(v14, "length")))
  {
    objc_msgSend(v14, "ic_stringWithoutAttachments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v17, "textStorageForCellAtColumnIndex:rowIndex:", a4, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStyler:", self);
  objc_msgSend(v16, "setFilterPastedAttributes:", v9);
  objc_msgSend(v16, "setIsReadingSelectionFromPasteboard:", a9);
  objc_msgSend(v16, "setConvertAttributes:", 1);
  objc_msgSend(v16, "setIsReadingSelectionFromPasteboard:", 1);
  objc_msgSend(v16, "setWantsUndoCommands:", 0);
  objc_msgSend(v16, "beginEditing");
  objc_msgSend(v16, "replaceCharactersInRange:withAttributedString:", 0, objc_msgSend(v16, "length"), v15);
  objc_msgSend(v16, "endEditing");
  objc_msgSend(v16, "fixupAfterEditing");

}

- (unsigned)paragraphStyleForRange:(_NSRange)a3 inTextView:(id)a4 inTextStorage:(id)a5 ignoreTypingAttributes:(BOOL)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unint64_t v16;

  length = a3.length;
  location = a3.location;
  v10 = a5;
  v11 = v10;
  if (length || !a4 || a6)
  {
    objc_msgSend(v10, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "paragraphRangeForRange:", location, length);

    if (v16 >= objc_msgSend(v11, "length"))
    {
      v14 = 3;
      goto LABEL_11;
    }
    objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v16, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_5;
LABEL_8:
    v14 = 3;
    goto LABEL_9;
  }
  objc_msgSend(a4, "typingAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_8;
LABEL_5:
  v14 = objc_msgSend(v13, "style");
LABEL_9:

LABEL_11:
  return v14;
}

- (unsigned)paragraphStyleForRange:(_NSRange)a3 inTextView:(id)a4 inTextStorage:(id)a5
{
  return -[ICTextController paragraphStyleForRange:inTextView:inTextStorage:ignoreTypingAttributes:](self, "paragraphStyleForRange:inTextView:inTextStorage:ignoreTypingAttributes:", a3.location, a3.length, a4, a5, 0);
}

- (int64_t)writingDirectionForRange:(_NSRange)a3 inTextView:(id)a4 inTextStorage:(id)a5
{
  NSUInteger location;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;

  location = a3.location;
  v7 = a4;
  v8 = a5;
  if (location >= objc_msgSend(v8, "length"))
  {
    objc_msgSend(v7, "typingAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], location, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_msgSend(v9, "writingDirection");

  return v11;
}

- (BOOL)attachmentsExistInRange:(_NSRange)a3 textStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7 = *MEMORY[0x1E0DC10F8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ICTextController_attachmentsExistInRange_textStorage___block_invoke;
  v9[3] = &unk_1E5C1EEC8;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v7, location, length, 0x100000, v9);
  LOBYTE(length) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return length;
}

void __56__ICTextController_attachmentsExistInRange_textStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  char isKindOfClass;

  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (BOOL)canIndentTextView:(id)a3 byDelta:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(v6, "ic_selectedRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[ICTextController canIndentTextView:byDelta:forRanges:](self, "canIndentTextView:byDelta:forRanges:", v6, a4, v7);

  return a4;
}

- (BOOL)canIndentTextView:(id)a3 byDelta:(int64_t)a4 forRanges:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  BOOL v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v36 = a5;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v36;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (!v31)
      goto LABEL_35;
    v33 = *(_QWORD *)v44;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(obj);
        v32 = v9;
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v9);
        objc_msgSend(v8, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "rangeValue");
        v14 = objc_msgSend(v11, "ic_rangeIsValid:", v12, v13);

        if (v14)
        {
          objc_msgSend(v8, "string");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v10, "rangeValue");
          v18 = objc_msgSend(v15, "paragraphRangeForRange:", v16, v17);
          v20 = v19;

        }
        else
        {
          v20 = 0;
          v18 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (-[ICTextController attachmentsExistInRange:textStorage:](self, "attachmentsExistInRange:textStorage:", v18, v20, v8))
        {
          *((_BYTE *)v48 + 24) = 0;
          goto LABEL_35;
        }
        v21 = v18;
        while (1)
        {
          v41 = v21;
          v42 = 1;
          if (v21 >= objc_msgSend(v8, "length"))
          {
            objc_msgSend(v7, "typingAttributes");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0D63928], v21, &v41, v18, v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (v22)
          {
            if (objc_msgSend(v22, "canIndent") && (a4 > 0 || a4 < 0 && objc_msgSend(v22, "indent")))
              goto LABEL_24;
          }
          else if (a4 >= 1)
          {
            goto LABEL_24;
          }
          if (objc_msgSend(v22, "style") == 4)
          {
            if (a4 < 1)
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "string");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v37[0] = MEMORY[0x1E0C809B0];
              v37[1] = 3221225472;
              v37[2] = __56__ICTextController_canIndentTextView_byDelta_forRanges___block_invoke;
              v37[3] = &unk_1E5C214D8;
              v28 = v26;
              v38 = v28;
              v39 = v8;
              v40 = &v47;
              objc_msgSend(v27, "ic_enumerateParagraphsInRange:usingBlock:", v41, v42, v37);

              goto LABEL_25;
            }
LABEL_24:
            *((_BYTE *)v48 + 24) = 1;
          }
LABEL_25:
          v24 = v41;
          v25 = v42;

          v21 = v25 + v24;
          if (v21 >= v18 + v20 || v21 <= v18)
            break;
          if (*((_BYTE *)v48 + 24))
            goto LABEL_35;
        }
        if (*((_BYTE *)v48 + 24))
          goto LABEL_35;
        ++v9;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (!v31)
      {
LABEL_35:

        break;
      }
    }
  }
  v29 = *((_BYTE *)v48 + 24) != 0;

  _Block_object_dispose(&v47, 8);
  return v29;
}

void __56__ICTextController_canIndentTextView_byDelta_forRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a2) = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", a2));

  if ((_DWORD)a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (a5)
      *a5 = 1;
  }
}

- (id)indentParagraphStyle:(id)a3 byAmount:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    if (objc_msgSend(v5, "canIndent"))
    {
      v8 = (void *)objc_msgSend(v6, "mutableCopy");
      v9 = objc_msgSend(v8, "indent") + a4;
      if (v9 < 0)
      {
        objc_msgSend(MEMORY[0x1E0D63C90], "paragraphStyleNamed:", 3);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v8, "setIndent:", v9);
        v10 = v8;
      }
      v7 = v10;

    }
  }
  else if (a4 < 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D63C90], "paragraphStyleNamed:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIndent:", a4);
  }

  return v7;
}

- (void)indentRange:(_NSRange)a3 byAmount:(int64_t)a4 inTextStorage:(id)a5 textView:(id)a6
{
  -[ICTextController indentRange:byAmount:inTextStorage:textView:forceUpdateAttributes:](self, "indentRange:byAmount:inTextStorage:textView:forceUpdateAttributes:", a3.location, a3.length, a4, a5, a6, 0);
}

- (void)indentRange:(_NSRange)a3 byAmount:(int64_t)a4 inTextStorage:(id)a5 textView:(id)a6 forceUpdateAttributes:(BOOL)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  ICTextController *v19;
  id v20;
  int64_t v21;
  NSUInteger v22;
  ICTextController *v23;
  int64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  _BOOL4 v45;
  NSUInteger v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  int64_t v52;
  _QWORD v53[5];
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  int64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;

  v45 = a7;
  length = a3.length;
  location = a3.location;
  v12 = a5;
  v47 = a6;
  objc_msgSend(v12, "beginEditing");
  objc_msgSend(v12, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = location;
  v46 = length;
  v14 = objc_msgSend(v13, "paragraphRangeForRange:", location, length);
  v16 = v15;

  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__46;
  v68 = __Block_byref_object_dispose__46;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v69 = (id)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__46;
  v62 = __Block_byref_object_dispose__46;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (id)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = *MEMORY[0x1E0D63928];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke;
  v53[3] = &unk_1E5C21528;
  v19 = self;
  v53[4] = self;
  v20 = v12;
  v54 = v20;
  v55 = &v64;
  v21 = a4;
  v56 = &v58;
  v57 = a4;
  objc_msgSend(v20, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v18, v14, v16, 0, v53);
  v22 = v46;
  v23 = v19;
  v24 = a4;
  if ((objc_msgSend((id)v65[5], "count") || objc_msgSend((id)v59[5], "count"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v20, "mergeableString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "ic_selectedRanges");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "selectionForCharacterRanges:selectionAffinity:", v26, v21 > 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }
  v28 = (void *)v65[5];
  v50[0] = v17;
  v50[1] = 3221225472;
  v50[2] = __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_3;
  v50[3] = &unk_1E5C21550;
  v52 = v24;
  v29 = v20;
  v51 = v29;
  objc_msgSend(v28, "enumerateIndexesWithOptions:usingBlock:", 2, v50);
  v30 = (void *)v59[5];
  v48[0] = v17;
  v48[1] = 3221225472;
  v48[2] = __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_4;
  v48[3] = &unk_1E5C21578;
  v31 = v29;
  v49 = v31;
  objc_msgSend(v30, "enumerateObjectsWithOptions:usingBlock:", 2, v48);
  objc_msgSend(v31, "endEditing");
  if (!v46 || v45)
  {
    objc_msgSend(v47, "typingAttributes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextController indentParagraphStyle:byAmount:](v23, "indentParagraphStyle:byAmount:", v38, v24);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39 != v38)
    {
      v40 = (void *)objc_msgSend(v37, "mutableCopy");
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0D63928]);
      if (v44 >= objc_msgSend(v31, "length") && objc_msgSend(v31, "length"))
      {
        v22 = 0;
        v44 = objc_msgSend(v31, "length") - 1;
      }
      -[ICTextController nsParagraphStyleForICTTParagraphStyle:range:attributedString:textView:](v23, "nsParagraphStyleForICTTParagraphStyle:range:attributedString:textView:", v39, v44, v22, v31, v47);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0DC1178]);
      else
        objc_msgSend(v40, "removeObjectForKey:", *MEMORY[0x1E0DC1178]);
      objc_msgSend(v47, "setTypingAttributes:", v40);

    }
    if (v27)
      goto LABEL_9;
LABEL_19:
    v42 = objc_msgSend(v47, "selectedRange");
    objc_msgSend(v47, "setSelectedRange:", v42, v43);
    goto LABEL_20;
  }
  if (!v27)
    goto LABEL_19;
LABEL_9:
  objc_msgSend(v31, "mergeableString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "characterRangesForSelection:", v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "rangeValue");
  objc_msgSend(v47, "setSelectedRange:", v35, v36);

LABEL_20:
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
}

void __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a2;
  if (objc_msgSend(v7, "style") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invertedSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[2] = __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_2;
    v15[3] = &unk_1E5C21500;
    v12 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v20 = *(_QWORD *)(a1 + 64);
    v18 = v11;
    v15[1] = 3221225472;
    v16 = v12;
    v17 = v9;
    v19 = *(_QWORD *)(a1 + 56);
    v13 = v9;
    objc_msgSend(v10, "ic_enumerateContentLineRangesInRange:usingBlock:", a3, a4, v15);

  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "attachmentsExistInRange:textStorage:", a3, a4, *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "indentParagraphStyle:byAmount:", v7, *(_QWORD *)(a1 + 64));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14 != v7)
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0D63928], v14, a3, a4);

  }
}

void __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  id v12;

  if (*(uint64_t *)(a1 + 64) < 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", *(_QWORD *)(a1 + 40), 0, a2, a3);

    v8 = objc_msgSend(CFSTR("    "), "length") * *(_QWORD *)(a1 + 64);
    if (v7 - a2 >= (unint64_t)-v8)
      v9 = -v8;
    else
      v9 = v7 - a2;
    if (v9)
      v10 = v9 + 1 >= a3;
    else
      v10 = 1;
    if (!v10)
    {
      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addIndex:", a2);
  }
}

uint64_t __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  if (*(uint64_t *)(result + 40) >= 1)
  {
    v3 = result;
    v4 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v3 + 32), "replaceCharactersInRange:withString:", a2, 0, CFSTR("    "));
      ++v4;
    }
    while (v4 < *(_QWORD *)(v3 + 40));
  }
  return result;
}

uint64_t __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "rangeValue");
  return objc_msgSend(v2, "deleteCharactersInRange:", v3, v4);
}

- (id)todoForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length;
  unint64_t location;
  id v6;
  NSRange v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  NSRange v22;
  NSRange v23;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__46;
  v20 = __Block_byref_object_dispose__46;
  v21 = 0;
  if (location < objc_msgSend(v6, "length"))
  {
    v23.length = objc_msgSend(v6, "length");
    v22.location = location;
    v22.length = length;
    v23.location = 0;
    v7 = NSIntersectionRange(v22, v23);
    objc_msgSend(v6, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "paragraphRangeForRange:", v7.location, v7.length);
    v11 = v10;

    v12 = *MEMORY[0x1E0D63928];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__ICTextController_todoForRange_inTextStorage___block_invoke;
    v15[3] = &unk_1E5C1EEC8;
    v15[4] = &v16;
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v12, v9, v11, 0, v15);
  }
  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __47__ICTextController_todoForRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "todo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v12, "todo");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      *a5 = 1;
    }
  }

}

- (_NSRange)firstParagraphForSetListStyleRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "paragraphRangeForRange:", location, length);
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invertedSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", v12, 0, v8, v10);
  v16 = v15;

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 0;
  }
  else
  {
    v8 = v14;
    v17 = v16;
  }
  objc_msgSend(v6, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "paragraphRangeForRange:", v8, v17);
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.length = v23;
  result.location = v22;
  return result;
}

void __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  char isKindOfClass;
  _BYTE *v9;
  id v10;

  v7 = a2;
  if (!v7 || (v10 = v7, objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v7 = v10, (isKindOfClass & 1) != 0))
  {
    v9 = *(_BYTE **)(a1 + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *v9 = 1;
    **(_BYTE **)(a1 + 48) = 1;
    *a5 = 1;
  }

}

- (int64_t)setTextStyle:(unsigned int)a3 range:(_NSRange)a4 inTextStorage:(id)a5
{
  return -[ICTextController setTextStyle:range:inTextStorage:inTextView:](self, "setTextStyle:range:inTextStorage:inTextView:", *(_QWORD *)&a3, a4.location, a4.length, a5, 0);
}

- (int64_t)setTextStyle:(unsigned int)a3 range:(_NSRange)a4 inTextStorage:(id)a5 inTextView:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  id v11;
  id v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;

  length = a4.length;
  location = a4.location;
  v9 = *(_QWORD *)&a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "beginEditing");
  v13 = -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:inTextView:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:inTextView:", v9, ICTTNamedStyleIsList() ^ 1, location, length, v11, v12);
  if (objc_msgSend(v11, "editedRange") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v11, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "paragraphRangeForRange:", location, length);
    v17 = v16;

    objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E0D63918], v15, v17);
    objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E0D63948], v15, v17);
    objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E0D63930], v15, v17);
    objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E0D63938], v15, v17);
    objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E0DC1160], v15, v17);
    v18 = *MEMORY[0x1E0D63928];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __64__ICTextController_setTextStyle_range_inTextStorage_inTextView___block_invoke;
    v26[3] = &unk_1E5C21618;
    v27 = v11;
    objc_msgSend(v27, "enumerateAttribute:inRange:options:usingBlock:", v18, location, length, 0x100000, v26);

  }
  objc_msgSend(v11, "endEditing");
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_msgSend(v11, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "paragraphRangeForRange:", location, length);

    if (v20)
      v21 = v20 - 1;
    else
      v21 = 0;
    objc_msgSend(v12, "textLayoutManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ic_textRangeForRange:", v21, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "textLayoutManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "invalidateLayoutForRange:", v23);

  }
  return v13;
}

void __64__ICTextController_setTextStyle_range_inTextStorage_inTextView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    v12 = v7;
    v9 = objc_msgSend(v7, "indent");
    v8 = v12;
    if (v9)
    {
      v10 = objc_msgSend(v12, "isList");
      v8 = v12;
      if ((v10 & 1) == 0)
      {
        v11 = (void *)objc_msgSend(v12, "mutableCopy");
        objc_msgSend(v11, "setIndent:", 0);
        objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0D63928], v11, a3, a4);

        v8 = v12;
      }
    }
  }

}

- (BOOL)containsOnlyStyle:(unsigned int)a3 inRange:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  v9 = objc_msgSend(MEMORY[0x1E0D64290], "range:liesWithinRange:assert:", location, length, 0, objc_msgSend(v8, "length"), 1);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    v12 = v9;
    v13 = v10;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 1;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__ICTextController_containsOnlyStyle_inRange_inTextStorage___block_invoke;
    v15[3] = &unk_1E5C21640;
    v18 = a3;
    v16 = v8;
    v17 = &v19;
    objc_msgSend(v16, "enumerateAttributesInRange:options:usingBlock:", v12, v13, 0, v15);
    v11 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v11;
}

void __60__ICTextController_containsOnlyStyle_inRange_inTextStorage___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v9 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v12 = a3 + a4;
    v13 = a3 + a4 - 1;
    while (a3 < v12)
    {
      v18 = 0;
      v19 = 0;
      v17 = 0;
      objc_msgSend(*(id *)(a1 + 32), "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "getParagraphStart:end:contentsEnd:forRange:", &v19, &v18, &v17, a3, 0);

      v15 = v19;
      if (v19 <= a3)
        v15 = a3;
      v16 = v17;
      a3 = v18;
      if (v17 >= v13)
        v16 = v13;
      if (v15 < v16)
      {
        if (!v11 && objc_msgSend(v10, "style") != *(_DWORD *)(a1 + 48))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *a5 = 1;
        }
        break;
      }
    }
  }

}

- (void)removeFontsAndColorsForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v7 = (_QWORD *)MEMORY[0x1E0D63910];
  v8 = MEMORY[0x1E0C809B0];
  v9 = *MEMORY[0x1E0D63910];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__ICTextController_removeFontsAndColorsForRange_inTextStorage___block_invoke;
  v13[3] = &unk_1E5C1EEC8;
  v13[4] = &v14;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v9, location, length, 0x100000, v13);
  v10 = (_QWORD *)MEMORY[0x1E0D63920];
  if (*((_BYTE *)v15 + 24)
    || (v11 = *MEMORY[0x1E0D63920],
        v12[0] = v8,
        v12[1] = 3221225472,
        v12[2] = __63__ICTextController_removeFontsAndColorsForRange_inTextStorage___block_invoke_2,
        v12[3] = &unk_1E5C1EEC8,
        v12[4] = &v14,
        objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v11, location, length, 0x100000, v12),
        *((_BYTE *)v15 + 24)))
  {
    objc_msgSend(v6, "removeAttribute:range:", *v7, location, length);
    objc_msgSend(v6, "removeAttribute:range:", *v10, location, length);
  }
  _Block_object_dispose(&v14, 8);

}

uint64_t __63__ICTextController_removeFontsAndColorsForRange_inTextStorage___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __63__ICTextController_removeFontsAndColorsForRange_inTextStorage___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:(_NSRange)a3 textStorage:(id)a4 textView:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;

  length = a3.length;
  location = a3.location;
  v8 = a5;
  -[ICTextController keyboardLanguageForTextView:](self, "keyboardLanguageForTextView:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  if (v9 && (v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("dictation")), v11 = v13, (v10 & 1) == 0))
  {
    v12 = (void *)MEMORY[0x1E0DC1290];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0DC1290];
    v11 = 0;
  }
  -[ICTextController setParagraphWritingDirectionInRange:toDirection:inTextView:](self, "setParagraphWritingDirectionInRange:toDirection:inTextView:", location, length, objc_msgSend(v12, "defaultWritingDirectionForLanguage:", v11), v8);

}

- (int64_t)setTextStyle:(unsigned int)a3 removeExtraStyling:(BOOL)a4 range:(_NSRange)a5 inTextStorage:(id)a6
{
  return -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:inTextView:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:inTextView:", *(_QWORD *)&a3, a4, a5.location, a5.length, a6, 0);
}

- (int64_t)setTextStyle:(unsigned int)a3 removeExtraStyling:(BOOL)a4 range:(_NSRange)a5 inTextStorage:(id)a6 inTextView:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v10;
  uint64_t v11;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v33;
  int64_t v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t *v41;
  int v42;
  char v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  _QWORD v47[3];
  char v48;
  _QWORD v49[4];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  length = a5.length;
  location = a5.location;
  v10 = a4;
  v11 = *(_QWORD *)&a3;
  v13 = a6;
  v14 = a7;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__46;
  v54 = __Block_byref_object_dispose__46;
  objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", v11);
  v55 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "paragraphRangeForRange:", location, length);
  v18 = v17;

  if (objc_msgSend((id)v51[5], "wantsFollowingNewLine"))
  {
    if (v16 == objc_msgSend(v13, "length"))
    {
      objc_msgSend(v13, "breakUndoCoalescing");
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
      objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v16, v18, v19);

      v18 = 1;
      -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", v16, 1);
      v20 = -1;
    }
    else
    {
      v20 = 0;
    }
    -[ICTextController updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:](self, "updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:", v16, v18, v13, v14);
  }
  else
  {
    v20 = 0;
  }
  v35 = v14;
  v21 = objc_msgSend((id)v51[5], "isList", self);
  v34 = v20;
  v22 = objc_msgSend((id)v51[5], "style") == 102;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 1;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v48 = 0;
  if (objc_msgSend((id)v51[5], "isList"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "invertedSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "string");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "rangeOfCharacterFromSet:options:range:", v24, 0, v16, v18);

    v27 = v26 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v27 = 0;
    v24 = 0;
  }
  objc_msgSend(v13, "beginEditing");
  objc_msgSend(v13, "string");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __83__ICTextController_setTextStyle_removeExtraStyling_range_inTextStorage_inTextView___block_invoke;
  v36[3] = &unk_1E5C21668;
  v43 = v21;
  v44 = v27;
  v29 = v13;
  v37 = v29;
  v30 = v24;
  v42 = v11;
  v45 = v10;
  v46 = v22;
  v38 = v30;
  v39 = v47;
  v40 = v49;
  v41 = &v50;
  objc_msgSend(v28, "ic_enumerateParagraphsInRange:usingBlock:", v16, v18, v36);

  if (v10)
    objc_msgSend(v33, "removeFontsAndColorsForRange:inTextStorage:", v16, v18, v29);
  objc_msgSend(v29, "endEditing");
  objc_msgSend(v29, "breakUndoCoalescing");
  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "removeAutocorrectPrompt");

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v50, 8);

  return v34;
}

void __83__ICTextController_setTextStyle_removeExtraStyling_range_inTextStorage_inTextView___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v8;
  uint64_t *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v18;
  char isKindOfClass;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;

  v8 = a3 - a2;
  v9 = (uint64_t *)MEMORY[0x1E0D63928];
  if (*(_BYTE *)(a1 + 76) && !*(_BYTE *)(a1 + 77))
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", *(_QWORD *)(a1 + 40), 0, a2, v8);

    objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *v9, a2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v10 = v12 != 0x7FFFFFFFFFFFFFFFLL || v13 && (objc_msgSend(v13, "isList") & 1) != 0;

  }
  else
  {
    v10 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *v9, a2, 0);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], a2, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (*(_DWORD *)(a1 + 72) != 4 || v15 == 0)
  {
    v18 = 0;
    if (!v10)
      goto LABEL_27;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v18 = isKindOfClass ^ 1;
    if (!v10)
      goto LABEL_27;
  }
  if ((v18 & 1) != 0)
  {
LABEL_27:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                           + 24) != 0;
    goto LABEL_40;
  }
  if (!v31)
  {
    if (*(_BYTE *)(a1 + 79)
      && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
      && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= 2uLL)
    {
      v22 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "mutableCopy");
      objc_msgSend(v22, "setStartingItemNumber:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

    }
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isEqual:", 0) & 1) == 0)
    {
      v25 = *(void **)(a1 + 32);
      v26 = *v9;
      v27 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "copy");
      objc_msgSend(v25, "addAttribute:value:range:", v26, v27, a2, v8);

    }
    goto LABEL_39;
  }
  v20 = (void *)objc_msgSend(v31, "mutableCopy");
  objc_msgSend(v20, "setStyle:", *(unsigned int *)(a1 + 72));
  if (*(_BYTE *)(a1 + 78))
    objc_msgSend(v20, "setAlignment:", *MEMORY[0x1E0D63968]);
  if (*(_BYTE *)(a1 + 79)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= 2uLL)
  {
    if (objc_msgSend(v20, "indent"))
      v21 = 0;
    else
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(v20, "setStartingItemNumber:", v21);
  }
  if ((objc_msgSend(v20, "isEqual:", v31) & 1) == 0)
  {
    v28 = *(void **)(a1 + 32);
    v29 = *v9;
    v30 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v28, "addAttribute:value:range:", v29, v30, a2, v8);

  }
  if (!objc_msgSend(v31, "indent"))
  {
LABEL_39:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
LABEL_40:
  if (*(_BYTE *)(a1 + 77))
    *a5 = 1;

}

- (void)setTypingAttributesForUndo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("View"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Attrs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTextController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "undoManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = CFSTR("Attrs");
  objc_msgSend(v5, "typingAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("View");
  v14[0] = v10;
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerUndoWithTarget:selector:object:", self, sel_setTypingAttributesForUndo_, v11);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Style Change"), CFSTR("Style Change"), 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActionName:", v12);

  objc_msgSend(v5, "setTypingAttributes:", v6);
}

- (void)setTypingTextStyle:(unsigned int)a3 textView:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  int IsList;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v4 = *(_QWORD *)&a3;
  v37[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "typingAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = (_QWORD *)MEMORY[0x1E0D63928];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IsList = ICTTNamedStyleIsList();
  -[ICTextController note](self, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "wantsUndoCommands");

  if (v14)
  {
    -[ICTextController note](self, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "undoManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v36[0] = CFSTR("Attrs");
    objc_msgSend(v6, "typingAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = CFSTR("View");
    v37[0] = v18;
    v37[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerUndoWithTarget:selector:object:", self, sel_setTypingAttributesForUndo_, v19);

    v9 = (_QWORD *)MEMORY[0x1E0D63928];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Style Change"), CFSTR("Style Change"), 0, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActionName:", v20);

  }
  if (v10)
    v21 = (id)objc_msgSend(v10, "mutableCopy");
  else
    v21 = objc_alloc_init(MEMORY[0x1E0D63C90]);
  v22 = v21;
  objc_msgSend(v21, "setStyle:", v4);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, *v9);
  -[ICTTTextController preferredAttributesForICTTTextStyle:](self, "preferredAttributesForICTTTextStyle:", objc_msgSend(v22, "style"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v23);

  if (IsList)
  {
    objc_msgSend(v6, "typingAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (_QWORD *)MEMORY[0x1E0D63910];
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D63910]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, *v25);

    objc_msgSend(v6, "typingAttributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, v28);

    objc_msgSend(v6, "typingAttributes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (_QWORD *)MEMORY[0x1E0D63920];
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D63920]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, *v31);

    objc_msgSend(v6, "typingAttributes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v35, v34);

  }
  objc_msgSend(v6, "setTypingAttributes:", v8);

}

- (BOOL)setDone:(BOOL)a3 range:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  _BOOL8 v7;
  id v8;
  NSRange v9;
  void *v10;
  unint64_t v11;
  BOOL v12;
  _BOOL8 v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  int v23;
  BOOL v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  BOOL v34;
  _BOOL4 v36;
  BOOL v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  NSRange v44;
  NSRange v45;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = a5;
  v45.length = objc_msgSend(v8, "length");
  v44.location = location;
  v44.length = length;
  v45.location = 0;
  v9 = NSIntersectionRange(v44, v45);
  v42 = 0;
  v43 = 0;
  v41 = 0;
  objc_msgSend(v8, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getParagraphStart:end:contentsEnd:forRange:", &v43, &v42, &v41, v9.location, v9.length);

  v11 = v43;
  v12 = v43 == v41 && v7;
  if (!v12)
  {
    v13 = v7;
    v37 = v12;
    v14 = v42;
    objc_msgSend(v8, "beginEditing");
    if (v14 > v11)
    {
      v15 = (_QWORD *)MEMORY[0x1E0D63928];
      v16 = v11;
      v36 = v7;
      do
      {
        v39 = 0;
        v40 = 0;
        objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", *v15, v16, &v39, v11, v14 - v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          if (objc_msgSend(v17, "style") == 103)
          {
            objc_msgSend(v18, "todo");
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = (void *)v19;
              objc_msgSend(v18, "todo");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v15;
              v23 = objc_msgSend(v21, "done");

              v24 = v23 == v13;
              v15 = v22;
              if (!v24)
              {
                v25 = (void *)objc_msgSend(v18, "mutableCopy");
                objc_msgSend(v25, "todo");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "todoWithDone:", v13);
                v27 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setTodo:", v27);

                -[ICTextController note](self, "note");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v27) = objc_opt_respondsToSelector();

                if ((v27 & 1) != 0)
                {
                  -[ICTextController note](self, "note");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ICTextController note](self, "note");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "todo");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = (id)objc_msgSend(v29, "persistToggleChecklistItemActivityEventForObject:todo:", v30, v31);

                  v13 = v36;
                }
                objc_opt_class();
                ICCheckedDynamicCast();
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "beginSkippingTimestampUpdates");
                v15 = v22;
                objc_msgSend(v33, "addAttribute:value:range:", *v22, v25, v39, v40);
                objc_msgSend(v33, "endSkippingTimestampUpdates");
                if (v33)
                  -[ICTextController refreshTypingAttributesForAllTextViewsOfTextStorage:](self, "refreshTypingAttributesForAllTextViewsOfTextStorage:", v33);

              }
            }
          }
        }
        v16 = v40 + v39;

      }
      while (v16 < v14);
    }
    objc_msgSend(v8, "endEditing");
    v12 = v37;
  }
  v34 = !v12;

  return v34;
}

- (void)refreshTypingAttributesForAllTextViewsOfTextStorage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v4, "textViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[ICTextController refreshTypingAttributesForTextView:textStorage:](self, "refreshTypingAttributesForTextView:textStorage:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)refreshTypingAttributesForTextView:(id)a3 textStorage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    v8 = objc_msgSend(v7, "selectedRange");
    v10 = v9;
    objc_msgSend(v7, "typingAttributes");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[ICTTTextController typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:](self, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v8, v10, 1, v12, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setTypingAttributes:", v11);
  }
}

- (BOOL)isTodoDoneRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "paragraphRangeForRange:", location, length);
  v10 = v9;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v11 = *MEMORY[0x1E0D63928];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__ICTextController_isTodoDoneRange_inTextStorage___block_invoke;
  v13[3] = &unk_1E5C1EEC8;
  v13[4] = &v14;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v11, v8, v10, 0, v13);
  LOBYTE(v8) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __50__ICTextController_isTodoDoneRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a2;
  if (v11)
  {
    objc_msgSend(v11, "todo");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v11, "todo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "done");

      if ((v10 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        *a5 = 1;
      }
    }
  }

}

- (void)scaleFontPointSize:(double)a3 range:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  double v14;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(v9, "beginEditing");
  v10 = *MEMORY[0x1E0DC1138];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__ICTextController_scaleFontPointSize_range_inTextStorage___block_invoke;
  v12[3] = &unk_1E5C21690;
  v14 = a3;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v12);
  objc_msgSend(v11, "endEditing");

}

void __59__ICTextController_scaleFontPointSize_range_inTextStorage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "scaleFont:withScale:", a2, *(double *)(a1 + 48));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v7, a3, a4);

  }
}

- (id)scaleFont:(id)a3 withScale:(double)a4
{
  id v5;
  double v6;
  void *v7;

  v5 = a3;
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v5, "fontWithSize:", v6 * a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)superscriptUpdate:(id)a3 range:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *, void *, NSUInteger, NSUInteger);
  void *v17;
  id v18;
  ICTextController *v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[6];

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v10, "beginEditing");
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3010000000;
  v22[3] = "";
  v22[4] = location;
  v22[5] = length;
  v11 = *MEMORY[0x1E0D63938];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __58__ICTextController_superscriptUpdate_range_inTextStorage___block_invoke;
  v17 = &unk_1E5C216B8;
  v12 = v9;
  v20 = v12;
  v13 = v10;
  v21 = v22;
  v18 = v13;
  v19 = self;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v11, location, length, 0, &v14);
  objc_msgSend(v13, "endEditing", v14, v15, v16, v17);

  _Block_object_dispose(v22, 8);
}

void __58__ICTextController_superscriptUpdate_range_inTextStorage___block_invoke(_QWORD *a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSRange v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  NSRange v18;
  uint64_t v19;
  double v20;
  NSRange v21;
  NSRange v22;

  v7 = a1[6];
  v8 = a2;
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, objc_msgSend(v8, "integerValue"));
  v10 = (void *)a1[4];
  v11 = *MEMORY[0x1E0D63938];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21.location = a3;
    v21.length = a4;
    v13 = NSIntersectionRange(*(NSRange *)(*(_QWORD *)(a1[7] + 8) + 32), v21);
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, v13.location, v13.length);

    v14 = objc_msgSend(v8, "integerValue");
    if (!v14)
    {
      v15 = (void *)a1[5];
      +[ICTTTextController superscriptScaleFactor](ICTextController, "superscriptScaleFactor");
      v17 = a1[4];
LABEL_6:
      objc_msgSend(v15, "scaleFontPointSize:range:inTextStorage:", a3, a4, v17, v16);
    }
  }
  else
  {
    v22.location = a3;
    v22.length = a4;
    v18 = NSIntersectionRange(*(NSRange *)(*(_QWORD *)(a1[7] + 8) + 32), v22);
    objc_msgSend(v10, "removeAttribute:range:", v11, v18.location, v18.length);
    v19 = objc_msgSend(v8, "integerValue");

    if (v19)
    {
      v15 = (void *)a1[5];
      +[ICTTTextController superscriptScaleFactor](ICTextController, "superscriptScaleFactor");
      v17 = a1[4];
      v16 = 1.0 / v20;
      goto LABEL_6;
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 32) = a3 + a4;
}

- (void)superscriptDelta:(int64_t)a3 range:(_NSRange)a4 inTextStorage:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__ICTextController_superscriptDelta_range_inTextStorage___block_invoke;
  v5[3] = &__block_descriptor_40_e8_q16__0q8l;
  v5[4] = a3;
  -[ICTextController superscriptUpdate:range:inTextStorage:](self, "superscriptUpdate:range:inTextStorage:", v5, a4.location, a4.length, a5);
}

uint64_t __57__ICTextController_superscriptDelta_range_inTextStorage___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) + a2;
}

- (void)unscriptRange:(_NSRange)a3 inTextStorage:(id)a4
{
  -[ICTextController superscriptUpdate:range:inTextStorage:](self, "superscriptUpdate:range:inTextStorage:", &__block_literal_global_54, a3.location, a3.length, a4);
}

uint64_t __48__ICTextController_unscriptRange_inTextStorage___block_invoke()
{
  return 0;
}

- (id)tabStopsForAttributedString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v38[3];

  length = a4.length;
  location = a4.location;
  v38[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (length
    && (objc_msgSend(v7, "string"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "ic_rangeIsValid:", location, length),
        v9,
        v10))
  {
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], location, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      -[ICTTTextController zoomController](self, "zoomController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "checklistZoomFactor");
      v14 = v13;

      if (v14 < 1.0)
        v14 = 1.0;
      v15 = v14 * 22.0 + v14 * ((double)(unint64_t)objc_msgSend(v11, "indent") * 36.0);
      v16 = v14 * 13.0 + v15;
      if (objc_msgSend(v11, "style") == 102)
      {
        objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], location, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTTTextController zoomController](self, "zoomController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "zoomFactor");
        +[ICTTTextStorage bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:](ICTTTextStorage, "bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:", v17, v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "listBulletInAttributedString:atIndex:", v8, location);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D08], location, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "extraBulletWidthForNumberedListWithMaxItemNumber:textFont:", v21, v17);
        v23 = v22;
        v15 = v15 + v22;
        if ((unint64_t)objc_msgSend(v20, "length") >= 2)
        {
          objc_msgSend(v20, "substringWithRange:", objc_msgSend(v20, "length") - 2, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "boundingRectWithSize:options:attributes:context:", 0, v19, 0, 1.79769313e308, 1.79769313e308);
          v26 = v25;
          objc_msgSend(v20, "substringFromIndex:", objc_msgSend(v20, "length") - 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "boundingRectWithSize:options:attributes:context:", 0, v19, 0, 1.79769313e308, 1.79769313e308);
          v15 = v15 + v28 - v26;

        }
        v16 = v16 + v23;

      }
      v29 = objc_alloc(MEMORY[0x1E0DC1328]);
      if (objc_msgSend(v11, "isRTL"))
        v30 = 0;
      else
        v30 = 2;
      v31 = MEMORY[0x1E0C9AA70];
      v32 = (void *)objc_msgSend(v29, "initWithTextAlignment:location:options:", v30, MEMORY[0x1E0C9AA70], v15);
      v33 = objc_alloc(MEMORY[0x1E0DC1328]);
      if (objc_msgSend(v11, "isRTL"))
        v34 = 2;
      else
        v34 = 0;
      v35 = (void *)objc_msgSend(v33, "initWithTextAlignment:location:options:", v34, v31, v16);
      v38[0] = v32;
      v38[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v36 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v36 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v36;
}

- (void)ensureUniqueParagraphStyleUUIDsInTextStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t i;
  void *v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  void *v23;
  void *v24;
  NSRange v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v55;
  void *v56;
  id obj;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  id v74;
  _QWORD *v75;
  _QWORD *v76;
  _QWORD v77[5];
  id v78;
  _QWORD v79[5];
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;
  NSRange v84;
  NSRange v85;

  length = a4.length;
  location = a4.location;
  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__46;
  v79[4] = __Block_byref_object_dispose__46;
  v80 = 0;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x3032000000;
  v77[3] = __Block_byref_object_copy__46;
  v77[4] = __Block_byref_object_dispose__46;
  v78 = 0;
  objc_msgSend(v6, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke;
  v70[3] = &unk_1E5C21768;
  v55 = v6;
  v71 = v55;
  v59 = v8;
  v72 = v59;
  v58 = v9;
  v73 = v58;
  v75 = v77;
  v76 = v79;
  v53 = v7;
  v74 = v53;
  objc_msgSend(v10, "ic_enumerateParagraphsInRange:usingBlock:", location, length, v70);

  if (objc_msgSend(v59, "count"))
  {
    objc_msgSend(v59, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_81);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v12;
    v13 = 0;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    if (v14)
    {
      v15 = 0;
      v16 = *(_QWORD *)v67;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v67 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "rangeValue");
          v22 = v21;
          objc_msgSend(v59, "objectForKeyedSubscript:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v20 == v17 + v15 && objc_msgSend(v23, "isEqual:", v13))
            {
              v84.location = v17;
              v84.length = v15;
              v85.location = v20;
              v85.length = v22;
              v25 = NSUnionRange(v84, v85);
              v17 = v25.location;
              v15 = v25.length;
              goto LABEL_13;
            }
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v17, v15);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v13, v26);

          }
          v27 = v24;

          v13 = v27;
          v15 = v22;
          v17 = v20;
LABEL_13:

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        if (!v14)
        {

          if (v17 != 0x7FFFFFFFFFFFFFFFLL && v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v17, v15);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v13, v28);
            goto LABEL_19;
          }
          goto LABEL_20;
        }
      }
    }
    v28 = obj;
LABEL_19:

LABEL_20:
    objc_opt_class();
    ICDynamicCast();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "beginSkippingTimestampUpdates");

    objc_msgSend(v55, "beginEditing");
    objc_opt_class();
    ICDynamicCast();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "mergeableString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "beginEditing");

    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke_4;
    v64[3] = &unk_1E5C217D0;
    v32 = v55;
    v65 = v32;
    objc_msgSend(v56, "enumerateKeysAndObjectsUsingBlock:", v64);
    objc_opt_class();
    ICDynamicCast();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "mergeableString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "endEditing");

    objc_msgSend(v32, "endEditing");
    objc_opt_class();
    ICDynamicCast();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "endSkippingTimestampUpdates");

  }
  -[ICTextController note](self, "note");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "textContentStorage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "outlineController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "collapsedUUIDs");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "mutableCopy");

  v41 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v58, "allKeys");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setWithArray:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "intersectSet:", v40);
  if (objc_msgSend(v43, "count"))
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v44 = v43;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v61 != v46)
            objc_enumerationMutation(v44);
          v48 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
          objc_msgSend(v40, "removeObject:", v48);
          objc_msgSend(v58, "objectForKeyedSubscript:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v49);

        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
      }
      while (v45);
    }

    -[ICTextController note](self, "note");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "textContentStorage");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "outlineController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setCollapsedUUIDs:", v40);

  }
  _Block_object_dispose(v77, 8);

  _Block_object_dispose(v79, 8);
}

void __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_QWORD *, void *, uint64_t, uint64_t);
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v40 = 0;
  v41 = 0;
  v6 = (uint64_t *)MEMORY[0x1E0D63928];
  objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], a2, &v40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a3 - a2;
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  if (v41 + v40 < a3)
  {
    v13 = *(void **)(a1 + 32);
    v14 = *v6;
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke_2;
    v35 = &unk_1E5C21740;
    v39 = a2;
    v36 = v12;
    v37 = *(id *)(a1 + 40);
    v38 = *(id *)(a1 + 48);
    objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v14, a2, v8, 0, &v32);

  }
  if ((objc_msgSend(v7, "isHeader", v32, v33, v34, v35) & 1) != 0
    || (objc_msgSend(v7, "isList") & 1) != 0
    || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
    || !objc_msgSend(v7, "isHierarchicallyEqualToParagraphStyle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)))
  {
    if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v12))
    {
      v17 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setUuid:", v21);

      v22 = (void *)objc_msgSend(v17, "copy");
      v23 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

      objc_msgSend(v17, "uuid");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

    }
    else
    {
      objc_msgSend(v7, "uuid");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v17 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;
    }
    goto LABEL_15;
  }
  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(v7, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v15, "isEqual:", v16);

  if ((v15 & 1) == 0)
  {
    v17 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v17, "setUuid:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v18 = (void *)objc_msgSend(v17, "copy");
    v19 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

LABEL_15:
  }
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v7;

}

void __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a2;
  v17 = v7;
  if (a3 != a1[7]
    || (objc_msgSend(v7, "uuid"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v7 = v17, !v8))
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "setUuid:", a1[4]);
    v10 = (void *)objc_msgSend(v9, "copy");
    v11 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    objc_msgSend(v17, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = a1[4];
      v15 = (void *)a1[6];
      objc_msgSend(v17, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

    }
    v7 = v17;
  }

}

uint64_t __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "rangeValue");
  if (v6 >= objc_msgSend(v5, "rangeValue"))
  {
    v8 = objc_msgSend(v4, "rangeValue");
    v7 = v8 > objc_msgSend(v5, "rangeValue");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *MEMORY[0x1E0D63928];
  v8 = a3;
  v6 = objc_msgSend(a2, "rangeValue");
  objc_msgSend(v4, "addAttribute:value:range:", v5, v8, v6, v7);

}

- (void)updateAttachmentsSelectionStateInTextStorage:(id)a3 forSelectedRanges:(id)a4 layoutManager:(id)a5 textView:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x1E0DC10F8];
  v11 = a3;
  v12 = objc_msgSend(v11, "length");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __106__ICTextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_layoutManager_textView___block_invoke;
  v15[3] = &unk_1E5C1EBC8;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v12, 0, v15);

}

void __106__ICTextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_layoutManager_textView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t (**v8)(_QWORD);
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  v7 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__ICTextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_layoutManager_textView___block_invoke_2;
  aBlock[3] = &unk_1E5C217F8;
  v12 = *(id *)(a1 + 32);
  v13 = a3;
  v14 = a4;
  v8 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "viewForTextAttachmentNoCreate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSelected:", v8[2](v8));
  }

}

uint64_t __106__ICTextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_layoutManager_textView___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;
  NSRange v16;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v16.location = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "rangeValue", (_QWORD)v10);
        v16.length = v7;
        if (NSIntersectionRange(*(NSRange *)(a1 + 40), v16).length)
        {
          v8 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)insertNewlineAtCharacterIndex:(unint64_t)a3 textStorage:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(v6, "breakUndoCoalescing");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  objc_msgSend(v6, "replaceCharactersInRange:withAttributedString:", a3, 0, v7);

  -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", a3, 1);
}

- (void)toggleBlockQuoteInTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "selectedRange");
  v9 = objc_msgSend(v6, "paragraphRangeForRange:", v7, v8);
  v11 = v10;

  objc_opt_class();
  objc_msgSend(v4, "textStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTextController note](self, "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEmpty");

  objc_msgSend(v4, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v9 == v17)
  {
    objc_msgSend(v13, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v9, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = objc_alloc(MEMORY[0x1E0CB3498]);
    v42 = *MEMORY[0x1E0DC1178];
    v43[0] = v18;
    v20 = 1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v19, "initWithString:attributes:", CFSTR("\n"), v21);

    objc_msgSend(v13, "breakUndoCoalescing");
    objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v9, v11, v22);
    -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", v9, 1);
    -[ICTextController updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:](self, "updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:", v9, 1, v13, v4);
    objc_msgSend(v4, "setSelectedRange:", v9, 0);
    if (v15)
      -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:", +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle"), 0, v9, 1, v13);

    v11 = 1;
  }
  else
  {
    v20 = v11;
  }
  objc_msgSend(v4, "textStorage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "beginEditing");

  objc_msgSend(v4, "textLayoutManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "ic_textRangeForRange:", v9, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[ICTextController selectionContainsBlockQuoteAndOthers:](self, "selectionContainsBlockQuoteAndOthers:", v4);
  objc_msgSend(v4, "textLayoutManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "textContentManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "location");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __47__ICTextController_toggleBlockQuoteInTextView___block_invoke;
  v37[3] = &unk_1E5C21820;
  v38 = v4;
  v39 = v9;
  v40 = v11;
  v41 = v26;
  v30 = v4;
  v31 = (id)objc_msgSend(v28, "enumerateTextElementsFromLocation:options:usingBlock:", v29, 0, v37);

  objc_msgSend(v30, "textStorage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "endEditing");

  objc_msgSend(v30, "textStorage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "attributesAtIndex:effectiveRange:", v9, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "mutableCopy");
  objc_msgSend(v30, "setTypingAttributes:", v35);

  -[ICTextController note](self, "note");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "updateModificationDateAndChangeCountAndSaveAfterDelay");

}

uint64_t __47__ICTextController_toggleBlockQuoteInTextView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "ic_rangeForTextRange:", v6);
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (_QWORD *)MEMORY[0x1E0D63928];
  objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v7, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && *(_QWORD *)(a1 + 48) + *(_QWORD *)(a1 + 40) > v7 && v12)
    {
      if (!*(_BYTE *)(a1 + 56))
      {
        v15 = (void *)objc_msgSend(v12, "mutableCopy");
        objc_msgSend(v15, "setBlockQuoteLevel:", objc_msgSend(v12, "isBlockQuote") ^ 1);
        objc_msgSend(*(id *)(a1 + 32), "textStorage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addAttribute:value:range:", *v11, v15, v7, v9);

        v17 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
LABEL_10:
          __47__ICTextController_toggleBlockQuoteInTextView___block_invoke_cold_1(v12);
LABEL_11:

        goto LABEL_12;
      }
      if ((objc_msgSend(v12, "isBlockQuote") & 1) == 0)
      {
        v15 = (void *)objc_msgSend(v12, "mutableCopy");
        objc_msgSend(v15, "setBlockQuoteLevel:", 1);
        objc_msgSend(*(id *)(a1 + 32), "textStorage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addAttribute:value:range:", *v11, v15, v7, v9);

        v17 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          goto LABEL_10;
        goto LABEL_11;
      }
    }
  }
LABEL_12:

  return 1;
}

- (BOOL)selectionContainsBlockQuoteAndOthers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char v18;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t *v24;
  _QWORD v25[3];
  char v26;
  _QWORD v27[3];
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v3 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "selectedRange");
  v8 = objc_msgSend(v5, "ic_rangeIsValid:", v6, v7);

  if (v8)
  {
    objc_msgSend(v3, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "selectedRange");
    v13 = objc_msgSend(v10, "paragraphRangeForRange:", v11, v12);
    v15 = v14;

    objc_msgSend(v3, "textStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0D63928];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__ICTextController_selectionContainsBlockQuoteAndOthers___block_invoke;
    v20[3] = &unk_1E5C21848;
    v21 = v3;
    v22 = v27;
    v23 = v25;
    v24 = &v29;
    objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v17, v13, v15, 0, v20);

  }
  v18 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

void __57__ICTextController_selectionContainsBlockQuoteAndOthers___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  int v13;
  char v14;
  id v15;

  v8 = a2;
  objc_opt_class();
  ICDynamicCast();
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], a3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    objc_opt_class();
    v11 = objc_opt_isKindOfClass() ^ 1;
  }
  if (!v15)
    goto LABEL_16;
  if (objc_msgSend(v15, "isBlockQuote"))
  {
    v12 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v13 = (v10 != 0) & v11;
    if (!v10)
      v13 = 1;
    if (v13 != 1)
      goto LABEL_12;
    v12 = *(_QWORD *)(a1 + 48);
  }
  *(_BYTE *)(*(_QWORD *)(v12 + 8) + 24) = 1;
LABEL_12:
  v14 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v14)
    v14 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v14;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a5 = 1;
LABEL_16:

}

- (BOOL)insertNewlineForSpecialCasesInTextView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "selectedRange");
  if (v5)
    goto LABEL_18;
  objc_msgSend(v4, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "selectedRange");
  v52 = 0;
  v53 = 0;
  v51 = 0;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "selectedRange");
  objc_msgSend(v8, "getParagraphStart:end:contentsEnd:forRange:", &v53, &v52, &v51, v9, v10);

  v11 = v53;
  v12 = 0;
  if (v11 >= objc_msgSend(v6, "length")
    || (objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v53, 0),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        (v12 = v13) == 0)
    || !objc_msgSend(v13, "isList"))
  {
    v14 = v7 - 1;
    objc_msgSend(v6, "attributedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (v14 < v16)
    {
      objc_msgSend(v6, "attributedString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v14, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "attributedString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "string");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "substringWithRange:", v14, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "blockQuoteLevel") && objc_msgSend(v21, "isEqualToString:", CFSTR("\n")))
      {
        -[ICTextController toggleBlockQuoteInTextView:](self, "toggleBlockQuoteInTextView:", v4);
        -[ICTTTextController bodyAttributes](self, "bodyAttributes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setTypingAttributes:", v22);

      }
      if (ICInternalSettingsIsCollapsibleSectionsEnabled())
      {
        objc_opt_class();
        objc_msgSend(v4, "textLayoutManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "textContentManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "outlineController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v24) = objc_msgSend(v26, "isUUIDCollapsed:", v27);

        if ((_DWORD)v24)
        {
          objc_msgSend(v6, "attributesAtIndex:effectiveRange:", v53, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (uint64_t *)MEMORY[0x1E0D63928];
          objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v54 = *v29;
          objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", objc_msgSend(v50, "style"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v55[0] = v30;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "uuid");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v26, "descendantRangeForUUID:", v31);
          v34 = v33;

          v35 = v32 + v34;
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), v49);
          objc_msgSend(v6, "replaceCharactersInRange:withAttributedString:", v35, 0, v36);

          objc_msgSend(v4, "setSelectedRange:", v35, 0);
          goto LABEL_23;
        }

      }
    }
    goto LABEL_17;
  }
  if (v53 != v51)
  {
    objc_msgSend(v6, "breakUndoCoalescing");
LABEL_17:

LABEL_18:
    v37 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(v12, "indent"))
  {
    -[ICTextController indentRange:byAmount:inTextStorage:textView:](self, "indentRange:byAmount:inTextStorage:textView:", v53, 0, -1, v6, v4);
  }
  else
  {
    -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:", 3, 0, v53, 0, v6);
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("body"), CFSTR("body"), 0, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("exited list"), CFSTR("exited list"), 0, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    __ICAccessibilityStringForVariables(1, v39, v41, v42, v43, v44, v45, v46, (uint64_t)v40);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    ICAccessibilityPostHighPriorityAnnouncementNotification(0, v47);
  }
  objc_msgSend(v6, "attributesAtIndex:effectiveRange:", v53, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTypingAttributes:", v48);

  objc_msgSend(v6, "breakUndoCoalescing");
LABEL_23:

  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EED6F670) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "textControllerDidHandleSpecialCaseEditing:", self);
  v37 = 1;
LABEL_19:

  return v37;
}

- (BOOL)insertedSpaceInTextView:(id)a3 replacementRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  BOOL v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  ICTextController *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (length
    || !+[ICTextStyle autoListInsertionEnabled](ICTextStyle, "autoListInsertionEnabled")
    || -[ICTextController isAutoListInsertionDisabled](self, "isAutoListInsertionDisabled"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v34 = 0;
    v32 = 0;
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "selectedRange");
    objc_msgSend(v11, "getParagraphStart:end:contentsEnd:forRange:", &v34, &v33, &v32, v12, v13);

    objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v34, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && (objc_msgSend(v14, "isList") & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(?:(\\* |•)|(-)|(^(?!^0)\\d+\\. |^(?!^0)\\d+\\)))"), 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstMatchInString:options:range:", v17, 4, v34, v32 - v34);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 && (v19 = objc_msgSend(v18, "range"), v19 + v20 > location))
      {
        objc_msgSend(v10, "undoManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "prepareWithInvocationTarget:", self);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setSelectionToIndex:onTextView:", objc_msgSend(v7, "selectedRange"), v7);

        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __61__ICTextController_insertedSpaceInTextView_replacementRange___block_invoke;
        v24[3] = &unk_1E5C21890;
        v25 = v18;
        v29 = v34;
        v30 = v32;
        v23 = v10;
        v31 = v33;
        v26 = v23;
        v27 = self;
        v28 = v7;
        objc_msgSend(v23, "saveSelectionDuringBlock:", v24);

        v8 = 1;
      }
      else
      {
        v8 = 0;
      }

    }
  }

  return v8;
}

void __61__ICTextController_insertedSpaceInTextView_replacementRange___block_invoke(uint64_t a1)
{
  NSRange v2;
  UIAccessibilityNotifications *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  dispatch_time_t v28;
  id v29;
  _QWORD block[4];
  id v31;
  NSRange v32;
  NSRange v33;

  v32.location = objc_msgSend(*(id *)(a1 + 32), "range");
  v33.location = *(_QWORD *)(a1 + 64);
  v33.length = *(_QWORD *)(a1 + 72) - v33.location;
  v2 = NSIntersectionRange(v32, v33);
  v3 = (UIAccessibilityNotifications *)MEMORY[0x1E0DC10C0];
  if (v2.length == *(_QWORD *)(a1 + 72) - *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 40), "attributesAtIndex:effectiveRange:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 80);
    if (*(_QWORD *)(a1 + 72) == v5)
    {
      _UIAccessibilityBlockPostingOfNotification();
      dispatchMainAfterDelay();
      v6 = *(void **)(a1 + 40);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), v4);
      objc_msgSend(v6, "appendAttributedString:", v7);

      objc_msgSend(*(id *)(a1 + 48), "trackExtraNewLineRangeIfNecessary:", objc_msgSend(*(id *)(a1 + 40), "length") - 1, 1);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v4, *(_QWORD *)(a1 + 64), v5 - *(_QWORD *)(a1 + 64));
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "range");
  objc_msgSend(v8, "substringWithRange:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(a1 + 40);
  v13 = objc_msgSend(*(id *)(a1 + 32), "range");
  objc_msgSend(v12, "deleteCharactersInRange:", v13, v14);
  v15 = -1;
  do
  {
    if (v15 == 2)
    {
      v18 = 0;
      v17 = 101;
      goto LABEL_13;
    }
    v16 = objc_msgSend(*(id *)(a1 + 32), "rangeAtIndex:", v15 + 2);
    ++v15;
  }
  while (v16 == 0x7FFFFFFFFFFFFFFFLL);
  v17 = insertedSpaceInTextView_replacementRange__bulletStyles[v15];
  if (v15 == 2)
    v18 = objc_msgSend(v11, "integerValue");
  else
    v18 = 0;
LABEL_13:
  objc_msgSend(*(id *)(a1 + 48), "setTextStyle:removeExtraStyling:range:inTextStorage:", v17, 0, *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 40));
  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 40), "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "paragraphRangeForRange:", *(_QWORD *)(a1 + 64), 0);
    v22 = v21;

    v23 = (_QWORD *)MEMORY[0x1E0D63928];
    objc_msgSend(*(id *)(a1 + 40), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], *(_QWORD *)(a1 + 64), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");
    objc_msgSend(v25, "setStartingItemNumber:", v18);
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *v23, v25, v20, v22);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "attributesAtIndex:effectiveRange:", *(_QWORD *)(a1 + 64), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setTypingAttributes:", v26);

  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Created list"), CFSTR("Created list"), 0, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*v3, *(id *)(a1 + 56));
  v28 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ICTextController_insertedSpaceInTextView_replacementRange___block_invoke_3;
  block[3] = &unk_1E5C1D540;
  v31 = v27;
  v29 = v27;
  dispatch_after(v28, MEMORY[0x1E0C80D38], block);

}

uint64_t __61__ICTextController_insertedSpaceInTextView_replacementRange___block_invoke_2()
{
  return _UIAccessibilityUnblockPostingOfNotification();
}

void __61__ICTextController_insertedSpaceInTextView_replacementRange___block_invoke_3(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], *(id *)(a1 + 32));
}

- (void)setSelectionToIndex:(unint64_t)a3 onTextView:(id)a4
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 >= a3)
    v7 = a3;
  else
    v7 = v6;
  objc_msgSend(v8, "setSelectedRange:", v7, 0);

}

- (void)insertedText:(id)a3 replacementRange:(_NSRange)a4 inTextView:(id)a5 languageHasSpaces:(BOOL)a6
{
  uint64_t v6;

  LOBYTE(v6) = a6;
  -[ICTextController insertedText:replacementRange:inTextView:hashtagController:mentionsController:languageHasSpaces:parentAttachment:](self, "insertedText:replacementRange:inTextView:hashtagController:mentionsController:languageHasSpaces:parentAttachment:", a3, a4.location, a4.length, a5, 0, 0, v6, 0);
}

- (void)insertedText:(id)a3 replacementRange:(_NSRange)a4 inTextView:(id)a5 hashtagController:(id)a6 mentionsController:(id)a7 languageHasSpaces:(BOOL)a8 parentAttachment:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSUInteger v21;
  NSRange v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSUInteger v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSUInteger v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSRange v65;
  NSRange v66;

  length = a4.length;
  location = a4.location;
  v15 = a3;
  v16 = a5;
  v60 = a6;
  v17 = a7;
  v58 = a9;
  objc_msgSend(v16, "textStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v57 = v15;
  v59 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v15;
  }
  else
  {
    objc_msgSend(v15, "string");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;
  v21 = objc_msgSend(v19, "length");
  v66.length = objc_msgSend(v18, "length");
  v65.location = location;
  v65.length = v21;
  v66.location = 0;
  v22 = NSIntersectionRange(v65, v66);
  if (insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment__once != -1)
    dispatch_once(&insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment__once, &__block_literal_global_180);
  -[ICTextController keyboardLanguageForTextView:](self, "keyboardLanguageForTextView:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23 && (objc_msgSend(v23, "isEqualToString:", CFSTR("dictation")) & 1) == 0)
    insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment__currentKeyboardWritingDirection = objc_msgSend(MEMORY[0x1E0DC1290], "defaultWritingDirectionForLanguage:", v24);
  v63 = 0;
  v64 = 0;
  objc_msgSend(v18, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "getParagraphStart:end:contentsEnd:forRange:", &v64, 0, &v63, v22.location, v22.length);

  if (!self->_userChangedWritingDirection && v64 == v22.location && v63 == v22.location + v22.length)
  {
    v26 = objc_msgSend(v18, "safeCharacterRangeForRange:", location, objc_msgSend(v20, "length"));
    if (v27)
      -[ICTextController setParagraphWritingDirectionInRange:toDirection:inTextView:](self, "setParagraphWritingDirectionInRange:toDirection:inTextView:", v26, v27, insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment__currentKeyboardWritingDirection, v16);
  }
  if (!objc_msgSend(v20, "isEqualToString:", CFSTR("\n")) || length)
  {
    if (objc_msgSend(v20, "isEqualToString:", CFSTR(" ")) && !length)
      -[ICTextController insertedSpaceInTextView:replacementRange:](self, "insertedSpaceInTextView:replacementRange:", v16, location, 0);
  }
  else
  {
    v61 = 0;
    v62 = 0;
    objc_msgSend(v18, "string");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "getParagraphStart:end:contentsEnd:forRange:", &v62, 0, &v61, v22.location + 1, 0);

    if (v61 == v62)
    {
      objc_msgSend(v18, "string");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "paragraphRangeForRange:", v22.location + 1, 0);
      v32 = v31;

      if (v32)
      {
        objc_msgSend(v18, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v30, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v33)
        {
          if (objc_msgSend(v33, "preferSingleLine"))
          {
            -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:", 3, 0, v30, v32, v18);
            if (v16)
            {
              objc_msgSend(v18, "attributesAtIndex:effectiveRange:", v30, 0);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setTypingAttributes:", v35);

            }
          }
        }

      }
    }
  }
  -[ICTextController attachmentInsertionController](self, "attachmentInsertionController");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36
    && (v37 = (void *)v36,
        -[ICTextController note](self, "note"),
        v38 = (void *)objc_claimAutoreleasedReturnValue(),
        v38,
        v37,
        v38))
  {
    objc_msgSend(v18, "string");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "length");

    if (v22.location + v22.length <= v40)
    {
      -[ICTextController mentionsController](self, "mentionsController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextController note](self, "note");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE1(v54) = a8;
      LOBYTE(v54) = 0;
      v43 = objc_msgSend(v41, "checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:", v22.location, v22.length, v18, v42, v16, 1, v54, 0);

      if ((v43 & 1) == 0)
      {
        -[ICTextController hashtagController](self, "hashtagController");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTextController note](self, "note");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0;
LABEL_40:
        BYTE1(v55) = a8;
        LOBYTE(v55) = 0;
        objc_msgSend(v44, "checkForHashtagInEditedRange:ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:", v22.location, v22.length, v18, v45, v16, 1, v55, v56);

      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ICTextController note](self, "note");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        if (v60)
          -[ICTextController setHashtagController:](self, "setHashtagController:");
        if (v59)
          -[ICTextController setMentionsController:](self, "setMentionsController:");
        objc_msgSend(v18, "string");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "length");

        if (v22.location + v22.length <= v48)
        {
          -[ICTextController mentionsController](self, "mentionsController");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTextController note](self, "note");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          BYTE1(v54) = a8;
          LOBYTE(v54) = 0;
          v51 = objc_msgSend(v49, "checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:", v22.location, v22.length, v18, v50, v16, 1, v54, v58);

          if ((v51 & 1) == 0)
          {
            -[ICTextController hashtagController](self, "hashtagController");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICTextController note](self, "note");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v58;
            goto LABEL_40;
          }
        }
      }
    }
  }
  if (objc_msgSend(v20, "containsString:", CFSTR("\n")))
  {
    -[ICTextController mentionsController](self, "mentionsController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextController note](self, "note");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "newlineEnteredInNote:", v53);

  }
  self->_userChangedWritingDirection = 0;

}

uint64_t __133__ICTextController_insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0DC1290], "defaultWritingDirectionForLanguage:", 0);
  insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment__currentKeyboardWritingDirection = result;
  return result;
}

- (void)setParagraphWritingDirectionInRange:(_NSRange)a3 toDirection:(int64_t)a4 inTextView:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, uint64_t);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  length = a3.length;
  location = a3.location;
  v8 = a5;
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__46;
  v35 = __Block_byref_object_dispose__46;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__46;
  v29 = __Block_byref_object_dispose__46;
  v30 = 0;
  v10 = (_QWORD *)MEMORY[0x1E0D63928];
  v11 = *MEMORY[0x1E0D63928];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __79__ICTextController_setParagraphWritingDirectionInRange_toDirection_inTextView___block_invoke;
  v20 = &unk_1E5C218D8;
  v22 = &v31;
  v24 = a4;
  v12 = v9;
  v21 = v12;
  v23 = &v25;
  objc_msgSend(v12, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v11, location, length, 0, &v17);
  if (v32[5] || v26[5])
  {
    objc_msgSend(v8, "typingAttributes", v17, v18, v19, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    v15 = v32[5];
    if (v15)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *v10);
    v16 = v26[5];
    if (v16)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0DC1178]);
    objc_msgSend(v8, "setTypingAttributes:", v14);

  }
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

void __79__ICTextController_setParagraphWritingDirectionInRange_toDirection_inTextView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v7 = a2;
  v22 = v7;
  if (v7)
  {
    v8 = objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D63C90], "paragraphStyleNamed:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setWritingDirection:", *(_QWORD *)(a1 + 56));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "alignment")
    || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "alignment") == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAlignment:", 4);
  }
  v11 = *MEMORY[0x1E0D63928];
  v12 = *(void **)(a1 + 32);
  v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
  objc_msgSend(v12, "addAttribute:value:range:", v11, v13, a3, a4);

  v14 = *MEMORY[0x1E0DC1178];
  objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1178], a3, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = objc_msgSend(v15, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1290], "ic_mutableDefaultParagraphStyle");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setBaseWritingDirection:", *(_QWORD *)(a1 + 56));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "alignment")
    || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "alignment") == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAlignment:", 4);
  }
  v20 = *(void **)(a1 + 32);
  v21 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copy");
  objc_msgSend(v20, "addAttribute:value:range:", v14, v21, a3, a4);

}

- (BOOL)deleteBackwardForSpecialCasesInTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
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
  uint64_t v62;
  uint64_t v63;
  id v65;
  void *v66;
  char v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[2];
  _QWORD v72[3];

  v72[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "selectedRange");
  if (v7)
  {
    v8 = objc_msgSend(v4, "selectedRange");
    if (-[ICTextController removeListStyleBeforeDeletingParagraphContentIfNecessaryForTextView:textStorage:rangeToBeDeleted:blockBeforeEndEditing:](self, "removeListStyleBeforeDeletingParagraphContentIfNecessaryForTextView:textStorage:rangeToBeDeleted:blockBeforeEndEditing:", v4, v6, v8, v9, &__block_literal_global_186))
    {
      objc_msgSend(v4, "setSelectedRange:", v8, 0);
      goto LABEL_4;
    }
    goto LABEL_28;
  }
  objc_msgSend(v6, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "selectedRange");
  v14 = objc_msgSend(v11, "paragraphRangeForRange:", v12, v13);
  v16 = v15;

  v17 = objc_msgSend(v4, "selectedRange");
  v18 = v17;
  if (v17 == v14)
  {
    if (!v14)
    {
      if (-[ICTextController removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:](self, "removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:", v4, v6, 0, v16, 0))
      {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else
  {
    if (!v17)
      goto LABEL_28;
    if (v17 != 1
      || -[ICTextController attachmentsExistInRange:textStorage:](self, "attachmentsExistInRange:textStorage:", 0, 1, v6))
    {
      objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v18 - 1, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "setSelectedRange:", v18 - 1, 1);

          goto LABEL_4;
        }
      }

      goto LABEL_28;
    }
  }
  objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v18 - 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[ICTextController removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:](self, "removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:", v4, v6, v14, v16, v18);
  if (!v21 && v20 && objc_msgSend(v20, "isList"))
  {
    v69 = 0;
    v70 = 0;
    objc_msgSend(v6, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "getParagraphStart:end:contentsEnd:forRange:", &v70, 0, &v69, v18 - 1, 0);

    if (v70 != v69)
    {
      if (v18 >= objc_msgSend(v6, "length"))
      {
        objc_msgSend(v4, "setSelectedRange:", v18 - 1, 0);

LABEL_4:
        if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EED6F670)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v4, "textControllerDidHandleSpecialCaseEditing:", self);
        }
        v10 = 1;
        goto LABEL_40;
      }
      -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:", 3, 0, v14, v16, v6);
    }

  }
  else
  {

    if (v21)
      goto LABEL_4;
  }
LABEL_28:
  objc_msgSend(v6, "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v4, "selectedRange");
  v26 = objc_msgSend(v23, "paragraphRangeForRange:", v24, v25);
  v28 = v27;

  v29 = objc_msgSend(v4, "selectedRange");
  objc_msgSend(v6, "string");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "paragraphRangeForRange:", v29, 0);
  v33 = v32;

  if (v29 == v26 || v29 == v26 + 1)
  {
    v34 = objc_msgSend(v4, "selectedRange");
    v36 = v31 + v33;
    if (v34 + v35 >= v36 - 1)
    {
      v37 = objc_msgSend(v4, "selectedRange");
      if (v37 + v38 <= v36)
      {
        objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v29, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        objc_msgSend(v4, "textLayoutManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "textContentManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "uuid");
        v43 = objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          v44 = (void *)v43;
          objc_msgSend(v42, "outlineController");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "uuid");
          v46 = v28;
          v47 = v39;
          v48 = v42;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v45, "isUUIDCollapsed:", v49);

          v42 = v48;
          v39 = v47;
          v50 = v46;

          if ((v67 & 1) != 0)
          {
            v65 = objc_alloc(MEMORY[0x1E0CB3498]);
            objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Heading"), CFSTR("Heading"), 0, 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v71[0] = *MEMORY[0x1E0DC1100];
            objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
            v68 = v42;
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v72[0] = v52;
            v71[1] = *MEMORY[0x1E0DC1140];
            objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v72[1] = v53;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = (void *)objc_msgSend(v65, "initWithString:attributes:", v51, v54);

            objc_msgSend(v6, "attributedSubstringFromRange:", v26, v50);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "string");
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v57 = objc_msgSend(v56, "characterAtIndex:", objc_msgSend(v56, "length") - 1);
            objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v57) = objc_msgSend(v58, "characterIsMember:", v57);

            objc_msgSend(v4, "ic_textRangeFromCharacterRange:", v26, v50 - v57);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "replaceRange:withText:", v59, &stru_1E5C2F8C0);

            objc_msgSend(v4, "setAttributedMarkedText:selectedRange:", v66, 0, 0);
            objc_msgSend(v6, "setIsMarkingTextForHeadingRename:", 1);

            goto LABEL_4;
          }
        }

      }
    }
  }
  v60 = objc_msgSend(v4, "selectedRange");
  v62 = v61;
  objc_msgSend(v4, "selectedRange");
  if (!v63 && objc_msgSend(v4, "selectedRange"))
  {
    v60 = objc_msgSend(v4, "selectedRange") - 1;
    v62 = 1;
  }
  -[ICTextController notifyInlineAttachmentsDeletedInRange:ofTextStorage:](self, "notifyInlineAttachmentsDeletedInRange:ofTextStorage:", v60, v62, v6);
  v10 = 0;
LABEL_40:

  return v10;
}

void __60__ICTextController_deleteBackwardForSpecialCasesInTextView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(a2, "selectedRange");
  objc_msgSend(v6, "deleteCharactersInRange:", v4, v5);

}

- (void)notifyInlineAttachmentsDeletedInRange:(_NSRange)a3 ofTextStorage:(id)a4
{
  objc_msgSend(a4, "enumerateAttribute:inRange:options:usingBlock:", *MEMORY[0x1E0D63950], a3.location, a3.length, 0, &__block_literal_global_192_0);
}

void __72__ICTextController_notifyInlineAttachmentsDeletedInRange_ofTextStorage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D63730];
    objc_msgSend(v4, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D63738];
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, v7, v8);

  }
}

- (_NSRange)extendedSelectionRangeForCollapsedSectionHeadingWithRange:(_NSRange)a3 textView:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v18;
  NSUInteger v19;
  NSRange v20;
  NSUInteger v21;
  NSUInteger v22;
  NSRange v23;
  _NSRange result;
  NSRange v25;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  objc_opt_class();
  objc_msgSend(v6, "textLayoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textContentManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], location, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "outlineController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (objc_msgSend(v12, "isUUIDCollapsed:", v13))
    {
      v14 = objc_msgSend(v12, "rangeForUUID:", v13);
      if (location == v14)
      {
        v16 = v15;
        if (length == v15 || length == v15 - 1)
        {
          v18 = v14;
          v25.location = objc_msgSend(v12, "descendantRangeForUUID:", v13);
          v25.length = v19;
          v23.location = v18;
          v23.length = v16;
          v20 = NSUnionRange(v23, v25);
          location = v20.location;
          length = v20.length;
        }
      }
    }
  }

  v21 = location;
  v22 = length;
  result.length = v22;
  result.location = v21;
  return result;
}

- (BOOL)removeListStyleBeforeDeletingParagraphContentIfNecessaryForTextView:(id)a3 textStorage:(id)a4 rangeToBeDeleted:(_NSRange)a5 blockBeforeEndEditing:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  void (**v12)(id, id, id, NSUInteger, NSUInteger);
  NSUInteger v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  length = a5.length;
  location = a5.location;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, id, id, NSUInteger, NSUInteger))a6;
  v13 = location + length;
  if (objc_msgSend(v11, "length") <= location + length)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], location + length, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0DC1178];
    objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1178], location + length, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isList"))
    {
      v27 = 0;
      v28 = 0;
      objc_msgSend(v11, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "getParagraphStart:end:contentsEnd:forRange:", 0, &v27, &v28, location, length);

      v18 = v28 == v13;
      if (v28 == v13)
      {
        v24 = v15;
        v26 = v16;
        objc_msgSend(v11, "beginEditing");
        v25 = v14;
        v19 = (void *)objc_msgSend(v14, "mutableCopy");
        objc_msgSend(v19, "setStyle:", 3);
        objc_msgSend(v11, "attributesAtIndex:effectiveRange:", location + length, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "mutableCopy");

        objc_msgSend(v21, "setObject:forKey:", v19, *MEMORY[0x1E0D63928]);
        if (ICInternalSettingsIsTextKit2Enabled())
        {
          v22 = (void *)objc_msgSend(v26, "mutableCopy");
          objc_msgSend(v22, "setTextLists:", MEMORY[0x1E0C9AA60]);
          objc_msgSend(v21, "setObject:forKey:", v22, v24);

        }
        objc_msgSend(v11, "setAttributes:range:", v21, location + length, v27 - v28);
        if (v12)
          v12[2](v12, v10, v11, location, length);
        objc_msgSend(v11, "endEditing");

        v16 = v26;
        v14 = v25;
      }
    }
    else
    {
      v18 = 0;
    }

  }
  return v18;
}

- (BOOL)deleteWordBackwardForSpecialCasesInTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "selectedRange");
  v10 = objc_msgSend(v7, "paragraphRangeForRange:", v8 + v9, 0);
  v12 = v11;

  v13 = objc_msgSend(v4, "selectedRange");
  v15 = v13 + v14;
  if (v13 + v14 == v10
    || v13 + v14 >= v10 && objc_msgSend(v4, "selectedRange") <= v10
    || !(objc_msgSend(v4, "selectedRange") | v10))
  {
    v16 = -[ICTextController removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:](self, "removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:", v4, v6, v10, v12, v15);
    objc_msgSend(v4, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "beginEditing");

    objc_msgSend(v4, "textStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v16)
    {
      v20 = objc_msgSend(v4, "selectedRange");
      objc_msgSend(v19, "deleteCharactersInRange:", v20, v21);

      objc_msgSend(v4, "textStorage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "endEditing");

      objc_msgSend(v4, "setSelectedRange:", objc_msgSend(v4, "selectedRange"), 0);
      if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EED6F670)
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "textControllerDidHandleSpecialCaseEditing:", self);
      }
      v23 = 1;
      goto LABEL_15;
    }
    objc_msgSend(v18, "endEditing");

  }
  v24 = objc_msgSend(v4, "selectedRange");
  v26 = v25;
  objc_msgSend(v4, "selectedRange");
  if (!v27 && objc_msgSend(v4, "selectedRange"))
  {
    v24 = objc_msgSend(v4, "selectedRange") - 1;
    v26 = 1;
  }
  -[ICTextController notifyInlineAttachmentsDeletedInRange:ofTextStorage:](self, "notifyInlineAttachmentsDeletedInRange:ofTextStorage:", v24, v26, v6);
  v23 = 0;
LABEL_15:

  return v23;
}

- (BOOL)removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:(id)a3 textStorage:(id)a4 paragraphRange:(_NSRange)a5 andLocation:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  unint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  unint64_t v20;
  void *v21;

  length = a5.length;
  location = a5.location;
  v11 = a3;
  v12 = a4;
  v13 = objc_msgSend(v12, "length");
  v14 = (_QWORD *)MEMORY[0x1E0D63928];
  if (v13 <= a6)
  {
    objc_msgSend(v11, "typingAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], a6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v11, "selectedRange"))
  {
    objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *v14, objc_msgSend(v11, "selectedRange") - 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_11;
  }
  else
  {
    v17 = 0;
    if (!v15)
    {
LABEL_11:
      v19 = 0;
      goto LABEL_16;
    }
  }
  if (!objc_msgSend(v15, "isList"))
    goto LABEL_11;
  if (v17)
  {
    v18 = objc_msgSend(v17, "style");
    if (v18 == objc_msgSend(v15, "style"))
      goto LABEL_11;
  }
  -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:", 3, 0, location, length, v12);
  v20 = objc_msgSend(v11, "selectedRange");
  if (v20 >= objc_msgSend(v12, "length"))
  {
    objc_msgSend(v11, "setTypingAttributes:", MEMORY[0x1E0C9AA70]);
  }
  else
  {
    objc_msgSend(v12, "attributesAtIndex:effectiveRange:", objc_msgSend(v11, "selectedRange"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTypingAttributes:", v21);

  }
  v19 = 1;
LABEL_16:

  return v19;
}

- (id)strippedTypingAttributesAtStartOfParagraph:(id)a3 atTheEndOfDocument:(BOOL)a4 isTyping:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v13;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[ICTextController note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPerformingMerge");

  v11 = v8;
  if ((v10 & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)ICTextController;
    -[ICTTTextController strippedTypingAttributesAtStartOfParagraph:atTheEndOfDocument:isTyping:](&v13, sel_strippedTypingAttributesAtStartOfParagraph_atTheEndOfDocument_isTyping_, v8, v6, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (BOOL)shouldRetainFirstListStyleForFilteredAttributedSubstring:(id)a3 fromRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v16;
  NSUInteger v18;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v7 = location + length;
  if (location + length >= objc_msgSend(v6, "length"))
  {
    v9 = 0;
LABEL_14:
    v16 = 1;
    goto LABEL_15;
  }
  objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], location, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || !objc_msgSend(v8, "isList"))
    goto LABEL_14;
  v18 = 0;
  objc_msgSend(v6, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "ic_paragraphRangeForRange:contentEnd:", location, 0, &v18);
  v13 = v12;

  v16 = location == v11 && v7 >= v18 || v7 > v11 + v13;
LABEL_15:

  return v16;
}

+ (id)removeBeginningListStyleIfNecessaryForAttributedString:(id)a3 fromTextStorage:(id)a4 andRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  length = a5.length;
  location = a5.location;
  v8 = a3;
  v9 = a4;
  if (!+[ICTextController shouldRetainFirstListStyleForFilteredAttributedSubstring:fromRange:](ICTextController, "shouldRetainFirstListStyleForFilteredAttributedSubstring:fromRange:", v9, location, length))
  {
    v10 = (uint64_t *)MEMORY[0x1E0D63928];
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setStyle:", 3);
    v13 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v9, "beginSkippingTimestampUpdates");
    v14 = *v10;
    objc_msgSend(v13, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "paragraphRangeForRange:", 0, 0);
    objc_msgSend(v13, "addAttribute:value:range:", v14, v12, v16, v17);

    objc_msgSend(v9, "endSkippingTimestampUpdates");
    v8 = v13;
  }

  return v8;
}

- (void)setNote:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4 withLayoutManager:(id)a5
{
  -[ICTextController setNote:stylingTextUsingSeparateTextStorageForRendering:withLayoutManager:traitCollection:firstVisibleCharLocation:](self, "setNote:stylingTextUsingSeparateTextStorageForRendering:withLayoutManager:traitCollection:firstVisibleCharLocation:", a3, a4, a5, 0, 0);
}

- (void)setNote:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4 withLayoutManager:(id)a5 traitCollection:(id)a6 firstVisibleCharLocation:(unint64_t)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ICTTTextStorage *v19;
  void *v20;
  void *v21;
  ICTextController *v22;
  ICTTTextStorage *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  ICTTTextStorage *v32;
  void *v33;
  ICTTTextStorage *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  _QWORD v49[6];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  v9 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  -[ICTextController setNote:](self, "setNote:", v11);
  if (v11)
  {
    objc_msgSend(v11, "textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v9)
    {
      objc_msgSend(v14, "setWantsUndoCommands:", 0);

      objc_opt_class();
      objc_msgSend(v11, "textStorage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "styler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "zoomController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = [ICTTTextStorage alloc];
      objc_msgSend(v11, "textStorage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ICTextController isForPrint](self, "isForPrint"))
        v22 = self;
      else
        v22 = 0;
      v23 = -[ICTTTextStorage initWithAttributedString:replicaID:sourceZoomController:keepSourceZoomController:existingStyler:](v19, "initWithAttributedString:replicaID:sourceZoomController:keepSourceZoomController:existingStyler:", v20, v21, v18, 0, v22);

      if (-[ICTTTextController disableSingleLineA](self, "disableSingleLineA"))
        -[ICTTTextController styleText:inRange:fixModelAttributes:](self, "styleText:inRange:fixModelAttributes:", v23, 0, -[ICTTTextStorage length](v23, "length"), 0);
      objc_msgSend(v11, "setNoteHasChanges:", MEMORY[0x1E0C9AAA0]);
      v56 = 0;
      v57 = &v56;
      v58 = 0x3032000000;
      v59 = __Block_byref_object_copy__46;
      v60 = __Block_byref_object_dispose__46;
      v61 = 0;
      v50 = 0;
      v51 = &v50;
      v52 = 0x3010000000;
      v54 = 0;
      v55 = 0;
      v53 = "";
      v24 = -[ICTTTextStorage length](v23, "length");
      v25 = *MEMORY[0x1E0DC10F8];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __135__ICTextController_setNote_stylingTextUsingSeparateTextStorageForRendering_withLayoutManager_traitCollection_firstVisibleCharLocation___block_invoke;
      v49[3] = &unk_1E5C21980;
      v49[4] = &v56;
      v49[5] = &v50;
      -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](v23, "enumerateAttribute:inRange:options:usingBlock:", v25, 0, v24, 2, v49);
      if (v57[5] && -[ICTTTextStorage length](v23, "length"))
      {
        objc_opt_class();
        ICDynamicCast();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          if (objc_msgSend(v26, "requiresSpaceAfterAttachmentForPrinting"))
          {
            -[ICTTTextStorage string](v23, "string");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v28, "characterAtIndex:", -[ICTTTextStorage length](v23, "length") - 1);

            v30 = v51[4];
            v29 = v51[5];
            if (v29 + v30 == -[ICTTTextStorage length](v23, "length")
              || (v37 = v51[4], v36 = v51[5], v36 + v37 == -[ICTTTextStorage length](v23, "length") - 1)
              && (objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet"),
                  v38 = (void *)objc_claimAutoreleasedReturnValue(),
                  v39 = objc_msgSend(v38, "characterIsMember:", v48),
                  v38,
                  v39))
            {
              -[ICTTTextStorage mutableString](v23, "mutableString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "appendString:", CFSTR(" "));

            }
          }
        }

      }
      if (-[ICTextController isForPrint](self, "isForPrint"))
      {
        objc_msgSend(v11, "calculateDocumentController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "hasExpressions") && objc_msgSend(v11, "calculatePreviewBehavior") != 1)
        {
          objc_msgSend(v40, "updateAffectingChangeCounts:", 0);
          v41 = -[ICTTTextStorage ic_range](v23, "ic_range");
          objc_msgSend(v40, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v23, v41, v42, 0, 1);
        }

      }
      objc_msgSend(v12, "textContainers");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTextController filterAttachmentsForPrintingInAttributedString:traitCollection:textContainer:](self, "filterAttachmentsForPrintingInAttributedString:traitCollection:textContainer:", v23, v13, v44);
      objc_msgSend(v12, "icReplaceTextStorage:", v23);
      -[ICTextController trackedToDoParagraphs](self, "trackedToDoParagraphs");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTrackedToDoParagraphs:", v45);

      objc_msgSend(v12, "textStorage");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v46, "length"), 0);

      objc_msgSend(v11, "textStorage");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setWantsUndoCommands:", 1);

      _Block_object_dispose(&v50, 8);
      _Block_object_dispose(&v56, 8);

    }
    else
    {
      objc_msgSend(v14, "setStyler:", self);
      objc_msgSend(v15, "setWantsUndoCommands:", 0);
      -[ICTextController refreshTextStylingForTextStorage:withTextController:](self, "refreshTextStylingForTextStorage:withTextController:", v15, self);
      objc_msgSend(v15, "setWantsUndoCommands:", 1);
      objc_msgSend(v11, "setNoteHasChanges:", MEMORY[0x1E0C9AAA0]);
      objc_msgSend(v12, "icReplaceTextStorage:", v15);
    }

  }
  else
  {
    v32 = [ICTTTextStorage alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[ICTTTextStorage initWithData:replicaID:](v32, "initWithData:replicaID:", 0, v33);
    -[ICTextController setEmptyTextStorage:](self, "setEmptyTextStorage:", v34);

    -[ICTextController emptyTextStorage](self, "emptyTextStorage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "icReplaceTextStorage:", v35);

  }
}

void __135__ICTextController_setNote_stylingTextUsingSeparateTextStorageForRendering_withLayoutManager_traitCollection_firstVisibleCharLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v10;
  uint64_t v11;
  id v12;

  v10 = a2;
  if (v10)
  {
    v12 = v10;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v10 = v12;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v11 + 32) = a3;
    *(_QWORD *)(v11 + 40) = a4;
    if (a5)
      *a5 = 1;
  }

}

+ (double)extraWidthNeededForStyle:(id)a3 range:(_NSRange)a4 attributedString:(id)a5 textView:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;

  length = a4.length;
  location = a4.location;
  v11 = a6;
  v12 = a5;
  v13 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v13, "setIndent:", 0);
  objc_msgSend(a1, "indentForStyle:range:attributedString:textView:", v13, location, length, v12, v11);
  v15 = v14;

  return v15;
}

+ (double)extraBulletWidthForNumberedListWithMaxItemNumber:(id)a3 textFont:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC1350];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "ic_preferredFontForBodyText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  v10 = v9;

  objc_msgSend(v8, "ic_fontWithSize:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ic_fontWithTabularNumbers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_msgSend(v7, "longValue");

  objc_msgSend(v13, "localizedStringWithFormat:", CFSTR("%ld."), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0DC1138];
  v22[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeWithAttributes:", v16);
  v18 = v17;

  if (v18 + 9.2 <= 36.0)
    v19 = 0.0;
  else
    v19 = v18 + 9.2 - 36.0;

  return v19;
}

- (void)setTrackAddedExtraNewlineRanges:(BOOL)a3
{
  void *v5;

  if (self->_trackAddedExtraNewlineRanges != a3)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextController setTrackedRangesForAddedExtraNewlines:](self, "setTrackedRangesForAddedExtraNewlines:", v5);

    }
    else
    {
      -[ICTextController setTrackedRangesForAddedExtraNewlines:](self, "setTrackedRangesForAddedExtraNewlines:", 0);
    }
    self->_trackAddedExtraNewlineRanges = a3;
  }
}

- (void)trackExtraNewLineRangeIfNecessary:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  id v20;

  length = a3.length;
  location = a3.location;
  if (!-[ICTextController trackAddedExtraNewlineRanges](self, "trackAddedExtraNewlineRanges"))
    return;
  -[ICTextController trackedRangesForAddedExtraNewlines](self, "trackedRangesForAddedExtraNewlines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    goto LABEL_11;
  v8 = 0;
  v9 = 1;
  do
  {
    -[ICTextController trackedRangesForAddedExtraNewlines](self, "trackedRangesForAddedExtraNewlines");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rangeValue");
    v14 = v13;

    if (location >= v12)
    {
      if (location > v12 + v14)
        goto LABEL_9;
      -[ICTextController trackedRangesForAddedExtraNewlines](self, "trackedRangesForAddedExtraNewlines");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v12, v14 + length);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v8, v16);
      v9 = 0;
    }
    else
    {
      -[ICTextController trackedRangesForAddedExtraNewlines](self, "trackedRangesForAddedExtraNewlines");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v12 + length, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v8, v16);
    }

LABEL_9:
    ++v8;
    -[ICTextController trackedRangesForAddedExtraNewlines](self, "trackedRangesForAddedExtraNewlines");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

  }
  while (v18 > v8);
  if ((v9 & 1) != 0)
  {
LABEL_11:
    -[ICTextController trackedRangesForAddedExtraNewlines](self, "trackedRangesForAddedExtraNewlines");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v19);

  }
}

- (BOOL)shouldChangeTextInTextStorage:(id)a3 range:(_NSRange)a4 replacementString:(id)a5
{
  return 1;
}

void __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "textController:updatedTrackedAttribute:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  NSRange v23;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v23.location = objc_msgSend(v6, "characterRange");
  if (NSIntersectionRange(v23, *(NSRange *)(a1 + 64)).length
    && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_opt_class();
      ICDynamicCast();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textLayoutManagers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            ICProtocolCast();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "textController:removedTrackedAttribute:", *(_QWORD *)(a1 + 56), v6);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "layoutManagers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_4;
      v15[3] = &unk_1E5C219A8;
      v15[4] = *(_QWORD *)(a1 + 56);
      v16 = v6;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

    }
  }

}

void __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "textController:removedTrackedAttribute:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)createToDoItemForCharacterRange:(_NSRange)a3 paragraphStyle:(id)a4 textStorage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  ICTrackedParagraph *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  ICTrackedParagraph *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  length = a3.length;
  location = a3.location;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(ICTrackedParagraph);
  -[ICTrackedParagraph setParagraph:](v11, "setParagraph:", v9);
  -[ICTrackedParagraph setCharacterRange:](v11, "setCharacterRange:", location, length);
  -[ICTextController trackedToDoParagraphs](self, "trackedToDoParagraphs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "todoTrackingUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_opt_class();
    ICDynamicCast();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textLayoutManagers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          ICProtocolCast();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "textController:addedTrackedAttribute:", self, v11);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

  }
  else
  {
    objc_msgSend(v10, "layoutManagers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __79__ICTextController_createToDoItemForCharacterRange_paragraphStyle_textStorage___block_invoke;
    v22[3] = &unk_1E5C219A8;
    v22[4] = self;
    v23 = v11;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v22);

  }
}

void __79__ICTextController_createToDoItemForCharacterRange_paragraphStyle_textStorage___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "textController:addedTrackedAttribute:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)updateTrackedToDoParagraphsAfterIndex:(unint64_t)a3 byDelta:(int64_t)a4 excludingSeenParagraphs:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;
  int64_t v14;

  v8 = a5;
  -[ICTextController trackedToDoParagraphs](self, "trackedToDoParagraphs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__ICTextController_updateTrackedToDoParagraphsAfterIndex_byDelta_excludingSeenParagraphs___block_invoke;
  v11[3] = &unk_1E5C21A20;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v10 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __90__ICTextController_updateTrackedToDoParagraphsAfterIndex_byDelta_excludingSeenParagraphs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "characterRange");
  if (v6 >= *(_QWORD *)(a1 + 40))
  {
    v8 = v6;
    v9 = v7;
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v13) & 1) == 0)
    {
      v10 = *(_QWORD *)(a1 + 40);
      if (v8 == v10)
        v11 = v8;
      else
        v11 = *(_QWORD *)(a1 + 48) + v8;
      if (v8 == v10)
        v12 = *(_QWORD *)(a1 + 48);
      else
        v12 = 0;
      objc_msgSend(v5, "setCharacterRange:", v11, v9 + v12);
    }
  }

}

- (void)filterAttachmentsForPrintingInAttributedString:(id)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x1E0DC10F8];
  v12 = objc_msgSend(v8, "length");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __97__ICTextController_filterAttachmentsForPrintingInAttributedString_traitCollection_textContainer___block_invoke;
  v16[3] = &unk_1E5C21A48;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v8;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v16);

}

void __97__ICTextController_filterAttachmentsForPrintingInAttributedString_traitCollection_textContainer___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "printableTextContentForAppearanceType:traitCollection:textContainer:", objc_msgSend(*(id *)(a1 + 32), "overrideAppearanceType"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 56), "replaceCharactersInRange:withAttributedString:", a3, a4, v7);
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v15;
    objc_msgSend(*(id *)(a1 + 56), "attributesAtIndex:effectiveRange:", a3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "printableTextContentForAppearanceType:traitCollection:styleAttributes:textContainer:", objc_msgSend(*(id *)(a1 + 32), "overrideAppearanceType"), *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = *(void **)(a1 + 56);
      objc_msgSend(v9, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "replaceCharactersInRange:withString:", a3, a4, v12);

      v13 = *(void **)(a1 + 56);
      objc_msgSend(v10, "attributesAtIndex:effectiveRange:", 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAttributes:range:", v14, a3, objc_msgSend(v10, "length"));

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)inlineAttachmentInTextView:(id)a3 atIndex:(unint64_t)a4 outAttachment:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  int v11;
  BOOL v12;
  void *v13;

  objc_msgSend(a3, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63950], a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EECADDB0))
  {
    v10 = v9;
    v11 = objc_msgSend(MEMORY[0x1E0D63C60], "isInlineAttachment:", v10);
    v12 = v11;
    if (a5 && v11)
    {
      -[ICTextController note](self, "note");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "inlineAttachmentWithICTTAttachment:", v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)canConvertInlineAttachmentToTextInTextView:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = v7;
  v12 = location != 0x7FFFFFFFFFFFFFFFLL
     && (objc_msgSend(v7, "textStorage"),
         v9 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v9, "string"),
         v10 = (void *)objc_claimAutoreleasedReturnValue(),
         v11 = objc_msgSend(v10, "ic_rangeIsValid:", location, length),
         v10,
         v9,
         v11)
     && -[ICTextController inlineAttachmentInTextView:atIndex:outAttachment:](self, "inlineAttachmentInTextView:atIndex:outAttachment:", v8, location, 0);

  return v12;
}

- (void)convertInlineAttachmentToTextInTextView:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  length = a4.length;
  location = a4.location;
  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ic_rangeIsValid:", location, length);

    if (v11)
    {
      v25 = 0;
      v12 = -[ICTextController inlineAttachmentInTextView:atIndex:outAttachment:](self, "inlineAttachmentInTextView:atIndex:outAttachment:", v8, location, &v25);
      v13 = v25;
      v14 = v13;
      if (v12)
      {
        if (!v13)
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((inlineAttachment) != nil)", "-[ICTextController convertInlineAttachmentToTextInTextView:forRange:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "inlineAttachment");
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *MEMORY[0x1E0D63730];
        objc_msgSend(v14, "note");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *MEMORY[0x1E0D63738];
        v27[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "postNotificationName:object:userInfo:", v16, v17, v18);

        objc_msgSend(v14, "displayText");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "ic_stringByRemovingLanguageDirectionCharacters");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "textStorage");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "replaceCharactersInRange:withString:", location, 1, v20);

        v22 = objc_msgSend(v20, "length");
        if (length)
          v23 = v22;
        else
          v23 = 0;
        if (length)
          v24 = location;
        else
          v24 = v22 + location;
        objc_msgSend(v8, "setSelectedRange:", v24, v23);

      }
    }
  }

}

- (BOOL)canAddToTagsInTextView:(id)a3 forRange:(_NSRange)a4
{
  BOOL v4;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  if (a4.location == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v15 = 0;
  v6 = -[ICTextController inlineAttachmentInTextView:atIndex:outAttachment:](self, "inlineAttachmentInTextView:atIndex:outAttachment:", a3, a4.location, &v15);
  v7 = v15;
  v8 = v7;
  if (!v6)
    goto LABEL_8;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((inlineAttachment) != nil)", "-[ICTextController canAddToTagsInTextView:forRange:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "inlineAttachment");
  if (objc_msgSend(v8, "isHashtagAttachment"))
  {
    v9 = (void *)MEMORY[0x1E0D63B20];
    objc_msgSend(v8, "tokenContentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextController note](self, "note");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hashtagWithStandardizedContent:account:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v13 == 0;
  }
  else
  {
LABEL_8:
    v4 = 0;
  }

  return v4;
}

- (void)addToTagsInTextView:(id)a3 forRange:(_NSRange)a4
{
  void *v4;
  void *v5;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18[9];

  if (a4.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18[7] = v4;
    v18[8] = v5;
    v18[0] = 0;
    v7 = -[ICTextController inlineAttachmentInTextView:atIndex:outAttachment:](self, "inlineAttachmentInTextView:atIndex:outAttachment:", a3, a4.location, v18);
    v8 = v18[0];
    v9 = v8;
    if (v7)
    {
      if (!v8)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((inlineAttachment) != nil)", "-[ICTextController addToTagsInTextView:forRange:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "inlineAttachment");
      v10 = (void *)MEMORY[0x1E0D63B20];
      objc_msgSend(v9, "displayText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextController note](self, "note");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hashtagWithDisplayText:account:createIfNecessary:", v11, v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ICTextController addToTagsInTextView:forRange:].cold.1(v14, v9);

      -[ICTextController note](self, "note");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "managedObjectContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ic_save");

    }
  }
}

void __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "nsParagraphStyleForICTTParagraphStyle:range:attributedString:textView:", *(_QWORD *)(a1 + 40), a3, a4, *(_QWORD *)(a1 + 48), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v7, a3, a4);
    v7 = v8;
  }

}

- (void)styleDataDetectorTypesForPreviewInTextStorage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  void *v20;
  ICTextController *v21;
  NSUInteger length;
  void *v23;
  char v24;
  void *v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  char v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSUInteger range1;
  uint64_t v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;
  NSRange v53;
  NSRange v54;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50 = 0;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 2080, &v50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v50;
  v7 = v6;
  if (v5)
  {
    v39 = v6;
    objc_msgSend(v4, "attributedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = objc_claimAutoreleasedReturnValue();

    v40 = v5;
    v38 = v9;
    range1 = objc_msgSend(v4, "length");
    objc_msgSend(v5, "matchesInString:options:range:", v9, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginSkippingTimestampUpdates");
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v47;
      v41 = *MEMORY[0x1E0DC1160];
      v14 = (_QWORD *)MEMORY[0x1E0D63928];
      v42 = *(_QWORD *)v47;
      do
      {
        v15 = 0;
        v44 = v12;
        do
        {
          if (*(_QWORD *)v47 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v15);
          v17 = objc_msgSend(v16, "range");
          v19 = v18;
          objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *v14, v17, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[ICTextController shouldHighlightStyleAsLink:](self, "shouldHighlightStyleAsLink:", objc_msgSend(v20, "style")))
          {
            v21 = self;
            v53.location = 0;
            v53.length = range1;
            v54.location = v17;
            v54.length = v19;
            length = NSIntersectionRange(v53, v54).length;
            v23 = v4;
            v24 = objc_msgSend(MEMORY[0x1E0D63BB0], "hasMentionInTextStorage:inRange:", v4, v17, v19);
            objc_msgSend(v16, "URL");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
              v26 = length == 0;
            else
              v26 = 1;
            if (!v26 && (v24 & 1) == 0)
              objc_msgSend(v23, "addAttribute:value:range:", v41, v25, v17, v19);
            objc_msgSend(v16, "phoneNumber");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
              v28 = length == 0;
            else
              v28 = 1;
            if (v28)
              v29 = 1;
            else
              v29 = v24;
            v4 = v23;
            if ((v29 & 1) == 0)
              objc_msgSend(v23, "addAttribute:value:range:", v41, v27, v17, v19);

            self = v21;
            v13 = v42;
            v12 = v44;
            v14 = (_QWORD *)MEMORY[0x1E0D63928];
          }

          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "endSkippingTimestampUpdates");
    v7 = v39;
    v5 = v40;
    v30 = v38;
  }
  else
  {
    v30 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[ICTextController styleDataDetectorTypesForPreviewInTextStorage:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);
  }

}

- (BOOL)shouldHighlightStyleAsLink:(unsigned int)a3
{
  return 1;
}

- (id)keyboardLanguageForTextView:(id)a3
{
  if (!a3)
    return 0;
  ICKeyboardLanguageForBaseView(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)attributedStringToPasteWithAdaptedParagraphStyles:(id)a3 pasteRange:(_NSRange)a4 textStorage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSUInteger v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSUInteger v23;
  void *v24;
  uint64_t v25;
  NSUInteger v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  ICTTTextStorage *v32;
  id v33;
  void *v34;
  ICTTTextStorage *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v50;
  char v51;
  NSRange v52;
  NSRange v53;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  if (!objc_msgSend(v8, "length"))
  {
    v19 = v8;
    goto LABEL_32;
  }
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
  v52 = (NSRange)xmmword_1ACA582A0;
  v53 = (NSRange)xmmword_1ACA582A0;
  v11 = (uint64_t *)MEMORY[0x1E0D63928];
  objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], 0, &v53);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    goto LABEL_29;
  v14 = objc_msgSend(v12, "style");
  if (v8 && objc_msgSend(v8, "length"))
  {
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *v11, objc_msgSend(v8, "length") - 1, &v52);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_msgSend(v15, "style");
      LODWORD(v17) = v16 == 3;
      if (v16 == 3 && v14 == 3)
      {
        if (NSIntersectionRange(v53, v52).length)
        {
          v18 = v52.length + v52.location - (v53.length + v53.location);
          if (v52.length + v52.location <= v53.length + v53.location)
          {
            LOBYTE(v17) = 0;
            goto LABEL_20;
          }
          v52.location = v53.length + v53.location;
          v52.length = v18;
        }
        LOBYTE(v17) = 1;
LABEL_20:
        v13 = v15;
LABEL_21:
        objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *v11, location, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *v11, 0, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v17;
          v17 = objc_msgSend(v20, "mutableCopy");
          objc_msgSend((id)v17, "setWritingDirection:", objc_msgSend(v50, "writingDirection"));
          v21 = *MEMORY[0x1E0D63928];
          v22 = v9;
          v23 = length;
          v24 = (void *)objc_msgSend((id)v17, "copy");
          v25 = v21;
          v11 = (uint64_t *)MEMORY[0x1E0D63928];
          objc_msgSend(v10, "addAttribute:value:range:", v25, v24, v53);

          length = v23;
          v9 = v22;

          LOBYTE(v17) = v51;
        }

        if ((v17 & 1) == 0)
          goto LABEL_29;
        goto LABEL_24;
      }
      v13 = v15;
      goto LABEL_15;
    }
    v13 = 0;
  }
  LODWORD(v17) = 0;
LABEL_15:
  if (v14 == 3)
    goto LABEL_21;
  if ((_DWORD)v17)
  {
LABEL_24:
    v26 = length - 1;
    if (!length)
      v26 = 0;
    objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *v11, location + v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *v11, objc_msgSend(v8, "length") - 1, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v27, "mutableCopy");
      objc_msgSend(v29, "setWritingDirection:", objc_msgSend(v28, "writingDirection"));
      v30 = *v11;
      v31 = (void *)objc_msgSend(v29, "copy");
      objc_msgSend(v10, "addAttribute:value:range:", v30, v31, v52);

    }
  }
LABEL_29:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = [ICTTTextStorage alloc];
    v33 = objc_alloc_init(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[ICTTTextStorage initWithAttributedString:replicaID:](v32, "initWithAttributedString:replicaID:", v33, v34);

    v36 = -[ICTTTextStorage ic_range](v35, "ic_range");
    -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v35, "replaceCharactersInRange:withAttributedString:", v36, v37, v10);
    objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v10, "ic_range");
    -[ICTTTextStorage filteredAttributedStringForUTI:range:](v35, "filteredAttributedStringForUTI:range:", v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v41, "mutableCopy");

    v43 = *v11;
    v44 = objc_msgSend(v42, "ic_range");
    objc_msgSend(v42, "removeAttribute:range:", v43, v44, v45);
    v46 = *MEMORY[0x1E0D63958];
    v47 = objc_msgSend(v42, "ic_range");
    objc_msgSend(v42, "removeAttribute:range:", v46, v47, v48);

    v10 = v42;
  }
  v19 = (id)objc_msgSend(v10, "copy");

LABEL_32:
  return v19;
}

- (void)setDisableAddingExtraLinesIfNeeded:(BOOL)a3
{
  self->_disableAddingExtraLinesIfNeeded = a3;
}

- (void)setIsForPrint:(BOOL)a3
{
  self->_isForPrint = a3;
}

- (ICAttachmentInsertionController)attachmentInsertionController
{
  return (ICAttachmentInsertionController *)objc_loadWeakRetained((id *)&self->_attachmentInsertionController);
}

- (BOOL)userChangedWritingDirection
{
  return self->_userChangedWritingDirection;
}

- (void)setUserChangedWritingDirection:(BOOL)a3
{
  self->_userChangedWritingDirection = a3;
}

- (NSMutableArray)trackedRangesForAddedExtraNewlines
{
  return self->_trackedRangesForAddedExtraNewlines;
}

- (void)setTrackedRangesForAddedExtraNewlines:(id)a3
{
  objc_storeStrong((id *)&self->_trackedRangesForAddedExtraNewlines, a3);
}

- (BOOL)trackAddedExtraNewlineRanges
{
  return self->_trackAddedExtraNewlineRanges;
}

- (BOOL)isConvertingTables
{
  return self->_isConvertingTables;
}

- (void)setIsConvertingTables:(BOOL)a3
{
  self->_isConvertingTables = a3;
}

- (unint64_t)overrideAppearanceType
{
  return self->_overrideAppearanceType;
}

- (void)setOverrideAppearanceType:(unint64_t)a3
{
  self->_overrideAppearanceType = a3;
}

- (ICMentionsController)mentionsController
{
  return (ICMentionsController *)objc_loadWeakRetained((id *)&self->_mentionsController);
}

- (ICHashtagController)hashtagController
{
  return (ICHashtagController *)objc_loadWeakRetained((id *)&self->_hashtagController);
}

- (unint64_t)pauseMergeForScrollingCounter
{
  return self->_pauseMergeForScrollingCounter;
}

- (void)setPauseMergeForScrollingCounter:(unint64_t)a3
{
  self->_pauseMergeForScrollingCounter = a3;
}

- (BOOL)shouldMergeNoteAfterScrolling
{
  return self->_shouldMergeNoteAfterScrolling;
}

- (void)setShouldMergeNoteAfterScrolling:(BOOL)a3
{
  self->_shouldMergeNoteAfterScrolling = a3;
}

- (BOOL)isAutoListInsertionDisabled
{
  return self->_isAutoListInsertionDisabled;
}

- (void)setIsAutoListInsertionDisabled:(BOOL)a3
{
  self->_isAutoListInsertionDisabled = a3;
}

- (ICTTTextStorage)emptyTextStorage
{
  return self->_emptyTextStorage;
}

- (void)setEmptyTextStorage:(id)a3
{
  objc_storeStrong((id *)&self->_emptyTextStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyTextStorage, 0);
  objc_destroyWeak((id *)&self->_hashtagController);
  objc_destroyWeak((id *)&self->_mentionsController);
  objc_destroyWeak((id *)&self->_authorHighlightsController);
  objc_storeStrong((id *)&self->_trackedRangesForAddedExtraNewlines, 0);
  objc_storeStrong((id *)&self->_trackedToDoParagraphs, 0);
  objc_destroyWeak((id *)&self->_attachmentInsertionController);
  objc_destroyWeak((id *)&self->_note);
}

void __43__ICTextController_updateAttachmentsInNote__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "attempted to update an attachment without an identifier: %@ %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_4();
}

void __43__ICTextController_updateAttachmentsInNote__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AC7A1000, a2, a3, "found a non-ICTTAttachment attachment: %@", (uint8_t *)&v3);
}

void __47__ICTextController_toggleBlockQuoteInTextView___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "blockQuoteLevel");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v1, v2, "blockQuoteLevel changed from %ld to %ld.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

- (void)addExtraLinesIfNeededToTextStorage:(os_log_t)log editedRange:actualLengthIncrease:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "error: editedRange out of bounds", v1, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)addToTagsInTextView:(void *)a1 forRange:(void *)a2 .cold.1(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "ic_loggingIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v4, v5, "User adopted tag (%@) for inline attachment (%@)", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)styleDataDetectorTypesForPreviewInTextStorage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Could not create NSDataDetector.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
