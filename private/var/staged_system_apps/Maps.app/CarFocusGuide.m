@implementation CarFocusGuide

- (CarFocusGuide)initWithOriginView:(id)a3 toDestinationFocusEnvironments:(id)a4 forDirection:(unint64_t)a5
{
  id v8;
  id v9;
  CarFocusGuide *v10;
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
  _QWORD *v25;
  id v26;
  NSObject *v27;
  CarFocusGuide *v28;
  CarFocusGuide *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  CarFocusGuide *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  CarFocusGuideDebugView *v40;
  CarFocusGuideDebugView *debugView;
  double v42;
  void *v43;
  void *v44;
  NSArray *v45;
  NSArray *activationConstraints;
  id v48;
  NSObject *v49;
  CarFocusGuide *v50;
  objc_class *v51;
  NSString *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  id v57;
  void *v58;
  objc_super v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  uint8_t buf[4];
  __CFString *v66;

  v8 = a3;
  v9 = a4;
  if (!+[CarFocusGuide _validateDirection:](CarFocusGuide, "_validateDirection:", a5))
  {
    v26 = sub_10043348C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      goto LABEL_16;
    }
    v28 = self;
    v29 = v28;
    if (!v28)
    {
      v35 = CFSTR("<nil>");
      goto LABEL_14;
    }
    v30 = (objc_class *)objc_opt_class(v28);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if ((objc_opt_respondsToSelector(v29, "accessibilityIdentifier") & 1) != 0)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide performSelector:](v29, "performSelector:", "accessibilityIdentifier"));
      v34 = v33;
      if (v33 && !objc_msgSend(v33, "isEqualToString:", v32))
      {
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v32, v29, v34));

        goto LABEL_12;
      }

    }
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v32, v29));
LABEL_12:

LABEL_14:
    *(_DWORD *)buf = 138543362;
    v66 = v35;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Tried to create focusGuide with unsupported heading.", buf, 0xCu);

    goto LABEL_15;
  }
  v59.receiver = self;
  v59.super_class = (Class)CarFocusGuide;
  v10 = -[CarFocusGuide init](&v59, "init");
  self = v10;
  if (!v10)
  {
LABEL_23:
    self = self;
    v36 = self;
    goto LABEL_24;
  }
  v10->_direction = a5;
  v57 = v9;
  -[CarFocusGuide setPreferredFocusEnvironments:](v10, "setPreferredFocusEnvironments:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide widthAnchor](self, "widthAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "widthAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v64[0] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide heightAnchor](self, "heightAnchor"));
  v58 = v8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "heightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v64[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 2));
  objc_msgSend(v11, "addObjectsFromArray:", v18);

  switch(a5)
  {
    case 1uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide bottomAnchor](self, "bottomAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
      v62[0] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide leftAnchor](self, "leftAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "leftAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
      v62[1] = v24;
      v25 = v62;
      goto LABEL_20;
    case 2uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide topAnchor](self, "topAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "bottomAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
      v63[0] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide leftAnchor](self, "leftAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "leftAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
      v63[1] = v24;
      v25 = v63;
      goto LABEL_20;
    case 4uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide topAnchor](self, "topAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
      v61[0] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide rightAnchor](self, "rightAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "leftAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
      v61[1] = v24;
      v25 = v61;
      goto LABEL_20;
    case 8uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide topAnchor](self, "topAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
      v60[0] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide leftAnchor](self, "leftAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "rightAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
      v60[1] = v24;
      v25 = v60;
LABEL_20:
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
      objc_msgSend(v11, "addObjectsFromArray:", v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v39 = objc_msgSend(v38, "BOOLForKey:", CFSTR("__internal_CarVisualizeFocusGuidesDebug"));

      if (v39)
      {
        v40 = -[CarFocusGuideDebugView initWithDirection:]([CarFocusGuideDebugView alloc], "initWithDirection:", a5);
        debugView = self->_debugView;
        self->_debugView = v40;

        -[CarFocusGuideDebugView setTranslatesAutoresizingMaskIntoConstraints:](self->_debugView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        LODWORD(v42) = 1148846080;
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuideDebugView _maps_constraintsEqualToEdgesOfLayoutGuide:priority:](self->_debugView, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", self, v42));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "allConstraints"));
        objc_msgSend(v11, "addObjectsFromArray:", v44);

      }
      v45 = (NSArray *)objc_msgSend(v11, "copy");
      activationConstraints = self->_activationConstraints;
      self->_activationConstraints = v45;

      v9 = v57;
      v8 = v58;
      goto LABEL_23;
    default:
      v48 = sub_10043348C();
      v49 = objc_claimAutoreleasedReturnValue(v48);
      v9 = v57;
      v8 = v58;
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      v50 = self;
      v51 = (objc_class *)objc_opt_class(v50);
      v52 = NSStringFromClass(v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      if ((objc_opt_respondsToSelector(v50, "accessibilityIdentifier") & 1) == 0)
        goto LABEL_30;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide performSelector:](v50, "performSelector:", "accessibilityIdentifier"));
      v55 = v54;
      if (v54 && !objc_msgSend(v54, "isEqualToString:", v53))
      {
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v53, v50, v55));

      }
      else
      {

LABEL_30:
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v53, v50));
      }

      *(_DWORD *)buf = 138543362;
      v66 = v56;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "[%{public}@] CarMapsFocusGuide tried to add focus guide for unsupported direction.", buf, 0xCu);

