@implementation ICTextAttachment

- (ICTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICTextAttachment;
  return -[ICAbstractTextAttachment initWithData:ofType:](&v5, sel_initWithData_ofType_, a3, a4);
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)attachmentBoundsMargins
{
  void *v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "preferredViewSize") == 1)
  {
    v4 = -[ICAbstractTextAttachment supportsMultipleThumbnailsOnSameLine](self, "supportsMultipleThumbnailsOnSameLine");

    if (v4)
      v5 = 2.0;
    else
      v5 = 0.0;
    v6 = 4.0;
    if (!v4)
      v6 = 0.0;
  }
  else
  {

    v5 = 0.0;
    v6 = 0.0;
  }
  v7 = 0.0;
  v8 = v5;
  result.var3 = v8;
  result.var2 = v5;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

- (CGRect)attachmentBoundsIncludingMarginsFromAttachmentBounds:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICTextAttachment attachmentBoundsMargins](self, "attachmentBoundsMargins");
  v9 = width + v7 + v8;
  v12 = height + v10 + v11;
  v13 = x;
  v14 = y;
  v15 = v9;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  objc_super v44;
  CGRect result;

  y = a7.y;
  x = a7.x;
  height = a6.size.height;
  width = a6.size.width;
  v11 = a6.origin.y;
  v12 = a6.origin.x;
  v16 = a3;
  v17 = a5;
  v44.receiver = self;
  v44.super_class = (Class)ICTextAttachment;
  -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v44, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, v16, a4, v17, v12, v11, width, height, x, y);
  v19 = v18;
  v21 = v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "descender");
        v21 = v21 + v24;
      }

    }
  }
  -[ICTextAttachment attachmentSizeForTextContainer:proposedLineFragment:](self, "attachmentSizeForTextContainer:proposedLineFragment:", v17, v12, v11, width, height);
  if (v25 >= 1.0)
    v27 = v25;
  else
    v27 = 1.0;
  if (v26 >= 1.0)
    v28 = v26;
  else
    v28 = 1.0;
  if (-[ICAbstractTextAttachment supportsMultipleThumbnailsOnSameLine](self, "supportsMultipleThumbnailsOnSameLine"))
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "preferredViewSize");

    if (v30 == 1)
    {
      objc_msgSend((id)objc_opt_class(), "defaultAttachmentThumbnailViewHeight");
      v28 = v31;
      v27 = fmax(v27, 30.0);
    }
  }
  -[ICTextAttachment attachmentBoundsIncludingMarginsFromAttachmentBounds:](self, "attachmentBoundsIncludingMarginsFromAttachmentBounds:", v19, v21, v27, v28);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  v40 = v33;
  v41 = v35;
  v42 = v37;
  v43 = v39;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

+ (id)textAttachmentWithAttachment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "textAttachmentClassForAttachment:", v4)), "initWithAttachment:", v4);

  return v5;
}

+ (BOOL)textAttachmentIsContent:(id)a3
{
  id v3;
  int v4;
  objc_class *v5;
  void *v6;

  v3 = a3;
  if (!textAttachmentIsContent__UIDictationClass)
    textAttachmentIsContent__UIDictationClass = (uint64_t)NSClassFromString(CFSTR("_UIDictationAttachment"));
  if (!textAttachmentIsContent__UITextPlaceholderAttachment)
    textAttachmentIsContent__UITextPlaceholderAttachment = (uint64_t)NSClassFromString(CFSTR("_UITextPlaceholderAttachment"));
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("_UIAnimatedTextAttachment")) ^ 1;

  }
  return v4;
}

