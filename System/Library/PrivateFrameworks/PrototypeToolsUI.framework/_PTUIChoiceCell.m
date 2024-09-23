@implementation _PTUIChoiceCell

- (_PTUIChoiceCell)initWithReuseIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PTUIChoiceCell;
  return -[_PTUIChoiceCell initWithStyle:reuseIdentifier:](&v4, sel_initWithStyle_reuseIdentifier_, 1, a3);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PTUIChoiceCell;
  -[_PTUIChoiceCell prepareForReuse](&v3, sel_prepareForReuse);
  -[_PTUIChoiceCell setChecked:](self, "setChecked:", 0);
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_PTUIChoiceCell textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setChecked:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  if (a3)
    v5 = 3;
  else
    v5 = 0;
  -[_PTUIChoiceCell setAccessoryType:](self, "setAccessoryType:", v5);
  -[_PTUIChoiceCell textLabel](self, "textLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
    -[_PTUIChoiceCell tintColor](self, "tintColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

}

@end
