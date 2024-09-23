@implementation PSSystemPolicyForApp

- (PSSystemPolicyForApp)initWithBundleIdentifier:(id)a3
{
  id v4;
  PSSystemPolicyForApp *v5;
  PSSystemPolicyForApp *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  uint64_t v11;
  BBObserver *bbObserver;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PSSystemPolicyForApp;
  v5 = -[PSSystemPolicyForApp init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PSSystemPolicyForApp setBundleIdentifier:](v5, "setBundleIdentifier:", v4);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v7 = (void *)getBBObserverClass_softClass;
    v23 = getBBObserverClass_softClass;
    if (!getBBObserverClass_softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getBBObserverClass_block_invoke;
      v19[3] = &unk_1E4A65650;
      v19[4] = &v20;
      __getBBObserverClass_block_invoke((uint64_t)v19);
      v7 = (void *)v21[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v20, 8);
    v9 = [v8 alloc];
    objc_msgSend((id)objc_opt_class(), "_bbObserverQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithQueue:", v10);
    bbObserver = v6->__bbObserver;
    v6->__bbObserver = (BBObserver *)v11;

    -[BBObserver setObserverFeed:](v6->__bbObserver, "setObserverFeed:", 512);
    -[BBObserver setDelegate:](v6->__bbObserver, "setDelegate:", v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0C8F210];
    +[PSAccountEnumerator sharedEnumerator](PSAccountEnumerator, "sharedEnumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "monitoredAccountStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel_monitoredStoreDidChange_, v14, v16);

    if (initWithBundleIdentifier__onceToken != -1)
      dispatch_once(&initWithBundleIdentifier__onceToken, &__block_literal_global_35);
  }

  return v6;
}

