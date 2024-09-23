@implementation SMReceiverNotificationUtilities

+ (void)prepareNotificationBodyFromMessage:(id)a3 destinationMapItem:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  objc_class *v31;
  id v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  objc_class *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  objc_class *v59;
  id v60;
  void *v61;
  uint64_t v62;
  objc_class *v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  objc_class *v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  objc_class *v83;
  id v84;
  void *v85;
  uint64_t v86;
  _QWORD v87[4];
  NSObject *v88;
  uint64_t *v89;
  id v90;
  SEL v91;
  _QWORD v92[4];
  NSObject *v93;
  void (**v94)(id, uint64_t, _QWORD);
  uint64_t *v95;
  id v96;
  SEL v97;
  _QWORD v98[4];
  NSObject *v99;
  void (**v100)(id, uint64_t, _QWORD);
  uint64_t *v101;
  id v102;
  SEL v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint8_t buf[4];
  id v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  uint64_t v115;
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, uint64_t, _QWORD))a5;
  v12 = objc_msgSend((id)objc_opt_class(), "messageType");
  v104 = 0;
  v105 = &v104;
  v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__0;
  v108 = __Block_byref_object_dispose__0;
  v109 = 0;
  switch(v12)
  {
    case 3:
      objc_msgSend(v9, "summaryText");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v105[5];
      v105[5] = v19;

      _rt_log_facility_get_os_log(RTLogFacilityFramework);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v105[5];
        *(_DWORD *)buf = 138412802;
        v111 = v23;
        v112 = 2112;
        v113 = v24;
        v114 = 2112;
        v115 = v25;
        _os_log_impl(&dword_245521000, v21, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMMessageType SMMessageTypeKeyRelease summaryText: %@", buf, 0x20u);

      }
      v11[2](v11, v105[5], 0);
      goto LABEL_42;
    case 2:
      v26 = v9;
      objc_msgSend(v26, "summaryText");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v105[5];
      v105[5] = v27;

      if (objc_msgSend(v26, "sessionEndReason") == 1 && objc_msgSend(v26, "destinationType") == 4)
      {
        v87[0] = MEMORY[0x24BDAC760];
        v87[1] = 3221225472;
        v87[2] = __107__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_destinationMapItem_completionHandler___block_invoke_46;
        v87[3] = &unk_25166E230;
        v90 = a1;
        v91 = a2;
        v88 = v11;
        v89 = &v104;
        +[SMReceiverNotificationUtilities fetchDestinationNameFromMapItem:completionHandler:](SMReceiverNotificationUtilities, "fetchDestinationNameFromMapItem:completionHandler:", v10, v87);
        v29 = v88;
      }
      else
      {
        v11[2](v11, v105[5], 0);
        _rt_log_facility_get_os_log(RTLogFacilityFramework);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v36 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v105[5];
          *(_DWORD *)buf = 138412802;
          v111 = v36;
          v112 = 2112;
          v113 = v37;
          v114 = 2112;
          v115 = v38;
          _os_log_impl(&dword_245521000, v29, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMMessageTypeSessionEnd DEFAULT summaryText: %@", buf, 0x20u);

        }
      }
      goto LABEL_41;
    case 1:
      v13 = v9;
      objc_msgSend(v13, "summaryText");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v105[5];
      v105[5] = v14;

      objc_msgSend(v13, "coarseEstimatedEndTime");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(v13, "estimatedEndTime");
        v18 = objc_claimAutoreleasedReturnValue();
      }
      v29 = v18;

      v39 = objc_msgSend(v13, "sessionType");
      if (v39 == 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("START_MESSAGE_TIME_BOUND_SUMMARY_FORMAT_WITH_ETA"), CFSTR("Check In: Timer %@"), 0);
        v40 = objc_claimAutoreleasedReturnValue();

        v42 = (void *)MEMORY[0x24BDD17C8];
        -[NSObject roundedTime](v29, "roundedTime");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "absoluteTimeString:preposition:capitalized:", 0, 1, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v40, CFSTR("%@"), 0, v44);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v105[5];
        v105[5] = v45;

        _rt_log_facility_get_os_log(RTLogFacilityFramework);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = (objc_class *)objc_opt_class();
          NSStringFromClass(v48);
          v49 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v105[5];
          *(_DWORD *)buf = 138412802;
          v111 = v49;
          v112 = 2112;
          v113 = v50;
          v114 = 2112;
          v115 = v51;
          _os_log_impl(&dword_245521000, v47, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionTypeTimeBound summaryText: %@", buf, 0x20u);

        }
      }
      else
      {
        if (v39 != 2)
        {
          if (v39 == 3)
          {
            v92[0] = MEMORY[0x24BDAC760];
            v92[1] = 3221225472;
            v92[2] = __107__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_destinationMapItem_completionHandler___block_invoke_37;
            v92[3] = &unk_25166E208;
            v95 = &v104;
            v93 = v29;
            v96 = a1;
            v97 = a2;
            v94 = v11;
            +[SMReceiverNotificationUtilities fetchDestinationNameFromMapItem:completionHandler:](SMReceiverNotificationUtilities, "fetchDestinationNameFromMapItem:completionHandler:", v10, v92);

            v40 = v93;
          }
          else
          {
            v11[2](v11, v105[5], 0);
            _rt_log_facility_get_os_log(RTLogFacilityFramework);
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v63 = (objc_class *)objc_opt_class();
              NSStringFromClass(v63);
              v64 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = v105[5];
              *(_DWORD *)buf = 138412802;
              v111 = v64;
              v112 = 2112;
              v113 = v65;
              v114 = 2112;
              v115 = v66;
              _os_log_impl(&dword_245521000, v40, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMMessageTypeSessionStart DEFAULT summaryText: %@", buf, 0x20u);

            }
          }
          goto LABEL_40;
        }
        v52 = objc_msgSend(v13, "destinationType");
        switch(v52)
        {
          case 3:
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("START_MESSAGE_SCHOOL_SUMMARY_FORMAT_WITH_ETA"), CFSTR("Check In: School %@"), 0);
            v40 = objc_claimAutoreleasedReturnValue();

            v68 = (void *)MEMORY[0x24BDD17C8];
            -[NSObject roundedTime](v29, "roundedTime");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "absoluteTimeString:preposition:capitalized:", 0, 1, 0);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v40, CFSTR("%@"), 0, v70);
            v71 = objc_claimAutoreleasedReturnValue();
            v72 = (void *)v105[5];
            v105[5] = v71;

            _rt_log_facility_get_os_log(RTLogFacilityFramework);
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v73 = (objc_class *)objc_opt_class();
              NSStringFromClass(v73);
              v74 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = v105[5];
              *(_DWORD *)buf = 138412802;
              v111 = v74;
              v112 = 2112;
              v113 = v75;
              v114 = 2112;
              v115 = v76;
              _os_log_impl(&dword_245521000, v47, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionTypeDestinationBound SCHOOL summaryText: %@", buf, 0x20u);

            }
            break;
          case 2:
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("START_MESSAGE_WORK_SUMMARY_FORMAT_WITH_ETA"), CFSTR("Check In: Work %@"), 0);
            v40 = objc_claimAutoreleasedReturnValue();

            v78 = (void *)MEMORY[0x24BDD17C8];
            -[NSObject roundedTime](v29, "roundedTime");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "absoluteTimeString:preposition:capitalized:", 0, 1, 0);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v40, CFSTR("%@"), 0, v80);
            v81 = objc_claimAutoreleasedReturnValue();
            v82 = (void *)v105[5];
            v105[5] = v81;

            _rt_log_facility_get_os_log(RTLogFacilityFramework);
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v83 = (objc_class *)objc_opt_class();
              NSStringFromClass(v83);
              v84 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = v105[5];
              *(_DWORD *)buf = 138412802;
              v111 = v84;
              v112 = 2112;
              v113 = v85;
              v114 = 2112;
              v115 = v86;
              _os_log_impl(&dword_245521000, v47, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionTypeDestinationBound WORK summaryText: %@", buf, 0x20u);

            }
            break;
          case 1:
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("START_MESSAGE_HOME_SUMMARY_FORMAT_WITH_ETA"), CFSTR("Check In: Home %@"), 0);
            v40 = objc_claimAutoreleasedReturnValue();

            v54 = (void *)MEMORY[0x24BDD17C8];
            -[NSObject roundedTime](v29, "roundedTime");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "absoluteTimeString:preposition:capitalized:", 0, 1, 0);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v40, CFSTR("%@"), 0, v56);
            v57 = objc_claimAutoreleasedReturnValue();
            v58 = (void *)v105[5];
            v105[5] = v57;

            _rt_log_facility_get_os_log(RTLogFacilityFramework);
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v59 = (objc_class *)objc_opt_class();
              NSStringFromClass(v59);
              v60 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = v105[5];
              *(_DWORD *)buf = 138412802;
              v111 = v60;
              v112 = 2112;
              v113 = v61;
              v114 = 2112;
              v115 = v62;
              _os_log_impl(&dword_245521000, v47, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionTypeDestinationBound HOME summaryText: %@", buf, 0x20u);

            }
            break;
          default:
            v98[0] = MEMORY[0x24BDAC760];
            v98[1] = 3221225472;
            v98[2] = __107__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_destinationMapItem_completionHandler___block_invoke;
            v98[3] = &unk_25166E208;
            v101 = &v104;
            v99 = v29;
            v102 = a1;
            v103 = a2;
            v100 = v11;
            +[SMReceiverNotificationUtilities fetchDestinationNameFromMapItem:completionHandler:](SMReceiverNotificationUtilities, "fetchDestinationNameFromMapItem:completionHandler:", v10, v98);

            v40 = v99;
            goto LABEL_40;
        }
      }

      v11[2](v11, v105[5], 0);
