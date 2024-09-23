@implementation RTTController

- (id)handleDatabaseRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Handling database request: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v6 = (void *)MEMORY[0x2199D46B8]();
  objc_msgSend(v4, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__RTTController_handleDatabaseRequest___block_invoke;
  v12[3] = &unk_24D203B60;
  v12[4] = self;
  p_buf = &buf;
  v8 = v4;
  v13 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BE4BD98], "messagePayloadFromDictionary:andIdentifier:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), 0x800000000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replyMessageWithPayload:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&buf, 8);
  return v10;
}

void __39__RTTController_handleDatabaseRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  BOOL v69;
  void *v70;
  NSObject *v71;
  void *v72;
  int v73;
  NSObject *v74;
  void *v75;
  int v76;
  NSObject *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  _QWORD v99[3];
  _QWORD v100[3];
  void *v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  void *v105;
  void *v106;
  const __CFString *v107;
  void *v108;
  void *v109;
  void *v110;
  const __CFString *v111;
  void *v112;
  void *v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  void *v117;
  void *v118;
  const __CFString *v119;
  void *v120;
  void *v121;
  void *v122;
  const __CFString *v123;
  void *v124;
  void *v125;
  void *v126;
  uint8_t buf[4];
  id v128;
  __int16 v129;
  void *v130;
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v97 = v6;
  else
    v97 = 0;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("axtty_read_action")))
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("axtty_callID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "callForUUID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogRTT();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v128 = v10;
      v129 = 2112;
      v130 = v9;
      _os_log_impl(&dword_21473C000, v11, OS_LOG_TYPE_INFO, "Found conversation %@ from call: %@", buf, 0x16u);
    }

    if (v10)
      goto LABEL_11;
    +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversationForCallUID:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogRTT();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v128 = v10;
      _os_log_impl(&dword_21473C000, v13, OS_LOG_TYPE_INFO, "Using saved conversation: %@", buf, 0xCu);
    }

    if (v10)
    {
LABEL_11:
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
      objc_msgSend(v14, "encodeObject:forKey:", v10, *MEMORY[0x24BDD0E88]);
      objc_msgSend(v14, "finishEncoding");
      objc_msgSend(v14, "encodedData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = v8;
      v123 = CFSTR("axtty_conversation");
      v124 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
    else
    {
      v121 = v8;
      v119 = CFSTR("axtty_conversation");
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v56 + 40);
      *(_QWORD *)(v56 + 40) = v55;
    }

  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("axtty_write_action")))
  {
    v20 = objc_alloc(MEMORY[0x24BDD1620]);
    objc_msgSend(v97, "objectForKey:", CFSTR("axtty_conversation"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = 0;
    v22 = (void *)objc_msgSend(v20, "initForReadingFromData:error:", v21, &v98);
    v23 = v98;

    if (v23)
    {
      AXLogRTT();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        __39__RTTController_handleDatabaseRequest___block_invoke_cold_2();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "decodeObjectOfClasses:forKey:");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogRTT();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v128 = v43;
        _os_log_impl(&dword_21473C000, v44, OS_LOG_TYPE_INFO, "Server save conversation: %@", buf, 0xCu);
      }

      if (v43)
      {
        v45 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v43, "callIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringWithFormat:", CFSTR("%@_%@"), v5, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "saveConversation:", v43);

        v117 = v47;
        v115 = CFSTR("axtty_result");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v50;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = v51;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v54 = *(void **)(v53 + 40);
        *(_QWORD *)(v53 + 40) = v52;

      }
    }

  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("axtty_delete_action")))
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("axtty_callID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v5, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "deleteConversationWithCallUID:", v25);

    v113 = v26;
    v111 = CFSTR("axtty_result");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v31;

  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("axtty_contact_search_action")))
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("axtty_contactID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v5, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "contactIDIsTTYContact:", v34);

    v109 = v35;
    v107 = CFSTR("axtty_result");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v39;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v42 = *(void **)(v41 + 40);
    *(_QWORD *)(v41 + 40) = v40;

  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("axtty_contact_path_search_action")))
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("axtty_value"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "objectForKey:", CFSTR("axtty_contactID"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "indexOfObjectPassingTest:", &__block_literal_global_93);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v5, v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v60;
    v103 = CFSTR("axtty_result");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v59 != 0x7FFFFFFFFFFFFFFFLL);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v61;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v62;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v65 = *(void **)(v64 + 40);
    *(_QWORD *)(v64 + 40) = v63;

  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("axtty_conversation_updates")))
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("axtty_remote_conversation_updates")))
      {
        objc_msgSend(*(id *)(a1 + 40), "client");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v78;
        v80 = 0x10000000000;
      }
      else
      {
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("axtty_service_message_updates")))
          goto LABEL_28;
        objc_msgSend(*(id *)(a1 + 40), "client");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v78;
        v80 = 0x20000000000;
      }
      objc_msgSend(v78, "setWantsUpdates:forIdentifier:", 1, v80);

      goto LABEL_28;
    }
    objc_msgSend(v97, "objectForKey:", CFSTR("axtty_callID"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogRTT();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v128 = v97;
      _os_log_impl(&dword_21473C000, v67, OS_LOG_TYPE_INFO, "Conversation update string: %@", buf, 0xCu);
    }

    objc_msgSend(v97, "objectForKey:", CFSTR("axtty_value"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68 == 0;

    if (v69)
    {
      objc_msgSend(*(id *)(a1 + 40), "client");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setWantsUpdates:forIdentifier:", 1, 0x800000000);
    }
    else
    {
      objc_msgSend(v97, "objectForKey:", CFSTR("axtty_value"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "callForUUID:", v66);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogRTT();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v128 = v96;
        v129 = 2112;
        v130 = v66;
        _os_log_impl(&dword_21473C000, v71, OS_LOG_TYPE_INFO, "Using call: %@[%@]", buf, 0x16u);
      }

      objc_msgSend(v97, "objectForKey:", CFSTR("axtty_sender_type"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "intValue");

      if (!v73)
      {
        AXLogRTT();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
          __39__RTTController_handleDatabaseRequest___block_invoke_cold_4();

      }
      objc_msgSend(v97, "objectForKey:", CFSTR("axtty_message_type"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "intValue");

      if (v76 == 1)
      {
        objc_msgSend(v96, "sendString:", v70);
        if (v73 == 2)
        {
          objc_msgSend(v96, "conversation");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "utterances");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "lastObject");
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("axtty_remote_conversation_updates"), v66);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = (void *)MEMORY[0x24BE4BDA0];
          v85 = (void *)MEMORY[0x24BE4BD98];
          v101 = v83;
          v99[0] = CFSTR("axtty_result");
          objc_msgSend(v94, "text");
          v86 = objc_claimAutoreleasedReturnValue();
          v87 = (void *)v86;
          v88 = &stru_24D204B08;
          if (v86)
            v88 = (const __CFString *)v86;
          v100[0] = v88;
          v100[1] = v70;
          v99[1] = CFSTR("axtty_value");
          v99[2] = CFSTR("axtty_message_type");
          v100[2] = &unk_24D209C98;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v100, v99, 3);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = v89;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "messagePayloadFromDictionary:andIdentifier:", v90, 0x800000000);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "messageWithPayload:", v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "sendUpdateMessage:forIdentifier:", v92, 0x800000000);

        }
      }
      else if (v76)
      {
        if ((v76 & 0xFFFFFFFE) == 2 && v73 == 1)
          objc_msgSend(v96, "saveTranscribedTextForConversation:isNew:", v70, v76 == 2);
      }
      else
      {
        AXLogRTT();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
          __39__RTTController_handleDatabaseRequest___block_invoke_cold_3();

      }
    }

  }
