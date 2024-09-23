@implementation ICDeleteNoteActivity

- (ICDeleteNoteActivity)initWithDeleteBlock:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICDeleteNoteActivity;
  return -[ICDeleteNoteActivity initWithPerformActivity:](&v4, "initWithPerformActivity:", a3);
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash"));
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.deleteNote");
}

- (id)activityTintColor
{
  return +[UIColor systemRedColor](UIColor, "systemRedColor");
}

@end
