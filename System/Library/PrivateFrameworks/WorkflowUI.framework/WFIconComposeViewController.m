@implementation WFIconComposeViewController

- (WFIconComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  WFIconComposeViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  WFIconComposeViewController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFIconComposeViewController;
  v4 = -[WFIconComposeViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    WFLocalizedString(CFSTR("Icon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFIconComposeViewController setTitle:](v4, "setTitle:", v5);

    WFLocalizedString(CFSTR("Shortcut icon editor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFIconComposeViewController navigationItem](v4, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLabel:", v6);

    v8 = v4;
  }

  return v4;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  WFIconComposePreviewView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  WFGlyphPicker *v28;
  void *v29;
  void *v30;
  WFColorPicker *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
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
  WFGlyphPicker *v70;
  void *v71;
  WFIconComposePreviewView *v72;
  void *v73;
  void *v74;
  id firstValue;
  id v76;
  objc_super v77;
  const __CFString *v78;
  void *v79;
  _QWORD v80[4];

  v80[2] = *MEMORY[0x24BDAC8D0];
  v77.receiver = self;
  v77.super_class = (Class)WFIconComposeViewController;
  -[WFIconComposeViewController loadView](&v77, sel_loadView);
  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_settingsBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFIconComposeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFIconComposeViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  firstValue = v5;
  objc_msgSend(v6, "addSubview:", v5);

  v7 = objc_alloc_init(WFIconComposePreviewView);
  -[WFIconComposePreviewView setIsAccessibilityElement:](v7, "setIsAccessibilityElement:", 1);
  -[WFIconComposePreviewView setAccessibilityTraits:](v7, "setAccessibilityTraits:", *MEMORY[0x24BEBDF10]);
  WFLocalizedString(CFSTR("Icon Preview"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFIconComposePreviewView setAccessibilityLabel:](v7, "setAccessibilityLabel:", v8);

  -[WFIconComposePreviewView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFIconComposeViewController workflow](self, "workflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFIconComposePreviewView setIcon:](v7, "setIcon:", v10);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, 0, v7, 8, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFIconComposePreviewView addConstraint:](v7, "addConstraint:", v11);

  LODWORD(v12) = 1132068864;
  v72 = v7;
  -[WFIconComposePreviewView setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 1, v12);
  objc_msgSend(v5, "addSubview:", v7);
  -[WFIconComposeViewController setIconView:](self, "setIconView:", v7);
  v13 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v14);

  -[WFIconComposeViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v13);

  v76 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v76, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setBackgroundColor:", v16);

  objc_msgSend(v13, "addSubview:", v76);
  -[WFIconComposeViewController setTopSeperator:](self, "setTopSeperator:", v76);
  v17 = objc_alloc(MEMORY[0x24BEBD938]);
  WFLocalizedString(CFSTR("Color"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v18;
  WFLocalizedString(CFSTR("Glyph"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithItems:", v20);

  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_pickedSegment_, 4096);
  objc_msgSend(v21, "setSelectedSegmentIndex:", 0);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v74 = v21;
  objc_msgSend(v13, "addSubview:", v21);
  v22 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v23);

  objc_msgSend(v13, "addSubview:", v22);
  v24 = v22;
  v71 = v22;
  -[WFIconComposeViewController setBottomSeparator:](self, "setBottomSeparator:", v22);
  v25 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v26);

  -[WFIconComposeViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", v25);

  v28 = -[WFGlyphPicker initWithControl:glyphDimension:sectionInset:]([WFGlyphPicker alloc], "initWithControl:glyphDimension:sectionInset:", 0, 36.0, 15.0, 15.0, 15.0, 15.0);
  -[WFGlyphPicker setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFGlyphPicker setHidden:](v28, "setHidden:", 1);
  -[WFGlyphPicker setDelegate:](v28, "setDelegate:", self);
  -[WFIconComposeViewController workflow](self, "workflow");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "icon");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGlyphPicker setSelectedGlyphCharacter:](v28, "setSelectedGlyphCharacter:", objc_msgSend(v30, "glyphCharacter"));

  objc_msgSend(v25, "addSubview:", v28);
  v70 = v28;
  -[WFIconComposeViewController setGlyphPicker:](self, "setGlyphPicker:", v28);
  v31 = objc_alloc_init(WFColorPicker);
  -[WFColorPicker setTranslatesAutoresizingMaskIntoConstraints:](v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFColorPicker setHidden:](v31, "setHidden:", 0);
  -[WFColorPicker setDelegate:](v31, "setDelegate:", self);
  -[WFIconComposeViewController workflow](self, "workflow");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "icon");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "backgroundColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFColorPicker setSelectedColor:](v31, "setSelectedColor:", v34);

  objc_msgSend(v25, "addSubview:", v31);
  -[WFIconComposeViewController setColorPicker:](self, "setColorPicker:", v31);
  -[WFIconComposeViewController updateAccessibilityValue](self, "updateAccessibilityValue");
  -[WFIconComposeViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "safeAreaLayoutGuide");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  _NSDictionaryOfVariableBindings(CFSTR("previewView, controlView, topSeparator, segmentedControl, bottomSeparator, pickerView, glyphPicker, colorPicker, safeLayoutGuide"), firstValue, v13, v76, v21, v24, v25, v28, v31, v73, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = CFSTR("separator");
  v37 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "scale");
  objc_msgSend(v37, "numberWithDouble:", 1.0 / v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFIconComposeViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[previewView]|"), 0, 0, v36);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addConstraints:", v43);

  -[WFIconComposeViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[previewView(>=50)][controlView(44)][pickerView]|"), 6, v41, v36);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addConstraints:", v45);

  -[WFIconComposeViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", firstValue, 3, 0, v73, 3, 1.0, 0.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addConstraint:", v47);

  -[WFIconComposeViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, -205.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addConstraint:", v51);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[glyphPicker]|"), 0, v41, v36);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraints:", v52);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[glyphPicker]|"), 0, v41, v36);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraints:", v53);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[colorPicker(320)]"), 0, v41, v36);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraints:", v54);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[colorPicker]|"), 0, v41, v36);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraints:", v55);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 9, 0, v25, 9, 1.0, 0.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraint:", v56);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[topSeparator(separator)]"), 0, v41, v36);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraints:", v57);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[bottomSeparator(separator)]|"), 0, v41, v36);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraints:", v58);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[topSeparator]|"), 0, v41, v36);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraints:", v59);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[bottomSeparator]|"), 0, v41, v36);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraints:", v60);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[segmentedControl(300)]"), 0, v41, v36);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraints:", v61);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v74, 9, 0, v13, 9, 1.0, 0.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraint:", v62);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v74, 10, 0, v13, 10, 1.0, 0.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraint:", v63);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v72, 9, 0, firstValue, 9, 1.0, 0.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(firstValue, "addConstraint:", v64);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v72, 10, 0, firstValue, 10, 1.0, 0.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(firstValue, "addConstraint:", v65);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v72, 8, -1, firstValue, 8, 1.0, -20.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(firstValue, "addConstraint:", v66);

  v67 = (void *)MEMORY[0x24BDD1628];
  -[WFIconComposeViewController glyphPicker](self, "glyphPicker");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v68, 8, 0, 0, 0, 1.0, 205.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGlyphPicker addConstraint:](v70, "addConstraint:", v69);

}

