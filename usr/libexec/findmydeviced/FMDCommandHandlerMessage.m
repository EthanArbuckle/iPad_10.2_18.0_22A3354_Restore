@implementation FMDCommandHandlerMessage

- (FMDCommandHandlerMessage)initWithParams:(id)a3 provider:(id)a4
{
  FMDCommandHandlerMessage *v4;
  FMDCommandHandlerMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDCommandHandlerMessage;
  v4 = -[FMDCommandHandler initWithParams:provider:](&v7, "initWithParams:provider:", a3, a4);
  v5 = v4;
  if (v4)
    -[FMDCommandHandler setRequiresAsynchronousAck:](v4, "setRequiresAsynchronousAck:", 1);
  return v5;
}

- (void)handleCommand
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  FMDMessage *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  NSObject *v66;
  _BOOL4 v67;
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
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  unsigned int v86;
  void *v87;
  id v88;
  id v89;
  NSObject *v90;
  id v91;
  NSObject *v92;
  id v93;
  void *v94;
  unsigned __int8 v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  FMDAccessoryPlaySoundAction *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  unsigned int v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  unsigned int v146;
  unsigned int v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  unsigned __int8 v154;
  unsigned __int8 v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  _QWORD v161[4];
  id v162;
  _QWORD v163[4];
  id v164;
  _QWORD v165[4];
  id v166;
  _QWORD v167[4];
  id v168;
  _QWORD v169[5];
  id v170;
  id v171;
  id v172;
  id v173;
  uint8_t buf[4];
  void *v175;
  __int16 v176;
  void *v177;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("secureMsg")));

  v5 = objc_msgSend(v4, "BOOLValue");
  v6 = +[FMDPreferencesMgr accessibilityFontSizeEnabled](FMDPreferencesMgr, "accessibilityFontSizeEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received a secure message", buf, 2u);
    }

    v11 = -[FMDCommandHandlerMessage shouldHonorSecureMessage](self, "shouldHonorSecureMessage");
    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (!v11)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Ignoring secure message because it cannot be honored", buf, 2u);
      }
      goto LABEL_57;
    }
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Can honor the secure message", buf, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("text")));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("lockScreenText")));

    v19 = -[FMDCommandHandlerMessage shouldShowLockScreenMessage](self, "shouldShowLockScreenMessage");
    v20 = v19;
    if (v16)
    {
      v21 = sub_1000031B8();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found secure message text in the secure message command", buf, 2u);
      }

      v23 = objc_alloc_init((Class)FMAlert);
      v13 = v23;
      if ((v6 & 1) != 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fm_stringByReplacingNonBreakingSpaces"));
        -[NSObject setMsgText:](v13, "setMsgText:", v24);

      }
      else
      {
        -[NSObject setMsgText:](v23, "setMsgText:", v16);
      }
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("title")));

      v155 = v6;
      v160 = v18;
      if ((v6 & 1) != 0)
      {
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "fm_stringByReplacingNonBreakingSpaces"));
        -[NSObject setMsgTitle:](v13, "setMsgTitle:", v71);

      }
      else
      {
        -[NSObject setMsgTitle:](v13, "setMsgTitle:", v70);
      }
      -[NSObject setShowMsgInLockScreen:](v13, "setShowMsgInLockScreen:", -[FMDCommandHandlerMessage shouldShowSecureMessageOnLockScreen](self, "shouldShowSecureMessageOnLockScreen"));
      -[NSObject setDismissMsgOnUnlock:](v13, "setDismissMsgOnUnlock:", 0);
      -[NSObject setDismissMsgOnLock:](v13, "setDismissMsgOnLock:", 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("okButtonTitle")));
      -[NSObject setDefaultButtonTitle:](v13, "setDefaultButtonTitle:", v73);

      v74 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("okButtonAction")));

      if (v75)
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("okButtonURL")));

        v163[0] = _NSConcreteStackBlock;
        v163[1] = 3221225472;
        v163[2] = sub_10003B390;
        v163[3] = &unk_1002C1328;
        v164 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alertActionInfoForAction:andURL:", v75, v77));
        v78 = v164;
        -[NSObject setDefaultButtonAction:](v13, "setDefaultButtonAction:", v163);

      }
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("cancelButtonTitle")));
      -[NSObject setAlternateButtonTitle:](v13, "setAlternateButtonTitle:", v80);

      v81 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("cancelButtonAction")));

      if (v82)
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
        v156 = v4;
        v84 = v70;
        v85 = v16;
        v86 = v20;
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cancelButtonURL")));

        v161[0] = _NSConcreteStackBlock;
        v161[1] = 3221225472;
        v161[2] = sub_10003B444;
        v161[3] = &unk_1002C1328;
        v162 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alertActionInfoForAction:andURL:", v82, v87));
        v88 = v162;
        -[NSObject setAlternateButtonAction:](v13, "setAlternateButtonAction:", v161);

        v20 = v86;
        v16 = v85;
        v70 = v84;
        v4 = v156;
      }

      v6 = v155;
      v18 = v160;
      if (!v20)
        goto LABEL_54;
    }
    else
    {
      v13 = 0;
      if (!v19)
        goto LABEL_54;
    }
    v89 = sub_1000031B8();
    v90 = objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Device is locked. We can show lock screen message", buf, 2u);
    }

    if (v18)
    {
      v91 = sub_1000031B8();
      v92 = objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "Found lock screen message text in the secure message command", buf, 2u);
      }

      v93 = objc_alloc_init((Class)FMAlert);
      v94 = v93;
      v95 = v6;
      if ((v6 & 1) != 0)
      {
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fm_stringByReplacingNonBreakingSpaces"));
        objc_msgSend(v94, "setMsgText:", v96);

      }
      else
      {
        objc_msgSend(v93, "setMsgText:", v18);
      }
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("lockScreenTitle")));

      if ((v95 & 1) != 0)
      {
        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "fm_stringByReplacingNonBreakingSpaces"));
        objc_msgSend(v94, "setMsgTitle:", v99);

      }
      else
      {
        objc_msgSend(v94, "setMsgTitle:", v98);
      }
      objc_msgSend(v94, "setShowMsgInLockScreen:", 1);
      objc_msgSend(v94, "setDismissMsgOnUnlock:", 1);
      objc_msgSend(v94, "setDismissMsgOnLock:", 0);

      if (!v13)
        goto LABEL_56;
      goto LABEL_55;
    }
