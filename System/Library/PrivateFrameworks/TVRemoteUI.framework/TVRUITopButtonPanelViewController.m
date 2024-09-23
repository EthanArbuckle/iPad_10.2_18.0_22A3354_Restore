@implementation TVRUITopButtonPanelViewController

- (void)viewDidLoad
{
  TVRUIButton *v3;
  TVRUIButton *v4;
  TVRUIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
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
  uint64_t v32;
  void *v33;
  id v34;
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
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD v88[5];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  objc_super v93;
  _QWORD v94[12];
  _BYTE v95[128];
  _QWORD v96[5];

  v96[3] = *MEMORY[0x24BDAC8D0];
  v93.receiver = self;
  v93.super_class = (Class)TVRUITopButtonPanelViewController;
  -[TVRUITopButtonPanelViewController viewDidLoad](&v93, sel_viewDidLoad);
  v3 = -[TVRUIButton initWithType:hasTapAction:]([TVRUIButton alloc], "initWithType:hasTapAction:", 29, 0);
  -[TVRUITopButtonPanelViewController setMuteButton:](self, "setMuteButton:", v3);

  v4 = -[TVRUIButton initWithType:hasTapAction:]([TVRUIButton alloc], "initWithType:hasTapAction:", 28, 0);
  -[TVRUITopButtonPanelViewController setGuideButton:](self, "setGuideButton:", v4);

  v5 = -[TVRUIButton initWithType:hasTapAction:]([TVRUIButton alloc], "initWithType:hasTapAction:", 30, 0);
  -[TVRUITopButtonPanelViewController setPowerButton:](self, "setPowerButton:", v5);

  -[TVRUITopButtonPanelViewController muteButton](self, "muteButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v6;
  -[TVRUITopButtonPanelViewController guideButton](self, "guideButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v7;
  -[TVRUITopButtonPanelViewController powerButton](self, "powerButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v96[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController setButtons:](self, "setButtons:", v9);

  -[TVRUITopButtonPanelViewController _updateButtonsShapes](self, "_updateButtonsShapes");
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  -[TVRUITopButtonPanelViewController buttons](self, "buttons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v90 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        -[TVRUITopButtonPanelViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSubview:", v15);

        objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 1);
        objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel__buttonReleased_, 448);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
    }
    while (v12);
  }

  -[TVRUITopButtonPanelViewController styleProvider](self, "styleProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "controlPanelInsets");
  v19 = v18;
  v21 = v20;

  v61 = (void *)MEMORY[0x24BDD1628];
  -[TVRUITopButtonPanelViewController muteButton](self, "muteButton");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leftAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController view](self, "view");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "leftAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, v19);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v83;
  -[TVRUITopButtonPanelViewController muteButton](self, "muteButton");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "centerYAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController view](self, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "centerYAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v79);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = v78;
  -[TVRUITopButtonPanelViewController muteButton](self, "muteButton");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "heightAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController view](self, "view");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "heightAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v74);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v94[2] = v73;
  -[TVRUITopButtonPanelViewController muteButton](self, "muteButton");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "widthAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController muteButton](self, "muteButton");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "heightAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v94[3] = v68;
  -[TVRUITopButtonPanelViewController guideButton](self, "guideButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "centerXAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController view](self, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "centerXAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v94[4] = v63;
  -[TVRUITopButtonPanelViewController guideButton](self, "guideButton");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "centerYAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "centerYAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v94[5] = v57;
  -[TVRUITopButtonPanelViewController guideButton](self, "guideButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "heightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController view](self, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v94[6] = v52;
  -[TVRUITopButtonPanelViewController guideButton](self, "guideButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "widthAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController guideButton](self, "guideButton");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v94[7] = v47;
  -[TVRUITopButtonPanelViewController powerButton](self, "powerButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, -v21);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v94[8] = v42;
  -[TVRUITopButtonPanelViewController powerButton](self, "powerButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerYAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v94[9] = v37;
  -[TVRUITopButtonPanelViewController powerButton](self, "powerButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v94[10] = v24;
  -[TVRUITopButtonPanelViewController powerButton](self, "powerButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController powerButton](self, "powerButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v94[11] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 12);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "activateConstraints:", v30);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x24BED2718];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = __48__TVRUITopButtonPanelViewController_viewDidLoad__block_invoke;
  v88[3] = &unk_24DE2CC58;
  v88[4] = self;
  v34 = (id)objc_msgSend(v31, "addObserverForName:object:queue:usingBlock:", v32, 0, v33, v88);

}

uint64_t __48__TVRUITopButtonPanelViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateButtonsShapes");
}

- (void)setDevice:(id)a3
{
  TVRUIDevice *v5;
  TVRUIDevice **p_device;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  TVRUIDevice *v13;

  v5 = (TVRUIDevice *)a3;
  p_device = &self->_device;
  if (self->_device != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_device, a3);
    v7 = -[TVRUIDevice supportsMute](*p_device, "supportsMute");
    -[TVRUITopButtonPanelViewController muteButton](self, "muteButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", v7);

    v9 = -[TVRUIDevice supportsGuide](*p_device, "supportsGuide");
    -[TVRUITopButtonPanelViewController guideButton](self, "guideButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", v9);

    v11 = -[TVRUIDevice supportsPower](*p_device, "supportsPower");
    -[TVRUITopButtonPanelViewController powerButton](self, "powerButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", v11);

    v5 = v13;
  }

}

