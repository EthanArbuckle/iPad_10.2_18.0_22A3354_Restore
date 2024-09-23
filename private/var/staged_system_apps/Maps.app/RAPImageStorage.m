@implementation RAPImageStorage

- (RAPImageStorage)initWithDelegate:(id)a3
{
  id v4;
  RAPImageStorage *v5;
  RAPImageStorage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPImageStorage;
  v5 = -[RAPImageStorage init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

+ (id)filePathForSubmissionIdentifier:(id)a3 imageIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPImageStorage filePathForSubmissionIdentifier:](RAPImageStorage, "filePathForSubmissionIdentifier:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", v5));

  return v7;
}

+ (id)filePathForSubmissionIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPImageStorage baseFilePath](RAPImageStorage, "baseFilePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", v3));

  return v5;
}

+ (id)baseFilePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFileManager baseSubmissionFilePath](RAPFileManager, "baseSubmissionFilePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("rap_images"), 1));

  return v3;
}

- (BOOL)saveImageWithSubmissionIdentifier:(id)a3 imageIdentifier:(id)a4 imageData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RAPImageStorage filePathForSubmissionIdentifier:](RAPImageStorage, "filePathForSubmissionIdentifier:", a3));
  v10 = +[RAPFileManager saveData:toDirectory:filename:](RAPFileManager, "saveData:toDirectory:filename:", v7, v9, v8);

  return v10;
}

- (BOOL)removeImageForSubmissionIdentifier:(id)a3 imageIdentifier:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  unint64_t v10;
  id WeakRetained;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RAPImageStorage filePathForSubmissionIdentifier:imageIdentifier:](RAPImageStorage, "filePathForSubmissionIdentifier:imageIdentifier:", v6, a4));
  if (v7)
  {
    v8 = +[RAPFileManager removeItemAtFilePath:](RAPFileManager, "removeItemAtFilePath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RAPImageStorage filePathForSubmissionIdentifier:](RAPImageStorage, "filePathForSubmissionIdentifier:", v6));
    v10 = +[RAPFileManager numberOfItemsInDirectory:](RAPFileManager, "numberOfItemsInDirectory:", v9);

    if (!v10)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "imageStorage:didFinishRemovingAllImagesForClientSubmissionIdentifier:", self, v6);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)saveImageWithImageIdentifier:(id)a3 imageData:(id)a4 directory:(id)a5
{
  return +[RAPFileManager saveData:toDirectory:filename:](RAPFileManager, "saveData:toDirectory:filename:", a4, a5, a3);
}

+ (BOOL)removeImageWithImageIdentifier:(id)a3 directory:(id)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "URLByAppendingPathComponent:", a3));
  v5 = +[RAPFileManager removeItemAtFilePath:](RAPFileManager, "removeItemAtFilePath:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
