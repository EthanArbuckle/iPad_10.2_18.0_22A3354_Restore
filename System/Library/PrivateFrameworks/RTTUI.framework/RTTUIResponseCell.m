@implementation RTTUIResponseCell

- (RTTUIResponseCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RTTUIResponseCell *v4;
  RTTUIResponseCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RTTUIResponseCell;
  v4 = -[RTTUIResponseCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[RTTUIResponseCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

  }
  return v5;
}

@end
