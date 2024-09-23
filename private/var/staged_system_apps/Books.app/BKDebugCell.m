@implementation BKDebugCell

- (BKDebugCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKDebugCell;
  return -[BKDebugCell initWithStyle:reuseIdentifier:](&v5, "initWithStyle:reuseIdentifier:", 1, a4);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKDebugCell;
  -[BKDebugCell prepareForReuse](&v6, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "setText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v4, "setText:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v5, "setLineBreakMode:", 4);

  -[BKDebugCell setAccessoryType:](self, "setAccessoryType:", 0);
  -[BKDebugCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[BKDebugCell setSelectionStyle:](self, "setSelectionStyle:", 3);
}

@end
