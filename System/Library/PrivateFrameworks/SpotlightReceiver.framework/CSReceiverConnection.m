@implementation CSReceiverConnection

- (int)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4
{
  -[SpotlightReceiver deleteAllInteractionsWithBundleID:protectionClass:](self->_receiver, "deleteAllInteractionsWithBundleID:protectionClass:", a3, a4);
  return 0;
}

- (int)deleteFromBundle:(id)a3 sinceDate:(id)a4 domains:(id)a5 deletes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SpotlightReceiver *receiver;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    -[SpotlightReceiver deleteSearchableItemsWithIdentifiers:bundleID:](self->_receiver, "deleteSearchableItemsWithIdentifiers:bundleID:", v13, v10);
  }
  else if (v12)
  {
    -[SpotlightReceiver deleteSearchableItemsWithDomainIdentifiers:bundleID:](self->_receiver, "deleteSearchableItemsWithDomainIdentifiers:bundleID:", v12, v10);
  }
  else
  {
    receiver = self->_receiver;
    if (v11)
      -[SpotlightReceiver deleteSearchableItemsSinceDate:bundleID:](receiver, "deleteSearchableItemsSinceDate:bundleID:", v11, v10);
    else
      -[SpotlightReceiver deleteAllSearchableItemsWithBundleID:](receiver, "deleteAllSearchableItemsWithBundleID:", v10);
  }

  return 0;
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  id v8;
  _xpc_connection_s *v9;
  xpc_object_t reply;
  uid_t euid;
  uid_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  void *v18;
  int64_t uint64;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  _xpc_connection_s *v32;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  int64_t date;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  size_t v135;
  const void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  size_t length;
  const void *bytes_ptr;
  void *v142;
  uint64_t v143;
  void *v144;
  NSObject *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  uint8_t buf[4];
  const char *v153;
  __int16 v154;
  uid_t v155;
  __int16 v156;
  id v157;
  uint64_t v158;

  v158 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (_xpc_connection_s *)a5;
  reply = xpc_dictionary_create_reply(v8);
  euid = xpc_connection_get_euid(v9);
  if (euid)
  {
    v12 = euid;
    -[CSXPCConnection queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v12;
    dispatch_queue_set_specific(v13, (const void *)SpotlightReceiverConnectionUIDKey, (void *)v12, 0);

    logForCSLogCategoryDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v153 = a3;
      v154 = 1024;
      v155 = v12;
      v156 = 2048;
      v157 = v8;
      _os_log_debug_impl(&dword_21066D000, v15, OS_LOG_TYPE_DEBUG, "receiver command %s cuid: %d info:%p", buf, 0x1Cu);
    }

  }
  else
  {
    v14 = 0;
  }
  if (!strcmp(a3, "s"))
  {
    v17 = -[CSReceiverConnection handleSetup:](self, "handleSetup:", reply);
    v18 = 0;
    v16 = 0;
LABEL_26:
    if (v14)
    {
      -[CSXPCConnection queue](self, "queue");
      v31 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_set_specific(v31, (const void *)SpotlightReceiverConnectionUIDKey, 0, 0);

    }
    xpc_dictionary_get_remote_connection(v8);
    v32 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v32 && reply)
    {
      xpc_dictionary_set_int64(reply, "status", v17);
      xpc_connection_send_message(v32, reply);
    }

    goto LABEL_32;
  }
  if (!strcmp(a3, "j"))
  {
    uint64 = xpc_dictionary_get_uint64(v8, "jt");
    if ((uint64 & self->_supportedJobs) == 0)
    {
      logForCSLogCategoryDefault();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CSReceiverConnection handleCommand:info:connection:].cold.1(uint64, &self->_supportedJobs, v23);

      goto LABEL_24;
    }
    v16 = objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v8);
    if (!v16)
    {
      logForCSLogCategoryDefault();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[CSReceiverConnection handleCommand:info:connection:].cold.2(uint64, v24, v25, v26, v27, v28, v29, v30);

      goto LABEL_24;
    }
    v18 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v8);
    if (uint64 <= 127)
    {
      if (uint64 <= 15)
      {
        v17 = -1;
        switch(uint64)
        {
          case 0:
            goto LABEL_26;
          case 1:
            objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "i", "i-size", v8);
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "c", "c-size", v8);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[CSReceiverConnection indexFromBundle:protectionClass:items:itemsContent:](self, "indexFromBundle:protectionClass:items:itemsContent:", v16, v18, v148, v20);
            v21 = (id)objc_opt_self();
            v22 = (id)objc_opt_self();

            break;
          case 2:
          case 4:
          case 8:
            goto LABEL_49;
          default:
            goto LABEL_105;
        }
        goto LABEL_26;
      }
      if (uint64 != 16)
      {
        if (uint64 != 32)
        {
          if (uint64 == 64)
          {
            objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "a", "a-size", v8);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              v17 = -[CSReceiverConnection addUserActions:bundleID:protectionClass:](self, "addUserActions:bundleID:protectionClass:", v36, v16, v18);
              v38 = (id)objc_opt_self();
              goto LABEL_136;
            }
            logForCSLogCategoryDefault();
            v113 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              -[CSReceiverConnection handleCommand:info:connection:].cold.8(v113, v114, v115, v116, v117, v118, v119, v120);
            goto LABEL_135;
          }
          goto LABEL_105;
        }
        objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "ids", "ids-size", v8);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v56)
        {
          v57 = objc_alloc(MEMORY[0x24BDC23D0]);
          objc_msgSend(v56, "data");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = (void *)objc_msgSend(v57, "initWithData:", v58);

          if (v59
            && (objc_msgSend(v59, "obj"), _MDPlistGetPlistObjectType() == 240)
            && (objc_msgSend(v59, "obj"), _MDPlistArrayGetCount()))
          {
            objc_msgSend(v59, "obj");
            v60 = _MDPlistContainerCopyObject();

            if (v60)
            {
              v17 = -[CSReceiverConnection purgeFromBundle:identifiers:](self, "purgeFromBundle:identifiers:", v16, v60);
              goto LABEL_150;
            }
          }
          else
          {

          }
        }
        logForCSLogCategoryDefault();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          -[CSReceiverConnection handleCommand:info:connection:].cold.7(v60, v92, v93, v94, v95, v96, v97, v98);
        v17 = -1;
        goto LABEL_150;
      }
