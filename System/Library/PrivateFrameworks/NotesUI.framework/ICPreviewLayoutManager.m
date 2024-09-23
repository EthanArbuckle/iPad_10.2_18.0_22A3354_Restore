@implementation ICPreviewLayoutManager

- (ICPreviewLayoutManager)initWithNote:(id)a3 maxCharacterCount:(unint64_t)a4 textContainer:(id)a5 textController:(id)a6
{
  id v10;
  id v11;
  id v12;
  ICPreviewLayoutManager *v13;
  ICPreviewLayoutManager *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void (**v25)(void);
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  ICTTTextStorage *v34;
  void *v35;
  ICTTTextStorage *v36;
  uint64_t v37;
  uint64_t v38;
  ICTTTextStorage *v39;
  _QWORD v41[4];
  id v42;
  ICTTTextStorage *v43;
  _QWORD aBlock[4];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  objc_super v53;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v53.receiver = self;
  v53.super_class = (Class)ICPreviewLayoutManager;
  v13 = -[ICPreviewLayoutManager init](&v53, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_maxCharacterCount = a4;
    -[ICPreviewLayoutManager setAllowsNonContiguousLayout:](v13, "setAllowsNonContiguousLayout:", 1);
    objc_msgSend(v10, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributedString");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "styler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v19 = (void *)objc_opt_new();

      objc_msgSend(v10, "textStorage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "refreshTextStylingForTextStorage:withTextController:", v20, v19);

      v12 = v19;
    }
    v21 = objc_msgSend(v10, "calculatePreviewBehavior");
    v22 = MEMORY[0x1E0C809B0];
    if (v21 != 1)
    {
      objc_msgSend(v10, "calculateDocumentController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateAffectingChangeCounts:", 0);
      if (objc_msgSend(v23, "hasExpressions"))
      {
        v47 = 0;
        v48 = &v47;
        v49 = 0x3032000000;
        v50 = __Block_byref_object_copy__70;
        v51 = __Block_byref_object_dispose__70;
        v52 = 0;
        aBlock[0] = v22;
        aBlock[1] = 3221225472;
        aBlock[2] = __86__ICPreviewLayoutManager_initWithNote_maxCharacterCount_textContainer_textController___block_invoke;
        aBlock[3] = &unk_1E5C238F8;
        v46 = &v47;
        v24 = v16;
        v45 = v24;
        v25 = (void (**)(void))_Block_copy(aBlock);
        v25[2]();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend((id)v48[5], "ic_range");
        objc_msgSend(v23, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v26, v27, v28, 0, 1);

        v16 = (id)v48[5];
        _Block_object_dispose(&v47, 8);

      }
    }
    v29 = objc_msgSend(v16, "length");
    if (v29 >= a4)
      v30 = a4;
    else
      v30 = v29;
    objc_msgSend(v16, "attributedSubstringFromRange:", 0, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "managedObjectContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:formatter:", v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = [ICTTTextStorage alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[ICTTTextStorage initWithData:replicaID:](v34, "initWithData:replicaID:", 0, v35);

    -[ICTTTextStorage setWantsUndoCommands:](v36, "setWantsUndoCommands:", 0);
    -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v36, "replaceCharactersInRange:withAttributedString:", 0, 0, v33);
    objc_msgSend(v12, "styleDataDetectorTypesForPreviewInTextStorage:", v36);
    v37 = *MEMORY[0x1E0DC10F8];
    v38 = -[ICTTTextStorage length](v36, "length");
    v41[0] = v22;
    v41[1] = 3221225472;
    v41[2] = __86__ICPreviewLayoutManager_initWithNote_maxCharacterCount_textContainer_textController___block_invoke_2;
    v41[3] = &unk_1E5C22B38;
    v42 = v10;
    v43 = v36;
    v39 = v36;
    -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](v39, "enumerateAttribute:inRange:options:usingBlock:", v37, 0, v38, 0, v41);
    -[ICTTTextStorage setStyler:](v39, "setStyler:", v12);
    objc_msgSend(v12, "styleText:inExactRange:fixModelAttributes:", v39, 0, -[ICTTTextStorage length](v39, "length"), 0);
    -[ICPreviewLayoutManager setTextStorage:](v14, "setTextStorage:", v39);
    -[ICPreviewLayoutManager setStrongTextStorage:](v14, "setStrongTextStorage:", v39);
    -[ICPreviewLayoutManager addTextContainer:](v14, "addTextContainer:", v11);

  }
  return v14;
}

id __86__ICPreviewLayoutManager_initWithNote_maxCharacterCount_textContainer_textController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    v4 = v3;
    v5 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = v4;
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = objc_msgSend(v6, "ic_range");
    objc_msgSend(v6, "attributedSubstringFromRange:", v7, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "mutableCopy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

void __86__ICPreviewLayoutManager_initWithNote_maxCharacterCount_textContainer_textController___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EECADDB0))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v12;
    objc_msgSend(v7, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachmentInContext:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[ICTextAttachment textAttachmentWithAttachment:](ICTextAttachment, "textAttachmentWithAttachment:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC10F8], v11, a3, a4);

  }
}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[8];
  _QWORD v13[4];

  y = a4.y;
  x = a4.x;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v7 = -[ICPreviewLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", a3.location, a3.length, 0);
  v9 = v8;
  -[ICPreviewLayoutManager textStorage](self, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC10F8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__ICPreviewLayoutManager_drawGlyphsForGlyphRange_atPoint___block_invoke;
  v12[3] = &unk_1E5C23920;
  *(CGFloat *)&v12[6] = x;
  *(CGFloat *)&v12[7] = y;
  v12[4] = self;
  v12[5] = v13;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, v7, v9, 0, v12);

  _Block_object_dispose(v13, 8);
}

