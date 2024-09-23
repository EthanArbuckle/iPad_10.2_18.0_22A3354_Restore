@implementation TUCallNotificationManager

- (void)deferNotificationsUntilAfterPerformingBlock:(id)a3
{
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a3;
  -[TUCallNotificationManager deferredNotificationBlocks](self, "deferredNotificationBlocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deferredNotificationBlocks was not nil! This means that somehow calls to deferNotificationsUntilAfterPerformingBlock have been nested"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("** TUAssertion failure: %@"), v7);

    if (_TUAssertShouldCrashApplication())
    {
      -[TUCallNotificationManager deferredNotificationBlocks](self, "deferredNotificationBlocks");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUCallNotificationManager.m"), 539, CFSTR("deferredNotificationBlocks was not nil! This means that somehow calls to deferNotificationsUntilAfterPerformingBlock have been nested"));

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallNotificationManager setDeferredNotificationBlocks:](self, "setDeferredNotificationBlocks:", v9);

  v5[2](v5);
  -[TUCallNotificationManager deferredNotificationBlocks](self, "deferredNotificationBlocks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallNotificationManager setDeferredNotificationBlocks:](self, "setDeferredNotificationBlocks:", 0);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)setDeferredNotificationBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_deferredNotificationBlocks, a3);
}

- (NSMutableArray)deferredNotificationBlocks
{
  return self->_deferredNotificationBlocks;
}

- (TUCallNotificationManager)initWithNotificationCenter:(id)a3
{
  return -[TUCallNotificationManager initWithNotificationCenter:wantsCallNotifications:](self, "initWithNotificationCenter:wantsCallNotifications:", a3, 1);
}

- (TUCallNotificationManager)initWithNotificationCenter:(id)a3 wantsCallNotifications:(BOOL)a4
{
  id v7;
  TUCallNotificationManager *v8;
  TUCallNotificationManager *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUCallNotificationManager;
  v8 = -[TUCallNotificationManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationCenter, a3);
    v9->_wantsCallNotifications = a4;
  }

  return v9;
}

- (void)postNotificationsForCall:(id)a3 afterUpdatesInBlock:(id)a4
{
  -[TUCallNotificationManager postNotificationsForCall:usingComparisonCall:afterUpdatesInBlock:](self, "postNotificationsForCall:usingComparisonCall:afterUpdatesInBlock:", a3, a3, a4);
}

- (void)postNotificationsForCall:(id)a3 usingComparisonCall:(id)a4
{
  -[TUCallNotificationManager postNotificationsForCall:usingComparisonCall:afterUpdatesInBlock:](self, "postNotificationsForCall:usingComparisonCall:afterUpdatesInBlock:", a3, a4, 0);
}

