@implementation SBFluidSwitcherModifierTimelineEntryView

- (SBFluidSwitcherModifierTimelineEntryView)initWithFrame:(CGRect)a3 entry:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  SBFluidSwitcherModifierTimelineEntryView *v11;
  SBFluidSwitcherModifierTimelineEntryView *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  UILabel *nameLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UILabel *actionsLabel;
  UILabel *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  UILabel *postStackLabel;
  UILabel *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  UITapGestureRecognizer *tapRecognizer;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  UILabel *v60;
  objc_super v61;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v61.receiver = self;
  v61.super_class = (Class)SBFluidSwitcherModifierTimelineEntryView;
  v11 = -[SBFluidSwitcherModifierTimelineEntryView initWithFrame:](&v61, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entry, a4);
    v13 = objc_alloc(MEMORY[0x1E0CEA700]);
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v18 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], v15, v16, v17);
    nameLabel = v12->_nameLabel;
    v12->_nameLabel = (UILabel *)v18;

    v20 = v12->_nameLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 16.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    v22 = v12->_nameLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    -[UILabel setTextAlignment:](v12->_nameLabel, "setTextAlignment:", 1);
    v24 = v12->_nameLabel;
    objc_msgSend(v10, "eventSnapshot");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "eventName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v24, "setText:", v26);

    -[SBFluidSwitcherModifierTimelineEntryView addSubview:](v12, "addSubview:", v12->_nameLabel);
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v14, v15, v16, v17);
    actionsLabel = v12->_actionsLabel;
    v12->_actionsLabel = (UILabel *)v27;

    -[UILabel setNumberOfLines:](v12->_actionsLabel, "setNumberOfLines:", 0);
    v29 = v12->_actionsLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v29, "setFont:", v30);

    v60 = v12->_actionsLabel;
    v31 = v10;
    v32 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v31, "responseSnapshot");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "responseNames");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");
    objc_msgSend(v31, "responseSnapshot");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "responseNames");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n• "));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("Responses: (%lu)\n• %@"), v35, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v60, "setText:", v39);

    v10 = v31;
    -[SBFluidSwitcherModifierTimelineEntryView addSubview:](v12, "addSubview:", v12->_actionsLabel);
    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v14, v15, v16, v17);
    postStackLabel = v12->_postStackLabel;
    v12->_postStackLabel = (UILabel *)v40;

    -[UILabel setNumberOfLines:](v12->_postStackLabel, "setNumberOfLines:", 0);
    v42 = v12->_postStackLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v42, "setFont:", v43);

    v44 = objc_alloc(MEMORY[0x1E0CB3778]);
    v45 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v31, "stackSnapshotAfterEvent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringWithFormat:", CFSTR("Resulting Modifier Stack: (%lu)\n"), objc_msgSend(v46, "countOfAllChildSnapshots"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v44, "initWithString:", v47);

    objc_msgSend(v10, "stackSnapshotAfterEvent");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherModifierTimelineEntryView _attributedStringsForStack:](v12, "_attributedStringsForStack:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "appendAttributedString:", v50);

    -[UILabel setAttributedText:](v12->_postStackLabel, "setAttributedText:", v48);
    -[SBFluidSwitcherModifierTimelineEntryView addSubview:](v12, "addSubview:", v12->_postStackLabel);
    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v12, sel__tap_);
    tapRecognizer = v12->_tapRecognizer;
    v12->_tapRecognizer = (UITapGestureRecognizer *)v51;

    -[SBFluidSwitcherModifierTimelineEntryView addGestureRecognizer:](v12, "addGestureRecognizer:", v12->_tapRecognizer);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherModifierTimelineEntryView setBackgroundColor:](v12, "setBackgroundColor:", v53);

    -[SBFluidSwitcherModifierTimelineEntryView layer](v12, "layer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setCornerRadius:", 20.0);

    -[SBFluidSwitcherModifierTimelineEntryView layer](v12, "layer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    -[SBFluidSwitcherModifierTimelineEntryView layer](v12, "layer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setShadowRadius:", 10.0);

    -[SBFluidSwitcherModifierTimelineEntryView layer](v12, "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v58) = 1045220557;
    objc_msgSend(v57, "setShadowOpacity:", v58);

    -[SBFluidSwitcherModifierTimelineEntryView setClipsToBounds:](v12, "setClipsToBounds:", 0);
  }

  return v12;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherModifierTimelineEntryView;
  -[SBFluidSwitcherModifierTimelineEntryView layoutSubviews](&v12, sel_layoutSubviews);
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", 0.0, 10.0, 250.0, 25.0);
  -[UILabel frame](self->_nameLabel, "frame");
  v4 = v3 + 10.0 + 10.0;
  -[UILabel sizeThatFits:](self->_postStackLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  -[UILabel setFrame:](self->_postStackLabel, "setFrame:", 5.0, v4, 240.0, v5);
  -[UILabel frame](self->_postStackLabel, "frame");
  v7 = v4 + v6 + 10.0;
  -[UILabel sizeThatFits:](self->_actionsLabel, "sizeThatFits:", 250.0, 1.79769313e308);
  -[UILabel setFrame:](self->_actionsLabel, "setFrame:", 5.0, v7, v8, v9);
  -[UILabel frame](self->_actionsLabel, "frame");
  -[SBFluidSwitcherModifierTimelineEntryView frame](self, "frame");
  v11 = v10;
  -[SBFluidSwitcherModifierTimelineEntryView frame](self, "frame");
  -[SBFluidSwitcherModifierTimelineEntryView setFrame:](self, "setFrame:", v11);
}

- (void)_tap:(id)a3
{
  id v4;

  -[SBFluidSwitcherModifierTimelineEntryView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didSelectEntryView:", self);

}

- (id)_attributedStringsForStack:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[SBFluidSwitcherModifierTimelineEntryView _appendRecursiveDescriptionToString:level:snapshot:](self, "_appendRecursiveDescriptionToString:level:snapshot:", v5, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_appendRecursiveDescriptionToString:(id)a3 level:(unint64_t)a4 snapshot:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  if (a4)
  {
    v11 = a4;
    do
    {
      objc_msgSend(v10, "appendString:", CFSTR("   "));
      --v11;
    }
    while (v11);
  }
  objc_msgSend(v10, "appendString:", CFSTR("• "));
  objc_msgSend(v9, "modifierName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherModifierTimelineEntryView _randomColorWithSeed:](self, "_randomColorWithSeed:", objc_msgSend(v12, "hash"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB3498]);
  v34 = *MEMORY[0x1E0CEA0A0];
  v35[0] = v13;
  v27 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v12, v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v10);
  objc_msgSend(v8, "appendAttributedString:", v17);

  objc_msgSend(v8, "appendAttributedString:", v16);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  objc_msgSend(v8, "appendAttributedString:", v18);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = v9;
  objc_msgSend(v9, "childSnapshots");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    v23 = a4 + 1;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        v25 = -[SBFluidSwitcherModifierTimelineEntryView _appendRecursiveDescriptionToString:level:snapshot:](self, "_appendRecursiveDescriptionToString:level:snapshot:", v8, v23, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v24++));
      }
      while (v21 != v24);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v21);
  }

  return v8;
}

