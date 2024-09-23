@implementation _PXGenerativeStoryFeatureEligibilityRowCell

- (void)updateDisplayedContent
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_PXGenerativeStoryFeatureEligibilityRowCell;
  -[PTUIRowTableViewCell updateDisplayedContent](&v15, sel_updateDisplayedContent);
  if (!self->_hasRequestedMCAvailability)
  {
    self->_hasRequestedMCAvailability = 1;
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

        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1700]), "initWithPhotoLibrary:", v5);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __69___PXGenerativeStoryFeatureEligibilityRowCell_updateDisplayedContent__block_invoke;
        v12[3] = &unk_1E511A7F0;
        objc_copyWeak(&v13, &location);
        +[PXGenerativeStoryFeatureEligibilityDataSource generateFeatureEligibilityStateUsingProcessingAvailabilityReporter:photoLibrary:completionHandler:](PXGenerativeStoryFeatureEligibilityDataSource, "generateFeatureEligibilityStateUsingProcessingAvailabilityReporter:photoLibrary:completionHandler:", v6, v5, v12);
        objc_destroyWeak(&v13);

        objc_destroyWeak(&location);
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGenerativeStoryFeatureEligibilityRow.m"), 101, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.row"), v9, v11);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGenerativeStoryFeatureEligibilityRow.m"), 101, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.row"), v9);
    }

    goto LABEL_4;
  }
}

- (void)_handleResultsWithTitle:(id)a3 image:(id)a4
{
  id v6;

  v6 = a4;
  -[_PXGenerativeStoryFeatureEligibilityRowCell setBriefTitle:](self, "setBriefTitle:", a3);
  -[_PXGenerativeStoryFeatureEligibilityRowCell setBriefImage:](self, "setBriefImage:", v6);

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
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGenerativeStoryFeatureEligibilityRow.m"), 123, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.row"), v14, v16);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGenerativeStoryFeatureEligibilityRow.m"), 123, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.row"), v14);
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
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGenerativeStoryFeatureEligibilityRow.m"), 133, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.row"), v14, v16);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGenerativeStoryFeatureEligibilityRow.m"), 133, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.row"), v14);
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
