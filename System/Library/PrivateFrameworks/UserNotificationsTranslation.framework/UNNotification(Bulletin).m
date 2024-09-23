@implementation UNNotification(Bulletin)

+ (id)notificationForBulletin:()Bulletin
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
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
  id *v65;
  int v66;
  id v67;
  id v68;
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
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  unint64_t v93;
  unint64_t v94;
  float v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  unsigned int v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  id obj;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("contentDate"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "date");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultAction");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("recordDate"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "publisherBulletinID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v6, "isEqualToString:", v7);

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "primaryAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "primaryAttachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  objc_msgSend(v3, "additionalAttachments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "additionalAttachments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v12);

  }
  v114 = v3;
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v8;
  v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v129, 16);
  if (v123)
  {
    v121 = *(_QWORD *)v126;
    v115 = *MEMORY[0x24BDF8A58];
    v118 = *MEMORY[0x24BDF8A48];
    v117 = *MEMORY[0x24BDF8A38];
    do
    {
      for (i = 0; i != v123; ++i)
      {
        if (*(_QWORD *)v126 != v121)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
        objc_msgSend(v14, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF8898]), "initFileURLWithPath:sandboxExtensionClass:", v16, CFSTR("com.apple.usernotifications.attachments.read-only"));
          objc_msgSend(v14, "thumbnailGeneratorUserInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v20 = objc_msgSend(v18, "mutableCopy");
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v20 = objc_claimAutoreleasedReturnValue();
          }
          v21 = (void *)v20;
          objc_msgSend(v14, "uniformType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v21, "setObject:forKey:", v22, v115);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v14, "thumbnailHidden"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v23, v118);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v14, "hiddenFromDefaultExpandedView"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v24, v117);

          v25 = (void *)MEMORY[0x24BDF8830];
          objc_msgSend(v14, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(v21, "copy");
          objc_msgSend(v25, "attachmentWithIdentifier:URL:options:error:", v26, v17, v27, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v120, "arrayByAddingObject:", v28);
            v29 = objc_claimAutoreleasedReturnValue();

            v120 = (void *)v29;
          }

        }
      }
      v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v129, 16);
    }
    while (v123);
  }

  v30 = v114;
  objc_msgSend(v114, "icon");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    v40 = 0;
    goto LABEL_33;
  }
  objc_msgSend(v114, "icon");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_bestVariantForFormat:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "applicationIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "imagePath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "imageName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "systemImageName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v33, "isPrecomposed");
  if (v34)
  {
    objc_msgSend(MEMORY[0x24BDF8850], "iconForApplicationIdentifier:", v34);
    v39 = objc_claimAutoreleasedReturnValue();
  }
  else if (v35)
  {
    objc_msgSend(MEMORY[0x24BDF8850], "iconAtPath:shouldSuppressMask:", v35, v38);
    v39 = objc_claimAutoreleasedReturnValue();
  }
  else if (v36)
  {
    objc_msgSend(MEMORY[0x24BDF8850], "iconNamed:shouldSuppressMask:", v36, v38);
    v39 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v37)
    {
      v40 = 0;
      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x24BDF8850], "iconForSystemImageNamed:", v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v39;
LABEL_32:

  v30 = v114;
