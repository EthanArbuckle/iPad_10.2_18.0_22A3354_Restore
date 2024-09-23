@implementation RemoteUITextFieldTableCell

- (id)customTextLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RemoteUITextFieldTableCell;
  -[RemoteUICustomTableViewCell customTextLabel](&v3, sel_customTextLabel);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
