@implementation STBackgroundActivityVisualDescriptor

+ (id)visualDescriptorForBackgroundActivityWithIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__STBackgroundActivityVisualDescriptor_BuiltIns__visualDescriptorForBackgroundActivityWithIdentifier___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = _MergedGlobals_14;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_MergedGlobals_14, block);
  objc_msgSend((id)qword_1ED0CB490, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __102__STBackgroundActivityVisualDescriptor_BuiltIns__visualDescriptorForBackgroundActivityWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_defaultVisualDescriptors");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0CB490;
  qword_1ED0CB490 = v1;

}

+ (id)_defaultVisualDescriptors
{
  void *v2;
  void *v3;
  STBackgroundActivityVisualDescriptorColorRepresentation *v4;
  void *v5;
  void *v6;
  STBackgroundActivityVisualDescriptorColorRepresentation *v7;
  void *v8;
  STBackgroundActivityVisualDescriptorColorRepresentation *v9;
  void *v10;
  void *v11;
  STBackgroundActivityVisualDescriptorColorRepresentation *v12;
  void *v13;
  STBackgroundActivityVisualDescriptorColorRepresentation *v14;
  void *v15;
  STBackgroundActivityVisualDescriptorColorRepresentation *v16;
  void *v17;
  STBackgroundActivityVisualDescriptorColorRepresentation *v18;
  void *v19;
  STBackgroundActivityVisualDescriptorColorRepresentation *v20;
  void *v21;
  STBackgroundActivityVisualDescriptorColorRepresentation *v22;
  void *v23;
  STBackgroundActivityVisualDescriptorColorRepresentation *v24;
  void *v25;
  STBackgroundActivityVisualDescriptorColorRepresentation *v26;
  void *v27;
  STBackgroundActivityVisualDescriptorColorRepresentation *v28;
  void *v29;
  STBackgroundActivityVisualDescriptorColorRepresentation *v30;
  void *v31;
  STBackgroundActivityVisualDescriptorColorRepresentation *v32;
  void *v33;
  STBackgroundActivityVisualDescriptorColorRepresentation *v34;
  void *v35;
  STBackgroundActivityVisualDescriptorColorRepresentation *v36;
  void *v37;
  STBackgroundActivityVisualDescriptorColorRepresentation *v38;
  void *v39;
  STBackgroundActivityVisualDescriptorColorRepresentation *v40;
  void *v41;
  STBackgroundActivityVisualDescriptorColorRepresentation *v42;
  void *v43;
  STBackgroundActivityVisualDescriptorColorRepresentation *v44;
  void *v45;
  STBackgroundActivityVisualDescriptorColorRepresentation *v46;
  void *v47;
  STBackgroundActivityVisualDescriptorColorRepresentation *v48;
  void *v49;
  void *v50;
  STBackgroundActivityVisualDescriptorColorRepresentation *v51;
  void *v52;
  void *v53;
  STBackgroundActivityVisualDescriptorColorRepresentation *v54;
  void *v55;
  STBackgroundActivityVisualDescriptorColorRepresentation *v56;
  void *v57;
  STBackgroundActivityVisualDescriptorColorRepresentation *v58;
  void *v59;
  STBackgroundActivityVisualDescriptorColorRepresentation *v60;
  void *v61;
  STBackgroundActivityVisualDescriptorColorRepresentation *v62;
  void *v63;
  STBackgroundActivityVisualDescriptorColorRepresentation *v64;
  void *v65;
  STBackgroundActivityVisualDescriptorColorRepresentation *v66;
  void *v67;
  STBackgroundActivityVisualDescriptorColorRepresentation *v68;
  void *v69;
  STBackgroundActivityVisualDescriptorColorRepresentation *v70;
  void *v71;
  STBackgroundActivityVisualDescriptorColorRepresentation *v72;
  void *v73;
  STBackgroundActivityVisualDescriptorColorRepresentation *v74;
  void *v75;
  STBackgroundActivityVisualDescriptorColorRepresentation *v76;
  void *v77;
  void *v78;
  STBackgroundActivityVisualDescriptorColorRepresentation *v79;
  void *v80;
  void *v81;
  STBackgroundActivityVisualDescriptorColorRepresentation *v82;
  void *v83;
  STBackgroundActivityVisualDescriptorColorRepresentation *v84;
  void *v85;
  void *v86;
  STBackgroundActivityVisualDescriptorColorRepresentation *v87;
  void *v88;
  void *v89;
  STBackgroundActivityVisualDescriptorColorRepresentation *v90;
  void *v91;
  STBackgroundActivityVisualDescriptorColorRepresentation *v92;
  void *v93;
  id v94;
  _QWORD v96[4];
  id v97;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setSystemImageName:", CFSTR("phone.down.fill"));
  objc_msgSend(v3, "setPreferredContinuousAnimationName:");
  objc_msgSend(v3, "setPreferredVisualEffectName:", CFSTR("darkBlur"));
  v4 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("clearColor"));
  objc_msgSend(v3, "setBackgroundColorRepresentation:", v4);

  objc_msgSend(v3, "setPrefersToKeepContentVisible:", 1);
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("com.apple.systemstatus.background-activity.CallRinging"));

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSystemImageName:", CFSTR("phone.fill"));
  objc_msgSend(v5, "setVerticalOffsetInPixels:", 1.0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.systemstatus.background-activity.CallRecording"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCrossfadableActivities:", v6);

  v7 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemGreenColor"));
  objc_msgSend(v5, "setBackgroundColorRepresentation:", v7);

  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("com.apple.systemstatus.background-activity.InCall"));
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setSystemImageName:", CFSTR("phone.fill"));
  objc_msgSend(v8, "setVerticalOffsetInPixels:", 1.0);
  v9 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemRedColor"));
  objc_msgSend(v8, "setBackgroundColorRepresentation:", v9);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.systemstatus.background-activity.InCall"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCrossfadableActivities:", v10);

  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("com.apple.systemstatus.background-activity.CallRecording"));
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setSystemImageName:", CFSTR("phone.fill"));
  objc_msgSend(v11, "setPreferredVisualEffectName:", CFSTR("darkBlur"));
  v12 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("clearColor"));
  objc_msgSend(v11, "setBackgroundColorRepresentation:", v12);

  objc_msgSend(v11, "setPrefersToKeepContentVisible:", 1);
  objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("com.apple.systemstatus.background-activity.CallHandoff"));

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setSystemImageName:", CFSTR("recordingtape"));
  objc_msgSend(v13, "setPreferredVisualEffectName:", CFSTR("darkBlur"));
  v14 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("clearColor"));
  objc_msgSend(v13, "setBackgroundColorRepresentation:", v14);

  objc_msgSend(v13, "setPrefersToKeepContentVisible:", 1);
  objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("com.apple.systemstatus.background-activity.CallScreening"));

  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setSystemImageName:", CFSTR("video.fill"));
  objc_msgSend(v15, "setFontSizeAdjustment:", -1.0);
  objc_msgSend(v15, "setPreferredContinuousAnimationName:", CFSTR("ringing"));
  objc_msgSend(v15, "setPreferredVisualEffectName:", CFSTR("darkBlur"));
  v16 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("clearColor"));
  objc_msgSend(v15, "setBackgroundColorRepresentation:", v16);

  objc_msgSend(v15, "setPrefersToKeepContentVisible:", 1);
  objc_msgSend(v2, "setObject:forKey:", v15, CFSTR("com.apple.systemstatus.background-activity.VideoConferenceRinging"));

  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setSystemImageName:", CFSTR("video.fill"));
  v18 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemGreenColor"));
  objc_msgSend(v17, "setBackgroundColorRepresentation:", v18);

  objc_msgSend(v2, "setObject:forKey:", v17, CFSTR("com.apple.systemstatus.background-activity.InVideoConference"));
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setSystemImageName:", CFSTR("video.fill"));
  objc_msgSend(v19, "setPreferredVisualEffectName:", CFSTR("darkBlur"));
  v20 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("clearColor"));
  objc_msgSend(v19, "setBackgroundColorRepresentation:", v20);

  objc_msgSend(v19, "setPrefersToKeepContentVisible:", 1);
  objc_msgSend(v2, "setObject:forKey:", v19, CFSTR("com.apple.systemstatus.background-activity.VideoConferenceHandoff"));

  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setSystemImageName:", CFSTR("waveform"));
  v22 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v21, "setBackgroundColorRepresentation:", v22);

  objc_msgSend(v21, "setPrefersToKeepContentVisible:", 1);
  objc_msgSend(v2, "setObject:forKey:", v21, CFSTR("com.apple.systemstatus.background-activity.ActivePushToTalkCall"));

  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setSystemImageName:", CFSTR("waveform"));
  objc_msgSend(v23, "setPrefersToSuppressPulse:", 1);
  v24 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v23, "setBackgroundColorRepresentation:", v24);

  objc_msgSend(v2, "setObject:forKey:", v23, CFSTR("com.apple.systemstatus.background-activity.IdlePushToTalkCall"));
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setSystemImageName:", CFSTR("video.fill"));
  v26 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemRedColor"));
  objc_msgSend(v25, "setBackgroundColorRepresentation:", v26);

  objc_msgSend(v2, "setObject:forKey:", v25, CFSTR("com.apple.systemstatus.background-activity.WebRTCCapture"));
  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "setSystemImageName:", CFSTR("mic.fill"));
  v28 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemOrangeColor"));
  objc_msgSend(v27, "setBackgroundColorRepresentation:", v28);

  objc_msgSend(v2, "setObject:forKey:", v27, CFSTR("com.apple.systemstatus.background-activity.WebRTCAudioCapture"));
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setSystemImageName:", CFSTR("video.fill"));
  v30 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemRedColor"));
  objc_msgSend(v29, "setBackgroundColorRepresentation:", v30);

  objc_msgSend(v2, "setObject:forKey:", v29, CFSTR("com.apple.systemstatus.background-activity.FullScreenWebRTCCapture"));
  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "setSystemImageName:", CFSTR("mic.fill"));
  v32 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemOrangeColor"));
  objc_msgSend(v31, "setBackgroundColorRepresentation:", v32);

  objc_msgSend(v2, "setObject:forKey:", v31, CFSTR("com.apple.systemstatus.background-activity.FullScreenWebRTCAudioCapture"));
  v33 = (void *)objc_opt_new();
  objc_msgSend(v33, "setSystemImageName:", CFSTR("location.north.circle.fill"));
  v34 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v33, "setBackgroundColorRepresentation:", v34);

  objc_msgSend(v2, "setObject:forKey:", v33, CFSTR("com.apple.systemstatus.background-activity.Navigation"));
  v35 = (void *)objc_opt_new();
  objc_msgSend(v35, "setSystemImageName:", CFSTR("location.north.circle.fill"));
  v36 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v35, "setBackgroundColorRepresentation:", v36);

  objc_msgSend(v2, "setObject:forKey:", v35, CFSTR("com.apple.systemstatus.background-activity.Navigation"));
  v37 = (void *)objc_opt_new();
  objc_msgSend(v37, "setSystemImageName:", CFSTR("location.north.circle.fill"));
  v38 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v37, "setBackgroundColorRepresentation:", v38);

  objc_msgSend(v2, "setObject:forKey:", v37, CFSTR("com.apple.systemstatus.background-activity.BackgroundLocation"));
  v39 = (void *)objc_opt_new();
  objc_msgSend(v39, "setSystemImageName:", CFSTR("nearby.interactions"));
  v40 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v39, "setBackgroundColorRepresentation:", v40);

  objc_msgSend(v2, "setObject:forKey:", v39, CFSTR("com.apple.systemstatus.background-activity.NearbyInteractions"));
  v41 = (void *)objc_opt_new();
  objc_msgSend(v41, "setSystemImageName:", CFSTR("mic.fill"));
  v42 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemOrangeColor"));
  objc_msgSend(v41, "setBackgroundColorRepresentation:", v42);

  objc_msgSend(v2, "setObject:forKey:", v41, CFSTR("com.apple.systemstatus.background-activity.Recording"));
  v43 = (void *)objc_opt_new();
  objc_msgSend(v43, "setSystemImageName:", CFSTR("mic.fill"));
  v44 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemOrangeColor"));
  objc_msgSend(v43, "setBackgroundColorRepresentation:", v44);

  objc_msgSend(v2, "setObject:forKey:", v43, CFSTR("com.apple.systemstatus.background-activity.HearingAidRecording"));
  v45 = (void *)objc_opt_new();
  objc_msgSend(v45, "setSystemImageName:", CFSTR("record.circle"));
  v46 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemRedColor"));
  objc_msgSend(v45, "setBackgroundColorRepresentation:", v46);

  objc_msgSend(v2, "setObject:forKey:", v45, CFSTR("com.apple.systemstatus.background-activity.ScreenReplayRecording"));
  v47 = (void *)objc_opt_new();
  objc_msgSend(v47, "setSystemImageName:", CFSTR("shareplay"));
  v48 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemGray4Color"));
  objc_msgSend(v47, "setBackgroundColorRepresentation:", v48);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.systemstatus.background-activity.SharePlay"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setCrossfadableActivities:", v49);

  objc_msgSend(v2, "setObject:forKey:", v47, CFSTR("com.apple.systemstatus.background-activity.SharePlayInactive"));
  v50 = (void *)objc_opt_new();
  objc_msgSend(v50, "setSystemImageName:", CFSTR("shareplay"));
  v51 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemGreenColor"));
  objc_msgSend(v50, "setBackgroundColorRepresentation:", v51);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.systemstatus.background-activity.SharePlayInactive"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setCrossfadableActivities:", v52);

  objc_msgSend(v2, "setObject:forKey:", v50, CFSTR("com.apple.systemstatus.background-activity.SharePlay"));
  v53 = (void *)objc_opt_new();
  objc_msgSend(v53, "setSystemImageName:", CFSTR("rectangle.inset.filled.and.person.filled"));
  v54 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemIndigoColor"));
  objc_msgSend(v53, "setBackgroundColorRepresentation:", v54);

  objc_msgSend(v2, "setObject:forKey:", v53, CFSTR("com.apple.systemstatus.background-activity.SharePlayScreenSharing"));
  v55 = (void *)objc_opt_new();
  objc_msgSend(v55, "setSystemImageName:", CFSTR("airplayvideo"));
  v56 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v55, "setBackgroundColorRepresentation:", v56);

  objc_msgSend(v2, "setObject:forKey:", v55, CFSTR("com.apple.systemstatus.background-activity.ScreenSharing"));
  v57 = (void *)objc_opt_new();
  objc_msgSend(v57, "setSystemImageName:", CFSTR("airplayvideo"));
  objc_msgSend(v57, "setPrefersToSuppressPulse:", 1);
  objc_msgSend(v57, "setPrefersToKeepContentVisible:", 1);
  v58 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v57, "setBackgroundColorRepresentation:", v58);

  objc_msgSend(v2, "setObject:forKey:", v57, CFSTR("com.apple.systemstatus.background-activity.AutoAirPlayReady"));
  v59 = (void *)objc_opt_new();
  objc_msgSend(v59, "setSystemImageName:", CFSTR("airplayvideo"));
  objc_msgSend(v59, "setPrefersToKeepContentVisible:", 1);
  v60 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v59, "setBackgroundColorRepresentation:", v60);

  objc_msgSend(v2, "setObject:forKey:", v59, CFSTR("com.apple.systemstatus.background-activity.AutoAirPlayPlaying"));
  v61 = (void *)objc_opt_new();
  objc_msgSend(v61, "setSystemImageName:", CFSTR("cable.connector.horizontal"));
  v62 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v61, "setBackgroundColorRepresentation:", v62);

  objc_msgSend(v2, "setObject:forKey:", v61, CFSTR("com.apple.systemstatus.background-activity.VideoOut"));
  v63 = (void *)objc_opt_new();
  objc_msgSend(v63, "setSystemImageName:", CFSTR("rectangle.inset.filled.and.person.filled"));
  v64 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemIndigoColor"));
  objc_msgSend(v63, "setBackgroundColorRepresentation:", v64);

  objc_msgSend(v2, "setObject:forKey:", v63, CFSTR("com.apple.systemstatus.background-activity.ScreenSharingServer"));
  v65 = (void *)objc_opt_new();
  objc_msgSend(v65, "setSystemImageName:", CFSTR("gear"));
  v66 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v65, "setBackgroundColorRepresentation:", v66);

  objc_msgSend(v2, "setObject:forKey:", v65, CFSTR("com.apple.systemstatus.background-activity.Sysdiagnose"));
  v67 = (void *)objc_opt_new();
  objc_msgSend(v67, "setSystemImageName:", CFSTR("wrench.and.screwdriver.fill"));
  objc_msgSend(v67, "setFontSizeAdjustment:", -1.0);
  v68 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemGrayColor"));
  objc_msgSend(v67, "setBackgroundColorRepresentation:", v68);

  objc_msgSend(v2, "setObject:forKey:", v67, CFSTR("com.apple.systemstatus.background-activity.DeveloperTools"));
  v69 = (void *)objc_opt_new();
  objc_msgSend(v69, "setSystemImageName:", CFSTR("waveform.path.ecg"));
  v70 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v69, "setBackgroundColorRepresentation:", v70);

  objc_msgSend(v2, "setObject:forKey:", v69, CFSTR("com.apple.systemstatus.background-activity.Diagnostics"));
  v71 = (void *)objc_opt_new();
  objc_msgSend(v71, "setSystemImageName:", CFSTR("waveform.path.ecg"));
  v72 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v71, "setBackgroundColorRepresentation:", v72);

  objc_msgSend(v71, "setPrefersToKeepContentVisible:", 1);
  objc_msgSend(v2, "setObject:forKey:", v71, CFSTR("com.apple.systemstatus.background-activity.LoggingCapture"));

  v73 = (void *)objc_opt_new();
  objc_msgSend(v73, "setTextLabel:", CFSTR("SOS"));
  v74 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemRedColor"));
  objc_msgSend(v73, "setBackgroundColorRepresentation:", v74);

  objc_msgSend(v2, "setObject:forKey:", v73, CFSTR("com.apple.systemstatus.background-activity.CellularSOS"));
  v75 = (void *)objc_opt_new();
  objc_msgSend(v75, "setImageName:", CFSTR("BackgroundTask_satellite"));
  objc_msgSend(v75, "setPrefersToSuppressPulse:", 1);
  v76 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemGreenColor"));
  objc_msgSend(v75, "setBackgroundColorRepresentation:", v76);

  objc_msgSend(v75, "setPrefersToKeepContentVisible:", 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.systemstatus.background-activity.SatelliteSOSDisconnected"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setCrossfadableActivities:", v77);

  objc_msgSend(v2, "setObject:forKey:", v75, CFSTR("com.apple.systemstatus.background-activity.SatelliteSOS"));
  v78 = (void *)objc_opt_new();
  objc_msgSend(v78, "setImageName:", CFSTR("BackgroundTask_satellite-disconnected"));
  objc_msgSend(v78, "setPrefersToSuppressPulse:", 1);
  v79 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemGray4Color"));
  objc_msgSend(v78, "setBackgroundColorRepresentation:", v79);

  objc_msgSend(v78, "setPrefersToKeepContentVisible:", 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.systemstatus.background-activity.SatelliteSOS"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setCrossfadableActivities:", v80);

  objc_msgSend(v2, "setObject:forKey:", v78, CFSTR("com.apple.systemstatus.background-activity.SatelliteSOSDisconnected"));
  v81 = (void *)objc_opt_new();
  objc_msgSend(v81, "setSystemImageName:", CFSTR("carplay"));
  v82 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v81, "setBackgroundColorRepresentation:", v82);

  objc_msgSend(v2, "setObject:forKey:", v81, CFSTR("com.apple.systemstatus.background-activity.CarPlay"));
  v83 = (void *)objc_opt_new();
  objc_msgSend(v83, "setSystemImageName:", CFSTR("swift"));
  v84 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("_swiftColor"));
  objc_msgSend(v83, "setBackgroundColorRepresentation:", v84);

  objc_msgSend(v2, "setObject:forKey:", v83, CFSTR("com.apple.systemstatus.background-activity.Playgrounds"));
  v85 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKey:", v85, CFSTR("com.apple.systemstatus.background-activity.InWorkout"));

  v86 = (void *)objc_opt_new();
  objc_msgSend(v86, "setSystemImageName:", CFSTR("personalhotspot"));
  v87 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemGreenColor"));
  objc_msgSend(v86, "setBackgroundColorRepresentation:", v87);

  objc_msgSend(v2, "setObject:forKey:", v86, CFSTR("com.apple.systemstatus.background-activity.Tethering"));
  v88 = (void *)objc_opt_new();
  objc_msgSend(v88, "setSystemImageName:", CFSTR("siri"));
  objc_msgSend(MEMORY[0x1E0D01710], "colorWithRed:green:blue:alpha:", 0.28627451, 0.0901960784, 0.439215686, 1.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithBSColor:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithBSColor:", v89);
  objc_msgSend(v88, "setBackgroundColorRepresentation:", v90);

  objc_msgSend(v2, "setObject:forKey:", v88, CFSTR("com.apple.systemstatus.background-activity.AssistantEyesFree"));
  v91 = (void *)objc_opt_new();
  objc_msgSend(v91, "setSystemImageName:", CFSTR("printer.fill"));
  v92 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithSystemColorName:", CFSTR("systemBlueColor"));
  objc_msgSend(v91, "setBackgroundColorRepresentation:", v92);

  objc_msgSend(v2, "setObject:forKey:", v91, CFSTR("com.apple.systemstatus.background-activity.AirPrint"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = MEMORY[0x1E0C809B0];
  v96[1] = 3221225472;
  v96[2] = __75__STBackgroundActivityVisualDescriptor_BuiltIns___defaultVisualDescriptors__block_invoke;
  v96[3] = &unk_1E91E5DC8;
  v94 = v93;
  v97 = v94;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v96);

  return v94;
}

void __75__STBackgroundActivityVisualDescriptor_BuiltIns___defaultVisualDescriptors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (BOOL)prefersToRing
{
  return objc_msgSend(CFSTR("ringing"), "isEqualToString:", self->_preferredContinuousAnimationName);
}

- (BOOL)prefersToPulse
{
  return objc_msgSend(CFSTR("pulseBackground"), "isEqualToString:", self->_preferredContinuousAnimationName);
}

- (BOOL)prefersToSuppressPulse
{
  return !-[STBackgroundActivityVisualDescriptor prefersToPulse](self, "prefersToPulse");
}

- (BOOL)canCrossfadeToBackgroundActivityWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[STBackgroundActivityVisualDescriptor crossfadableActivities](self, "crossfadableActivities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (STBackgroundActivityVisualDescriptor)init
{
  STBackgroundActivityVisualDescriptor *v2;
  STBackgroundActivityVisualDescriptor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STBackgroundActivityVisualDescriptor;
  v2 = -[STBackgroundActivityVisualDescriptor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_preferredVisualEffectName, CFSTR("none"));
    objc_storeStrong((id *)&v3->_preferredContinuousAnimationName, CFSTR("pulseBackground"));
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)-[STBackgroundActivityVisualDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  id v24;
  id v25;
  double v26;
  double v27;
  id v28;
  id v29;
  _BOOL8 v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
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

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBackgroundActivityVisualDescriptor packageName](self, "packageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke;
  v63[3] = &unk_1E91E4B00;
  v8 = v4;
  v64 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v6, v63);

  -[STBackgroundActivityVisualDescriptor systemImageName](self, "systemImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v7;
  v61[1] = 3221225472;
  v61[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_2;
  v61[3] = &unk_1E91E4B00;
  v11 = v8;
  v62 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", v10, v61);

  -[STBackgroundActivityVisualDescriptor imageName](self, "imageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v7;
  v59[1] = 3221225472;
  v59[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_3;
  v59[3] = &unk_1E91E4B00;
  v14 = v11;
  v60 = v14;
  v15 = (id)objc_msgSend(v5, "appendString:counterpart:", v13, v59);

  -[STBackgroundActivityVisualDescriptor textLabel](self, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v7;
  v57[1] = 3221225472;
  v57[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_4;
  v57[3] = &unk_1E91E4B00;
  v17 = v14;
  v58 = v17;
  v18 = (id)objc_msgSend(v5, "appendString:counterpart:", v16, v57);

  -[STBackgroundActivityVisualDescriptor backgroundColorRepresentation](self, "backgroundColorRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v7;
  v55[1] = 3221225472;
  v55[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_5;
  v55[3] = &unk_1E91E4AB0;
  v20 = v17;
  v56 = v20;
  v21 = (id)objc_msgSend(v5, "appendObject:counterpart:", v19, v55);

  -[STBackgroundActivityVisualDescriptor verticalOffsetInPixels](self, "verticalOffsetInPixels");
  v23 = v22;
  v53[0] = v7;
  v53[1] = 3221225472;
  v53[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_6;
  v53[3] = &unk_1E91E58D8;
  v24 = v20;
  v54 = v24;
  v25 = (id)objc_msgSend(v5, "appendDouble:counterpart:", v53, v23);
  -[STBackgroundActivityVisualDescriptor fontSizeAdjustment](self, "fontSizeAdjustment");
  v27 = v26;
  v51[0] = v7;
  v51[1] = 3221225472;
  v51[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_7;
  v51[3] = &unk_1E91E58D8;
  v28 = v24;
  v52 = v28;
  v29 = (id)objc_msgSend(v5, "appendDouble:counterpart:", v51, v27);
  v30 = -[STBackgroundActivityVisualDescriptor prefersToKeepContentVisible](self, "prefersToKeepContentVisible");
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_8;
  v49[3] = &unk_1E91E4B28;
  v31 = v28;
  v50 = v31;
  v32 = (id)objc_msgSend(v5, "appendBool:counterpart:", v30, v49);
  -[STBackgroundActivityVisualDescriptor preferredVisualEffectName](self, "preferredVisualEffectName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_9;
  v47[3] = &unk_1E91E4B00;
  v34 = v31;
  v48 = v34;
  v35 = (id)objc_msgSend(v5, "appendString:counterpart:", v33, v47);

  -[STBackgroundActivityVisualDescriptor preferredContinuousAnimationName](self, "preferredContinuousAnimationName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_10;
  v45[3] = &unk_1E91E4B00;
  v37 = v34;
  v46 = v37;
  v38 = (id)objc_msgSend(v5, "appendString:counterpart:", v36, v45);

  -[STBackgroundActivityVisualDescriptor crossfadableActivities](self, "crossfadableActivities");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v7;
  v43[1] = 3221225472;
  v43[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_11;
  v43[3] = &unk_1E91E4AB0;
  v44 = v37;
  v40 = v37;
  v41 = (id)objc_msgSend(v5, "appendObject:counterpart:", v39, v43);

  LOBYTE(v37) = objc_msgSend(v5, "isEqual");
  return (char)v37;
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "packageName");
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemImageName");
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "imageName");
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "textLabel");
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backgroundColorRepresentation");
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "verticalOffsetInPixels");
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fontSizeAdjustment");
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prefersToKeepContentVisible");
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "preferredVisualEffectName");
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "preferredContinuousAnimationName");
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "crossfadableActivities");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBackgroundActivityVisualDescriptor packageName](self, "packageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[STBackgroundActivityVisualDescriptor systemImageName](self, "systemImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  -[STBackgroundActivityVisualDescriptor imageName](self, "imageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendString:", v8);

  -[STBackgroundActivityVisualDescriptor textLabel](self, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendString:", v10);

  -[STBackgroundActivityVisualDescriptor backgroundColorRepresentation](self, "backgroundColorRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:", v12);

  -[STBackgroundActivityVisualDescriptor verticalOffsetInPixels](self, "verticalOffsetInPixels");
  v14 = (id)objc_msgSend(v3, "appendDouble:");
  -[STBackgroundActivityVisualDescriptor fontSizeAdjustment](self, "fontSizeAdjustment");
  v15 = (id)objc_msgSend(v3, "appendDouble:");
  v16 = (id)objc_msgSend(v3, "appendBool:", -[STBackgroundActivityVisualDescriptor prefersToKeepContentVisible](self, "prefersToKeepContentVisible"));
  -[STBackgroundActivityVisualDescriptor preferredVisualEffectName](self, "preferredVisualEffectName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendString:", v17);

  -[STBackgroundActivityVisualDescriptor preferredContinuousAnimationName](self, "preferredContinuousAnimationName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v3, "appendString:", v19);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[STBackgroundActivityVisualDescriptor crossfadableActivities](self, "crossfadableActivities", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        v26 = (id)objc_msgSend(v3, "appendString:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v25++));
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v23);
  }

  v27 = objc_msgSend(v3, "hash");
  return v27;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  _copyValuesFromDescriptorToDescriptor(self, v4);
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STBackgroundActivityVisualDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STBackgroundActivityVisualDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STBackgroundActivityVisualDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STBackgroundActivityVisualDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  STBackgroundActivityVisualDescriptor *v14;

  v4 = a4;
  v6 = a3;
  -[STBackgroundActivityVisualDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  objc_msgSend(v7, "activeMultilinePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__STBackgroundActivityVisualDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E91E4AD8;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v8, v12);

  v10 = v9;
  return v10;
}

void __88__STBackgroundActivityVisualDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
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
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "packageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:skipIfEmpty:", v3, CFSTR("packageName"), 1);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "systemImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v5, CFSTR("systemImageName"), 1);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:skipIfEmpty:", v7, CFSTR("imageName"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:skipIfEmpty:", v9, CFSTR("textLabel"), 1);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "backgroundColorRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "appendObject:withName:skipIfNil:", v11, CFSTR("backgroundColorRepresentation"), 1);

  objc_msgSend(*(id *)(a1 + 40), "verticalOffsetInPixels");
  if ((BSFloatIsZero() & 1) == 0)
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "verticalOffsetInPixels");
    v14 = (id)objc_msgSend(v13, "appendDouble:withName:decimalPrecision:", CFSTR("verticalOffsetInPixels"), 1);
  }
  objc_msgSend(*(id *)(a1 + 40), "fontSizeAdjustment");
  if ((BSFloatIsZero() & 1) == 0)
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "fontSizeAdjustment");
    v16 = (id)objc_msgSend(v15, "appendDouble:withName:decimalPrecision:", CFSTR("fontSizeAdjustment"), 1);
  }
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "prefersToKeepContentVisible"), CFSTR("prefersToKeepContentVisible"), 1);
  objc_msgSend(*(id *)(a1 + 40), "preferredVisualEffectName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = BSEqualObjects();

  if ((v19 & 1) == 0)
  {
    v20 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "preferredVisualEffectName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendString:withName:", v21, CFSTR("preferredVisualEffectName"));

  }
  objc_msgSend(*(id *)(a1 + 40), "preferredContinuousAnimationName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = BSEqualObjects();

  if ((v23 & 1) == 0)
  {
    v24 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "preferredContinuousAnimationName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendString:withName:", v25, CFSTR("preferredContinuousAnimationName"));

  }
  v26 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "crossfadableActivities");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendArraySection:withName:skipIfEmpty:", v27, CFSTR("crossfadableActivities"), 1);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[STBackgroundActivityVisualDescriptor packageName](self, "packageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("packageName"));

  -[STBackgroundActivityVisualDescriptor systemImageName](self, "systemImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("systemImageName"));

  -[STBackgroundActivityVisualDescriptor imageName](self, "imageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("imageName"));

  -[STBackgroundActivityVisualDescriptor textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("textLabel"));

  -[STBackgroundActivityVisualDescriptor backgroundColorRepresentation](self, "backgroundColorRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("backgroundColorRepresentation"));

  -[STBackgroundActivityVisualDescriptor verticalOffsetInPixels](self, "verticalOffsetInPixels");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("verticalOffsetInPixels"));
  -[STBackgroundActivityVisualDescriptor fontSizeAdjustment](self, "fontSizeAdjustment");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("fontSizeAdjustment"));
  objc_msgSend(v4, "encodeBool:forKey:", -[STBackgroundActivityVisualDescriptor prefersToKeepContentVisible](self, "prefersToKeepContentVisible"), CFSTR("prefersToKeepContentVisible"));
  -[STBackgroundActivityVisualDescriptor preferredVisualEffectName](self, "preferredVisualEffectName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("preferredVisualEffectName"));

  -[STBackgroundActivityVisualDescriptor preferredContinuousAnimationName](self, "preferredContinuousAnimationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("preferredContinuousAnimationName"));

  -[STBackgroundActivityVisualDescriptor crossfadableActivities](self, "crossfadableActivities");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("crossfadableActivities"));

}

- (STBackgroundActivityVisualDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  STBackgroundActivityVisualDescriptor *v20;
  uint64_t v21;
  NSString *packageName;
  uint64_t v23;
  NSString *systemImageName;
  uint64_t v25;
  NSString *imageName;
  uint64_t v27;
  NSString *textLabel;
  uint64_t v29;
  NSString *preferredVisualEffectName;
  NSObject *v31;
  uint64_t v32;
  NSObject *preferredContinuousAnimationName;
  uint64_t v34;
  NSSet *crossfadableActivities;
  char v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), v5, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("packageName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("systemImageName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("imageName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("textLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("backgroundColorRepresentation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("verticalOffsetInPixels"));
  v14 = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fontSizeAdjustment"));
  v16 = v15;
  v37 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prefersToKeepContentVisible"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("preferredVisualEffectName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("preferredContinuousAnimationName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v7;
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("crossfadableActivities"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[STBackgroundActivityVisualDescriptor init](self, "init");
  if (v20)
  {
    v21 = objc_msgSend(v8, "copy");
    packageName = v20->_packageName;
    v20->_packageName = (NSString *)v21;

    v23 = objc_msgSend(v9, "copy");
    systemImageName = v20->_systemImageName;
    v20->_systemImageName = (NSString *)v23;

    v25 = objc_msgSend(v10, "copy");
    imageName = v20->_imageName;
    v20->_imageName = (NSString *)v25;

    v27 = objc_msgSend(v11, "copy");
    textLabel = v20->_textLabel;
    v20->_textLabel = (NSString *)v27;

    objc_storeStrong((id *)&v20->_backgroundColorRepresentation, v12);
    v20->_verticalOffsetInPixels = v14;
    v20->_fontSizeAdjustment = v16;
    v20->_prefersToKeepContentVisible = v37;
    if (STBackgroundActivityIsVisualEffect(v17))
    {
      v29 = objc_msgSend(v17, "copy");
      preferredVisualEffectName = v20->_preferredVisualEffectName;
      v20->_preferredVisualEffectName = (NSString *)v29;

    }
    else
    {
      STSystemStatusLogBundleLoading();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v17;
        _os_log_error_impl(&dword_1D12C7000, v31, OS_LOG_TYPE_ERROR, "Expected a visual effect name, got: %@", buf, 0xCu);
      }

    }
    if (STBackgroundActivityIsContinuousAnimation(v18))
    {
      v32 = objc_msgSend(v18, "copy");
      preferredContinuousAnimationName = v20->_preferredContinuousAnimationName;
      v20->_preferredContinuousAnimationName = (NSString *)v32;
    }
    else
    {
      STSystemStatusLogBundleLoading();
      preferredContinuousAnimationName = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(preferredContinuousAnimationName, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v18;
        _os_log_error_impl(&dword_1D12C7000, preferredContinuousAnimationName, OS_LOG_TYPE_ERROR, "Expected a continuous animation name, got: %@", buf, 0xCu);
      }
    }

    v34 = objc_msgSend(v19, "copy");
    crossfadableActivities = v20->_crossfadableActivities;
    v20->_crossfadableActivities = (NSSet *)v34;

  }
  return v20;
}

- (STBackgroundActivityVisualDescriptor)initWithPlistRepresentation:(id)a3
{
  id v4;
  STBackgroundActivityVisualDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *systemImageName;
  uint64_t v12;
  NSString *textLabel;
  STBackgroundActivityVisualDescriptorColorRepresentation *v14;
  STBackgroundActivityVisualDescriptorColorRepresentation *backgroundColorRepresentation;
  void *v16;
  double v17;
  void *v18;
  double v19;
  uint64_t v20;
  NSString *preferredVisualEffectName;
  NSObject *v22;
  uint64_t v23;
  NSObject *preferredContinuousAnimationName;
  void *v25;
  void *v26;
  uint64_t v27;
  NSSet *crossfadableActivities;
  NSObject *v29;
  NSObject *v30;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[STBackgroundActivityVisualDescriptor init](self, "init");
  if (!v5)
    goto LABEL_27;
  objc_msgSend(v4, "bs_safeDictionaryForKey:", CFSTR("BackgroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("PreferredVisualEffectName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("PreferredContinuousAnimationName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeDictionaryForKey:", CFSTR("SystemImage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_safeStringForKey:", CFSTR("InternalSymbolName"));
  v10 = objc_claimAutoreleasedReturnValue();
  systemImageName = v5->_systemImageName;
  v5->_systemImageName = (NSString *)v10;

  objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("TextLabel"));
  v12 = objc_claimAutoreleasedReturnValue();
  textLabel = v5->_textLabel;
  v5->_textLabel = (NSString *)v12;

  v14 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithPlistRepresentation:]([STBackgroundActivityVisualDescriptorColorRepresentation alloc], "initWithPlistRepresentation:", v6);
  backgroundColorRepresentation = v5->_backgroundColorRepresentation;
  v5->_backgroundColorRepresentation = v14;

  v5->_prefersToKeepContentVisible = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("PrefersToKeepContentVisible"));
  objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("FontSizeAdjustment"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v5->_fontSizeAdjustment = v17;

  objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("VerticalOffsetInPixels"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v5->_verticalOffsetInPixels = v19;

  if (STBackgroundActivityIsVisualEffect(v7))
  {
    v20 = objc_msgSend(v7, "copy");
    preferredVisualEffectName = v5->_preferredVisualEffectName;
    v5->_preferredVisualEffectName = (NSString *)v20;

  }
  else if (v7)
  {
    STSystemStatusLogBundleLoading();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v32 = 138412290;
      v33 = v7;
      _os_log_error_impl(&dword_1D12C7000, v22, OS_LOG_TYPE_ERROR, "Expected a visual effect name, got: %@", (uint8_t *)&v32, 0xCu);
    }

  }
  if (STBackgroundActivityIsContinuousAnimation(v8))
  {
    v23 = objc_msgSend(v8, "copy");
    preferredContinuousAnimationName = v5->_preferredContinuousAnimationName;
    v5->_preferredContinuousAnimationName = (NSString *)v23;
  }
  else
  {
    if (!v8)
      goto LABEL_14;
    STSystemStatusLogBundleLoading();
    preferredContinuousAnimationName = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(preferredContinuousAnimationName, OS_LOG_TYPE_ERROR))
    {
      v32 = 138412290;
      v33 = v8;
      _os_log_error_impl(&dword_1D12C7000, preferredContinuousAnimationName, OS_LOG_TYPE_ERROR, "Expected a continuous animation name, got: %@", (uint8_t *)&v32, 0xCu);
    }
  }

LABEL_14:
  v25 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "bs_safeArrayForKey:", CFSTR("CrossfadableActivities"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = objc_claimAutoreleasedReturnValue();
  crossfadableActivities = v5->_crossfadableActivities;
  v5->_crossfadableActivities = (NSSet *)v27;

  if (!v5->_systemImageName && objc_msgSend(CFSTR("pulseSymbol"), "isEqualToString:", v8))
  {
    STSystemStatusLogBundleLoading();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_error_impl(&dword_1D12C7000, v29, OS_LOG_TYPE_ERROR, "It's not valid to specify 'pulseSymbol' for a visualDescriptor without a system image", (uint8_t *)&v32, 2u);
    }

  }
  if (!v5->_textLabel && !v5->_systemImageName && !v5->_imageName && !v5->_packageName)
  {
    STSystemStatusLogBundleLoading();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_error_impl(&dword_1D12C7000, v30, OS_LOG_TYPE_ERROR, "A visual descriptor should have a systemImage, image, package, or textLabel — but this one doesn't!", (uint8_t *)&v32, 2u);
    }

  }
LABEL_27:

  return v5;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)textLabel
{
  return self->_textLabel;
}

- (STBackgroundActivityVisualDescriptorColorRepresentation)backgroundColorRepresentation
{
  return self->_backgroundColorRepresentation;
}

- (double)verticalOffsetInPixels
{
  return self->_verticalOffsetInPixels;
}

- (double)fontSizeAdjustment
{
  return self->_fontSizeAdjustment;
}

- (BOOL)prefersToKeepContentVisible
{
  return self->_prefersToKeepContentVisible;
}

- (NSString)preferredVisualEffectName
{
  return self->_preferredVisualEffectName;
}

- (NSString)preferredContinuousAnimationName
{
  return self->_preferredContinuousAnimationName;
}

- (NSSet)crossfadableActivities
{
  return self->_crossfadableActivities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadableActivities, 0);
  objc_storeStrong((id *)&self->_preferredContinuousAnimationName, 0);
  objc_storeStrong((id *)&self->_preferredVisualEffectName, 0);
  objc_storeStrong((id *)&self->_backgroundColorRepresentation, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_packageName, 0);
}

@end