LABEL_33:
  objc_msgSend(v30, "sound");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v30, "sound");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "alertConfiguration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_msgSend(v43, "type");
    objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "topic");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    __52__UNNotification_Bulletin__notificationForBulletin___block_invoke((uint64_t)v46, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAlertTopic:", v47);

    objc_msgSend(v43, "audioCategory");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    __52__UNNotification_Bulletin__notificationForBulletin___block_invoke((uint64_t)v48, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAudioCategory:", v49);

    objc_msgSend(v114, "context");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKey:", CFSTR("audioVolume"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAudioVolume:", v51);

    objc_msgSend(v43, "topic");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setCritical:", objc_msgSend(v52, "isEqualToString:", *MEMORY[0x24BEB8CF8]));

    objc_msgSend(v43, "maximumDuration");
    objc_msgSend(v45, "setMaximumDuration:");
    objc_msgSend(v45, "setShouldIgnoreRingerSwitch:", objc_msgSend(v43, "shouldIgnoreRingerSwitch"));
    objc_msgSend(v45, "setShouldRepeat:", objc_msgSend(v43, "shouldRepeat"));
    objc_msgSend(v43, "externalToneFileURL");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "lastPathComponent");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setToneFileName:", v54);

    objc_msgSend(v43, "externalToneFileURL");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setToneFileURL:", v55);

    objc_msgSend(v43, "toneIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    __52__UNNotification_Bulletin__notificationForBulletin___block_invoke((uint64_t)v56, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setToneIdentifier:", v57);

    objc_msgSend(v45, "setToneMediaLibraryItemIdentifier:", objc_msgSend(v43, "externalToneMediaLibraryItemIdentifier"));
    objc_msgSend(v43, "vibrationIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    __52__UNNotification_Bulletin__notificationForBulletin___block_invoke((uint64_t)v58, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setVibrationIdentifier:", v59);

    v30 = v114;
    objc_msgSend(v43, "externalVibrationPatternFileURL");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setVibrationPatternFileURL:", v60);

  }
  else
  {
    v45 = 0;
  }
  objc_msgSend(v30, "communicationContext");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    objc_msgSend(v30, "communicationContext");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    UNCommunicationContextFromBBCommunicationContext(v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v63 = 0;
  }

  objc_msgSend(v30, "contentType");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v64;
  if ((objc_msgSend(v64, "isEqualToString:", *MEMORY[0x24BE0FDB8]) & 1) != 0)
  {
    v65 = (id *)MEMORY[0x24BDF8B08];
  }
  else if ((objc_msgSend(v64, "isEqualToString:", *MEMORY[0x24BE0FDC0]) & 1) != 0)
  {
    v65 = (id *)MEMORY[0x24BDF8B10];
  }
  else if ((objc_msgSend(v64, "isEqualToString:", *MEMORY[0x24BE0FDB0]) & 1) != 0)
  {
    v65 = (id *)MEMORY[0x24BDF8B00];
  }
  else if ((objc_msgSend(v64, "isEqualToString:", *MEMORY[0x24BE0FDC8]) & 1) != 0)
  {
    v65 = (id *)MEMORY[0x24BDF8B18];
  }
  else if ((objc_msgSend(v64, "isEqualToString:", *MEMORY[0x24BE0FDA8]) & 1) != 0)
  {
    v65 = (id *)MEMORY[0x24BDF8AF8];
  }
  else if ((objc_msgSend(v64, "isEqualToString:", *MEMORY[0x24BE0FDD0]) & 1) != 0)
  {
    v65 = (id *)MEMORY[0x24BDF8B20];
  }
  else
  {
    v66 = objc_msgSend(v64, "isEqualToString:", *MEMORY[0x24BE0FD98]);
    v65 = (id *)MEMORY[0x24BDF8AF0];
    if (v66)
      v65 = (id *)MEMORY[0x24BDF8AE8];
  }
  v67 = *v65;
  v68 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(v68, "setAttachments:", v120);
  objc_msgSend(v114, "context");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("badge"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setBadge:", v70);

  objc_msgSend(v114, "message");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setBody:", v71);

  objc_msgSend(v114, "categoryID");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setCategoryIdentifier:", v72);

  objc_msgSend(v68, "setCommunicationContext:", v63);
  objc_msgSend(v68, "setContentType:", v67);
  objc_msgSend(v68, "setDate:", v113);
  objc_msgSend(v111, "appearance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "title");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setDefaultActionTitle:", v74);

  objc_msgSend(v68, "setHasDefaultAction:", v111 != 0);
  objc_msgSend(v111, "launchURL");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setDefaultActionURL:", v75);

  objc_msgSend(v111, "launchBundleID");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setDefaultActionBundleIdentifier:", v76);

  objc_msgSend(v114, "expirationDate");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setExpirationDate:", v77);

  objc_msgSend(v114, "context");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "objectForKey:", *MEMORY[0x24BE0FEE0]);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setLaunchImageName:", v79);

  objc_msgSend(v114, "header");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setHeader:", v80);

  objc_msgSend(v114, "footer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setFooter:", v81);

  objc_msgSend(v68, "setIcon:", v40);
  objc_msgSend(v68, "setSound:", v45);
  objc_msgSend(v68, "setShouldShowSubordinateIcon:", objc_msgSend(v114, "hasSubordinateIcon"));
  objc_msgSend(v68, "setShouldHideDate:", v112 == 0);
  objc_msgSend(v68, "setShouldHideTime:", objc_msgSend(v114, "dateIsAllDay"));
  objc_msgSend(v114, "context");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "objectForKey:", CFSTR("shouldIgnoreDoNotDisturb"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setShouldIgnoreDoNotDisturb:", objc_msgSend(v83, "BOOLValue"));

  objc_msgSend(v68, "setShouldIgnoreDowntime:", objc_msgSend(v114, "ignoresDowntime"));
  objc_msgSend(v68, "setShouldSuppressScreenLightUp:", objc_msgSend(v114, "turnsOnDisplay") ^ 1);
  objc_msgSend(v68, "setShouldAuthenticateDefaultAction:", objc_msgSend(v111, "isAuthenticationRequired"));
  objc_msgSend(v68, "setShouldBackgroundDefaultAction:", objc_msgSend(v111, "activationMode") == 1);
  objc_msgSend(v68, "setShouldPreventNotificationDismissalAfterDefaultAction:", objc_msgSend(v111, "shouldDismissBulletin") ^ 1);
  objc_msgSend(v68, "setShouldSuppressSyncDismissalWhenRemoved:", objc_msgSend(v114, "usesExternalSync"));
  objc_msgSend(v68, "setShouldUseRequestIdentifierForDismissalSync:", v109);
  objc_msgSend(v114, "subtitle");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setSubtitle:", v84);

  objc_msgSend(v114, "threadID");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setThreadIdentifier:", v85);

  objc_msgSend(v114, "title");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setTitle:", v86);

  objc_msgSend(v114, "subsectionIDs");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setTopicIdentifiers:", v87);

  objc_msgSend(v68, "setRealertCount:", objc_msgSend(v114, "realertCount"));
  objc_msgSend(v114, "context");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "objectForKey:", CFSTR("userInfo"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setUserInfo:", v89);

  objc_msgSend(v114, "summaryArgument");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setSummaryArgument:", v90);

  objc_msgSend(v68, "setSummaryArgumentCount:", objc_msgSend(v114, "summaryArgumentCount"));
  objc_msgSend(v114, "context");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "objectForKey:", CFSTR("targetContentIdentifier"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setTargetContentIdentifier:", v92);

  v93 = objc_msgSend(v114, "interruptionLevel");
  if (v93 >= 4)
    v94 = *MEMORY[0x24BDF8A80];
  else
    v94 = v93;
  objc_msgSend(v68, "setInterruptionLevel:", v94);
  objc_msgSend(v114, "relevanceScore");
  objc_msgSend(v68, "setRelevanceScore:", v95);
  objc_msgSend(v114, "filterCriteria");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setFilterCriteria:", v96);

  objc_msgSend(v68, "setScreenCaptureProhibited:", objc_msgSend(v114, "screenCaptureProhibited"));
  objc_msgSend(v114, "speechLanguage");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setSpeechLanguage:", v97);

  objc_msgSend(v114, "context");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "objectForKey:", CFSTR("notificationTriggerData"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  v122 = v45;
  v124 = v40;
  if (v99)
  {
    objc_msgSend(MEMORY[0x24BDF8888], "bs_secureDecodedFromData:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v100 = 0;
  }
  v101 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(v114, "recordID");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "requestWithIdentifier:content:trigger:", v102, v68, v100);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  v104 = (void *)MEMORY[0x24BDF8818];
  objc_msgSend(v114, "section");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "intentIDs");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "notificationWithRequest:date:sourceIdentifier:intentIdentifiers:", v103, v110, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  return v107;
}

@end