void __49__PSSystemPolicyForApp_initWithBundleIdentifier___block_invoke()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  _QWORD v83[6];
  _QWORD v84[6];
  _QWORD v85[13];
  _QWORD v86[13];
  _QWORD v87[24];
  _QWORD v88[24];
  _QWORD v89[24];
  _QWORD v90[26];

  v90[24] = *MEMORY[0x1E0C80C00];
  v0 = (_QWORD *)MEMORY[0x1E0DB10D0];
  v1 = *MEMORY[0x1E0DB10E8];
  v2 = (_QWORD *)MEMORY[0x1E0DB10E8];
  v89[0] = *MEMORY[0x1E0DB10D0];
  v89[1] = v1;
  v90[0] = &unk_1E4A93078;
  v90[1] = &unk_1E4A93090;
  v3 = (_QWORD *)MEMORY[0x1E0DB1198];
  v4 = (_QWORD *)MEMORY[0x1E0DB1188];
  v5 = *MEMORY[0x1E0DB1188];
  v89[2] = *MEMORY[0x1E0DB1198];
  v89[3] = v5;
  v90[2] = &unk_1E4A930A8;
  v90[3] = &unk_1E4A930C0;
  v6 = (_QWORD *)MEMORY[0x1E0DB10E0];
  v7 = (_QWORD *)MEMORY[0x1E0DB1168];
  v8 = *MEMORY[0x1E0DB1168];
  v89[4] = *MEMORY[0x1E0DB10E0];
  v89[5] = v8;
  v90[4] = &unk_1E4A930D8;
  v90[5] = &unk_1E4A930F0;
  v9 = *MEMORY[0x1E0DB10F0];
  v89[6] = *MEMORY[0x1E0DB11B8];
  v89[7] = v9;
  v90[6] = &unk_1E4A93108;
  v90[7] = &unk_1E4A93120;
  v10 = *MEMORY[0x1E0DB1170];
  v89[8] = *MEMORY[0x1E0DB1128];
  v89[9] = v10;
  v90[8] = &unk_1E4A93138;
  v90[9] = &unk_1E4A93150;
  v11 = *MEMORY[0x1E0DB11D8];
  v89[10] = *MEMORY[0x1E0DB11E8];
  v89[11] = v11;
  v90[10] = &unk_1E4A93168;
  v90[11] = &unk_1E4A93180;
  v12 = *MEMORY[0x1E0DB1140];
  v89[12] = *MEMORY[0x1E0DB1130];
  v89[13] = v12;
  v90[12] = &unk_1E4A93198;
  v90[13] = &unk_1E4A931B0;
  v13 = *MEMORY[0x1E0DB1150];
  v89[14] = *MEMORY[0x1E0DB1158];
  v89[15] = v13;
  v90[14] = &unk_1E4A931C8;
  v90[15] = &unk_1E4A931E0;
  v14 = *MEMORY[0x1E0DB11C8];
  v89[16] = *MEMORY[0x1E0DB11E0];
  v89[17] = v14;
  v90[16] = &unk_1E4A931F8;
  v90[17] = &unk_1E4A93210;
  v15 = *MEMORY[0x1E0DB1138];
  v89[18] = *MEMORY[0x1E0DB1180];
  v89[19] = v15;
  v90[18] = &unk_1E4A93228;
  v90[19] = &unk_1E4A93240;
  v16 = *MEMORY[0x1E0DB1118];
  v89[20] = *MEMORY[0x1E0DB1178];
  v89[21] = v16;
  v90[20] = &unk_1E4A93258;
  v90[21] = &unk_1E4A93270;
  v17 = *MEMORY[0x1E0DB10F8];
  v89[22] = *MEMORY[0x1E0DB11A0];
  v89[23] = v17;
  v90[22] = &unk_1E4A93288;
  v90[23] = &unk_1E4A932A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 24);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)_PSServicePolicyOptions;
  _PSServicePolicyOptions = v18;

  v87[0] = *v0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("CONTACTS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v81;
  v87[1] = *v2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("CALENDARS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v79;
  v87[2] = *v3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("REMINDERS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v77;
  v87[3] = *MEMORY[0x1E0DB11C0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("UBIQUITY"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v88[3] = v75;
  v87[4] = *v4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "localizedStringForKey:value:table:", CFSTR("PHOTOS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v88[4] = v73;
  v87[5] = *v6;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("BT_PERIPHERAL"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v88[5] = v71;
  v87[6] = *v7;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("MICROPHONE"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v88[6] = v69;
  v87[7] = *MEMORY[0x1E0DB11B8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("SPEECH_RECOGNITION"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v88[7] = v67;
  v87[8] = *MEMORY[0x1E0DB1128];
  PSLocalizablePearlStringForKey(CFSTR("FACE_ID"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v88[8] = v66;
  v87[9] = *MEMORY[0x1E0DB1170];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("MOTION"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v88[9] = v64;
  v87[10] = *MEMORY[0x1E0DB11E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("WILLOW"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v88[10] = v62;
  v87[11] = *MEMORY[0x1E0DB11D8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("PASSKEYS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v88[11] = v60;
  v87[12] = *MEMORY[0x1E0DB1140];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("KEYBOARD_NETWORKING"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v88[12] = v58;
  v87[13] = *MEMORY[0x1E0DB1158];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("MEDIALIBRARY"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v88[13] = v56;
  v87[14] = *MEMORY[0x1E0DB1150];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("TV_PROVIDER"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v88[14] = v54;
  v87[15] = *MEMORY[0x1E0DB11E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("WEBKIT_INTELLIGENT_TRACKING_PREVENTION"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v88[15] = v52;
  v87[16] = *MEMORY[0x1E0DB11C8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("CROSS_APP_TRACKING"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v88[16] = v50;
  v87[17] = *MEMORY[0x1E0DB1180];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("PASTE_BETWEEN_APPS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v88[17] = v48;
  v87[18] = *MEMORY[0x1E0DB1138];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("FOCUS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v88[18] = v46;
  v87[19] = *MEMORY[0x1E0DB1178];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("NEARBY_INTERACTIONS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v88[19] = v44;
  v87[20] = *MEMORY[0x1E0DB1118];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("EXPOSURE_NOTIFICATION"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v88[20] = v21;
  v87[21] = *MEMORY[0x1E0DB10F0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CAMERA"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v88[21] = v23;
  v87[22] = *MEMORY[0x1E0DB11A0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SECURE_ELEMENT"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v88[22] = v25;
  v87[23] = *MEMORY[0x1E0DB10F8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CONTACTLESS_NFC"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v88[23] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 24);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)_PSLocalizedServiceNames;
  _PSLocalizedServiceNames = v28;

  v30 = (void *)_PSServiceIconNames;
  _PSServiceIconNames = MEMORY[0x1E0C9AA70];

  v31 = *MEMORY[0x1E0DB10F8];
  v85[0] = *MEMORY[0x1E0DB11D8];
  v85[1] = v31;
  v86[0] = CFSTR("com.apple.graphic-icon.person-passkey");
  v86[1] = CFSTR("com.apple.graphic-icon.contactless-and-nfc");
  v32 = *MEMORY[0x1E0DB1140];
  v85[2] = *MEMORY[0x1E0DB11A0];
  v85[3] = v32;
  v86[2] = CFSTR("com.apple.graphic-icon.secure-element");
  v86[3] = CFSTR("com.apple.graphic-icon.keyboard");
  v33 = *MEMORY[0x1E0DB1168];
  v85[4] = *MEMORY[0x1E0DB10E0];
  v85[5] = v33;
  v86[4] = CFSTR("com.apple.graphic-icon.bluetooth");
  v86[5] = CFSTR("com.apple.graphic-icon.microphone-access");
  v34 = *MEMORY[0x1E0DB1128];
  v85[6] = *MEMORY[0x1E0DB11B8];
  v85[7] = v34;
  v86[6] = CFSTR("com.apple.graphic-icon.waveform");
  v86[7] = CFSTR("com.apple.graphic-icon.face-id");
  v35 = *MEMORY[0x1E0DB1150];
  v85[8] = *MEMORY[0x1E0DB1170];
  v85[9] = v35;
  v86[8] = CFSTR("com.apple.graphic-icon.motion-and-fitness");
  v86[9] = CFSTR("com.apple.graphic-icon.tv-provider");
  v36 = *MEMORY[0x1E0DB1178];
  v85[10] = *MEMORY[0x1E0DB1138];
  v85[11] = v36;
  v86[10] = CFSTR("com.apple.graphic-icon.focus");
  v86[11] = CFSTR("com.apple.graphic-icon.nearby-interactions");
  v85[12] = *MEMORY[0x1E0DB10F0];
  v86[12] = CFSTR("com.apple.graphic-icon.camera");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 13);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)_PSServiceIconTypeIDs;
  _PSServiceIconTypeIDs = v37;

  v39 = *MEMORY[0x1E0DB10E8];
  v83[0] = *MEMORY[0x1E0DB10D0];
  v83[1] = v39;
  v84[0] = CFSTR("com.apple.MobileAddressBook");
  v84[1] = CFSTR("com.apple.mobilecal");
  v40 = *MEMORY[0x1E0DB1188];
  v83[2] = *MEMORY[0x1E0DB1198];
  v83[3] = v40;
  v84[2] = CFSTR("com.apple.reminders");
  v84[3] = CFSTR("com.apple.mobileslideshow");
  v41 = *MEMORY[0x1E0DB1158];
  v83[4] = *MEMORY[0x1E0DB11E8];
  v83[5] = v41;
  v84[4] = CFSTR("com.apple.Home");
  v84[5] = CFSTR("com.apple.Music");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 6);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)_PSServiceIconApplicationBundleIdentifiers;
  _PSServiceIconApplicationBundleIdentifiers = v42;

}

+ (OS_dispatch_queue)_bbObserverQueue
{
  if (_bbObserverQueue_onceToken != -1)
    dispatch_once(&_bbObserverQueue_onceToken, &__block_literal_global_131);
  return (OS_dispatch_queue *)(id)_bbObserverQueue__bbObserverQueue;
}

void __40__PSSystemPolicyForApp__bbObserverQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.preferencesframework.gateway", v2);
  v1 = (void *)_bbObserverQueue__bbObserverQueue;
  _bbObserverQueue__bbObserverQueue = (uint64_t)v0;

}

- (id)specifiers
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void (**v8)(_QWORD);
  void *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, "PSSystemPolicyForApp.specifiers");

  PKLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v13 = "-[PSSystemPolicyForApp specifiers]";
    v14 = 2114;
    v15 = v7;
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PSSystemPolicyForApp.specifiers", "%s: %{public}@", buf, 0x16u);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__PSSystemPolicyForApp_specifiers__block_invoke;
  v11[3] = &__block_descriptor_40_e5_v8__0l;
  v11[4] = v4;
  v8 = (void (**)(_QWORD))MEMORY[0x1A8594D10](v11);
  -[PSSystemPolicyForApp specifiersForPolicyOptions:force:](self, "specifiersForPolicyOptions:force:", -134348801, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v8[2](v8);

  return v9;
}

void __34__PSSystemPolicyForApp_specifiers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  PKLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PSSystemPolicyForApp.specifiers", (const char *)&unk_1A38FDA81, v5, 2u);
  }

}

- (id)specifiersForPolicyOptions:(unint64_t)a3 force:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFURL *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t i;
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
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
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
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  self->_policyOptions = a3;
  self->_forcePolicyOptions = a4;
  v5 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (PSIsWebAppPlaceholder(v83))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = -[PSSystemPolicyForApp _isAppClip](self, "_isAppClip");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      v12 = CFSTR("ALLOW_APP_CLIP_ACCESS_FORMAT");
    else
      v12 = CFSTR("ALLOW_ACCESS_FORMAT");
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E4A69238, CFSTR("PSSystemPolicy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "ps_addPossibleObject:", v16);
    -[PSSystemPolicyForApp notificationSpecifier](self, "notificationSpecifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v17);

  }
  else
  {
    if (v83)
    {
      objc_msgSend(v83, "URL");
      v18 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v19 = CFBundleCreate(0, v18);

      if (v19)
      {
        v88[0] = MEMORY[0x1E0C809B0];
        v88[1] = 3221225472;
        v88[2] = __57__PSSystemPolicyForApp_specifiersForPolicyOptions_force___block_invoke;
        v88[3] = &__block_descriptor_40_e5_v8__0l;
        v88[4] = v19;
        v81 = (id)MEMORY[0x1A8594D10](v88);
        v20 = (void *)TCCAccessCopyInformationForBundle();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v85;
          v24 = (_QWORD *)MEMORY[0x1E0DB10B8];
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v85 != v23)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
              objc_msgSend(v26, "objectForKeyedSubscript:", *v24);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "na_safeSetObject:forKey:", v26, v27);

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
          }
          while (v22);
        }

        v28 = v81;
        if (v81)
        {
          (*((void (**)(void))v81 + 2))();
          v28 = v81;
        }

      }
    }
    else
    {
      v19 = 0;
    }
    MEMORY[0x1A859462C]();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSystemPolicyForApp privacySpecifiersWithTCCServiceLookup:tccServiceOverrides:](self, "privacySpecifiersWithTCCServiceLookup:tccServiceOverrides:", v19, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v30);

    -[PSSystemPolicyForApp calendarSpecifiers](self, "calendarSpecifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v31);

    -[PSSystemPolicyForApp assistantSpecifiers](self, "assistantSpecifiers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v32);

    -[PSSystemPolicyForApp searchSpecifiers](self, "searchSpecifiers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v33);

    -[PSSystemPolicyForApp notificationSpecifier](self, "notificationSpecifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v34);

    -[PSSystemPolicyForApp nudityDetectionSpeicier](self, "nudityDetectionSpeicier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v35);

    -[PSSystemPolicyForApp liveActivitiesSpecifier](self, "liveActivitiesSpecifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v36);

    -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB1140], v19, v29);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v37);

    -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB11C0], v19, v29);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v38);

    -[PSSystemPolicyForApp backgroundAppRefreshSpecifier](self, "backgroundAppRefreshSpecifier");
    v82 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v82);
    objc_msgSend(v83, "localizedName");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", v41, &stru_1E4A69238, CFSTR("RemovableApplications"));
      v42 = objc_claimAutoreleasedReturnValue();

      v39 = v42;
    }
    v78 = (void *)v39;
    -[PSSystemPolicyForApp wirelessDataSpecifierWithAppName:](self, "wirelessDataSpecifierWithAppName:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v43);

    -[PSSystemPolicyForApp documentsSpecifier](self, "documentsSpecifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_addPossibleObject:", v44);

    -[PSSystemPolicyForApp exposureSpecifiersWithTCCServiceLookup:](self, "exposureSpecifiersWithTCCServiceLookup:", v19);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v45);

    -[PSSystemPolicyForApp _journalingSuggestionsSpecifiers](self, "_journalingSuggestionsSpecifiers");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObjectsFromArray:", v46);

    -[PSSystemPolicyForApp contactlessNFCSpecifiers](self, "contactlessNFCSpecifiers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObjectsFromArray:", v47);

    -[PSSystemPolicyForApp contactlessNFCSideButtonSpecifiers](self, "contactlessNFCSideButtonSpecifiers");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObjectsFromArray:", v48);

    if (objc_msgSend(v83, "isEligibleWebBrowser"))
    {
      -[PSSystemPolicyForApp defaultBrowserSpecifier](self, "defaultBrowserSpecifier");
      v79 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v79 = 0;
    }
    if (objc_msgSend(v83, "isEligibleMailClient"))
    {
      -[PSSystemPolicyForApp defaultMailAppSpecifier](self, "defaultMailAppSpecifier");
      v49 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = 0;
    }
    v77 = (void *)v49;
    if (v79 | v49)
    {
      +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("DEFAULT_APP"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v50);
      objc_msgSend(v7, "ps_addPossibleObject:", v79);
      objc_msgSend(v7, "ps_addPossibleObject:", v77);

    }
    -[PSSystemPolicyForApp trackingSpecifiersWithTCCServiceLookup:tccServiceOverrides:](self, "trackingSpecifiersWithTCCServiceLookup:tccServiceOverrides:", v19, v29);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v80, "count"))
      objc_msgSend(v7, "addObjectsFromArray:", v80);
    -[PSSystemPolicyForApp pasteboardSpecifier](self, "pasteboardSpecifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("PASTEBOARD_GROUP"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v52);

      objc_msgSend(v7, "addObject:", v51);
    }
    if (objc_msgSend(v7, "count"))
    {
      v53 = (void *)MEMORY[0x1E0CB3940];
      v54 = -[PSSystemPolicyForApp _isAppClip](self, "_isAppClip");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      if (v54)
        v57 = CFSTR("ALLOW_APP_CLIP_ACCESS_FORMAT");
      else
        v57 = CFSTR("ALLOW_ACCESS_FORMAT");
      objc_msgSend(v55, "localizedStringForKey:value:table:", v57, &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringWithFormat:", v58, v78);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "insertObject:atIndex:", v60, 0);
      if (v82
        && (objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"),
            v61 = (void *)objc_claimAutoreleasedReturnValue(),
            v62 = objc_msgSend(v61, "isLowPowerModeEnabled"),
            v61,
            v62))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("ALLOW_APP_REFRESH_LPM"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v64 = 0;
      }
      if (objc_msgSend(v64, "length"))
        objc_msgSend(v60, "setProperty:forKey:", v64, CFSTR("footerText"));
      else
        objc_msgSend(v60, "removePropertyForKey:", CFSTR("footerText"));

    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("PREFERRED_LANGUAGE"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSSystemPolicyForApp preferredLanguageSpecifier](self, "preferredLanguageSpecifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v7, "addObject:", v67);
      -[PSSystemPolicyForApp preferredLanguageSpecifier](self, "preferredLanguageSpecifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ps_addPossibleObject:", v69);

    }
    -[PSSystemPolicyForApp accountsSpecifier](self, "accountsSpecifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      +[PSSpecifier groupSpecifierWithID:name:](PSSpecifier, "groupSpecifierWithID:name:", CFSTR("ACCOUNTS_GROUP"), 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v71);

      objc_msgSend(v7, "addObject:", v70);
    }
    -[PSSystemPolicyForApp familyControlsSpecifier](self, "familyControlsSpecifier");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
      objc_msgSend(v7, "ps_addPossibleObject:", v72);
    -[PSSystemPolicyForApp tapToPayScreenLockSpecifiers](self, "tapToPayScreenLockSpecifiers");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v73);

    -[PSSystemPolicyForApp tapToPayAlwaysPlaySoundSpecifiers](self, "tapToPayAlwaysPlaySoundSpecifiers");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v74);

    -[PSSystemPolicyForApp driverKitSpecifiers](self, "driverKitSpecifiers");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v75);

  }
  return v7;
}

void __57__PSSystemPolicyForApp_specifiersForPolicyOptions_force___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (BOOL)_isAppClip
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v8);

  objc_msgSend(v5, "appClipMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v6 != 0;

  return (char)v4;
}

- (id)notificationSpecifier
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if ((self->_policyOptions & 1) != 0)
  {
    +[PSNotificationSettingsController sharedInstance](PSNotificationSettingsController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionInfoForIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB34D0];
      PSBundlePathForPreferenceBundle((uint64_t)CFSTR("NotificationsSettings"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SFRuntimeAbsoluteFilePathForPath();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleWithPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      PSApplicationSpecifierForBBSection(v6, 0, (void *)objc_msgSend(v10, "classNamed:", CFSTR("NotificationCell")), objc_msgSend(v10, "classNamed:", CFSTR("BulletinBoardAppDetailController")));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOTIFICATIONS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setName:", v12);

      objc_msgSend(v2, "setIdentifier:", CFSTR("NOTIFICATIONS"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.notifications"), CFSTR("iconUTTypeIdentifier"));

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)nudityDetectionSpeicier
{
  id NudityDetectionPreferencesHelperClass;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if ((self->_policyOptions & 0x80000000000) == 0
    || !objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionFeatureEnabled"))
  {
    goto LABEL_5;
  }
  NudityDetectionPreferencesHelperClass = getNudityDetectionPreferencesHelperClass();
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(NudityDetectionPreferencesHelperClass, "nudityDetectionAvailableForBundleID:", v4))
  {
    v7 = 0;
LABEL_9:

    return v7;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_inRetailKioskMode");

  if ((v6 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB34D0];
    PSBundlePathForPreferenceBundle((uint64_t)CFSTR("CommunicationSafetySettings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SFRuntimeAbsoluteFilePathForPath();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleWithPath:", v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionRowLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getNudityDetectionPreferencesHelperClass(), "classForNudityAppDetectionSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, sel_getNudityDetectionEnabledValue, objc_msgSend(v4, "classNamed:", v13), 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v14, CFSTR("BUNDLE_ID"));

    objc_msgSend(v7, "setIdentifier:", CFSTR("NUDITY_DETECTION"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionRowEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("enabled"));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
    objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionRowIconID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("iconUTTypeIdentifier"));

    goto LABEL_9;
  }
LABEL_5:
  v7 = 0;
  return v7;
}

- (id)getNudityDetectionEnabledValue
{
  id NudityDetectionPreferencesHelperClass;
  void *v4;
  void *v5;

  NudityDetectionPreferencesHelperClass = getNudityDetectionPreferencesHelperClass();
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(NudityDetectionPreferencesHelperClass, "nudityDetectionOnOffLabelForBundleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)liveActivitiesSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if ((self->_policyOptions & 0x10000000000) != 0
    && -[PSSystemPolicyForApp _supportsLiveActivities](self, "_supportsLiveActivities"))
  {
    if (-[PSSystemPolicyForApp _supportsLiveActivitiesFrequentUpdates](self, "_supportsLiveActivitiesFrequentUpdates"))
    {
      v3 = (void *)MEMORY[0x1E0CB34D0];
      PSBundlePathForPreferenceBundle((uint64_t)CFSTR("ActivitySettings"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      SFRuntimeAbsoluteFilePathForPath();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleWithPath:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LIVE_ACTIVITIES"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, 0, 0, 0, objc_msgSend(v6, "classNamed:", CFSTR("ActivitySettingsDetailController")), 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProperty:forKey:", v10, CFSTR("BUNDLE_ID"));

      objc_msgSend(v9, "setProperty:forKey:", objc_msgSend(v6, "classNamed:", CFSTR("ActivitySettingsCell")), CFSTR("cellClass"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("LIVE_ACTIVITIES"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, sel_setLiveActivitiesEnabled_forSpecifier_, sel_isLiveActivitiesEnabled_, 0, 6, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("cellClass"));
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.live-activities"), CFSTR("iconUTTypeIdentifier"));
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)_supportsLiveActivities
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  char v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (!_os_feature_enabled_impl())
    return 0;
  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, 0);

  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v6 = (void *)getACActivityCenterClass_softClass;
  v15 = getACActivityCenterClass_softClass;
  if (!getACActivityCenterClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getACActivityCenterClass_block_invoke;
    v11[3] = &unk_1E4A65650;
    v11[4] = &v12;
    __getACActivityCenterClass_block_invoke((uint64_t)v11);
    v6 = (void *)v13[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v12, 8);
  v8 = objc_alloc_init(v7);
  if (objc_msgSend(v5, "supportsLiveActivities"))
    v9 = objc_msgSend(v8, "areActivitiesEnabled");
  else
    v9 = 0;

  return v9;
}

- (BOOL)_supportsLiveActivitiesFrequentUpdates
{
  int v3;
  id v4;
  void *v5;
  void *v6;

  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CA5870]);
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, 0);

    LOBYTE(v5) = objc_msgSend(v6, "supportsLiveActivitiesFrequentUpdates");
    LOBYTE(v3) = (_BYTE)v5;
  }
  return v3;
}

- (void)setLiveActivitiesEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = objc_alloc_init((Class)getACActivityAuthorizationClass());
  v6 = objc_msgSend(v10, "BOOLValue");
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActivitiesEnabled:forBundleId:", v6, v7);

  -[PSSystemPolicyForApp delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[PSSystemPolicyForApp delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemPolicyForApp:didUpdateForSystemPolicyOptions:withValue:", self, 0x10000000000, v10);

  }
}

- (id)isLiveActivitiesEnabled:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = objc_alloc_init((Class)getACActivityAuthorizationClass());
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "areActivitiesEnabledForBundleId:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_supportsJournalingSuggestions
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  LOBYTE(v4) = objc_msgSend(v5, "supportsJournalingSuggestions");
  return (char)v4;
}

- (id)_journalingSuggestionsSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((self->_policyOptions & 0x100000000000) != 0
    && -[PSSystemPolicyForApp _supportsJournalingSuggestions](self, "_supportsJournalingSuggestions"))
  {
    if (!MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary_0)
      MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary_0)
    {
      +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("JOURNALING_SUGGESTIONS_GROUP"), v11);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("JOURNALING_SUGGESTIONS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, NSClassFromString(CFSTR("MOSuggestionSheetPrivateAccessSettingsController")), 2, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("allowMultilineTitleKey"));
      -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("AppBundleID"));

      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("useLazyIcons"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.journaling-suggestions"), CFSTR("iconUTTypeIdentifier"));
      objc_msgSend(v3, "addObject:", v7);

    }
  }
  return v3;
}

- (id)accessoriesSpecifier
{
  PSAccessoriesPolicyController *accessoriesPrivacyController;
  PSAccessoriesPolicyController *v4;
  PSAccessoriesPolicyController *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;

  accessoriesPrivacyController = self->_accessoriesPrivacyController;
  if (!accessoriesPrivacyController)
  {
    v4 = -[PSAccessoriesPolicyController initWithAppBundleID:]([PSAccessoriesPolicyController alloc], "initWithAppBundleID:", self->_bundleIdentifier);
    v5 = self->_accessoriesPrivacyController;
    self->_accessoriesPrivacyController = v4;

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__PSSystemPolicyForApp_accessoriesSpecifier__block_invoke;
    v10[3] = &unk_1E4A687E0;
    objc_copyWeak(&v11, &location);
    -[PSAccessoriesPolicyController setAccessChangedHandler:](self->_accessoriesPrivacyController, "setAccessChangedHandler:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    accessoriesPrivacyController = self->_accessoriesPrivacyController;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACCESSORIES"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoriesPolicyController appSpecifierWithName:bundleID:](accessoriesPrivacyController, "appSpecifierWithName:bundleID:", v7, self->_bundleIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "setIdentifier:", CFSTR("ACCESSORIES"));
  return v8;
}

void __44__PSSystemPolicyForApp_accessoriesSpecifier__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifiers");

}

- (id)accountsSpecifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (_os_feature_enabled_impl() && (self->_policyOptions & 0x8000000) != 0)
  {
    +[PSAccountEnumerator sharedEnumerator](PSAccountEnumerator, "sharedEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "visibleAccountCount");

    if (v5 < 1)
    {
      PSApplicationSpecifierForAddAccountButton();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTarget:", self);
      objc_msgSend(v3, "setButtonAction:", sel__handleAddAccountButtonAction_);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PSSystemPolicyForApp _accountModificationDisabledByRestrictions](self, "_accountModificationDisabledByRestrictions") ^ 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setProperty:forKey:", v6, CFSTR("enabled"));

    }
    else
    {
      PSApplicationSpecifierForAccountsSection();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("AppBundleID"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_handleAddAccountButtonAction:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PSSystemPolicyForApp delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = v9;
  if ((v5 & 1) != 0)
  {
    v7 = objc_alloc_init((Class)objc_msgSend(v9, "detailControllerClass"));
    if (v7)
    {
      -[PSSystemPolicyForApp delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "showController:animate:", v7, 1);

    }
    v6 = v9;
  }

}

- (BOOL)_accountModificationDisabledByRestrictions
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]) == 2;

  return v3;
}

- (void)monitoredStoreDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PSSystemPolicyForApp_monitoredStoreDidChange___block_invoke;
  block[3] = &unk_1E4A654F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __48__PSSystemPolicyForApp_monitoredStoreDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifiers");

}

- (id)calendarSpecifiers
{
  void *v2;
  PSCalendarPolicyController *v4;
  PSCalendarPolicyController *calendarPrivacyController;
  PSCalendarPolicyController *v6;
  uint64_t v7;
  void *v8;

  if ((self->_policyOptions & 8) != 0)
  {
    if (!self->_calendarPrivacyController)
    {
      v4 = (PSCalendarPolicyController *)objc_opt_new();
      calendarPrivacyController = self->_calendarPrivacyController;
      self->_calendarPrivacyController = v4;

    }
    if (calendarSpecifiers_onceToken != -1)
      dispatch_once(&calendarSpecifiers_onceToken, &__block_literal_global_218);
    v6 = self->_calendarPrivacyController;
    v7 = calendarSpecifiers_specifierName;
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSCalendarPolicyController appSpecifierWithName:bundleID:](v6, "appSpecifierWithName:bundleID:", v7, v8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      objc_msgSend(v2, "setIdentifier:", CFSTR("CALENDAR"));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __42__PSSystemPolicyForApp_calendarSpecifiers__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PSCalendarPolicyController loadPrivacySettingsBundle](PSCalendarPolicyController, "loadPrivacySettingsBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CALENDARS"), &stru_1E4A69238, CFSTR("Privacy"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)calendarSpecifiers_specifierName;
  calendarSpecifiers_specifierName = v0;

}

- (id)assistantSpecifiers
{
  void *v3;
  int v4;
  void *v5;

  if ((self->_policyOptions & 0x800000) != 0
    && (objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "applicationIsInstalled:", self->_bundleIdentifier),
        v3,
        v4))
  {
    PSApplicationSpecifierForAssistantSectionForBundleId((uint64_t)self->_bundleIdentifier, 1, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", CFSTR("SIRI"));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)searchSpecifiers
{
  void *v2;

  if ((self->_policyOptions & 0x800000) != 0)
  {
    PSApplicationSpecifierForSearchSectionForBundleId(self->_bundleIdentifier, 1, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setIdentifier:", CFSTR("SEARCH"));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)dataUsageWorkspaceInfo
{
  uint64_t v2;
  const void *v3;
  NSObject *v4;
  uint8_t v6[16];
  uint64_t v7;
  PSSystemPolicyForApp *v8;
  __int128 v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  v7 = 0;
  v9 = 0u;
  v10 = 0;
  v8 = self;
  v2 = _CTServerConnectionCreate();
  if (v2)
  {
    v3 = (const void *)v2;
    _CTServerConnectionCopyCellularUsageWorkspaceInfo();
    CFRelease(v3);
  }
  _PSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the data usage workspace information", v6, 2u);
  }

  return v11;
}

- (BOOL)_isWirelessDataRestricted
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F00]);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isChinaRegionCellularDevice");

  v6 = (v5 & 1) == 0 && CTCellularDataPlanGetIsEnabled() == 0;
  return v3 == 2 || v6;
}

- (id)wirelessDataSpecifierWithAppName:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  if ((self->_policyOptions & 0x8000) == 0 || !MGGetBoolAnswer())
    goto LABEL_5;
  v5 = -[PSSystemPolicyForApp _isWirelessDataRestricted](self, "_isWirelessDataRestricted");
  objc_msgSend(0, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("enabled"));
  if (v5)
  {
    objc_msgSend(0, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("enabled"));
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v8 = (void *)getPSAppCellularUsageSpecifierClass_softClass;
  v20 = getPSAppCellularUsageSpecifierClass_softClass;
  if (!getPSAppCellularUsageSpecifierClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getPSAppCellularUsageSpecifierClass_block_invoke;
    v16[3] = &unk_1E4A65650;
    v16[4] = &v17;
    __getPSAppCellularUsageSpecifierClass_block_invoke((uint64_t)v16);
    v8 = (void *)v18[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v17, 8);
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v9, "systemPolicySpecifierForAppName:bundleID:icon:enabled:", v4, v10, v11, -[PSSystemPolicyForApp _isWirelessDataRestricted](self, "_isWirelessDataRestricted") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.wireless"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v14);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.cellular-settings"), CFSTR("iconUTTypeIdentifier"));
  v15 = (id)objc_msgSend(v6, "performGetter");
  objc_msgSend(v6, "removePropertyForKey:", CFSTR("iconImage"));
LABEL_6:

  return v6;
}

- (id)familyControlsSpecifier
{
  void *v4;
  void *v5;
  void *v6;

  if ((self->_policyOptions & 0x1000000000) == 0
    || -[PSSystemPolicyForApp _getAuthorizationRecordsStatus](self, "_getAuthorizationRecordsStatus") == 1)
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FAMILY_CONTROLS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_setFamilyControlsEnabled_forSpecifier_, sel_isFamilyControlsEnabled_, 0, 6, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.screen-time"), CFSTR("iconUTTypeIdentifier"));
  return v6;
}

- (int64_t)_getAuthorizationRecordsStatus
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(getFOAuthorizationCenterClass(), "sharedCenter", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authorizationRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = 1;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v8 = objc_msgSend(v10, "status");
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v8 = 1;
  }
LABEL_12:

  return v8;
}

- (void)setFamilyControlsEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__11;
  v26[4] = __Block_byref_object_dispose__11;
  v7 = v6;
  v27 = v7;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(getFOAuthorizationCenterClass(), "sharedCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationRecords");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
        objc_msgSend(v15, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqualToString:", v17))
        {
          objc_msgSend(v15, "recordIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }

        ++v13;
        v14 = v10;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v11);
  }

  if (-[PSSystemPolicyForApp _getAuthorizationRecordsStatus](self, "_getAuthorizationRecordsStatus") == 2)
  {
    objc_msgSend(getFOAuthorizationCenterClass(), "sharedCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62__PSSystemPolicyForApp_setFamilyControlsEnabled_forSpecifier___block_invoke;
    v21[3] = &unk_1E4A68828;
    v21[4] = v26;
    objc_msgSend(v18, "resetAuthorizationForRecordIdentifier:completionHandler:", v10, v21);
  }
  else
  {
    objc_msgSend(getFOAuthorizationCenterClass(), "sharedCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__PSSystemPolicyForApp_setFamilyControlsEnabled_forSpecifier___block_invoke_2;
    v20[3] = &unk_1E4A68828;
    v20[4] = v26;
    objc_msgSend(v18, "requestAuthorizationForRecordIdentifier:completionHandler:", v10, v20);
  }

  _Block_object_dispose(v26, 8);
}

void __62__PSSystemPolicyForApp_setFamilyControlsEnabled_forSpecifier___block_invoke(uint64_t a1, int a2)
{
  void *v2;

  if (a2)
    v2 = (void *)MEMORY[0x1E0C9AAA0];
  else
    v2 = (void *)MEMORY[0x1E0C9AAB0];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v2);
}

void __62__PSSystemPolicyForApp_setFamilyControlsEnabled_forSpecifier___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;

  if (a2)
    v2 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v2 = (void *)MEMORY[0x1E0C9AAA0];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v2);
}

- (id)isFamilyControlsEnabled:(id)a3
{
  if (-[PSSystemPolicyForApp _getAuthorizationRecordsStatus](self, "_getAuthorizationRecordsStatus", a3) == 2)
    return MEMORY[0x1E0C9AAB0];
  else
    return MEMORY[0x1E0C9AAA0];
}

- (id)backgroundAppRefreshSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((self->_policyOptions & 2) != 0
    && -[PSSystemPolicyForApp _supportsBackgroundAppRefresh](self, "_supportsBackgroundAppRefresh"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BACKGROUND_APP_REFRESH"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel_setBackgroundRefreshEnabled_forSpecifier_, sel_isBackgroundRefreshEnabled_, 0, 6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("cellClass"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PSSystemPolicyForApp _isBackgroundAppRefreshAllowed](self, "_isBackgroundAppRefreshAllowed") ^ 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v6, CFSTR("enabled"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.background-app-refresh"), CFSTR("iconUTTypeIdentifier"));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)_supportsBackgroundAppRefresh
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, 0);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v5, "UIBackgroundModes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("remote-notification")) & 1) != 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("newsstand-content")) & 1) != 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("fetch")) & 1) != 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("processing")) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (BOOL)_isBackgroundAppRefreshAllowed
{
  void *v2;
  char v3;
  int v4;
  void *v5;
  int v6;
  int v7;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  if ((v3 & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAutomaticAppUpdatesAllowed");
    v7 = objc_msgSend(v5, "isAutomaticAppUpdatesModificationAllowed");
    v4 = v6 & v7 ^ 1 | objc_msgSend(v5, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x1E0D46F70]);

  }
  return v4;
}

- (void)setBackgroundRefreshEnabled:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("KeepAppsUpToDateAppList"), CFSTR("com.apple.mt"));
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
    v6 = (void *)objc_opt_new();
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v12, v7);

  CFPreferencesSetAppValue(CFSTR("KeepAppsUpToDateAppList"), v6, CFSTR("com.apple.mt"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.mt"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kKeepAppsUpToDateEnabledChangedNotification"), 0, 0, 1u);
  -[PSSystemPolicyForApp delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[PSSystemPolicyForApp delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemPolicyForApp:didUpdateForSystemPolicyOptions:withValue:", self, 2, v12);

  }
}

- (id)isBackgroundRefreshEnabled:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLowPowerModeEnabled");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("KeepAppsUpToDateAppList"), CFSTR("com.apple.mt"));
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
      v6 = (void *)v9;
    else
      v6 = (void *)MEMORY[0x1E0C9AAB0];

  }
  return v6;
}

- (id)photosServicesSpecifier
{
  void *v2;
  PSPhotosPolicyController *photosPrivacyController;
  PSPhotosPolicyController *v5;
  PSPhotosPolicyController *v6;
  void *v7;
  void *v8;
  void *v9;

  if ((self->_policyOptions & 0x20) != 0)
  {
    photosPrivacyController = self->_photosPrivacyController;
    if (!photosPrivacyController)
    {
      v5 = (PSPhotosPolicyController *)objc_opt_new();
      v6 = self->_photosPrivacyController;
      self->_photosPrivacyController = v5;

      photosPrivacyController = self->_photosPrivacyController;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PHOTOS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSPhotosPolicyController appSpecifierWithName:bundleID:](photosPrivacyController, "appSpecifierWithName:bundleID:", v8, v9);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(v2, "setIdentifier:", CFSTR("PHOTOS"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobileslideshow"), CFSTR("appIDForLazyIcon"));
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)walletSpecifier
{
  void *v2;
  PSWalletPolicyController *v4;
  void *v5;
  PSWalletPolicyController *v6;
  PSWalletPolicyController *walletPrivacyController;

  if ((self->_policyOptions & 0x800000000000) != 0)
  {
    v4 = [PSWalletPolicyController alloc];
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PSWalletPolicyController initWithBundleIdentifier:](v4, "initWithBundleIdentifier:", v5);
    walletPrivacyController = self->_walletPrivacyController;
    self->_walletPrivacyController = v6;

    -[PSWalletPolicyController specifier](self->_walletPrivacyController, "specifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)contactsServicesSpecifier
{
  void *v2;
  PSContactsPolicyController *contactsPrivacyController;
  PSContactsPolicyController *v5;
  PSContactsPolicyController *v6;
  void *v7;
  void *v8;
  void *v9;

  if ((self->_policyOptions & 4) != 0)
  {
    contactsPrivacyController = self->_contactsPrivacyController;
    if (!contactsPrivacyController)
    {
      v5 = (PSContactsPolicyController *)objc_opt_new();
      v6 = self->_contactsPrivacyController;
      self->_contactsPrivacyController = v5;

      contactsPrivacyController = self->_contactsPrivacyController;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CONTACTS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSContactsPolicyController appSpecifierWithName:bundleID:](contactsPrivacyController, "appSpecifierWithName:bundleID:", v8, v9);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(v2, "setIdentifier:", CFSTR("CONTACTS"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.MobileAddressBook"), CFSTR("appIDForLazyIcon"));
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)getMulticastAllowed:(BOOL *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_msgSend(MEMORY[0x1E0CD0828], "copyAggregatePathRules");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "matchSigningIdentifier", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          v13 = objc_msgSend(v10, "multicastPreferenceSet");

          if (v13)
          {
            if (a3)
              *a3 = 1;
            v14 = objc_msgSend(v10, "denyMulticast") ^ 1;
            goto LABEL_16;
          }
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  LOBYTE(v14) = 0;
LABEL_16:

  return v14;
}

- (void)setupNetworkConfiguration
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;
  char v9;

  v9 = 0;
  -[PSSystemPolicyForApp getMulticastAllowed:](self, "getMulticastAllowed:", &v9);
  if (v9)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CD07F0], "sharedManagerForAllUsers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__PSSystemPolicyForApp_setupNetworkConfiguration__block_invoke;
    v6[3] = &unk_1E4A68850;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "setChangedQueue:andHandler:", v4, v6);

    -[PSSystemPolicyForApp loadNetworkConfigurationsForceRefresh:](self, "loadNetworkConfigurationsForceRefresh:", 0);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__PSSystemPolicyForApp_setupNetworkConfiguration__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "loadNetworkConfigurationsForceRefresh:", 1);

}

- (void)loadNetworkConfigurationsForceRefresh:(BOOL)a3
{
  BOOL v3;
  void *v5;
  _QWORD v6[5];

  if (self->_pathControllerConfiguration)
    v3 = !a3;
  else
    v3 = 0;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CD07F0], "sharedManagerForAllUsers", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__PSSystemPolicyForApp_loadNetworkConfigurationsForceRefresh___block_invoke;
    v6[3] = &unk_1E4A67DB0;
    v6[4] = self;
    objc_msgSend(v5, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v6);

  }
}

void __62__PSSystemPolicyForApp_loadNetworkConfigurationsForceRefresh___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _PSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__PSSystemPolicyForApp_loadNetworkConfigurationsForceRefresh___block_invoke_cold_1((uint64_t)v6, v7);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "name", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.preferences.networkprivacy")))
        {
          objc_msgSend(v13, "pathController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            continue;
          v16 = *(_QWORD *)(a1 + 32);
          v17 = v13;
          v14 = *(void **)(v16 + 72);
          *(_QWORD *)(v16 + 72) = v17;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void)saveNetworkConfiguration
{
  NEConfiguration *v2;
  void *v3;
  NEConfiguration *v4;
  _QWORD v5[4];
  NEConfiguration *v6;

  v2 = self->_pathControllerConfiguration;
  objc_msgSend(MEMORY[0x1E0CD07F0], "sharedManagerForAllUsers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PSSystemPolicyForApp_saveNetworkConfiguration__block_invoke;
  v5[3] = &unk_1E4A67C70;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "saveConfiguration:withCompletionQueue:handler:", v4, MEMORY[0x1E0C80D38], v5);

}

void __48__PSSystemPolicyForApp_saveNetworkConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _PSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__PSSystemPolicyForApp_saveNetworkConfiguration__block_invoke_cold_1((uint64_t)v3, a1, v4);

  }
}

- (id)pathRuleForBundleID:(id)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NEConfiguration pathController](self->_pathControllerConfiguration, "pathController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v7, "pathRules", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "matchSigningIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v6);

        if (v15)
        {
          v16 = v13;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (v4)
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0838]), "initWithSigningIdentifier:", v6);
    objc_msgSend(v7, "pathRules");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v7, "pathRules");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayByAddingObject:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPathRules:", v18);

    }
    else
    {
      v24 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPathRules:", v8);
    }
LABEL_13:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)setLocalNetworkEnabled:(id)a3 specifier:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSystemPolicyForApp pathRuleForBundleID:create:](self, "pathRuleForBundleID:create:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDenyMulticast:", objc_msgSend(v10, "BOOLValue") ^ 1);
  objc_msgSend(v6, "setMulticastPreferenceSet:", 1);
  -[PSSystemPolicyForApp saveNetworkConfiguration](self, "saveNetworkConfiguration");
  -[PSSystemPolicyForApp delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PSSystemPolicyForApp delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemPolicyForApp:didUpdateForSystemPolicyOptions:withValue:", self, 0x4000000, v10);

  }
}

