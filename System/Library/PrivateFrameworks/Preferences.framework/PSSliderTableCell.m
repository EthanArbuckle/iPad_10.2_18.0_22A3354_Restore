@implementation PSSliderTableCell

- (PSSliderTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PSSliderTableCell *v5;
  PSSliderTableCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSSliderTableCell;
  v5 = -[PSControlTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSTableCell setShouldHideTitle:](v5, "setShouldHideTitle:", 1);
    -[PSSliderTableCell _configureLayout](v6, "_configureLayout");
  }
  return v6;
}

- (void)_configureLayout
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[PSControlTableCell control](self, "control");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[PSControlTableCell control](self, "control");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v20 = (void *)MEMORY[0x1E0CB3718];
    -[PSControlTableCell control](self, "control");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSliderTableCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v25;
    -[PSSliderTableCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutMarginsGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSControlTableCell control](self, "control");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v18;
    -[PSControlTableCell control](self, "control");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSliderTableCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintLessThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v9, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v10;
    -[PSSliderTableCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSControlTableCell control](self, "control");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintLessThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v14, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v16);

  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PSSliderTableCell *v36;
  objc_super v37;

  v4 = a3;
  -[PSControlTableCell control](self, "control");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self;
  -[PSTableCell setTitle:](self, "setTitle:", v6);

  objc_msgSend(v4, "propertyForKey:", CFSTR("defaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple")) & 1) == 0 && objc_msgSend(v8, "length")
    || (objc_msgSend(v4, "propertyForKey:", CFSTR("isContinuous")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "BOOLValue"),
        v9,
        (v10 & 1) == 0))
  {
    objc_msgSend(v5, "setContinuous:", 0);
  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("min"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("max"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "floatValue");
    objc_msgSend(v5, "setMinimumValue:");
  }
  v34 = v11;
  if (v12)
  {
    objc_msgSend(v12, "floatValue");
    objc_msgSend(v5, "setMaximumValue:");
  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("isSegmented"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v5, "setSegmented:", v14);
  objc_msgSend(v4, "propertyForKey:", CFSTR("locksToSegment"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v5, "setLocksToSegment:", objc_msgSend(v15, "BOOLValue"));
  v35 = v8;
  objc_msgSend(v4, "propertyForKey:", CFSTR("snapsToSegment"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    objc_msgSend(v5, "setSnapsToSegment:", objc_msgSend(v17, "BOOLValue"));
  objc_msgSend(v4, "propertyForKey:", CFSTR("segmentCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSegmentCount:", objc_msgSend(v19, "unsignedIntegerValue"));
  objc_msgSend(v4, "propertyForKey:", CFSTR("rightImage"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    goto LABEL_14;
  objc_msgSend(v4, "propertyForKey:", CFSTR("rightImagePromise"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = v30;
    objc_msgSend(v30, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v20, CFSTR("rightImage"));
    objc_msgSend(v4, "removePropertyForKey:", CFSTR("rightImagePromise"));

    if (v20)
    {
LABEL_14:
      objc_msgSend(v4, "propertyForKey:", CFSTR("iconImageShouldFlipForRightToLeft"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

      if (v22)
      {
        objc_msgSend(v20, "imageFlippedForRightToLeftLayoutDirection");
        v23 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v23;
      }
      objc_msgSend(v5, "setMaximumValueImage:", v20);

    }
  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("leftImage"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    goto LABEL_18;
  objc_msgSend(v4, "propertyForKey:", CFSTR("leftImagePromise"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = v32;
    objc_msgSend(v32, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v24, CFSTR("leftImage"));
    objc_msgSend(v4, "removePropertyForKey:", CFSTR("leftImagePromise"));

    if (v24)
    {
LABEL_18:
      objc_msgSend(v4, "propertyForKey:", CFSTR("iconImageShouldFlipForRightToLeft"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "BOOLValue");

      if (v26)
      {
        objc_msgSend(v24, "imageFlippedForRightToLeftLayoutDirection");
        v27 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v27;
      }
      objc_msgSend(v5, "setMinimumValueImage:", v24);

    }
  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("showValue"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
    objc_msgSend(v5, "setShowValue:", objc_msgSend(v28, "BOOLValue"));
  v37.receiver = v36;
  v37.super_class = (Class)PSSliderTableCell;
  -[PSControlTableCell refreshCellContentsWithSpecifier:](&v37, sel_refreshCellContentsWithSpecifier_, v4);

}

- (void)prepareForReuse
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  -[PSControlTableCell control](self, "control");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PSTableCell type](self, "type") == 5)
  {
    objc_msgSend(v3, "setContinuous:", 1);
    LODWORD(v4) = 0;
    objc_msgSend(v3, "setMinimumValue:", v4);
    LODWORD(v5) = 1.0;
    objc_msgSend(v3, "setMaximumValue:", v5);
    objc_msgSend(v3, "setMaximumValueImage:", 0);
    objc_msgSend(v3, "setMinimumValueImage:", 0);
    objc_msgSend(v3, "setShowValue:", 0);
    objc_msgSend(v3, "setSegmented:", 0);
    objc_msgSend(v3, "setSegmentCount:", 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)PSSliderTableCell;
  -[PSTableCell prepareForReuse](&v6, sel_prepareForReuse);

}

- (id)newControl
{
  PSSegmentableSlider *v2;

  v2 = [PSSegmentableSlider alloc];
  return -[PSSegmentableSlider initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)titleLabel
{
  return 0;
}

- (BOOL)canReload
{
  int v3;

  v3 = -[PSSliderTableCell isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
  if (v3)
    LOBYTE(v3) = -[PSSliderTableCell tag](self, "tag") == 5;
  return v3;
}

- (id)controlValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[UIControl value](self->super._control, "value");
  return (id)objc_msgSend(v2, "numberWithFloat:");
}

- (void)setValue:(id)a3
{
  UIControl *control;
  id v6;

  v6 = a3;
  if (self->super.super._value != v6)
  {
    objc_storeStrong(&self->super.super._value, a3);
    control = self->super._control;
    objc_msgSend(v6, "floatValue");
    -[UIControl setValue:](control, "setValue:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledView, 0);
}

@end