LABEL_40:

LABEL_41:
LABEL_42:

      goto LABEL_43;
  }
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v105[5];
    *(_DWORD *)buf = 138412802;
    v111 = v32;
    v112 = 2112;
    v113 = v33;
    v114 = 2112;
    v115 = v34;
    _os_log_impl(&dword_245521000, v30, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMMessageType DEFAULT summaryText: %@", buf, 0x20u);

  }
  v11[2](v11, v105[5], 0);
LABEL_43:
  _Block_object_dispose(&v104, 8);

}

void __107__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_destinationMapItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("START_MESSAGE_FALLBACK_DESTINATION_SUMMARY_FORMAT_WITH_ETA"), CFSTR("Check In: Destination %@"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "roundedTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteTimeString:preposition:capitalized:", 0, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v28;
      v32 = 2112;
      v33 = v29;
      v34 = 2112;
      v35 = v6;
      _os_log_error_impl(&dword_245521000, v16, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@,Unable to fetch destination name due to error %@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("START_MESSAGE_CUSTOMISED_DESTINATION_SUMMARY_FORMAT_WITH_ETA"), CFSTR("Check In: %@ %@"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "roundedTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "absoluteTimeString:preposition:capitalized:", 0, 1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@%@"), 0, v5, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v31 = v24;
      v32 = 2112;
      v33 = v25;
      v34 = 2112;
      v35 = v26;
      _os_log_impl(&dword_245521000, v16, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionDestinationTypeOther summaryText: %@", buf, 0x20u);

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __107__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_destinationMapItem_completionHandler___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("START_MESSAGE_ROUNDTRIP_FALLBACK_DESTINATION_SUMMARY_FORMAT_WITH_ETA"), CFSTR("Check In: Round trip to destination %@"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "roundedTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteTimeString:preposition:capitalized:", 0, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v28;
      v32 = 2112;
      v33 = v29;
      v34 = 2112;
      v35 = v6;
      _os_log_error_impl(&dword_245521000, v16, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@,Unable to fetch destination name due to error %@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("START_MESSAGE_ROUNDTRIP_CUSTOMISED_SUMMARY_FORMAT_WITH_ETA"), CFSTR("Check In: Round trip to %@ %@"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "roundedTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "absoluteTimeString:preposition:capitalized:", 0, 1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@%@"), 0, v5, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v31 = v24;
      v32 = 2112;
      v33 = v25;
      v34 = 2112;
      v35 = v26;
      _os_log_impl(&dword_245521000, v16, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionTypeRoundTrip summaryText: %@", buf, 0x20u);

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __107__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_destinationMapItem_completionHandler___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v19;
      v23 = 2112;
      v24 = v20;
      v25 = 2112;
      v26 = v6;
      _os_log_error_impl(&dword_245521000, v7, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@,Unable to fetch destination name due to error %@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("END_MESSAGE_SAFE_ARRIVAL_CUSTOMISED_DESTINATION_SUMMARY"), CFSTR("Check In: Arrived at %@"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_245521000, v13, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMMessageTypeSessionEnd Safe Arrival at customised destination summaryText: %@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

+ (void)fetchDestinationNameFromMapItem:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SEL v15;

  v7 = a4;
  v8 = (void *)MEMORY[0x24BE3CF68];
  v9 = a3;
  objc_msgSend(v8, "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __85__SMReceiverNotificationUtilities_fetchDestinationNameFromMapItem_completionHandler___block_invoke;
  v12[3] = &unk_25166E258;
  v13 = v7;
  v14 = a1;
  v15 = a2;
  v11 = v7;
  objc_msgSend(v10, "resolveMapItemFromHandle:completionHandler:", v9, v12);

}

void __85__SMReceiverNotificationUtilities_fetchDestinationNameFromMapItem_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    objc_msgSend(v5, "geoAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "structuredAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fullThoroughfare");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "geoAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "structuredAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fullThoroughfare");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v15, 0);

    }
    else
    {
      objc_msgSend(v6, "shortAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (!v17)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412546;
          v24 = v21;
          v25 = 2112;
          v26 = v22;
          _os_log_error_impl(&dword_245521000, v19, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@, Unable to retrieve destination address from geoMapItem", (uint8_t *)&v23, 0x16u);

        }
        v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
        goto LABEL_3;
      }
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "shortAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v18 + 16))(v18, v13, 0);
    }

    goto LABEL_9;
  }
  v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_3:
  v7();
LABEL_9:

}

@end
