@implementation TVRMessageView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIView bounds](self->_currentView, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  UIView *currentView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVRMessageView;
  -[TVRMessageView layoutSubviews](&v4, sel_layoutSubviews);
  currentView = self->_currentView;
  -[TVRMessageView bounds](self, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](currentView, "setCenter:");
}

- (void)showMessageWithError:(id)a3 device:(id)a4
{
  id v6;
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
  int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;

  v41 = a3;
  v6 = a4;
  if (objc_msgSend(v41, "code") == 102)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[TVRMessageView _deviceTypeString](self, "_deviceTypeString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("TVRemoteUIPairingDeviceLockedMessage%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v9, &stru_24DE30718, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIPairingDeviceLockedTitle"), &stru_24DE30718, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRMessageView showMessageWithTitle:message:](self, "showMessageWithTitle:message:", v16, v14);

  }
  else if (objc_msgSend(v41, "code") == 104)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIConnectionErrorTitle"), &stru_24DE30718, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIConnectionBlockedMessage"), &stru_24DE30718, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRMessageView showMessageWithTitle:message:](self, "showMessageWithTitle:message:", v14, v18);

  }
  else if (objc_msgSend(v41, "code") == 103)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIConnectionErrorTitleTV"), &stru_24DE30718, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRMessageView showMessageWithTitle:message:](self, "showMessageWithTitle:message:", v14, &stru_24DE30718);
  }
  else
  {
    v19 = MGGetBoolAnswer();
    v20 = CFSTR("WIFI");
    if (v19)
      v20 = CFSTR("WLAN");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TVRemoteUIConnectionErrorMessage%@"), v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", v9, &stru_24DE30718, CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v23, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "model");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "containsString:", CFSTR("AppleTV"));

    objc_msgSend(v6, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v26)
        v30 = CFSTR("TVRemoteUIAppleTVDeviceName");
      else
        v30 = CFSTR("TVRemoteUITVDeviceName");
      objc_msgSend(v28, "localizedStringForKey:value:table:", v30, &stru_24DE30718, CFSTR("Localizable"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@NoName"), v9);
      v32 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", v32, &stru_24DE30718, CFSTR("Localizable"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", v35, v31);
      v36 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v36;
      v9 = (void *)v32;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIConnectionErrorTitle"), &stru_24DE30718, CFSTR("Localizable"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v26 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIConnectionErrorTitleTV"), &stru_24DE30718, CFSTR("Localizable"));
      v40 = objc_claimAutoreleasedReturnValue();

      v38 = (void *)v40;
    }
    -[TVRMessageView showMessageWithTitle:message:](self, "showMessageWithTitle:message:", v38, v14);

  }
}

