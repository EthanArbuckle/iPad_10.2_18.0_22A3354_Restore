@implementation PKMessageExtensionActivityItem

- (PKMessageExtensionActivityItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKMessageExtensionActivityItem;
  return -[UIActivity init](&v3, sel_init);
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKMessageExtensionActivityItem;
  v4 = a3;
  -[UIMessageActivity prepareWithActivityItems:](&v9, sel_prepareWithActivityItems_, v4);
  -[UIMessageActivity messageComposeViewController](self, "messageComposeViewController", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "setMessage:", v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v7, "dataRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addRichLinkData:withWebpageURL:", v8, v7);

      objc_msgSend(v5, "setBody:", 0);
    }
  }

}

- (void)performActivity
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKMessageExtensionActivityItem;
  -[UIActivity performActivity](&v2, sel_performActivity);
}

@end
