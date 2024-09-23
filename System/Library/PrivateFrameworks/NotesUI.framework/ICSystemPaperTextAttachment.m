@implementation ICSystemPaperTextAttachment

+ (BOOL)isEnabled
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[ICSelectorDelayer cancelPreviousFireRequests](self->_paperChangeSelectorDelayer, "cancelPreviousFireRequests");
  v3.receiver = self;
  v3.super_class = (Class)ICSystemPaperTextAttachment;
  -[ICSystemPaperTextAttachment dealloc](&v3, sel_dealloc);
}

- (ICSystemPaperTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ICSystemPaperTextAttachment *v9;
  ICSystemPaperTextAttachment *v10;
  void *v11;
  uint64_t v12;
  NSString *paperIdentifierBeforeAttachmentIsSet;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15.receiver = self;
  v15.super_class = (Class)ICSystemPaperTextAttachment;
  v9 = -[ICAbstractTextAttachment initWithData:ofType:](&v15, sel_initWithData_ofType_, v8, v7);
  v10 = v9;
  if (!v6)
  {

    if (!v10)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v9)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    paperIdentifierBeforeAttachmentIsSet = v10->_paperIdentifierBeforeAttachmentIsSet;
    v10->_paperIdentifierBeforeAttachmentIsSet = (NSString *)v12;

  }
LABEL_6:

  return v10;
}

- (ICDrawingHashtagsAndMentionsController)hashtagsAndMentionsController
{
  void *v3;
  ICDrawingHashtagsAndMentionsController *v4;
  void *v5;
  ICDrawingHashtagsAndMentionsController *v6;
  ICDrawingHashtagsAndMentionsController *hashtagsAndMentionsController;

  if (!self->_hashtagsAndMentionsController)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [ICDrawingHashtagsAndMentionsController alloc];
      -[ICAbstractTextAttachment attachment](self, "attachment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[ICDrawingHashtagsAndMentionsController initWithAttachment:](v4, "initWithAttachment:", v5);
      hashtagsAndMentionsController = self->_hashtagsAndMentionsController;
      self->_hashtagsAndMentionsController = v6;

    }
  }
  return self->_hashtagsAndMentionsController;
}

- (id)fileType
{
  return (id)*MEMORY[0x1E0CD12E0];
}

- (BOOL)canDragWithoutSelecting
{
  return 0;
}

- (id)contents
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
}

- (NSHashTable)systemPaperViews
{
  NSHashTable *systemPaperViews;
  NSHashTable *v4;
  NSHashTable *v5;

  systemPaperViews = self->_systemPaperViews;
  if (!systemPaperViews)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_systemPaperViews;
    self->_systemPaperViews = v4;

    systemPaperViews = self->_systemPaperViews;
  }
  return systemPaperViews;
}

