@implementation RAPCheckmarkTableViewCell

- (RAPCheckmarkTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPCheckmarkTableViewCell *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPCheckmarkTableViewCell;
  result = -[RAPSingleLineTableViewCell initWithStyle:reuseIdentifier:](&v5, "initWithStyle:reuseIdentifier:", a3, a4);
  if (result)
    result->_checked = 0;
  return result;
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v3;

  if (self->_checked != a3)
  {
    self->_checked = a3;
    if (a3)
      v3 = 3;
    else
      v3 = 0;
    -[RAPCheckmarkTableViewCell setAccessoryType:](self, "setAccessoryType:", v3);
  }
}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("RAPCheckmarkTableViewCell");
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptLabel, 0);
}

@end
