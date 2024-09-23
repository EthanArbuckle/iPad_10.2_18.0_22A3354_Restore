@implementation HKSPSleepClientInterface

void __HKSPSleepClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[2];
  _QWORD v54[2];
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE799790);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED05F228;
  qword_1ED05F228 = v0;

  v2 = (void *)qword_1ED05F228;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v56[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getClientIdentifierWithCompletion_, 0, 1);

  v6 = (void *)qword_1ED05F228;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v55 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_clientShouldCheckInWithCompletion_, 0, 1);

  v10 = (void *)qword_1ED05F228;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_sleepScheduleChanged_clientIdentifier_, 0, 0);

  v14 = (void *)qword_1ED05F228;
  v15 = (void *)MEMORY[0x1E0C99E60];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_sleepScheduleChanged_clientIdentifier_, 1, 0);

  v18 = (void *)qword_1ED05F228;
  v19 = (void *)MEMORY[0x1E0C99E60];
  v52 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_sleepSettingsChanged_clientIdentifier_, 0, 0);

  v22 = (void *)qword_1ED05F228;
  v23 = (void *)MEMORY[0x1E0C99E60];
  v51 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_sleepSettingsChanged_clientIdentifier_, 1, 0);

  v26 = (void *)qword_1ED05F228;
  v27 = (void *)MEMORY[0x1E0C99E60];
  v50 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_sleepEventRecordChanged_clientIdentifier_, 0, 0);

  v30 = (void *)qword_1ED05F228;
  v31 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_sleepEventRecordChanged_clientIdentifier_, 1, 0);

  v34 = (void *)qword_1ED05F228;
  v35 = (void *)MEMORY[0x1E0C99E60];
  v48 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWithArray:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_sleepEventOccurred_, 0, 0);

  v38 = (void *)qword_1ED05F228;
  v39 = (void *)MEMORY[0x1E0C99E60];
  v47 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setWithArray:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_sleepScheduleStateChanged_, 0, 0);

  v42 = (void *)qword_1ED05F228;
  v43 = (void *)MEMORY[0x1E0C99E60];
  v46 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setWithArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_sleepModeChanged_, 0, 0);

}

@end
