@implementation TPSTextActivityItemSource

- (TPSTextActivityItemSource)initWithTip:(id)a3
{
  id v5;
  TPSTextActivityItemSource *v6;
  TPSTextActivityItemSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSTextActivityItemSource;
  v6 = -[TPSTextActivityItemSource init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tip, a3);

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip summary](self->_tip, "summary", a3));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(-[TPSTip bodyText](self->_tip, "bodyText"));
  v7 = v6;

  return v7;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  _QWORD v10[3];

  v5 = a4;
  v10[0] = UIActivityTypeAirDrop;
  v10[1] = UIActivityTypePostToFacebook;
  v10[2] = UIActivityTypeMail;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 3));
  if (objc_msgSend(v5, "isEqualToString:", UIActivityTypeSaveToNotes))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[TPSTip title](self->_tip, "title"));
LABEL_6:
    v8 = (__CFString *)v7;
    goto LABEL_7;
  }
  if ((objc_msgSend(v6, "containsObject:", v5) & 1) == 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[TPSTip shareText](self->_tip, "shareText"));
    goto LABEL_6;
  }
  v8 = &stru_1000A5680;
LABEL_7:

  return v8;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v5;
  __CFString *v6;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", UIActivityTypeMail) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", UIActivityTypeCreateReminder))
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TPSTip shareText](self->_tip, "shareText"));
  }
  else
  {
    v6 = &stru_1000A5680;
  }

  return v6;
}

- (TPSTip)tip
{
  return self->_tip;
}

- (void)setTip:(id)a3
{
  objc_storeStrong((id *)&self->_tip, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tip, 0);
}

@end
