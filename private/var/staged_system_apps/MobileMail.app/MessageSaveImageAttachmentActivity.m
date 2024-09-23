@implementation MessageSaveImageAttachmentActivity

- (id)activityTitle
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageSaveToCameraRollActivity delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "canSaveAllAttachmentsInContext:", -[MessageSaveToCameraRollActivity context](self, "context"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SAVE_IMAGE"), &stru_100531B00, CFSTR("Main")));

    return v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MessageSaveImageAttachmentActivity;
    v8 = -[MessageSaveImageAttachmentActivity activityTitle](&v9, "activityTitle");
    return (id)objc_claimAutoreleasedReturnValue(v8);
  }
}

@end