LABEL_49:
      objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "ids", "ids-size", v8);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      if (uint64 != 16)
      {
        if (uint64 != 4)
        {
          if (uint64 != 2)
          {
            v44 = 0;
            v43 = 0;
            goto LABEL_80;
          }
          if (v149)
          {
            v39 = objc_alloc(MEMORY[0x24BDC23D0]);
            objc_msgSend(v149, "data");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (void *)objc_msgSend(v39, "initWithData:", v40);

            if (v41
              && (objc_msgSend(v41, "obj"), _MDPlistGetPlistObjectType() == 240)
              && (objc_msgSend(v41, "obj"), _MDPlistArrayGetCount()))
            {
              objc_msgSend(v41, "obj");
              v42 = _MDPlistContainerCopyObject();

              if (v42)
              {
                v43 = (void *)v42;
                v44 = 0;
LABEL_80:
                v51 = 0;
                goto LABEL_81;
              }
            }
            else
            {

            }
          }
          logForCSLogCategoryDefault();
          v77 = objc_claimAutoreleasedReturnValue();
          v55 = v77;
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            -[CSReceiverConnection handleCommand:info:connection:].cold.4(v77, v85, v86, v87, v88, v89, v90, v91);
            goto LABEL_124;
          }
          goto LABEL_125;
        }
        if (v149)
        {
          v48 = objc_alloc(MEMORY[0x24BDC23D0]);
          objc_msgSend(v149, "data");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_msgSend(v48, "initWithData:", v49);

          if (v50
            && (objc_msgSend(v50, "obj"), _MDPlistGetPlistObjectType() == 240)
            && (objc_msgSend(v50, "obj"), _MDPlistArrayGetCount()))
          {
            objc_msgSend(v50, "obj");
            v51 = (void *)_MDPlistContainerCopyObject();

            if (v51)
            {
              v44 = 0;
              v43 = 0;
              goto LABEL_81;
            }
          }
          else
          {

          }
        }
        logForCSLogCategoryDefault();
        v77 = objc_claimAutoreleasedReturnValue();
        v55 = v77;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          -[CSReceiverConnection handleCommand:info:connection:].cold.5(v77, v78, v79, v80, v81, v82, v83, v84);
LABEL_124:
          v17 = -1;
          v55 = v77;
          goto LABEL_126;
        }
