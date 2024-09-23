@implementation PRRESegmentTableViewCell

- (PRRESegmentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PRRESegmentTableViewCell *v4;
  UISegmentedControl *v5;
  UISegmentedControl *segment;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRRESegmentTableViewCell;
  v4 = -[PRRESegmentTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E0DC3C58]);
    segment = v4->_segment;
    v4->_segment = v5;

    -[UISegmentedControl addTarget:action:forControlEvents:](v4->_segment, "addTarget:action:forControlEvents:", v4, sel__valueChanged_, 4096);
    -[PRRESegmentTableViewCell setAccessoryView:](v4, "setAccessoryView:", v4->_segment);
  }
  return v4;
}

- (void)_configure
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRRESegmentTableViewCell;
  -[PRRETableViewCell _configure](&v3, sel__configure);
  -[UISegmentedControl removeAllSegments](self->_segment, "removeAllSegments");
  -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segment, "insertSegmentWithTitle:atIndex:animated:", CFSTR("🚫"), 0, 0);
  -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segment, "insertSegmentWithTitle:atIndex:animated:", CFSTR("✅"), 1, 0);
  -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segment, "insertSegmentWithTitle:atIndex:animated:", CFSTR("🟡"), 2, 0);
  -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segment, "insertSegmentWithTitle:atIndex:animated:", CFSTR("🛑"), 3, 0);
  -[UISegmentedControl sizeToFit](self->_segment, "sizeToFit");
  -[PRRESegmentTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)_currentValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UISegmentedControl selectedSegmentIndex](self->_segment, "selectedSegmentIndex"));
}

- (void)_setCurrentValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  UISegmentedControl *segment;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = objc_opt_class();
  v10 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v10;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  segment = self->_segment;
  v9 = objc_msgSend(v7, "integerValue");

  -[UISegmentedControl setSelectedSegmentIndex:](segment, "setSelectedSegmentIndex:", v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segment, 0);
}

@end
