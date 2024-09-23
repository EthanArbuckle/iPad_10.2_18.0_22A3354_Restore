@implementation SBAppProtectionShieldView

- (SBAppProtectionShieldView)initWithAssistant:(id)a3 systemAppOutlet:(id)a4
{
  id v7;
  id v8;
  SBAppProtectionShieldView *v9;
  SBAppProtectionShieldView *v10;
  id *p_assistant;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  APBaseShieldView *baseShieldView;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBAppProtectionShieldView;
  v9 = -[SBAppProtectionShieldView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    p_assistant = (id *)&v9->_assistant;
    objc_storeStrong((id *)&v9->_assistant, a3);
    v12 = objc_alloc(MEMORY[0x1E0CF96D0]);
    objc_msgSend(*p_assistant, "appProtectionApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithApplication:", v13);

    objc_msgSend(*p_assistant, "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLocalizedName:", v15);

    objc_msgSend(v14, "setDelegate:", v10);
    objc_msgSend(v14, "setOutlet:", v8);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF96C8]), "initWithConfig:", v14);
    baseShieldView = v10->_baseShieldView;
    v10->_baseShieldView = (APBaseShieldView *)v16;

    -[APBaseShieldView setAutoresizingMask:](v10->_baseShieldView, "setAutoresizingMask:", 18);
    -[SBAppProtectionShieldView addSubview:](v10, "addSubview:", v10->_baseShieldView);

  }
  return v10;
}

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  -[SBApplicationAppProtectionAssistant requestUnshielding](self->_assistant, "requestUnshielding", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_baseShieldView, 0);
}

@end
