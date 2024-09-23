@implementation PXSharedLibraryAssistantParticipantViewModel

- (PXSharedLibraryAssistantParticipantViewModel)init
{
  PXSharedLibraryAssistantParticipantViewModel *v2;
  PXSharedLibraryAssistantParticipantViewModel *v3;
  NSString *title;
  NSString *subtitle;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryAssistantParticipantViewModel;
  v2 = -[PXSharedLibraryAssistantParticipantViewModel init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = (NSString *)&stru_1E5149688;

    subtitle = v3->_subtitle;
    v3->_subtitle = (NSString *)&stru_1E5149688;

  }
  return v3;
}

- (void)setImage:(id)a3
{
  UIImage *v4;
  char v5;
  UIImage *v6;
  UIImage *image;
  UIImage *v8;

  v8 = (UIImage *)a3;
  v4 = self->_image;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[UIImage isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (UIImage *)-[UIImage copy](v8, "copy");
      image = self->_image;
      self->_image = v6;

      -[PXSharedLibraryAssistantParticipantViewModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setTitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *title;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantParticipantViewModel.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v5 = self->_title;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v11);

    if (!v7)
    {
      v8 = (NSString *)-[NSString copy](v11, "copy");
      title = self->_title;
      self->_title = v8;

      -[PXSharedLibraryAssistantParticipantViewModel signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *subtitle;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantParticipantViewModel.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subtitle"));

  }
  v5 = self->_subtitle;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v11);

    if (!v7)
    {
      v8 = (NSString *)-[NSString copy](v11, "copy");
      subtitle = self->_subtitle;
      self->_subtitle = v8;

      -[PXSharedLibraryAssistantParticipantViewModel signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryAssistantParticipantViewModel;
  -[PXSharedLibraryAssistantParticipantViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
