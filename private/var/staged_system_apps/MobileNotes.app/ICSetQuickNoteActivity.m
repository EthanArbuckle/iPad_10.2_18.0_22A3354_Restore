@implementation ICSetQuickNoteActivity

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("hare"));
}

- (id)activityTitle
{
  return CFSTR("Set As QuickNote");
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.setQuickNote");
}

- (void)performActivityWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t, void *);

  v6 = (void (**)(id, uint64_t, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  objc_msgSend(v4, "saveSession");

  -[ICSetQuickNoteActivity activityDidFinish:](self, "activityDidFinish:", 1);
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSetQuickNoteActivity activityType](self, "activityType"));
    v6[2](v6, 1, v5);

  }
}

@end
