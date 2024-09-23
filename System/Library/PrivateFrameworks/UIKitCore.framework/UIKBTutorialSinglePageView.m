@implementation UIKBTutorialSinglePageView

- (UILabel)textBody
{
  return self->_textBody;
}

- (UIKBTutorialSinglePageView)initWithImageView:(id)a3
{
  id v5;
  UIKBTutorialSinglePageView *v6;
  UIKBTutorialSinglePageView *v7;
  UILabel *v8;
  UILabel *textTitle;
  UILabel *v10;
  UILabel *textBody;
  UIKBTutorialSinglePageView *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIKBTutorialSinglePageView;
  v6 = -[UIView init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualDisplayView, a3);
    -[UIView addSubview:](v7, "addSubview:", v7->_visualDisplayView);
    v8 = objc_alloc_init(UILabel);
    textTitle = v7->_textTitle;
    v7->_textTitle = v8;

    -[UILabel setTextAlignment:](v7->_textTitle, "setTextAlignment:", 1);
    -[UIView addSubview:](v7, "addSubview:", v7->_textTitle);
    v10 = objc_alloc_init(UILabel);
    textBody = v7->_textBody;
    v7->_textBody = v10;

    -[UILabel setTextAlignment:](v7->_textBody, "setTextAlignment:", 1);
    -[UIView addSubview:](v7, "addSubview:", v7->_textBody);
    v12 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textBody, 0);
  objc_storeStrong((id *)&self->_textTitle, 0);
  objc_storeStrong((id *)&self->_visualDisplayView, 0);
}

- (void)configPageView
{
  BOOL v3;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
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
  UILayoutGuide *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  UILayoutGuide *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
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
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  UILayoutGuide *v116;

  v3 = -[UIKBTutorialSinglePageView useAlertStyle](self, "useAlertStyle");
  v116 = objc_alloc_init(UILayoutGuide);
  -[UIView addLayoutGuide:](self, "addLayoutGuide:", v116);
  -[UILayoutGuide topAnchor](v116, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[UILayoutGuide heightAnchor](v116, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    objc_msgSend(v7, "constraintEqualToConstant:", 29.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v116, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    -[UIKBTutorialSinglePageView textBody](self, "textBody");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBTutorialSinglePageView textBody](self, "textBody");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 1.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActive:", 1);

    -[UIKBTutorialSinglePageView textBody](self, "textBody");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    -[UIKBTutorialSinglePageView textBody](self, "textBody");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setActive:", 1);

    -[UIKBTutorialSinglePageView visualDisplayView](self, "visualDisplayView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBTutorialSinglePageView visualDisplayView](self, "visualDisplayView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialSinglePageView textBody](self, "textBody");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43, 20.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

    -[UIKBTutorialSinglePageView visualDisplayView](self, "visualDisplayView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "centerXAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setActive:", 1);

    v49 = objc_alloc_init(UILayoutGuide);
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", v49);
    -[UILayoutGuide bottomAnchor](v49, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setActive:", 1);

    -[UILayoutGuide topAnchor](v49, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialSinglePageView visualDisplayView](self, "visualDisplayView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setActive:", 1);

    -[UILayoutGuide heightAnchor](v49, "heightAnchor");
    v57 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide constraintEqualToConstant:](v57, "constraintEqualToConstant:", 20.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "constraintEqualToConstant:", 20.0);
    v49 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();

    LODWORD(v59) = 1132003328;
    -[UILayoutGuide setPriority:](v49, "setPriority:", v59);
    -[UILayoutGuide setActive:](v49, "setActive:", 1);
    -[UIKBTutorialSinglePageView visualDisplayView](self, "visualDisplayView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBTutorialSinglePageView visualDisplayView](self, "visualDisplayView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v116, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setActive:", 1);

    -[UIKBTutorialSinglePageView visualDisplayView](self, "visualDisplayView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "centerXAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self, "centerXAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setActive:", 1);

    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialSinglePageView visualDisplayView](self, "visualDisplayView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v73, 20.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setActive:", 1);

    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setActive:", 1);

    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setActive:", 1);

    -[UIKBTutorialSinglePageView textBody](self, "textBody");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBTutorialSinglePageView textBody](self, "textBody");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "leadingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setActive:", 1);

    -[UIKBTutorialSinglePageView textBody](self, "textBody");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "trailingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setActive:", 1);

    -[UIView bottomAnchor](self, "bottomAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialSinglePageView textBody](self, "textBody");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "bottomAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintGreaterThanOrEqualToAnchor:constant:", v96, 6.0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setActive:", 1);

    -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "text");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "length");

    -[UIKBTutorialSinglePageView textBody](self, "textBody");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "topAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (v100)
    {
      -[UIKBTutorialSinglePageView textTitle](self, "textTitle");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "bottomAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = 6.0;
    }
    else
    {
      -[UIKBTutorialSinglePageView visualDisplayView](self, "visualDisplayView");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "bottomAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = 20.0;
    }
    objc_msgSend(v102, "constraintEqualToAnchor:constant:", v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setActive:", 1);

    v57 = objc_alloc_init(UILayoutGuide);
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", v57);
    -[UILayoutGuide bottomAnchor](v57, "bottomAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:", v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setActive:", 1);

    -[UILayoutGuide topAnchor](v57, "topAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialSinglePageView textBody](self, "textBody");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "firstBaselineAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToAnchor:", v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setActive:", 1);

    -[UILayoutGuide heightAnchor](v57, "heightAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToConstant:", 36.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v115) = 1144750080;
    objc_msgSend(v58, "setPriority:", v115);
  }
  objc_msgSend(v58, "setActive:", 1);

}

- (UIView)visualDisplayView
{
  return self->_visualDisplayView;
}

- (void)setVisualDisplayView:(id)a3
{
  objc_storeStrong((id *)&self->_visualDisplayView, a3);
}

- (UILabel)textTitle
{
  return self->_textTitle;
}

- (void)setTextTitle:(id)a3
{
  objc_storeStrong((id *)&self->_textTitle, a3);
}

- (void)setTextBody:(id)a3
{
  objc_storeStrong((id *)&self->_textBody, a3);
}

- (BOOL)useAlertStyle
{
  return self->_useAlertStyle;
}

- (void)setUseAlertStyle:(BOOL)a3
{
  self->_useAlertStyle = a3;
}

@end
