@implementation RouteAnnotationCell

- (RouteAnnotationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RouteAnnotationCell *v4;
  void *v5;
  void *v6;
  void *v7;
  AutolayoutImageView *v8;
  void *v9;
  double v10;
  id v11;
  double y;
  double width;
  double height;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  objc_super v82;
  _QWORD v83[4];
  _QWORD v84[2];
  _QWORD v85[2];

  v82.receiver = self;
  v82.super_class = (Class)RouteAnnotationCell;
  v4 = -[RouteAnnotationCell initWithStyle:reuseIdentifier:](&v82, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[RouteAnnotationCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell contentView](v4, "contentView"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = -[AutolayoutImageView initWithImage:]([AutolayoutImageView alloc], "initWithImage:", 0);
    -[RouteAnnotationCell setIconImageView:](v4, "setIconImageView:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell iconImageView](v4, "iconImageView"));
    LODWORD(v10) = 1148846080;
    objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v10);

    v11 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v15 = objc_msgSend(v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[RouteAnnotationCell setDetailsLabel:](v4, "setDetailsLabel:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell detailsLabel](v4, "detailsLabel"));
    objc_msgSend(v17, "setFont:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell detailsLabel](v4, "detailsLabel"));
    objc_msgSend(v18, "setNumberOfLines:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell detailsLabel](v4, "detailsLabel"));
    LODWORD(v20) = 1132068864;
    objc_msgSend(v19, "setContentHuggingPriority:forAxis:", 0, v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell detailsLabel](v4, "detailsLabel"));
    LODWORD(v22) = 1144766464;
    objc_msgSend(v21, "setContentCompressionResistancePriority:forAxis:", 0, v22);

    v23 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[RouteAnnotationCell setMetadataLabel:](v4, "setMetadataLabel:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell metadataLabel](v4, "metadataLabel"));
    objc_msgSend(v25, "setFont:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell metadataLabel](v4, "metadataLabel"));
    objc_msgSend(v27, "setTextColor:", v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell metadataLabel](v4, "metadataLabel"));
    objc_msgSend(v28, "setNumberOfLines:", 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell metadataLabel](v4, "metadataLabel"));
    LODWORD(v30) = 1132068864;
    objc_msgSend(v29, "setContentHuggingPriority:forAxis:", 0, v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell metadataLabel](v4, "metadataLabel"));
    LODWORD(v32) = 1144766464;
    objc_msgSend(v31, "setContentCompressionResistancePriority:forAxis:", 0, v32);

    v33 = objc_alloc((Class)UIStackView);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell detailsLabel](v4, "detailsLabel"));
    v85[0] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell metadataLabel](v4, "metadataLabel"));
    v85[1] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 2));
    v37 = objc_msgSend(v33, "initWithArrangedSubviews:", v36);

    objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v37, "setAxis:", 1);
    objc_msgSend(v37, "setDistribution:", 0);
    objc_msgSend(v37, "setAlignment:", 0);
    objc_msgSend(v37, "setBaselineRelativeArrangement:", 1);
    LODWORD(v38) = 1132068864;
    objc_msgSend(v37, "setContentHuggingPriority:forAxis:", 0, v38);
    LODWORD(v39) = 1144750080;
    objc_msgSend(v37, "setContentCompressionResistancePriority:forAxis:", 0, v39);
    +[DynamicTypeWizard autoscaleStackView:spacing:withFontProvider:](DynamicTypeWizard, "autoscaleStackView:spacing:withFontProvider:", v37, &stru_1011DBE58, 28.0);
    v40 = objc_alloc((Class)UIStackView);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell iconImageView](v4, "iconImageView"));
    v84[0] = v41;
    v84[1] = v37;
    v80 = v37;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 2));
    v43 = objc_msgSend(v40, "initWithArrangedSubviews:", v42);
    -[RouteAnnotationCell setStackView:](v4, "setStackView:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell stackView](v4, "stackView"));
    objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell stackView](v4, "stackView"));
    objc_msgSend(v45, "setAxis:", 0);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell stackView](v4, "stackView"));
    objc_msgSend(v46, "setDistribution:", 0);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell stackView](v4, "stackView"));
    objc_msgSend(v47, "setAlignment:", 1);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell stackView](v4, "stackView"));
    objc_msgSend(v48, "setSpacing:", 10.0);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell stackView](v4, "stackView"));
    LODWORD(v50) = 1132068864;
    objc_msgSend(v49, "setContentHuggingPriority:forAxis:", 0, v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell stackView](v4, "stackView"));
    LODWORD(v52) = 1144750080;
    objc_msgSend(v51, "setContentCompressionResistancePriority:forAxis:", 0, v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell contentView](v4, "contentView"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell stackView](v4, "stackView"));
    objc_msgSend(v53, "addSubview:", v54);

    v81 = objc_alloc_init((Class)NSMutableArray);
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstBaselineAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell contentView](v4, "contentView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "topAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v76, &stru_1011DBE78, 32.0));
    v83[0] = v75;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell stackView](v4, "stackView"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell contentView](v4, "contentView"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "leadingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, 16.0));
    v83[1] = v70;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell contentView](v4, "contentView"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell stackView](v4, "stackView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "trailingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:constant:", v56, 16.0));
    v83[2] = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell contentView](v4, "contentView"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "bottomAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell stackView](v4, "stackView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bottomAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v61, 1.0));
    v83[3] = v62;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 4));
    objc_msgSend(v81, "addObjectsFromArray:", v63);

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationCell iconImageView](v4, "iconImageView"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "widthAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToConstant:", 30.0));
    objc_msgSend(v81, "addObject:", v66);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v81);
  }
  return v4;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UILabel)detailsLabel
{
  return self->_detailsLabel;
}

- (void)setDetailsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailsLabel, a3);
}

- (UILabel)metadataLabel
{
  return self->_metadataLabel;
}

- (void)setMetadataLabel:(id)a3
{
  objc_storeStrong((id *)&self->_metadataLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataLabel, 0);
  objc_storeStrong((id *)&self->_detailsLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