LABEL_125:
        v17 = -1;
        goto LABEL_126;
      }
      date = xpc_dictionary_get_date(v8, "d");
      if (!date)
      {
        logForCSLogCategoryDefault();
        v77 = objc_claimAutoreleasedReturnValue();
        v55 = v77;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          -[CSReceiverConnection handleCommand:info:connection:].cold.6(v77, v106, v107, v108, v109, v110, v111, v112);
          goto LABEL_124;
        }
        goto LABEL_125;
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)date);
      v53 = objc_claimAutoreleasedReturnValue();
      v43 = 0;
      v51 = 0;
      v44 = v53;
LABEL_81:
      v145 = v44;
      v54 = v43;
      v17 = -[CSReceiverConnection deleteFromBundle:sinceDate:domains:deletes:](self, "deleteFromBundle:sinceDate:domains:deletes:", v16);

      v55 = v145;
LABEL_126:

      goto LABEL_26;
    }
    if (uint64 <= 2047)
    {
      if (uint64 <= 511)
      {
        if (uint64 != 128)
        {
          if (uint64 == 256)
          {
            v34 = (void *)MEMORY[0x24BDC24C8];
            xpc_dictionary_get_value(v8, "ids");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)objc_msgSend(v34, "copyNSStringArrayFromXPCArray:", v35);

            if (v36)
            {
              v17 = -[CSReceiverConnection deleteInteractionsWithIdentifiers:bundleID:protectionClass:](self, "deleteInteractionsWithIdentifiers:bundleID:protectionClass:", v36, v16, v18);
LABEL_136:

              goto LABEL_26;
            }
            logForCSLogCategoryDefault();
            v113 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              -[CSReceiverConnection handleCommand:info:connection:].cold.12(v113, v121, v122, v123, v124, v125, v126, v127);
LABEL_135:

            v17 = -1;
            goto LABEL_136;
          }
LABEL_105:
          logForCSLogCategoryDefault();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            -[CSReceiverConnection handleCommand:info:connection:].cold.3(uint64, v70, v71, v72, v73, v74, v75, v76);

          goto LABEL_25;
        }
        objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "ins", "ins-size", v8);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v56)
          goto LABEL_147;
        v61 = objc_alloc(MEMORY[0x24BDD1620]);
        objc_msgSend(v56, "data");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = (void *)objc_msgSend(v61, "initForReadingFromData:error:", v62, 0);

        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "decodeObjectOfClasses:forKey:", v63, *MEMORY[0x24BDD0E88]);
        v60 = objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          v17 = -[CSReceiverConnection addInteraction:bundleID:protectionClass:](self, "addInteraction:bundleID:protectionClass:", v60, v16, v18);
        }
        else
        {
LABEL_147:
          logForCSLogCategoryDefault();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            -[CSReceiverConnection handleCommand:info:connection:].cold.10();
          v17 = -1;
        }
LABEL_150:

        goto LABEL_26;
      }
      if (uint64 == 512)
      {
        v65 = (void *)MEMORY[0x24BDC24C8];
        xpc_dictionary_get_value(v8, "ids");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v65, "copyNSStringArrayFromXPCArray:", v66);

        if (v36)
        {
          v17 = -[CSReceiverConnection deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:](self, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:", v36, v16, v18);
          goto LABEL_136;
        }
        logForCSLogCategoryDefault();
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          -[CSReceiverConnection handleCommand:info:connection:].cold.13(v113, v128, v129, v130, v131, v132, v133, v134);
        goto LABEL_135;
      }
      if (uint64 != 1024)
        goto LABEL_105;
      v37 = -[CSReceiverConnection deleteAllInteractionsWithBundleID:protectionClass:](self, "deleteAllInteractionsWithBundleID:protectionClass:", v16, v18);