- (id)isLocalNetworkEnabled:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_pathControllerConfiguration)
  {
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSystemPolicyForApp pathRuleForBundleID:create:](self, "pathRuleForBundleID:create:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v5, "denyMulticast") ^ 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSSystemPolicyForApp getMulticastAllowed:](self, "getMulticastAllowed:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)networkServicesSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v8;

  if ((self->_policyOptions & 0x4000000) == 0)
    return 0;
  if (!_os_feature_enabled_impl())
    return 0;
  v8 = 0;
  -[PSSystemPolicyForApp getMulticastAllowed:](self, "getMulticastAllowed:", &v8);
  if (!v8)
    return 0;
  -[PSSystemPolicyForApp setupNetworkConfiguration](self, "setupNetworkConfiguration");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOCAL_NETWORK_PRIVACY"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel_setLocalNetworkEnabled_specifier_, sel_isLocalNetworkEnabled_, 0, 6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v6, CFSTR("PUINetworkApplicationKey"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.local-network"), CFSTR("iconUTTypeIdentifier"));
  return v5;
}

- (id)locationServicesSpecifier
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if ((self->_policyOptions & 0x10000) != 0)
  {
    v4 = (void *)CLCopyAppsUsingLocation();
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(MEMORY[0x1E0C9E3C8], "primaryEntityClassForLocationDictionary:", v6) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LOCATION_SERVICES"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, sel_locationStatus_, NSClassFromString(CFSTR("PUILocationServicesAuthorizationLevelController")), 2, 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PSSystemPolicyForApp _isLocationServicesRestricted](self, "_isLocationServicesRestricted") ^ 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setProperty:forKey:", v9, CFSTR("enabled"));

      -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setProperty:forKey:", v10, CFSTR("id"));

      objc_msgSend(v2, "setProperty:forKey:", NSClassFromString(CFSTR("PSUILocationServicesAuthLevelCell")), CFSTR("cellClass"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.location"), CFSTR("iconUTTypeIdentifier"));
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)_isLocationServicesRestricted
{
  BOOL v2;

  v2 = +[PSSystemPolicyForApp isServiceRestricted:](PSSystemPolicyForApp, "isServiceRestricted:", CFSTR("location"));
  return objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled") ^ 1 | v2;
}

- (id)locationStatus:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = (void *)CLCopyAppsUsingLocation();
  v5 = (void *)MEMORY[0x1E0C9E3C8];
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "entityAuthorizationForLocationDictionary:", v7);

  -[PSSystemPolicyForApp authLevelStringForStatus:](self, "authLevelStringForStatus:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)authLevelStringForStatus:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("NEVER_AUTHORIZATION");
LABEL_10:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E4A69238, CFSTR("LocationServicesPrivacy"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("NOT_DETERMINED_AUTHORIZATION_SHORT");
    goto LABEL_10;
  }
  if ((a3 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("ALWAYS_AUTHORIZATION");
    goto LABEL_10;
  }
  if ((a3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("WHEN_IN_USE_AUTHORIZATION_SHORT");
    goto LABEL_10;
  }
  v3 = 0;
  return v3;
}

- (id)privacySpecifiersWithTCCServiceLookup:(id)a3 tccServiceOverrides:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
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

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSystemPolicyForApp locationServicesSpecifier](self, "locationServicesSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v9);

  if (_os_feature_enabled_impl())
    -[PSSystemPolicyForApp contactsServicesSpecifier](self, "contactsServicesSpecifier");
  else
    -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB10D0], v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v10);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB1198], v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v11);

  -[PSSystemPolicyForApp photosServicesSpecifier](self, "photosServicesSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v12);

  -[PSSystemPolicyForApp accessoriesSpecifier](self, "accessoriesSpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v13);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB10E0], v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v14);

  -[PSSystemPolicyForApp networkServicesSpecifier](self, "networkServicesSpecifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v15);

  +[PSCapabilityManager sharedManager](PSCapabilityManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "capabilityBoolAnswer:", CFSTR("9RryeqF6OCWlbaXP2Qsoag"));

  if (v17)
  {
    -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB1178], v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ps_addPossibleObject:", v18);

  }
  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB1168], v6, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v19);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB11B8], v6, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v20);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB1170], v6, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v21);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB10F0], v6, v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v22);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB1128], v6, v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v23);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB10F8], v6, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v24);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB11A0], v6, v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v25);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB11E8], v6, v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v26);

  -[PSSystemPolicyForApp walletSpecifier](self, "walletSpecifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v27);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB1158], v6, v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v28);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB1150], v6, v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v29);

  if (_os_feature_enabled_impl())
  {
    -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB1138], v6, v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ps_addPossibleObject:", v30);

  }
  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB11D8], v6, v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ps_addPossibleObject:", v31);

  return v8;
}