void __58__ICPreviewLayoutManager_drawGlyphsForGlyphRange_atPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double x;
  double y;
  double width;
  double height;
  void *v18;
  int v19;
  ICLinkSnapshotGenerator *v20;
  void *v21;
  ICLinkSnapshotGenerator *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
  v11 = v10;
  objc_msgSend(v8, "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "textContainerForGlyphAtIndex:effectiveRange:", v9, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", v9, v11, v13);
    v32 = CGRectOffset(v31, *(CGFloat *)(a1 + 48), *(double *)(a1 + 56) + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
    objc_msgSend(v8, "attachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "usesLinkPresentation");

    if (v19)
    {
      v20 = [ICLinkSnapshotGenerator alloc];
      objc_msgSend(v8, "attachment");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[ICLinkSnapshotGenerator initWithAttachment:](v20, "initWithAttachment:", v21);

      -[ICLinkSnapshotGenerator setInsideSystemPaper:](v22, "setInsideSystemPaper:", objc_msgSend(*(id *)(a1 + 32), "isInsideSystemPaper"));
      -[ICLinkSnapshotGenerator snapshot](v22, "snapshot");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "size");
      v25 = v24;
      objc_msgSend(v23, "size");
      v27 = v26;
      objc_msgSend(v23, "drawInRect:", x, y, v25, v26);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v27
                                                                  - height
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24);
    }
    else
    {
      objc_msgSend(v8, "attachment");
      v22 = (ICLinkSnapshotGenerator *)objc_claimAutoreleasedReturnValue();
      -[ICLinkSnapshotGenerator attachmentModel](v22, "attachmentModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "drawPreviewInRect:", x, y, width, height);
    }

  }
  else
  {
    v28 = *(double *)(a1 + 48);
    v29 = *(double *)(a1 + 56) + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v30.receiver = *(id *)(a1 + 32);
    v30.super_class = (Class)ICPreviewLayoutManager;
    objc_msgSendSuper2(&v30, sel_drawGlyphsForGlyphRange_atPoint_, v9, v11, v28, v29);
    objc_msgSend(*(id *)(a1 + 32), "drawListStylesForCharacterRange:atPoint:", a3, a4, v28, v29);
    objc_msgSend(*(id *)(a1 + 32), "drawTodosForCharacterRange:atOrigin:", a3, a4, v28, v29);
  }

}