- (void)setWorkflow:(id)a3
{
  objc_storeStrong((id *)&self->_workflow, a3);
  -[WFIconComposeViewController updateAccessibilityValue](self, "updateAccessibilityValue");
}

- (void)pickedSegment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFIconComposeViewController colorPicker](self, "colorPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  -[WFIconComposeViewController glyphPicker](self, "glyphPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__WFIconComposeViewController_pickedSegment___block_invoke;
  v9[3] = &unk_24E604320;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

- (void)saveIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFIconComposeViewController workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcon:", v4);

  -[WFIconComposeViewController iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIcon:", v4);

  -[WFIconComposeViewController updateAccessibilityValue](self, "updateAccessibilityValue");
  -[WFIconComposeViewController workflow](self, "workflow");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "save");

}

- (void)updateAccessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(MEMORY[0x24BEC1398], "workflowPalette");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFIconComposeViewController workflow](self, "workflow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "indexOfObject:", v6);

    objc_msgSend(MEMORY[0x24BEC1398], "workflowPaletteNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v7);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    -[WFIconComposeViewController workflow](self, "workflow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "glyphCharacter");
    WFNameForGlyphCharacter();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("%1$@ glyph, %2$@ background color"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v13, v11, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFIconComposeViewController iconView](self, "iconView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessibilityValue:", v14);

  }
}

- (void)glyphPicker:(id)a3 didSelectGlyphWithCharacter:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v6 = objc_alloc(MEMORY[0x24BEC1680]);
  -[WFIconComposeViewController workflow](self, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "backgroundColorValue");
  -[WFIconComposeViewController workflow](self, "workflow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "customImageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v6, "initWithBackgroundColorValue:glyphCharacter:customImageData:", v9, v4, v12);

  -[WFIconComposeViewController saveIcon:](self, "saveIcon:", v13);
}

- (void)colorPicker:(id)a3 didSelectColor:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = (objc_class *)MEMORY[0x24BEC1680];
  v6 = a4;
  v7 = [v5 alloc];
  v8 = objc_msgSend(v6, "RGBAValue");

  v9 = v8;
  -[WFIconComposeViewController workflow](self, "workflow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "glyphCharacter");
  -[WFIconComposeViewController workflow](self, "workflow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "icon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "customImageData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v7, "initWithBackgroundColorValue:glyphCharacter:customImageData:", v9, v12, v15);

  -[WFIconComposeViewController saveIcon:](self, "saveIcon:", v16);
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (WFIconComposePreviewView)iconView
{
  return (WFIconComposePreviewView *)objc_loadWeakRetained((id *)&self->_iconView);
}

- (void)setIconView:(id)a3
{
  objc_storeWeak((id *)&self->_iconView, a3);
}

- (WFColorPicker)colorPicker
{
  return (WFColorPicker *)objc_loadWeakRetained((id *)&self->_colorPicker);
}

- (void)setColorPicker:(id)a3
{
  objc_storeWeak((id *)&self->_colorPicker, a3);
}

- (WFGlyphPicker)glyphPicker
{
  return (WFGlyphPicker *)objc_loadWeakRetained((id *)&self->_glyphPicker);
}

- (void)setGlyphPicker:(id)a3
{
  objc_storeWeak((id *)&self->_glyphPicker, a3);
}

- (UIView)topSeperator
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_topSeperator);
}

- (void)setTopSeperator:(id)a3
{
  objc_storeWeak((id *)&self->_topSeperator, a3);
}

- (UIView)bottomSeparator
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_bottomSeparator);
}

- (void)setBottomSeparator:(id)a3
{
  objc_storeWeak((id *)&self->_bottomSeparator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bottomSeparator);
  objc_destroyWeak((id *)&self->_topSeperator);
  objc_destroyWeak((id *)&self->_glyphPicker);
  objc_destroyWeak((id *)&self->_colorPicker);
  objc_destroyWeak((id *)&self->_iconView);
  objc_storeStrong((id *)&self->_workflow, 0);
}

void __45__WFIconComposeViewController_pickedSegment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setHidden:", objc_msgSend(v4, "selectedSegmentIndex") != a3);

}

@end
