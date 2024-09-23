@implementation STEyeReliefIntroHowItWorksViewController

- (id)initForChecklistFlow:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  STEyeReliefIntroHowItWorksViewController *v16;
  void *v17;
  id completionHandler;
  objc_super v20;

  v4 = a3;
  v6 = a4;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    v9 = CFSTR("ChecklistScreenDistanceTitle");
  else
    v9 = CFSTR("ScreenDistanceEDUFeatureHowItWorksTitle");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureHowItWorksDetailText"), &stru_24DB8A1D0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationWithHierarchicalColor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("chevron.3.up.perspective.and.rectangle"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)STEyeReliefIntroHowItWorksViewController;
  v16 = -[STEyeReliefIntroHowItWorksViewController initWithTitle:detailText:icon:contentLayout:](&v20, sel_initWithTitle_detailText_icon_contentLayout_, v10, v11, v15, 2);
  v17 = _Block_copy(v6);

  completionHandler = v16->_completionHandler;
  v16->_completionHandler = v17;

  v16->_forChecklistFlow = v4;
  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
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
  uint8_t buf[16];
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)STEyeReliefIntroHowItWorksViewController;
  -[OBBaseWelcomeController viewDidLoad](&v32, sel_viewDidLoad);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureHowItWorksFirstListItemTitle"), &stru_24DB8A1D0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesMetricSystem");

  v7 = objc_alloc(MEMORY[0x24BDD1660]);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1928], "centimeters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 30.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1928], "inches");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 12.0;
  }
  v10 = objc_msgSend(v7, "initWithDoubleValue:unit:", v8, v9);

  v11 = objc_alloc_init(MEMORY[0x24BDD1668]);
  objc_msgSend(v11, "setUnitOptions:", 1);
  objc_msgSend(v11, "setUnitStyle:", 3);
  v29 = (void *)v10;
  objc_msgSend(v11, "stringFromMeasurement:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureHowItWorksFirstListItemDetailText"), &stru_24DB8A1D0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v12;
  objc_msgSend(v13, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), 0, v12);
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("eye.fill"));
  v30 = (void *)v4;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v15;
  -[STEyeReliefIntroHowItWorksViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v4, v15);
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureHowItWorksSecondListItemTitle"), &stru_24DB8A1D0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureHowItWorksSecondListItemDetailText"), &stru_24DB8A1D0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("lock.shield.fill"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v16;
  -[STEyeReliefIntroHowItWorksViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v16, v17, v18);
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureHowItWorksThirdListItemTitle"), &stru_24DB8A1D0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureHowItWorksThirdListItemDetailText"), &stru_24DB8A1D0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("ruler.fill"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[STEyeReliefIntroHowItWorksViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v19, v20, v21);
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureHowItWorksEnablementButton"), &stru_24DB8A1D0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitle:forState:", v23, 0);
  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__enable, 64);
  -[STEyeReliefIntroHowItWorksViewController buttonTray](self, "buttonTray");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addButton:", v22);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STEyeReliefIntroHowItWorksViewController.viewDidLoad", buf, 2u);
  }

}

- (void)_enable
{
  void *v3;
  void (**v4)(id, void *);

  -[STEyeReliefIntroHowItWorksViewController completionHandler](self, "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[STEyeReliefIntroHowItWorksViewController completionHandler](self, "completionHandler");
    v4 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, &unk_24DBBE748);

  }
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 1184, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1184);
}

- (BOOL)forChecklistFlow
{
  return self->_forChecklistFlow;
}

- (void)setForChecklistFlow:(BOOL)a3
{
  self->_forChecklistFlow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