LABEL_28:

}

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global);
  return (id)sharedController_Controller;
}

void __33__RTTController_sharedController__block_invoke()
{
  RTTController *v0;
  void *v1;

  v0 = objc_alloc_init(RTTController);
  v1 = (void *)sharedController_Controller;
  sharedController_Controller = (uint64_t)v0;

}

- (RTTController)init
{
  RTTController *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workerQueue;
  uint64_t v9;
  AXDispatchTimer *preferredRelayCoalescer;
  uint64_t v11;
  AXDispatchTimer *callUpdateCoalescer;
  void *v13;
  uint64_t v14;
  void *v15;
  RTTController *v16;
  void *v17;
  RTTController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  RTTController *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSMutableDictionary *localSettingsCache;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  __CFNotificationCenter *DarwinNotifyCenter;
  RTTTranscriptionController *v42;
  RTTTranscriptionController *transcriber;
  uint8_t buf[16];
  _QWORD v46[4];
  RTTController *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  RTTController *v56;
  id v57;
  _QWORD v58[4];
  RTTController *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id location;
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)RTTController;
  v2 = -[RTTController init](&v64, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTController setRttCalls:](v2, "setRttCalls:", v3);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "migrateSettings");

    -[RTTController didChangeTelephonyCallingSupport](v2, "didChangeTelephonyCallingSupport");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("tty_worker_queue", v6);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDFE490]), "initWithTargetSerialQueue:", v2->_workerQueue);
    preferredRelayCoalescer = v2->_preferredRelayCoalescer;
    v2->_preferredRelayCoalescer = (AXDispatchTimer *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDFE490]), "initWithTargetSerialQueue:", v2->_workerQueue);
    callUpdateCoalescer = v2->_callUpdateCoalescer;
    v2->_callUpdateCoalescer = (AXDispatchTimer *)v11;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_callUpdateCoalescer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    objc_initWeak(&location, v2);
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __21__RTTController_init__block_invoke;
    v61[3] = &unk_24D203970;
    objc_copyWeak(&v62, &location);
    objc_msgSend(v13, "registerUpdateBlock:forRetrieveSelector:withListener:", v61, sel_preferredRelayNumber, v2);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v14;
    v58[1] = 3221225472;
    v58[2] = __21__RTTController_init__block_invoke_2;
    v58[3] = &unk_24D203998;
    objc_copyWeak(&v60, &location);
    v16 = v2;
    v59 = v16;
    objc_msgSend(v15, "registerUpdateBlock:forRetrieveSelector:withListener:", v58, sel_TTYHardwareEnabled, v16);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v14;
    v55[1] = 3221225472;
    v55[2] = __21__RTTController_init__block_invoke_3;
    v55[3] = &unk_24D203998;
    objc_copyWeak(&v57, &location);
    v18 = v16;
    v56 = v18;
    objc_msgSend(v17, "registerUpdateBlock:forRetrieveSelector:withListener:", v55, sel_TTYSoftwareEnabled, v18);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v14;
    v53[1] = 3221225472;
    v53[2] = __21__RTTController_init__block_invoke_4;
    v53[3] = &unk_24D203970;
    objc_copyWeak(&v54, &location);
    objc_msgSend(v19, "registerUpdateBlock:forRetrieveSelector:withListener:", v53, sel_incomingCallsTTY, v18);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v14;
    v51[1] = 3221225472;
    v51[2] = __21__RTTController_init__block_invoke_5;
    v51[3] = &unk_24D203970;
    objc_copyWeak(&v52, &location);
    objc_msgSend(v20, "registerUpdateBlock:forRetrieveSelector:withListener:", v51, sel_ttyShouldBeRealtime, v18);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v14;
    v49[1] = 3221225472;
    v49[2] = __21__RTTController_init__block_invoke_6;
    v49[3] = &unk_24D203970;
    objc_copyWeak(&v50, &location);
    objc_msgSend(v21, "registerUpdateBlock:forRetrieveSelector:withListener:", v49, sel_answerRTTCallsAsMuted, v18);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v14;
    v46[1] = 3221225472;
    v46[2] = __21__RTTController_init__block_invoke_7;
    v46[3] = &unk_24D203998;
    objc_copyWeak(&v48, &location);
    v23 = v18;
    v47 = v23;
    objc_msgSend(v22, "registerUpdateBlock:forRetrieveSelector:withListener:", v46, sel_showsRTTNotifications, v23);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ttyShouldBeRealtime");

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "preferredRelayNumber");

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "TTYHardwareEnabled");

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "TTYSoftwareEnabled");

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "incomingCallsTTY");

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "answerRTTCallsAsMuted");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v30 = objc_claimAutoreleasedReturnValue();
    localSettingsCache = v23->_localSettingsCache;
    v23->_localSettingsCache = (NSMutableDictionary *)v30;

    objc_msgSend(MEMORY[0x24BEB4930], "addDelegate:queue:", v23, v2->_workerQueue);
    +[RTTTelephonyUtilities sharedCallCenter](RTTTelephonyUtilities, "sharedCallCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "callServicesClientCapabilities");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWantsToScreenCalls:", 1);

    +[RTTTelephonyUtilities sharedCallCenter](RTTTelephonyUtilities, "sharedCallCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "callServicesClientCapabilities");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "save");

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v23, sel_callDidConnect_, *MEMORY[0x24BEB4AB8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v23, sel_callDidConnect_, *MEMORY[0x24BEB4B28], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v23, sel_callDidConnect_, *MEMORY[0x24BEB4B20], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v23, sel_callDidConnect_, *MEMORY[0x24BEB4AA8], 0);

    -[RTTController callDidConnect:](v23, "callDidConnect:", 0);
    AXLogRTT();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21473C000, v40, OS_LOG_TYPE_INFO, "Posting transport changed because RTTController was inited", buf, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AXTTYPreferredTransportMethodChangedNotification"), 0, 0, 1u);
    if (!_AXSIsNonUIBuild())
    {
      v42 = -[RTTTranscriptionController initWithDelegate:]([RTTTranscriptionController alloc], "initWithDelegate:", v23);
      transcriber = v23->_transcriber;
      v23->_transcriber = v42;

    }
    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);

    objc_destroyWeak(&v57);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __21__RTTController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePreferredRelayNumberUpdate");

}