- (void)postNotificationsForCall:(id)a3 usingComparisonCall:(id)a4 afterUpdatesInBlock:(id)a5
{
  id v7;
  void (**v8)(id);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void (**v46)(_QWORD);
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  char v52;
  char v53;
  int v54;
  char v55;
  uint64_t v56;
  char v57;
  void *v58;
  void *v59;
  uint64_t v60;
  char v61;
  char v62;
  int v63;
  void *v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  void *v70;
  char v71;
  char v72;
  void *v73;
  void *v74;
  char v75;
  char v76;
  void *v77;
  char v78;
  void *v79;
  uint64_t v80;
  void *v81;
  char v82;
  char v83;
  char v84;
  char v85;
  char v86;
  char v87;
  char v88;
  char v89;
  char v90;
  uint64_t v91;
  char v92;
  char v93;
  char v94;
  char v95;
  int v96;
  int v97;
  char v98;
  char v99;
  char v100;
  char v101;
  int v102;
  int v103;
  int v104;
  char v105;
  char v106;
  uint64_t v107;
  int v108;
  char v109;
  void *v110;
  char v111;
  char v112;
  char v113;
  void *v114;
  uint64_t v115;
  char v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  char v122;
  uint64_t v123;
  char v124;
  int v125;
  char v126;
  char v127;
  char v128;
  uint64_t v129;
  uint64_t v130;
  char v131;
  uint64_t v132;
  char v133;
  char v134;
  void *v135;
  void *v136;
  char v137;
  char v138;
  char v139;
  char v140;
  uint64_t v141;
  char v142;
  int v143;
  char v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char v149;
  uint64_t v150;
  uint64_t v151;
  char v152;
  char v153;
  id v154;
  char v155;
  id v156;
  char v157;
  id v158;
  char v159;
  id v160;
  int v161;
  id v162;
  int v163;
  id v164;
  char v165;
  id v166;
  char v167;
  id v168;
  char v169;
  id v170;
  char v171;
  id v172;
  void (**v173)(id);
  void *v174;
  id v175;
  void *v176;
  void *v177;
  id v178;
  void *v179;
  id v180;
  void *v181;
  id v182;
  void *v183;
  id v184;
  void *v185;
  id v186;
  void *v187;
  id v188;
  void *v189;
  id v190;
  void *v191;
  id v192;
  void *v193;
  id v194;
  void *v195;
  id v196;
  void *v197;
  id v198;
  void *v199;
  id v200;
  void *v201;
  id v202;
  void *v203;
  id v204;
  void *v205;
  id v206;
  id v207;
  id v208;
  _QWORD aBlock[5];
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  id v236;
  id v237;
  id v238;
  id v239;
  id v240;
  id v241;
  id v242;
  id v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  int v276;
  int v277;
  int v278;
  int v279;
  int v280;
  int v281;
  int v282;
  int v283;
  int v284;
  int v285;
  int v286;
  int v287;
  char v288;
  char v289;
  char v290;
  char v291;
  char v292;
  char v293;
  char v294;
  char v295;
  char v296;
  char v297;
  char v298;
  char v299;
  char v300;
  char v301;
  char v302;
  char v303;
  char v304;
  char v305;
  char v306;
  char v307;
  char v308;
  char v309;
  char v310;
  char v311;
  char v312;
  char v313;
  char v314;
  char v315;
  char v316;
  char v317;
  char v318;
  char v319;
  char v320;
  char v321;
  char v322;
  char v323;
  char v324;
  char v325;
  char v326;
  char v327;
  char v328;
  char v329;
  char v330;
  char v331;
  char v332;
  char v333;
  char v334;
  char v335;
  char v336;
  char v337;
  char v338;
  char v339;
  char v340;
  char v341;
  char v342;
  char v343;
  char v344;
  char v345;
  char v346;
  char v347;
  char v348;
  char v349;
  char v350;
  char v351;
  char v352;
  char v353;

  v207 = a3;
  v7 = a4;
  v8 = (void (**)(id))a5;
  if (postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___pred_CGRectEqualToRectCoreGraphics != -1)
    dispatch_once(&postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___pred_CGRectEqualToRectCoreGraphics, &__block_literal_global_41);
  objc_msgSend(v7, "activeRemoteParticipant");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callerNameFromNetwork");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v7, "status");
  v171 = objc_msgSend(v7, "isConnecting");
  v169 = objc_msgSend(v7, "isConnected");
  v167 = objc_msgSend(v7, "wantsHoldMusic");
  v165 = objc_msgSend(v7, "isEndpointOnCurrentDevice");
  v131 = objc_msgSend(v7, "shouldSuppressRingtone");
  v163 = objc_msgSend(v7, "faceTimeIDStatus");
  objc_msgSend(v7, "hardPauseDigits");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = objc_msgSend(v7, "hardPauseDigitsState");
  v159 = objc_msgSend(v7, "needsManualInCallSounds");
  v157 = objc_msgSend(v7, "hasSentInvitation");
  objc_msgSend(v7, "imageURL");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v7, "isUsingBaseband");
  v155 = objc_msgSend(v7, "isOnHold");
  v153 = objc_msgSend(v7, "isUplinkMuted");
  v152 = objc_msgSend(v7, "isSendingAudio");
  v149 = objc_msgSend(v7, "isSendingVideo");
  v144 = objc_msgSend(v7, "isSharingScreen");
  v142 = objc_msgSend(v7, "isThirdPartyVideo");
  v140 = objc_msgSend(v7, "isMediaStalled");
  v139 = objc_msgSend(v7, "isVideoDegraded");
  v137 = objc_msgSend(v7, "isVideoPaused");
  v138 = objc_msgSend(v7, "isVideoMirrored");
  objc_msgSend(v7, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v197 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayContext");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = objc_msgSend(v7, "isEmergency");
  v133 = objc_msgSend(v7, "isFailureExpected");
  v128 = objc_msgSend(v7, "supportsEmergencyFallback");
  objc_msgSend(v7, "audioCategory");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioMode");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v7, "ttyType");
  v124 = objc_msgSend(v7, "supportsTTYWithVoice");
  v123 = objc_msgSend(v7, "bluetoothAudioFormat");
  objc_msgSend(v7, "remoteAspectRatio");
  v151 = v10;
  v150 = v11;
  objc_msgSend(v7, "remoteVideoContentRect");
  v148 = v12;
  v147 = v13;
  v146 = v14;
  v145 = v15;
  v115 = objc_msgSend(v7, "cameraType");
  v141 = objc_msgSend(v7, "remoteCameraOrientation");
  v132 = objc_msgSend(v7, "remoteScreenOrientation");
  objc_msgSend(v7, "remoteScreenAspectRatio");
  v129 = v17;
  v130 = v16;
  v127 = objc_msgSend(v7, "prefersExclusiveAccessToCellularNetwork");
  v126 = objc_msgSend(v7, "isRemoteUplinkMuted");
  objc_msgSend(v7, "localSenderIdentityAccountUUID");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "model");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "providerContext");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteParticipantHandles");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v7, "isVideo");
  v120 = objc_msgSend(v7, "videoStreamToken");
  v118 = objc_msgSend(v7, "answeringMachineStreamToken");
  v117 = objc_msgSend(v7, "isConversation");
  objc_msgSend(v7, "callGroupUUID");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v7, "mixesVoiceWithMedia");
  objc_msgSend(v7, "screenShareAttributes");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v7, "serviceStatus");
  v107 = objc_msgSend(v7, "transmissionMode");
  v106 = objc_msgSend(v7, "isReceivingTransmission");
  v105 = objc_msgSend(v7, "isSendingTransmission");
  v111 = objc_msgSend(v7, "isScreening");
  v109 = objc_msgSend(v7, "screeningAnnouncementHasFinished");
  v113 = objc_msgSend(v7, "hasBeenRedirected");
  v112 = objc_msgSend(v7, "supportsDTMFUpdates");
  v104 = objc_msgSend(v7, "callSubType");
  objc_msgSend(v7, "recordingSession");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v7, "recordingAvailability");
  objc_msgSend(v7, "tokens");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v8[2](v8);
  v173 = v8;
  objc_msgSend(v7, "activeRemoteParticipant");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callerNameFromNetwork");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v7, "status");
  v103 = objc_msgSend(v7, "callSubType");
  v18 = objc_msgSend(v7, "isConnecting");
  v101 = objc_msgSend(v7, "isConnected");
  v100 = objc_msgSend(v7, "wantsHoldMusic");
  v99 = objc_msgSend(v7, "isEndpointOnCurrentDevice");
  v98 = objc_msgSend(v7, "shouldSuppressRingtone");
  v97 = objc_msgSend(v7, "faceTimeIDStatus");
  objc_msgSend(v7, "hardPauseDigits");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v7, "hardPauseDigitsState");
  v95 = objc_msgSend(v7, "needsManualInCallSounds");
  v94 = objc_msgSend(v7, "hasSentInvitation");
  objc_msgSend(v7, "imageURL");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v7, "isUsingBaseband");
  v92 = objc_msgSend(v7, "isOnHold");
  v90 = objc_msgSend(v7, "isUplinkMuted");
  v89 = objc_msgSend(v7, "isSendingAudio");
  v88 = objc_msgSend(v7, "isSendingVideo");
  v87 = objc_msgSend(v7, "isSharingScreen");
  v86 = objc_msgSend(v7, "isThirdPartyVideo");
  v85 = objc_msgSend(v7, "isMediaStalled");
  v84 = objc_msgSend(v7, "isVideoDegraded");
  v82 = objc_msgSend(v7, "isVideoPaused");
  v83 = objc_msgSend(v7, "isVideoMirrored");
  objc_msgSend(v7, "handle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "value");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayContext");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v7, "isEmergency");
  v72 = objc_msgSend(v7, "isFailureExpected");
  v71 = objc_msgSend(v7, "supportsEmergencyFallback");
  objc_msgSend(v7, "audioCategory");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioMode");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v7, "ttyType");
  v62 = objc_msgSend(v7, "supportsTTYWithVoice");
  v60 = objc_msgSend(v7, "bluetoothAudioFormat");
  objc_msgSend(v7, "remoteAspectRatio");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v7, "remoteVideoContentRect");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v56 = objc_msgSend(v7, "cameraType");
  v91 = objc_msgSend(v7, "remoteCameraOrientation");
  v80 = objc_msgSend(v7, "remoteScreenOrientation");
  objc_msgSend(v7, "remoteScreenAspectRatio");
  v33 = v32;
  v35 = v34;
  v78 = objc_msgSend(v7, "prefersExclusiveAccessToCellularNetwork");
  v76 = objc_msgSend(v7, "isRemoteUplinkMuted");
  objc_msgSend(v7, "localSenderIdentityAccountUUID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "model");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "providerContext");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteParticipantHandles");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v7, "isVideo");
  v67 = objc_msgSend(v7, "videoStreamToken");
  v66 = objc_msgSend(v7, "answeringMachineStreamToken");
  v65 = objc_msgSend(v7, "isConversation");
  objc_msgSend(v7, "callGroupUUID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v7, "mixesVoiceWithMedia");
  objc_msgSend(v7, "screenShareAttributes");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v7, "serviceStatus");
  v36 = objc_msgSend(v7, "transmissionMode");
  v37 = objc_msgSend(v7, "isReceivingTransmission");
  v38 = objc_msgSend(v7, "isSendingTransmission");
  v53 = objc_msgSend(v7, "isScreening");
  v52 = objc_msgSend(v7, "screeningAnnouncementHasFinished");
  v57 = objc_msgSend(v7, "hasBeenRedirected");
  v55 = objc_msgSend(v7, "supportsDTMFUpdates");
  objc_msgSend(v7, "recordingSession");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v7, "recordingAvailability");
  objc_msgSend(v7, "tokens");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v276 = v143;
  v277 = v102;
  v244 = v107;
  v245 = v36;
  v288 = v106;
  v289 = v37;
  v290 = v105;
  v291 = v38;
  v292 = v171;
  v293 = v18;
  v294 = v169;
  v295 = v101;
  v296 = v167;
  v297 = v100;
  v298 = v165;
  v299 = v99;
  v300 = v131;
  v301 = v98;
  v278 = v163;
  v279 = v97;
  v280 = v161;
  v281 = v96;
  v302 = v159;
  v303 = v95;
  v304 = v157;
  v305 = v94;
  v306 = v121;
  v307 = v93;
  v308 = v155;
  v309 = v92;
  v310 = v153;
  v311 = v90;
  v312 = v152;
  v313 = v89;
  v314 = v149;
  v315 = v88;
  v316 = v144;
  v317 = v87;
  v318 = v142;
  v319 = v86;
  v320 = v140;
  v321 = v85;
  v322 = v139;
  v323 = v84;
  v324 = v137;
  v325 = v82;
  v326 = v134;
  v327 = v75;
  v328 = v133;
  v329 = v72;
  v330 = v128;
  v331 = v71;
  v282 = v104;
  v283 = v103;
  v284 = v125;
  v285 = v63;
  v332 = v124;
  v333 = v62;
  v246 = v123;
  v247 = v60;
  v248 = v115;
  v249 = v56;
  v334 = v138;
  v335 = v83;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[2] = __94__TUCallNotificationManager_postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___block_invoke_2;
  aBlock[3] = &unk_1E38A36F0;
  aBlock[1] = 3221225472;
  aBlock[4] = self;
  v211 = v207;
  v212 = v205;
  v213 = v181;
  v214 = v203;
  v215 = v179;
  v216 = v201;
  v217 = v177;
  v218 = v199;
  v219 = v176;
  v220 = v197;
  v221 = v81;
  v222 = v195;
  v223 = v73;
  v224 = v193;
  v225 = v64;
  v226 = v191;
  v227 = v59;
  v250 = v132;
  v251 = v80;
  v252 = v130;
  v253 = v129;
  v254 = v33;
  v255 = v35;
  v336 = v127;
  v337 = v78;
  v338 = v126;
  v339 = v76;
  v228 = v189;
  v229 = v51;
  v230 = v187;
  v231 = v174;
  v232 = v185;
  v233 = v79;
  v340 = v122;
  v341 = v68;
  v234 = v183;
  v235 = v77;
  v256 = v120;
  v257 = v67;
  v258 = v118;
  v259 = v66;
  v342 = v117;
  v343 = v65;
  v236 = v136;
  v237 = v70;
  v344 = v116;
  v345 = v61;
  v346 = v111;
  v347 = v53;
  v348 = v109;
  v349 = v52;
  v260 = v151;
  v261 = v150;
  v262 = v21;
  v263 = v23;
  v264 = v148;
  v265 = v147;
  v266 = v146;
  v267 = v145;
  v268 = v25;
  v269 = v27;
  v270 = v29;
  v271 = v31;
  v272 = v141;
  v273 = v91;
  v350 = v57;
  v351 = v113;
  v352 = v55;
  v353 = v112;
  v238 = v135;
  v239 = v74;
  v274 = v119;
  v275 = v69;
  v240 = v114;
  v241 = v58;
  v286 = v108;
  v287 = v54;
  v242 = v110;
  v243 = v39;
  v172 = v39;
  v170 = v110;
  v168 = v58;
  v166 = v114;
  v164 = v74;
  v154 = v135;
  v162 = v70;
  v160 = v136;
  v158 = v77;
  v184 = v183;
  v156 = v79;
  v186 = v185;
  v175 = v174;
  v40 = v187;
  v41 = v51;
  v42 = v189;
  v43 = v59;
  v44 = v191;
  v45 = v64;
  v194 = v193;
  v192 = v73;
  v196 = v195;
  v190 = v81;
  v198 = v197;
  v188 = v176;
  v200 = v199;
  v178 = v177;
  v202 = v201;
  v180 = v179;
  v204 = v203;
  v182 = v181;
  v206 = v205;
  v208 = v207;
  v46 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[TUCallNotificationManager deferredNotificationBlocks](self, "deferredNotificationBlocks");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[TUCallNotificationManager deferredNotificationBlocks](self, "deferredNotificationBlocks");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v40;
    v50 = _Block_copy(v46);
    objc_msgSend(v48, "addObject:", v50);

    v40 = v49;
  }
  else
  {
    v46[2](v46);
  }

}

