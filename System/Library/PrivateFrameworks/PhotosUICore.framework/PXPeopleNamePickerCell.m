@implementation PXPeopleNamePickerCell

- (PXPeopleNamePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXPeopleNamePickerCell *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *baseConstraints;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXPeopleNamePickerCell;
  v4 = -[PXPeopleNamePickerCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[PXPeopleNamePickerCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v5);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 20.0, *MEMORY[0x1E0DC1438]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v7);

    v8 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("titleLabel"), v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-[titleLabel]-|"), 1024, 0, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addConstraints:", v10);
    baseConstraints = v4->_baseConstraints;
    v4->_baseConstraints = (NSArray *)v10;

    objc_storeWeak((id *)&v4->_titleLabel, v5);
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleNamePickerCell;
  -[PXPeopleNamePickerCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PXPeopleNamePickerCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (NSArray)baseConstraints
{
  return self->_baseConstraints;
}

- (void)setBaseConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_baseConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseConstraints, 0);
  objc_destroyWeak((id *)&self->_titleLabel);
}

@end
