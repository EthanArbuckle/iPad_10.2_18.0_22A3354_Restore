@implementation TVRUIMiniPlayerMediaControlsViewController

- (TVRUIMiniPlayerMediaControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TVRUIMiniPlayerMediaControlsViewController *v4;
  TVRUIDarkStyleProvider *v5;
  TVRUIStyleProvider *styleProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVRUIMiniPlayerMediaControlsViewController;
  v4 = -[TVRUIMiniPlayerMediaControlsViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(TVRUIDarkStyleProvider);
    styleProvider = v4->_styleProvider;
    v4->_styleProvider = (TVRUIStyleProvider *)v5;

  }
  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIMiniPlayerMediaControlsViewController;
  -[TVRUIMiniPlayerMediaControlsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[TVRUIMiniPlayerMediaControlsViewController _configureHierarchy](self, "_configureHierarchy");
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
  -[TVRUIMiniPlayerMediaControlsViewController _updateButtonsFromPlayingState:mediaActive:](self, "_updateButtonsFromPlayingState:mediaActive:", a3, -[TVRUIMiniPlayerMediaControlsViewController isMediaActive](self, "isMediaActive"));
}

- (void)setIsMediaActive:(BOOL)a3
{
  self->_isMediaActive = a3;
  -[TVRUIMiniPlayerMediaControlsViewController _updateButtonsFromPlayingState:mediaActive:](self, "_updateButtonsFromPlayingState:mediaActive:", -[TVRUIMiniPlayerMediaControlsViewController isPlaying](self, "isPlaying"), a3);
}

- (void)_configureHierarchy
{
  TVREventHaptic *v3;
  TVREventHaptic *eventHaptic;
  TVRUIButton *v5;
  TVRUIButton *v6;
  TVRUIButton *v7;
  void *v8;
  void *v9;
  void *v10;
  TVRUIButton *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
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
  TVRUIButton *v37;
  void *v38;
  TVRUIButton *v39;
  void *v40;
  TVRUIButton *v41;
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
  TVRUIMiniPlayerMediaControlsViewController *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[14];
  _BYTE v72[128];
  _QWORD v73[5];

  v73[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(TVREventHaptic);
  eventHaptic = self->_eventHaptic;
  self->_eventHaptic = v3;

  v5 = -[TVRUIButton initWithType:hasTapAction:buttonLocation:]([TVRUIButton alloc], "initWithType:hasTapAction:buttonLocation:", 7, 1, 2);
  -[TVRUIButton setHasButtonShape:](v5, "setHasButtonShape:", 0);
  v6 = -[TVRUIButton initWithType:hasTapAction:buttonLocation:]([TVRUIButton alloc], "initWithType:hasTapAction:buttonLocation:", 9994, 1, 2);
  -[TVRUIButton setHasButtonShape:](v6, "setHasButtonShape:", 0);
  v7 = -[TVRUIButton initWithType:hasTapAction:buttonLocation:]([TVRUIButton alloc], "initWithType:hasTapAction:buttonLocation:", 6, 1, 2);
  -[TVRUIButton setHasButtonShape:](v7, "setHasButtonShape:", 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__skipBackwardWasTapped_);
  objc_msgSend(v8, "setCancelsTouchesInView:", 0);
  v65 = v8;
  -[TVRUIButton addGestureRecognizer:](v5, "addGestureRecognizer:", v8);
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__skipBackwardWasLongPressed_);
  -[TVRUIButton addGestureRecognizer:](v5, "addGestureRecognizer:");
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__playPauseWasTapped_);
  -[TVRUIButton addGestureRecognizer:](v6, "addGestureRecognizer:");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__skipForwardWasTapped_);
  objc_msgSend(v9, "setCancelsTouchesInView:", 0);
  v62 = v9;
  -[TVRUIButton addGestureRecognizer:](v7, "addGestureRecognizer:", v9);
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__skipForwardWasLongPressed_);
  -[TVRUIButton addGestureRecognizer:](v7, "addGestureRecognizer:");
  v66 = self;
  -[TVRUIMiniPlayerMediaControlsViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v73[0] = v5;
  v73[1] = v7;
  v11 = v7;
  v73[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 3);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v68 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        LODWORD(v18) = 1148846080;
        objc_msgSend(v17, "setContentHuggingPriority:forAxis:", 1, v18);
        objc_msgSend(v10, "addSubview:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    }
    while (v14);
  }

  objc_msgSend(v10, "setClipsToBounds:", 0);
  v45 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v10, "heightAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToConstant:", 41.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v59;
  -[TVRUIButton leadingAnchor](v5, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v56;
  -[TVRUIButton centerYAnchor](v5, "centerYAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v53;
  -[TVRUIButton widthAnchor](v5, "widthAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToConstant:", 64.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v51;
  -[TVRUIButton heightAnchor](v5, "heightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToConstant:", 64.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v49;
  -[TVRUIButton leadingAnchor](v6, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButton imageView](v5, "imageView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 65.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v44;
  -[TVRUIButton centerYAnchor](v6, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v40;
  -[TVRUIButton widthAnchor](v6, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToConstant:", 64.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v71[7] = v36;
  -[TVRUIButton heightAnchor](v6, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToConstant:", 64.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v71[8] = v34;
  v37 = v7;
  -[TVRUIButton leadingAnchor](v7, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButton imageView](v6, "imageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 65.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v71[9] = v30;
  -[TVRUIButton centerYAnchor](v7, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v71[10] = v27;
  -[TVRUIButton trailingAnchor](v7, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v41 = v5;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v71[11] = v21;
  -[TVRUIButton widthAnchor](v11, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToConstant:", 64.0);
  v39 = v6;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71[12] = v23;
  -[TVRUIButton heightAnchor](v11, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 64.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v71[13] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "activateConstraints:", v26);

  -[TVRUIMiniPlayerMediaControlsViewController setSkipForwardButton:](v66, "setSkipForwardButton:", v37);
  -[TVRUIMiniPlayerMediaControlsViewController setSkipBackwardButton:](v66, "setSkipBackwardButton:", v41);
  -[TVRUIMiniPlayerMediaControlsViewController setPlayPauseButton:](v66, "setPlayPauseButton:", v39);

}

- (void)_updateButtonsFromPlayingState:(BOOL)a3 mediaActive:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v5 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  -[TVRUIMiniPlayerMediaControlsViewController playPauseButton](self, "playPauseButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    v9 = 9994;
  else
    v9 = 9993;
  objc_msgSend(v7, "_updateButtonType:", v9);

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TVRUIMiniPlayerMediaControlsViewController styleProvider](self, "styleProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inactiveMediaControlTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[TVRUIMiniPlayerMediaControlsViewController skipBackwardButton](self, "skipBackwardButton", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  -[TVRUIMiniPlayerMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "setTintColor:", v10);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v16);
  }

}

- (void)_skipBackwardWasTapped:(id)a3
{
  if (-[TVRUIMiniPlayerMediaControlsViewController isMediaActive](self, "isMediaActive", a3))
    -[TVRUIMiniPlayerMediaControlsViewController _invokeCommandHandlerWithCommand:withFeedback:](self, "_invokeCommandHandlerWithCommand:withFeedback:", -[TVRUIMiniPlayerMediaControlsViewController isPlaying](self, "isPlaying") ^ 1, 1);
}

- (void)_skipBackwardWasLongPressed:(id)a3
{
  TVRUIMiniPlayerMediaControlsViewController *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (-[TVRUIMiniPlayerMediaControlsViewController isMediaActive](self, "isMediaActive"))
  {
    if (objc_msgSend(v7, "state") == 1)
    {
      v4 = self;
      v5 = 3;
      v6 = 1;
LABEL_7:
      -[TVRUIMiniPlayerMediaControlsViewController _invokeCommandHandlerWithCommand:withFeedback:](v4, "_invokeCommandHandlerWithCommand:withFeedback:", v5, v6);
      goto LABEL_8;
    }
    if (objc_msgSend(v7, "state") == 3 || objc_msgSend(v7, "state") == 4)
    {
      v4 = self;
      v5 = 4;
      v6 = 0;
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)_playPauseWasTapped:(id)a3
{
  -[TVRUIMiniPlayerMediaControlsViewController setIsPlaying:](self, "setIsPlaying:", -[TVRUIMiniPlayerMediaControlsViewController isPlaying](self, "isPlaying", a3) ^ 1);
  -[TVRUIMiniPlayerMediaControlsViewController _invokeCommandHandlerWithCommand:withFeedback:](self, "_invokeCommandHandlerWithCommand:withFeedback:", 1, 1);
}

- (void)_skipForwardWasTapped:(id)a3
{
  uint64_t v4;

  if (-[TVRUIMiniPlayerMediaControlsViewController isMediaActive](self, "isMediaActive", a3))
  {
    if (-[TVRUIMiniPlayerMediaControlsViewController isPlaying](self, "isPlaying"))
      v4 = 2;
    else
      v4 = 1;
    -[TVRUIMiniPlayerMediaControlsViewController _invokeCommandHandlerWithCommand:withFeedback:](self, "_invokeCommandHandlerWithCommand:withFeedback:", v4, 1);
  }
}

- (void)_skipForwardWasLongPressed:(id)a3
{
  TVRUIMiniPlayerMediaControlsViewController *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (-[TVRUIMiniPlayerMediaControlsViewController isMediaActive](self, "isMediaActive"))
  {
    if (objc_msgSend(v7, "state") == 1)
    {
      v4 = self;
      v5 = 5;
      v6 = 1;
LABEL_7:
      -[TVRUIMiniPlayerMediaControlsViewController _invokeCommandHandlerWithCommand:withFeedback:](v4, "_invokeCommandHandlerWithCommand:withFeedback:", v5, v6);
      goto LABEL_8;
    }
    if (objc_msgSend(v7, "state") == 3 || objc_msgSend(v7, "state") == 4)
    {
      v4 = self;
      v5 = 6;
      v6 = 0;
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)_invokeCommandHandlerWithCommand:(unint64_t)a3 withFeedback:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v4 = a4;
  -[TVRUIMiniPlayerMediaControlsViewController commandHandler](self, "commandHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TVRUIMiniPlayerMediaControlsViewController commandHandler](self, "commandHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, a3, MEMORY[0x24BDBD1B8]);

    if (v4)
    {
      -[TVRUIMiniPlayerMediaControlsViewController eventHaptic](self, "eventHaptic");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "playSelectionEventHaptic");

    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (BOOL)isMediaActive
{
  return self->_isMediaActive;
}

- (id)commandHandler
{
  return self->_commandHandler;
}

- (void)setCommandHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (TVRUIButton)playPauseButton
{
  return self->_playPauseButton;
}

- (void)setPlayPauseButton:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseButton, a3);
}

- (TVRUIButton)skipBackwardButton
{
  return self->_skipBackwardButton;
}

- (void)setSkipBackwardButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipBackwardButton, a3);
}

- (TVRUIButton)skipForwardButton
{
  return self->_skipForwardButton;
}

- (void)setSkipForwardButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipForwardButton, a3);
}

- (TVREventHaptic)eventHaptic
{
  return self->_eventHaptic;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_eventHaptic, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_storeStrong((id *)&self->_skipBackwardButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong(&self->_commandHandler, 0);
}

@end
