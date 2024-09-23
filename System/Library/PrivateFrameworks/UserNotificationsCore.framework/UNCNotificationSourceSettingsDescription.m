@implementation UNCNotificationSourceSettingsDescription

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 v10;
  id v11;
  id v12;
  _BOOL8 v13;
  id v14;
  id v15;
  _BOOL8 v16;
  id v17;
  id v18;
  _BOOL8 v19;
  id v20;
  id v21;
  _BOOL8 v22;
  id v23;
  id v24;
  _BOOL8 v25;
  id v26;
  id v27;
  _BOOL8 v28;
  id v29;
  id v30;
  _BOOL8 v31;
  id v32;
  id v33;
  _BOOL8 v34;
  id v35;
  id v36;
  _BOOL8 v37;
  id v38;
  id v39;
  _BOOL8 v40;
  id v41;
  id v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t);
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UNCNotificationSourceSettingsDescription supportsSounds](self, "supportsSounds");
  v7 = MEMORY[0x24BDAC760];
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke;
  v69[3] = &unk_251AE0EE8;
  v8 = v4;
  v70 = v8;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", v6, v69);
  v10 = -[UNCNotificationSourceSettingsDescription supportsAlerts](self, "supportsAlerts");
  v67[0] = v7;
  v67[1] = 3221225472;
  v67[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_2;
  v67[3] = &unk_251AE0EE8;
  v11 = v8;
  v68 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", v10, v67);
  v13 = -[UNCNotificationSourceSettingsDescription supportsBadges](self, "supportsBadges");
  v65[0] = v7;
  v65[1] = 3221225472;
  v65[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_3;
  v65[3] = &unk_251AE0EE8;
  v14 = v11;
  v66 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", v13, v65);
  v16 = -[UNCNotificationSourceSettingsDescription supportsLockScreen](self, "supportsLockScreen");
  v63[0] = v7;
  v63[1] = 3221225472;
  v63[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_4;
  v63[3] = &unk_251AE0EE8;
  v17 = v14;
  v64 = v17;
  v18 = (id)objc_msgSend(v5, "appendBool:counterpart:", v16, v63);
  v19 = -[UNCNotificationSourceSettingsDescription supportsNotificationCenter](self, "supportsNotificationCenter");
  v61[0] = v7;
  v61[1] = 3221225472;
  v61[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_5;
  v61[3] = &unk_251AE0EE8;
  v20 = v17;
  v62 = v20;
  v21 = (id)objc_msgSend(v5, "appendBool:counterpart:", v19, v61);
  v22 = -[UNCNotificationSourceSettingsDescription supportsCarPlay](self, "supportsCarPlay");
  v59[0] = v7;
  v59[1] = 3221225472;
  v59[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_6;
  v59[3] = &unk_251AE0EE8;
  v23 = v20;
  v60 = v23;
  v24 = (id)objc_msgSend(v5, "appendBool:counterpart:", v22, v59);
  v25 = -[UNCNotificationSourceSettingsDescription supportsSpoken](self, "supportsSpoken");
  v57[0] = v7;
  v57[1] = 3221225472;
  v57[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_7;
  v57[3] = &unk_251AE0EE8;
  v26 = v23;
  v58 = v26;
  v27 = (id)objc_msgSend(v5, "appendBool:counterpart:", v25, v57);
  v28 = -[UNCNotificationSourceSettingsDescription modalAlertStyle](self, "modalAlertStyle");
  v55[0] = v7;
  v55[1] = 3221225472;
  v55[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_8;
  v55[3] = &unk_251AE0EE8;
  v29 = v26;
  v56 = v29;
  v30 = (id)objc_msgSend(v5, "appendBool:counterpart:", v28, v55);
  v31 = -[UNCNotificationSourceSettingsDescription alwaysShowPreviews](self, "alwaysShowPreviews");
  v53[0] = v7;
  v53[1] = 3221225472;
  v53[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_9;
  v53[3] = &unk_251AE0EE8;
  v32 = v29;
  v54 = v32;
  v33 = (id)objc_msgSend(v5, "appendBool:counterpart:", v31, v53);
  v34 = -[UNCNotificationSourceSettingsDescription providesAppNotificationSettings](self, "providesAppNotificationSettings");
  v51[0] = v7;
  v51[1] = 3221225472;
  v51[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_10;
  v51[3] = &unk_251AE0EE8;
  v35 = v32;
  v52 = v35;
  v36 = (id)objc_msgSend(v5, "appendBool:counterpart:", v34, v51);
  v37 = -[UNCNotificationSourceSettingsDescription supportsTimeSensitive](self, "supportsTimeSensitive");
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_11;
  v49[3] = &unk_251AE0EE8;
  v38 = v35;
  v50 = v38;
  v39 = (id)objc_msgSend(v5, "appendBool:counterpart:", v37, v49);
  v40 = -[UNCNotificationSourceSettingsDescription supportsCriticalAlerts](self, "supportsCriticalAlerts");
  v44 = v7;
  v45 = 3221225472;
  v46 = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_12;
  v47 = &unk_251AE0EE8;
  v48 = v38;
  v41 = v38;
  v42 = (id)objc_msgSend(v5, "appendBool:counterpart:", v40, &v44);
  LOBYTE(v38) = objc_msgSend(v5, "isEqual", v44, v45, v46, v47);

  return (char)v38;
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "supportsSounds");
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "supportsAlerts");
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "supportsBadges");
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "supportsLockScreen");
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "supportsNotificationCenter");
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "supportsCarPlay");
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "supportsSpoken");
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "modalAlertStyle");
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "alwaysShowPreviews");
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "providesAppNotificationSettings");
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "supportsTimeSensitive");
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "supportsCriticalAlerts");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsSounds](self, "supportsSounds"));
  v5 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsAlerts](self, "supportsAlerts"));
  v6 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsBadges](self, "supportsBadges"));
  v7 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsLockScreen](self, "supportsLockScreen"));
  v8 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsNotificationCenter](self, "supportsNotificationCenter"));
  v9 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsCarPlay](self, "supportsCarPlay"));
  v10 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsSpoken](self, "supportsSpoken"));
  v11 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription modalAlertStyle](self, "modalAlertStyle"));
  v12 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription alwaysShowPreviews](self, "alwaysShowPreviews"));
  v13 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription providesAppNotificationSettings](self, "providesAppNotificationSettings"));
  v14 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsTimeSensitive](self, "supportsTimeSensitive"));
  v15 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsCriticalAlerts](self, "supportsCriticalAlerts"));
  v16 = objc_msgSend(v3, "hash");

  return v16;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsSounds](self, "supportsSounds"), CFSTR("supportsSounds"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsAlerts](self, "supportsAlerts"), CFSTR("supportsAlerts"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsBadges](self, "supportsBadges"), CFSTR("supportsBadges"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsLockScreen](self, "supportsLockScreen"), CFSTR("supportsLockScreen"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsNotificationCenter](self, "supportsNotificationCenter"), CFSTR("supportsNotificationCenter"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsCarPlay](self, "supportsCarPlay"), CFSTR("supportsCarPlay"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsSpoken](self, "supportsSpoken"), CFSTR("supportsSpoken"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription modalAlertStyle](self, "modalAlertStyle"), CFSTR("modalAlertStyle"));
  v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription alwaysShowPreviews](self, "alwaysShowPreviews"), CFSTR("alwaysShowPreviews"));
  v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription providesAppNotificationSettings](self, "providesAppNotificationSettings"), CFSTR("providesAppNotificationSettings"));
  v14 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsTimeSensitive](self, "supportsTimeSensitive"), CFSTR("supportsTimeSensitive"));
  v15 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsCriticalAlerts](self, "supportsCriticalAlerts"), CFSTR("supportsCriticalAlerts"));
  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)supportsSounds
{
  return self->_supportsSounds;
}