- (void)showMessageWithTitle:(id)a3 message:(id)a4 titleFont:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
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
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  _QWORD v68[5];

  v68[3] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x24BEBDB00];
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(v9);
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsGroupOpacity:", 0);
  v65 = v13;
  objc_msgSend(v13, "setAllowsGroupBlending:", 0);
  v14 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v14, "setFont:", v10);

  objc_msgSend(v14, "setNumberOfLines:", 0);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v15) = 1148846080;
  objc_msgSend(v14, "setContentCompressionResistancePriority:forAxis:", 0, v15);
  objc_msgSend(v14, "setTextAlignment:", 1);
  objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v14, "setText:", v11);

  -[TVRMessageView styleProvider](self, "styleProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "colorForMessageLabels");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v17);

  objc_msgSend(v12, "addSubview:", v14);
  objc_msgSend(v14, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BDD1628];
  v63 = (void *)v23;
  v64 = (void *)v20;
  v68[0] = v20;
  v68[1] = v23;
  v62 = (void *)v26;
  v68[2] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v28);

  if (v8)
  {
    -[TVRMessageView styleProvider](self, "styleProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fontForMessageViewDescription");
    v59 = objc_claimAutoreleasedReturnValue();

    v30 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v30, "setFont:", v59);
    objc_msgSend(v30, "setNumberOfLines:", 0);
    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v31) = 1148846080;
    objc_msgSend(v30, "setContentCompressionResistancePriority:forAxis:", 0, v31);
    objc_msgSend(v30, "setTextAlignment:", 1);
    objc_msgSend(v30, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v30, "setText:", v8);
    -[TVRMessageView styleProvider](self, "styleProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "colorForMessageLabels");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTextColor:", v33);

    objc_msgSend(v12, "addSubview:", v30);
    if (-[TVRMessageView _largeAccessibilityFontSizesEnabled](self, "_largeAccessibilityFontSizesEnabled"))
      v34 = 40.0;
    else
      v34 = 20.0;
    objc_msgSend(v30, "firstBaselineAnchor", v59);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastBaselineAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v61 = v8;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = (void *)MEMORY[0x24BDD1628];
    v67[0] = v37;
    v67[1] = v40;
    v67[2] = v43;
    v67[3] = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "activateConstraints:", v48);

    v8 = v61;
    v49 = v60;
  }
  else
  {
    v50 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v14, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v66, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "activateConstraints:", v43);
    v30 = 0;
  }

  -[TVRMessageView bounds](self, "bounds");
  v52 = v51;
  v54 = v53;
  objc_msgSend(v14, "sizeThatFits:", v51, v53);
  v56 = v55;
  if (v8)
    objc_msgSend(v30, "sizeThatFits:", v52, v54);
  else
    v57 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v56 + v57 + 20.0 >= v54)
    v58 = v54;
  else
    v58 = v56 + v57 + 20.0;
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v52, v58);
  -[TVRMessageView setCurrentView:](self, "setCurrentView:", v12);
  -[TVRMessageView setMessageType:](self, "setMessageType:", 1);

}

- (void)showMessageWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TVRMessageView styleProvider](self, "styleProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontForMessageViewTitle");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[TVRMessageView showMessageWithTitle:message:titleFont:](self, "showMessageWithTitle:message:titleFont:", v7, v6, v9);
}

