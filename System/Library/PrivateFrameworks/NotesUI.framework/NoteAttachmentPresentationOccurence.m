@implementation NoteAttachmentPresentationOccurence

- (NoteAttachmentPresentationOccurence)init
{
  return -[NoteAttachmentPresentationOccurence initWithPresentation:element:](self, "initWithPresentation:element:", 0, 0);
}

- (NoteAttachmentPresentationOccurence)initWithPresentation:(id)a3 element:(id)a4
{
  id v7;
  id v8;
  NoteAttachmentPresentationOccurence *v9;
  NoteAttachmentPresentationOccurence *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NoteAttachmentPresentationOccurence;
  v9 = -[NoteAttachmentPresentationOccurence init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentation, a3);
    objc_storeStrong((id *)&v10->_element, a4);
  }

  return v10;
}

- (id)previewItemURL
{
  void *v2;
  void *v3;

  -[NoteAttachmentPresentationOccurence presentation](self, "presentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)previewItemTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[NoteAttachmentPresentationOccurence presentation](self, "presentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NoteAttachmentPresentation)presentation
{
  return self->_presentation;
}

- (DOMHTMLElement)element
{
  return self->_element;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
}

@end