- (id)privacySpecifierForService:(__CFString *)a3 tccServiceLookup:(id)a4 tccServiceOverrides:(id)a5
{
  id v8;
  id v9;
  unint64_t policyOptions;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  _BOOL4 v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v42;
  int v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;

  v8 = a4;
  v9 = a5;
  policyOptions = self->_policyOptions;
  objc_msgSend((id)_PSServicePolicyOptions, "objectForKey:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue") & policyOptions;

  if (v12)
  {
    v13 = objc_msgSend(v9, "containsObject:", a3);
    objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_opt_class();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DB10A8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (v19)
    {
      if (!v13)
        goto LABEL_14;
    }
    else if (!self->_forcePolicyOptions)
    {
      v22 = 0;
      v17 = 0;
      goto LABEL_44;
    }

    v17 = (void *)MEMORY[0x1E0C9AAA0];
LABEL_14:
    objc_msgSend((id)_PSLocalizedServiceNames, "objectForKey:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, sel_setPrivacyAccess_forSpecifier_, sel_privacyAccessForSpecifier_, 0, 6, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0DB1150]))
      objc_msgSend(v22, "setProperty:forKey:", objc_opt_class(), CFSTR("cellClass"));
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0DB11A0])
      && (!objc_opt_class() || !objc_msgSend(MEMORY[0x1E0D89678], "isSecureElementTCCServiceEligible"))
      || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0DB10F8])
      && (!objc_opt_class() || !objc_msgSend(MEMORY[0x1E0D89678], "isContactlessTCCServiceEligible")))
    {
      v20 = 0;
LABEL_45:

      goto LABEL_46;
    }
    v43 = v13;
    objc_msgSend(v22, "setProperty:forKey:", a3, CFSTR("service"));
    +[PKIconImageCache settingsIconCache](PKIconImageCache, "settingsIconCache");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_PSServiceIconNames, "objectForKey:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageForKey:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      goto LABEL_24;
    v26 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend((id)_PSServiceIconNames, "objectForKey:", a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageNamed:inBundle:compatibleWithTraitCollection:", v27, v28, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
LABEL_24:
      objc_msgSend(v22, "setProperty:forKey:", v25, CFSTR("iconImage"));
      v29 = 0;
    }
    else
    {
      v29 = 1;
    }
    objc_msgSend((id)_PSServiceIconTypeIDs, "objectForKeyedSubscript:", a3);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v29 && v30)
    {
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, CFSTR("iconUTTypeIdentifier"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
    }
    v42 = v31;
    objc_msgSend((id)_PSServiceIconApplicationBundleIdentifiers, "objectForKeyedSubscript:", a3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      v33 = v29;
    else
      v33 = 0;
    if (v33 == 1)
    {
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("appIDForLazyIcon"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
    }
    v34 = +[PSSystemPolicyForApp isServiceRestricted:](PSSystemPolicyForApp, "isServiceRestricted:", a3);
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0DB11C8]))
    {
      v45 = 0;
      v46 = &v45;
      v47 = 0x2050000000;
      v35 = (void *)getADTrackingTransparencyClass_softClass;
      v48 = getADTrackingTransparencyClass_softClass;
      if (!getADTrackingTransparencyClass_softClass)
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __getADTrackingTransparencyClass_block_invoke;
        v44[3] = &unk_1E4A65650;
        v44[4] = &v45;
        __getADTrackingTransparencyClass_block_invoke((uint64_t)v44);
        v35 = (void *)v46[3];
      }
      v36 = objc_retainAutorelease(v35);
      _Block_object_dispose(&v45, 8);
      v37 = (void *)objc_opt_new();
      if ((objc_msgSend(v37, "crossAppTrackingAllowedSwitchEnabled") & 1) == 0)
      {

        v34 = 1;
        v17 = (void *)MEMORY[0x1E0C9AAA0];
      }

    }
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0DB11E0]))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "BOOLValue") ^ 1);
      v38 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v38;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v34 | v43) ^ 1u);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setProperty:forKey:", v39, CFSTR("enabled"));
    objc_msgSend(v22, "propertyForKey:", CFSTR("cellObject"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setCellEnabled:", objc_msgSend(v39, "BOOLValue"));

    objc_msgSend(v22, "setProperty:forKey:", v17, CFSTR("value"));
LABEL_44:
    v22 = v22;
    v20 = v22;
    goto LABEL_45;
  }
  v20 = 0;
LABEL_46:

  return v20;
}

