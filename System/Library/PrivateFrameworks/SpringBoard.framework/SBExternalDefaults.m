@implementation SBExternalDefaults

- (SBExternalGlobalDefaults)globalDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SBExternalDefaults_globalDefaults__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (globalDefaults___once != -1)
    dispatch_once(&globalDefaults___once, block);
  return self->_lazy_globalDefaults;
}

void __36__SBExternalDefaults_globalDefaults__block_invoke(uint64_t a1)
{
  SBExternalGlobalDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBExternalGlobalDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (SBExternalDuetDefaults)duetDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SBExternalDefaults_duetDefaults__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (duetDefaults___once != -1)
    dispatch_once(&duetDefaults___once, block);
  return self->_lazy_duetDefaults;
}

void __34__SBExternalDefaults_duetDefaults__block_invoke(uint64_t a1)
{
  SBExternalDuetDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBExternalDuetDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

- (SBExternalDemoDefaults)demoDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SBExternalDefaults_demoDefaults__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (demoDefaults___once != -1)
    dispatch_once(&demoDefaults___once, block);
  return self->_lazy_demoDefaults;
}

void __34__SBExternalDefaults_demoDefaults__block_invoke(uint64_t a1)
{
  SBExternalDemoDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBExternalDemoDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (SBExternalSetupDefaults)setupDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SBExternalDefaults_setupDefaults__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (setupDefaults___once != -1)
    dispatch_once(&setupDefaults___once, block);
  return self->_lazy_setupDefaults;
}

void __35__SBExternalDefaults_setupDefaults__block_invoke(uint64_t a1)
{
  SBExternalSetupDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBExternalSetupDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (SBExternalSettingsDefaults)settingsDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SBExternalDefaults_settingsDefaults__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (settingsDefaults___once != -1)
    dispatch_once(&settingsDefaults___once, block);
  return self->_lazy_settingsDefaults;
}

void __38__SBExternalDefaults_settingsDefaults__block_invoke(uint64_t a1)
{
  SBExternalSettingsDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBExternalSettingsDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SBExternalPhoneDefaults)phoneDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SBExternalDefaults_phoneDefaults__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (phoneDefaults___once != -1)
    dispatch_once(&phoneDefaults___once, block);
  return self->_lazy_phoneDefaults;
}

void __35__SBExternalDefaults_phoneDefaults__block_invoke(uint64_t a1)
{
  SBExternalPhoneDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBExternalPhoneDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

- (SBExternalWifiDefaults)networkDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SBExternalDefaults_networkDefaults__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (networkDefaults___once != -1)
    dispatch_once(&networkDefaults___once, block);
  return self->_lazy_networkDefaults;
}

void __37__SBExternalDefaults_networkDefaults__block_invoke(uint64_t a1)
{
  SBExternalWifiDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBExternalWifiDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

- (SBExternalSoundsDefaults)soundDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SBExternalDefaults_soundDefaults__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (soundDefaults___once != -1)
    dispatch_once(&soundDefaults___once, block);
  return self->_lazy_soundDefaults;
}

void __35__SBExternalDefaults_soundDefaults__block_invoke(uint64_t a1)
{
  SBExternalSoundsDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBExternalSoundsDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

- (SBExternalNotesDefaults)notesDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SBExternalDefaults_notesDefaults__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (notesDefaults___once != -1)
    dispatch_once(&notesDefaults___once, block);
  return self->_lazy_notesDefaults;
}

void __35__SBExternalDefaults_notesDefaults__block_invoke(uint64_t a1)
{
  SBExternalNotesDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBExternalNotesDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

}

- (SBBiometricKitDefaults)biometricKitDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SBExternalDefaults_biometricKitDefaults__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (biometricKitDefaults___once != -1)
    dispatch_once(&biometricKitDefaults___once, block);
  return self->_lazy_biometricKitDefaults;
}

void __42__SBExternalDefaults_biometricKitDefaults__block_invoke(uint64_t a1)
{
  SBBiometricKitDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBBiometricKitDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

+ (id)chronoDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E0DA9D60], "sharedInstance");
}

- (SBExternalChronoDefaults)chronoDefaults
{
  return self->_chronoDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chronoDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_chronoDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_biometricKitDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_notesDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_soundDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_networkDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_phoneDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_settingsDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_setupDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_demoDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_duetDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_globalDefaults, 0);
}

@end
