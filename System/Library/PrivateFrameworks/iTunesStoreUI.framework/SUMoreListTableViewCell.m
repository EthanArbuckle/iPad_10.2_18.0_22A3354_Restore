@implementation SUMoreListTableViewCell

- (SUMoreListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUMoreListTableViewCell *v4;
  SUMoreListTableViewCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUMoreListTableViewCell;
  v4 = -[SUMoreListTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)-[SUMoreListTableViewCell textLabel](v4, "textLabel");
    objc_msgSend(v6, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 18.0));
    objc_msgSend(v6, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.301960784, 1.0));
  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v3 = (void *)-[SUMoreListTableViewCell textLabel](self, "textLabel");
  if (-[SUMoreListTableViewCell isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend(v3, "setShadowColor:", 0);
    v4 = *MEMORY[0x24BDBF148];
    v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  else
  {
    objc_msgSend(v3, "setShadowColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
    v5 = 1.0;
    v4 = 0.0;
  }
  objc_msgSend(v3, "setShadowOffset:", v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)SUMoreListTableViewCell;
  -[SUMoreListTableViewCell layoutSubviews](&v6, sel_layoutSubviews);
}

@end