LABEL_32:
      break;
  }
LABEL_16:
  v36 = 0;
LABEL_24:

  return v36;
}

+ (BOOL)_validateDirection:(unint64_t)a3
{
  return (a3 < 9) & (0x116u >> a3);
}

- (id)description
{
  NSMutableString *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  unint64_t direction;
  void *v13;
  id v14;
  _QWORD *v15;
  void (**v16)(_QWORD, _QWORD);
  __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _QWORD v36[3];
  char v37;
  _BYTE v38[128];

  v3 = objc_opt_new(NSMutableString);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide activationConstraints](self, "activationConstraints"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableString length](v3, "length"))
          -[NSMutableString appendString:](v3, "appendString:", CFSTR(", "));
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%p"), v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v5);
  }

  v9 = objc_opt_class(self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_originView);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide preferredFocusEnvironments](self, "preferredFocusEnvironments"));
  direction = self->_direction;
  if (direction)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v37 = 0;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10076C9E4;
    v33[3] = &unk_1011C5EC8;
    v14 = v13;
    v34 = v14;
    v35 = v36;
    v15 = objc_retainBlock(v33);
    v16 = (void (**)(_QWORD, _QWORD))v15;
    if ((direction & 1) != 0)
      ((void (*)(_QWORD *, const __CFString *))v15[2])(v15, CFSTR("Up"));
    if ((direction & 2) != 0)
      ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("Down"));
    if ((direction & 4) != 0)
      ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("Left"));
    if ((direction & 8) != 0)
      ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("Right"));
    if ((direction & 0x20) != 0)
      ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("Previous"));
    if ((direction & 0x10) != 0)
      ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("Next"));
    v17 = (__CFString *)v14;

    _Block_object_dispose(v36, 8);
  }
  else
  {
    v17 = CFSTR("None");
  }
  if (-[CarFocusGuide isEnabled](self, "isEnabled"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  -[CarFocusGuide layoutFrame](self, "layoutFrame");
  v20 = v19;
  -[CarFocusGuide layoutFrame](self, "layoutFrame");
  v22 = v21;
  -[CarFocusGuide layoutFrame](self, "layoutFrame");
  v24 = v23;
  -[CarFocusGuide layoutFrame](self, "layoutFrame");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%.1fh %.1fw)(%.1fx %.1fy)"), v20, v22, v24, v25));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; guidedView=%p: preferredFocusEnvironments=%p; focusHeading=%@ enabled=%@ layoutFrame=%@ constraints=[%@]>"),
                    v9,
                    self,
                    WeakRetained,
                    v11,
                    v17,
                    v18,
                    v26,
                    v3));

  return v27;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarFocusGuide;
  -[CarFocusGuide setEnabled:](&v6, "setEnabled:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide debugView](self, "debugView"));
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

}

- (UIView)debugView
{
  return (UIView *)self->_debugView;
}

- (NSArray)activationConstraints
{
  return self->_activationConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationConstraints, 0);
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_destroyWeak((id *)&self->_originView);
}

@end
