@implementation DBSArrangementLayoutView

- (DBSArrangementLayoutView)initWithDataSource:(id)a3
{
  id v4;
  DBSArrangementLayoutView *v5;
  DBSArrangementLayoutView *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBSArrangementLayoutView;
  v5 = -[DBSArrangementLayoutView init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v6->_margin = 20.0;
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellGroupedBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSArrangementLayoutView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[DBSArrangementLayoutView arrangeDisplayIcons](v6, "arrangeDisplayIcons");
  }

  return v6;
}

- (void)placeCurrentDisplayAtLocation:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  -[DBSArrangementLayoutView northDisplay](self, "northDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  -[DBSArrangementLayoutView eastDisplay](self, "eastDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  -[DBSArrangementLayoutView southDisplay](self, "southDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  -[DBSArrangementLayoutView westDisplay](self, "westDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 0uLL:
      -[DBSArrangementLayoutView northDisplay](self, "northDisplay");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[DBSArrangementLayoutView eastDisplay](self, "eastDisplay");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[DBSArrangementLayoutView southDisplay](self, "southDisplay");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[DBSArrangementLayoutView westDisplay](self, "westDisplay");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v11 = (void *)v10;
      break;
    default:
      v11 = 0;
      break;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16), "setIsCurrentDisplayLocation:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16) == (_QWORD)v11, (_QWORD)v17);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)arrangeDisplayIcons
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  DBSExternalDisplayIconView *v15;
  void *v16;
  void *v17;
  DBSExternalDisplayIconView *v18;
  void *v19;
  uint64_t v20;
  DBSNativeDisplayIconView *v21;
  DBSNativeDisplayIconView *v22;
  DBSNativeDisplayIconView *v23;
  DBSNativeDisplayIconView *v24;
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
  id firstValue;
  void *v80;
  void *v81;
  _QWORD v82[5];
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;

  -[DBSArrangementLayoutView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalDisplaySize");
  v5 = v4;
  v7 = v6;

  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__0;
  v87 = __Block_byref_object_dispose__0;
  v88 = 0;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectedScenes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = MEMORY[0x24BDAC760];
  v82[1] = 3221225472;
  v82[2] = __47__DBSArrangementLayoutView_arrangeDisplayIcons__block_invoke;
  v82[3] = &unk_24F026020;
  v82[4] = &v83;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v82);

  -[DBSArrangementLayoutView dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nativeDisplaySize");
  v12 = v11;
  v14 = v13;

  v15 = [DBSExternalDisplayIconView alloc];
  -[DBSArrangementLayoutView dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "externalDisplayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[DBSExternalDisplayIconView initWithFrame:displayName:](v15, "initWithFrame:displayName:", v17, 0.0, 0.0, v5, v7);

  -[DBSArrangementLayoutView dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "nativeDisplayName");
  v20 = objc_claimAutoreleasedReturnValue();

  v21 = -[DBSNativeDisplayIconView initWithFrame:displayName:]([DBSNativeDisplayIconView alloc], "initWithFrame:displayName:", v20, 0.0, 0.0, v12, v14);
  v22 = -[DBSNativeDisplayIconView initWithFrame:displayName:]([DBSNativeDisplayIconView alloc], "initWithFrame:displayName:", v20, 0.0, 0.0, v12, v14);
  v81 = (void *)v20;
  v23 = -[DBSNativeDisplayIconView initWithFrame:displayName:]([DBSNativeDisplayIconView alloc], "initWithFrame:displayName:", v20, 0.0, 0.0, v12, v14);
  v24 = -[DBSNativeDisplayIconView initWithFrame:displayName:]([DBSNativeDisplayIconView alloc], "initWithFrame:displayName:", v20, 0.0, 0.0, v12, v14);
  -[DBSExternalDisplayIconView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[DBSArrangementLayoutView addSubview:](self, "addSubview:", v18);
  -[DBSArrangementLayoutView addSubview:](self, "addSubview:", v21);
  -[DBSArrangementLayoutView addSubview:](self, "addSubview:", v22);
  -[DBSArrangementLayoutView addSubview:](self, "addSubview:", v23);
  -[DBSArrangementLayoutView addSubview:](self, "addSubview:", v24);
  v25 = (void *)MEMORY[0x24BDD16E0];
  -[DBSArrangementLayoutView margin](self, "margin");
  objc_msgSend(v25, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSExternalDisplayIconView heightAnchor](v18, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSExternalDisplayIconView widthAnchor](v18, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:multiplier:", v28, v7 / v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  -[DBSNativeDisplayIconView heightAnchor](v22, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSNativeDisplayIconView heightAnchor](v21, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[DBSNativeDisplayIconView heightAnchor](v23, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSNativeDisplayIconView heightAnchor](v21, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[DBSNativeDisplayIconView heightAnchor](v24, "heightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSNativeDisplayIconView heightAnchor](v21, "heightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  -[DBSNativeDisplayIconView widthAnchor](v22, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSNativeDisplayIconView widthAnchor](v21, "widthAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  -[DBSNativeDisplayIconView widthAnchor](v23, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSNativeDisplayIconView widthAnchor](v21, "widthAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[DBSNativeDisplayIconView widthAnchor](v24, "widthAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSNativeDisplayIconView widthAnchor](v21, "widthAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", 1);

  -[DBSExternalDisplayIconView centerYAnchor](v18, "centerYAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementLayoutView centerYAnchor](self, "centerYAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setActive:", 1);

  -[DBSExternalDisplayIconView centerYAnchor](v18, "centerYAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSNativeDisplayIconView centerYAnchor](v21, "centerYAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setActive:", 1);

  -[DBSExternalDisplayIconView centerYAnchor](v18, "centerYAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSNativeDisplayIconView centerYAnchor](v22, "centerYAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setActive:", 1);

  -[DBSExternalDisplayIconView centerXAnchor](v18, "centerXAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementLayoutView centerXAnchor](self, "centerXAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setActive:", 1);

  -[DBSExternalDisplayIconView centerXAnchor](v18, "centerXAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSNativeDisplayIconView centerXAnchor](v23, "centerXAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setActive:", 1);

  -[DBSExternalDisplayIconView centerXAnchor](v18, "centerXAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSNativeDisplayIconView centerXAnchor](v24, "centerXAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setActive:", 1);

  v66 = (void *)MEMORY[0x24BDD1628];
  firstValue = v26;
  _NSDictionaryOfVariableBindings(CFSTR("margin"), v26, 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("nativeIconWest, externalIcon, nativeIconEast"), v21, v18, v22, 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-margin@900-[nativeIconWest][externalIcon][nativeIconEast]-margin@900-|"), 0, v67, v68);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v80);
  -[DBSNativeDisplayIconView leadingAnchor](v21, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementLayoutView leadingAnchor](self, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementLayoutView margin](self, "margin");
  objc_msgSend(v69, "constraintGreaterThanOrEqualToAnchor:constant:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setActive:", 1);

  v72 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("margin"), firstValue, 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("nativeIconNorth, externalIcon, nativeIconSouth"), v23, v18, v24, 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-margin@900-[nativeIconNorth][externalIcon][nativeIconSouth]-margin@900-|"), 0, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v75);
  -[DBSNativeDisplayIconView topAnchor](v23, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementLayoutView topAnchor](self, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementLayoutView margin](self, "margin");
  objc_msgSend(v76, "constraintGreaterThanOrEqualToAnchor:constant:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setActive:", 1);

  -[DBSArrangementLayoutView setExternalDisplay:](self, "setExternalDisplay:", v18);
  -[DBSArrangementLayoutView setNorthDisplay:](self, "setNorthDisplay:", v23);
  -[DBSArrangementLayoutView setEastDisplay:](self, "setEastDisplay:", v22);
  -[DBSArrangementLayoutView setWestDisplay:](self, "setWestDisplay:", v21);
  -[DBSArrangementLayoutView setSouthDisplay:](self, "setSouthDisplay:", v24);
  -[DBSArrangementLayoutView updateForOrientation:](self, "updateForOrientation:", objc_msgSend((id)v84[5], "interfaceOrientation"));

  _Block_object_dispose(&v83, 8);
}

void __47__DBSArrangementLayoutView_arrangeDisplayIcons__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v8, "activationState"))
  {
    objc_msgSend(v8, "_sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("sceneID:com.apple.Preferences-default"));

    if (v7)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *a3 = 1;
    }
  }

}

- (void)updateForOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
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

  -[DBSArrangementLayoutView dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "externalDisplaySize");
  v7 = v6;
  v9 = v8;

  -[DBSArrangementLayoutView dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nativeDisplaySize");
  v12 = v11;
  v14 = v13;

  -[DBSArrangementLayoutView setExternalDisplaySize:](self, "setExternalDisplaySize:", v7, v9);
  -[DBSArrangementLayoutView setNativeDisplaySize:](self, "setNativeDisplaySize:", v12, v14);
  -[DBSArrangementLayoutView widthRatioConstraint](self, "widthRatioConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 0);

  v16 = (void *)MEMORY[0x24BDD1628];
  -[DBSArrangementLayoutView externalDisplay](self, "externalDisplay");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementLayoutView westDisplay](self, "westDisplay");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 7, 0, v18, 7, v7 / v12, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementLayoutView setWidthRatioConstraint:](self, "setWidthRatioConstraint:", v19);

  -[DBSArrangementLayoutView widthRatioConstraint](self, "widthRatioConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[DBSArrangementLayoutView nativeIconAspectRatioConstraint](self, "nativeIconAspectRatioConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 0);

  -[DBSArrangementLayoutView westDisplay](self, "westDisplay");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementLayoutView westDisplay](self, "westDisplay");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "widthAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:multiplier:", v25, v14 / v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementLayoutView setNativeIconAspectRatioConstraint:](self, "setNativeIconAspectRatioConstraint:", v26);

  -[DBSArrangementLayoutView nativeIconAspectRatioConstraint](self, "nativeIconAspectRatioConstraint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[DBSArrangementLayoutView updateNativeDisplayImagesWithOrientation:](self, "updateNativeDisplayImagesWithOrientation:", a3);
}

- (id)_placeHolderMainDisplayImageWithWidth:(double)a3 orientation:(int64_t)a4
{
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((unint64_t)(a4 - 3) > 1)
    v5 = CFSTR("ipad");
  else
    v5 = CFSTR("ipad.landscape");
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:compatibleWithTraitCollection:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithSymbolConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateNativeDisplayImagesWithOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[5];
  void (**v29)(_QWORD, _QWORD);
  double v30;
  double v31;
  double v32;
  _QWORD v33[5];

  -[DBSArrangementLayoutView nativeDisplaySize](self, "nativeDisplaySize");
  v6 = v5;
  v8 = v7;
  -[DBSArrangementLayoutView externalDisplaySize](self, "externalDisplaySize");
  v10 = v9;
  v12 = v11;
  -[DBSArrangementLayoutView frame](self, "frame");
  if (v13 == 0.0)
    v15 = 364.0;
  else
    v15 = v14;
  if (v13 == 0.0)
    v16 = 560.0;
  else
    v16 = v13;
  -[DBSArrangementLayoutView margin](self, "margin");
  v18 = fmax(v16 + v17 * -2.0, 0.0) / (v10 + v6 * 2.0);
  -[DBSArrangementLayoutView margin](self, "margin");
  v20 = fmax(v15 + v19 * -2.0, 0.0) / (v12 + v8 * 2.0);
  v21 = MEMORY[0x24BDAC760];
  if (v18 >= v20)
    v18 = v20;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke;
  v33[3] = &unk_24F0261C8;
  v33[4] = self;
  v22 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2A2908](v33);
  if (v18 > 0.0)
  {
    -[DBSArrangementLayoutView northDisplay](self, "northDisplay");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "image");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      -[DBSArrangementLayoutView _placeHolderMainDisplayImageWithWidth:orientation:](self, "_placeHolderMainDisplayImageWithWidth:orientation:", a3, v6 * v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v22)[2](v22, v26);

    }
    dispatch_get_global_queue(0, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28[0] = v21;
    v28[1] = 3221225472;
    v28[2] = __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke_2;
    v28[3] = &unk_24F026218;
    v28[4] = self;
    v30 = v18;
    v31 = v6;
    v32 = v8;
    v29 = v22;
    dispatch_async(v27, v28);

  }
}

void __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "northDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v4);

  objc_msgSend(*(id *)(a1 + 32), "eastDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v4);

  objc_msgSend(*(id *)(a1 + 32), "southDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v4);

  objc_msgSend(*(id *)(a1 + 32), "westDisplay");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v4);

}

void __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeDisplayImageWithWidth:", *(double *)(a1 + 48) * *(double *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke_3;
  block[3] = &unk_24F0261F0;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = v4;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "northDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 40), "eastDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 40), "southDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 40), "westDisplay");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (double)_pointDistanceFirst:(CGPoint)a3 second:(CGPoint)a4
{
  return sqrt((a3.y - a4.y) * (a3.y - a4.y) + (a3.x - a4.x) * (a3.x - a4.x));
}

- (unint64_t)displayLocationForPointInView:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double MidX;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t i;
  float v41;
  double v42;
  double v44;
  double MidY;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _QWORD v51[5];
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  y = a3.y;
  x = a3.x;
  v51[4] = *MEMORY[0x24BDAC8D0];
  -[DBSArrangementLayoutView northDisplay](self, "northDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  MidX = CGRectGetMidX(v52);
  -[DBSArrangementLayoutView northDisplay](self, "northDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  MidY = CGRectGetMidY(v53);

  -[DBSArrangementLayoutView eastDisplay](self, "eastDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v44 = CGRectGetMidX(v54);
  -[DBSArrangementLayoutView eastDisplay](self, "eastDisplay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v11 = CGRectGetMidY(v55);

  -[DBSArrangementLayoutView southDisplay](self, "southDisplay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v13 = CGRectGetMidX(v56);
  -[DBSArrangementLayoutView southDisplay](self, "southDisplay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v15 = CGRectGetMidY(v57);

  -[DBSArrangementLayoutView westDisplay](self, "westDisplay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v17 = CGRectGetMidX(v58);
  -[DBSArrangementLayoutView westDisplay](self, "westDisplay");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v19 = CGRectGetMidY(v59);

  -[DBSArrangementLayoutView _pointDistanceFirst:second:](self, "_pointDistanceFirst:second:", x, y, MidX, MidY);
  v21 = v20;
  -[DBSArrangementLayoutView _pointDistanceFirst:second:](self, "_pointDistanceFirst:second:", x, y, v44, v11);
  v23 = v22;
  -[DBSArrangementLayoutView _pointDistanceFirst:second:](self, "_pointDistanceFirst:second:", x, y, v13, v15);
  v25 = v24;
  -[DBSArrangementLayoutView _pointDistanceFirst:second:](self, "_pointDistanceFirst:second:", x, y, v17, v19);
  v27 = v26;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v28;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v29;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v30;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v33 = v32;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v34)
  {
    v35 = v34;
    v36 = 0;
    v37 = 0;
    v38 = *(_QWORD *)v47;
    v39 = 1.79769313e308;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v47 != v38)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "floatValue");
        v42 = v41;
        if (v39 > v42)
        {
          v36 = v37 + i;
          v39 = v42;
        }
      }
      v37 += v35;
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v35);
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (DBSArrangementLayoutViewController)dataSource
{
  return (DBSArrangementLayoutViewController *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (CGSize)externalDisplaySize
{
  double width;
  double height;
  CGSize result;

  width = self->_externalDisplaySize.width;
  height = self->_externalDisplaySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setExternalDisplaySize:(CGSize)a3
{
  self->_externalDisplaySize = a3;
}

- (CGSize)nativeDisplaySize
{
  double width;
  double height;
  CGSize result;

  width = self->_nativeDisplaySize.width;
  height = self->_nativeDisplaySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNativeDisplaySize:(CGSize)a3
{
  self->_nativeDisplaySize = a3;
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
}

- (DBSExternalDisplayIconView)externalDisplay
{
  return self->_externalDisplay;
}

- (void)setExternalDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_externalDisplay, a3);
}

- (DBSNativeDisplayIconView)northDisplay
{
  return self->_northDisplay;
}

- (void)setNorthDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_northDisplay, a3);
}

- (DBSNativeDisplayIconView)eastDisplay
{
  return self->_eastDisplay;
}

- (void)setEastDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_eastDisplay, a3);
}

- (DBSNativeDisplayIconView)southDisplay
{
  return self->_southDisplay;
}

- (void)setSouthDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_southDisplay, a3);
}

- (DBSNativeDisplayIconView)westDisplay
{
  return self->_westDisplay;
}

- (void)setWestDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_westDisplay, a3);
}

- (NSLayoutConstraint)nativeIconAspectRatioConstraint
{
  return self->_nativeIconAspectRatioConstraint;
}

- (void)setNativeIconAspectRatioConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_nativeIconAspectRatioConstraint, a3);
}

- (NSLayoutConstraint)widthRatioConstraint
{
  return self->_widthRatioConstraint;
}

- (void)setWidthRatioConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthRatioConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthRatioConstraint, 0);
  objc_storeStrong((id *)&self->_nativeIconAspectRatioConstraint, 0);
  objc_storeStrong((id *)&self->_westDisplay, 0);
  objc_storeStrong((id *)&self->_southDisplay, 0);
  objc_storeStrong((id *)&self->_eastDisplay, 0);
  objc_storeStrong((id *)&self->_northDisplay, 0);
  objc_storeStrong((id *)&self->_externalDisplay, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
