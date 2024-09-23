@implementation ICHandwritingDebugNoteActivity

- (ICHandwritingDebugNoteActivity)initWithShowHandwritingDebugBlock:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICHandwritingDebugNoteActivity;
  return -[ICHandwritingDebugNoteActivity initWithPerformActivity:](&v4, "initWithPerformActivity:", a3);
}

- (id)activityTitle
{
  return CFSTR("Handwriting Debug");
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.handwritingDebug");
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("pencil.and.outline"));
}

@end