LABEL_61:
      v17 = v37;
      goto LABEL_26;
    }
    if (uint64 < 0x2000)
    {
      if (uint64 != 2048)
      {
        if (uint64 != 4096)
          goto LABEL_105;
        v37 = -[CSReceiverConnection deleteAllUserActivities:](self, "deleteAllUserActivities:", v16);
        goto LABEL_61;
      }
      xpc_dictionary_get_value(v8, "ra");
      v64 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v64;
      if (v64
        && MEMORY[0x212BC91CC](v64) == MEMORY[0x24BDACF90]
        && (length = xpc_data_get_length(v46)) != 0
        && (bytes_ptr = xpc_data_get_bytes_ptr(v46)) != 0
        && (objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, length, 0),
            (v150 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v147 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v150, 0);
        v142 = (void *)MEMORY[0x24BDBCF20];
        v143 = objc_opt_class();
        objc_msgSend(v142, "setWithObjects:", v143, objc_opt_class(), 0);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "decodeObjectOfClasses:forKey:", v144, *MEMORY[0x24BDD0E88]);
        v47 = objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v17 = -[CSReceiverConnection donateRelevantShortcuts:bundleID:](self, "donateRelevantShortcuts:bundleID:", v47, v16);
          goto LABEL_70;
        }
      }
      else
      {
        v150 = 0;
      }
      logForCSLogCategoryDefault();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        -[CSReceiverConnection handleCommand:info:connection:].cold.14();
      v17 = -1;
      goto LABEL_70;
    }
    if (uint64 == 0x2000)
    {
      objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "ids", "ids-size", v8);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
      {
        v67 = objc_alloc(MEMORY[0x24BDC23D0]);
        objc_msgSend(v56, "data");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)objc_msgSend(v67, "initWithData:", v68);

        if (v69
          && (objc_msgSend(v69, "obj"), _MDPlistGetPlistObjectType() == 240)
          && (objc_msgSend(v69, "obj"), _MDPlistArrayGetCount()))
        {
          objc_msgSend(v69, "obj");
          v60 = _MDPlistContainerCopyObject();

          if (v60)
          {
            v17 = -[CSReceiverConnection deleteUserActivitiesWithPersistentIdentifiers:bundleID:](self, "deleteUserActivitiesWithPersistentIdentifiers:bundleID:", v60, v16);
            goto LABEL_150;
          }
        }
        else
        {

        }
      }
      logForCSLogCategoryDefault();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        -[CSReceiverConnection handleCommand:info:connection:].cold.9(v60, v99, v100, v101, v102, v103, v104, v105);
      v17 = -1;
      goto LABEL_150;
    }
    if (uint64 != 0x4000)
      goto LABEL_105;
    xpc_dictionary_get_value(v8, "ra");
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v45;
    if (v45
      && MEMORY[0x212BC91CC](v45) == MEMORY[0x24BDACF90]
      && (v135 = xpc_data_get_length(v46)) != 0
      && (v136 = xpc_data_get_bytes_ptr(v46)) != 0
      && (objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v136, v135, 0),
          (v150 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v146 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v150, 0);
      v137 = (void *)MEMORY[0x24BDBCF20];
      v138 = objc_opt_class();
      objc_msgSend(v137, "setWithObjects:", v138, objc_opt_class(), 0);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "decodeObjectOfClasses:forKey:", v139, *MEMORY[0x24BDD0E88]);
      v47 = objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        v17 = -[CSReceiverConnection donateRelevantActions:bundleID:](self, "donateRelevantActions:bundleID:", v47, v16);
LABEL_70:

        goto LABEL_26;
      }
    }
    else
    {
      v150 = 0;
    }
    logForCSLogCategoryDefault();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      -[CSReceiverConnection handleCommand:info:connection:].cold.16();
    v17 = -1;
    goto LABEL_70;
  }
  if (!_SpotlightDaemonClientHandleCommand(a3, v8, self->_receiver))
  {
LABEL_24:
    v18 = 0;
    v16 = 0;
LABEL_25:
    v17 = -1;
    goto LABEL_26;
  }
  if (v14)
  {
    -[CSXPCConnection queue](self, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_set_specific(v16, (const void *)SpotlightReceiverConnectionUIDKey, 0, 0);
LABEL_32:

  }
  return 1;
}

- (int)deleteAllUserActivities:(id)a3
{
  -[SpotlightReceiver deleteAllUserActivities:](self->_receiver, "deleteAllUserActivities:", a3);
  return 0;
}

- (int)donateRelevantShortcuts:(id)a3 bundleID:(id)a4
{
  -[SpotlightReceiver donateRelevantShortcuts:bundleID:](self->_receiver, "donateRelevantShortcuts:bundleID:", a3, a4);
  return 0;
}

- (int)addInteraction:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  SpotlightReceiver *receiver;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  receiver = self->_receiver;
  v14 = a3;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SpotlightReceiver addInteractions:bundleID:protectionClass:](receiver, "addInteractions:bundleID:protectionClass:", v12, v10, v9, v14, v15);

  return 0;
}

