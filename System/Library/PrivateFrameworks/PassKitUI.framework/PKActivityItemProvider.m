@implementation PKActivityItemProvider

- (PKActivityItemProvider)initWithPass:(id)a3 passView:(id)a4 linkedApp:(id)a5 sharingMethod:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  PKActivityItemProvider *v15;
  PKActivityItemProvider *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a6 == -1)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18.receiver = self;
    v18.super_class = (Class)PKActivityItemProvider;
    v15 = -[UIActivityItemProvider initWithPlaceholderItem:](&v18, sel_initWithPlaceholderItem_, v14);

    if (v15)
    {
      objc_storeStrong((id *)&v15->_pass, a3);
      objc_storeStrong((id *)&v15->_passView, a4);
      objc_storeStrong((id *)&v15->_linkedApp, a5);
      v15->_sharingMethod = a6;
    }
    self = v15;
    v16 = self;
  }

  return v16;
}

- (id)item
{
  int64_t sharingMethod;
  PKPass *pass;

  sharingMethod = self->_sharingMethod;
  pass = self->_pass;
  if (sharingMethod == 1)
    -[PKPass sharingText](pass, "sharingText");
  else
    -[PKPass archiveData](pass, "archiveData");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)*MEMORY[0x1E0D6A6B8];
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height;
  double width;
  unint64_t v8;
  void *v9;

  height = a5.height;
  width = a5.width;
  v8 = -[PKPassView suppressedContent](self->_passView, "suppressedContent", a3, a4);
  -[PKPassView setSuppressedContent:](self->_passView, "setSuppressedContent:", 70);
  -[PKPassView snapshotOfFrontFaceWithRequestedSize:](self->_passView, "snapshotOfFrontFaceWithRequestedSize:", width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassView setSuppressedContent:](self->_passView, "setSuppressedContent:", v8);
  return v9;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  return -[PKPass organizationName](self->_pass, "organizationName", a3, a4);
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  UIImage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[PKLinkedApplication iconImage](self->_linkedApp, "iconImage", a3);
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    -[PKPass iconImage](self->_pass, "iconImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithPKImage:", v6);
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v7 = (void *)MEMORY[0x1E0DC3870];
      PKPassKitCoreBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("GenericIcon"), v8);
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();

    }
  }
  v9 = objc_alloc(MEMORY[0x1E0CC1170]);
  UIImagePNGRepresentation(v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithData:MIMEType:", v10, CFSTR("image/png"));

  v12 = objc_alloc_init(MEMORY[0x1E0CC11A0]);
  objc_msgSend(v12, "setIcon:", v11);
  v13 = objc_alloc_init(MEMORY[0x1E0CC1230]);
  -[PKPass localizedDescription](self->_pass, "localizedDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setName:", v14);

  objc_msgSend(v13, "setStyle:", -[PKPass style](self->_pass, "style"));
  v15 = (void *)MEMORY[0x1E0D66F28];
  -[PKPass relevantDates](self->_pass, "relevantDates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "findDateFromDates:option:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEventDate:", v17);

  -[PKPass expirationDate](self->_pass, "expirationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExpirationDate:", v18);

  objc_msgSend(v12, "setSpecialization:", v13);
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApp, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