uint64_t (*__94__TUCallNotificationManager_postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___block_invoke())(_QWORD, double, double, double, double, double, double, double, double)
{
  uint64_t (*result)(_QWORD, double, double, double, double, double, double, double, double);

  result = (uint64_t (*)(_QWORD, double, double, double, double, double, double, double, double))CUTWeakLinkSymbol();
  postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___CGRectEqualToRect = result;
  return result;
}

uint64_t __94__TUCallNotificationManager_postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  int v3;
  int v4;
  int v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  _BOOL8 v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  int v34;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsCallNotifications");
  if (!(_DWORD)result)
    return result;
  v3 = objc_msgSend(*(id *)(a1 + 40), "isPTT");
  v4 = *(_DWORD *)(a1 + 560);
  v5 = *(_DWORD *)(a1 + 564);
  if (v4 == v5)
    v6 = 0;
  else
    v6 = v3;
  if (v4 != v5)
    objc_msgSend(*(id *)(a1 + 32), "statusChangedForCall:", *(_QWORD *)(a1 + 40));
  if ((TUObjectsAreEqualOrNil(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    v7 = CFSTR("TUCallActiveRemoteParticipantChangedNotification");
    if (objc_msgSend(*(id *)(a1 + 40), "isPTT"))
    {
      v8 = CFSTR("TUBargeCallActiveRemoteParticipantChangedNotification");
      if (v6)
        v8 = 0;
      v9 = v8;

      v7 = v9;
    }
    if (-[__CFString length](v7, "length"))
      objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:object:", v7, *(_QWORD *)(a1 + 40));

  }
  if ((TUObjectsAreEqualOrNil(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72)) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isPTT"))
    {
      v10 = CFSTR("TUBargeCallNameChangedNotification");
      if (v6)
        v10 = 0;
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    if (-[__CFString length](v11, "length"))
      objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:object:", v11, *(_QWORD *)(a1 + 40));

  }
  if (*(_QWORD *)(a1 + 304) != *(_QWORD *)(a1 + 312))
  {
    v12 = CFSTR("TUCallTransmissionModeChangedNotification");
    if (objc_msgSend(*(id *)(a1 + 40), "isPTT"))
    {
      v13 = CFSTR("TUBargeCallTransmissionModeChangedNotification");
      if (v6)
        v13 = 0;
      v14 = v13;

      v12 = v14;
    }
    if (-[__CFString length](v12, "length"))
      objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:object:", v12, *(_QWORD *)(a1 + 40));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "isActive")
    && (*(unsigned __int8 *)(a1 + 608) != *(unsigned __int8 *)(a1 + 609)
     || *(unsigned __int8 *)(a1 + 610) != *(unsigned __int8 *)(a1 + 611)))
  {
    v15 = CFSTR("TUCallTransmissionStateChangedNotification");
    if (objc_msgSend(*(id *)(a1 + 40), "isPTT"))
    {
      v16 = CFSTR("TUBargeCallTransmissionStateChangedNotification");
      if (v6)
        v16 = 0;
      v17 = v16;

      v15 = v17;
    }
    if (-[__CFString length](v15, "length"))
      objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:object:", v15, *(_QWORD *)(a1 + 40));

  }
  if (*(unsigned __int8 *)(a1 + 612) != *(unsigned __int8 *)(a1 + 613))
    objc_msgSend(*(id *)(a1 + 32), "connectingChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 614) != *(unsigned __int8 *)(a1 + 615))
    objc_msgSend(*(id *)(a1 + 32), "connectedChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 616) != *(unsigned __int8 *)(a1 + 617))
    objc_msgSend(*(id *)(a1 + 32), "wantsHoldMusicChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 618) != *(unsigned __int8 *)(a1 + 619))
    objc_msgSend(*(id *)(a1 + 32), "endpointOnCurrentDeviceChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 620) != *(unsigned __int8 *)(a1 + 621))
    objc_msgSend(*(id *)(a1 + 32), "shouldSuppressRingtoneChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(_DWORD *)(a1 + 568) != *(_DWORD *)(a1 + 572))
    objc_msgSend(*(id *)(a1 + 32), "faceTimeIDStatusChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(_DWORD *)(a1 + 576) != *(_DWORD *)(a1 + 580)
    || (TUStringsAreEqualOrNil(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "hardPauseDigitsStateChangedForCall:", *(_QWORD *)(a1 + 40));
  }
  if (*(unsigned __int8 *)(a1 + 622) != *(unsigned __int8 *)(a1 + 623))
    objc_msgSend(*(id *)(a1 + 32), "needsManualInCallSoundsChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 624) != *(unsigned __int8 *)(a1 + 625))
    objc_msgSend(*(id *)(a1 + 32), "hasSentInvitationChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 626) != *(unsigned __int8 *)(a1 + 627))
    objc_msgSend(*(id *)(a1 + 32), "isUsingBasebandChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 628) != *(unsigned __int8 *)(a1 + 629))
    objc_msgSend(*(id *)(a1 + 32), "isOnHoldChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 630) != *(unsigned __int8 *)(a1 + 631))
    objc_msgSend(*(id *)(a1 + 32), "isUplinkMutedChangedForCall:", *(_QWORD *)(a1 + 40));
  if ((TUObjectsAreEqualOrNil(*(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104)) & 1) == 0)
  {
    v18 = CFSTR("TUCallImageURLChangedNotification");
    if (objc_msgSend(*(id *)(a1 + 40), "isPTT"))
    {
      v19 = CFSTR("TUBargeCallImageURLChangedNotification");
      if (v6)
        v19 = 0;
      v20 = v19;

      v18 = v20;
    }
    if (-[__CFString length](v18, "length"))
      objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:object:", v18, *(_QWORD *)(a1 + 40));

  }
  if (*(unsigned __int8 *)(a1 + 632) != *(unsigned __int8 *)(a1 + 633))
    objc_msgSend(*(id *)(a1 + 32), "isSendingAudioChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 634) != *(unsigned __int8 *)(a1 + 635))
    objc_msgSend(*(id *)(a1 + 32), "isSendingVideoChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 636) != *(unsigned __int8 *)(a1 + 637))
    objc_msgSend(*(id *)(a1 + 32), "sharingScreenChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 638) != *(unsigned __int8 *)(a1 + 639))
    objc_msgSend(*(id *)(a1 + 32), "isThirdPartyVideoChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 640) != *(unsigned __int8 *)(a1 + 641))
    objc_msgSend(*(id *)(a1 + 32), "mediaStalledChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 642) != *(unsigned __int8 *)(a1 + 643))
    objc_msgSend(*(id *)(a1 + 32), "videoDegradedChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 644) != *(unsigned __int8 *)(a1 + 645))
    objc_msgSend(*(id *)(a1 + 32), "videoPausedChangedForCall:", *(_QWORD *)(a1 + 40));
  if ((TUStringsAreEqualOrNil(*(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "destinationIDChangedForCall:", *(_QWORD *)(a1 + 40));
  if ((TUObjectsAreEqualOrNil(*(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "displayContextChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 646) != *(unsigned __int8 *)(a1 + 647))
    objc_msgSend(*(id *)(a1 + 32), "isEmergencyChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 648) != *(unsigned __int8 *)(a1 + 649))
    objc_msgSend(*(id *)(a1 + 32), "isFailureExpectedChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 650) != *(unsigned __int8 *)(a1 + 651))
    objc_msgSend(*(id *)(a1 + 32), "supportsEmergencyFallbackChangedForCall:", *(_QWORD *)(a1 + 40));
  if (!TUStringsAreEqualOrNil(*(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152))
    || !TUStringsAreEqualOrNil(*(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168))
    || *(_DWORD *)(a1 + 584) != *(_DWORD *)(a1 + 588))
  {
    objc_msgSend(*(id *)(a1 + 32), "audioPropertiesChangedForCall:", *(_QWORD *)(a1 + 40));
  }
  if (*(_DWORD *)(a1 + 592) != *(_DWORD *)(a1 + 596))
    objc_msgSend(*(id *)(a1 + 32), "ttyTypeChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 652) != *(unsigned __int8 *)(a1 + 653))
    objc_msgSend(*(id *)(a1 + 32), "supportsTTYWithVoiceChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 320) != *(_QWORD *)(a1 + 328))
    objc_msgSend(*(id *)(a1 + 32), "bluetoothAudioFormatChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 336) != *(_QWORD *)(a1 + 344))
    objc_msgSend(*(id *)(a1 + 32), "cameraTypeChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 654) != *(unsigned __int8 *)(a1 + 655))
    objc_msgSend(*(id *)(a1 + 32), "videoMirroredChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 352) != *(_QWORD *)(a1 + 360))
    objc_msgSend(*(id *)(a1 + 32), "remoteScreenOrientationChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(double *)(a1 + 368) != *(double *)(a1 + 384) || *(double *)(a1 + 376) != *(double *)(a1 + 392))
    objc_msgSend(*(id *)(a1 + 32), "remoteScreenAspectRatioChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 656) != *(unsigned __int8 *)(a1 + 657))
    objc_msgSend(*(id *)(a1 + 32), "prefersExclusiveAccessToCellularNetworkChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 658) != *(unsigned __int8 *)(a1 + 659))
    objc_msgSend(*(id *)(a1 + 32), "remoteUplinkMutedChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 176) != *(_QWORD *)(a1 + 184))
    objc_msgSend(*(id *)(a1 + 32), "localSenderIdentityAccountUUIDChangedForCall:", *(_QWORD *)(a1 + 40));
  if ((TUObjectsAreEqualOrNil(*(_QWORD *)(a1 + 192), *(_QWORD *)(a1 + 200)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "modelChangedForCall:", *(_QWORD *)(a1 + 40));
  if ((TUObjectsAreEqualOrNil(*(_QWORD *)(a1 + 208), *(_QWORD *)(a1 + 216)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "providerContextChangedForCall:", *(_QWORD *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 660)
    || !*(_BYTE *)(a1 + 661)
    && (objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:object:", CFSTR("TUCallDowngradedToAudioNotification"), *(_QWORD *)(a1 + 40)), !*(_BYTE *)(a1 + 660)))
  {
    if (*(_BYTE *)(a1 + 661))
      objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:object:", CFSTR("TUCallUpgradedToVideoNotification"), *(_QWORD *)(a1 + 40));
  }
  if ((TUObjectsAreEqualOrNil(*(_QWORD *)(a1 + 224), *(_QWORD *)(a1 + 232)) & 1) == 0)
  {
    v21 = CFSTR("TUCallRemoteParticipantHandlesChangedNotification");
    if (objc_msgSend(*(id *)(a1 + 40), "isPTT"))
    {
      v22 = CFSTR("TUBargeCallRemoteParticipantHandlesChangedNotification");
      if (v6)
        v22 = 0;
      v23 = v22;

      v21 = v23;
    }
    if (-[__CFString length](v21, "length"))
      objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:object:", v21, *(_QWORD *)(a1 + 40));

  }
  if (*(_QWORD *)(a1 + 400) != *(_QWORD *)(a1 + 408))
    objc_msgSend(*(id *)(a1 + 32), "videoStreamTokenChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 416) != *(_QWORD *)(a1 + 424))
    objc_msgSend(*(id *)(a1 + 32), "answeringMachineStreamTokenChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 662) != *(unsigned __int8 *)(a1 + 663))
    objc_msgSend(*(id *)(a1 + 32), "conversationChangedForCall:", *(_QWORD *)(a1 + 40));
  v24 = TUObjectsAreEqualOrNil(*(_QWORD *)(a1 + 240), *(_QWORD *)(a1 + 248));
  if ((v24 & 1) == 0)
    v24 = objc_msgSend(*(id *)(a1 + 32), "callGroupUUIDChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 664) != *(unsigned __int8 *)(a1 + 665))
    v24 = objc_msgSend(*(id *)(a1 + 32), "mixesVoiceWithMediaChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 666) != *(unsigned __int8 *)(a1 + 667))
    v24 = objc_msgSend(*(id *)(a1 + 32), "isScreeningChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 668) != *(unsigned __int8 *)(a1 + 669))
    v24 = objc_msgSend(*(id *)(a1 + 32), "screeningAnnouncementFinishedChangedForCall:", *(_QWORD *)(a1 + 40));
  v25 = *(double *)(a1 + 440) != *(double *)(a1 + 456) || *(double *)(a1 + 432) != *(double *)(a1 + 448);
  if (v25)
    v24 = objc_msgSend(*(id *)(a1 + 32), "remoteAspectRatioChangedForCall:", *(_QWORD *)(a1 + 40));
  v26 = postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___CGRectEqualToRect(v24, *(double *)(a1 + 464), *(double *)(a1 + 472), *(double *)(a1 + 480), *(double *)(a1 + 488), *(double *)(a1 + 496), *(double *)(a1 + 504), *(double *)(a1 + 512), *(double *)(a1 + 520));
  if ((v26 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "remoteVideoContentRectChangedForCall:", *(_QWORD *)(a1 + 40));
  v27 = *(_QWORD *)(a1 + 528);
  v28 = *(_QWORD *)(a1 + 536);
  if (v27 != v28)
    objc_msgSend(*(id *)(a1 + 32), "remoteCameraOrientationChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 670) != *(unsigned __int8 *)(a1 + 671))
    objc_msgSend(*(id *)(a1 + 32), "hasBeenRedirectedChangedForCall:", *(_QWORD *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 672) != *(unsigned __int8 *)(a1 + 673))
    objc_msgSend(*(id *)(a1 + 32), "supportsDTMFUpdatesChangedForCall:", *(_QWORD *)(a1 + 40));
  if ((TUObjectsAreEqualOrNil(*(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 264)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:object:", CFSTR("TUCallScreenShareAttributesChangedNotification"), *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 544) != *(_QWORD *)(a1 + 552))
  {
    v29 = CFSTR("TUCallServiceStatusChangedNotification");
    if (objc_msgSend(*(id *)(a1 + 40), "isPTT"))
    {
      v30 = CFSTR("TUBargeCallServiceStatusChangedNotification");
      if (v6)
        v30 = 0;
      v31 = v30;

      v29 = v31;
    }
    if (-[__CFString length](v29, "length"))
      objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:object:", v29, *(_QWORD *)(a1 + 40));

  }
  if (v25 | v26 ^ 1u || v27 != v28)
    objc_msgSend(*(id *)(a1 + 32), "mediaPropertiesChangedForCall:remoteAspectRatioDidChange:remoteCameraOrientationDidChange:", *(_QWORD *)(a1 + 40), v25, v27 != v28);
  v32 = *(void **)(a1 + 272);
  v33 = *(_QWORD *)(a1 + 280);
  if (v32)
  {
    if (!v33)
      goto LABEL_186;
  }
  else if (v33)
  {
LABEL_186:
    objc_msgSend(*(id *)(a1 + 32), "callRecordingStateChanged:", *(_QWORD *)(a1 + 40));
    goto LABEL_187;
  }
  v34 = objc_msgSend(v32, "recordingState");
  if (v34 != objc_msgSend(*(id *)(a1 + 280), "recordingState"))
    goto LABEL_186;
LABEL_187:
  if (*(_DWORD *)(a1 + 600) != *(_DWORD *)(a1 + 604))
    objc_msgSend(*(id *)(a1 + 32), "callRecordingAvailabilityChangedForCall:", *(_QWORD *)(a1 + 40));
  result = TUObjectsAreEqualOrNil(*(_QWORD *)(a1 + 288), *(_QWORD *)(a1 + 296));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "mediaTokensChangedForCall:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)postNotificationsForCallContainer:(id)a3 afterUpdatesInBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  TUCallNotificationManager *v23;
  id v24;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "conferenceParticipantCalls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7);
  objc_msgSend(v6, "conferenceParticipantCalls");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __83__TUCallNotificationManager_postNotificationsForCallContainer_afterUpdatesInBlock___block_invoke;
  v20 = &unk_1E38A1B38;
  v21 = v8;
  v22 = v9;
  v23 = self;
  v24 = v6;
  v10 = v6;
  v11 = v9;
  v12 = v8;
  v13 = (void (**)(_QWORD))_Block_copy(&v17);
  -[TUCallNotificationManager deferredNotificationBlocks](self, "deferredNotificationBlocks", v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TUCallNotificationManager deferredNotificationBlocks](self, "deferredNotificationBlocks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = _Block_copy(v13);
    objc_msgSend(v15, "addObject:", v16);

  }
  else
  {
    v13[2](v13);
  }

}

uint64_t __83__TUCallNotificationManager_postNotificationsForCallContainer_afterUpdatesInBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result != *(_QWORD *)(a1 + 40))
  {
    result = objc_msgSend((id)result, "isEqualToArray:");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 48), "conferenceParticipantCallsChangedForCallContainer:conferenceParticipantCalls:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_postNotificationName:(id)a3 object:(id)a4
{
  -[TUCallNotificationManager _postNotificationName:object:userInfo:](self, "_postNotificationName:object:userInfo:", a3, a4, 0);
}

- (void)_postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Posting %@ with object %@ userInfo %@", (uint8_t *)&v13, 0x20u);
  }

  -[TUCallNotificationManager notificationCenter](self, "notificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", v8, v9, v10);

}

- (void)statusChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "statusChangedForCall %@", (uint8_t *)&v8, 0xCu);
  }

  if (objc_msgSend(v4, "isVideo"))
  {
    -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterVideoCallStatusChangedNotification"), v4);
  }
  else
  {
    -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterCallStatusChangedInternalNotification"), v4);
    v6 = CFSTR("TUCallCenterCallStatusChangedNotification");
    if (objc_msgSend(v4, "isPTT"))
    {
      v7 = CFSTR("TUBargeCallStatusChangedNotification");

      v6 = v7;
    }
    -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", v6, v4);

  }
}

- (void)connectingChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "connectingChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  if (objc_msgSend(v4, "isConnecting"))
    -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterCallStartedConnectingNotification"), v4);

}

- (void)connectedChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "connectedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  if (objc_msgSend(v4, "isConnected"))
    -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterCallConnectedNotification"), v4);

}

- (void)wantsHoldMusicChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "wantsHoldMusicChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterCallWantsHoldMusicChangedNotification"), v4);
}

- (void)endpointOnCurrentDeviceChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "endpointOnCurrentDeviceChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterCallContinuityStateChangedNotification"), v4);
}

- (void)shouldSuppressRingtoneChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "shouldSuppressRingtoneChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallShouldSuppressRingingChangedNotification"), v4);
}

- (void)faceTimeIDStatusChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "faceTimeIDStatusChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallFaceTimeIDStatusChangedNotification"), v4);
}

- (void)hardPauseDigitsStateChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "hardPauseDigitsStateChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallHardPauseDigitsStateChangedNotification"), v4);
}

- (void)needsManualInCallSoundsChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "needsManualInCallSoundsChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallNeedsManualInCallSoundsChangedNotification"), v4);
}

- (void)hasSentInvitationChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  _QWORD *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "hasSentInvitationChangedForCall %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = objc_msgSend(v4, "isVideo");
  v7 = &TUCallCenterVideoCallInvitationSentNotification;
  if (!v6)
    v7 = &TUCallCenterCallInvitationSentNotification;
  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", *v7, v4);

}

- (void)isUsingBasebandChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "isUsingBasebandChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallIsUsingBasebandChangedNotification"), v4);
}

- (void)isOnHoldChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "isOnHoldChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallIsOnHoldChangedNotification"), v4);
}

- (void)isUplinkMutedChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "isUplinkMutedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallIsUplinkMutedChangedNotification"), v4);
}

- (void)destinationIDChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "destinationIDChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterCallerIDChangedNotification"), v4);
}

- (void)displayContextChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "displayContextChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallDisplayContextChangedNotification"), v4);
}

- (void)isEmergencyChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "isEmergencyChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterIsEmergencyChangedNotification"), v4);
}

- (void)isFailureExpectedChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "isFailureExpectedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterIsFailureExpectedChangedNotification"), v4);
}

- (void)supportsEmergencyFallbackChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "supportsEmergencyFallbackChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterSupportsEmergencyFallbackChangedNotification"), v4);
}

- (void)isSendingAudioChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "isSendingAudioChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallIsSendingAudioChangedNotification"), v4);
}