- (CSReceiverConnection)initWithReceiver:(id)a3 forServiceName:(id)a4
{
  id v7;
  id *v8;
  CSReceiverConnection *v9;
  id *v10;
  void *v11;
  void *v12;
  int v13;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSReceiverConnection;
  v8 = -[CSXPCConnection initMachServiceListenerWithName:](&v15, sel_initMachServiceListenerWithName_, a4);
  v9 = (CSReceiverConnection *)v8;
  if (!v8)
    goto LABEL_39;
  v10 = v8 + 8;
  objc_storeStrong(v8 + 8, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*v10, "supportedBundleIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSReceiverConnection setBundleIDs:](v9, "setBundleIDs:", v11);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*v10, "supportedContentTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSReceiverConnection setContentTypes:](v9, "setContentTypes:", v12);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 1u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 2u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 4u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 8u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 0x10u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 0x20u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 0x40u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 0x1000u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 0x2000u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 0x80u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 0x100u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 0x200u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9->_supportedJobs |= 0x400u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = 2048;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_37;
    v13 = 0x4000;
  }
  v9->_supportedJobs |= v13;
LABEL_37:
  if (objc_msgSend(*v10, "conformsToProtocol:", &unk_254A728E8))
    v9->_supportedJobs |= 0x8000u;
LABEL_39:

  return v9;
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  _xpc_connection_s *v3;
  uint64_t pid;
  const __CFAllocator *v5;
  __SecTask *v6;
  __SecTask *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  audit_token_t token;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (_xpc_connection_s *)a3;
  pid = xpc_connection_get_pid(v3);
  xpc_connection_get_audit_token();

  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  memset(&token, 0, sizeof(token));
  v6 = SecTaskCreateWithAuditToken(v5, &token);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)SecTaskCopyValueForEntitlement(v6, (CFStringRef)SpotlightSenderEntitlement, 0);
    v9 = objc_msgSend(v8, "BOOLValue");
    logForCSLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        token.val[0] = 67109120;
        token.val[1] = pid;
        _os_log_impl(&dword_21066D000, v11, OS_LOG_TYPE_INFO, "New sender connection for pid: %d", (uint8_t *)&token, 8u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[CSReceiverConnection addClientConnectionIfAllowedForConnection:].cold.1(pid, v11, v12, v13, v14, v15, v16, v17);
    }

    CFRelease(v7);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)lostClientConnection:(id)a3 error:(id)a4
{
  return 0;
}

- (int)handleSetup:(id)a3
{
  id v4;
  NSArray *bundleIDs;
  NSArray *contentTypes;
  NSArray *INIntentClassNames;

  v4 = a3;
  xpc_dictionary_set_uint64(v4, "jt", self->_supportedJobs);
  bundleIDs = self->_bundleIDs;
  if (bundleIDs)
    objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setStringArray:forKey:", v4, bundleIDs, "bids");
  contentTypes = self->_contentTypes;
  if (contentTypes)
    objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setStringArray:forKey:", v4, contentTypes, "cts");
  INIntentClassNames = self->_INIntentClassNames;
  if (INIntentClassNames)
    objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setStringArray:forKey:", v4, INIntentClassNames, "icls");

  return 0;
}

- (int)indexFromBundle:(id)a3 protectionClass:(id)a4 items:(id)a5 itemsContent:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = a6;
  if (a5)
  {
    v11 = (objc_class *)MEMORY[0x24BDC23D0];
    v12 = a5;
    v13 = a4;
    v14 = a3;
    v15 = [v11 alloc];
    objc_msgSend(v12, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithData:", v16);

    objc_msgSend(v17, "setBackingStore:", v12);
    if (v10)
    {
      v18 = objc_alloc(MEMORY[0x24BDC23D0]);
      objc_msgSend(v10, "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithData:", v19);

      objc_msgSend(v20, "setBackingStore:", v10);
    }
    else
    {
      v20 = 0;
    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2488]), "initWithItems:itemsContent:", v17, v20);
    objc_msgSend(v21, "setBundleID:", v14);
    objc_msgSend(v21, "setProtectionClass:", v13);

    -[SpotlightReceiver addOrUpdateSearchableItems:bundleID:](self->_receiver, "addOrUpdateSearchableItems:bundleID:", v21, v14);
  }

  return 0;
}

- (int)purgeFromBundle:(id)a3 identifiers:(id)a4
{
  -[SpotlightReceiver purgeSearchableItemsWithIdentifiers:bundleID:](self->_receiver, "purgeSearchableItemsWithIdentifiers:bundleID:", a4, a3);
  return 0;
}

- (int)addUserActions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  id v16;
  id v17;

  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDC23D0];
  v10 = a3;
  v11 = [v9 alloc];
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithData:", v12);

  objc_msgSend(v13, "setBackingStore:", v10);
  if (v13)
  {
    objc_msgSend(v13, "obj");
    if (_MDPlistGetPlistObjectType() == 240)
    {
      objc_msgSend(v13, "obj");
      if (_MDPlistArrayGetCount())
      {
        objc_msgSend(v13, "obj");
        v15 = v13;
        v16 = v7;
        v17 = v8;
        _MDPlistArrayIterate();

      }
    }
  }

  return 0;
}