- (void)setSupportsSounds:(BOOL)a3
{
  self->_supportsSounds = a3;
}

- (BOOL)supportsAlerts
{
  return self->_supportsAlerts;
}

- (void)setSupportsAlerts:(BOOL)a3
{
  self->_supportsAlerts = a3;
}

- (BOOL)supportsBadges
{
  return self->_supportsBadges;
}

- (void)setSupportsBadges:(BOOL)a3
{
  self->_supportsBadges = a3;
}

- (BOOL)supportsLockScreen
{
  return self->_supportsLockScreen;
}

- (void)setSupportsLockScreen:(BOOL)a3
{
  self->_supportsLockScreen = a3;
}

- (BOOL)supportsNotificationCenter
{
  return self->_supportsNotificationCenter;
}

- (void)setSupportsNotificationCenter:(BOOL)a3
{
  self->_supportsNotificationCenter = a3;
}

- (BOOL)supportsCarPlay
{
  return self->_supportsCarPlay;
}

- (void)setSupportsCarPlay:(BOOL)a3
{
  self->_supportsCarPlay = a3;
}

- (BOOL)supportsSpoken
{
  return self->_supportsSpoken;
}

- (void)setSupportsSpoken:(BOOL)a3
{
  self->_supportsSpoken = a3;
}

- (BOOL)modalAlertStyle
{
  return self->_modalAlertStyle;
}

- (void)setModalAlertStyle:(BOOL)a3
{
  self->_modalAlertStyle = a3;
}

- (BOOL)alwaysShowPreviews
{
  return self->_alwaysShowPreviews;
}

- (void)setAlwaysShowPreviews:(BOOL)a3
{
  self->_alwaysShowPreviews = a3;
}

- (BOOL)providesAppNotificationSettings
{
  return self->_providesAppNotificationSettings;
}

- (void)setProvidesAppNotificationSettings:(BOOL)a3
{
  self->_providesAppNotificationSettings = a3;
}

- (BOOL)supportsTimeSensitive
{
  return self->_supportsTimeSensitive;
}

- (void)setSupportsTimeSensitive:(BOOL)a3
{
  self->_supportsTimeSensitive = a3;
}

- (BOOL)supportsCriticalAlerts
{
  return self->_supportsCriticalAlerts;
}

- (void)setSupportsCriticalAlerts:(BOOL)a3
{
  self->_supportsCriticalAlerts = a3;
}

@end
