@implementation MeCardShortcutView

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MeCardShortcutView)initWithContact:(id)a3
{
  id v5;
  MeCardShortcutView *v6;
  MeCardShortcutView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MeCardShortcutView;
  v6 = -[MeCardShortcutView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    -[MeCardShortcutView _createViews](v7, "_createViews");
  }

  return v7;
}

- (void)_createViews
{
  id v3;
  double y;
  double width;
  double height;
  UIImageView *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  UIImageView *schoolImageview;
  UIImageView *v18;
  id v19;
  UIImageView *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  UIImageView *workImageview;
  UIImageView *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  UIImageView **p_homeImageview;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
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
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  _QWORD v104[5];
  _QWORD v105[5];
  _QWORD v106[5];
  _QWORD v107[15];

  v3 = objc_alloc((Class)UIImageView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIImageView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.140000001)));
  v11 = objc_msgSend(v10, "CGColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v7, "layer"));
  objc_msgSend(v12, "setShadowColor:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v7, "layer"));
  objc_msgSend(v13, "setShadowOffset:", 0.0, 10.0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v7, "layer"));
  objc_msgSend(v14, "setShadowRadius:", 4.0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v7, "layer"));
  LODWORD(v16) = 0.25;
  objc_msgSend(v15, "setShadowOpacity:", v16);

  -[MeCardShortcutView addSubview:](self, "addSubview:", v7);
  schoolImageview = self->_schoolImageview;
  self->_schoolImageview = v7;
  v18 = v7;

  v19 = objc_alloc((Class)UIImageView);
  v20 = (UIImageView *)objc_msgSend(v19, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIImageView setBackgroundColor:](v20, "setBackgroundColor:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "colorWithAlphaComponent:", 0.140000001)));
  v24 = objc_msgSend(v23, "CGColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v20, "layer"));
  objc_msgSend(v25, "setShadowColor:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v20, "layer"));
  objc_msgSend(v26, "setShadowOffset:", 0.0, 10.0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v20, "layer"));
  objc_msgSend(v27, "setShadowRadius:", 4.0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v20, "layer"));
  LODWORD(v29) = 0.25;
  objc_msgSend(v28, "setShadowOpacity:", v29);

  -[MeCardShortcutView addSubview:](self, "addSubview:", v20);
  workImageview = self->_workImageview;
  self->_workImageview = v20;
  v31 = v20;

  v32 = objc_alloc((Class)UIImageView);
  v33 = objc_msgSend(v32, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v33, "setBackgroundColor:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "colorWithAlphaComponent:", 0.140000001)));
  v37 = objc_msgSend(v36, "CGColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
  objc_msgSend(v38, "setShadowColor:", v37);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
  objc_msgSend(v39, "setShadowOffset:", 0.0, 10.0);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
  objc_msgSend(v40, "setShadowRadius:", 4.0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
  LODWORD(v42) = 0.25;
  objc_msgSend(v41, "setShadowOpacity:", v42);

  -[MeCardShortcutView addSubview:](self, "addSubview:", v33);
  p_homeImageview = &self->_homeImageview;
  v102 = v33;
  objc_storeStrong((id *)&self->_homeImageview, v33);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutView traitCollection](self, "traitCollection"));
  v45 = objc_msgSend(v44, "userInterfaceIdiom");

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutView traitCollection](self, "traitCollection"));
  v47 = objc_msgSend(v46, "userInterfaceIdiom");

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutView traitCollection](self, "traitCollection"));
  v49 = objc_msgSend(v48, "userInterfaceIdiom");

  if (sub_1002A8AA0(self) == 5)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](*p_homeImageview, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutView leadingAnchor](self, "leadingAnchor"));
    v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, 17.0));
  }
  else
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_workImageview, "centerXAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutView centerXAnchor](self, "centerXAnchor"));
    v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v51));
  }
  v103 = (void *)v52;

  if (v49 == (id)5)
    v53 = 6.0;
  else
    v53 = 10.0;
  if (v47 == (id)5)
    v54 = 0.0;
  else
    v54 = 14.0;
  if (v45 == (id)5)
    v55 = 41.0;
  else
    v55 = 60.0;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](*p_homeImageview, "topAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_workImageview, "topAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:", v100));
  v107[0] = v99;
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](*p_homeImageview, "bottomAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_workImageview, "bottomAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v97));
  v107[1] = v96;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](*p_homeImageview, "widthAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToConstant:", v55));
  v107[2] = v94;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](*p_homeImageview, "heightAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](*p_homeImageview, "widthAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v92));
  v107[3] = v91;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](*p_homeImageview, "trailingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_workImageview, "leadingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:constant:", v89, v53));
  v107[4] = v88;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_workImageview, "topAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutView topAnchor](self, "topAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:constant:", v86, v54));
  v107[5] = v85;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_workImageview, "bottomAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutView bottomAnchor](self, "bottomAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v83, -v54));
  v107[6] = v82;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_workImageview, "widthAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToConstant:", v55));
  v107[7] = v80;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_workImageview, "widthAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_workImageview, "heightAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v78));
  v107[8] = v77;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_schoolImageview, "topAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_workImageview, "topAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v75));
  v107[9] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_schoolImageview, "bottomAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_workImageview, "bottomAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
  v107[10] = v71;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_schoolImageview, "widthAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:", v55));
  v107[11] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_schoolImageview, "widthAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_schoolImageview, "heightAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v59));
  v107[12] = v60;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_schoolImageview, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_workImageview, "trailingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, -v53));
  v107[13] = v63;
  v107[14] = v103;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v107, 15));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v64);

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
  v106[0] = _NSConcreteStackBlock;
  v106[1] = 3221225472;
  v106[2] = sub_100927C98;
  v106[3] = &unk_1011BAA70;
  v106[4] = self;
  objc_msgSend(v65, "getImageForStyleAttributes:completion:", v66, v106);

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_100927CB0;
  v105[3] = &unk_1011BAA70;
  v105[4] = self;
  objc_msgSend(v67, "getImageForStyleAttributes:completion:", v68, v105);

  v69 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_100927CC8;
  v104[3] = &unk_1011BAA70;
  v104[4] = self;
  objc_msgSend(v69, "getImageForStyleAttributes:completion:", v70, v104);

}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_schoolImageview, 0);
  objc_storeStrong((id *)&self->_workImageview, 0);
  objc_storeStrong((id *)&self->_homeImageview, 0);
}

@end
