@implementation ICLightContentActivity

- (ICLightContentActivity)initWithNote:(id)a3
{
  id v5;
  ICLightContentActivity *v6;
  ICLightContentActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLightContentActivity;
  v6 = -[ICLightContentActivity init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_note, a3);

  return v7;
}

- (id)activityTitle
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICLightContentActivity note](self, "note"));
  v3 = objc_msgSend(v2, "prefersLightBackground");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("Use Dark Background");
  else
    v6 = CFSTR("Use Light Background");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1005704B8, 0));

  return v7;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.lightContent");
}

- (id)activityImage
{
  void *v2;
  unsigned int v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICLightContentActivity note](self, "note"));
  v3 = objc_msgSend(v2, "prefersLightBackground");
  v4 = CFSTR("circle.righthalf.fill");
  if (v3)
    v4 = CFSTR("circle.lefthalf.fill");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v5));
  return v6;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void (**v7)(id, uint64_t, void *);
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = (void (**)(id, uint64_t, void *))a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F4AE0;
  v8[3] = &unk_10054FE80;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICLightContentActivity note](self, "note"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
  v4 = v10;
  v5 = v9;
  objc_msgSend(v4, "performBlockAndWait:", v8);
  -[ICLightContentActivity activityDidFinish:](self, "activityDidFinish:", 1);
  if (v7)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICLightContentActivity activityType](self, "activityType"));
    v7[2](v7, 1, v6);

  }
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
}

@end