- (void)showPairingMessageWithCode:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
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
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
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
  void *v104;
  TVRMessageView *v105;
  void *v106;
  void *v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[4];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[TVRMessageView styleProvider](self, "styleProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontForMessageViewDescription");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TVRemoteUILegacyPairingTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  objc_msgSend(v8, "setTextAlignment:", 1);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TVRMessageView styleProvider](self, "styleProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fontForMessageViewTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v12);

  -[TVRMessageView styleProvider](self, "styleProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorForMessageLabels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v14);

  LODWORD(v15) = 1148846080;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v15);
  v108 = v8;
  LODWORD(v16) = 1148846080;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 1, v16);
  v17 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v17, "setNumberOfLines:", 0);
  objc_msgSend(v17, "setTextAlignment:", 1);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v106 = (void *)v7;
  objc_msgSend(v17, "setFont:", v7);
  -[TVRMessageView styleProvider](self, "styleProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "colorForMessageLabels");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v19);

  v105 = self;
  -[TVRMessageView _localizedLegacyPairingMessageForDeviceModel](self, "_localizedLegacyPairingMessageForDeviceModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v20);

  LODWORD(v21) = 1148846080;
  objc_msgSend(v17, "setContentCompressionResistancePriority:forAxis:", 0, v21);
  v107 = v17;
  LODWORD(v22) = 1148846080;
  objc_msgSend(v17, "setContentCompressionResistancePriority:forAxis:", 1, v22);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "length"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v24 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), objc_msgSend(v4, "characterAtIndex:", v24));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v25);

      ++v24;
    }
    while (v24 < objc_msgSend(v4, "length"));
  }
  objc_msgSend(v23, "componentsJoinedByString:", CFSTR(" "));
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x24BEBD708]);
  v104 = (void *)v26;
  objc_msgSend(v27, "setText:", v26);
  objc_msgSend(v27, "setNumberOfLines:", 1);
  objc_msgSend(v27, "setTextAlignment:", 1);
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v27, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:design:", *MEMORY[0x24BDC4E08], 28.0, *MEMORY[0x24BEBB608]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFont:", v28);

  -[TVRMessageView styleProvider](v105, "styleProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "colorForMessageLabels");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v30);

  LODWORD(v31) = 1148846080;
  objc_msgSend(v27, "setContentCompressionResistancePriority:forAxis:", 0, v31);
  LODWORD(v32) = 1148846080;
  objc_msgSend(v27, "setContentCompressionResistancePriority:forAxis:", 1, v32);
  v33 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v33, "setNumberOfLines:", 0);
  objc_msgSend(v33, "setTextAlignment:", 1);
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v33, "setFont:", v106);
  -[TVRMessageView styleProvider](v105, "styleProvider");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "colorForSpinner");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTintColor:", v35);

  -[TVRMessageView styleProvider](v105, "styleProvider");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "colorForSpinner");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTextColor:", v37);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("TVRemoteUILegacyPairingBottomMessage"), &stru_24DE30718, CFSTR("Localizable"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMessageView _convertToAttributedStringWithReplacement:imagePointSize:](v105, "_convertToAttributedStringWithReplacement:imagePointSize:", v39, 13.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAttributedText:", v40);

  LODWORD(v41) = 1148846080;
  objc_msgSend(v33, "setContentCompressionResistancePriority:forAxis:", 0, v41);
  LODWORD(v42) = 1148846080;
  objc_msgSend(v33, "setContentCompressionResistancePriority:forAxis:", 1, v42);
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v117[0] = v108;
  v117[1] = v107;
  v117[2] = v27;
  v117[3] = v33;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v110 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(v5, "addSubview:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i));
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
    }
    while (v45);
  }

  objc_msgSend(v108, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v49);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v108, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v108, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v53);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = (void *)MEMORY[0x24BDD1628];
  v116[0] = v103;
  v116[1] = v102;
  v116[2] = v101;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "activateConstraints:", v55);

  objc_msgSend(v107, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "lastBaselineAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, 16.0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v107, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v59);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v107, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v61);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = (void *)MEMORY[0x24BDD1628];
  v115[0] = v100;
  v115[1] = v99;
  v115[2] = v98;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v115, 3);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "activateConstraints:", v63);

  objc_msgSend(v27, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "lastBaselineAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 16.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v67);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v69);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = (void *)MEMORY[0x24BDD1628];
  v114[0] = v97;
  v114[1] = v96;
  v114[2] = v95;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v114, 3);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "activateConstraints:", v71);

  objc_msgSend(v33, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, 16.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = (void *)MEMORY[0x24BDD1628];
  v113[0] = v76;
  v113[1] = v79;
  v113[2] = v94;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v113, 3);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "activateConstraints:", v81);

  -[TVRMessageView bounds](v105, "bounds");
  v83 = v82;
  v85 = v84;
  objc_msgSend(v108, "sizeThatFits:", v82, v84);
  v87 = v86;
  objc_msgSend(v107, "sizeThatFits:", v83, v85);
  v89 = v88;
  objc_msgSend(v27, "sizeThatFits:", v83, v85);
  v91 = v90;
  objc_msgSend(v33, "sizeThatFits:", v83, v85);
  if (v87 + v89 + v91 + v92 + 20.0 >= v85)
    v93 = v85;
  else
    v93 = v87 + v89 + v91 + v92 + 20.0;
  objc_msgSend(v5, "setBounds:", 0.0, 0.0, v83, v93);
  -[TVRMessageView setCurrentView:](v105, "setCurrentView:", v5);
  -[TVRMessageView setMessageType:](v105, "setMessageType:", 2);

}

- (void)showNoAssociatedNetworkMessage
{
  int v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = MGGetBoolAnswer();
  v4 = CFSTR("WIFI");
  if (v3)
    v4 = CFSTR("WLAN");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TVRemoteUINoAssociatedNetworkString%@"), v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24DE30718, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMessageView showMessageWithTitle:message:](self, "showMessageWithTitle:message:", v6, 0);

  -[TVRMessageView setMessageType:](self, "setMessageType:", 4);
}