- (void)setPrivacyAccess:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  char v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
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
  uint64_t v42;
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
  _QWORD v59[5];
  _QWORD v60[4];
  id v61;
  id v62;
  PSSystemPolicyForApp *v63;
  void (**v64)(_QWORD, _QWORD, _QWORD, _QWORD);
  const __CFString *v65;
  _QWORD v66[5];
  _QWORD v67[5];
  _QWORD v68[4];
  id v69;
  id v70;
  PSSystemPolicyForApp *v71;
  void (**v72)(_QWORD, _QWORD, _QWORD, _QWORD);
  const __CFString *v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id location[2];

  v6 = a3;
  v7 = a4;
  objc_initWeak(location, self);
  v8 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:allowPlaceholder:error:", v9, 1, 0);

  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke;
  v74[3] = &unk_1E4A68878;
  objc_copyWeak(&v77, location);
  v11 = v10;
  v75 = v11;
  v12 = v6;
  v76 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A8594D10](v74);
  objc_msgSend(v7, "propertyForKey:", CFSTR("value"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqual:", v14);

  if ((v15 & 1) == 0)
  {
    v16 = (const __CFString *)objc_msgSend(v7, "propertyForKey:", CFSTR("service"));
    if (CFStringCompare(v16, (CFStringRef)*MEMORY[0x1E0DB11E0], 0) == kCFCompareEqualTo)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "BOOLValue") ^ 1);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v17;
    }
    if (objc_msgSend(v12, "BOOLValue")
      && CFStringCompare(v16, (CFStringRef)*MEMORY[0x1E0DB11C8], 0) == kCFCompareEqualTo)
    {
      v56 = (void *)MEMORY[0x1E0CEA2E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("CROSS_APP_TRACKING"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CROSS_APP_TRACKING_PROMPT"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "alertControllerWithTitle:message:preferredStyle:", v18, v20, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ALLOW"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_339;
      v68[3] = &unk_1E4A688A0;
      v72 = v13;
      v69 = v12;
      v73 = v16;
      v70 = v7;
      v71 = self;
      objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, v68);
      v24 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v57, "addAction:", v24);
      v55 = (void *)v24;
      v25 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_2_343;
      v67[3] = &unk_1E4A65BF8;
      v67[4] = self;
      objc_msgSend(v25, "actionWithTitle:style:handler:", v27, 0, v67);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v57, "addAction:", v28);
      v29 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_3;
      v66[3] = &unk_1E4A65BF8;
      v66[4] = self;
      objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 0, v66);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v57, "addAction:", v32);
      -[PSSystemPolicyForApp delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "showController:animate:", v57, 1);

      v34 = v72;
    }
    else
    {
      if ((objc_msgSend(v12, "BOOLValue") & 1) != 0 || CFStringCompare(v16, (CFStringRef)*MEMORY[0x1E0DB11A0], 0))
      {
        ((void (**)(_QWORD, id, const __CFString *, id))v13)[2](v13, v12, v16, v7);
        goto LABEL_12;
      }
      v58 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("SECURE_ELEMENT_PROMPT_TITLE"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringWithFormat:", v36, v37);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("SECURE_ELEMENT_PROMPT_DETAIL"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedName");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", v40, v41);
      v42 = objc_claimAutoreleasedReturnValue();

      v53 = (void *)v42;
      objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v57, v42, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("TCC_ALERT_TURN_OFF"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_4;
      v60[3] = &unk_1E4A688A0;
      v64 = v13;
      v61 = v12;
      v65 = v16;
      v62 = v7;
      v63 = self;
      objc_msgSend(v44, "actionWithTitle:style:handler:", v46, 2, v60);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addAction:", v47);

      v48 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("TCC_ALERT_CANCEL"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_5;
      v59[3] = &unk_1E4A65BF8;
      v59[4] = self;
      objc_msgSend(v48, "actionWithTitle:style:handler:", v50, 1, v59);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addAction:", v51);

      -[PSSystemPolicyForApp delegate](self, "delegate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "showController:animate:", v43, 1);

      v34 = v53;
    }

  }
LABEL_12:

  objc_destroyWeak(&v77);
  objc_destroyWeak(location);

}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke(uint64_t a1, void *a2, const __CFString *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  const __CFURL *v11;
  CFBundleRef v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  CFBundleRef v27;
  const __CFString *v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v10, "URL");
    v11 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v12 = CFBundleCreate(0, v11);

    if (v12)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_2;
      v24 = &unk_1E4A65BA8;
      v27 = v12;
      v28 = a3;
      v25 = WeakRetained;
      v26 = *(id *)(a1 + 40);
      v13 = (void (**)(_QWORD))MEMORY[0x1A8594D10](&v21);
      objc_msgSend(v7, "BOOLValue", v21, v22, v23, v24, v25);
      if (TCCAccessSetForBundle())
      {
        if (CFStringCompare(a3, (CFStringRef)*MEMORY[0x1E0DB11E0], 0) == kCFCompareEqualTo)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "BOOLValue") ^ 1);
          v14 = objc_claimAutoreleasedReturnValue();

          v7 = (id)v14;
        }
        objc_msgSend(v8, "setProperty:forKey:", v7, CFSTR("value"));
      }
      if (v13)
        v13[2](v13);

    }
  }
  v15 = (void *)TCCAccessCopyBundleIdentifiersForService();
  if (!objc_msgSend(v15, "count"))
  {
    _PSLoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[PSSystemPolicyForApp setPrivacyAccess:forSpecifier:]_block_invoke";
      _os_log_impl(&dword_1A3819000, v16, OS_LOG_TYPE_DEFAULT, "%s: all apps were disabled for kTCCServiceUserTracking. Resetting ad identifier.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clearAdvertisingIdentifier");

  }
  if (objc_msgSend(*(id *)(a1 + 40), "BOOLValue"))
    v18 = 3;
  else
    v18 = 2;
  objc_msgSend(MEMORY[0x1E0D8D658], "trackingStateOfRequestForSpecificApp:view:", v18, CFSTR("AppSettings"));
  _PSLoggingFacility();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "bundleIdentifier");
    v20 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v20;
    _os_log_impl(&dword_1A3819000, v19, OS_LOG_TYPE_DEFAULT, "########### Quitting application (%@) in response to privacy settings change.", buf, 0xCu);

  }
}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  CFRelease(*(CFTypeRef *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend((id)_PSServicePolicyOptions, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemPolicyForApp:didUpdateForSystemPolicyOptions:withValue:", *(_QWORD *)(a1 + 32), objc_msgSend(v5, "unsignedLongLongValue"), *(_QWORD *)(a1 + 40));

  }
}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_339(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSpecifiers");

}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_2_343(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifiers");

}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSpecifiers");

  v4 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showController:animate:", v4, 1);

}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_4(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSpecifiers");

}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifiers");

}

