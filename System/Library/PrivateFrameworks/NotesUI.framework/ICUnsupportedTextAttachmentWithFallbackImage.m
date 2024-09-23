@implementation ICUnsupportedTextAttachmentWithFallbackImage

- (id)attachmentAsNSTextAttachment
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fallbackImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0DC12B0]);
  objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithData:ofType:", v3, v5);

  return v6;
}

- (BOOL)supportsMultipleThumbnailsOnSameLine
{
  return 0;
}

- (id)fileType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0D639F0];
  -[ICBaseTextAttachment attachmentUTI](self, "attachmentUTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "typeUTIIsInlineDrawing:", v4))
  {

    return 0;
  }
  v5 = (void *)MEMORY[0x1E0D639F0];
  -[ICBaseTextAttachment attachmentUTI](self, "attachmentUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "typeUTIIsSystemPaper:", v6);

  if ((v5 & 1) != 0)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)ICUnsupportedTextAttachmentWithFallbackImage;
  -[ICUnsupportedTextAttachmentWithFallbackImage fileType](&v8, sel_fileType);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
