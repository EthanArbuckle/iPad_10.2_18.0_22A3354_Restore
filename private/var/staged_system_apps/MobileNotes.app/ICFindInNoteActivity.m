@implementation ICFindInNoteActivity

- (ICFindInNoteActivity)initWithFindInNoteBlock:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICFindInNoteActivity;
  return -[ICFindInNoteActivity initWithPerformActivity:](&v4, "initWithPerformActivity:", a3);
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass"));
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Find in Note"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.findInNote");
}

@end
