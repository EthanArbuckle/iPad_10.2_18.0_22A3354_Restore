@implementation TUIKTLearnMorePresenter

- (TUIKTLearnMorePresenter)init
{
  TUIKTLearnMorePresenter *v3;
  uint64_t v4;
  OBPrivacyPresenter *privacyPresenter;
  objc_super v7;

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_3 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_3, &__block_literal_global_3);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_DEBUG))
    -[TUIKTLearnMorePresenter init].cold.1();
  v7.receiver = self;
  v7.super_class = (Class)TUIKTLearnMorePresenter;
  v3 = -[TUIKTLearnMorePresenter init](&v7, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.contactkey"));
    v4 = objc_claimAutoreleasedReturnValue();
    privacyPresenter = v3->_privacyPresenter;
    v3->_privacyPresenter = (OBPrivacyPresenter *)v4;

  }
  return v3;
}

void __31__TUIKTLearnMorePresenter_init__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

void __34__TUIKTLearnMorePresenter_dealloc__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

- (void)presentWithPresentingViewController:(id)a3
{
  id v4;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_3 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_3, &__block_literal_global_7_0);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_DEBUG))
    -[TUIKTLearnMorePresenter presentWithPresentingViewController:].cold.1();
  -[OBPrivacyPresenter setPresentingViewController:](self->_privacyPresenter, "setPresentingViewController:", v4);
  -[OBPrivacyPresenter present](self->_privacyPresenter, "present");

}

void __63__TUIKTLearnMorePresenter_presentWithPresentingViewController___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyPresenter, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)presentWithPresentingViewController:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_2493EE000, v2, OS_LOG_TYPE_DEBUG, "%s presentingViewController = %{public}@ on %{public}@", (uint8_t *)v3, 0x20u);
}

@end