- (void)showNoWIFIConnectionMessage
{
  int v3;
  const __CFString *v4;
  id v5;
  void *v6;
  id v7;
  double v8;
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
  UIButton *turnOnWiFiButton;
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
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[10];

  v56[8] = *MEMORY[0x24BDAC8D0];
  if (!-[TVRMessageView isWifiConnectInProgress](self, "isWifiConnectInProgress"))
  {
    v3 = MGGetBoolAnswer();
    v4 = CFSTR("WIFI");
    if (v3)
      v4 = CFSTR("WLAN");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TVRemoteUINoWIFIConnectionString%@"), v4);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v5, "layer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAllowsGroupOpacity:", 0);
    objc_msgSend(v54, "setAllowsGroupBlending:", 0);
    -[TVRMessageView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    -[TVRMessageView styleProvider](self, "styleProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontForMessageViewTitle");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v7, "setFont:", v53);
    objc_msgSend(v7, "setNumberOfLines:", 0);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v8) = 1148846080;
    objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    objc_msgSend(v7, "setTextAlignment:", 1);
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v52, &stru_24DE30718, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v10);

    -[TVRMessageView styleProvider](self, "styleProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorForMessageLabels");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v12);

    objc_msgSend(v5, "addSubview:", v7);
    objc_msgSend(v7, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 44.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRMessageView setTurnOnWiFiButton:](self, "setTurnOnWiFiButton:", v20);

    turnOnWiFiButton = self->_turnOnWiFiButton;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("TVRemoteUITurnOnButtonTitleString"), &stru_24DE30718, CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](turnOnWiFiButton, "setTitle:forState:", v23, 0);

    -[UIButton layer](self->_turnOnWiFiButton, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", 8.0);

    -[TVRMessageView styleProvider](self, "styleProvider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "buttonTextColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](self->_turnOnWiFiButton, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTextColor:", v26);

    -[TVRMessageView styleProvider](self, "styleProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "fontForWiFiButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](self->_turnOnWiFiButton, "titleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFont:", v29);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_turnOnWiFiButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDisplayP3Red:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](self->_turnOnWiFiButton, "setBackgroundColor:", v31);

    -[UIButton addTarget:action:forControlEvents:](self->_turnOnWiFiButton, "addTarget:action:forControlEvents:", self, sel__turnOnWireless_, 64);
    v48 = v5;
    objc_msgSend(v5, "addSubview:", self->_turnOnWiFiButton);
    -[UIButton topAnchor](self->_turnOnWiFiButton, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 16.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton centerXAnchor](self->_turnOnWiFiButton, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton heightAnchor](self->_turnOnWiFiButton, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToConstant:", 44.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton widthAnchor](self->_turnOnWiFiButton, "widthAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToConstant:", 281.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)MEMORY[0x24BDD1628];
    v56[0] = v55;
    v56[1] = v51;
    v56[2] = v50;
    v56[3] = v49;
    v56[4] = v47;
    v56[5] = v36;
    v56[6] = v38;
    v56[7] = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v42);

    -[TVRMessageView bounds](self, "bounds");
    v44 = v43;
    objc_msgSend(v7, "sizeThatFits:", v43, v45);
    objc_msgSend(v48, "setBounds:", 0.0, 0.0, v44, v46 + 44.0 + 20.0);
    -[TVRMessageView setCurrentView:](self, "setCurrentView:", v48);
    -[TVRMessageView setMessageType:](self, "setMessageType:", 3);

  }
}

- (void)showLoadingSpinner
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIConnectingString"), &stru_24DE30718, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMessageView frame](self, "frame");
  -[TVRMessageView _loadingViewWithTitle:forSize:](self, "_loadingViewWithTitle:forSize:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMessageView setCurrentView:](self, "setCurrentView:", v7);

  -[TVRMessageView setMessageType:](self, "setMessageType:", 5);
}

- (void)showSearchingSpinner
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TVRemoteUISearchingString"), &stru_24DE30718, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMessageView frame](self, "frame");
  -[TVRMessageView _loadingViewWithTitle:forSize:](self, "_loadingViewWithTitle:forSize:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMessageView setCurrentView:](self, "setCurrentView:", v7);

  -[TVRMessageView setMessageType:](self, "setMessageType:", 6);
}