LABEL_54:
    v94 = 0;
    if (!v13)
    {
LABEL_56:

LABEL_57:
      -[FMDCommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", 0);
      goto LABEL_97;
    }
LABEL_55:
    -[FMDCommandHandlerMessage showSecureMessage:andLockScreenMessage:](self, "showSecureMessage:andLockScreenMessage:", v13, v94);
    goto LABEL_56;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received a regular message", buf, 2u);
  }

  v25 = objc_alloc_init(FMDMessage);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("sound")));

  if (objc_msgSend(v27, "BOOLValue"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("udid")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "fm_nullToNil"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("durationInSeconds")));

    if (v32)
      v33 = (int)objc_msgSend(v32, "intValue");
    else
      v33 = 120;
    v149 = v33;
    v152 = v27;
    v34 = sub_1000031B8();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v175 = v30;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Message command for accessory %@", buf, 0xCu);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("id")));

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("scanDuration")));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("rampUpDurationInSeconds")));

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("rampDownDurationInSeconds")));

    v150 = v41;
    v151 = v32;
    if (v39)
    {
      objc_msgSend(v39, "doubleValue");
      v43 = v42;
      objc_msgSend(v41, "doubleValue");
      v45 = v44;
    }
    else
    {
      v43 = 0.0;
      v45 = 0.0;
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("channels")));

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKey:", CFSTR("userConfirmedSafetyWarning")));
    v147 = objc_msgSend(v49, "BOOLValue");

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKey:", CFSTR("forceConnection")));
    v146 = objc_msgSend(v51, "BOOLValue");

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKey:", CFSTR("inEarDetectionTimeout")));

    if (objc_msgSend(v30, "length"))
    {
      v154 = v6;

      v54 = sub_1000031B8();
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v175 = v30;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "CommandHandlerMessage for accessory %@", buf, 0xCu);
      }

      v56 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v30);
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryRegistry"));
      v148 = v56;
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "accessoryForIdentifier:", v56));

      v59 = sub_1000031B8();
      v60 = objc_claimAutoreleasedReturnValue(v59);
      v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
      if (v58)
      {
        v142 = v47;
        v145 = v53;
        if (v61)
        {
          *(_DWORD *)buf = 138412546;
          v175 = v58;
          v176 = 2112;
          v177 = v30;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "CommandHandlerMessage Found accessory %@ for id %@", buf, 0x16u);
        }

        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "commandContext"));
        v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "pendingActionUUID"));

        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "supportedAccessoryRegistry"));
        v64 = objc_msgSend(v63, "defaultTimeoutAudioSafetyStatusForAccessory:", v58);

        v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "futureForCommandId:", v159));
        v65 = sub_1000031B8();
        v66 = objc_claimAutoreleasedReturnValue(v65);
        v67 = os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
        if (v60)
        {
          if (v67)
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler fm_logID](self, "fm_logID"));
            *(_DWORD *)buf = 138412546;
            v175 = v68;
            v176 = 2112;
            v177 = v159;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%@ Found an existing future for command %@", buf, 0x16u);

          }
          v47 = v142;
        }
        else
        {
          v141 = v64;
          v158 = v7;
          if (v67)
          {
            v100 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler fm_logID](self, "fm_logID"));
            *(_DWORD *)buf = 138412546;
            v175 = v100;
            v176 = 2112;
            v177 = v159;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%@ Creating a future for command %@", buf, 0x16u);

          }
          v60 = objc_alloc_init((Class)FMFuture);
          objc_msgSend(v7, "setFuture:commandId:", v60, v159);
          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "supportedAccessoryRegistry"));
          v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "playbackChannelNamesForAccessory:commandChannels:", v58, v142));

          v103 = [FMDAccessoryPlaySoundAction alloc];
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "accessoryRegistry"));
          v143 = (void *)v102;
          v66 = -[FMDAccessoryPlaySoundAction initWithAccessory:accessoryRegistry:channels:](v103, "initWithAccessory:accessoryRegistry:channels:", v58, v104, v102);

          v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v149));
          -[NSObject setDuration:](v66, "setDuration:", v105);

          if (v153)
          {
            objc_msgSend(v153, "doubleValue");
            v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            -[NSObject setTimeout:](v66, "setTimeout:", v106);

          }
          else
          {
            -[NSObject setTimeout:](v66, "setTimeout:", 0);
          }
          v107 = v141;
          v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v43, v141));
          -[NSObject setRampUpDuration:](v66, "setRampUpDuration:", v108);

          v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v45));
          -[NSObject setRampDownDuration:](v66, "setRampDownDuration:", v109);

          -[NSObject setDefaultAudioSafetyStatus:](v66, "setDefaultAudioSafetyStatus:", v107);
          -[NSObject setForceConnection:](v66, "setForceConnection:", v146);
          -[NSObject setBypassInEarCheck:](v66, "setBypassInEarCheck:", v147);
          -[NSObject setInEarDetectionTimeout:](v66, "setInEarDetectionTimeout:", v145);
          -[NSObject setFuture:](v66, "setFuture:", v60);
          v7 = v158;
          v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "bluetoothManager"));
          -[NSObject setBluetoothManager:](v66, "setBluetoothManager:", v110);

          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "accessoryRegistry"));
          objc_msgSend(v111, "registerDelegate:", v66);

          v112 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
          v113 = objc_msgSend(v112, "enqueueAction:", v66);

          v47 = v143;
        }

        v169[0] = _NSConcreteStackBlock;
        v169[1] = 3221225472;
        v169[2] = sub_10003AFD0;
        v169[3] = &unk_1002C2CE8;
        v169[4] = self;
        v170 = v159;
        v171 = v7;
        v172 = v144;
        v173 = v58;
        v114 = v144;
        v115 = -[NSObject addCompletionBlock:](v60, "addCompletionBlock:", v169);

        v53 = v145;
      }
      else if (v61)
      {
        *(_DWORD *)buf = 138412290;
        v175 = v30;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "No accessory found with id %@. Ignoring the message", buf, 0xCu);
      }

      v25 = 0;
      v6 = v154;
    }
    else
    {
      -[FMDMessage setPlaySound:](v25, "setPlaySound:", 1);
      -[FMDMessage setSoundName:](v25, "setSoundName:", CFSTR("fmd_sound"));
      -[FMDMessage setSoundDuration:](v25, "setSoundDuration:", v149);
      -[FMDMessage setIsHighPrioritySound:](v25, "setIsHighPrioritySound:", 1);
      -[FMDMessage setIsFmipSound:](v25, "setIsFmipSound:", 1);
    }

    v27 = v152;
  }
  if (v25)
  {
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("text")));

    if (v117)
    {
      -[FMDMessage setShowMessage:](v25, "setShowMessage:", 1);
      if ((v6 & 1) != 0)
      {
        v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "fm_stringByReplacingNonBreakingSpaces"));
        -[FMDMessage setMsgText:](v25, "setMsgText:", v118);

      }
      else
      {
        -[FMDMessage setMsgText:](v25, "setMsgText:", v117);
      }
      v119 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("title")));

      v157 = v4;
      if ((v6 & 1) != 0)
      {
        v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "fm_stringByReplacingNonBreakingSpaces"));
        -[FMDMessage setMsgTitle:](v25, "setMsgTitle:", v121);

      }
      else
      {
        -[FMDMessage setMsgTitle:](v25, "setMsgTitle:", v120);
      }
      -[FMDMessage setShowMsgInLockScreen:](v25, "setShowMsgInLockScreen:", 1);
      -[FMDMessage setDismissMsgOnUnlock:](v25, "setDismissMsgOnUnlock:", 0);
      -[FMDMessage setDismissMsgOnLock:](v25, "setDismissMsgOnLock:", 0);
      v122 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("okButtonTitle")));
      -[FMDMessage setDefaultButtonTitle:](v25, "setDefaultButtonTitle:", v123);

      v124 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("okButtonAction")));

      if (v125)
      {
        v126 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
        v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("okButtonURL")));

        v167[0] = _NSConcreteStackBlock;
        v167[1] = 3221225472;
        v167[2] = sub_10003B228;
        v167[3] = &unk_1002C1328;
        v168 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alertActionInfoForAction:andURL:", v125, v127));
        v128 = v168;
        -[FMDMessage setDefaultButtonAction:](v25, "setDefaultButtonAction:", v167);

      }
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("cancelButtonTitle")));
      -[FMDMessage setAlternateButtonTitle:](v25, "setAlternateButtonTitle:", v130);

      v131 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("cancelButtonAction")));

      if (v132)
      {
        v133 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
        v134 = v27;
        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("cancelButtonURL")));

        v165[0] = _NSConcreteStackBlock;
        v165[1] = 3221225472;
        v165[2] = sub_10003B2DC;
        v165[3] = &unk_1002C1328;
        v166 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alertActionInfoForAction:andURL:", v132, v135));
        v136 = v166;
        -[FMDMessage setAlternateButtonAction:](v25, "setAlternateButtonAction:", v165);

        v27 = v134;
      }

      v4 = v157;
    }
    v137 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("vibrate")));

    if (objc_msgSend(v138, "BOOLValue"))
      -[FMDMessage setVibrate:](v25, "setVibrate:", 1);
    v139 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLostModeManager sharedInstance](FMDLostModeManager, "sharedInstance"));
    v140 = objc_msgSend(v139, "lostModeEnabled");

    if (v140)
      -[FMDMessage setShowMessage:](v25, "setShowMessage:", 0);
    if (-[FMDMessage showMessage](v25, "showMessage") || -[FMDMessage playSound](v25, "playSound"))
      -[FMDMessage activate](v25, "activate");
    -[FMDCommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", 0);

  }
