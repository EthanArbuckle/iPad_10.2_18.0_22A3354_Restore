@implementation ICUnsupportedTextAttachmentWithFallbackPDF

- (id)attachmentAsNSTextAttachment
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fallbackPDFData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0DC12B0]);
  objc_msgSend(MEMORY[0x1E0D639F0], "fallbackPDFUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithData:ofType:", v3, v5);

  return v6;
}

- (BOOL)supportsMultipleThumbnailsOnSameLine
{
  return 0;
}

@end
