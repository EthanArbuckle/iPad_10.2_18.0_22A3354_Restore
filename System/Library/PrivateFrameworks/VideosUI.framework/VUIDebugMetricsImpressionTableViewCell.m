@implementation VUIDebugMetricsImpressionTableViewCell

- (VUIDebugMetricsImpressionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  VUIDebugMetricsImpressionTableViewCell *v4;
  VUITextLayout *v5;
  void *v6;
  uint64_t v7;
  VUILabel *nameLabel;
  void *v9;
  VUITextLayout *v10;
  void *v11;
  uint64_t v12;
  VUILabel *typeLabel;
  void *v14;
  VUITextLayout *v15;
  void *v16;
  uint64_t v17;
  VUILabel *staticIDLabel;
  void *v19;
  uint64_t v20;
  VUILabel *idLabel;
  void *v22;
  uint64_t v23;
  VUILabel *idTypeLabel;
  void *v25;
  uint64_t v26;
  VUILabel *staticImpressionIdLabel;
  void *v28;
  uint64_t v29;
  VUILabel *impressionIdLabel;
  void *v31;
  uint64_t v32;
  VUILabel *staticImpressionIndexLabel;
  void *v34;
  uint64_t v35;
  VUILabel *impressionIndexLabel;
  void *v37;
  uint64_t v38;
  VUILabel *staticImpressionParentLabel;
  void *v40;
  uint64_t v41;
  VUILabel *impressionParentIdLabel;
  void *v43;
  uint64_t v44;
  VUILabel *impressionParentNameLabel;
  void *v46;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)VUIDebugMetricsImpressionTableViewCell;
  v4 = -[VUIDebugMetricsImpressionTableViewCell initWithStyle:reuseIdentifier:](&v48, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setNumberOfLines:](v5, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v5, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v5, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setFontSize:](v5, "setFontSize:", 20.0);
    -[VUITextLayout setFontWeight:](v5, "setFontWeight:", 6);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v5, "setColor:", v6);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = (VUILabel *)v7;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_nameLabel);

    v10 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setNumberOfLines:](v10, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v10, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v10, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setFontSize:](v10, "setFontSize:", 18.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v10, "setColor:", v11);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v10, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    typeLabel = v4->_typeLabel;
    v4->_typeLabel = (VUILabel *)v12;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v4->_typeLabel);

    v15 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setNumberOfLines:](v15, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v15, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v15, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setFontSize:](v10, "setFontSize:", 15.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v15, "setColor:", v16);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", CFSTR("id: "), v15, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    staticIDLabel = v4->_staticIDLabel;
    v4->_staticIDLabel = (VUILabel *)v17;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v4->_staticIDLabel);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v15, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    idLabel = v4->_idLabel;
    v4->_idLabel = (VUILabel *)v20;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v4->_idLabel);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v15, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    idTypeLabel = v4->_idTypeLabel;
    v4->_idTypeLabel = (VUILabel *)v23;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v4->_idTypeLabel);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", CFSTR("Impression Id: "), v15, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    staticImpressionIdLabel = v4->_staticImpressionIdLabel;
    v4->_staticImpressionIdLabel = (VUILabel *)v26;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v4->_staticImpressionIdLabel);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v15, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    impressionIdLabel = v4->_impressionIdLabel;
    v4->_impressionIdLabel = (VUILabel *)v29;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v4->_impressionIdLabel);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", CFSTR("Index: "), v15, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    staticImpressionIndexLabel = v4->_staticImpressionIndexLabel;
    v4->_staticImpressionIndexLabel = (VUILabel *)v32;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", v4->_staticImpressionIndexLabel);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v15, 0);
    v35 = objc_claimAutoreleasedReturnValue();
    impressionIndexLabel = v4->_impressionIndexLabel;
    v4->_impressionIndexLabel = (VUILabel *)v35;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v4->_impressionIndexLabel);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", CFSTR("Parent: "), v15, 0);
    v38 = objc_claimAutoreleasedReturnValue();
    staticImpressionParentLabel = v4->_staticImpressionParentLabel;
    v4->_staticImpressionParentLabel = (VUILabel *)v38;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSubview:", v4->_staticImpressionParentLabel);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v15, 0);
    v41 = objc_claimAutoreleasedReturnValue();
    impressionParentIdLabel = v4->_impressionParentIdLabel;
    v4->_impressionParentIdLabel = (VUILabel *)v41;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", v4->_impressionParentIdLabel);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v15, 0);
    v44 = objc_claimAutoreleasedReturnValue();
    impressionParentNameLabel = v4->_impressionParentNameLabel;
    v4->_impressionParentNameLabel = (VUILabel *)v44;

    -[VUIDebugMetricsImpressionTableViewCell contentView](v4, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addSubview:", v4->_impressionParentNameLabel);

  }
  return v4;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[VUIDebugMetricsImpressionTableViewCell nameLabel](self, "nameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIDebugMetricsImpressionTableViewCell nameLabel](self, "nameLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)type
{
  void *v2;
  void *v3;

  -[VUIDebugMetricsImpressionTableViewCell typeLabel](self, "typeLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIDebugMetricsImpressionTableViewCell typeLabel](self, "typeLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)idStr
{
  void *v2;
  void *v3;

  -[VUIDebugMetricsImpressionTableViewCell idLabel](self, "idLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setIdStr:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIDebugMetricsImpressionTableViewCell idLabel](self, "idLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)idType
{
  void *v2;
  void *v3;

  -[VUIDebugMetricsImpressionTableViewCell idTypeLabel](self, "idTypeLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setIdType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VUIDebugMetricsImpressionTableViewCell idTypeLabel](self, "idTypeLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setText:", v5);
}

- (NSString)impressionId
{
  void *v2;
  void *v3;

  -[VUIDebugMetricsImpressionTableViewCell impressionIdLabel](self, "impressionIdLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setImpressionId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIDebugMetricsImpressionTableViewCell impressionIdLabel](self, "impressionIdLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)impressionIndex
{
  void *v2;
  void *v3;

  -[VUIDebugMetricsImpressionTableViewCell impressionIndexLabel](self, "impressionIndexLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setImpressionIndex:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIDebugMetricsImpressionTableViewCell impressionIndexLabel](self, "impressionIndexLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)impressionParentId
{
  void *v2;
  void *v3;

  -[VUIDebugMetricsImpressionTableViewCell impressionParentIdLabel](self, "impressionParentIdLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setImpressionParentId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIDebugMetricsImpressionTableViewCell impressionParentIdLabel](self, "impressionParentIdLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)impressionParentName
{
  void *v2;
  void *v3;

  -[VUIDebugMetricsImpressionTableViewCell impressionParentNameLabel](self, "impressionParentNameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setImpressionParentName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VUIDebugMetricsImpressionTableViewCell impressionParentNameLabel](self, "impressionParentNameLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setText:", v5);
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat rect;
  CGFloat rect_8;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  -[VUIDebugMetricsImpressionTableViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v12 = v11;
  v14 = v13;
  v75.origin.x = v4;
  rect = v4;
  v75.origin.y = v6;
  v75.size.width = v8;
  v75.size.height = v10;
  rect_8 = CGRectGetWidth(v75) - v12 - v14;
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v76.origin.x = v4;
  v76.origin.y = v6;
  v76.size.width = v8;
  v76.size.height = v10;
  -[VUILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v76));
  v17 = v16;
  v19 = v18;
  -[VUILabel setFrame:](self->_nameLabel, "setFrame:", v12, v15, v16, v18);
  v77.origin.x = v12;
  v77.origin.y = v15;
  v77.size.width = v17;
  v77.size.height = v19;
  v20 = v15 + CGRectGetHeight(v77);
  v78.origin.x = rect;
  v78.origin.y = v6;
  v78.size.width = v8;
  v78.size.height = v10;
  -[VUILabel sizeThatFits:](self->_typeLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v78));
  v22 = v21;
  v24 = v23;
  -[VUILabel setFrame:](self->_typeLabel, "setFrame:", v12, v20, v21, v23);
  v79.origin.x = v12;
  v79.origin.y = v20;
  v79.size.width = v22;
  v79.size.height = v24;
  v25 = v20 + CGRectGetHeight(v79);
  v80.origin.x = rect;
  v80.origin.y = v6;
  v80.size.width = v8;
  v80.size.height = v10;
  -[VUILabel sizeThatFits:](self->_staticIDLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v80));
  v27 = v26;
  v29 = v28;
  -[VUILabel setFrame:](self->_staticIDLabel, "setFrame:", v12, v25, v26, v28);
  v81.origin.x = v12;
  v81.origin.y = v25;
  v81.size.width = v27;
  v81.size.height = v29;
  v30 = v12 + CGRectGetWidth(v81) + 5.0;
  v82.size.width = v8;
  v82.origin.x = rect;
  v82.origin.y = v6;
  v82.size.height = v10;
  -[VUILabel sizeThatFits:](self->_idLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v82));
  v32 = v31;
  v34 = v33;
  -[VUILabel setFrame:](self->_idLabel, "setFrame:", v30, v25, v31, v33);
  v83.origin.x = v30;
  v83.origin.y = v25;
  v83.size.width = v32;
  v83.size.height = v34;
  v71 = v30 + CGRectGetWidth(v83) + 5.0;
  v84.origin.x = rect;
  v84.origin.y = v6;
  v84.size.width = v8;
  v84.size.height = v10;
  -[VUILabel sizeThatFits:](self->_idTypeLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v84));
  v36 = v35;
  v38 = v37;
  -[VUILabel setFrame:](self->_idTypeLabel, "setFrame:", v71, v25, v35, v37);
  v85.origin.x = v12;
  v85.origin.y = v25;
  v85.size.width = v36;
  v85.size.height = v38;
  v39 = v25 + CGRectGetHeight(v85);
  v86.origin.x = rect;
  v86.origin.y = v6;
  v86.size.width = v8;
  v86.size.height = v10;
  -[VUILabel sizeThatFits:](self->_staticImpressionIdLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v86));
  v41 = v40;
  v43 = v42;
  -[VUILabel setFrame:](self->_staticImpressionIdLabel, "setFrame:", v12, v39, v40, v42);
  v87.origin.x = v12;
  v87.origin.y = v39;
  v87.size.width = v41;
  v87.size.height = v43;
  v44 = v12 + CGRectGetWidth(v87) + 5.0;
  v88.origin.x = rect;
  v88.origin.y = v6;
  v88.size.width = v8;
  v88.size.height = v10;
  -[VUILabel sizeThatFits:](self->_impressionIdLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v88));
  v46 = v45;
  v48 = v47;
  -[VUILabel setFrame:](self->_impressionIdLabel, "setFrame:", v44, v39, v45, v47);
  v89.origin.x = v12;
  v89.origin.y = v39;
  v89.size.width = v46;
  v89.size.height = v48;
  v49 = v39 + CGRectGetHeight(v89);
  v90.origin.x = rect;
  v90.origin.y = v6;
  v90.size.width = v8;
  v90.size.height = v10;
  -[VUILabel sizeThatFits:](self->_staticImpressionIndexLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v90));
  v51 = v50;
  v53 = v52;
  -[VUILabel setFrame:](self->_staticImpressionIndexLabel, "setFrame:", v12, v49, v50, v52);
  v91.origin.x = v12;
  v91.origin.y = v49;
  v91.size.width = v51;
  v91.size.height = v53;
  v72 = v12 + CGRectGetWidth(v91) + 5.0;
  v92.origin.x = rect;
  v92.origin.y = v6;
  v92.size.width = v8;
  v92.size.height = v10;
  -[VUILabel sizeThatFits:](self->_impressionIndexLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v92));
  v55 = v54;
  v57 = v56;
  -[VUILabel setFrame:](self->_impressionIndexLabel, "setFrame:", v72, v49, v54, v56);
  v93.origin.x = v12;
  v93.origin.y = v49;
  v93.size.width = v55;
  v93.size.height = v57;
  v58 = v49 + CGRectGetHeight(v93);
  v94.origin.x = rect;
  v94.origin.y = v6;
  v94.size.width = v8;
  v94.size.height = v10;
  -[VUILabel sizeThatFits:](self->_staticImpressionParentLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v94));
  v60 = v59;
  v62 = v61;
  -[VUILabel setFrame:](self->_staticImpressionParentLabel, "setFrame:", v12, v58, v59, v61);
  v95.origin.x = v12;
  v95.origin.y = v58;
  v95.size.width = v60;
  v95.size.height = v62;
  v63 = v12 + CGRectGetWidth(v95) + 5.0;
  v96.origin.x = rect;
  v96.origin.y = v6;
  v96.size.width = v8;
  v96.size.height = v10;
  -[VUILabel sizeThatFits:](self->_impressionParentIdLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v96));
  v65 = v64;
  v67 = v66;
  -[VUILabel setFrame:](self->_impressionParentIdLabel, "setFrame:", v63, v58, v64, v66);
  v97.origin.x = v63;
  v97.origin.y = v58;
  v97.size.width = v65;
  v97.size.height = v67;
  v68 = v63 + CGRectGetWidth(v97) + 5.0;
  v98.origin.x = rect;
  v98.origin.y = v6;
  v98.size.width = v8;
  v98.size.height = v10;
  -[VUILabel sizeThatFits:](self->_impressionParentNameLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v98));
  -[VUILabel setFrame:](self->_impressionParentNameLabel, "setFrame:", v68, v58, v69, v70);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VUIDebugMetricsImpressionTableViewCell;
  -[VUIDebugMetricsImpressionTableViewCell prepareForReuse](&v11, sel_prepareForReuse);
  -[VUIDebugMetricsImpressionTableViewCell nameLabel](self, "nameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_1E9FF3598);

  -[VUIDebugMetricsImpressionTableViewCell typeLabel](self, "typeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", &stru_1E9FF3598);

  -[VUIDebugMetricsImpressionTableViewCell idLabel](self, "idLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_1E9FF3598);

  -[VUIDebugMetricsImpressionTableViewCell idTypeLabel](self, "idTypeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", &stru_1E9FF3598);

  -[VUIDebugMetricsImpressionTableViewCell impressionIdLabel](self, "impressionIdLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", &stru_1E9FF3598);

  -[VUIDebugMetricsImpressionTableViewCell impressionIndexLabel](self, "impressionIndexLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", &stru_1E9FF3598);

  -[VUIDebugMetricsImpressionTableViewCell impressionParentIdLabel](self, "impressionParentIdLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", &stru_1E9FF3598);

  -[VUIDebugMetricsImpressionTableViewCell impressionParentNameLabel](self, "impressionParentNameLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", &stru_1E9FF3598);

}

- (VUILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (VUILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setTypeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_typeLabel, a3);
}

- (VUILabel)staticIDLabel
{
  return self->_staticIDLabel;
}

- (void)setStaticIDLabel:(id)a3
{
  objc_storeStrong((id *)&self->_staticIDLabel, a3);
}

- (VUILabel)idLabel
{
  return self->_idLabel;
}

- (void)setIdLabel:(id)a3
{
  objc_storeStrong((id *)&self->_idLabel, a3);
}

- (VUILabel)idTypeLabel
{
  return self->_idTypeLabel;
}

- (void)setIdTypeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_idTypeLabel, a3);
}