LABEL_97:

}

- (void)sendAckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  FMDActingRequestDecorator *v19;
  id v20;
  id v21;
  FMDActingRequestDecorator *v22;
  FMDRequestAckMessage *v23;
  void *v24;
  void *v25;
  FMDRequestAckMessage *v26;
  FMDNetworkAction *v27;
  void *v28;
  FMDNetworkAction *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[16];
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ackURL")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler ackDataForCommand](self, "ackDataForCommand"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status")));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status")));
      v33 = (int)objc_msgSend(v11, "intValue");

    }
    else
    {
      v33 = 200;
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("safetyAlertType")));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeoutError")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("udid")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fm_nullToNil"));

    v35 = v15;
    v36 = v4;
    v34 = v9;
    if (objc_msgSend(v15, "length"))
    {
      v16 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryRegistry"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "accessoryForIdentifier:", v16));

    }
    else
    {
      v18 = 0;
    }
    v19 = [FMDActingRequestDecorator alloc];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10003B984;
    v42[3] = &unk_1002C1D48;
    v20 = v18;
    v43 = v20;
    v21 = v7;
    v44 = v21;
    v22 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v19, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", &stru_1002C2D08, v42, 0, 0);
    v23 = [FMDRequestAckMessage alloc];
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "account"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v26 = -[FMDRequestAckMessage initWithAccount:messageCommand:cmdStatusCode:ackURL:](v23, "initWithAccount:messageCommand:cmdStatusCode:ackURL:", v24, v25, v33, v8);

    -[FMDRequestAckMessage setTimeoutError:](v26, "setTimeoutError:", v37);
    -[FMDRequestAckMessage setSafetyAlertType:](v26, "setSafetyAlertType:", v38);
    -[FMDRequest setDecorator:](v26, "setDecorator:", v22);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10003BA0C;
    v40[3] = &unk_1002C1130;
    v4 = v36;
    v41 = v36;
    -[FMDRequest setCompletionHandler:](v26, "setCompletionHandler:", v40);
    if (v20)
    {
      v27 = [FMDNetworkAction alloc];
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "serverInteractionControllerForAccessory:", v20));
      v29 = -[FMDNetworkAction initWithRequest:andServerInteractionController:](v27, "initWithRequest:andServerInteractionController:", v26, v28);

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[FMDOperationManager sharedManager](FMDOperationManager, "sharedManager"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "accessoryIdentifier"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringValue"));
      objc_msgSend(v30, "addAction:forIdentifier:", v29, v32);

      v4 = v36;
    }
    else
    {
      objc_msgSend(v21, "enqueueRequest:", v26);
    }

  }
  else
  {
    v12 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not acking the message command because there is no ack URL", buf, 2u);
    }
  }

}