uint64_t __21__RTTController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidateServerCaches:", kAXSTTYHardwareEnabledPreference);

  return objc_msgSend(*(id *)(a1 + 32), "_requestNotificationAuthorizationIfNecessary");
}

uint64_t __21__RTTController_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidateServerCaches:", kAXSTTYSoftwareEnabledPreference);

  return objc_msgSend(*(id *)(a1 + 32), "_requestNotificationAuthorizationIfNecessary");
}

void __21__RTTController_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateServerCaches:", kAXSTTYIncomingCallsTTYPreference);

}

void __21__RTTController_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateServerCaches:", kAXSTTYShouldBeRealtimePreference);

}

void __21__RTTController_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateServerCaches:", kAXSRTTAnswerAllRTTCallsAsMutedPreference);

}

uint64_t __21__RTTController_init__block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidateServerCaches:", kAXSRTTShowsNotificationsPreference);

  return objc_msgSend(*(id *)(a1 + 32), "_requestNotificationAuthorizationIfNecessary");
}

- (void)_requestNotificationAuthorizationIfNecessary
{
  void *v3;
  void *v4;
  int v5;

  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "TTYHardwareEnabled"))
  {

  }
  else
  {
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "TTYSoftwareEnabled");

    if (!v5)
      return;
  }
  -[RTTController _requestNotificationAuthorization](self, "_requestNotificationAuthorization");
}

- (void)_requestNotificationAuthorization
{
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __50__RTTController__requestNotificationAuthorization__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  AXLogRTT();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21473C000, v0, OS_LOG_TYPE_INFO, "Requesting notification authorization because hw/sw enabled", v1, 2u);
  }

  RTTRequestNotificationAuthorization();
}

- (void)_handlePreferredRelayNumberUpdate
{
  AXDispatchTimer *preferredRelayCoalescer;
  _QWORD v4[5];

  -[AXDispatchTimer cancel](self->_preferredRelayCoalescer, "cancel");
  preferredRelayCoalescer = self->_preferredRelayCoalescer;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__RTTController__handlePreferredRelayNumberUpdate__block_invoke;
  v4[3] = &unk_24D2039E0;
  v4[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](preferredRelayCoalescer, "afterDelay:processBlock:", v4, 0.5);
}

void __50__RTTController__handlePreferredRelayNumberUpdate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  AXLogRTT();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "Settings preferred number changed", buf, 2u);
  }

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "reloadRelayPhoneNumbers");

  if (v4)
  {
    AXLogRTT();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Relay number actually changed, invalidating server cache", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "invalidateServerCaches:", kAXSTTYPreferredRelayNumberPreference);
  }
}

- (BOOL)invalidateServerCaches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  const __CFString *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForPreferenceKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_localSettingsCache, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);
  AXLogRTT();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v26 = v4;
    v27 = 2112;
    v28 = v6;
    v29 = 2112;
    v30 = v7;
    v31 = 1024;
    v32 = v8;
    _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Invalidate server caches:%@ -> new: %@, _localeCache: %@ [same: %d]", buf, 0x26u);
  }

  if (v6)
    v10 = v8;
  else
    v10 = 1;
  if ((v10 & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localSettingsCache, "setObject:forKeyedSubscript:", v6, v4);
    -[RTTController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BE4BDA0];
    v13 = (void *)MEMORY[0x24BE4BD98];
    v22 = v4;
    v23 = CFSTR("axtty_server_settings_upate_action");
    v21 = CFSTR("preferenceKey");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messagePayloadFromDictionary:andIdentifier:", v15, 0x40000000000);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageWithPayload:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendUpdateMessage:forIdentifier:", v17, 0x40000000000);

    -[RTTController serverInvalidateCallback](self, "serverInvalidateCallback");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[RTTController serverInvalidateCallback](self, "serverInvalidateCallback");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, id))v19)[2](v19, 1, v4);

    }
  }

  return v10 ^ 1;
}

- (void)didChangeTelephonyCallingSupport
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultVoiceContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "Telephony did change %@", (uint8_t *)&v12, 0xCu);

  }
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultVoiceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!+[RTTTelephonyUtilities softwareTTYIsSupported](RTTTelephonyUtilities, "softwareTTYIsSupported"))
    {
      +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTTYSoftwareEnabled:", 0);

    }
    if (!+[RTTTelephonyUtilities hardwareTTYIsSupported](RTTTelephonyUtilities, "hardwareTTYIsSupported"))
    {
      +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTTYHardwareEnabled:", 0);

    }
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "TTYSoftwareEnabled");

    if (v10)
      v11 = +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
  }
}

