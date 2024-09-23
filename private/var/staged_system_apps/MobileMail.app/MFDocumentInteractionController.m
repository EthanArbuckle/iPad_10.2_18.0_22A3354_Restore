@implementation MFDocumentInteractionController

+ (id)interactionControllerWithURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MFDocumentInteractionController;
  v5 = objc_msgSendSuper2(&v8, "interactionControllerWithURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "setOriginalURL:", v4);

  return v6;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
{
  objc_storeStrong((id *)&self->_originalURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalURL, 0);
}

@end