- (id)attachmentAsNSTextAttachment
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fallbackImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0DC12B0]);
  objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithData:ofType:", v3, v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

  return v6;
}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ICPrintableTextAttachment *v11;
  void *v12;
  ICPrintableTextAttachment *v13;
  void *v14;
  void *v15;
  __int128 v16;
  void *v17;
  _OWORD v19[3];
  _OWORD v20[2];
  __int128 v21;

  objc_msgSend(MEMORY[0x1E0D639E8], "appearanceInfoWithType:", 0, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D63A40];
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generateImageForAttachment:fullResolution:appearanceInfo:", v8, 1, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "ic_PNGData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = [ICPrintableTextAttachment alloc];
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICPrintableTextAttachment initWithData:ofType:](v11, "initWithData:ofType:", v10, v12);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v20[0] = *MEMORY[0x1E0C9BAA8];
    v20[1] = v16;
    v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v19[0] = v20[0];
    v19[1] = v16;
    v19[2] = v21;
    +[ICAttachmentPreviewImageLoader orientedImage:withTransform:background:backgroundTransform:](ICAttachmentPreviewImageLoader, "orientedImage:withTransform:background:backgroundTransform:", v15, v20, 1, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICPrintableTextAttachment setImage:](v13, "setImage:", v17);
  }

  return v14;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect result;

  v11.receiver = self;
  v11.super_class = (Class)ICSystemPaperTextAttachment;
  -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v11, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x, a7.y);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect result;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v34.receiver = self;
  v34.super_class = (Class)ICSystemPaperTextAttachment;
  v14 = a3;
  -[ICBaseTextAttachment attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:](&v34, sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_, v14, a6, v12, v11, width, height, x, y);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v14, "layoutManager", v34.receiver, v34.super_class);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v27 = v26;
    v29 = v28;

    v22 = width / (v27 / v29);
    v16 = 0.0;
    v18 = 0.0;
    v20 = width;
  }
  v30 = v16;
  v31 = v18;
  v32 = v20;
  v33 = v22;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (id)_image
{
  return 0;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id location;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v30.receiver = self;
    v30.super_class = (Class)ICSystemPaperTextAttachment;
    -[ICSystemPaperTextAttachment viewProviderForParentView:location:textContainer:](&v30, sel_viewProviderForParentView_location_textContainer_, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "containsObject:", v13);

    if ((v14 & 1) == 0)
    {
      -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      objc_initWeak(&location, self);
      objc_msgSend(v11, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __80__ICSystemPaperTextAttachment_viewProviderForParentView_location_textContainer___block_invoke;
      v27 = &unk_1E5C1E020;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v17, "ic_addDidMoveToWindowHandler:", &v24);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v8, "window", v24, v25, v26, v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v8, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICInkPaletteController sharedToolPickerForWindow:](ICInkPaletteController, "sharedToolPickerForWindow:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_msgSend(v20, "isVisible");
      objc_msgSend(v11, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setVisible:forFirstResponder:", v21, v22);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __80__ICSystemPaperTextAttachment_viewProviderForParentView_location_textContainer___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "configureHashtagAndMentionsForView:", v3);

}

- (void)configureHashtagAndMentionsForView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v4, "tiledViewAttachmentViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[ICAbstractTextAttachment attachment](self, "attachment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWantsMentionDetection:", objc_msgSend(v11, "isSharedViaICloud"));

        -[ICAbstractTextAttachment attachment](self, "attachment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "note");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWantsHashtagDetection:", objc_msgSend(v13, "isPasswordProtected") ^ 1);

        objc_msgSend(v4, "window");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[ICSystemPaperTextAttachment hashtagsAndMentionsController](self, "hashtagsAndMentionsController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setHashtagAndMentionsDelegate:", v15);

        }
        else
        {
          objc_msgSend(v10, "setHashtagAndMentionsDelegate:", 0);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    v19 = objc_msgSend(v17, "containsObject:", v4);

    if ((v19 & 1) == 0)
      -[ICInlineCanvasTextAttachment updatePaletteVisibility](self, "updatePaletteVisibility");
    -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = CFSTR("ICSystemPaperTextAttachmentDidAppearNotification");
  }
  else
  {
    objc_msgSend(v17, "removeObject:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = CFSTR("ICSystemPaperTextAttachmentWillDisappearNotification");
  }
  objc_msgSend(v21, "postNotificationName:object:", v23, v4);

}

- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)ICSystemPaperTextAttachment;
    -[ICSystemPaperTextAttachment viewProviderForParentView:characterIndex:layoutManager:](&v17, sel_viewProviderForParentView_characterIndex_layoutManager_, v8, a4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v8, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICInkPaletteController sharedToolPickerForWindow:](ICInkPaletteController, "sharedToolPickerForWindow:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "isVisible");
      objc_msgSend(v10, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setVisible:forFirstResponder:", v15, v16);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v43 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a7;
  -[ICSystemPaperTextAttachment setCachedDrawingViewForPlaceView:](self, "setCachedDrawingViewForPlaceView:", v15);
  -[ICSystemPaperTextAttachment setCachedControlViewForPlaceView:](self, "setCachedControlViewForPlaceView:", v16);
  -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v15);

  -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v15);

  v41.receiver = self;
  v41.super_class = (Class)ICSystemPaperTextAttachment;
  v35 = v17;
  v36 = v16;
  -[ICSystemPaperTextAttachment placeView:withFrame:inParentView:characterIndex:layoutManager:](&v41, sel_placeView_withFrame_inParentView_characterIndex_layoutManager_, v15, v16, a6, v17, x, y, width, height);
  if ((v19 & 1) == 0)
    -[ICInlineCanvasTextAttachment updatePaletteVisibility](self, "updatePaletteVisibility");
  ICProtocolCast();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v21, "tiledViewAttachmentViews");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v27, "hashtagAndMentionsDelegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSystemPaperTextAttachment hashtagsAndMentionsController](self, "hashtagsAndMentionsController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28 != v29)
        {
          -[ICAbstractTextAttachment attachment](self, "attachment");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setWantsMentionDetection:", objc_msgSend(v30, "isSharedViaICloud"));

          -[ICAbstractTextAttachment attachment](self, "attachment");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "note");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setWantsHashtagDetection:", objc_msgSend(v32, "isPasswordProtected") ^ 1);

          -[ICSystemPaperTextAttachment hashtagsAndMentionsController](self, "hashtagsAndMentionsController");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setHashtagAndMentionsDelegate:", v33);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v24);
  }

  -[ICSystemPaperTextAttachment setCachedDrawingViewForPlaceView:](self, "setCachedDrawingViewForPlaceView:", 0);
  -[ICSystemPaperTextAttachment setCachedControlViewForPlaceView:](self, "setCachedControlViewForPlaceView:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "postNotificationName:object:", CFSTR("ICSystemPaperTextAttachmentDidAppearNotification"), v15);

}