- (void)isSendingVideoChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "isSendingVideoChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallIsSendingVideoChangedNotification"), v4);
}

- (void)sharingScreenChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "sharingScreenChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallIsSharingScreenChangedNotification"), v4);
}

- (void)isThirdPartyVideoChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "isThirdPartyVideoChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallIsThirdPartyVideoChangedNotification"), v4);
}

- (void)mediaStalledChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "mediaStalledChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterVideoCallMediaStalledChangedNotification"), v4);
}

- (void)videoDegradedChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "videoDegradedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterVideoCallVideoQualityChangedNotification"), v4);
}

- (void)videoPausedChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "videoPausedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterVideoCallPauseChangedNotification"), v4);
}

- (void)audioPropertiesChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "audioPropertiesChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallAudioPropertiesChangedNotification"), v4);
}

- (void)ttyTypeChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "ttyTypeChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallTTYTypeChangedNotification"), v4);
}

- (void)bluetoothAudioFormatChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "bluetoothAudioFormatChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallBluetoothAudioFormatChangedNotification"), v4);
}

- (void)remoteUplinkMutedChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "remoteUplinkMutedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallRemoteUplinkMutedChangedNotification"), v4);
}

- (void)localSenderIdentityAccountUUIDChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "localSenderIdentityAccountUUIDChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallLocalSenderIdentityAccountUUIDChangedNotification"), v4);
}

- (void)supportsTTYWithVoiceChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "supportsTTYWithVoiceChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallSupportsTTYWithVoiceChangedNotification"), v4);
}

- (void)remoteAspectRatioChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "remoteAspectRatioChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallRemoteAspectRatioChangedNotification"), v4);
}

- (void)remoteVideoContentRectChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "remoteVideoContentRectChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallRemoteVideoContentRectChangedNotification"), v4);
}

- (void)cameraTypeChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "cameraTypeChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCameraTypeChangedNotification"), v4);
}

- (void)videoMirroredChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "videoMirroredChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUVideoMirroredChangedNotification"), v4);
}

- (void)remoteCameraOrientationChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "remoteCameraOrientationChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallRemoteCameraOrientationChangedNotification"), v4);
}

- (void)remoteScreenOrientationChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "remoteScreenOrientationChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallRemoteScreenOrientationChangedNotification"), v4);
}

- (void)remoteScreenAspectRatioChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "remoteScreenAspectRatioChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallRemoteScreenAspectRatioChangedNotification"), v4);
}

- (void)providerContextChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "providerContextChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallProviderContextChangedNotification"), v4);
}

- (void)mediaPropertiesChangedForCall:(id)a3 remoteAspectRatioDidChange:(BOOL)a4 remoteCameraOrientationDidChange:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v5 = a5;
  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "mediaPropertiesChangedForCall %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v8, "remoteAspectRatio");
    objc_msgSend(v11, "valueWithSize:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("TUCallCenterVideoCallCameraAspectRatioKey"));

  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "remoteCameraOrientation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("TUCallCenterVideoCallCameraOrientationKey"));

  }
  v14 = (void *)objc_msgSend(v10, "copy");
  -[TUCallNotificationManager _postNotificationName:object:userInfo:](self, "_postNotificationName:object:userInfo:", CFSTR("TUCallCenterVideoCallMediaPropertiesChangedNotification"), v8, v14);

}