- (void)callDidConnect:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  AXDispatchTimer *callUpdateCoalescer;
  id v8;
  _QWORD v9[4];
  id v10;
  RTTController *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __32__RTTController_callDidConnect___block_invoke;
  v12[3] = &unk_24D2039E0;
  v6 = v4;
  v13 = v6;
  +[RTTTelephonyUtilities performCallCenterTask:](RTTTelephonyUtilities, "performCallCenterTask:", v12);
  callUpdateCoalescer = self->_callUpdateCoalescer;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __32__RTTController_callDidConnect___block_invoke_36;
  v9[3] = &unk_24D203A08;
  v10 = v6;
  v11 = self;
  v8 = v6;
  -[AXDispatchTimer afterDelay:processBlock:](callUpdateCoalescer, "afterDelay:processBlock:", v9, 0.25);

}

void __32__RTTController_callDidConnect___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "Call connected notification: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __32__RTTController_callDidConnect___block_invoke_36(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  NSObject *v6;
  _DWORD v7[4];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  AXLogRTT();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "Processing %i calls from connect notification", (uint8_t *)v7, 8u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_refreshCurrentCallListWithExistingCalls:", v5);
}

- (void)_refreshCurrentCallList
{
  AXDispatchTimer *callUpdateCoalescer;
  _QWORD v3[5];

  callUpdateCoalescer = self->_callUpdateCoalescer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__RTTController__refreshCurrentCallList__block_invoke;
  v3[3] = &unk_24D2039E0;
  v3[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](callUpdateCoalescer, "afterDelay:processBlock:", v3, 0.0);
}

uint64_t __40__RTTController__refreshCurrentCallList__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshCurrentCallListWithExistingCalls:", 0);
}

- (void)_refreshCurrentCallListWithExistingCalls:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  RTTController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__RTTController__refreshCurrentCallListWithExistingCalls___block_invoke;
  v6[3] = &unk_24D203A08;
  v7 = v4;
  v8 = self;
  v5 = v4;
  +[RTTTelephonyUtilities performCallCenterTask:](RTTTelephonyUtilities, "performCallCenterTask:", v6);

}

void __58__RTTController__refreshCurrentCallListWithExistingCalls___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[RTTTelephonyUtilities sharedCallCenter](RTTTelephonyUtilities, "sharedCallCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "Refresh call list: %@", (uint8_t *)&v10, 0xCu);
  }

  if (!objc_msgSend(v3, "count"))
  {
    AXLogRTT();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(void **)(a1 + 32);
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "No current calls for some reason, using what notification told us: %@", (uint8_t *)&v10, 0xCu);
    }

    v7 = *(id *)(a1 + 32);
    v3 = v7;
  }
  objc_msgSend(*(id *)(a1 + 40), "handleUpdatedCalls:", v3);
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "rttCalls");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "RTT calls after update: %@", (uint8_t *)&v10, 0xCu);

  }
}

- (void)handleUpdatedCalls:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Found calls %lu", buf, 0xCu);
  }

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__RTTController_handleUpdatedCalls___block_invoke;
  v9[3] = &unk_24D203A30;
  v9[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  -[RTTController rttCalls](self, "rttCalls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_44);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTController rttCalls](self, "rttCalls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectsAtIndexes:", v7);

}

void __36__RTTController_handleUpdatedCalls___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
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
  RTTRemoteCall *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  NSObject *v29;
  _BOOL4 v30;
  __objc2_class **v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  _BYTE v39[14];
  id v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "status") == 4 || objc_msgSend(v3, "status") == 1)
    && objc_msgSend(v3, "ttyType")
    && (+[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "currentPreferredTransportMethod"),
        v4,
        v5 != 1))
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v3, "callUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_callForUUIDWithoutRefresh:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (!objc_msgSend(v13, "isLocallyHosted")
        || (v17 = objc_msgSend(v3, "isEndpointOnCurrentDevice"),
            v17 == objc_msgSend(v3, "isHostedOnCurrentDevice")))
      {
        AXLogRTT();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v39 = 138412546;
          *(_QWORD *)&v39[4] = v13;
          *(_WORD *)&v39[12] = 2112;
          v40 = v3;
          _os_log_impl(&dword_21473C000, v23, OS_LOG_TYPE_INFO, "Stuttering call %@ - %@", v39, 0x16u);
        }

        objc_msgSend(v13, "stop");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "ttyCall:setVisible:serviceUpdate:", v13, 0, RTTServiceUpdateTypeRemoteInterrupt);
        objc_msgSend(v13, "stop");
        objc_msgSend(*(id *)(a1 + 32), "rttCalls");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObject:", v13);

        v19 = -[RTTRemoteCall initWithCall:]([RTTRemoteCall alloc], "initWithCall:", v3);
        -[RTTCall setDelegate:](v19, "setDelegate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 32), "rttCalls");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v19);

        AXLogRTT();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "rttCalls");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v39 = 138412290;
          *(_QWORD *)&v39[4] = v22;
          _os_log_impl(&dword_21473C000, v21, OS_LOG_TYPE_INFO, "Updated software TTY Calls %@", v39, 0xCu);

        }
        v13 = v19;
      }
    }
    else
    {
      v27 = objc_msgSend(v3, "isEndpointOnCurrentDevice");
      v28 = objc_msgSend(v3, "isHostedOnCurrentDevice");
      AXLogRTT();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
      if (v27 == v28)
      {
        if (v30)
        {
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_21473C000, v29, OS_LOG_TYPE_INFO, "Creating TTY call as local", v39, 2u);
        }
        v31 = off_24D2032E0;
      }
      else
      {
        if (v30)
        {
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_21473C000, v29, OS_LOG_TYPE_INFO, "Creating TTY call as remote", v39, 2u);
        }
        v31 = off_24D203310;
      }

      v13 = (void *)objc_msgSend(objc_alloc(*v31), "initWithCall:", v3);
      objc_msgSend(v13, "setDelegate:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "rttCalls");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v13);

      AXLogRTT();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "rttCalls");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v39 = 138412290;
        *(_QWORD *)&v39[4] = v34;
        _os_log_impl(&dword_21473C000, v33, OS_LOG_TYPE_INFO, "Software TTY Calls %@", v39, 0xCu);

      }
    }
    objc_msgSend(v13, "start");
    objc_msgSend(*(id *)(a1 + 32), "transcriber");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "callUUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "startTranscribingForCallUUID:", v36);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "TTYSoftwareEnabled") & 1) == 0
      && objc_msgSend(v3, "supportsTTYWithVoice")
      && objc_msgSend(v3, "isIncoming"))
    {
      +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "hasReceivedRTTCall");

      if ((v38 & 1) != 0)
        goto LABEL_26;
      objc_msgSend(*(id *)(a1 + 32), "displayRTTFirstUseAlert");
      +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setHasReceivedRTTCall:", 1);
    }
  }
  else
  {
    AXLogRTT();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(v3, "status") == 1;
      v8 = objc_msgSend(v3, "ttyType") != 0;
      +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v39 = 67109890;
      *(_DWORD *)&v39[4] = v7;
      *(_WORD *)&v39[8] = 1024;
      *(_DWORD *)&v39[10] = v8;
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = objc_msgSend(v9, "currentPreferredTransportMethod") != 1;
      HIWORD(v40) = 2112;
      v41 = v3;
      _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "Skipping call: active: %d, tty: %d, no hw: %d - %@", v39, 0x1Eu);

    }
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v3, "callUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v10, "_callForUUIDWithoutRefresh:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && objc_msgSend(v3, "status") == 1 && !objc_msgSend(v3, "ttyType"))
    {
      AXLogRTT();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v39 = 138412290;
        *(_QWORD *)&v39[4] = v3;
        _os_log_impl(&dword_21473C000, v24, OS_LOG_TYPE_INFO, "Call downgraded %@", v39, 0xCu);
      }

      objc_msgSend(v13, "stop");
    }
    else if (objc_msgSend(v3, "status", *(_QWORD *)v39) == 6)
    {
      objc_msgSend(v3, "callUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      RTTRemoveUserNotifications(v14);

    }
    objc_msgSend(*(id *)(a1 + 32), "transcriber", *(_QWORD *)v39);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "callUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stopTranscribingForCallUUID:", v26);

  }
