@implementation ICSetPreferredAttachmentSizeActivity

- (ICSetPreferredAttachmentSizeActivity)initWithNote:(id)a3
{
  id v5;
  ICSetPreferredAttachmentSizeActivity *v6;
  ICSetPreferredAttachmentSizeActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSetPreferredAttachmentSizeActivity;
  v6 = -[ICSetPreferredAttachmentSizeActivity init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_note, a3);

  return v7;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Attachment View"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("rectangle.3.group"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.setPreferredAttachmentSize");
}

- (id)menuWithCompletion:(id)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C6FC0;
  v12[3] = &unk_100554168;
  v12[4] = self;
  v4 = objc_retainBlock(v12);
  v5 = objc_alloc((Class)ICAttachmentSizeMenu);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSetPreferredAttachmentSizeActivity activityTitle](self, "activityTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSetPreferredAttachmentSizeActivity activityImage](self, "activityImage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSetPreferredAttachmentSizeActivity note](self, "note"));
  v9 = objc_msgSend(v5, "initWithTitle:image:preferredViewSize:supportedSizes:supportsPlainLink:isOverrideVariant:selectedSizeHandler:plainLinkHandler:", v6, v7, objc_msgSend(v8, "attachmentViewType"), &off_10057C6F0, 0, 1, v4, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createMenu"));
  return v10;
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