- (void)videoStreamTokenChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "videoStreamTokenChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallVideoStreamTokenChangedNotification"), v4);
}

- (void)answeringMachineStreamTokenChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "answeringMachineStreamTokenChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallAnsewringMachineStreamTokenChangedNotification"), v4);
}

- (void)conversationChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "conversationChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallConversationChangedNotification"), v4);
}

- (void)callGroupUUIDChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "callGroupUUIDChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallGroupUUIDChangedNotification"), v4);
}

- (void)mixesVoiceWithMediaChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "mixesVoiceWithMediaChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallMixesVoiceWithMediaChangedNotification"), v4);
}

- (void)prefersExclusiveAccessToCellularNetworkChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "prefersExclusiveAccessToCellularNetworkChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallPrefersExclusiveAccessToCellularNetworkChangedNotification"), v4);
}

- (void)isScreeningChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "isScreeningChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterIsScreeningChangedNotification"), v4);
}

- (void)screeningAnnouncementFinishedChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "isScreeningAnnouncementFinishedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallScreeningDidFinishAnnouncementNotification"), v4);
}

- (void)hasBeenRedirectedChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "hasBeenRedirectedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallHasBeenRedirectedChangedNotification"), v4);
}

- (void)supportsDTMFUpdatesChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "supportsDTMFUpdatesChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallSupportsDTMFUpdatesChangedNotification"), v4);
}

