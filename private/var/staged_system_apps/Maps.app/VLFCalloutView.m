@implementation VLFCalloutView

- (VLFCalloutView)initWithFrame:(CGRect)a3
{
  VLFCalloutView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  double v6;
  uint64_t Integer;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UILabel *v25;
  UILabel *descriptionLabel;
  double v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  char *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  id v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  char *v69;
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
  void *v81;
  objc_super v82;
  _QWORD v83[5];
  _QWORD v84[4];
  _QWORD v85[2];
  uint8_t buf[4];
  const char *v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  int v91;
  __int16 v92;
  const char *v93;

  v82.receiver = self;
  v82.super_class = (Class)VLFCalloutView;
  v3 = -[VLFCalloutView initWithFrame:](&v82, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new(UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 2);
    LODWORD(v6) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v6);
    Integer = GEOConfigGetInteger(MapsConfig_VLFSessionTextExperimentConfig, off_1014B4238);
    switch(Integer)
    {
      case 0:
        goto LABEL_12;
      case 1:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("VLF_Active_Banner_Title_Text_1");
        break;
      case 2:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("VLF_Active_Banner_Title_Text_2");
        break;
      case 3:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("VLF_Active_Banner_Title_Text_3");
        break;
      default:
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v87 = "-[VLFCalloutView initWithFrame:]";
          v88 = 2080;
          v89 = "VLFCalloutView.m";
          v90 = 1024;
          v91 = 51;
          v92 = 2080;
          v93 = "experimentConfig == 0";
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100A70734())
        {
          v13 = sub_1004318FC();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v87 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
LABEL_12:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("VLF_Active_Banner_Title_Text");
        break;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
    -[UILabel setText:](v3->_titleLabel, "setText:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v17);

    -[VLFCalloutView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView leadingAnchor](v3, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v85[0] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_titleLabel, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView topAnchor](v3, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 2.0));
    v85[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    v25 = objc_opt_new(UILabel);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v25;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v27) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 0, v27);
    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 4);
    v28 = -[UILabel setAdjustsFontSizeToFitWidth:](v3->_descriptionLabel, "setAdjustsFontSizeToFitWidth:", 1);
    if (GEOVisualLocalizationCrowdsourcingIsSupported(v28, v29)
      && GEOVisualLocalizationCrowdsourcingIsAllowed()
      && GEOVisualLocalizationCrowdsourcingIsEnabled())
    {
      switch(Integer)
      {
        case 0:
          goto LABEL_39;
        case 1:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v31 = v30;
          v32 = CFSTR("VLF_Active_Banner_Description_Text_1_CrowdsourcingEnabled");
          break;
        case 2:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v31 = v30;
          v32 = CFSTR("VLF_Active_Banner_Description_Text_2_CrowdsourcingEnabled");
          break;
        case 3:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v31 = v30;
          v32 = CFSTR("VLF_Active_Banner_Description_Text_3_CrowdsourcingEnabled");
          break;
        default:
          v65 = sub_1004318FC();
          v66 = objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v87 = "-[VLFCalloutView initWithFrame:]";
            v88 = 2080;
            v89 = "VLFCalloutView.m";
            v90 = 1024;
            v91 = 82;
            v92 = 2080;
            v93 = "experimentConfig == 0";
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
          }

          if (sub_100A70734())
          {
            v67 = sub_1004318FC();
            v68 = objc_claimAutoreleasedReturnValue(v67);
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              v69 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              *(_DWORD *)buf = 138412290;
              v87 = v69;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            }
          }