void __64__CSReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke(_QWORD *a1, __int128 *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  _BYTE v11[24];
  __int128 v12;
  uint64_t v13;

  v12 = *a2;
  v13 = *((_QWORD *)a2 + 2);
  if (_MDPlistGetPlistObjectType() == 240)
  {
    v12 = *a2;
    v13 = *((_QWORD *)a2 + 2);
    if (_MDPlistArrayGetCount() == 2)
    {
      v4 = (void *)a1[4];
      v12 = *a2;
      v13 = *((_QWORD *)a2 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      objc_msgSend(v4, "decodeObject:", v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)a1[4];
      v12 = *a2;
      v13 = *((_QWORD *)a2 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      objc_msgSend(v6, "decodeObject:", &v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init(MEMORY[0x24BDC2478]);
      objc_msgSend(v8, "setAttributeSet:", v7);
      objc_msgSend(v8, "setBundleID:", a1[5]);
      objc_msgSend(v8, "setProtection:", a1[6]);
      logForCSLogCategoryDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __64__CSReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_cold_1((uint64_t)v5, v9);

      objc_msgSend(*(id *)(a1[7] + 64), "addUserAction:withItem:", v5, v8);
    }
  }
}

- (int)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4
{
  -[SpotlightReceiver deleteUserActivitiesWithPersistentIdentifiers:bundleID:](self->_receiver, "deleteUserActivitiesWithPersistentIdentifiers:bundleID:", a3, a4);
  return 0;
}

- (int)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  -[SpotlightReceiver deleteInteractionsWithIdentifiers:bundleID:protectionClass:](self->_receiver, "deleteInteractionsWithIdentifiers:bundleID:protectionClass:", a3, a4, a5);
  return 0;
}

- (int)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  -[SpotlightReceiver deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:](self->_receiver, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:", a3, a4, a5);
  return 0;
}

- (int)donateRelevantActions:(id)a3 bundleID:(id)a4
{
  -[SpotlightReceiver donateRelevantActions:bundleID:](self->_receiver, "donateRelevantActions:bundleID:", a3, a4);
  return 0;
}

- (int)supportedJobs
{
  return self->_supportedJobs;
}

- (SpotlightReceiver)receiver
{
  return self->_receiver;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)contentTypes
{
  return self->_contentTypes;
}

- (void)setContentTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)INIntentClassNames
{
  return self->_INIntentClassNames;
}

- (void)setINIntentClassNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_INIntentClassNames, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
}

- (void)addClientConnectionIfAllowedForConnection:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21066D000, a2, a3, "Error pid: %d missing sender entitlement", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCommand:(int)a1 info:(int *)a2 connection:(os_log_t)log .cold.1(int a1, int *a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1;
  v5 = 1024;
  v6 = v3;
  _os_log_error_impl(&dword_21066D000, log, OS_LOG_TYPE_ERROR, "Job not supported type: 0x%x supported: 0x%x ", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_5();
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21066D000, a2, a3, "missing bundleid for jobType: 0x%x ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21066D000, a2, a3, "Job not handled for type: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21066D000, a1, a3, "missing identifiers for jobType: 0x%x ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21066D000, a1, a3, "missing domain identifiers for jobType: 0x%x ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21066D000, a1, a3, "missing date for jobType: 0x%x ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21066D000, a1, a3, "missing identifiers for jobType: 0x%x ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21066D000, a1, a3, "missing actions for jobType: 0x%x ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21066D000, a1, a3, "missing identifiers for jobType: 0x%x ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCommand:info:connection:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21066D000, v0, v1, "missing interactions for jobType: 0x%x error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)handleCommand:(void *)a1 info:(uint64_t)a2 connection:(NSObject *)a3 .cold.11(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_21066D000, a2, a3, "Error: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_6();
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21066D000, a1, a3, "missing identifiers for jobType: 0x%x ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21066D000, a1, a3, "missing identifiers for jobType: 0x%x ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCommand:info:connection:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21066D000, v0, v1, "missing INRelevantShortcuts for jobType: 0x%x error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)handleCommand:info:connection:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21066D000, v0, v1, "missing relevantActions for jobType: 0x%x error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __64__CSReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21066D000, a2, OS_LOG_TYPE_DEBUG, "addUserAction: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