- (void)drawTodosForCharacterRange:(_NSRange)a3 atOrigin:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  uint64_t v10;
  _QWORD v11[7];

  y = a4.y;
  x = a4.x;
  length = a3.length;
  location = a3.location;
  -[ICPreviewLayoutManager textStorage](self, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D63928];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__ICPreviewLayoutManager_drawTodosForCharacterRange_atOrigin___block_invoke;
  v11[3] = &unk_1E5C1E450;
  v11[4] = self;
  *(CGFloat *)&v11[5] = x;
  *(CGFloat *)&v11[6] = y;
  objc_msgSend(v9, "ic_enumerateUnclampedAttribute:inRange:options:usingBlock:", v10, location, length, 0, v11);

}

void __62__ICPreviewLayoutManager_drawTodosForCharacterRange_atOrigin___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v7, "isList")
      && objc_msgSend(v7, "style") == 103)
    {
      objc_msgSend(*(id *)(a1 + 32), "drawTodoItemForListRange:paragraphStyle:atOrigin:", a3, a4, v7, *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
  }

}

- (id)todoImageForParagraphStyle:(id)a3
{
  void *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(a3, "todo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "done");

  v5 = CFSTR("circle");
  if (v4)
    v5 = CFSTR("checkmark.circle.fill");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "ICGrayTodoButtonColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "ICControlAccentColor");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v4)
    v10 = (void *)v8;
  else
    v10 = v7;
  v11 = v10;
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    ICAccessibilitySystemDarkenedColor(v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v12;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "ic_largeSystemImageNamed:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ic_imageWithTint:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)drawTodoItemForListRange:(_NSRange)a3 paragraphStyle:(id)a4 atOrigin:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  NSUInteger length;
  NSUInteger location;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat width;
  CGFloat height;
  void *v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double MaxX;
  double v28;
  double MinX;
  double v30;
  double v31;
  double MidY;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  y = a5.y;
  x = a5.x;
  length = a3.length;
  location = a3.location;
  v38 = a4;
  -[ICPreviewLayoutManager todoImageForParagraphStyle:](self, "todoImageForParagraphStyle:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPreviewLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", -[ICPreviewLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0), 0);
  v40 = CGRectOffset(v39, x, y);
  v11 = v40.origin.x;
  v12 = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  -[ICBaseLayoutManager textContainer](self, "textContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineFragmentPadding");
  v17 = v16;
  v41.origin.x = v11;
  v41.origin.y = v12;
  v41.size.width = width;
  v41.size.height = height;
  v42 = CGRectInset(v41, v17, 0.0);
  v18 = v42.origin.x;
  v19 = v42.origin.y;
  v20 = v42.size.width;
  v21 = v42.size.height;

  v43.origin.x = v18;
  v43.origin.y = v19;
  v43.size.width = v20;
  v43.size.height = v21;
  if (!CGRectIsNull(v43) && v10)
  {
    v22 = objc_msgSend(v38, "layoutWritingDirection");
    v23 = v18;
    v24 = v19;
    v25 = v20;
    v26 = v21;
    if (v22)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v23);
      v28 = 8.0;
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v23);
      objc_msgSend(v10, "size");
      MaxX = MinX - v30;
      v28 = -8.0;
    }
    v31 = MaxX + v28;
    v44.origin.x = v18;
    v44.origin.y = v19;
    v44.size.width = v20;
    v44.size.height = v21;
    MidY = CGRectGetMidY(v44);
    objc_msgSend(v10, "size");
    v34 = round(MidY + v33 * -0.5);
    objc_msgSend(v10, "size");
    v36 = v35;
    objc_msgSend(v10, "size");
    objc_msgSend(v10, "drawInRect:", v31, v34, v36, v37);
  }

}

- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  return +[ICBaseLayoutManager defaultLinkTextAttributes](ICBaseLayoutManager, "defaultLinkTextAttributes", a3, a4);
}

- (BOOL)isInsideSystemPaper
{
  return self->_insideSystemPaper;
}

- (void)setInsideSystemPaper:(BOOL)a3
{
  self->_insideSystemPaper = a3;
}

- (unint64_t)maxCharacterCount
{
  return self->_maxCharacterCount;
}

- (void)setMaxCharacterCount:(unint64_t)a3
{
  self->_maxCharacterCount = a3;
}

- (NSTextStorage)strongTextStorage
{
  return self->_strongTextStorage;
}

- (void)setStrongTextStorage:(id)a3
{
  objc_storeStrong((id *)&self->_strongTextStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongTextStorage, 0);
}

@end