- (void)detachView:(id)a3 fromParentView:(id)a4
{
  id v6;
  id v7;
  int IsTextKit2Enabled;
  void *v9;
  void *v10;
  ICSelectorDelayer **p_paperChangeSelectorDelayer;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("ICSystemPaperTextAttachmentWillDisappearNotification"), v6);

  if (IsTextKit2Enabled)
  {
    v26.receiver = self;
    v26.super_class = (Class)ICSystemPaperTextAttachment;
    -[ICBaseTextAttachment detachView:fromParentView:](&v26, sel_detachView_fromParentView_, v6, v7);
    -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v6);

    p_paperChangeSelectorDelayer = &self->_paperChangeSelectorDelayer;
    if ((-[ICSelectorDelayer isScheduledToFire](*p_paperChangeSelectorDelayer, "isScheduledToFire") & 1) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  v25.receiver = self;
  v25.super_class = (Class)ICSystemPaperTextAttachment;
  -[ICBaseTextAttachment detachView:fromParentView:](&v25, sel_detachView_fromParentView_, v6, v7);
  -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObject:", v6);

  -[ICSystemPaperTextAttachment cachedDrawingViewForPlaceView](self, "cachedDrawingViewForPlaceView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v6)
  {
    -[ICSystemPaperTextAttachment cachedControlViewForPlaceView](self, "cachedControlViewForPlaceView");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v7)
      goto LABEL_15;
  }
  else
  {

  }
  ICProtocolCast();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v15, "tiledViewAttachmentViews", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "setHashtagAndMentionsDelegate:", 0);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v18);
  }

LABEL_15:
  p_paperChangeSelectorDelayer = &self->_paperChangeSelectorDelayer;
  if (-[ICSelectorDelayer isScheduledToFire](*p_paperChangeSelectorDelayer, "isScheduledToFire"))
LABEL_16:
    -[ICSelectorDelayer fireImmediately](*p_paperChangeSelectorDelayer, "fireImmediately");
LABEL_17:

}

- (id)inlineViews
{
  void *v2;
  void *v3;

  -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attachmentViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        ICProtocolCast();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "topLevelAttachmentView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (ICSelectorDelayer)paperChangeSelectorDelayer
{
  ICSelectorDelayer *paperChangeSelectorDelayer;
  ICSelectorDelayer *v4;
  ICSelectorDelayer *v5;

  paperChangeSelectorDelayer = self->_paperChangeSelectorDelayer;
  if (!paperChangeSelectorDelayer)
  {
    v4 = (ICSelectorDelayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_paperDidChange, 0, 1, 2.5);
    v5 = self->_paperChangeSelectorDelayer;
    self->_paperChangeSelectorDelayer = v4;

    paperChangeSelectorDelayer = self->_paperChangeSelectorDelayer;
  }
  return paperChangeSelectorDelayer;
}

- (void)paperDidChange
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Received debounced paperDidChange for drawing %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_3();
}

uint64_t __45__ICSystemPaperTextAttachment_paperDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasPaperForm:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setDidRunPaperFormDetection:", 0);
}

void __45__ICSystemPaperTextAttachment_paperDidChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ICSystemPaperTextAttachment_paperDidChange__block_invoke_3;
  v5[3] = &unk_1E5C1D9A8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v5);

}

uint64_t __45__ICSystemPaperTextAttachment_paperDidChange__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAttachmentChangeCountAndSave:", *(_QWORD *)(a1 + 40));
}

