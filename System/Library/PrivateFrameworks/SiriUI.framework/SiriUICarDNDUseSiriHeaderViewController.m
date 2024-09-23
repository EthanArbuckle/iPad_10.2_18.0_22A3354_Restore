@implementation SiriUICarDNDUseSiriHeaderViewController

+ (BOOL)shouldShowCarDNDUseSiriHeaderViewController
{
  void *v2;
  NSObject *v3;
  BOOL v4;
  const char *v5;
  void *v6;
  void *v7;
  char v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 buf;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  +[SiriUIPreferences sharedPreferences](SiriUIPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "voiceRequestMadeWhileInCarDND"))
  {
    v3 = *MEMORY[0x24BE08FB0];
    v4 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[SiriUICarDNDUseSiriHeaderViewController shouldShowCarDNDUseSiriHeaderViewController]";
      v5 = "%s Not showing SiriUICarDNDUseSiriHeaderViewController. User has tried Hey Siri in CarDND mode";
LABEL_13:
      _os_log_impl(&dword_21764F000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&buf, 0xCu);
      v4 = 0;
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v2, "numberOfTimesCarDNDSiriCardShown") < 10)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "assistantIsEnabled"))
    {
      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "disableAssistantWhilePasscodeLocked"))
      {
        v9 = AFAssistantRestricted();

        if ((v9 & 1) == 0)
        {
          v16 = 0;
          v17 = &v16;
          v18 = 0x2050000000;
          v10 = (void *)getSASSystemStateClass_softClass;
          v19 = getSASSystemStateClass_softClass;
          if (!getSASSystemStateClass_softClass)
          {
            *(_QWORD *)&buf = MEMORY[0x24BDAC760];
            *((_QWORD *)&buf + 1) = 3221225472;
            v21 = __getSASSystemStateClass_block_invoke;
            v22 = &unk_24D7D9460;
            v23 = &v16;
            __getSASSystemStateClass_block_invoke((uint64_t)&buf);
            v10 = (void *)v17[3];
          }
          v11 = objc_retainAutorelease(v10);
          _Block_object_dispose(&v16, 8);
          objc_msgSend(v11, "sharedSystemState", v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isConnectedToCarPlay");

          if (v13)
          {
            v3 = *MEMORY[0x24BE08FB0];
            v4 = 0;
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
              goto LABEL_14;
            LODWORD(buf) = 136315138;
            *(_QWORD *)((char *)&buf + 4) = "+[SiriUICarDNDUseSiriHeaderViewController shouldShowCarDNDUseSiriHeaderViewController]";
            v5 = "%s Not showing SiriUICarDNDUseSiriHeaderViewController. CarPlay Session is connected";
          }
          else
          {
            v14 = (void *)CFPreferencesCopyAppValue(CFSTR("VoiceTrigger Enabled"), CFSTR("com.apple.voicetrigger"));
            v15 = objc_msgSend(v14, "BOOLValue");

            if ((v15 & 1) != 0)
            {
              v4 = 1;
              goto LABEL_14;
            }
            v3 = *MEMORY[0x24BE08FB0];
            v4 = 0;
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
              goto LABEL_14;
            LODWORD(buf) = 136315138;
            *(_QWORD *)((char *)&buf + 4) = "+[SiriUICarDNDUseSiriHeaderViewController shouldShowCarDNDUseSiriHeaderViewController]";
            v5 = "%s Not showing SiriUICarDNDUseSiriHeaderViewController. Voice Trigger not enabled";
          }
          goto LABEL_13;
        }
LABEL_11:
        v3 = *MEMORY[0x24BE08FB0];
        v4 = 0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = "+[SiriUICarDNDUseSiriHeaderViewController shouldShowCarDNDUseSiriHeaderViewController]";
          v5 = "%s Not showing SiriUICarDNDUseSiriHeaderViewController. Siri not supported on lock screen";
          goto LABEL_13;
        }
        goto LABEL_14;
      }

    }
    goto LABEL_11;
  }
  v3 = *MEMORY[0x24BE08FB0];
  v4 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[SiriUICarDNDUseSiriHeaderViewController shouldShowCarDNDUseSiriHeaderViewController]";
    v5 = "%s Not showing SiriUICarDNDUseSiriHeaderViewController. Reached max appearances";
    goto LABEL_13;
  }