- (void)callRecordingStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "recordingSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 1024;
    v10 = objc_msgSend(v6, "recordingState");
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "callRecordingStateChangedForCall %@, changed to %d", (uint8_t *)&v7, 0x12u);

  }
  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallRecordingStateChangedNotification"), v4);

}

- (void)callRecordingAvailabilityChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = v4;
    v8 = 1024;
    v9 = objc_msgSend(v4, "recordingAvailability");
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "callRecordingAvailabilityChangedForCall %@, changed to %d", (uint8_t *)&v6, 0x12u);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallRecordingAvailabilityChangedNotification"), v4);
}

- (void)mediaTokensChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "mediaTokensChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallMediaTokensChangedNotification"), v4);
}

- (void)modelChangedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "modelChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallModelChangedNotification"), v4);
  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterModelStateChangedNotification"), 0);

}

- (void)conferenceParticipantCallsChangedForCallContainer:(id)a3 conferenceParticipantCalls:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "conferenceParticipantCallsChangedForCallContainer %@ conferenceParticipantCalls %@", (uint8_t *)&v9, 0x16u);
  }

  -[TUCallNotificationManager _postNotificationName:object:](self, "_postNotificationName:object:", CFSTR("TUCallCenterConferenceParticipantsChangedNotification"), v7);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)wantsCallNotifications
{
  return self->_wantsCallNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredNotificationBlocks, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