- (void)clearContent
{
  -[TVRMessageView setCurrentView:](self, "setCurrentView:", 0);
  -[TVRMessageView setTurnOnWiFiButton:](self, "setTurnOnWiFiButton:", 0);
  -[TVRMessageView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[TVRMessageView setMessageType:](self, "setMessageType:", 0);
}

- (id)_localizedLegacyPairingMessageForDeviceModel
{
  void *v2;
  int v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v2 = (void *)MGCopyAnswer();
  v3 = objc_msgSend(v2, "intValue");
  v4 = CFSTR("TVRemoteUILegacyPairingTopMessage_IPHONE");
  if (v3 == 2)
    v4 = CFSTR("TVRemoteUILegacyPairingTopMessage_IPOD");
  if (v3 == 3)
    v5 = CFSTR("TVRemoteUILegacyPairingTopMessage_IPAD");
  else
    v5 = v4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_24DE30718, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setCurrentView:(id)a3
{
  id v5;

  v5 = a3;
  -[UIView removeFromSuperview](self->_currentView, "removeFromSuperview");
  if (v5)
  {
    objc_storeStrong((id *)&self->_currentView, a3);
    -[TVRMessageView addSubview:](self, "addSubview:", self->_currentView);
  }
  -[TVRMessageView setNeedsLayout](self, "setNeedsLayout");

}

- (id)_loadingViewWithTitle:(id)a3 forSize:(CGSize)a4
{
  double width;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[6];

  width = a4.width;
  v44[5] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BEBDB00];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v9 = objc_alloc_init(MEMORY[0x24BEBD398]);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setActivityIndicatorViewStyle:", 101);
  -[TVRMessageView styleProvider](self, "styleProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorForSpinner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v11);

  objc_msgSend(v9, "startAnimating");
  -[TVRMessageView styleProvider](self, "styleProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fontForSpinnerTitle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v13, "setFont:", v43);
  objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v13, "setNumberOfLines:", 1);
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v14) = 1148846080;
  objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 0, v14);
  objc_msgSend(v13, "setTextAlignment:", 1);
  objc_msgSend(v13, "setText:", v7);

  -[TVRMessageView styleProvider](self, "styleProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textColorForSpinnerTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v16);

  objc_msgSend(v8, "addSubview:", v9);
  objc_msgSend(v8, "addSubview:", v13);
  objc_msgSend(v8, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAllowsGroupOpacity:", 0);
  objc_msgSend(v42, "setAllowsGroupBlending:", 0);
  objc_msgSend(v9, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x24BDD1628];
  v44[0] = v41;
  v44[1] = v21;
  v44[2] = v24;
  v44[3] = v27;
  v44[4] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v32);

  objc_msgSend(v9, "intrinsicContentSize");
  v34 = v33;
  v36 = v35;
  objc_msgSend(v13, "intrinsicContentSize");
  if (v34 >= v37)
    v37 = v34;
  if (v37 >= width)
    v39 = width;
  else
    v39 = v37;
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v39, v36 + v38 + 10.0);

  return v8;
}

- (BOOL)_largeAccessibilityFontSizesEnabled
{
  void *v2;
  NSString *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BEBD4E0], "system");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  v4 = UIContentSizeCategoryIsAccessibilityCategory(v3)
    && (-[NSString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEBE060])
     || -[NSString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEBE058]));

  return v4;
}

- (id)_deviceTypeString
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return CFSTR("Pad");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsString:", CFSTR("iPod"));

  if (v7)
    return CFSTR("Pod");
  else
    return CFSTR("Phone");
}

- (void)_turnOnWireless:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;
  id buf[2];

  v4 = objc_alloc_init(MEMORY[0x24BEC28D0]);
  if ((objc_msgSend(v4, "powered") & 1) != 0)
  {
    objc_msgSend(v4, "setUserAutoJoinState:", 1);
    _TVRUIViewControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v6 = "Wi-Fi already powered on. Now enabling auto-join state.";
LABEL_6:
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v4, "setPowered:", 1);
    _TVRUIViewControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v6 = "Requested turning on Wi-Fi in response to user action";
      goto LABEL_6;
    }
  }

  -[TVRMessageView setWifiConnectInProgress:](self, "setWifiConnectInProgress:", 1);
  -[TVRMessageView showLoadingSpinner](self, "showLoadingSpinner");
  objc_initWeak(buf, self);
  v7 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__TVRMessageView__turnOnWireless___block_invoke;
  block[3] = &unk_24DE2C4F8;
  objc_copyWeak(&v9, buf);
  dispatch_after(v7, MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);

}