- (id)privacyAccessForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "propertyForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v5 = v3;

  return v5;
}

- (id)pasteboardSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  if ((self->_policyOptions & 0x20000000000) == 0
    || !-[PSSystemPolicyForApp shouldShowPasteboardSpecifier](self, "shouldShowPasteboardSpecifier"))
  {
    return 0;
  }
  objc_msgSend((id)_PSLocalizedServiceNames, "objectForKey:", *MEMORY[0x1E0DB1180]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v3, self, sel_setPasteboardAccess_forSpecifier_, sel_pasteboardAccessForSpecifier_, objc_opt_class(), 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PASTE_BETWEEN_APPS_ASK"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PASTE_BETWEEN_APPS_DENY"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PASTE_BETWEEN_APPS_ALLOW"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValues:titles:", &unk_1E4A92E08, v11);

  return v4;
}

- (BOOL)shouldShowPasteboardSpecifier
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v12;
  id v13;
  id v14;

  v3 = *MEMORY[0x1E0DB1180];
  v13 = 0;
  v14 = 0;
  v12 = 0;
  PSGetAuthorizationStatesForService(v3, &v14, &v13, &v12);
  v4 = v14;
  v5 = v13;
  v6 = v12;
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsObject:", v9) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "containsObject:", v10);

    }
  }

  return v8;
}

- (id)pasteboardAccessForSpecifier:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0DB1180];
  v19 = 0;
  v20 = 0;
  v18 = 0;
  PSGetAuthorizationStatesForService(v4, &v20, &v19, &v18);
  v5 = v20;
  v6 = v19;
  v7 = v18;
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "containsObject:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = &unk_1E4A932E8;
  }
  else
  {
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "containsObject:", v11);

    if ((v12 & 1) != 0)
    {
      v10 = &unk_1E4A932B8;
    }
    else
    {
      -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v7, "containsObject:", v13);

      if ((v14 & 1) != 0)
      {
        v10 = &unk_1E4A932D0;
      }
      else
      {
        _PSLoggingFacility();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v22 = "-[PSSystemPolicyForApp pasteboardAccessForSpecifier:]";
          v23 = 2112;
          v24 = v16;
          _os_log_impl(&dword_1A3819000, v15, OS_LOG_TYPE_DEFAULT, "%s: couldn't find auth state for %@", buf, 0x16u);

        }
        v10 = &unk_1E4A93300;
      }
    }
  }

  return v10;
}

- (void)setPasteboardAccess:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = *MEMORY[0x1E0DB1180];
  v6 = a3;
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  PSSetTCCLevelForService(v5, v8, v7);
}

+ (BOOL)isServiceRestricted:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "containsObject:", v3);
  else
    v6 = 0;

  return v6;
}

- (id)trackingSpecifiersWithTCCServiceLookup:(id)a3 tccServiceOverrides:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB11E0], v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ps_addPossibleObject:", v10);

  -[PSSystemPolicyForApp privacySpecifierForService:tccServiceLookup:tccServiceOverrides:](self, "privacySpecifierForService:tccServiceLookup:tccServiceOverrides:", *MEMORY[0x1E0DB11C8], v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "ps_addPossibleObject:", v11);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("TRACKING_GROUP"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);
    objc_msgSend(v12, "addObjectsFromArray:", v9);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)headerLinkWasTapped
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/privacy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", v2, MEMORY[0x1E0C9AA70], 0);

}