+ (Class)textAttachmentClassForAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend(v3, "isAuthenticated"))
  {
    objc_msgSend(v3, "media");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "media");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isAuthenticated");

    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }
  if ((objc_msgSend(v3, "needsInitialFetchFromCloud") & 1) != 0
    || ((objc_msgSend(v3, "isPasswordProtected") ^ 1 | v6) & 1) != 0)
  {
    switch(objc_msgSend(v3, "attachmentType"))
    {
      case 0u:
      case 2u:
      case 3u:
      case 5u:
      case 7u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xCu:
        break;
      case 1u:
        if (((objc_msgSend(v3, "isPasswordProtected") & 1) != 0 || !objc_msgSend(v3, "hasFallbackPDF"))
          && (objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
        {
          goto LABEL_27;
        }
        break;
      case 4u:
        ICInternalSettingsIsAudioTranscriptionEnabled();
        break;
      case 6u:
        +[ICPaperDocumentTextAttachment isEnabled](ICPaperDocumentTextAttachment, "isEnabled");
        break;
      case 0xBu:
        +[ICPaperDocumentTextAttachment isEnabled](ICPaperDocumentTextAttachment, "isEnabled");
        break;
      case 0xDu:
        if (!+[ICSystemPaperTextAttachment isEnabled](ICSystemPaperTextAttachment, "isEnabled"))
          goto LABEL_25;
        break;
      case 0xEu:
      case 0xFu:
        if (!+[ICPaperDocumentTextAttachment isEnabled](ICPaperDocumentTextAttachment, "isEnabled"))
        {
LABEL_25:
          if (!objc_msgSend(v3, "hasFallbackPDF"))
LABEL_27:
            objc_msgSend(v3, "hasFallbackImage");
        }
        break;
      default:
        v8 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          +[ICTextAttachment textAttachmentClassForAttachment:].cold.1((uint64_t)v3, v8);

        break;
    }
    v7 = (id)objc_opt_class();
  }
  else
  {
    objc_opt_class();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  return (Class)v9;
}

+ (double)defaultAttachmentThumbnailViewHeight
{
  return 88.0;
}

- (id)attachmentFileWrapper
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  if (!v5)
    return 0;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "media");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPasswordProtected");

  if (!v8)
  {
    v23 = objc_alloc(MEMORY[0x1E0CB3650]);
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "media");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "mediaURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v15 = (void *)objc_msgSend(v23, "initWithURL:options:error:", v26, 0, &v35);
    v27 = v35;

    if (v27)
    {
      v28 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[ICTextAttachment attachmentFileWrapper].cold.1((uint64_t)v27, v28, v29, v30, v31, v32, v33, v34);

    }
    return v15;
  }
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "media");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAuthenticated");

  if (!v11)
    return 0;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "media");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "decryptedData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", v14);
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "media");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filename");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v18, "length"))
    {
      v19 = (void *)MEMORY[0x1E0D639F0];
      -[ICBaseTextAttachment attachmentUTI](self, "attachmentUTI");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "filenameFromUTI:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
    }
    objc_msgSend(v15, "setPreferredFilename:", v18);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)attachmentAsNSTextAttachment
{
  void *v2;
  void *v3;

  -[ICTextAttachment attachmentFileWrapper](self, "attachmentFileWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
    objc_msgSend(v3, "setFileWrapper:", v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (BOOL)requiresSpaceAfterAttachmentForPrinting
{
  return 0;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[ICTextAttachment attachmentSizeForTextContainer:proposedLineFragment:](self, "attachmentSizeForTextContainer:proposedLineFragment:", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  if (v7 >= 1.0)
    v9 = v7;
  else
    v9 = 1.0;
  if (v8 >= 1.0)
    v10 = v8;
  else
    v10 = 1.0;
  if (-[ICAbstractTextAttachment supportsMultipleThumbnailsOnSameLine](self, "supportsMultipleThumbnailsOnSameLine"))
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "preferredViewSize");

    if (v12 == 1)
    {
      objc_msgSend((id)objc_opt_class(), "defaultAttachmentThumbnailViewHeight");
      v10 = v13;
      v9 = fmax(v9, 30.0);
    }
  }
  -[ICTextAttachment attachmentBoundsIncludingMarginsFromAttachmentBounds:](self, "attachmentBoundsIncludingMarginsFromAttachmentBounds:", 0.0, 0.0, v9, v10);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGSize)attachmentSizeForTextContainer:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  CGSize result;

  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[ICTextAttachment attachmentSizeForTextContainer:].cold.1((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);

  v11 = 320.0;
  v12 = 240.0;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)availableWidthForTextContainer:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = v4;
  objc_msgSend(v3, "lineFragmentPadding");
  v7 = v6;

  result = v5 + v7 * -2.0;
  if (result < 1.0)
    return 1.0;
  return result;
}

+ (void)textAttachmentClassForAttachment:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_DEBUG, "Asking for a text attachment class for an unknown UT type: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)attachmentFileWrapper
{
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, a2, a3, "Error creating attachment file wrapper: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)attachmentSizeForTextContainer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, a2, a3, "Trying to get the size of an attachment with an unknown text attachment type: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
