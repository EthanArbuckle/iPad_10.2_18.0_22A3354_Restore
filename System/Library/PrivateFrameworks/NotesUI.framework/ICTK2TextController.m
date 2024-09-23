@implementation ICTK2TextController

- (void)updateHighlightsInRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICTextController authorHighlightsController](self, "authorHighlightsController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performHighlightUpdatesForRange:inTextStorage:updates:", location, length, v7, 0);

}

- (void)setNote:(id)a3 firstVisibleLocation:(unint64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[ICTextController setNote:](self, "setNote:", v5);
  objc_msgSend(v5, "textStorage");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setStyler:", self);
  objc_msgSend(v6, "setWantsUndoCommands:", 0);
  -[ICTextController refreshTextStylingForTextStorage:withTextController:](self, "refreshTextStylingForTextStorage:withTextController:", v6, self);
  objc_msgSend(v6, "setWantsUndoCommands:", 1);

}

- (void)updateAttachmentsSelectionStateInTextStorage:(id)a3 forSelectedRanges:(id)a4 textView:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a4;
  v8 = a5;
  v9 = *MEMORY[0x1E0DC10F8];
  v10 = a3;
  v11 = objc_msgSend(v10, "ic_range");
  v13 = v12;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__ICTK2TextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_textView___block_invoke;
  v16[3] = &unk_1E5C1EBC8;
  v17 = v7;
  v18 = v8;
  v14 = v8;
  v15 = v7;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v9, v11, v13, 0, v16);

}

void __95__ICTK2TextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_textView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  _QWORD v20[6];

  v7 = a2;
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __95__ICTK2TextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_textView___block_invoke_2;
    v20[3] = &__block_descriptor_48_e24_B32__0__NSValue_8Q16_B24l;
    v20[4] = a3;
    v20[5] = a4;
    v9 = objc_msgSend(v8, "ic_containsObjectPassingTest:", v20);
    objc_msgSend(*(id *)(a1 + 40), "textLayoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "existingAttachmentViewForIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        objc_msgSend(v13, "setSelected:", v9);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_12;
    if (objc_msgSend(MEMORY[0x1E0D641E0], "deviceIsMac"))
    {
      objc_msgSend(v7, "fileType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D636B0]))
      {

LABEL_12:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "existingAttachmentViewForIdentifier:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v7, a3, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "view");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v19 = 1.0;
        if ((_DWORD)v9)
          v19 = 0.5;
        objc_msgSend(v17, "ic_setAlpha:", v19);

        goto LABEL_18;
      }
      objc_msgSend(v7, "fileType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D63680]);

      if (v16)
        goto LABEL_12;
    }
LABEL_18:

  }
}

BOOL __95__ICTK2TextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_textView___block_invoke_2(NSRange *a1, void *a2)
{
  NSUInteger v3;
  NSRange v5;

  v5.location = objc_msgSend(a2, "rangeValue");
  v5.length = v3;
  return NSIntersectionRange(a1[32], v5).length != 0;
}

@end