- (id)documentsSpecifier
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  if ((self->_policyOptions & 0x400000) != 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CA5870]);
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, 0);

    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "isFileURL"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "infoDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("UISupportsDocumentBrowser"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DOCUMENT_STORAGE"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, sel_documentSource_, objc_opt_class(), 2, 0);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "setIdentifier:", CFSTR("DOCUMENT_STORAGE"));
        objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
        objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.DocumentsApp"), CFSTR("appIDForLazyIcon"));
        -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setProperty:forKey:", v15, PSDocumentBundleIdentifierKey);

      }
      else
      {
        v2 = 0;
      }

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)documentSource:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v21 = 0;
  v5 = dispatch_semaphore_create(0);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v6 = (void *)getDOCDocumentSourceClass_softClass;
  v26 = getDOCDocumentSourceClass_softClass;
  v7 = MEMORY[0x1E0C809B0];
  if (!getDOCDocumentSourceClass_softClass)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __getDOCDocumentSourceClass_block_invoke;
    v22[3] = &unk_1E4A65650;
    v22[4] = &v23;
    __getDOCDocumentSourceClass_block_invoke((uint64_t)v22);
    v6 = (void *)v24[3];
  }
  v8 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v23, 8);
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __39__PSSystemPolicyForApp_documentSource___block_invoke;
  v13[3] = &unk_1E4A67FC8;
  v15 = &v16;
  v10 = v5;
  v14 = v10;
  objc_msgSend(v8, "defaultSourceForBundleIdentifier:completionBlock:", v9, v13);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

intptr_t __39__PSSystemPolicyForApp_documentSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "displayName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)contactlessNFCSpecifiers
{
  PSNFCDefaultAppSpecifier *v4;
  void *v5;
  void *v6;
  PSNFCDefaultAppSpecifier *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if ((self->_policyOptions & 0x8000000000000) == 0)
    return 0;
  v4 = [PSNFCDefaultAppSpecifier alloc];
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSystemPolicyForApp delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PSNFCDefaultAppSpecifier initWithBundleID:delegate:onChange:](v4, "initWithBundleID:delegate:onChange:", v5, v6, &__block_literal_global_389);

  -[PSNFCDefaultAppSpecifier context](v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v8, "shouldShowDefaultNFCAppPicker");

  if ((_DWORD)v5)
  {
    +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("NFC_DEFAULT_APP_GROUP"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)contactlessNFCSideButtonSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if ((self->_policyOptions & 0x10000000000000) == 0)
    return 0;
  -[PSSystemPolicyForApp nfcContext](self, "nfcContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0D89660];
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58__PSSystemPolicyForApp_contactlessNFCSideButtonSpecifiers__block_invoke;
    v23[3] = &unk_1E4A654F0;
    v23[4] = self;
    objc_msgSend(v4, "contextWithBundleId:onChange:", v5, v23);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSystemPolicyForApp setNfcContext:](self, "setNfcContext:", v6);

  }
  -[PSSystemPolicyForApp nfcContext](self, "nfcContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "doubleClickToggleVisibilityType");

  if (v8 == 2)
    return 0;
  v10 = MGGetSInt32Answer();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 == 2)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DOUBLE_CLICK_SIDE_BUTTON"), &stru_1E4A69238, CFSTR("ContactlessAndCredentialSettings_Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("DOUBLE_CLICK_SIDE_BUTTON_FOOTER");
  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DOUBLE_CLICK_HOME_BUTTON"), &stru_1E4A69238, CFSTR("ContactlessAndCredentialSettings_Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("DOUBLE_CLICK_HOME_BUTTON_FOOTER");
  }
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E4A69238, CFSTR("ContactlessAndCredentialSettings_Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("DOUBLE_CLICK_FOR_NFC_GROUP"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("footerText"));
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, sel_setDoubleClickForNFC_specifier_, sel_getDoubleClickForNFC_, 0, 6, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIdentifier:", CFSTR("DOUBLE_CLICK_FOR_NFC"));
  -[PSSystemPolicyForApp nfcContext](self, "nfcContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "doubleClickToggleVisibilityType");

  if (v21 == 1)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("enabled"));
  v24[0] = v18;
  v24[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __58__PSSystemPolicyForApp_contactlessNFCSideButtonSpecifiers__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifiers");

}

- (id)getDoubleClickForNFC:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PSSystemPolicyForApp nfcContext](self, "nfcContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isDoubleClickEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setDoubleClickForNFC:(id)a3 specifier:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  -[PSSystemPolicyForApp nfcContext](self, "nfcContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setDoubleClickEnabled:", v6);
}

- (id)exposureSpecifiersWithTCCServiceLookup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  Class v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if ((self->_policyOptions & 0x100000000) == 0)
  {
    v5 = 0;
    goto LABEL_14;
  }
  if (!-[PSSystemPolicyForApp enServiceMatched](self, "enServiceMatched"))
  {
    -[PSSystemPolicyForApp setEnServiceMatched:](self, "setEnServiceMatched:", 1);
    -[PSSystemPolicyForApp matchingBundleIdentifier](self, "matchingBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_7:

      goto LABEL_8;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DB1118]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSystemPolicyForApp setMatchingBundleIdentifier:](self, "setMatchingBundleIdentifier:", v6);
      goto LABEL_7;
    }
  }
LABEL_8:
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PSSystemPolicyForApp matchingBundleIdentifier](self, "matchingBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PSBundlePathForPreferenceBundle((uint64_t)CFSTR("ExposureNotificationSettingsUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = NSClassFromString(CFSTR("ENUIRegionDetailsViewController"));
    if (v12
      || (objc_msgSend(v11, "load"), (v12 = NSClassFromString(CFSTR("ENUIRegionDetailsViewController"))) != 0))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("EXPOSURE_NOTIFICATION"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, 0, 0, 0, v12, 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUserInfo:", v16);

      objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.exposure-notifications"), CFSTR("iconUTTypeIdentifier"));
      objc_msgSend(v8, "addObject:", v15);

    }
  }
  v5 = (void *)objc_msgSend(v8, "copy");

LABEL_14:
  return v5;
}

- (id)preferredLanguageSpecifier
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  int v24;
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

  if ((self->_policyOptions & 0x2000000) == 0)
    return 0;
  v4 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, 0);

  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "isFileURL"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "normalizedLocalizations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v10;
    objc_msgSend(v14, "preferredLocalizationsFromArray:forPreferences:", v10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0D3EFB0];
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferredLanguageForBundleID:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "isEqualToString:", v17);
    if (v13 > 1)
    {
      v24 = 0;
    }
    else
    {
      objc_msgSend(v9, "objectForInfoDictionaryKey:", CFSTR("UIPrefersShowingLanguageSettings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");

      v24 = v23 ^ 1;
    }
    if (v11 < 2)
      v24 = 1;
    if ((v21 & v24 & 1) != 0)
    {
      v25 = 0;
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB34D0];
      PSBundlePathForPreferenceBundle((uint64_t)CFSTR("InternationalSettings"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      SFRuntimeAbsoluteFilePathForPath();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bundleWithPath:", v28);
      v33 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("LANGUAGE"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v31, self, 0, sel_preferredLanguage_, objc_msgSend(v29, "classNamed:", CFSTR("ISApplicationLanguageController")), 2, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "setIdentifier:", CFSTR("PREFERRED_LANGUAGE"));
      objc_msgSend(v25, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
      objc_msgSend(v25, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.language"), CFSTR("iconUTTypeIdentifier"));
      -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setProperty:forKey:", v32, CFSTR("bundleID"));

      v17 = v33;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)preferredLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D3EFB0];
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLanguageForBundleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeWithLocaleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForLanguage:context:", v5, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)defaultAppSpecifierWithAppRecordsMatchingBlock:(id)a3 getter:(SEL)a4 setter:(SEL)a5 title:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  SEL v29;
  SEL v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (v10)
  {
    v34 = (void *)objc_opt_new();
    v33 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3880];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __91__PSSystemPolicyForApp_defaultAppSpecifierWithAppRecordsMatchingBlock_getter_setter_title___block_invoke;
    v39[3] = &unk_1E4A688E8;
    v40 = v10;
    objc_msgSend(v13, "predicateWithBlock:", v39);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v14);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = v12;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v16)
    {
      v17 = v16;
      v29 = a5;
      v30 = a4;
      v31 = v11;
      v32 = v10;
      v18 = 0;
      v19 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v21, "bundleIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqualToString:", v23);

          v18 |= v24;
          objc_msgSend(v21, "bundleIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v25);

          objc_msgSend(v21, "localizedName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v26);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v17);

      if ((v18 & 1) != 0)
      {
        v11 = v31;
        +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v31, self, v29, v30, objc_opt_class(), 2, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PSListItemsValuesAreAppIDsKey"));
        objc_msgSend(v27, "setValues:titles:", v33, v34);
      }
      else
      {
        v27 = 0;
        v11 = v31;
      }
      v10 = v32;
    }
    else
    {

      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

uint64_t __91__PSSystemPolicyForApp_defaultAppSpecifierWithAppRecordsMatchingBlock_getter_setter_title___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)defaultBrowserSpecifier
{
  void *v2;
  void *v4;
  void *v5;

  if ((self->_policyOptions & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DEFAULT_BROWSER_APP"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSystemPolicyForApp defaultAppSpecifierWithAppRecordsMatchingBlock:getter:setter:title:](self, "defaultAppSpecifierWithAppRecordsMatchingBlock:getter:setter:title:", &__block_literal_global_438, sel_defaultBrowser_, sel_setDefaultBrowser_specifier_, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "setIdentifier:", CFSTR("DEFAULT_BROWSER_APP"));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __47__PSSystemPolicyForApp_defaultBrowserSpecifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEligibleWebBrowser");
}

- (id)defaultBrowser:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CA58A8]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://"));
  v13 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithURL:error:", v4, &v13);
  v6 = v13;

  _PSLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "bundleRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "Default browser app is %{public}@", buf, 0xCu);

  }
  objc_msgSend(v5, "bundleRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setDefaultBrowser:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  id v16;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v16);
  v9 = v16;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__PSSystemPolicyForApp_setDefaultBrowser_specifier___block_invoke;
  v12[3] = &unk_1E4A675E0;
  objc_copyWeak(&v14, &location);
  v11 = v6;
  v13 = v11;
  objc_msgSend(v10, "setDefaultWebBrowserToApplicationRecord:completionHandler:", v8, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __52__PSSystemPolicyForApp_setDefaultBrowser_specifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _PSLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) == 0)
  {
    if (v8)
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v12;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "Error setting default browser app to %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_8;
  }
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "Set default browser app to %{public}@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject systemPolicyForApp:didUpdateForSystemPolicyOptions:withValue:](v7, "systemPolicyForApp:didUpdateForSystemPolicyOptions:withValue:", WeakRetained, 0x20000000, *(_QWORD *)(a1 + 32));
LABEL_8:

  }
}

