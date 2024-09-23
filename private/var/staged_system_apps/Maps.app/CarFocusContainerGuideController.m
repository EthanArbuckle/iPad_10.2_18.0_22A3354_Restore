@implementation CarFocusContainerGuideController

- (CarFocusContainerGuideController)initWithHostView:(id)a3
{
  id v4;
  CarFocusContainerGuideController *v5;
  CarFocusContainerGuideController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarFocusContainerGuideController;
  v5 = -[CarFocusContainerGuideController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_hostView, v4);

  return v6;
}

- (id)_addGuideForEdge:(unint64_t)a3
{
  CarFocusContainerGuide *v5;
  UIView **p_hostView;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  unsigned int v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  uint8_t buf[16];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[4];
  _QWORD v43[4];

  v5 = objc_alloc_init(CarFocusContainerGuide);
  p_hostView = &self->_hostView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
  objc_msgSend(WeakRetained, "addLayoutGuide:", v5);

  v8 = objc_loadWeakRetained((id *)p_hostView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "safeAreaLayoutGuide"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  switch(a3)
  {
    case 1uLL:
      v37 = objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide topAnchor](v5, "topAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject constraintEqualToAnchor:](v37, "constraintEqualToAnchor:", v36));
      v43[0] = v35;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide leftAnchor](v5, "leftAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leftAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
      v43[1] = v32;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide rightAnchor](v5, "rightAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
      v43[2] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide heightAnchor](v5, "heightAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 30.0));
      v43[3] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 4));
      objc_msgSend(v10, "addObjectsFromArray:", v16);

      v17 = v37;
      goto LABEL_9;
    case 2uLL:
      v38 = objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide topAnchor](v5, "topAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject constraintEqualToAnchor:](v38, "constraintEqualToAnchor:", v36));
      v42[0] = v35;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide leftAnchor](v5, "leftAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leftAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
      v42[1] = v32;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide bottomAnchor](v5, "bottomAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
      v42[2] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide widthAnchor](v5, "widthAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 30.0));
      v42[3] = v20;
      v21 = v42;
      goto LABEL_8;
    case 4uLL:
      v38 = objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide leftAnchor](v5, "leftAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leftAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject constraintEqualToAnchor:](v38, "constraintEqualToAnchor:", v36));
      v40[0] = v35;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide rightAnchor](v5, "rightAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
      v40[1] = v32;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide bottomAnchor](v5, "bottomAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
      v40[2] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide heightAnchor](v5, "heightAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 30.0));
      v40[3] = v20;
      v21 = v40;
      goto LABEL_8;
    case 8uLL:
      v38 = objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide topAnchor](v5, "topAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject constraintEqualToAnchor:](v38, "constraintEqualToAnchor:", v36));
      v41[0] = v35;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide rightAnchor](v5, "rightAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
      v41[1] = v32;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide bottomAnchor](v5, "bottomAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
      v41[2] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide widthAnchor](v5, "widthAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 30.0));
      v41[3] = v20;
      v21 = v41;
LABEL_8:
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
      objc_msgSend(v10, "addObjectsFromArray:", v23);

      v17 = v38;
LABEL_9:

      break;
    default:
      v22 = sub_10043364C();
      v17 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Tried to create focus container guide for invalid edge.", buf, 2u);
      }
      break;
  }

  v24 = objc_loadWeakRetained((id *)p_hostView);
  objc_msgSend(v24, "addConstraints:", v10);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v26 = objc_msgSend(v25, "BOOLForKey:", CFSTR("__internal_CarVisualizeFocusGuidesDebug"));

  if (v26)
  {
    v27 = objc_loadWeakRetained((id *)p_hostView);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide debugView](v5, "debugView"));
    objc_msgSend(v27, "addSubview:", v28);

    v29 = objc_loadWeakRetained((id *)p_hostView);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide activationConstraints](v5, "activationConstraints"));
    objc_msgSend(v29, "addConstraints:", v30);

  }
  return v5;
}

- (NSDictionary)focusContainerGuidesByEdge
{
  NSDictionary *focusContainerGuidesByEdge;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  _QWORD v11[4];
  _QWORD v12[4];

  focusContainerGuidesByEdge = self->_focusContainerGuidesByEdge;
  if (!focusContainerGuidesByEdge)
  {
    v11[0] = &off_10126E770;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuideController _addGuideForEdge:](self, "_addGuideForEdge:", 1));
    v12[0] = v4;
    v11[1] = &off_10126E788;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuideController _addGuideForEdge:](self, "_addGuideForEdge:", 2));
    v12[1] = v5;
    v11[2] = &off_10126E7A0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuideController _addGuideForEdge:](self, "_addGuideForEdge:", 8));
    v12[2] = v6;
    v11[3] = &off_10126E7B8;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuideController _addGuideForEdge:](self, "_addGuideForEdge:", 4));
    v12[3] = v7;
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
    v9 = self->_focusContainerGuidesByEdge;
    self->_focusContainerGuidesByEdge = v8;

    focusContainerGuidesByEdge = self->_focusContainerGuidesByEdge;
  }
  return focusContainerGuidesByEdge;
}

- (void)setActiveEdges:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;

  if (self->_activeEdges != a3)
  {
    self->_activeEdges = a3;
    v4 = a3 & 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuideController focusContainerGuidesByEdge](self, "focusContainerGuidesByEdge"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10126E770));
    objc_msgSend(v6, "setEnabled:", v4);

    v7 = (self->_activeEdges >> 1) & 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuideController focusContainerGuidesByEdge](self, "focusContainerGuidesByEdge"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", &off_10126E788));
    objc_msgSend(v9, "setEnabled:", v7);

    v10 = (self->_activeEdges >> 3) & 1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuideController focusContainerGuidesByEdge](self, "focusContainerGuidesByEdge"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", &off_10126E7A0));
    objc_msgSend(v12, "setEnabled:", v10);

    v13 = (self->_activeEdges >> 2) & 1;
    v15 = (id)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuideController focusContainerGuidesByEdge](self, "focusContainerGuidesByEdge"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", &off_10126E7B8));
    objc_msgSend(v14, "setEnabled:", v13);

  }
}

- (unint64_t)activeEdges
{
  return self->_activeEdges;
}

- (void)setFocusContainerGuidesByEdge:(id)a3
{
  objc_storeStrong((id *)&self->_focusContainerGuidesByEdge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusContainerGuidesByEdge, 0);
  objc_destroyWeak((id *)&self->_hostView);
}

@end