- (VUILabel)staticImpressionIdLabel
{
  return self->_staticImpressionIdLabel;
}

- (void)setStaticImpressionIdLabel:(id)a3
{
  objc_storeStrong((id *)&self->_staticImpressionIdLabel, a3);
}

- (VUILabel)impressionIdLabel
{
  return self->_impressionIdLabel;
}

- (void)setImpressionIdLabel:(id)a3
{
  objc_storeStrong((id *)&self->_impressionIdLabel, a3);
}

- (VUILabel)staticImpressionIndexLabel
{
  return self->_staticImpressionIndexLabel;
}

- (void)setStaticImpressionIndexLabel:(id)a3
{
  objc_storeStrong((id *)&self->_staticImpressionIndexLabel, a3);
}

- (VUILabel)impressionIndexLabel
{
  return self->_impressionIndexLabel;
}

- (void)setImpressionIndexLabel:(id)a3
{
  objc_storeStrong((id *)&self->_impressionIndexLabel, a3);
}

- (VUILabel)staticImpressionParentLabel
{
  return self->_staticImpressionParentLabel;
}

- (void)setStaticImpressionParentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_staticImpressionParentLabel, a3);
}

- (VUILabel)impressionParentIdLabel
{
  return self->_impressionParentIdLabel;
}

- (void)setImpressionParentIdLabel:(id)a3
{
  objc_storeStrong((id *)&self->_impressionParentIdLabel, a3);
}

- (VUILabel)impressionParentNameLabel
{
  return self->_impressionParentNameLabel;
}

- (void)setImpressionParentNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_impressionParentNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionParentNameLabel, 0);
  objc_storeStrong((id *)&self->_impressionParentIdLabel, 0);
  objc_storeStrong((id *)&self->_staticImpressionParentLabel, 0);
  objc_storeStrong((id *)&self->_impressionIndexLabel, 0);
  objc_storeStrong((id *)&self->_staticImpressionIndexLabel, 0);
  objc_storeStrong((id *)&self->_impressionIdLabel, 0);
  objc_storeStrong((id *)&self->_staticImpressionIdLabel, 0);
  objc_storeStrong((id *)&self->_idTypeLabel, 0);
  objc_storeStrong((id *)&self->_idLabel, 0);
  objc_storeStrong((id *)&self->_staticIDLabel, 0);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