- (id)defaultMailAppSpecifier
{
  void *v2;
  void *v4;
  void *v5;

  if ((self->_policyOptions & 0x40000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DEFAULT_MAIL_APP"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSystemPolicyForApp defaultAppSpecifierWithAppRecordsMatchingBlock:getter:setter:title:](self, "defaultAppSpecifierWithAppRecordsMatchingBlock:getter:setter:title:", &__block_literal_global_450, sel_defaultMailApp_, sel_setDefaultMailApp_specifier_, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "setIdentifier:", CFSTR("DEFAULT_MAIL_APP"));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __47__PSSystemPolicyForApp_defaultMailAppSpecifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEligibleMailClient");
}

- (id)defaultMailApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CA58A8]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("mailto://"));
  v13 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithURL:error:", v4, &v13);
  v6 = v13;

  _PSLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "bundleRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "Default mail app is %{public}@", buf, 0xCu);

  }
  objc_msgSend(v5, "bundleRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setDefaultMailApp:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  id v16;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v16);
  v9 = v16;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__PSSystemPolicyForApp_setDefaultMailApp_specifier___block_invoke;
  v12[3] = &unk_1E4A675E0;
  objc_copyWeak(&v14, &location);
  v11 = v6;
  v13 = v11;
  objc_msgSend(v10, "setDefaultMailClientToApplicationRecord:completionHandler:", v8, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __52__PSSystemPolicyForApp_setDefaultMailApp_specifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _PSLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) == 0)
  {
    if (v8)
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v12;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "Error setting default mail app to %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_8;
  }
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "Set default mail app to %{public}@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject systemPolicyForApp:didUpdateForSystemPolicyOptions:withValue:](v7, "systemPolicyForApp:didUpdateForSystemPolicyOptions:withValue:", WeakRetained, 0x40000000, *(_QWORD *)(a1 + 32));
LABEL_8:

  }
}

- (id)tapToPayScreenLockSpecifiers
{
  id PRSettingsProviderClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  int v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  if ((self->_policyOptions & 0x8000000000) == 0)
    return MEMORY[0x1E0C9AA60];
  PRSettingsProviderClass = getPRSettingsProviderClass();
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(PRSettingsProviderClass) = objc_msgSend(PRSettingsProviderClass, "isProximityReaderSupported:", v4);

  if (!(_DWORD)PRSettingsProviderClass)
    return MEMORY[0x1E0C9AA60];
  +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("TAP_TO_PAY_SCREEN_LOCK_GROUP"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TAP_TO_PAY_ON_IPHONE"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = getPRSettingsProviderClass();
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "shouldDisablePINPrivacyLockForBundleID:", v10);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "managingOrganizationInformation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D47270]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length") && (objc_msgSend(v14, "isEqualToString:", CFSTR("unknown")) & 1) == 0)
    {
      v24 = PSIsPearlAvailable();
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v26;
      if (v24)
        v27 = CFSTR("TAP_TO_PAY_SCREEN_LOCK_FACEID_DISABLED_KNOWN_ORGANIZATION_FOOTER");
      else
        v27 = CFSTR("TAP_TO_PAY_SCREEN_LOCK_TOUCHID_DISABLED_KNOWN_ORGANIZATION_FOOTER");
      objc_msgSend(v26, "localizedStringForKey:value:table:", v27, &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v23, v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, CFSTR("footerText"));

    }
    else
    {
      v15 = PSIsPearlAvailable();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
        v18 = CFSTR("TAP_TO_PAY_SCREEN_LOCK_FACEID_DISABLED_UNKNOWN_ORGANIZATION_FOOTER");
      else
        v18 = CFSTR("TAP_TO_PAY_SCREEN_LOCK_TOUCHID_DISABLED_UNKNOWN_ORGANIZATION_FOOTER");
      objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("footerText"));
    }

  }
  else
  {
    v20 = PSIsPearlAvailable();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;
    if (v20)
      v22 = CFSTR("TAP_TO_PAY_SCREEN_LOCK_FACEID_FOOTER");
    else
      v22 = CFSTR("TAP_TO_PAY_SCREEN_LOCK_TOUCHID_FOOTER");
    objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_1E4A69238, CFSTR("PSSystemPolicy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("footerText"));
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("TAP_TO_PAY_SCREEN_LOCK"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v30, self, sel_setTapToPayScreenLockEnabled_specifier_, sel_isTapToPayScreenLockEnabled_, 0, 6, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setIdentifier:", CFSTR("TAP_TO_PAY_SCREEN_LOCK"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11 ^ 1u);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("enabled"));

  v34[0] = v8;
  v34[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)isTapToPayScreenLockEnabled:(id)a3
{
  void *v4;
  id PRSettingsProviderClass;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  PRSettingsProviderClass = getPRSettingsProviderClass();
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(PRSettingsProviderClass, "getPINPrivacyLockForBundleID:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setTapToPayScreenLockEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  id PRSettingsProviderClass;
  uint64_t v7;
  id v8;

  v5 = a3;
  PRSettingsProviderClass = getPRSettingsProviderClass();
  v7 = objc_msgSend(v5, "BOOLValue");

  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PRSettingsProviderClass, "setPINPrivacyLock:forBundleID:", v7, v8);

}

- (id)tapToPayAlwaysPlaySoundSpecifiers
{
  id PRSettingsProviderClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if ((self->_policyOptions & 0x40000000000) == 0)
    return MEMORY[0x1E0C9AA60];
  PRSettingsProviderClass = getPRSettingsProviderClass();
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(PRSettingsProviderClass) = objc_msgSend(PRSettingsProviderClass, "isProximityReaderSupported:", v4);

  if (!(_DWORD)PRSettingsProviderClass)
    return MEMORY[0x1E0C9AA60];
  +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("TAP_TO_PAY_ALWAYS_PLAY_SOUND_GROUP"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TAP_TO_PAY_ALWAYS_PLAY_SOUND_FOOTER"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("footerText"));

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TAP_TO_PAY_ALWAYS_PLAY_SOUND"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, sel_setTapToPayAlwaysPlaySoundEnabled_specifier_, sel_isTapToPayAlwaysPlaySoundEnabled_, 0, 6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setIdentifier:", CFSTR("TAP_TO_PAY_ALWAYS_PLAY_SOUND"));
  v13[0] = v5;
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)isTapToPayAlwaysPlaySoundEnabled:(id)a3
{
  void *v4;
  id PRSettingsProviderClass;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  PRSettingsProviderClass = getPRSettingsProviderClass();
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(PRSettingsProviderClass, "getAlwaysPlaySoundForBundleID:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setTapToPayAlwaysPlaySoundEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  id PRSettingsProviderClass;
  uint64_t v7;
  id v8;

  v5 = a3;
  PRSettingsProviderClass = getPRSettingsProviderClass();
  v7 = objc_msgSend(v5, "BOOLValue");

  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PRSettingsProviderClass, "setAlwaysPlaySound:forBundleID:", v7, v8);

}

- (id)driverKitSpecifiers
{
  PSDriverPolicyForApp *v3;
  void *v4;
  PSDriverPolicyForApp *v5;
  PSDriverPolicyForApp *driverPolicy;

  v3 = [PSDriverPolicyForApp alloc];
  -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PSDriverPolicyForApp initWithBundleIdentifier:](v3, "initWithBundleIdentifier:", v4);
  driverPolicy = self->_driverPolicy;
  self->_driverPolicy = v5;

  -[PSDriverPolicyForApp setDelegate:](self->_driverPolicy, "setDelegate:", self);
  return -[PSDriverPolicyForApp specifiers](self->_driverPolicy, "specifiers");
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(v7, "sectionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSystemPolicyForApp bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      -[PSSystemPolicyForApp delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadSpecifiers");

    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PSSystemPolicyForApp_observer_updateSectionInfo___block_invoke;
    block[3] = &unk_1E4A66370;
    block[4] = self;
    v13 = v6;
    v14 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __51__PSSystemPolicyForApp_observer_updateSectionInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observer:updateSectionInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)reloadSpecifiers
{
  id v2;

  -[PSSystemPolicyForApp delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSpecifiers");

}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PSSystemPolicyForApp delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showController:animate:", v6, v4);

}

- (PSSystemPolicyForAppDelegate)delegate
{
  return (PSSystemPolicyForAppDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BBObserver)_bbObserver
{
  return self->__bbObserver;
}

- (void)set_bbObserver:(id)a3
{
  objc_storeStrong((id *)&self->__bbObserver, a3);
}

- (BOOL)enServiceMatched
{
  return self->_enServiceMatched;
}

- (void)setEnServiceMatched:(BOOL)a3
{
  self->_enServiceMatched = a3;
}

- (NSString)matchingBundleIdentifier
{
  return self->_matchingBundleIdentifier;
}

- (void)setMatchingBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_matchingBundleIdentifier, a3);
}

- (NSString)containerPathForCurrentApp
{
  return self->_containerPathForCurrentApp;
}

- (void)setContainerPathForCurrentApp:(id)a3
{
  objc_storeStrong((id *)&self->_containerPathForCurrentApp, a3);
}

- (NSUserDefaults)appUserDefaults
{
  return self->_appUserDefaults;
}

- (void)setAppUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_appUserDefaults, a3);
}

- (PSSpecifier)cinematicFramingSpecifier
{
  return self->_cinematicFramingSpecifier;
}

- (void)setCinematicFramingSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_cinematicFramingSpecifier, a3);
}

- (PSDriverPolicyForApp)driverPolicy
{
  return self->_driverPolicy;
}

- (void)setDriverPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_driverPolicy, a3);
}

- (SESNFCAppSettingsContext)nfcContext
{
  return self->_nfcContext;
}

- (void)setNfcContext:(id)a3
{
  objc_storeStrong((id *)&self->_nfcContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfcContext, 0);
  objc_storeStrong((id *)&self->_driverPolicy, 0);
  objc_storeStrong((id *)&self->_cinematicFramingSpecifier, 0);
  objc_storeStrong((id *)&self->_appUserDefaults, 0);
  objc_storeStrong((id *)&self->_containerPathForCurrentApp, 0);
  objc_storeStrong((id *)&self->_matchingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->__bbObserver, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pathControllerConfiguration, 0);
  objc_storeStrong((id *)&self->_accountEnumerator, 0);
  objc_storeStrong((id *)&self->_walletPrivacyController, 0);
  objc_storeStrong((id *)&self->_contactsPrivacyController, 0);
  objc_storeStrong((id *)&self->_calendarPrivacyController, 0);
  objc_storeStrong((id *)&self->_photosPrivacyController, 0);
  objc_storeStrong((id *)&self->_accessoriesPrivacyController, 0);
}

void __62__PSSystemPolicyForApp_loadNetworkConfigurationsForceRefresh___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "-[PSSystemPolicyForApp loadNetworkConfigurationsForceRefresh:]_block_invoke";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_1A3819000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Failed to load with error %{public}@", (uint8_t *)&v2, 0x16u);
}

void __48__PSSystemPolicyForApp_saveNetworkConfiguration__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 136446722;
  v5 = "-[PSSystemPolicyForApp saveNetworkConfiguration]_block_invoke";
  v6 = 2114;
  v7 = a1;
  v8 = 2114;
  v9 = v3;
  _os_log_error_impl(&dword_1A3819000, log, OS_LOG_TYPE_ERROR, "%{public}s: Save error %{public}@ for %{public}@", (uint8_t *)&v4, 0x20u);
}

@end
