@implementation ICInspectAttachmentsNoteActivity

- (ICInspectAttachmentsNoteActivity)initWithAttachments:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  ICInspectAttachmentsNoteActivity *v9;
  ICInspectAttachmentsNoteActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICInspectAttachmentsNoteActivity;
  v9 = -[ICInspectAttachmentsNoteActivity init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachments, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("paperclip.badge.ellipsis"));
}

- (id)activityTitle
{
  return CFSTR("Inspect Attachments");
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.attachmentsInspector");
}

- (void)performActivityWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICInspectAttachmentsNoteActivity presentingViewController](self, "presentingViewController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICInspectAttachmentsNoteActivity attachments](self, "attachments"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      if (v6 == (id)1)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICInspectAttachmentsNoteActivity attachments](self, "attachments"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
        -[ICInspectAttachmentsNoteActivity showAttachmentInspectorWithAttachment:](self, "showAttachmentInspectorWithAttachment:", v8);

      }
      else
      {
        -[ICInspectAttachmentsNoteActivity showAttachmentsPickerActionSheet](self, "showAttachmentsPickerActionSheet");
      }
    }
    -[ICInspectAttachmentsNoteActivity activityDidFinish:](self, "activityDidFinish:", 1);
    v9 = v11;
    if (v11)
      goto LABEL_9;
  }
  else
  {
    -[ICInspectAttachmentsNoteActivity activityDidFinish:](self, "activityDidFinish:", 0);
    v9 = v11;
    if (v11)
    {
LABEL_9:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICInspectAttachmentsNoteActivity activityType](self, "activityType"));
      (*((void (**)(void))v11 + 2))();

      v9 = v11;
    }
  }

}

- (void)showAttachmentInspectorWithAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICAttachmentInspectorViewController *v7;

  v4 = a3;
  v7 = -[ICAttachmentInspectorViewController initWithAttachment:]([ICAttachmentInspectorViewController alloc], "initWithAttachment:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController ic_embedInNavigationControllerForModalPresentation](v7, "ic_embedInNavigationControllerForModalPresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICInspectAttachmentsNoteActivity presentingViewController](self, "presentingViewController"));
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)showAttachmentsPickerActionSheet
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Inspect Attachment"), CFSTR("Select attachment to inspect"), 1));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[ICInspectAttachmentsNoteActivity attachments](self, "attachments"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
        v10 = v9;
        if (v9)
        {
          v11 = v9;
        }
        else
        {
          v12 = NSStringFromICAttachmentType(objc_msgSend(v8, "attachmentType"));
          v11 = (id)objc_claimAutoreleasedReturnValue(v12);
        }
        v13 = v11;

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10007292C;
        v18[3] = &unk_100551100;
        v18[4] = self;
        v18[5] = v8;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v18));
        objc_msgSend(v3, "addAction:", v14);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v3, "addAction:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICInspectAttachmentsNoteActivity presentingViewController](self, "presentingViewController"));
  objc_msgSend(v16, "presentViewController:animated:completion:", v3, 1, 0);

}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end