- (void)setStyleProvider:(id)a3
{
  TVRUIStyleProvider *v5;
  TVRUIStyleProvider *v6;

  v5 = (TVRUIStyleProvider *)a3;
  if (self->_styleProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_styleProvider, a3);
    v5 = v6;
  }

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[TVRUITopButtonPanelViewController _updateViewState](self, "_updateViewState");
  }
}

- (void)_updateViewState
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = 1.0;
  if (!-[TVRUITopButtonPanelViewController enabled](self, "enabled"))
  {
    -[TVRUITopButtonPanelViewController styleProvider](self, "styleProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disabledButtonAlpha");
    v3 = v5;

  }
  -[TVRUITopButtonPanelViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v3);

  -[TVRUITopButtonPanelViewController muteButton](self, "muteButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v3);

  -[TVRUITopButtonPanelViewController guideButton](self, "guideButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v3);

  -[TVRUITopButtonPanelViewController powerButton](self, "powerButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v3);

}

- (void)setVolumeControlAvailable:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  if (a3)
  {
    -[TVRUITopButtonPanelViewController device](self, "device");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "supportsMute");
  }
  else
  {
    v5 = 0;
  }
  -[TVRUITopButtonPanelViewController muteButton](self, "muteButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

  if (v3)
}

- (void)_buttonPressed:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, objc_msgSend(a3, "buttonType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController buttonEventDelegate](self, "buttonEventDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUITopButtonPanelViewController buttonEventDelegate](self, "buttonEventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUITopButtonPanelViewController buttonEventDelegate](self, "buttonEventDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)_buttonReleased:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, objc_msgSend(a3, "buttonType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUITopButtonPanelViewController buttonEventDelegate](self, "buttonEventDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUITopButtonPanelViewController buttonEventDelegate](self, "buttonEventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUITopButtonPanelViewController buttonEventDelegate](self, "buttonEventDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)_updateButtonsShapes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TVRUITopButtonPanelViewController buttons](self, "buttons", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(v8, "setHasButtonShape:", _AXSButtonShapesEnabled() != 0);
        if ((objc_msgSend(v8, "hasButtonShape") & 1) != 0)
        {
          -[TVRUITopButtonPanelViewController styleProvider](self, "styleProvider");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "buttonBackgroundColor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setBackgroundColor:", v10);

        }
        else
        {
          objc_msgSend(v8, "setBackgroundColor:", 0);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (_TVRUIEventDelegate)buttonEventDelegate
{
  return (_TVRUIEventDelegate *)objc_loadWeakRetained((id *)&self->_buttonEventDelegate);
}

- (void)setButtonEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonEventDelegate, a3);
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (TVRUIButton)muteButton
{
  return self->_muteButton;
}

- (void)setMuteButton:(id)a3
{
  objc_storeStrong((id *)&self->_muteButton, a3);
}

- (TVRUIButton)guideButton
{
  return self->_guideButton;
}

- (void)setGuideButton:(id)a3
{
  objc_storeStrong((id *)&self->_guideButton, a3);
}

- (TVRUIButton)powerButton
{
  return self->_powerButton;
}

- (void)setPowerButton:(id)a3
{
  objc_storeStrong((id *)&self->_powerButton, a3);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_powerButton, 0);
  objc_storeStrong((id *)&self->_guideButton, 0);
  objc_storeStrong((id *)&self->_muteButton, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_buttonEventDelegate);
}

@end