LABEL_14:

  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriUICarDNDUseSiriHeaderViewController;
  -[SiriUICarDNDUseSiriHeaderViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SiriUICarDNDUseSiriHeaderViewController _setupView](self, "_setupView");
  -[SiriUICarDNDUseSiriHeaderViewController _setupImageView](self, "_setupImageView");
  -[SiriUICarDNDUseSiriHeaderViewController _setupTitleLabel](self, "_setupTitleLabel");
  -[SiriUICarDNDUseSiriHeaderViewController _setupSubtitleLabel](self, "_setupSubtitleLabel");
  -[SiriUICarDNDUseSiriHeaderViewController _setupTitleAndSubtitleConstraints](self, "_setupTitleAndSubtitleConstraints");
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUICarDNDUseSiriHeaderViewController;
  -[SiriUICarDNDUseSiriHeaderViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[SiriUICarDNDUseSiriHeaderViewController _addContextProvider](self, "_addContextProvider");
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, &__block_literal_global_5);

  -[SiriUICarDNDUseSiriHeaderViewController _sendCardAppearedAnalyticsEvent](self, "_sendCardAppearedAnalyticsEvent");
}

void __57__SiriUICarDNDUseSiriHeaderViewController_viewDidAppear___block_invoke()
{
  id v0;

  +[SiriUIPreferences sharedPreferences](SiriUIPreferences, "sharedPreferences");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setNumberOfTimesCarDNDSiriCardShown:", objc_msgSend(v0, "numberOfTimesCarDNDSiriCardShown") + 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUICarDNDUseSiriHeaderViewController;
  -[SiriUICarDNDUseSiriHeaderViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SiriUICarDNDUseSiriHeaderViewController _removeContextProvider](self, "_removeContextProvider");
}

- (void)_setupView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc(MEMORY[0x24BDF6FC8]);
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v9 = (id)objc_msgSend(v5, "initWithFrame:");

  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 1203);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEffect:", v7);

  objc_msgSend(v9, "_setOverrideUserInterfaceStyle:", 2);
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

}

- (void)_setupImageView
{
  id v3;
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
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/Assistant/SiriUIAssets/SiriUIAssets.bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("SiriOrb-CarDND"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v5);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SiriUICarDNDUseSiriHeaderViewController _setSiriOrbImageView:](self, "_setSiriOrbImageView:", v3);
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICarDNDUseSiriHeaderViewController _siriOrbImageView](self, "_siriOrbImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[SiriUICarDNDUseSiriHeaderViewController _siriOrbImageView](self, "_siriOrbImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 72.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[SiriUICarDNDUseSiriHeaderViewController _siriOrbImageView](self, "_siriOrbImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 72.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  v14 = (void *)MEMORY[0x24BDD1628];
  -[SiriUICarDNDUseSiriHeaderViewController _siriOrbImageView](self, "_siriOrbImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 3, 0, v16, 3, 1.0, 44.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDD1628];
  -[SiriUICarDNDUseSiriHeaderViewController _siriOrbImageView](self, "_siriOrbImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 9, 0, v20, 9, 1.0, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  v24[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addConstraints:", v23);

}

- (void)_setupTitleLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v6, 34.0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[SiriUICarDNDUseSiriHeaderViewController _localizedTitle](self, "_localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BDF6B68]);
  v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v9, "setTextAlignment:", 1);
  objc_msgSend(v9, "setFont:", v13);
  objc_msgSend(v9, "setText:", v7);
  objc_msgSend(v9, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v10);

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SiriUICarDNDUseSiriHeaderViewController _setTitleLabel:](self, "_setTitleLabel:", v9);
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICarDNDUseSiriHeaderViewController _titleLabel](self, "_titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

}

