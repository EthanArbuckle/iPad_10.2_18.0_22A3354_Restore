@implementation PXAlbumStreamingActivityItemSource

- (PXAlbumStreamingActivityItemSource)initWithAlbum:(id)a3
{
  id v6;
  PXAlbumStreamingActivityItemSource *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXAlbumStreamingActivityItemSource;
  v7 = -[PXAlbumStreamingActivityItemSource init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PXAlbumStreamingOptionsViewController.m"), 176, CFSTR("Missing album for PXAlbumStreamingActivityItemSource"));

    }
    objc_storeStrong((id *)&v7->_album, a3);
  }

  return v7;
}

- (id)activityViewControllerPlaceholderItems:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PXAlbumStreamingActivityItemSource album](self, "album", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publicURL");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = CFSTR("https://www.icloud.com/sharedalbum/#");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = a4;
  -[PXAlbumStreamingActivityItemSource album](self, "album");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "publicURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96DB0]))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    PLServicesLocalizedFrameworkString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (__CFString *)objc_msgSend(v7, "mutableCopy");
    if (CFStringTransform(v13, 0, CFSTR("Any-Hex/XML"), 0))
      v14 = v13;
    else
      v14 = 0;

    objc_msgSend(v11, "stringWithFormat:", CFSTR("<html><p>%@</p><p><a href=\"%@\">%@</a></p></html>"), v12, v10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96DC0]))
    {
      PLServicesLocalizedFrameworkString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v16, v7, v10);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96DD0]) & 1) == 0
        && !objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96DF8]))
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      PLServicesLocalizedFrameworkString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v16, v10, 0);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;

  }
LABEL_13:

  return v18;
}

- (id)activityViewController:(id)a3 thumbnailForActivityType:(id)a4
{
  void *v4;
  void *v5;

  -[PXAlbumStreamingActivityItemSource album](self, "album", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)activityViewControllerSubject:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXAlbumStreamingActivityItemSource album](self, "album", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLServicesLocalizedFrameworkString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PLCloudSharedAlbum)album
{
  return self->_album;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_album, 0);
}

@end
