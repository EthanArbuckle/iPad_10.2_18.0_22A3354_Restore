@implementation NSTextAttachment(UITextDragGeometry)

+ (uint64_t)_attachmentHasImage:()UITextDragGeometry
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v3, "fileType");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v3, "fileWrapper");
      v5 = objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
LABEL_7:

        goto LABEL_9;
      }
      objc_msgSend(v3, "fileWrapper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isRegularFile");

      if (v9)
      {
        +[UIImage readableTypeIdentifiersForItemProvider](UIImage, "readableTypeIdentifiersForItemProvider");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fileType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v7, "containsObject:", v10);

        goto LABEL_7;
      }
    }
    v5 = 0;
    goto LABEL_9;
  }
  v5 = 1;
LABEL_9:

  return v5;
}

+ (id)_imageFromAttachment:()UITextDragGeometry
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v3, "fileType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_11;
    objc_msgSend(v3, "fileWrapper");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v3, "fileWrapper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isRegularFile") & 1) != 0)
      {
        +[UIImage readableTypeIdentifiersForItemProvider](UIImage, "readableTypeIdentifiersForItemProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fileType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "containsObject:", v10);

        if (v11)
        {
          objc_msgSend(v3, "fileWrapper");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "regularFileContents");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIImage imageWithData:](UIImage, "imageWithData:", v13);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
LABEL_10:
        v5 = 0;
        goto LABEL_11;
      }

    }
    goto LABEL_10;
  }
  objc_msgSend(v3, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v5;
}

@end