- (void)_setupSubtitleLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7858]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v5, 22.0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[SiriUICarDNDUseSiriHeaderViewController _localizedSubtitle](self, "_localizedSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDF6B68]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v8, "setTextAlignment:", 1);
  objc_msgSend(v8, "setFont:", v12);
  objc_msgSend(v8, "setText:", v6);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v9);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SiriUICarDNDUseSiriHeaderViewController _setSubtitleLabel:](self, "_setSubtitleLabel:", v8);
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICarDNDUseSiriHeaderViewController _subtitleLabel](self, "_subtitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

}

- (void)_setupTitleAndSubtitleConstraints
{
  uint64_t v3;
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
  _QWORD v36[5];
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  if (self->_localizedSubtitleDisplayedAboveTitle)
    -[SiriUICarDNDUseSiriHeaderViewController _subtitleLabel](self, "_subtitleLabel");
  else
    -[SiriUICarDNDUseSiriHeaderViewController _titleLabel](self, "_titleLabel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (self->_localizedSubtitleDisplayedAboveTitle)
    -[SiriUICarDNDUseSiriHeaderViewController _titleLabel](self, "_titleLabel");
  else
    -[SiriUICarDNDUseSiriHeaderViewController _subtitleLabel](self, "_subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1628];
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 9, 0, v6, 9, 1.0, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD1628];
  -[SiriUICarDNDUseSiriHeaderViewController _siriOrbImageView](self, "_siriOrbImageView");
  v8 = (void *)v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 3, 0, v9, 4, 1.0, 24.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD1628];
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 5, 0, v11, 5, 1.0, 28.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD1628];
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v8;
  objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 6, 0, v13, 6, 1.0, -28.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v35;
  v37[1] = v34;
  v37[2] = v33;
  v37[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addConstraints:", v16);

  v17 = (void *)MEMORY[0x24BDD1628];
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 9, 0, v18, 9, 1.0, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 3, 0, v8, 4, 1.0, 4.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BDD1628];
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 4, 0, v22, 4, 1.0, -40.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x24BDD1628];
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 5, 0, v25, 5, 1.0, 28.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BDD1628];
  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 6, 0, v28, 6, 1.0, -28.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUICarDNDUseSiriHeaderViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v19;
  v36[1] = v20;
  v36[2] = v23;
  v36[3] = v26;
  v36[4] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addConstraints:", v31);

}

- (NSString)_localizedTitle
{
  NSString *localizedTitle;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  localizedTitle = self->_localizedTitle;
  if (localizedTitle)
    return localizedTitle;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v6 = (void *)getVTPreferencesClass_softClass;
  v18 = getVTPreferencesClass_softClass;
  if (!getVTPreferencesClass_softClass)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getVTPreferencesClass_block_invoke;
    v14[3] = &unk_24D7D9460;
    v14[4] = &v15;
    __getVTPreferencesClass_block_invoke((uint64_t)v14);
    v6 = (void *)v16[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v7, "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedTriggerPhraseForLanguageCode:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CARDND_USE_SIRI_TITLE"), CFSTR("Say “%@”"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUICarDNDUseSiriHeaderViewController _setLocalizedTitle:](self, "_setLocalizedTitle:", v13);
  return (NSString *)v13;
}

- (NSString)_localizedSubtitle
{
  NSString *localizedSubtitle;
  NSString *v3;
  void *v5;
  void *v6;

  localizedSubtitle = self->_localizedSubtitle;
  if (localizedSubtitle)
  {
    v3 = localizedSubtitle;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CARDND_USE_SIRI_SUBTITLE"), 0, 0);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CARDND_USE_SIRI_TITLE_SUBTITLE_SWAP_ORDER"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_localizedSubtitleDisplayedAboveTitle = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

    -[SiriUICarDNDUseSiriHeaderViewController _setLocalizedSubtitle:](self, "_setLocalizedSubtitle:", v3);
  }
  return v3;
}

