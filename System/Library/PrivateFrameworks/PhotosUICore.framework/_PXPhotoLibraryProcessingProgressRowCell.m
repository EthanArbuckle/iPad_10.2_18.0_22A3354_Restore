@implementation _PXPhotoLibraryProcessingProgressRowCell

- (void)updateDisplayedContent
{
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_PXPhotoLibraryProcessingProgressRowCell;
  -[PTUIRowTableViewCell updateDisplayedContent](&v14, sel_updateDisplayedContent);
  if (!self->_hasRequestedBriefDescription)
  {
    self->_hasRequestedBriefDescription = 1;
    objc_initWeak(&location, self);
    -[PTUIRowTableViewCell row](self, "row");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        objc_msgSend(v4, "photoLibrary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __66___PXPhotoLibraryProcessingProgressRowCell_updateDisplayedContent__block_invoke;
        v11[3] = &unk_1E5141070;
        objc_copyWeak(&v12, &location);
        +[PXPhotoLibraryProcessingProgressReport requestBriefDescriptionForLibrary:resultBlock:](PXPhotoLibraryProcessingProgressReport, "requestBriefDescriptionForLibrary:resultBlock:", v5, v11);
        objc_destroyWeak(&v12);

        objc_destroyWeak(&location);
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoLibraryProcessingProgressRow.m"), 93, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.row"), v8, v10);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoLibraryProcessingProgressRow.m"), 93, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.row"), v8);
    }

    goto LABEL_4;
  }
}

- (void)_handleBriefDescriptionResultsWithTitle:(id)a3 image:(id)a4
{
  id v6;

  v6 = a4;
  -[_PXPhotoLibraryProcessingProgressRowCell setBriefTitle:](self, "setBriefTitle:", a3);
  -[_PXPhotoLibraryProcessingProgressRowCell setBriefImage:](self, "setBriefImage:", v6);

}

- (void)setBriefTitle:(id)a3
{
  NSString *v6;
  void *v7;
  NSString *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  NSString *v17;

  v17 = (NSString *)a3;
  v6 = self->_briefTitle;
  v7 = v17;
  if (v6 == v17)
    goto LABEL_6;
  v8 = v6;
  v9 = -[NSString isEqual:](v6, "isEqual:");

  if ((v9 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_briefTitle, a3);
    -[PTUIRowTableViewCell row](self, "row");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_5:
        objc_msgSend(v7, "settings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "titleKeyPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKeyPath:", v17, v11);

LABEL_6:
        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoLibraryProcessingProgressRow.m"), 111, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.row"), v14, v16);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoLibraryProcessingProgressRow.m"), 111, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.row"), v14);
    }

    goto LABEL_5;
  }
LABEL_7:

}

- (void)setBriefImage:(id)a3
{
  UIImage *v6;
  void *v7;
  UIImage *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  UIImage *v17;

  v17 = (UIImage *)a3;
  v6 = self->_briefImage;
  v7 = v17;
  if (v6 == v17)
    goto LABEL_6;
  v8 = v6;
  v9 = -[UIImage isEqual:](v6, "isEqual:");

  if ((v9 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_briefImage, a3);
    -[PTUIRowTableViewCell row](self, "row");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_5:
        objc_msgSend(v7, "settings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "imageKeyPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKeyPath:", v17, v11);

LABEL_6:
        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoLibraryProcessingProgressRow.m"), 121, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.row"), v14, v16);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoLibraryProcessingProgressRow.m"), 121, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.row"), v14);
    }

    goto LABEL_5;
  }
LABEL_7:

}

- (NSString)briefTitle
{
  return self->_briefTitle;
}

- (UIImage)briefImage
{
  return self->_briefImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_briefImage, 0);
  objc_storeStrong((id *)&self->_briefTitle, 0);
}

@end