LABEL_26:

}

BOOL __36__RTTController_handleUpdatedCalls___block_invoke_42(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "call");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status") == 6;

  return v3;
}

- (id)_callForUUIDWithoutRefresh:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _BYTE *v12;
  _BYTE buf[24];
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTController rttCalls](self, "rttCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogRTT();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "Finding callID %@ from rtt calls %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__RTTController__callForUUIDWithoutRefresh___block_invoke;
  v10[3] = &unk_24D203A98;
  v7 = v4;
  v11 = v7;
  v12 = buf;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v8;
}

void __44__RTTController__callForUUIDWithoutRefresh___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "call");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)callForUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTController _callForUUIDWithoutRefresh:](self, "_callForUUIDWithoutRefresh:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogRTT();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "Asking for RTT call: %@ and found: %@", (uint8_t *)&v9, 0x16u);
  }

  if (!v5)
  {
    -[RTTController _refreshCurrentCallList](self, "_refreshCurrentCallList");
    -[RTTController _callForUUIDWithoutRefresh:](self, "_callForUUIDWithoutRefresh:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogRTT();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "Refreshed call list and asking again for RTT call: %@ and found: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  return v5;
}

- (void)dismissRTTFirstUseAlert
{
  void *v2;
  id v3;

  -[RTTController actionClient](self, "actionClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFE478], "backgroundAccessQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", &unk_24D209B68, 1, v2, &__block_literal_global_51);

}

- (void)displayRTTFirstUseAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  -[RTTController actionClient](self, "actionClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("shouldShow");
  v10[1] = CFSTR("style");
  v11[0] = MEMORY[0x24BDBD1C8];
  v11[1] = &unk_24D209C80;
  v10[2] = CFSTR("options");
  ttyLocString(CFSTR("RTTFirstUseAlertAcceptButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  v10[3] = CFSTR("title");
  ttyLocString(CFSTR("RTTFirstUseAlertTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  v10[4] = CFSTR("message");
  ttyLocString(CFSTR("RTTFirstUseAlertMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDFE478], "backgroundAccessQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v7, 1, v8, &__block_literal_global_67);

}

- (void)dealloc
{
  objc_super v3;

  -[RTTController setActionCompletionBlock:](self, "setActionCompletionBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RTTController;
  -[RTTController dealloc](&v3, sel_dealloc);
}

- (void)clientRemoved:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[RTTController rttCalls](self, "rttCalls", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        AXLogRTT();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v8;
          _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Client removed, marked view controller visible no: %@", buf, 0xCu);
        }

        if (objc_msgSend(v8, "isViewControllerVisible"))
          objc_msgSend(v8, "setIsViewControllerVisible:", 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v5);
  }

}

- (id)actionClient
{
  AXUIClient *actionUIClient;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  AXUIClient *v8;
  AXUIClient *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  actionUIClient = self->_actionUIClient;
  if (!actionUIClient)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v4 = (void *)getAXUIClientClass_softClass;
    v15 = getAXUIClientClass_softClass;
    if (!getAXUIClientClass_softClass)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __getAXUIClientClass_block_invoke;
      v11[3] = &unk_24D203C78;
      v11[4] = &v12;
      __getAXUIClientClass_block_invoke((uint64_t)v11);
      v4 = (void *)v13[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v12, 8);
    v6 = [v5 alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ActionSheetUIClient-%d"), getpid());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (AXUIClient *)objc_msgSend(v6, "initWithIdentifier:serviceBundleName:", v7, CFSTR("AXActionSheetUIServer"));
    v9 = self->_actionUIClient;
    self->_actionUIClient = v8;

    -[AXUIClient setDelegate:](self->_actionUIClient, "setDelegate:", self);
    actionUIClient = self->_actionUIClient;
  }
  return actionUIClient;
}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (a5 == 2)
  {
    objc_msgSend(v10, "valueForKey:", CFSTR("didTap"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "BOOLValue");

  }
  else if (a5 == 1)
  {
    AXLogRTT();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v22 = 138412546;
      v23 = v11;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "Got action sheet reply: %@ from: %@", (uint8_t *)&v22, 0x16u);
    }

    objc_msgSend(v11, "valueForKey:", CFSTR("result"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[RTTController actionCompletionBlock](self, "actionCompletionBlock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_msgSend(v13, "unsignedIntegerValue");
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          v16 = 4;
        else
          v16 = v15;
        AXLogRTT();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = (void *)MEMORY[0x2199D4874](self->_actionCompletionBlock);
          v22 = 138412546;
          v23 = v18;
          v24 = 1024;
          LODWORD(v25) = v16;
          _os_log_impl(&dword_21473C000, v17, OS_LOG_TYPE_INFO, "Sending to action completion: %@ for calltype: %d", (uint8_t *)&v22, 0x12u);

        }
        -[RTTController actionCompletionBlock](self, "actionCompletionBlock");
        v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v19[2](v19, v16);

        -[RTTController setActionCompletionBlock:](self, "setActionCompletionBlock:", 0);
      }
    }

  }
  return 0;
}

- (id)handleRTTControllerIsVisible:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x2199D46B8]();
  objc_msgSend(v3, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("axtty_callID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("axtty_is_viewcontrollervisible_key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  +[RTTController sharedController](RTTController, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callForUUID:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setIsViewControllerVisible:", v9);
  AXLogRTT();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14[0] = 67109378;
    v14[1] = v9;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "Marking RTT view controller visible[%d] for call: %@", (uint8_t *)v14, 0x12u);
  }

  objc_autoreleasePoolPop(v4);
  return 0;
}

- (id)handleMediaAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x2199D46B8]();
  objc_msgSend(v3, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_80);

  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BE4BD98], "messagePayloadFromDictionary:andIdentifier:", MEMORY[0x24BDBD1B8], 0x80000000000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replyMessageWithPayload:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __35__RTTController_handleMediaAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("axtty_media_action"));

  if (v7)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("axtty_callID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTTController sharedController](RTTController, "sharedController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "callForUUID:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", CFSTR("axtty_value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    AXLogRTT();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14[0] = 67109378;
      v14[1] = v12;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_21473C000, v13, OS_LOG_TYPE_INFO, "Got request to toggle mute: %d %@", (uint8_t *)v14, 0x12u);
    }

    objc_msgSend(v10, "toggleSystemOutputMute:", v12);
  }

}