LABEL_39:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v31 = v30;
          v32 = CFSTR("VLF_Active_Banner_Description_Text_CrowdsourcingEnabled");
          break;
      }
    }
    else
    {
      switch(Integer)
      {
        case 0:
          goto LABEL_30;
        case 1:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v31 = v30;
          v32 = CFSTR("VLF_Active_Banner_Description_Text_1");
          break;
        case 2:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v31 = v30;
          v32 = CFSTR("VLF_Active_Banner_Description_Text_2");
          break;
        case 3:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v31 = v30;
          v32 = CFSTR("VLF_Active_Banner_Description_Text_3");
          break;
        default:
          v33 = sub_1004318FC();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v87 = "-[VLFCalloutView initWithFrame:]";
            v88 = 2080;
            v89 = "VLFCalloutView.m";
            v90 = 1024;
            v91 = 100;
            v92 = 2080;
            v93 = "experimentConfig == 0";
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
          }

          if (sub_100A70734())
          {
            v35 = sub_1004318FC();
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v37 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              *(_DWORD *)buf = 138412290;
              v87 = v37;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            }
          }
LABEL_30:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v31 = v30;
          v32 = CFSTR("VLF_Active_Banner_Description_Text");
          break;
      }
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", v32, CFSTR("localized string not found"), 0));
    -[UILabel setText:](v3->_descriptionLabel, "setText:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v3->_descriptionLabel, "setTextColor:", v39);

    -[VLFCalloutView addSubview:](v3, "addSubview:", v3->_descriptionLabel);
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_descriptionLabel, "leadingAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView leadingAnchor](v3, "leadingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v77));
    v84[0] = v75;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_descriptionLabel, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView trailingAnchor](v3, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:", v40, -16.0));
    v84[1] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_descriptionLabel, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 2.0));
    v84[2] = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_descriptionLabel, "bottomAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView bottomAnchor](v3, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v46));
    v84[3] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v48);

    -[VLFCalloutView _updateFonts](v3, "_updateFonts");
    -[VLFCalloutView _updateDescriptionNumberOfLines](v3, "_updateDescriptionNumberOfLines");
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "_mapkit_fontWithWeight:", UIFontWeightMedium));
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v50));

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("xmark"), v80));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "imageWithRenderingMode:", 2));

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v53, "setImage:forState:", v52, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v53, "setTintColor:", v54);

    objc_msgSend(v53, "addTarget:action:forControlEvents:", v3, "userDismissedVLFCallout:", 64);
    -[VLFCalloutView addSubview:](v3, "addSubview:", v53);
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:constant:", v81, 14.0));
    v83[0] = v76;
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView trailingAnchor](v3, "trailingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v72));
    v83[1] = v71;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView topAnchor](v3, "topAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
    v83[2] = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "widthAnchor"));
    v70 = v52;
    objc_msgSend(v52, "size");
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToConstant:"));
    v83[3] = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "heightAnchor"));
    objc_msgSend(v52, "size");
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToConstant:", v61));
    v83[4] = v62;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v63);

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VLFCalloutView;
  -[VLFCalloutView traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[VLFCalloutView _updateFonts](self, "_updateFonts");
  -[VLFCalloutView _updateDescriptionNumberOfLines](self, "_updateDescriptionNumberOfLines");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
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
  UIFontDescriptorTraitKey v16;
  void *v17;
  UIFontDescriptorAttributeName v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v4));
  v18 = UIFontDescriptorTraitsAttribute;
  v16 = UIFontWeightTrait;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightSemibold));
  v17 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v19 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v9, 0.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "setFont:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView traitCollection](self, "traitCollection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraLarge));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleSubheadline, v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v15, "setFont:", v14);

}

- (void)_updateDescriptionNumberOfLines
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSComparisonResult v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));

  if (!v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView descriptionLabel](self, "descriptionLabel"));
    v10 = v8;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView traitCollection](self, "traitCollection"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = UIContentSizeCategoryCompareToCategory(v6, UIContentSizeCategoryLarge);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView descriptionLabel](self, "descriptionLabel"));
  v10 = v8;
  if (v7 != NSOrderedDescending)
  {
LABEL_5:
    v9 = 4;
    goto LABEL_6;
  }
  v9 = 5;
LABEL_6:
  objc_msgSend(v8, "setNumberOfLines:", v9);

}

- (void)userDismissedVLFCallout:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[VLFCalloutView delegate](self, "delegate", a3));
  objc_msgSend(v4, "calloutViewWasDismissed:", self);

}

- (VLFCalloutViewDelegate)delegate
{
  return (VLFCalloutViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
