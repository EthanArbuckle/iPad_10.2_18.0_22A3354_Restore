@implementation WFSegmentedCell

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSegmentedCell;
  -[WFSegmentedCell awakeFromNib](&v4, sel_awakeFromNib);
  -[WFSegmentedCell segmentedControl](self, "segmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__segmentedControlDidChange_, 4096);

}

- (void)_segmentedControlDidChange:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WFSegmentedCell handler](self, "handler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFSegmentedCell handler](self, "handler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, objc_msgSend(v6, "selectedSegmentIndex"));

  }
}

- (void)addSubview:(id)a3
{
  id v4;
  double Height;
  void *v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;

  v4 = a3;
  objc_msgSend(v4, "frame");
  Height = CGRectGetHeight(v10);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = Height * v7;

  if (v8 != 1.0)
  {
    v9.receiver = self;
    v9.super_class = (Class)WFSegmentedCell;
    -[WFSegmentedCell addSubview:](&v9, sel_addSubview_, v4);
  }

}

- (UISegmentedControl)segmentedControl
{
  return (UISegmentedControl *)objc_loadWeakRetained((id *)&self->_segmentedControl);
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeWeak((id *)&self->_segmentedControl, a3);
}

- (id)handler
{
  return objc_getProperty(self, a2, 1032, 1);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_segmentedControl);
}

@end