uint64_t __39__RTTController_handleDatabaseRequest___block_invoke_91(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contactPathWasUsedForTTY:", v2);

  return v4;
}

- (id)handleDictionaryRequest:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("shouldBeAvailable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTTYDictionaryAvailability:", v5);

  return 0;
}

- (id)handleSettingsRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("axtty_uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("axtty_settings_key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectorForPreferenceKey:", v7);

  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0
    || (+[RTTSettings sharedInstance](RTTSettings, "sharedInstance"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "valueForPreferenceKey:", v7),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWantsUpdates:forIdentifier:", 1, 0x40000000000);

  AXLogRTT();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v7;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_21473C000, v14, OS_LOG_TYPE_INFO, "Returning remote request for setting: %@ > %@", buf, 0x16u);
  }

  v15 = (void *)MEMORY[0x24BE4BD98];
  v22 = v12;
  v23 = v5;
  v21 = CFSTR("axtty_result");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messagePayloadFromDictionary:andIdentifier:", v17, 0x4000000000);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replyMessageWithPayload:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)displayCallPrompt:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  BOOL v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  void *v44;
  id v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[2];
  _QWORD v49[2];
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("shouldShow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v4;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Asking to show call prompt: %@", buf, 0xCu);
  }

  if (v7)
  {
    v41 = MEMORY[0x24BDAC760];
    v42 = 3221225472;
    v43 = __35__RTTController_displayCallPrompt___block_invoke;
    v44 = &unk_24D203BC8;
    v9 = v4;
    v45 = v9;
    -[RTTController setActionCompletionBlock:](self, "setActionCompletionBlock:", &v41);
    objc_msgSend(v9, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("title"));
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = (__CFString *)v11;
    else
      v12 = &stru_24D204B08;
    v13 = (void *)MEMORY[0x24BDD17C8];
    ttyLocString(CFSTR("TTYCallTypeVoiceWithDestination"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v12, v41, v42, v43, v44);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTTController actionClient](self, "actionClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[RTTTelephonyUtilities currentSupportedTextingType](RTTTelephonyUtilities, "currentSupportedTextingType");
    v18 = CFSTR("TTYCallTypeRelay");
    v19 = CFSTR("TTYCallTypeTTY");
    if (v17 == 1)
    {
      v19 = CFSTR("TTYCallTypeRTT");
      v18 = CFSTR("TTYCallTypeRelayRTT");
    }
    v20 = v17 == 3;
    if (v17 == 3)
      v21 = CFSTR("TTYCallTypeRTT_TTY");
    else
      v21 = (__CFString *)v19;
    v49[0] = v15;
    if (v20)
      v22 = CFSTR("TTYCallTypeRelayRTT_TTY");
    else
      v22 = (__CFString *)v18;
    ttyLocString(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v48[0] = &unk_24D209CB0;
    v25 = (void *)MEMORY[0x24BDD16E0];
    if (+[RTTTelephonyUtilities shouldUseRTT](RTTTelephonyUtilities, "shouldUseRTT"))
      v26 = 2;
    else
      v26 = 1;
    objc_msgSend(v25, "numberWithUnsignedInteger:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[RTTTelephonyUtilities relayIsSupported](RTTTelephonyUtilities, "relayIsSupported"))
    {
      +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "currentPreferredTransportMethod");

      if (v30 == 2)
      {
        ttyLocString(v22);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "arrayByAddingObject:", v31);
        v32 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "arrayByAddingObject:", &unk_24D209CC8);
        v33 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v32;
        v28 = (void *)v33;
      }
    }
    if (v24)
    {
      v46[0] = CFSTR("shouldShow");
      v46[1] = CFSTR("options");
      v47[0] = MEMORY[0x24BDBD1C8];
      v47[1] = v24;
      v47[2] = v28;
      v46[2] = CFSTR("optionIndexes");
      v46[3] = CFSTR("cancelMessage");
      ttyLocString(CFSTR("TTYCallTypeCancel"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v47[3] = v34;
      v46[4] = CFSTR("style");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v47[4] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDFE478], "backgroundAccessQueue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v36, 1, v37, &__block_literal_global_128);

    }
    v38 = v45;
  }
  else
  {
    -[RTTController actionClient](self, "actionClient");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFE478], "backgroundAccessQueue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", &unk_24D209B90, 1, v39, &__block_literal_global_132);

  }
  return 0;
}