- (void)updateAttachmentChangeCountAndSave:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateModificationDateAndChangeCount");

  objc_msgSend(v3, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "regenerateTitle:snippet:", 1, 1);

  if (v6)
  {
    objc_msgSend(v3, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markShareDirtyIfNeededWithReason:", CFSTR("Updated title after paper change"));

    objc_msgSend(v3, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateChangeCountWithReason:", CFSTR("Updated title after paper change"));

  }
  objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Paper changed"));
  objc_msgSend(v3, "setPreviewUpdateDate:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModificationDate:", v9);

  objc_msgSend(v3, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_save");

  +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generatePreviewIfNeededForAttachment:", v3);

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "workerManagedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICPaperSearchIndexer shared](ICPaperSearchIndexer, "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__ICSystemPaperTextAttachment_updateAttachmentChangeCountAndSave___block_invoke;
  v17[3] = &unk_1E5C1D540;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v14, "updateIndexForAttachment:userInitiated:managedObjectContext:completionHandler:", v15, 1, v16, v17);

}

void __66__ICSystemPaperTextAttachment_updateAttachmentChangeCountAndSave___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__ICSystemPaperTextAttachment_updateAttachmentChangeCountAndSave___block_invoke_2;
  v2[3] = &unk_1E5C1D540;
  v3 = v1;
  objc_msgSend(v3, "performBlock:", v2);

}

uint64_t __66__ICSystemPaperTextAttachment_updateAttachmentChangeCountAndSave___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", CFSTR("Updated index from paperDidChange"));
}

- (void)setSystemPaperViews:(id)a3
{
  objc_storeStrong((id *)&self->_systemPaperViews, a3);
}

- (NSString)paperIdentifierBeforeAttachmentIsSet
{
  return self->_paperIdentifierBeforeAttachmentIsSet;
}

- (void)setPaperIdentifierBeforeAttachmentIsSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setHashtagsAndMentionsController:(id)a3
{
  objc_storeStrong((id *)&self->_hashtagsAndMentionsController, a3);
}

- (UIView)cachedDrawingViewForPlaceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_cachedDrawingViewForPlaceView);
}

- (void)setCachedDrawingViewForPlaceView:(id)a3
{
  objc_storeWeak((id *)&self->_cachedDrawingViewForPlaceView, a3);
}

- (UIView)cachedControlViewForPlaceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_cachedControlViewForPlaceView);
}

- (void)setCachedControlViewForPlaceView:(id)a3
{
  objc_storeWeak((id *)&self->_cachedControlViewForPlaceView, a3);
}

- (void)setPaperChangeSelectorDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_paperChangeSelectorDelayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paperChangeSelectorDelayer, 0);
  objc_destroyWeak((id *)&self->_cachedControlViewForPlaceView);
  objc_destroyWeak((id *)&self->_cachedDrawingViewForPlaceView);
  objc_storeStrong((id *)&self->_hashtagsAndMentionsController, 0);
  objc_storeStrong((id *)&self->_paperIdentifierBeforeAttachmentIsSet, 0);
  objc_storeStrong((id *)&self->_systemPaperViews, 0);
}

- (ICSystemPaperTextAttachment)initWithPaperIdentifier:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  ICSystemPaperTextAttachment *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CD12E0];
  v10.receiver = self;
  v10.super_class = (Class)ICSystemPaperTextAttachment;
  v8 = -[ICAbstractTextAttachment initWithData:ofType:](&v10, sel_initWithData_ofType_, v6, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_paperIdentifierBeforeAttachmentIsSet, a3);

  return v8;
}

- (NSURL)_paperBundleURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_opt_class();
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "paperBundleURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "temporaryDirectoryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v6;
}

- (NSURL)_nonEncryptedContentCRContextURL
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasswordProtected");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paperCoherenceContextURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v5;
}

- (NSURL)_encryptionDelegateCRContextURL
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasswordProtected");

  if (v4)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paperCoherenceContextURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSURL *)v6;
}

- (NSString)_paperIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICSystemPaperTextAttachment paperIdentifierBeforeAttachmentIsSet](self, "paperIdentifierBeforeAttachmentIsSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (void)_linkCanvasElementsDidChange
{
  void *v3;
  void *v4;
  id v5;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modificationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModificationDate:", v3);

}

- (CGSize)_paperSizeHint
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWidth");
  v5 = v4;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeHeight");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGRect)_paperBoundsHint
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  objc_opt_class();
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "paperContentBoundsHint");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_paperDidChangeLocally
{
  void *v3;
  id v4;

  -[ICSystemPaperTextAttachment paperChangeSelectorDelayer](self, "paperChangeSelectorDelayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreviousFireRequests");

  -[ICSystemPaperTextAttachment paperChangeSelectorDelayer](self, "paperChangeSelectorDelayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestFire");

}

@end