- (void)_addContextProvider
{
  void *v3;
  SiriUICarDNDContextProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SiriUICarDNDUseSiriHeaderViewController _contextProvider](self, "_contextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(SiriUICarDNDContextProvider);
    -[SiriUICarDNDUseSiriHeaderViewController _setContextProvider:](self, "_setContextProvider:", v4);

  }
  -[SiriUICarDNDUseSiriHeaderViewController _hintContext](self, "_hintContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SiriUICarDNDUseSiriHeaderViewController _contextProvider](self, "_contextProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setHintContext:", v9);

  }
  -[SiriUICarDNDUseSiriHeaderViewController _contextProvider](self, "_contextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  objc_msgSend(MEMORY[0x24BE09178], "defaultContextManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICarDNDUseSiriHeaderViewController _contextProvider](self, "_contextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addContextProvider:", v8);

}

- (id)_hintContext
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[SiriUIPreferences sharedPreferences](SiriUIPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  v4 = (void *)objc_msgSend(v3, "initWithObjects:", *MEMORY[0x24BE81B00], *MEMORY[0x24BE81B08], *MEMORY[0x24BE81B18], *MEMORY[0x24BE81B10], 0);
  v5 = objc_msgSend(v2, "integerForKey:", CFSTR("carDNDSubtitleIndex"));
  objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("carDNDHintDomainKey"));
  objc_msgSend(v2, "setInteger:forKey:", (v5 + 1) % (unint64_t)objc_msgSend(v4, "count"), CFSTR("carDNDSubtitleIndex"));
  v7 = objc_alloc_init(MEMORY[0x24BE811D0]);
  objc_msgSend(v7, "setUtteranceDomainIdentifier:", v6);

  return v7;
}

- (void)_removeContextProvider
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE09178], "defaultContextManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICarDNDUseSiriHeaderViewController _contextProvider](self, "_contextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeContextProvider:", v4);

  -[SiriUICarDNDUseSiriHeaderViewController _setContextProvider:](self, "_setContextProvider:", 0);
}

- (void)_sendCardAppearedAnalyticsEvent
{
  int v1;
  const char *v2;
  __int16 v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[SiriUICarDNDUseSiriHeaderViewController _sendCardAppearedAnalyticsEvent]";
  v3 = 2112;
  v4 = CFSTR("com.apple.siri.carDNDUseSiriCardAppeared");
  _os_log_error_impl(&dword_21764F000, log, OS_LOG_TYPE_ERROR, "%s CoreAnalytics eventName:%@ not sent. Event name must not be in current config", (uint8_t *)&v1, 0x16u);
}

void *__74__SiriUICarDNDUseSiriHeaderViewController__sendCardAppearedAnalyticsEvent__block_invoke()
{
  return &unk_24D7EF558;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)contextProvided:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "controllerDidProvideContext:", self);

}

- (SiriUICarDNDDelegate)delegate
{
  return (SiriUICarDNDDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)_titleLabel
{
  return self->_titleLabel;
}

- (void)_setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)_subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)_setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void)_setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (void)_setLocalizedSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedSubtitle, a3);
}

- (UIImageView)_siriOrbImageView
{
  return self->_siriOrbImageView;
}

- (void)_setSiriOrbImageView:(id)a3
{
  objc_storeStrong((id *)&self->_siriOrbImageView, a3);
}

- (SiriUICarDNDContextProvider)_contextProvider
{
  return self->_contextProvider;
}

- (void)_setContextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_contextProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextProvider, 0);
  objc_storeStrong((id *)&self->_siriOrbImageView, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