void __35__RTTController_displayCallPrompt___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BE4BD98];
  v15 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messagePayloadFromDictionary:andIdentifier:", v5, 0x1000000000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replyMessageWithPayload:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Received reply %@, forwarding back to %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v7, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendMessage:errorBlock:", v7, &__block_literal_global_102);

}

void __35__RTTController_displayCallPrompt___block_invoke_100(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35__RTTController_displayCallPrompt___block_invoke_100_cold_1();

}

- (id)handleIncomingNotificationSuppressionChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("shouldSuppress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[RTTController setShouldSuppressIncomingNotification:](self, "setShouldSuppressIncomingNotification:", v6);
  if ((_DWORD)v6)
  {
    -[RTTController actionClient](self, "actionClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFE478], "backgroundAccessQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", &unk_24D209BB8, 2, v8, &__block_literal_global_138);

  }
  return 0;
}

- (id)handleRTTVoicemailMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 buf;
  void *v44;
  void *v45;
  uint64_t *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsHeard") & 1) != 0)
  {
    objc_msgSend(v4, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("axtty_callID"));
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("axtty_voicemail_message_locale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("axtty_voicemail_message_url"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v38);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v38;
      if (v12)
      {
        v13 = v12;
        AXLogRTT();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[RTTController handleRTTVoicemailMessage:].cold.1();

LABEL_13:
        v15 = 0;
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(v11, "URL");
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        AXLogRTT();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[RTTController handleRTTVoicemailMessage:].cold.2();
        goto LABEL_13;
      }
      v15 = v10;
    }
    AXLogRTT();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_21473C000, v16, OS_LOG_TYPE_INFO, "Received voicemail message url for callID %@", (uint8_t *)&buf, 0xCu);
    }

    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v17 = (void *)getSFSpeechRecognizerClass_softClass;
    v42 = getSFSpeechRecognizerClass_softClass;
    v18 = MEMORY[0x24BDAC760];
    if (!getSFSpeechRecognizerClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v44 = __getSFSpeechRecognizerClass_block_invoke;
      v45 = &unk_24D203C78;
      v46 = &v39;
      __getSFSpeechRecognizerClass_block_invoke((uint64_t)&buf);
      v17 = (void *)v40[3];
    }
    v19 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v39, 8);
    v20 = [v19 alloc];
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v20, "initWithLocale:", v21);

    -[RTTController callForUUID:](self, "callForUUID:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v30 = (void *)getSFSpeechURLRecognitionRequestClass_softClass;
    v42 = getSFSpeechURLRecognitionRequestClass_softClass;
    if (!getSFSpeechURLRecognitionRequestClass_softClass)
    {
      *(_QWORD *)&buf = v18;
      *((_QWORD *)&buf + 1) = 3221225472;
      v44 = __getSFSpeechURLRecognitionRequestClass_block_invoke;
      v45 = &unk_24D203C78;
      v46 = &v39;
      __getSFSpeechURLRecognitionRequestClass_block_invoke((uint64_t)&buf, v22, v23, v24, v25, v26, v27, v28, v36[0]);
      v30 = (void *)v40[3];
    }
    v31 = objc_retainAutorelease(v30);
    _Block_object_dispose(&v39, 8);
    v32 = (void *)objc_msgSend([v31 alloc], "initWithURL:", v15);
    objc_msgSend(v32, "setShouldReportPartialResults:", 0);
    objc_msgSend(v32, "setAddsPunctuation:", 1);
    v36[0] = v18;
    v36[1] = 3221225472;
    v36[2] = __43__RTTController_handleRTTVoicemailMessage___block_invoke;
    v36[3] = &unk_24D203C50;
    v37 = v29;
    v33 = v29;
    v34 = (id)-[NSObject recognitionTaskWithRequest:resultHandler:](v13, "recognitionTaskWithRequest:resultHandler:", v32, v36);

    goto LABEL_22;
  }
  AXLogRTT();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "Can only handle voicemail transcriptions from heard", (uint8_t *)&buf, 2u);
  }
LABEL_23:

  return 0;
}

void __43__RTTController_handleRTTVoicemailMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    AXLogRTT();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Transcription failed with error %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isFinal"))
  {
    objc_msgSend(v5, "bestTranscription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formattedString");
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    ttyLocString(CFSTR("RTTVoicemailPrefix"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "sendVoicemailTranscriptionText:", v12);
    AXLogRTT();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_21473C000, v13, OS_LOG_TYPE_INFO, "Transcribed voicemail message text: %@", buf, 0xCu);
    }

LABEL_9:
  }

}

- (void)ttyCall:(id)a3 didReceiveString:(id)a4 forUtterance:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  void *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "call");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "callUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("axtty_conversation_updates"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (__CFString *)v9;
  AXLogRTT();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    -[RTTController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = v8;
    v31 = 2112;
    v32 = v14;
    v33 = 2112;
    v34 = v16;
    _os_log_impl(&dword_21473C000, v15, OS_LOG_TYPE_INFO, "Received remote string %@ for utterance: %@, sending to delegate: %@", buf, 0x20u);

  }
  if (v14)
    v17 = v14;
  else
    v17 = &stru_24D204B08;

  -[RTTController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BE4BDA0];
  v20 = (void *)MEMORY[0x24BE4BD98];
  v27 = v13;
  v25[0] = CFSTR("axtty_result");
  v25[1] = CFSTR("axtty_value");
  v26[0] = v17;
  v26[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "messagePayloadFromDictionary:andIdentifier:", v22, 0x800000000);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageWithPayload:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendUpdateMessage:forIdentifier:", v24, 0x800000000);

}

