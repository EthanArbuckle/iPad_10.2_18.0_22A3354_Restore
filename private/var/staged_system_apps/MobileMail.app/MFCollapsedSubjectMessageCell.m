@implementation MFCollapsedSubjectMessageCell

- (MFCollapsedSubjectMessageCell)initWithFrame:(CGRect)a3
{
  MFCollapsedSubjectMessageCell *v3;
  MFCollapsedSubjectMessageCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFCollapsedSubjectMessageCell;
  v3 = -[MFCollapsedMessageCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MFCollapsedMessageCell setShouldShowSubject:](v3, "setShouldShowSubject:", 1);
  return v4;
}

@end