void __34__TVRMessageView__turnOnWireless___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "setWifiConnectInProgress:", 0);

  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  _QWORD block[4];
  id v19;
  id buf;
  __int16 v21;
  int v22;
  uint64_t v23;
  CGPoint v24;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  v23 = *MEMORY[0x24BDAC8D0];
  -[TVRMessageView turnOnWiFiButton](self, "turnOnWiFiButton", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  -[TVRMessageView turnOnWiFiButton](self, "turnOnWiFiButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMessageView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[TVRMessageView turnOnWiFiButton](self, "turnOnWiFiButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v24.x = v10;
  v24.y = v12;
  v14 = CGRectContainsPoint(v25, v24);

  _TVRUIViewControllerLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRMessageView turnOnWiFiButton](self, "turnOnWiFiButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v14;
    v21 = 1024;
    v22 = objc_msgSend(v16, "isEnabled");
    _os_log_impl(&dword_21B042000, v15, OS_LOG_TYPE_DEFAULT, "#debug pointinsidebutton %d %d", (uint8_t *)&buf, 0xEu);

  }
  if (!v14)
    return 0;
  objc_initWeak(&buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__TVRMessageView_pointInside_withEvent___block_invoke;
  block[3] = &unk_24DE2C4F8;
  objc_copyWeak(&v19, &buf);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&buf);
  return 1;
}

void __40__TVRMessageView_pointInside_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_turnOnWireless:", 0);
    WeakRetained = v2;
  }

}

- (id)_convertToAttributedStringWithReplacement:(id)a3 imagePointSize:(double)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  if (_convertToAttributedStringWithReplacement_imagePointSize__onceToken != -1)
    dispatch_once(&_convertToAttributedStringWithReplacement_imagePointSize__onceToken, &__block_literal_global_1);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = objc_msgSend(v5, "length");
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_2;
  v19[3] = &unk_24DE2C568;
  v9 = v6;
  v20 = v9;
  objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 2, v19);
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v5);
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 7, a4);
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_4;
    v16[3] = &unk_24DE2C590;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v18 = v11;
    v12 = v17;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);
    v13 = v18;
    v14 = v11;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke()
{
  void *v0;

  v0 = (void *)_convertToAttributedStringWithReplacement_imagePointSize____unicodeToImageMapping;
  _convertToAttributedStringWithReplacement_imagePointSize____unicodeToImageMapping = (uint64_t)&unk_24DE4DBB8;

}

void __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v7 = a2;
  v8 = (void *)_convertToAttributedStringWithReplacement_imagePointSize____unicodeToImageMapping;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_3;
  v10[3] = &unk_24DE2C540;
  v11 = v7;
  v12 = *(id *)(a1 + 32);
  v13 = a3;
  v14 = a4;
  v9 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2))
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, v6);

  }
}

void __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v5 = (void *)MEMORY[0x24BEBD640];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(v5, "systemImageNamed:withConfiguration:", a3, v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BEBB4B8]);
  objc_msgSend(v15, "imageWithRenderingMode:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v9);

  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  v12 = objc_msgSend(v7, "rangeValue");
  v14 = v13;

  objc_msgSend(v11, "replaceCharactersInRange:withAttributedString:", v12, v14, v10);
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (UIView)currentView
{
  return self->_currentView;
}

- (UIButton)turnOnWiFiButton
{
  return self->_turnOnWiFiButton;
}

- (void)setTurnOnWiFiButton:(id)a3
{
  objc_storeStrong((id *)&self->_turnOnWiFiButton, a3);
}

- (BOOL)isWifiConnectInProgress
{
  return self->_wifiConnectInProgress;
}

- (void)setWifiConnectInProgress:(BOOL)a3
{
  self->_wifiConnectInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnOnWiFiButton, 0);
  objc_storeStrong((id *)&self->_currentView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end