- (void)ttyCall:(id)a3 didSendRemoteString:(id)a4 forUtterance:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  void *v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "call");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "callUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("axtty_remote_conversation_updates"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (__CFString *)v9;
  AXLogRTT();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v8;
    v30 = 2112;
    v31 = v14;
    _os_log_impl(&dword_21473C000, v15, OS_LOG_TYPE_INFO, "Sending remote string %@ for utterance: %@", buf, 0x16u);
  }
  if (v14)
    v16 = v14;
  else
    v16 = &stru_24D204B08;

  -[RTTController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BE4BDA0];
  v19 = (void *)MEMORY[0x24BE4BD98];
  v26 = v13;
  v24[0] = CFSTR("axtty_result");
  v24[1] = CFSTR("axtty_value");
  v25[0] = v16;
  v25[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messagePayloadFromDictionary:andIdentifier:", v21, 0x10000000000);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messageWithPayload:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendUpdateMessage:forIdentifier:", v23, 0x10000000000);

}

- (void)ttyCall:(id)a3 setVisible:(BOOL)a4 serviceUpdate:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  _QWORD v23[3];
  _QWORD v24[3];
  void *v25;
  _QWORD v26[2];

  v5 = a4;
  v26[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "call");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("axtty_service_message_updates"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v12;
  v23[0] = CFSTR("axtty_result");
  v23[1] = CFSTR("axtty_value");
  v24[0] = v8;
  v24[1] = MEMORY[0x24BDBD1B8];
  v23[2] = CFSTR("axtty_set_visible_service_update");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogRTT();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v15;
    _os_log_impl(&dword_21473C000, v16, OS_LOG_TYPE_INFO, "Send service update: %@", buf, 0xCu);
  }

  -[RTTController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BE4BDA0];
  objc_msgSend(MEMORY[0x24BE4BD98], "messagePayloadFromDictionary:andIdentifier:", v15, 0x20000000000);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messageWithPayload:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendUpdateMessage:forIdentifier:", v20, 0x20000000000);

}

- (void)transcriptionDidStart:(id)a3 forCallUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_DEFAULT, "New transcription: %@", (uint8_t *)&v9, 0xCu);
  }

  -[RTTController _updateConversationControllerWithTranscription:type:callUUID:](self, "_updateConversationControllerWithTranscription:type:callUUID:", v6, 2, v7);
}

- (void)transcriptionDidUpdate:(id)a3 forCallUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_DEFAULT, "Updated transcription: %@", (uint8_t *)&v9, 0xCu);
  }

  -[RTTController _updateConversationControllerWithTranscription:type:callUUID:](self, "_updateConversationControllerWithTranscription:type:callUUID:", v6, 3, v7);
}

- (void)_updateConversationControllerWithTranscription:(id)a3 type:(int64_t)a4 callUUID:(id)a5
{
  id v8;
  id v9;
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
  _QWORD v20[3];
  _QWORD v21[3];
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  -[RTTController callForUUID:](self, "callForUUID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("axtty_remote_conversation_updates"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BE4BDA0];
  v14 = (void *)MEMORY[0x24BE4BD98];
  v22 = v11;
  v20[0] = CFSTR("axtty_result");
  v20[1] = CFSTR("axtty_value");
  v21[0] = v9;
  v21[1] = v9;
  v20[2] = CFSTR("axtty_message_type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messagePayloadFromDictionary:andIdentifier:", v17, 0x800000000);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageWithPayload:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendUpdateMessage:forIdentifier:", v19, 0x800000000);

  objc_msgSend(v10, "saveTranscribedTextForConversation:isNew:", v9, a4 == 2);
}

- (NSMutableArray)rttCalls
{
  return self->_rttCalls;
}

- (void)setRttCalls:(id)a3
{
  objc_storeStrong((id *)&self->_rttCalls, a3);
}

- (HCHeardControllerProtocol)delegate
{
  return (HCHeardControllerProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)serverInvalidateCallback
{
  return self->_serverInvalidateCallback;
}

- (void)setServerInvalidateCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)actionCompletionBlock
{
  return self->_actionCompletionBlock;
}

- (void)setActionCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)shouldSuppressIncomingNotification
{
  return self->_shouldSuppressIncomingNotification;
}

- (void)setShouldSuppressIncomingNotification:(BOOL)a3
{
  self->_shouldSuppressIncomingNotification = a3;
}

- (RTTTranscriptionController)transcriber
{
  return self->_transcriber;
}

- (void)setTranscriber:(id)a3
{
  objc_storeStrong((id *)&self->_transcriber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriber, 0);
  objc_storeStrong(&self->_actionCompletionBlock, 0);
  objc_storeStrong(&self->_serverInvalidateCallback, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rttCalls, 0);
  objc_storeStrong((id *)&self->_callUpdateCoalescer, 0);
  objc_storeStrong((id *)&self->_preferredRelayCoalescer, 0);
  objc_storeStrong((id *)&self->_localSettingsCache, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_actionUIClient, 0);
}

void __39__RTTController_handleDatabaseRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Exception decoding data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__RTTController_handleDatabaseRequest___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Failed to create unarchiver with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__RTTController_handleDatabaseRequest___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21473C000, v0, v1, "We need a message type for update messages: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__RTTController_handleDatabaseRequest___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21473C000, v0, v1, "We need a sender type for update messages: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __35__RTTController_displayCallPrompt___block_invoke_100_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Send message error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleRTTVoicemailMessage:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_21473C000, v1, OS_LOG_TYPE_ERROR, "Failed to decode voicemail message url for callID %@, error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)handleRTTVoicemailMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Failed to parse voicemail message url from payload for callID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
