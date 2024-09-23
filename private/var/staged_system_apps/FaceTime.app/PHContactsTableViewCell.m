@implementation PHContactsTableViewCell

- (PHContactsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PHContactsTableViewCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHContactsTableViewCell;
  v4 = -[PHTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHContactsTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

@end