- (BOOL)shouldHonorSecureMessage
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLostModeManager sharedInstance](FMDLostModeManager, "sharedInstance"));
  v3 = objc_msgSend(v2, "lostModeEnabled") ^ 1;

  return v3;
}

- (BOOL)shouldShowLockScreenMessage
{
  int v2;
  BOOL v3;

  v2 = MKBGetDeviceLockState(0, a2);
  if (v2)
    v3 = v2 == 3;
  else
    v3 = 1;
  return !v3;
}

- (BOOL)shouldShowSecureMessageOnLockScreen
{
  return MKBGetDeviceLockState(0, a2) == 3;
}

- (void)showSecureMessage:(id)a3 andLockScreenMessage:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
    v9 = objc_opt_class(FMDFMIPServiceProvider, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      objc_msgSend(v7, "setPendingSecureMessage:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
    objc_msgSend(v10, "activateAlert:", v6);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
    objc_msgSend(v7, "activateAlert:", v11);
  }

}

- (FMDMessage)waitingSecureMsgNotfn
{
  return self->_waitingSecureMsgNotfn;
}

- (void)setWaitingSecureMsgNotfn:(id)a3
{
  objc_storeStrong((id *)&self->_waitingSecureMsgNotfn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingSecureMsgNotfn, 0);
}

@end