- (id)_randomColorWithSeed:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = (void *)MEMORY[0x1E0CEA478];
  -[SBFluidSwitcherModifierTimelineEntryView _randomFloatFromSeed:min:max:](self, "_randomFloatFromSeed:min:max:", 0.0, 1.0);
  v7 = v6;
  -[SBFluidSwitcherModifierTimelineEntryView _randomFloatFromSeed:min:max:](self, "_randomFloatFromSeed:min:max:", a3, 0.4, 0.9);
  v9 = v8;
  -[SBFluidSwitcherModifierTimelineEntryView _randomFloatFromSeed:min:max:](self, "_randomFloatFromSeed:min:max:", a3, 0.6, 1.0);
  return (id)objc_msgSend(v5, "colorWithHue:saturation:brightness:alpha:", v7, v9, v10, 1.0);
}

- (double)_randomFloatFromSeed:(unint64_t)a3 min:(double)a4 max:(double)a5
{
  return a4 + (double)(-1640531534 * a3) * 2.32830644e-10 * (a5 - a4);
}

- (SBSwitcherModifierTimelineEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (SBFluidSwitcherModifierTimelineEntryViewDelegate)delegate
{
  return (SBFluidSwitcherModifierTimelineEntryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_actionsLabel, 0);
  objc_storeStrong((id *)&self->_postStackLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
