@implementation USUsageQuerying

- (USUsageQuerying)initWithContext:(id)a3 coreDuetStream:(id)a4
{
  _CDUserContext *v6;
  BMCoreDuetStream *v7;
  USUsageQuerying *v8;
  _CDUserContext *context;
  _CDUserContext *v10;
  BMCoreDuetStream *duetStream;
  objc_super v13;

  v6 = (_CDUserContext *)a3;
  v7 = (BMCoreDuetStream *)a4;
  v13.receiver = self;
  v13.super_class = (Class)USUsageQuerying;
  v8 = -[USUsageQuerying init](&v13, sel_init);
  context = v8->_context;
  v8->_context = v6;
  v10 = v6;

  duetStream = v8->_duetStream;
  v8->_duetStream = v7;

  return v8;
}

- (USUsageQuerying)initWithContext:(id)a3 eventStorage:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  USUsageQuerying *v10;

  v6 = (objc_class *)MEMORY[0x24BE0CB68];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithKnowledgeStore:clientContext:identifier:", v7, v8, CFSTR("CoreDuetStream"));

  v10 = -[USUsageQuerying initWithContext:coreDuetStream:](self, "initWithContext:coreDuetStream:", v8, v9);
  return v10;
}

- (USUsageQuerying)init
{
  void *v3;
  void *v4;
  USUsageQuerying *v5;

  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0CDB0], "coreDuetStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[USUsageQuerying initWithContext:coreDuetStream:](self, "initWithContext:coreDuetStream:", v3, v4);

  return v5;
}

+ (id)getLocalDeviceIdentifierAndReturnError:(id *)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE1B0B0], "userKnowledgeStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceDeviceIdentityWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)synchronizeUsageWithCompletionHandler:(id)a3
{
  id v3;
  __CFBundle *MainBundle;
  __CFString *Identifier;
  __CFString *v6;
  void *v7;
  qos_class_t v8;
  void *v9;
  void *v10;
  int v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  MainBundle = CFBundleGetMainBundle();
  Identifier = (__CFString *)CFBundleGetIdentifier(MainBundle);
  if (Identifier)
  {
    v6 = Identifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processName");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Requesting high urgency synchronization on behalf of %{public}@", (uint8_t *)&v11, 0xCu);
  }
  v8 = qos_class_self();
  dispatch_get_global_queue(v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0B0], "userKnowledgeStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronizeWithUrgency:client:responseQueue:completion:", 10, CFSTR("UsageTracking"), v9, v3);

}

- (void)queryUsageDuringInterval:(id)a3 partitionInterval:(double)a4 completionHandler:(id)a5
{
  -[USUsageQuerying queryUsageDuringInterval:partitionInterval:focalOnly:completionHandler:](self, "queryUsageDuringInterval:partitionInterval:focalOnly:completionHandler:", a3, 1, a5, a4);
}

- (void)queryUsageDuringInterval:(id)a3 partitionInterval:(double)a4 focalOnly:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  void *v10;
  id v11;
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
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  id v130;
  id v131;
  id v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  void *v147;
  void *v148;
  void *v149;
  _BOOL4 v150;
  USUsageQuerying *v151;
  _QWORD v152[5];
  id v153;
  id v154;
  id v155;
  double v156;
  BOOL v157;
  _QWORD v158[4];
  id v159;
  _QWORD v160[5];
  void *v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  uint64_t v170;

  v150 = a5;
  v170 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v146 = a6;
  v147 = (void *)objc_opt_new();
  v151 = self;
  -[USUsageQuerying duetStream](self, "duetStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B088], "allDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDeviceIDs:", v13);

  objc_msgSend(MEMORY[0x24BE1B130], "displayIsBacklit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v161, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEventStreams:", v15);

  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = v16;
  objc_msgSend(MEMORY[0x24BE1B0F8], "endDateSortDescriptorAscending:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v163, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSortDescriptors:", v18);

  v19 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(v11, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predicateForEventsIntersectingDateRangeFrom:to:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(MEMORY[0x24BE1B048], "yes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "predicateForEventsWithCategoryValue:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc(MEMORY[0x24BDD14C0]);
  v168 = v22;
  v169 = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v168, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(v26, "initWithType:subpredicates:", 1, v27);
  objc_msgSend(v12, "setPredicate:", v28);

  objc_msgSend(v10, "publisherForQuery:", v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "collect");
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  -[USUsageQuerying duetStream](self, "duetStream");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x24BE1B0F8];
  v31 = v11;
  objc_msgSend(v31, "startDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "endDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "predicateForEventsIntersectingDateRangeFrom:to:", v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B078], "usageType");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andIntegerValue:", v35, 1);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:", v35);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "notPredicateWithSubpredicate:", v148);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x24BDD14C0];
  v163 = v139;
  v164 = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v163, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "orPredicateWithSubpredicates:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_alloc(MEMORY[0x24BDD14C0]);
  v168 = v34;
  v169 = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v168, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v40, "initWithType:subpredicates:", 1, v41);

  v43 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B088], "allDevices");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setDeviceIDs:", v44);

  objc_msgSend(MEMORY[0x24BE1B130], "appUsageStream");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v167, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setEventStreams:", v46);

  if (v150)
    v47 = v42;
  else
    v47 = v34;
  objc_msgSend(v43, "setPredicate:", v47);
  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v48;
  objc_msgSend(MEMORY[0x24BE1B0F8], "endDateSortDescriptorAscending:", 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v161, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "setSortDescriptors:", v50);
  objc_msgSend(v143, "publisherForQuery:", v43);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v51, "collect");
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  -[USUsageQuerying duetStream](v151, "duetStream");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v31;
  v53 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(v52, "startDate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "endDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "predicateForEventsIntersectingDateRangeFrom:to:", v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B078], "usageType");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andIntegerValue:", v57, 1);
  v58 = (id)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (!v150)
  {
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andIntegerValue:", v57, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_alloc(MEMORY[0x24BDD14C0]);
    v163 = v58;
    v164 = v60;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v163, 2);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v61, "initWithType:subpredicates:", 2, v62);

  }
  v63 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B088], "allDevices");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setDeviceIDs:", v64);

  objc_msgSend(MEMORY[0x24BE1B130], "appWebUsageStream");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = v65;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v167, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setEventStreams:", v66);

  v67 = objc_alloc(MEMORY[0x24BDD14C0]);
  v168 = v56;
  v169 = v59;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v168, 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v67, "initWithType:subpredicates:", 1, v68);
  objc_msgSend(v63, "setPredicate:", v69);

  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v70;
  objc_msgSend(MEMORY[0x24BE1B0F8], "endDateSortDescriptorAscending:", 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v71;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v161, 2);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setSortDescriptors:", v72);

  objc_msgSend(v140, "publisherForQuery:", v63);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v73, "collect");
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  -[USUsageQuerying duetStream](v151, "duetStream");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)MEMORY[0x24BE1B0F8];
  v75 = v52;
  objc_msgSend(v75, "startDate");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "endDate");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "predicateForEventsIntersectingDateRangeFrom:to:", v76, v77);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(MEMORY[0x24BE1B0D8], "playing");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "predicateForObjectsWithMetadataKey:andIntegerValue:", v79, 1);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(MEMORY[0x24BE1B0D8], "mediaType");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "predicateForObjectsWithMetadataKey:andStringValue:", v81, *MEMORY[0x24BE65880]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", CFSTR("com.apple.quicklook.QuickLookUIService"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", CFSTR("com.apple.quicklook.extension.previewUI"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_alloc(MEMORY[0x24BDD14C0]);
  v168 = v141;
  v169 = v136;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v168, 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend(v83, "initWithType:subpredicates:", 2, v84);

  v86 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B088], "allDevices");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setDeviceIDs:", v87);

  objc_msgSend(MEMORY[0x24BE1B130], "nowPlayingStream");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = v88;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v167, 1);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setEventStreams:", v89);

  v90 = objc_alloc(MEMORY[0x24BDD14C0]);
  v163 = v135;
  v164 = v134;
  v165 = v82;
  v166 = v85;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v163, 4);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend(v90, "initWithType:subpredicates:", 1, v91);
  objc_msgSend(v86, "setPredicate:", v92);

  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v93;
  objc_msgSend(MEMORY[0x24BE1B0F8], "endDateSortDescriptorAscending:", 1);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v94;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v161, 2);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v86, "setSortDescriptors:", v95);
  objc_msgSend(v137, "publisherForQuery:", v86);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v96, "collect");
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  -[USUsageQuerying duetStream](v151, "duetStream");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v75;
  v99 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B088], "allDevices");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setDeviceIDs:", v100);

  objc_msgSend(MEMORY[0x24BE1B130], "appMediaUsageStream");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v101;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v168, 1);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setEventStreams:", v102);

  v103 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(v98, "startDate");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "endDate");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "predicateForEventsIntersectingDateRangeFrom:to:", v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setPredicate:", v106);

  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 1);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = v107;
  objc_msgSend(MEMORY[0x24BE1B0F8], "endDateSortDescriptorAscending:", 1);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v108;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v163, 2);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v99, "setSortDescriptors:", v109);
  objc_msgSend(v97, "publisherForQuery:", v99);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v110, "collect");
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  -[USUsageQuerying duetStream](v151, "duetStream");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v98;
  v113 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B088], "allDevices");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setDeviceIDs:", v114);

  objc_msgSend(MEMORY[0x24BE1B130], "notificationUsageStream");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v115;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v168, 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setEventStreams:", v116);

  v117 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(v112, "startDate");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "endDate");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "predicateForEventsWithStartInDateRangeFrom:to:", v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", CFSTR("Receive"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_alloc(MEMORY[0x24BDD14C0]);
  v163 = v120;
  v164 = v121;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v163, 2);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  v124 = (void *)objc_msgSend(v122, "initWithType:subpredicates:", 1, v123);
  objc_msgSend(v113, "setPredicate:", v124);

  objc_msgSend(v111, "publisherForQuery:", v113);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v125, "collect");
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  v160[0] = v149;
  v160[1] = v144;
  v160[2] = v142;
  v160[3] = v138;
  v160[4] = v126;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v160, 5);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "zipWithOthers:", v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = MEMORY[0x24BDAC760];
  v158[0] = MEMORY[0x24BDAC760];
  v158[1] = 3221225472;
  v158[2] = __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke;
  v158[3] = &unk_24C7DAEB0;
  v159 = v146;
  v152[0] = v129;
  v152[1] = 3221225472;
  v152[2] = __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2;
  v152[3] = &unk_24C7DAF00;
  v152[4] = v151;
  v153 = v112;
  v157 = v150;
  v154 = v147;
  v155 = v159;
  v156 = a4;
  v130 = v159;
  v131 = v147;
  v132 = v112;
  v133 = (id)objc_msgSend(v128, "sinkWithCompletion:receiveInput:", v158, v152);

}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "state") == 1)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v3 + 16))(v3, 0, 0, 0, v4);

  }
}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  char v55;
  uint8_t buf;
  _BYTE v57[15];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count") != 6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[USUsageQuerying queryUsageDuringInterval:partitionInterval:focalOnly:completionHandler:]_block_invoke_2");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("USUsageQuerying.m"), 119, CFSTR("Expecting event types count to be 6"));

  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v5 = objc_claimAutoreleasedReturnValue();
  v40 = v3;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B000], "appBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0D0], "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = a1;
  v36 = (void *)v5;
  v41 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 32), "_getBundleIdentiersFromApplicationUsageEvents:videoUsageEvents:interval:referenceDate:focalOnly:", v4, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v59 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v15, "metadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "metadata");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          v20 = v17;
        else
          v20 = v19;
        v21 = v20;
        if (v21)
        {
          objc_msgSend(v9, "addObject:", v21);
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2_cold_2(&buf, v57);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2_cold_1();
    objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_29;
    v43[3] = &unk_24C7DAED8;
    v23 = *(id *)(v35 + 56);
    v24 = *(_QWORD *)(v35 + 32);
    v53 = v23;
    v43[4] = v24;
    v44 = v38;
    v25 = v36;
    v45 = v36;
    v46 = *(id *)(v35 + 40);
    v26 = *(id *)(v35 + 48);
    v55 = *(_BYTE *)(v35 + 72);
    v47 = v26;
    v48 = v22;
    v27 = v39;
    v49 = v39;
    v50 = v41;
    v28 = v37;
    v51 = v37;
    v52 = v10;
    v29 = v38;
    v54 = *(_QWORD *)(v35 + 64);
    v30 = v22;
    objc_msgSend(v30, "categoriesForBundleIDs:completionHandler:", v42, v43);

    v31 = v41;
  }
  else
  {
    LOBYTE(v34) = *(_BYTE *)(v35 + 72);
    v29 = v38;
    v27 = v39;
    v31 = v41;
    v25 = v36;
    v28 = v37;
    objc_msgSend(*(id *)(v35 + 32), "_computeUsageWithDisplayBacklitEvents:applicationUsageEvents:webUsageEvents:nowPlayingEvents:videoUsageEvents:notificationEvents:categoryByBundleIdentifier:categoryByWebDomain:interval:partitionInterval:referenceDate:focalOnly:completionHandler:", v39, v41, v38, v37, v36, v10, *(double *)(v35 + 64), 0, 0, *(_QWORD *)(v35 + 40), *(_QWORD *)(v35 + 48), v34, *(_QWORD *)(v35 + 56));
  }

}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  char v22;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_getWebDomainsFromWebUsageEvents:videoUsageEvents:interval:referenceDate:focalOnly:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 128));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_29_cold_1();
      v5 = *(void **)(a1 + 72);
      objc_msgSend(v4, "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_30;
      v10[3] = &unk_24C7DAED8;
      v7 = *(id *)(a1 + 112);
      v8 = *(_QWORD *)(a1 + 32);
      v20 = v7;
      v10[4] = v8;
      v11 = *(id *)(a1 + 80);
      v12 = *(id *)(a1 + 88);
      v13 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 96);
      v15 = *(id *)(a1 + 48);
      v16 = *(id *)(a1 + 104);
      v17 = v3;
      v18 = *(id *)(a1 + 56);
      v21 = *(_QWORD *)(a1 + 120);
      v19 = *(id *)(a1 + 64);
      v22 = *(_BYTE *)(a1 + 128);
      objc_msgSend(v5, "categoriesForDomainNames:completionHandler:", v6, v10);

    }
    else
    {
      LOBYTE(v9) = *(_BYTE *)(a1 + 128);
      objc_msgSend(*(id *)(a1 + 32), "_computeUsageWithDisplayBacklitEvents:applicationUsageEvents:webUsageEvents:nowPlayingEvents:videoUsageEvents:notificationEvents:categoryByBundleIdentifier:categoryByWebDomain:interval:partitionInterval:referenceDate:focalOnly:completionHandler:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 104), *(double *)(a1 + 120), v3, 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v9, *(_QWORD *)(a1 + 112));
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 112) + 16))();
  }

}

uint64_t __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_30(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 112) + 16))();
  LOBYTE(v3) = *(_BYTE *)(a1 + 128);
  return objc_msgSend(*(id *)(a1 + 32), "_computeUsageWithDisplayBacklitEvents:applicationUsageEvents:webUsageEvents:nowPlayingEvents:videoUsageEvents:notificationEvents:categoryByBundleIdentifier:categoryByWebDomain:interval:partitionInterval:referenceDate:focalOnly:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(double *)(a1 + 120), *(_QWORD *)(a1 + 88), a2, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), v3, *(_QWORD *)(a1 + 112));
}

- (void)_computeUsageWithDisplayBacklitEvents:(id)a3 applicationUsageEvents:(id)a4 webUsageEvents:(id)a5 nowPlayingEvents:(id)a6 videoUsageEvents:(id)a7 notificationEvents:(id)a8 categoryByBundleIdentifier:(id)a9 categoryByWebDomain:(id)a10 interval:(id)a11 partitionInterval:(double)a12 referenceDate:(id)a13 focalOnly:(BOOL)a14 completionHandler:(id)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void (**v47)(id, void *, void *, void *, _QWORD);
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76[2];

  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v26 = a8;
  v67 = a9;
  v66 = a10;
  v27 = a11;
  v65 = a13;
  v47 = (void (**)(id, void *, void *, void *, _QWORD))a15;
  v64 = (void *)objc_opt_new();
  v63 = (void *)objc_opt_new();
  v62 = (void *)objc_opt_new();
  v54 = v21;
  v61 = (void *)objc_msgSend(v21, "mutableCopy");
  v53 = v22;
  v28 = (void *)objc_msgSend(v22, "mutableCopy");
  v52 = v23;
  v29 = (void *)objc_msgSend(v23, "mutableCopy");
  v51 = v24;
  v58 = (void *)objc_msgSend(v24, "mutableCopy");
  v49 = v26;
  v57 = (void *)objc_msgSend(v26, "mutableCopy");
  v60 = v28;
  objc_msgSend(v28, "addObjectsFromArray:", v25);
  v59 = v29;
  v50 = v25;
  objc_msgSend(v29, "addObjectsFromArray:", v25);
  objc_msgSend(v27, "startDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "endDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v27;
  objc_msgSend(v27, "duration");
  if (v32 <= a12)
  {
    v33 = v31;
  }
  else
  {
    objc_msgSend(v30, "dateByAddingTimeInterval:", a12);
    v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  v73 = v33;
  v56 = v31;
  if (objc_msgSend(v30, "compare:", v31) == -1)
  {
    do
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v30, v73);
      v36 = (void *)objc_opt_new();
      v37 = (void *)objc_opt_new();
      v38 = (void *)objc_opt_new();
      v39 = (void *)objc_opt_new();
      v40 = (void *)objc_opt_new();
      v75 = 0;
      v76[0] = 0;
      -[USUsageQuerying _computeScreenTime:withEvents:intersectingScreenTimeIntervalsByDevice:longestSessionByDevice:timeZoneByDevice:lastEventDateByDevice:partition:referenceDate:](self, "_computeScreenTime:withEvents:intersectingScreenTimeIntervalsByDevice:longestSessionByDevice:timeZoneByDevice:lastEventDateByDevice:partition:referenceDate:", 1, v61, v76, &v75, v39, v40, v35, v65);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v76[0];
      v70 = v75;
      v74 = 0;
      LOBYTE(v45) = a14;
      -[USUsageQuerying _computeApplicationUsageWithEvents:unboundApplicationUsageIntervalsByDevice:timeZoneByDevice:lastEventDateByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:categoryByBundleIdentifier:partition:referenceDate:focalOnly:](self, "_computeApplicationUsageWithEvents:unboundApplicationUsageIntervalsByDevice:timeZoneByDevice:lastEventDateByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:categoryByBundleIdentifier:partition:referenceDate:focalOnly:", v60, &v74, v39, v40, v36, v37, v67, v35, v65, v45);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v74;
      LOBYTE(v46) = a14;
      -[USUsageQuerying _computeWebUsageWithEvents:timeZoneByDevice:lastEventDateByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByWebDomain:partition:referenceDate:focalOnly:](self, "_computeWebUsageWithEvents:timeZoneByDevice:lastEventDateByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByWebDomain:partition:referenceDate:focalOnly:", v59, v39, v40, v36, v37, v38, v66, v35, v65, v46);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[USUsageQuerying _computeNowPlayingUsageWithEvents:categoryUsageIntervalsByDevice:timeZoneByDevice:lastEventDateByDevice:partition:referenceDate:](self, "_computeNowPlayingUsageWithEvents:categoryUsageIntervalsByDevice:timeZoneByDevice:lastEventDateByDevice:partition:referenceDate:", v58, v36, v39, v40, v35, v65);
      if (objc_msgSend(v57, "count"))
      {
        -[USUsageQuerying _computeNotificationsWithEvents:timeZoneByDevice:lastEventDateByDevice:partition:](self, "_computeNotificationsWithEvents:timeZoneByDevice:lastEventDateByDevice:partition:", v57, v39, v40, v35);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = 0;
      }
      -[USUsageQuerying _updateLocalReports:remoteReports:aggregateReports:nonIntersectingScreenTimeIntervals:intersectingScreenTimeIntervals:longestSessionByDevice:applicationUsageIntervals:unboundApplicationUsageIntervals:webUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByBundleIdentifier:categoryByWebDomain:notificationsByDevice:interval:timeZoneByDevice:lastEventDateByDevice:](self, "_updateLocalReports:remoteReports:aggregateReports:nonIntersectingScreenTimeIntervals:intersectingScreenTimeIntervals:longestSessionByDevice:applicationUsageIntervals:unboundApplicationUsageIntervals:webUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByBundleIdentifier:categoryByWebDomain:notificationsByDevice:interval:timeZoneByDevice:lastEventDateByDevice:", v64, v63, v62, v72, v71, v70, v69, v68, v41, v36, v37, v38, v67, v66,
        v42,
        v35,
        v39,
        v40);
      v34 = v73;

      objc_msgSend(v56, "timeIntervalSinceDate:", v34);
      if (v43 <= a12)
      {
        v44 = v56;
      }
      else
      {
        objc_msgSend(v34, "dateByAddingTimeInterval:", a12);
        v44 = (id)objc_claimAutoreleasedReturnValue();
      }
      v73 = v44;

      v30 = v34;
    }
    while (objc_msgSend(v34, "compare:", v56) == -1);
  }
  else
  {
    v34 = v30;
  }
  v47[2](v47, v64, v63, v62, 0);

}

- (void)_updateLocalReports:(id)a3 remoteReports:(id)a4 aggregateReports:(id)a5 nonIntersectingScreenTimeIntervals:(id)a6 intersectingScreenTimeIntervals:(id)a7 longestSessionByDevice:(id)a8 applicationUsageIntervals:(id)a9 unboundApplicationUsageIntervals:(id)a10 webUsageIntervalsByDevice:(id)a11 categoryUsageIntervalsByDevice:(id)a12 aggregatedApplicationUsageIntervalsByDevice:(id)a13 aggregatedWebUsageIntervalsByDevice:(id)a14 categoryByBundleIdentifier:(id)a15 categoryByWebDomain:(id)a16 notificationsByDevice:(id)a17 interval:(id)a18 timeZoneByDevice:(id)a19 lastEventDateByDevice:(id)a20
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  USUsageQuerying *v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  uint64_t *v105;
  uint64_t *v106;
  SEL v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;

  v83 = a3;
  v85 = a4;
  v77 = a5;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a9;
  v82 = a10;
  v29 = a11;
  v30 = a12;
  v31 = a13;
  v32 = a14;
  v33 = a15;
  v81 = a16;
  v80 = a17;
  v79 = a18;
  v34 = a19;
  v78 = a20;
  v84 = v34;
  v35 = v34;
  v36 = v85;
  if (objc_msgSend(v35, "count"))
  {
    v67 = v33;
    v68 = v32;
    v69 = v31;
    v70 = v30;
    v71 = v29;
    v72 = v28;
    v73 = v27;
    v74 = v26;
    v75 = v25;
    v114 = 0;
    v115 = &v114;
    v116 = 0x2020000000;
    v117 = 0;
    v108 = 0;
    v109 = &v108;
    v110 = 0x3032000000;
    v111 = __Block_byref_object_copy__0;
    v112 = __Block_byref_object_dispose__0;
    v113 = 0;
    v37 = (void *)objc_opt_new();
    v86[0] = MEMORY[0x24BDAC760];
    v86[1] = 3221225472;
    v86[2] = __473__USUsageQuerying__updateLocalReports_remoteReports_aggregateReports_nonIntersectingScreenTimeIntervals_intersectingScreenTimeIntervals_longestSessionByDevice_applicationUsageIntervals_unboundApplicationUsageIntervals_webUsageIntervalsByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByBundleIdentifier_categoryByWebDomain_notificationsByDevice_interval_timeZoneByDevice_lastEventDateByDevice___block_invoke;
    v86[3] = &unk_24C7DAF50;
    v38 = v25;
    v87 = v38;
    v39 = v28;
    v88 = v39;
    v89 = v82;
    v40 = v29;
    v90 = v40;
    v41 = v70;
    v91 = v41;
    v42 = v69;
    v92 = v42;
    v43 = v68;
    v93 = v43;
    v94 = v74;
    v44 = v73;
    v95 = v44;
    v45 = v80;
    v96 = v45;
    v97 = self;
    v105 = &v114;
    v106 = &v108;
    v66 = v37;
    v98 = v66;
    v46 = v78;
    v99 = v46;
    v107 = a2;
    v62 = v67;
    v100 = v62;
    v61 = v81;
    v101 = v61;
    v60 = v79;
    v102 = v60;
    v103 = v83;
    v104 = v85;
    objc_msgSend(v84, "enumerateKeysAndObjectsUsingBlock:", v86);
    objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)v53;
    v55 = (void *)MEMORY[0x24BDBD1B8];
    if (v53)
      v55 = (void *)v53;
    v56 = v55;

    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v57)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("USUsageQuerying.m"), 349, CFSTR("lastEventDate for a USUsageReport must not be nil"));

    }
    v58 = (void *)objc_msgSend((id)objc_opt_class(), "_newReportWithNonIntersectingScreenTimeIntervals:pickupsByBundleIdentifier:pickupsWithoutApplicationUsage:firstPickup:longestSession:applicationUsageIntervals:webUsageIntervals:categoryUsageIntervals:aggregatedApplicationUsageIntervals:aggregatedWebUsageIntervals:categoryByBundleIdentifier:categoryByWebDomain:notifications:interval:timeZone:lastEventDate:", v65, v66, v115[3], v109[5], v52, v64, v48, v49, v50, v51, v62, v61, v56, v60,
                    v47,
                    v57);
    objc_msgSend(v77, "addObject:", v58);

    _Block_object_dispose(&v108, 8);
    _Block_object_dispose(&v114, 8);
    v36 = v85;
    v26 = v74;
    v25 = v75;
    v28 = v72;
    v27 = v73;
    v30 = v70;
    v29 = v71;
    v32 = v68;
    v31 = v69;
    v33 = v67;
  }

}

void __473__USUsageQuerying__updateLocalReports_remoteReports_aggregateReports_nonIntersectingScreenTimeIntervals_intersectingScreenTimeIntervals_longestSessionByDevice_applicationUsageIntervals_unboundApplicationUsageIntervals_webUsageIntervalsByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByBundleIdentifier_categoryByWebDomain_notificationsByDevice_interval_timeZoneByDevice_lastEventDateByDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
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
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t v45;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AllDevices")) & 1) != 0)
    goto LABEL_17;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", v5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", v5);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 96), "objectForKeyedSubscript:", v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 104), "objectForKeyedSubscript:", v5);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x24BDBD1B8];
  if (v12)
    v14 = (void *)v12;
  v15 = v14;

  v45 = 0;
  v44 = 0;
  v35 = (void *)v8;
  v36 = (void *)v11;
  objc_msgSend((id)objc_opt_class(), "_generatePickupsByBundleIdentifierWithPickupIntervals:applicationUsageIntervals:pickupsWithoutApplicationUsage:firstPickup:", v11, v8, &v45, &v44);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v44;
  v18 = v44;
  v19 = v18;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24) += v45;
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 8);
  if (!*(_QWORD *)(v20 + 40))
    goto LABEL_7;
  if (objc_msgSend(v18, "compare:") == -1)
  {
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 8);
LABEL_7:
    objc_storeStrong((id *)(v20 + 40), v17);
  }
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __473__USUsageQuerying__updateLocalReports_remoteReports_aggregateReports_nonIntersectingScreenTimeIntervals_intersectingScreenTimeIntervals_longestSessionByDevice_applicationUsageIntervals_unboundApplicationUsageIntervals_webUsageIntervalsByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByBundleIdentifier_categoryByWebDomain_notificationsByDevice_interval_timeZoneByDevice_lastEventDateByDevice___block_invoke_2;
  v42[3] = &unk_24C7DAF28;
  v43 = *(id *)(a1 + 120);
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v42);
  objc_msgSend(*(id *)(a1 + 128), "objectForKeyedSubscript:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v6;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = v10;
    v30 = v9;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 192), *(_QWORD *)(a1 + 112), CFSTR("USUsageQuerying.m"), 323, CFSTR("lastEventDate for a USUsageReport must not be nil"));

    v9 = v30;
    v10 = v29;
    v6 = v37;
  }
  v33 = v6;
  v22 = (void *)v10;
  v32 = v10;
  v23 = (void *)v9;
  v24 = (void *)objc_msgSend((id)objc_opt_class(), "_newReportWithNonIntersectingScreenTimeIntervals:pickupsByBundleIdentifier:pickupsWithoutApplicationUsage:firstPickup:longestSession:applicationUsageIntervals:webUsageIntervals:categoryUsageIntervals:aggregatedApplicationUsageIntervals:aggregatedWebUsageIntervals:categoryByBundleIdentifier:categoryByWebDomain:notifications:interval:timeZone:lastEventDate:", v41, v16, v45, v19, v38, v7, v9, v32, v40, v39, *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), v15, *(_QWORD *)(a1 + 152),
                  v33,
                  v21);

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("LocalDevice")))
  {
    objc_msgSend(*(id *)(a1 + 160), "addObject:", v24);
    v25 = v35;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 168), "objectForKeyedSubscript:", v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "addObject:", v24);
    }
    else
    {
      v34 = v7;
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v24, 0);
      objc_msgSend(*(id *)(a1 + 168), "setObject:forKeyedSubscript:", v28, v5);

      v7 = v34;
    }
    v25 = v35;

  }
  v6 = v37;
LABEL_17:

}

void __473__USUsageQuerying__updateLocalReports_remoteReports_aggregateReports_nonIntersectingScreenTimeIntervals_intersectingScreenTimeIntervals_longestSessionByDevice_applicationUsageIntervals_unboundApplicationUsageIntervals_webUsageIntervalsByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByBundleIdentifier_categoryByWebDomain_notificationsByDevice_interval_timeZoneByDevice_lastEventDateByDevice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend(v12, "unsignedIntegerValue");
  v10 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v8, "numberWithUnsignedInteger:", v10 + v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v7);

}

+ (id)_generatePickupsByBundleIdentifierWithPickupIntervals:(id)a3 applicationUsageIntervals:(id)a4 pickupsWithoutApplicationUsage:(unint64_t *)a5 firstPickup:(id *)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id *v24;
  unint64_t v26;
  id v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v24 = a6;
  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v27 = a4;
  v29 = (id)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v7;
  v8 = 0;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v47, 16);
  if (v9)
  {
    v26 = 0;
    v10 = *(_QWORD *)v31;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v12, "duration", v24);
        v14 = v13;
        if (v13 >= 5.0)
        {
          v15 = v27;
          v16 = v12;
          v41 = 0;
          v42 = &v41;
          v43 = 0x3032000000;
          v44 = __Block_byref_object_copy__0;
          v45 = __Block_byref_object_dispose__0;
          v46 = 0;
          v39[0] = 0;
          v39[1] = v39;
          v39[2] = 0x3032000000;
          v39[3] = __Block_byref_object_copy__0;
          v39[4] = __Block_byref_object_dispose__0;
          v40 = 0;
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __USTrustIdentifierKeyedNonIntersectingIntervalsGetKeyOfEarliestIntersectionWithThreshold_block_invoke;
          v34[3] = &unk_24C7DB3D8;
          v17 = v16;
          v35 = v17;
          v36 = v39;
          v37 = &v41;
          v38 = 0x4014000000000000;
          objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v34);
          v18 = (id)v42[5];

          _Block_object_dispose(v39, 8);
          _Block_object_dispose(&v41, 8);

          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v29, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v20, "unsignedIntegerValue") + 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v21, v19);

            if (!v8)
              goto LABEL_9;
          }
          else if (v14 >= 9.0)
          {
            ++v26;
            if (!v8)
            {
LABEL_9:
              objc_msgSend(v17, "startDate");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }

          continue;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v47, 16);
      if (!v9)
        goto LABEL_17;
    }
  }
  v26 = 0;
LABEL_17:

  *a5 = v26;
  v22 = objc_retainAutorelease(v8);
  *v24 = v22;

  return v29;
}

+ (id)_newReportWithNonIntersectingScreenTimeIntervals:(id)a3 pickupsByBundleIdentifier:(id)a4 pickupsWithoutApplicationUsage:(unint64_t)a5 firstPickup:(id)a6 longestSession:(id)a7 applicationUsageIntervals:(id)a8 webUsageIntervals:(id)a9 categoryUsageIntervals:(id)a10 aggregatedApplicationUsageIntervals:(id)a11 aggregatedWebUsageIntervals:(id)a12 categoryByBundleIdentifier:(id)a13 categoryByWebDomain:(id)a14 notifications:(id)a15 interval:(id)a16 timeZone:(id)a17 lastEventDate:(id)a18
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t i;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  double v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  USUsageReport *v55;
  id v57;
  id v58;
  void *v59;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  id v89;
  __int128 *v90;
  _QWORD v91[4];
  id v92;
  id v93;
  uint64_t *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  double v100;
  __int16 v101;
  double v102;
  uint64_t v103;
  double *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v61 = a4;
  v63 = a6;
  v64 = a7;
  v69 = a8;
  v68 = a9;
  v70 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  v71 = a15;
  v65 = a16;
  v66 = a17;
  v67 = a18;
  v59 = v22;
  if (v22)
  {
    v27 = v22;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v95, &v103, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v96;
      v30 = 0.0;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v96 != v29)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "duration");
          v30 = v30 + v32;
        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v95, &v103, 16);
      }
      while (v28);
    }
    else
    {
      v30 = 0.0;
    }

    v33 = v23;
  }
  else
  {
    v33 = v23;
    v30 = 0.0;
  }
  v103 = 0;
  v104 = (double *)&v103;
  v105 = 0x2020000000;
  v106 = 0;
  v34 = (void *)objc_opt_new();
  v35 = MEMORY[0x24BDAC760];
  v91[0] = MEMORY[0x24BDAC760];
  v91[1] = 3221225472;
  v91[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke;
  v91[3] = &unk_24C7DAF78;
  v94 = &v103;
  v36 = v25;
  v92 = v36;
  v37 = v34;
  v93 = v37;
  objc_msgSend(v69, "enumerateKeysAndObjectsUsingBlock:", v91);
  v62 = v24;
  *(_QWORD *)&v95 = 0;
  *((_QWORD *)&v95 + 1) = &v95;
  v96 = 0x2020000000uLL;
  v38 = (void *)objc_opt_new();
  v39 = (void *)objc_opt_new();
  v86[0] = v35;
  v86[1] = 3221225472;
  v86[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_2;
  v86[3] = &unk_24C7DAFA0;
  v90 = &v95;
  v58 = v26;
  v87 = v58;
  v40 = v38;
  v88 = v40;
  v41 = v39;
  v89 = v41;
  objc_msgSend(v68, "enumerateKeysAndObjectsUsingBlock:", v86);
  if (v104[3] >= *(double *)(*((_QWORD *)&v95 + 1) + 24))
    v42 = v104[3];
  else
    v42 = *(double *)(*((_QWORD *)&v95 + 1) + 24);
  if (v30 >= v42)
  {
    v42 = v30;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v100 = v30;
    v101 = 2048;
    v102 = v42;
    _os_log_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Adjusting total Screen Time usage (%f) to be at least as long as the max application or web usage (%f)", buf, 0x16u);
  }
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v71, "count"));
  v83[0] = v35;
  v83[1] = 3221225472;
  v83[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_44;
  v83[3] = &unk_24C7DAFC8;
  v57 = v36;
  v84 = v57;
  v44 = v43;
  v85 = v44;
  objc_msgSend(v71, "enumerateKeysAndObjectsUsingBlock:", v83);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v70, "count"));
  v74[0] = v35;
  v74[1] = 3221225472;
  v74[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_2_46;
  v74[3] = &unk_24C7DB090;
  v46 = v40;
  v75 = v46;
  v47 = v44;
  v76 = v47;
  v48 = v37;
  v77 = v48;
  v49 = v33;
  v78 = v49;
  v50 = v61;
  v79 = v50;
  v51 = v41;
  v80 = v51;
  v52 = v62;
  v81 = v52;
  v53 = v45;
  v82 = v53;
  objc_msgSend(v70, "enumerateKeysAndObjectsUsingBlock:", v74);
  v72[0] = v35;
  v72[1] = 3221225472;
  v72[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_7;
  v72[3] = &unk_24C7DB0B8;
  v54 = v53;
  v73 = v54;
  objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v72);
  v55 = -[USUsageReport initWithScreenTime:longestSession:categoryUsage:pickupsWithoutApplicationUsage:firstPickup:interval:timeZone:lastEventDate:]([USUsageReport alloc], "initWithScreenTime:longestSession:categoryUsage:pickupsWithoutApplicationUsage:firstPickup:interval:timeZone:lastEventDate:", v64, v54, a5, v63, v65, v66, v42, v67);

  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v103, 8);

  return v55;
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "duration");
        v10 = v10 + v12;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v10 > *(double *)(v13 + 24))
    *(double *)(v13 + 24) = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = (void *)*MEMORY[0x24BE157A8];
  if (v17)
    v19 = (void *)v17;
  v20 = v19;

  objc_msgSend(v16, "canonicalBundleIdentifier");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (void *)v21;
  else
    v23 = v15;
  v24 = v23;

  +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v24, objc_msgSend(v5, "trusted"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = v27;
    v29 = v14;
    v30 = v5;
  }
  else
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v14, v5, 0);
    if (v26)
    {
      v27 = v26;
      v29 = v28;
      v30 = v25;
    }
    else
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v28, v25, 0);
      v27 = *(void **)(a1 + 40);
      v29 = v26;
      v30 = v20;
    }
  }
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, v30);

}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "duration");
        v10 = v10 + v12;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (v10 > *(double *)(v13 + 24))
    *(double *)(v13 + 24) = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = (void *)*MEMORY[0x24BE157A8];
  if (v16)
    v18 = (void *)v16;
  v19 = v18;

  objc_msgSend(v15, "canonicalBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v20, objc_msgSend(v5, "trusted"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v33, v5, 0);
      if (!v22)
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v24, v21, 0);
        v25 = *(void **)(a1 + 40);
LABEL_26:
        v31 = v22;
        v32 = v19;
        goto LABEL_27;
      }
      goto LABEL_24;
    }
  }
  else
  {
    objc_msgSend(v15, "primaryWebDomain");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (void *)v26;
    else
      v28 = v14;
    v29 = v28;

    +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v29, objc_msgSend(v5, "trusted"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v33, v5, 0);
      if (!v22)
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v24, v21, 0);
        v25 = *(void **)(a1 + 48);
        goto LABEL_26;
      }
LABEL_24:
      v25 = v22;
      v31 = v24;
      v32 = v21;
LABEL_27:
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, v32);
      v30 = (void *)v33;
      goto LABEL_28;
    }
  }
  v24 = v23;
  v30 = (void *)v33;
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, v5);
LABEL_28:

}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  v22 = a2;
  v5 = a3;
  objc_msgSend(v22, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)*MEMORY[0x24BE157A8];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  objc_msgSend(v7, "canonicalBundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v6;
  v15 = v14;

  +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v15, objc_msgSend(v22, "trusted"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = v18;
    v20 = v5;
    v21 = v22;
  }
  else
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v5, v22, 0);
    if (v17)
    {
      v18 = v17;
      v20 = v19;
      v21 = v16;
    }
    else
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v19, v16, 0);
      v18 = *(void **)(a1 + 40);
      v20 = v17;
      v21 = v11;
    }
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v21);

}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_2_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  double v27;
  void *v28;
  USCategoryUsageReport *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_3;
  v41[3] = &unk_24C7DAFF0;
  v42 = *(id *)(a1 + 56);
  v12 = v8;
  v43 = v12;
  v13 = v9;
  v44 = v13;
  v45 = *(id *)(a1 + 64);
  v14 = v7;
  v46 = v14;
  v31 = v10;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v41);
  v37[0] = v11;
  v37[1] = 3221225472;
  v37[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_4;
  v37[3] = &unk_24C7DB018;
  v38 = *(id *)(a1 + 56);
  v15 = v13;
  v39 = v15;
  v16 = v14;
  v40 = v16;
  v30 = v12;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v37);
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_5;
  v35[3] = &unk_24C7DB040;
  v17 = v16;
  v36 = v17;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v35);
  v18 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v11;
  v32[1] = 3221225472;
  v32[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_6;
  v32[3] = &unk_24C7DB068;
  v33 = *(id *)(a1 + 80);
  v20 = v18;
  v34 = v20;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v32);
  v21 = v6;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v48;
    v25 = 0.0;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v48 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "duration");
        v25 = v25 + v27;
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v23);
  }
  else
  {
    v25 = 0.0;
  }

  v28 = *(void **)(a1 + 88);
  v29 = -[USCategoryUsageReport initWithCategoryIdentifier:totalUsageTime:applicationUsage:webUsage:]([USCategoryUsageReport alloc], "initWithCategoryIdentifier:totalUsageTime:applicationUsage:webUsage:", v5, v17, v20, v25);
  objc_msgSend(v28, "addObject:", v29);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", 0, v5);
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  objc_class *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  objc_class *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  objc_class *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  USApplicationUsageReport *v46;
  void *v47;
  USApplicationUsageReport *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, void *, void *);
  void *v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, &v62, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v58;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v58 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "duration");
        v11 = v11 + v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, &v62, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = (void *)MEMORY[0x24BDBD1B8];
  if (v14)
    v17 = (void *)v14;
  else
    v17 = (void *)MEMORY[0x24BDBD1B8];
  v18 = v17;

  v52 = v5;
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (void *)v19;
  else
    v21 = v16;
  v51 = v21;

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v23 = v6;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v54 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v25);
  }

  v30 = (objc_class *)MEMORY[0x24BDBCED8];
  v31 = v23;
  v32 = (void *)objc_msgSend([v30 alloc], "initWithCapacity:", objc_msgSend(v31, "count"));
  v33 = MEMORY[0x24BDAC760];
  v62 = MEMORY[0x24BDAC760];
  v63 = 3221225472;
  v64 = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  v65 = &unk_24C7DB478;
  v66 = v32;
  v34 = v32;
  v50 = v31;
  objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", &v62);

  v49 = (void *)objc_msgSend(v34, "copy");
  v35 = (objc_class *)MEMORY[0x24BDBCED8];
  v36 = v18;
  v37 = (void *)objc_msgSend([v35 alloc], "initWithCapacity:", objc_msgSend(v36, "count"));
  v62 = v33;
  v63 = 3221225472;
  v64 = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  v65 = &unk_24C7DB478;
  v66 = v37;
  v38 = v37;
  objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", &v62);

  v39 = (void *)objc_msgSend(v38, "copy");
  v40 = (objc_class *)MEMORY[0x24BDBCED8];
  v41 = v51;
  v42 = (void *)objc_msgSend([v40 alloc], "initWithCapacity:", objc_msgSend(v41, "count"));
  v62 = v33;
  v63 = 3221225472;
  v64 = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  v65 = &unk_24C7DB478;
  v66 = v42;
  v43 = v42;
  objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", &v62);

  v44 = (void *)objc_msgSend(v43, "copy");
  v45 = *(void **)(a1 + 64);
  v46 = [USApplicationUsageReport alloc];
  objc_msgSend(v52, "identifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[USApplicationUsageReport initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](v46, "initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", v47, objc_msgSend(v52, "trusted"), v49, v39, v44, v22, v11);
  objc_msgSend(v45, "addObject:", v48);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", 0, v52);
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", 0, v52);

}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  objc_class *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  objc_class *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  USApplicationUsageReport *v30;
  void *v31;
  uint64_t v32;
  USApplicationUsageReport *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *, void *);
  void *v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, &v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "duration");
        v11 = v11 + v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, &v38, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = (void *)MEMORY[0x24BDBD1B8];
  if (v14)
    v16 = (void *)v14;
  v17 = v16;

  v18 = (objc_class *)MEMORY[0x24BDBCED8];
  v19 = v6;
  v20 = (void *)objc_msgSend([v18 alloc], "initWithCapacity:", objc_msgSend(v19, "count"));
  v21 = MEMORY[0x24BDAC760];
  v38 = MEMORY[0x24BDAC760];
  v39 = 3221225472;
  v40 = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  v41 = &unk_24C7DB478;
  v42 = v20;
  v22 = v20;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", &v38);

  v23 = (void *)objc_msgSend(v22, "copy");
  v24 = (objc_class *)MEMORY[0x24BDBCED8];
  v25 = v17;
  v26 = (void *)objc_msgSend([v24 alloc], "initWithCapacity:", objc_msgSend(v25, "count"));
  v38 = v21;
  v39 = 3221225472;
  v40 = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  v41 = &unk_24C7DB478;
  v42 = v26;
  v27 = v26;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", &v38);

  v28 = (void *)objc_msgSend(v27, "copy");
  v29 = *(void **)(a1 + 48);
  v30 = [USApplicationUsageReport alloc];
  objc_msgSend(v5, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v5, "trusted");
  v33 = -[USApplicationUsageReport initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](v30, "initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", v31, v32, MEMORY[0x24BDBD1B8], v23, v28, MEMORY[0x24BDBD1B8], v11);
  objc_msgSend(v29, "addObject:", v33);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", 0, v5);
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  USApplicationUsageReport *v11;
  void *v12;
  uint64_t v13;
  USApplicationUsageReport *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v15 = a3;
  v5 = (objc_class *)MEMORY[0x24BDBCED8];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v15, "count"));
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  v16[3] = &unk_24C7DB478;
  v17 = v7;
  v8 = v7;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v16);
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = *(void **)(a1 + 32);
  v11 = [USApplicationUsageReport alloc];
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "trusted");

  v14 = -[USApplicationUsageReport initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](v11, "initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", v12, v13, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], v9, MEMORY[0x24BDBD1B8], 0.0);
  objc_msgSend(v10, "addObject:", v14);

}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  objc_class *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  USWebUsageReport *v20;
  void *v21;
  USWebUsageReport *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "duration");
        v11 = v11 + v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  v14 = (objc_class *)MEMORY[0x24BDBCED8];
  v15 = v6;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithCapacity:", objc_msgSend(v15, "count"));
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  v27[3] = &unk_24C7DB478;
  v28 = v16;
  v17 = v16;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v27);

  v18 = (void *)objc_msgSend(v17, "copy");
  v19 = *(void **)(a1 + 40);
  v20 = [USWebUsageReport alloc];
  objc_msgSend(v5, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[USWebUsageReport initWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:](v20, "initWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:", v21, objc_msgSend(v5, "trusted"), v18, v11);
  objc_msgSend(v19, "addObject:", v22);

}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  USCategoryUsageReport *v10;
  USCategoryUsageReport *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_8;
  v13[3] = &unk_24C7DB040;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);

  v9 = *(void **)(a1 + 32);
  v10 = [USCategoryUsageReport alloc];
  v11 = -[USCategoryUsageReport initWithCategoryIdentifier:totalUsageTime:applicationUsage:webUsage:](v10, "initWithCategoryIdentifier:totalUsageTime:applicationUsage:webUsage:", v7, v12, MEMORY[0x24BDBD1A8], 0.0);

  objc_msgSend(v9, "addObject:", v11);
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  USApplicationUsageReport *v11;
  void *v12;
  USApplicationUsageReport *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v14 = a3;
  v5 = (objc_class *)MEMORY[0x24BDBCED8];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v14, "count"));
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  v15[3] = &unk_24C7DB478;
  v16 = v7;
  v8 = v7;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v15);
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = *(void **)(a1 + 32);
  v11 = [USApplicationUsageReport alloc];
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[USApplicationUsageReport initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](v11, "initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", v12, 1, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], v9, MEMORY[0x24BDBD1B8], 0.0);
  objc_msgSend(v10, "addObject:", v13);

}

- (id)queryForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 error:(id *)a7
{
  return -[USUsageQuerying queryForApplications:webDomains:categories:interval:focalOnly:error:](self, "queryForApplications:webDomains:categories:interval:focalOnly:error:", a3, a4, a5, a6, 1, a7);
}

- (id)queryForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 segmentInterval:(double)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  void *v21;
  double v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;

  v33 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  objc_msgSend(v16, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "duration");
  if (v19 <= a7)
  {
    v20 = v17;
  }
  else
  {
    objc_msgSend(v18, "dateByAddingTimeInterval:", a7);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;
  v22 = 0.0;
  v32 = v16;
  if (objc_msgSend(v18, "compare:", v17) == -1)
  {
    while (1)
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v18, v21, v32);
      -[USUsageQuerying queryForApplications:webDomains:categories:interval:focalOnly:error:](self, "queryForApplications:webDomains:categories:interval:focalOnly:error:", v33, v14, v15, v29, 1, a8);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v30;
      if (!v30)
        break;
      objc_msgSend(v30, "doubleValue");
      v26 = v25;
      v23 = v21;

      objc_msgSend(v17, "timeIntervalSinceDate:", v23);
      if (v27 <= a7)
      {
        v28 = v17;
      }
      else
      {
        objc_msgSend(v23, "dateByAddingTimeInterval:", a7);
        v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = v28;
      v22 = v22 + v26;

      v18 = v23;
      if (objc_msgSend(v23, "compare:", v17) != -1)
        goto LABEL_6;
    }

  }
  else
  {
    v23 = v18;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22, v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v23;
  }

  return v24;
}

- (id)queryForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 focalOnly:(BOOL)a7 error:(id *)a8
{
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void **v22;
  id v23;
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
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void **v42;
  void **v43;
  id *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void **v68;
  id v69;
  void *v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void **v94;
  id *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  void *v111;
  id *v112;
  void *v113;
  id v114;
  id v115;
  id v117;
  void *v118;
  void **v119;
  void **v120;
  void *v121;
  void *v122;
  void *v123;
  _BOOL4 v124;
  USUsageQuerying *v125;
  id v126;
  _QWORD v127[5];
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id *v134;
  void **v135;
  uint64_t v136;
  BOOL v137;
  _QWORD v138[4];
  id v139;
  void **v140;
  uint64_t v141;
  _QWORD v142[3];
  void *v143;
  void **v144;
  uint64_t v145;
  uint64_t (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  id v148;
  void **v149;
  id *v150;
  uint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t);
  void (*v153)(uint64_t);
  id v154;
  void *v155;
  void *v156;
  _QWORD v157[3];

  v124 = a7;
  v157[1] = *MEMORY[0x24BDAC8D0];
  v114 = a3;
  v115 = a4;
  v117 = a5;
  v12 = a6;
  v113 = (void *)objc_opt_new();
  v125 = self;
  -[USUsageQuerying duetStream](self, "duetStream");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BE1B0F8];
  v14 = v12;
  objc_msgSend(v14, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateForEventsIntersectingDateRangeFrom:to:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B078], "usageType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andIntegerValue:", v18, 1);
  v120 = (void **)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:", v18);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "notPredicateWithSubpredicate:", v122);
  v19 = (id *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDD14C0];
  v149 = v120;
  v150 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v149, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "orPredicateWithSubpredicates:", v21);
  v22 = (void **)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x24BDD14C0]);
  v143 = v17;
  v144 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v143, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithType:subpredicates:", 1, v24);

  v26 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B088], "allDevices");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDeviceIDs:", v27);

  objc_msgSend(MEMORY[0x24BE1B130], "appUsageStream");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v157[0] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v157, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEventStreams:", v29);

  if (v124)
    v30 = v25;
  else
    v30 = v17;
  objc_msgSend(v26, "setPredicate:", v30);
  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v31;
  objc_msgSend(MEMORY[0x24BE1B0F8], "endDateSortDescriptorAscending:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v155, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setSortDescriptors:", v33);
  objc_msgSend(v118, "publisherForQuery:", v26);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "collect");
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  -[USUsageQuerying duetStream](v125, "duetStream");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v14;
  v37 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(v36, "startDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "endDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "predicateForEventsIntersectingDateRangeFrom:to:", v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B078], "usageType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andIntegerValue:", v41, 1);
  v42 = (void **)(id)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (!v124)
  {
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andIntegerValue:", v41, 0);
    v44 = (id *)objc_claimAutoreleasedReturnValue();
    v45 = objc_alloc(MEMORY[0x24BDD14C0]);
    v149 = v42;
    v150 = v44;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v149, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void **)objc_msgSend(v45, "initWithType:subpredicates:", 2, v46);

  }
  v47 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B088], "allDevices");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setDeviceIDs:", v48);

  objc_msgSend(MEMORY[0x24BE1B130], "appWebUsageStream");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v157[0] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v157, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setEventStreams:", v50);

  v51 = objc_alloc(MEMORY[0x24BDD14C0]);
  v143 = v40;
  v144 = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v143, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v51, "initWithType:subpredicates:", 1, v52);
  objc_msgSend(v47, "setPredicate:", v53);

  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v54;
  objc_msgSend(MEMORY[0x24BE1B0F8], "endDateSortDescriptorAscending:", 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v55;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v155, 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setSortDescriptors:", v56);

  objc_msgSend(v35, "publisherForQuery:", v47);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v57, "collect");
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v117, "containsObject:", *MEMORY[0x24BE15790]) & 1) != 0)
  {
    -[USUsageQuerying duetStream](v125, "duetStream");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)MEMORY[0x24BE1B0F8];
    v60 = v36;
    objc_msgSend(v60, "startDate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "endDate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "predicateForEventsIntersectingDateRangeFrom:to:", v61, v62);
    v119 = (void **)objc_claimAutoreleasedReturnValue();

    v63 = (void *)MEMORY[0x24BE1B0F8];
    objc_msgSend(MEMORY[0x24BE1B0D8], "playing");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "predicateForObjectsWithMetadataKey:andIntegerValue:", v64, 1);
    v112 = (id *)objc_claimAutoreleasedReturnValue();

    v65 = (void *)MEMORY[0x24BE1B0F8];
    objc_msgSend(MEMORY[0x24BE1B0D8], "mediaType");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "predicateForObjectsWithMetadataKey:andStringValue:", v66, *MEMORY[0x24BE65880]);
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", CFSTR("com.apple.quicklook.QuickLookUIService"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", CFSTR("com.apple.quicklook.extension.previewUI"));
    v68 = (void **)objc_claimAutoreleasedReturnValue();
    v69 = objc_alloc(MEMORY[0x24BDD14C0]);
    v143 = v67;
    v144 = v68;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v143, 2);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v69, "initWithType:subpredicates:", 2, v70);

    v72 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE1B088], "allDevices");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setDeviceIDs:", v73);

    objc_msgSend(MEMORY[0x24BE1B130], "nowPlayingStream");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v157[0] = v74;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v157, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setEventStreams:", v75);

    v76 = objc_alloc(MEMORY[0x24BDD14C0]);
    v149 = v119;
    v150 = v112;
    v151 = (uint64_t)v111;
    v152 = v71;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v149, 4);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)objc_msgSend(v76, "initWithType:subpredicates:", 1, v77);
    objc_msgSend(v72, "setPredicate:", v78);

    objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = v79;
    objc_msgSend(MEMORY[0x24BE1B0F8], "endDateSortDescriptorAscending:", 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v80;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v155, 2);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v72, "setSortDescriptors:", v81);
    objc_msgSend(v58, "publisherForQuery:", v72);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v82, "collect");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBD1A8], "bpsPublisher");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "collect");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[USUsageQuerying duetStream](v125, "duetStream");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v36;
  v86 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B088], "allDevices");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setDeviceIDs:", v87);

  objc_msgSend(MEMORY[0x24BE1B130], "appMediaUsageStream");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v88;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v143, 1);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setEventStreams:", v89);

  v90 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(v85, "startDate");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "endDate");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "predicateForEventsIntersectingDateRangeFrom:to:", v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setPredicate:", v93);

  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 1);
  v94 = (void **)objc_claimAutoreleasedReturnValue();
  v149 = v94;
  objc_msgSend(MEMORY[0x24BE1B0F8], "endDateSortDescriptorAscending:", 1);
  v95 = (id *)objc_claimAutoreleasedReturnValue();
  v150 = v95;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v149, 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v86, "setSortDescriptors:", v96);
  objc_msgSend(v84, "publisherForQuery:", v86);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v97, "collect");
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  v149 = 0;
  v150 = (id *)&v149;
  v151 = 0x3032000000;
  v152 = __Block_byref_object_copy__0;
  v153 = __Block_byref_object_dispose__0;
  v154 = 0;
  v143 = 0;
  v144 = &v143;
  v145 = 0x3032000000;
  v146 = __Block_byref_object_copy__0;
  v147 = __Block_byref_object_dispose__0;
  v148 = 0;
  v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
  v142[0] = v121;
  v142[1] = v83;
  v142[2] = v98;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v142, 3);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "zipWithOthers:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = MEMORY[0x24BDAC760];
  v138[0] = MEMORY[0x24BDAC760];
  v138[1] = 3221225472;
  v138[2] = __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke;
  v138[3] = &unk_24C7DB0E0;
  v139 = v99;
  v140 = &v143;
  v141 = 1;
  v127[0] = v102;
  v127[1] = 3221225472;
  v127[2] = __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_2;
  v127[3] = &unk_24C7DB158;
  v127[4] = v125;
  v103 = v85;
  v128 = v103;
  v104 = v113;
  v129 = v104;
  v137 = v124;
  v126 = v114;
  v130 = v126;
  v105 = v139;
  v131 = v105;
  v136 = 1;
  v106 = v115;
  v132 = v106;
  v107 = v117;
  v133 = v107;
  v134 = (id *)&v149;
  v135 = &v143;
  v108 = (id)objc_msgSend(v101, "sinkWithCompletion:receiveInput:", v138, v127);

  objc_msgSend(v105, "lockWhenCondition:", 1);
  objc_msgSend(v105, "unlock");
  if (a8)
    *a8 = objc_retainAutorelease(v144[5]);
  v109 = v150[5];

  _Block_object_dispose(&v143, 8);
  _Block_object_dispose(&v149, 8);

  return v109;
}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "state") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "lock");
    objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v6, "error");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v3 = a2;
  if (objc_msgSend(v3, "count") != 4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[USUsageQuerying queryForApplications:webDomains:categories:interval:focalOnly:error:]_block_invoke_2");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("USUsageQuerying.m"), 665, CFSTR("Expecting event types count to be 4"));

  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_getBundleIdentiersFromApplicationUsageEvents:videoUsageEvents:interval:referenceDate:focalOnly:", v4, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 112));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "unionSet:", *(_QWORD *)(a1 + 56));
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_2_cold_1();
    objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__0;
    v44 = __Block_byref_object_dispose__0;
    v45 = 0;
    objc_msgSend(v8, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_57;
    v23[3] = &unk_24C7DB130;
    v36 = &v40;
    v11 = *(id *)(a1 + 64);
    v38 = *(_QWORD *)(a1 + 104);
    v12 = *(_QWORD *)(a1 + 32);
    v24 = v11;
    v25 = v12;
    v26 = v5;
    v27 = v7;
    v28 = *(id *)(a1 + 40);
    v29 = *(id *)(a1 + 48);
    v39 = *(_BYTE *)(a1 + 112);
    v30 = *(id *)(a1 + 72);
    v13 = v9;
    v31 = v13;
    v32 = *(id *)(a1 + 56);
    v33 = *(id *)(a1 + 80);
    v34 = v4;
    v14 = v6;
    v15 = *(_QWORD *)(a1 + 88);
    v35 = v14;
    v37 = v15;
    objc_msgSend(v13, "categoriesForBundleIDs:completionHandler:", v10, v23);

    v16 = (void *)v41[5];
    if (v16)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v16);

    _Block_object_dispose(&v40, 8);
  }
  else
  {
    LOBYTE(v22) = *(_BYTE *)(a1 + 112);
    objc_msgSend(*(id *)(a1 + 32), "_computeUsageForApplications:webDomains:categories:applicationUsageEvents:webUsageEvents:nowPlayingEvents:videoUsageEvents:categoryByBundleIdentifier:categoryByWebDomain:interval:referenceDate:focalOnly:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v4, v5, v6, v7, 0, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v22);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    objc_msgSend(*(id *)(a1 + 64), "lock");
    objc_msgSend(*(id *)(a1 + 64), "unlockWithCondition:", *(_QWORD *)(a1 + 104));
  }

}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_getWebDomainsFromWebUsageEvents:videoUsageEvents:interval:referenceDate:focalOnly:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 152));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", *(_QWORD *)(a1 + 80));
    if (objc_msgSend(v7, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_57_cold_1();
      v8 = *(void **)(a1 + 88);
      objc_msgSend(v7, "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_58;
      v19[3] = &unk_24C7DB108;
      v10 = *(_QWORD *)(a1 + 40);
      v31 = *(_QWORD *)(a1 + 128);
      v19[4] = v10;
      v20 = *(id *)(a1 + 96);
      v21 = *(id *)(a1 + 80);
      v22 = *(id *)(a1 + 104);
      v23 = *(id *)(a1 + 112);
      v24 = *(id *)(a1 + 48);
      v25 = *(id *)(a1 + 120);
      v26 = *(id *)(a1 + 56);
      v27 = v5;
      v28 = *(id *)(a1 + 64);
      v11 = *(id *)(a1 + 72);
      v34 = *(_BYTE *)(a1 + 152);
      v12 = *(_QWORD *)(a1 + 136);
      v29 = v11;
      v32 = v12;
      v13 = *(id *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 144);
      v30 = v13;
      v33 = v14;
      objc_msgSend(v8, "categoriesForDomainNames:completionHandler:", v9, v19);

    }
    else
    {
      LOBYTE(v18) = *(_BYTE *)(a1 + 152);
      objc_msgSend(*(id *)(a1 + 40), "_computeUsageForApplications:webDomains:categories:applicationUsageEvents:webUsageEvents:nowPlayingEvents:videoUsageEvents:categoryByBundleIdentifier:categoryByWebDomain:interval:referenceDate:focalOnly:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 56), v5, 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v18);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      objc_msgSend(*(id *)(a1 + 32), "lock");
      objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", *(_QWORD *)(a1 + 144));
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), a3);
    objc_msgSend(*(id *)(a1 + 32), "lock");
    objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", *(_QWORD *)(a1 + 144));
  }

}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_58(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  v12 = v5;
  if (a2)
  {
    LOBYTE(v11) = *(_BYTE *)(a1 + 152);
    objc_msgSend(*(id *)(a1 + 32), "_computeUsageForApplications:webDomains:categories:applicationUsageEvents:webUsageEvents:nowPlayingEvents:videoUsageEvents:categoryByBundleIdentifier:categoryByWebDomain:interval:referenceDate:focalOnly:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), a2, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), v11);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
    v10 = v5;
    v8 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

  objc_msgSend(*(id *)(a1 + 120), "lock");
  objc_msgSend(*(id *)(a1 + 120), "unlockWithCondition:", *(_QWORD *)(a1 + 144));

}

- (double)_computeUsageForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 applicationUsageEvents:(id)a6 webUsageEvents:(id)a7 nowPlayingEvents:(id)a8 videoUsageEvents:(id)a9 categoryByBundleIdentifier:(id)a10 categoryByWebDomain:(id)a11 interval:(id)a12 referenceDate:(id)a13 focalOnly:(BOOL)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v46;
  id v48;

  v18 = a3;
  v19 = a4;
  v48 = a6;
  v43 = a13;
  v39 = a12;
  v20 = a11;
  v21 = a10;
  v22 = a9;
  v40 = a8;
  v23 = a7;
  v42 = a5;
  v24 = objc_msgSend(v42, "count");
  v46 = v19;
  v25 = objc_msgSend(v19, "count");
  v26 = (objc_msgSend(v18, "count") | v25) != 0;
  v44 = v20;
  if (v24)
    v27 = (void *)objc_opt_new();
  else
    v27 = 0;
  if (v26)
  {
    v28 = (void *)objc_opt_new();
    if (v25)
      v38 = (void *)objc_opt_new();
    else
      v38 = 0;
  }
  else
  {
    v38 = 0;
    v28 = 0;
  }
  v29 = (void *)objc_msgSend(v48, "mutableCopy");
  v30 = (void *)objc_msgSend(v23, "mutableCopy");

  v37 = (void *)objc_msgSend(v40, "mutableCopy");
  objc_msgSend(v29, "addObjectsFromArray:", v22);
  objc_msgSend(v30, "addObjectsFromArray:", v22);

  LOBYTE(v35) = a14;
  -[USUsageQuerying _computeApplicationUsageWithEvents:unboundApplicationUsageIntervalsByDevice:timeZoneByDevice:lastEventDateByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:categoryByBundleIdentifier:partition:referenceDate:focalOnly:](self, "_computeApplicationUsageWithEvents:unboundApplicationUsageIntervalsByDevice:timeZoneByDevice:lastEventDateByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:categoryByBundleIdentifier:partition:referenceDate:focalOnly:", v29, 0, 0, 0, v27, v28, v21, v39, v43, v35);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v36) = a14;
  -[USUsageQuerying _computeWebUsageWithEvents:timeZoneByDevice:lastEventDateByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByWebDomain:partition:referenceDate:focalOnly:](self, "_computeWebUsageWithEvents:timeZoneByDevice:lastEventDateByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByWebDomain:partition:referenceDate:focalOnly:", v30, 0, 0, v27, v28, v38, v20, v39, v43, v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageQuerying _computeNowPlayingUsageWithEvents:categoryUsageIntervalsByDevice:timeZoneByDevice:lastEventDateByDevice:partition:referenceDate:](self, "_computeNowPlayingUsageWithEvents:categoryUsageIntervalsByDevice:timeZoneByDevice:lastEventDateByDevice:partition:referenceDate:", v37, v27, 0, 0, v39, v43);

  -[USUsageQuerying _generateUsageTimeWithApplicationUsageIntervals:webUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByBundleIdentifier:categoryByWebDomain:applications:webDomains:categories:](self, "_generateUsageTimeWithApplicationUsageIntervals:webUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByBundleIdentifier:categoryByWebDomain:applications:webDomains:categories:", v41, v31, v27, v28, v38, v21, v44, v18, v46, v42);
  v33 = v32;

  return v33;
}

- (double)_generateUsageTimeWithApplicationUsageIntervals:(id)a3 webUsageIntervalsByDevice:(id)a4 categoryUsageIntervalsByDevice:(id)a5 aggregatedApplicationUsageIntervalsByDevice:(id)a6 aggregatedWebUsageIntervalsByDevice:(id)a7 categoryByBundleIdentifier:(id)a8 categoryByWebDomain:(id)a9 applications:(id)a10 webDomains:(id)a11 categories:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t k;
  void *v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t m;
  void *v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t n;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  uint64_t ii;
  double v112;
  void *v114;
  void *v115;
  id v118;
  void *v119;
  id v120;
  id v121;
  id v122;
  id v123;
  void *v124;
  void *v125;
  id obj;
  void *v127;
  id v128;
  uint64_t v129;
  id v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  id v134;
  id v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  id v142;
  void *v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  uint64_t v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  uint64_t v179;
  uint64_t v180;
  void (*v181)(uint64_t, void *, void *);
  void *v182;
  id v183;
  id v184;
  uint64_t v185;

  v185 = *MEMORY[0x24BDAC8D0];
  v118 = a3;
  v122 = a4;
  v120 = a5;
  v17 = a6;
  v121 = a7;
  v128 = a8;
  v130 = a9;
  v18 = a10;
  v19 = a11;
  v123 = a12;
  v147 = (void *)objc_opt_new();
  v119 = v18;
  v143 = v17;
  if (objc_msgSend(v18, "count"))
  {
    v168 = 0u;
    v169 = 0u;
    v166 = 0u;
    v167 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v166, v178, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v167;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v167 != v24)
            objc_enumerationMutation(v20);
          objc_msgSend(v128, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v166 + 1) + 8 * i));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "equivalentBundleIdentifiers");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v27, "count") >= 2)
          {
            if (!v23)
              v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithSet:", v20);
            objc_msgSend(v23, "addObjectsFromArray:", v27);
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v166, v178, 16);
      }
      while (v22);
    }
    else
    {
      v23 = 0;
    }

    if (!v143)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("USUsageQuerying.m"), 801, CFSTR("Somehow had budgeted applications but no aggregated application usage intervals"));

    }
    if (v23)
      v28 = v23;
    else
      v28 = v20;
    v29 = v28;
    v30 = (void *)objc_opt_new();
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    v31 = v29;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v162, v177, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v163;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v163 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * j);
          +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v36, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v37);

          +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v36, 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v38);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v162, v177, 16);
      }
      while (v33);
    }

    v39 = v147;
    v40 = v30;
    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = MEMORY[0x24BDAC760];
    v180 = 3221225472;
    v181 = __unionIntervalsWithUsageTrustIntervalsByDeviceFilteredByItems_block_invoke;
    v182 = &unk_24C7DB428;
    v183 = v40;
    v184 = v39;
    v42 = v40;
    v43 = v39;
    objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", &v179);

    v17 = v143;
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AllDevices"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("AllDevices"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("AllDevices"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  obj = v19;
  v44 = 0x24C7DA000uLL;
  v131 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v158, v176, 16);
  if (v131)
  {
    v129 = *(_QWORD *)v159;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v159 != v129)
        {
          v46 = v45;
          objc_enumerationMutation(obj);
          v45 = v46;
        }
        v133 = v45;
        v47 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * v45);
        objc_msgSend(v130, "objectForKeyedSubscript:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "canonicalBundleIdentifier");
        v49 = objc_claimAutoreleasedReturnValue();
        v132 = (void *)v49;
        if (v49)
        {
          v50 = v49;
          objc_msgSend(*(id *)(v44 + 1744), "identifierWithIdentifier:trusted:", v49, 1);
          v51 = v44;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "objectForKeyedSubscript:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v51 + 1744), "identifierWithIdentifier:trusted:", v50, 0);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "objectForKeyedSubscript:", v54);
          v134 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v48, "primaryWebDomain");
          v55 = v44;
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = *(void **)(v55 + 1744);
          if (v54)
          {
            objc_msgSend(v56, "identifierWithIdentifier:trusted:", v54, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "objectForKeyedSubscript:", v57);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(v55 + 1744), "identifierWithIdentifier:trusted:", v54, 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v125;
          }
          else
          {
            objc_msgSend(v56, "identifierWithIdentifier:trusted:", v47, 1);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "objectForKeyedSubscript:", v60);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(v55 + 1744), "identifierWithIdentifier:trusted:", v47, 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v124;
          }
          objc_msgSend(v59, "objectForKeyedSubscript:", v58);
          v134 = (id)objc_claimAutoreleasedReturnValue();

        }
        v156 = 0u;
        v157 = 0u;
        v154 = 0u;
        v155 = 0u;
        v136 = v53;
        v144 = v48;
        v139 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v154, v175, 16);
        if (v139)
        {
          v137 = *(_QWORD *)v155;
          do
          {
            for (k = 0; k != v139; ++k)
            {
              if (*(_QWORD *)v155 != v137)
                objc_enumerationMutation(v136);
              v145 = k;
              v62 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * k);
              v63 = v147;
              v64 = v62;
              v170 = 0u;
              v171 = 0u;
              v172 = 0u;
              v173 = 0u;
              v65 = (void *)objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v170, &v179, 16);
              if (v65)
              {
                v66 = 0;
                v67 = *(_QWORD *)v171;
                v141 = v64;
                do
                {
                  v68 = 0;
                  v148 = v65;
                  do
                  {
                    if (*(_QWORD *)v171 != v67)
                      objc_enumerationMutation(v63);
                    v69 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * (_QWORD)v68);
                    if (objc_msgSend(v69, "intersectsDateInterval:", v64))
                    {
                      v70 = v63;
                      objc_msgSend(v69, "startDate");
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v64, "startDate");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v71, "earlierDate:", v72);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v69, "endDate");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v64, "endDate");
                      v75 = (void *)v66;
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v74, "laterDate:", v76);
                      v77 = (void *)objc_claimAutoreleasedReturnValue();

                      v66 = (uint64_t)v75;
                      v78 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v73, v77);

                      if (v75)
                        objc_msgSend(v75, "addObject:", v69);
                      else
                        v66 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v69, 0);

                      v64 = (id)v78;
                      v63 = v70;
                      v65 = v148;
                    }
                    v68 = (char *)v68 + 1;
                  }
                  while (v65 != v68);
                  v65 = (void *)objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v170, &v179, 16);
                }
                while (v65);
                v48 = v144;
                if (v66)
                {
                  objc_msgSend(v63, "removeObjectsInArray:", v66);
                  v17 = v143;
                  v65 = (void *)v66;
                }
                else
                {
                  v65 = 0;
                  v17 = v143;
                }
                k = v145;
                v79 = v141;
              }
              else
              {
                v79 = v64;
              }
              objc_msgSend(v63, "addObject:", v64);

            }
            v139 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v154, v175, 16);
          }
          while (v139);
        }

        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        v135 = v134;
        v140 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v150, v174, 16);
        if (v140)
        {
          v138 = *(_QWORD *)v151;
          do
          {
            for (m = 0; m != v140; ++m)
            {
              if (*(_QWORD *)v151 != v138)
                objc_enumerationMutation(v135);
              v81 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * m);
              v82 = v147;
              v83 = v81;
              v170 = 0u;
              v171 = 0u;
              v172 = 0u;
              v173 = 0u;
              v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v170, &v179, 16);
              if (v84)
              {
                v85 = v84;
                v146 = m;
                v86 = 0;
                v87 = *(_QWORD *)v171;
                v142 = v83;
                v149 = *(_QWORD *)v171;
                do
                {
                  for (n = 0; n != v85; ++n)
                  {
                    if (*(_QWORD *)v171 != v87)
                      objc_enumerationMutation(v82);
                    v89 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * n);
                    if (objc_msgSend(v89, "intersectsDateInterval:", v83))
                    {
                      v90 = v82;
                      objc_msgSend(v89, "startDate");
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v83, "startDate");
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v91, "earlierDate:", v92);
                      v93 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v89, "endDate");
                      v94 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v83, "endDate");
                      v95 = (void *)v86;
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v94, "laterDate:", v96);
                      v97 = (void *)objc_claimAutoreleasedReturnValue();

                      v86 = (uint64_t)v95;
                      v98 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v93, v97);

                      if (v95)
                        objc_msgSend(v95, "addObject:", v89);
                      else
                        v86 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v89, 0);

                      v83 = (id)v98;
                      v82 = v90;
                      v87 = v149;
                    }
                  }
                  v85 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v170, &v179, 16);
                }
                while (v85);
                if (v86)
                {
                  objc_msgSend(v82, "removeObjectsInArray:", v86);
                  v17 = v143;
                  v99 = (void *)v86;
                }
                else
                {
                  v99 = 0;
                  v17 = v143;
                }
                m = v146;
                v100 = v142;
              }
              else
              {
                v99 = 0;
                v100 = v83;
              }
              objc_msgSend(v82, "addObject:", v83);

              v48 = v144;
            }
            v140 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v150, v174, 16);
          }
          while (v140);
        }

        v45 = v133 + 1;
        v44 = 0x24C7DA000;
      }
      while (v133 + 1 != v131);
      v131 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v158, v176, 16);
    }
    while (v131);
  }

  if (objc_msgSend(v123, "count"))
  {
    if (!v120)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("USUsageQuerying.m"), 850, CFSTR("Somehow had budgeted categories but no category usage intervals"));

    }
    v101 = v147;
    v102 = v123;
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = MEMORY[0x24BDAC760];
    v180 = 3221225472;
    v181 = __unionIntervalsWithUsageIntervalsByDeviceFilteredByItems_block_invoke;
    v182 = &unk_24C7DB400;
    v183 = v102;
    v184 = v101;
    v104 = v102;
    v105 = v101;
    objc_msgSend(v103, "enumerateKeysAndObjectsUsingBlock:", &v179);

  }
  v106 = v147;
  v170 = 0u;
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v170, &v179, 16);
  if (v107)
  {
    v108 = v107;
    v109 = *(_QWORD *)v171;
    v110 = 0.0;
    do
    {
      for (ii = 0; ii != v108; ++ii)
      {
        if (*(_QWORD *)v171 != v109)
          objc_enumerationMutation(v106);
        objc_msgSend(*(id *)(*((_QWORD *)&v170 + 1) + 8 * ii), "duration");
        v110 = v110 + v112;
      }
      v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v170, &v179, 16);
    }
    while (v108);
  }
  else
  {
    v110 = 0.0;
  }

  return v110;
}

- (void)queryForUncategorizedLocalWebUsageDuringInterval:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  void *v47;
  _QWORD v48[4];

  v48[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v36 = a4;
  v38 = (void *)objc_opt_new();
  -[USUsageQuerying duetStream](self, "duetStream");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE1B0F8];
  v8 = v6;
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateForEventsIntersectingDateRangeFrom:to:", v9, v10);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B078], "usageType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andIntegerValue:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andIntegerValue:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDD14C0]);
  v48[0] = v12;
  v48[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithType:subpredicates:", 2, v15);

  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B088], "onlyLocalDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDeviceIDs:", v18);

  objc_msgSend(MEMORY[0x24BE1B130], "appWebUsageStream");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEventStreams:", v20);

  v21 = objc_alloc(MEMORY[0x24BDD14C0]);
  v46[0] = v34;
  v46[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithType:subpredicates:", 1, v22);
  objc_msgSend(v17, "setPredicate:", v23);

  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v24;
  objc_msgSend(MEMORY[0x24BE1B0F8], "endDateSortDescriptorAscending:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setSortDescriptors:", v26);
  objc_msgSend(v35, "publisherForQuery:", v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "collect");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke;
  v43[3] = &unk_24C7DAEB0;
  v44 = v36;
  v39[0] = v29;
  v39[1] = 3221225472;
  v39[2] = __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_2;
  v39[3] = &unk_24C7DB1A8;
  v39[4] = self;
  v40 = v8;
  v41 = v38;
  v42 = v44;
  v30 = v44;
  v31 = v38;
  v32 = v8;
  v33 = (id)objc_msgSend(v28, "sinkWithCompletion:receiveInput:", v43, v39);

}

void __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "state") == 1)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

void __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[USUsageQuerying queryForUncategorizedLocalWebUsageDuringInterval:completionHandler:]_block_invoke_2");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("USUsageQuerying.m"), 892, CFSTR("Expecting event to be non-nil"));

  }
  objc_msgSend(a1[4], "_getWebDomainsFromWebUsageEvents:videoUsageEvents:interval:referenceDate:focalOnly:", v3, 0, a1[5], a1[6], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_2_cold_1();
    objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_66;
    v11[3] = &unk_24C7DB180;
    v7 = a1[7];
    v8 = a1[4];
    v15 = v7;
    v11[4] = v8;
    v12 = v3;
    v13 = a1[5];
    v14 = a1[6];
    objc_msgSend(v5, "unCategorizedDomainsFromDomains:withCompletionHandler:", v6, v11);

  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }

}

uint64_t __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_66(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_computeUncategorizedLocalWebUsageWithWebUsageEvents:uncategorizedDomains:interval:referenceDate:completionHandler:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_computeUncategorizedLocalWebUsageWithWebUsageEvents:(id)a3 uncategorizedDomains:(id)a4 interval:(id)a5 referenceDate:(id)a6 completionHandler:(id)a7
{
  void (**v12)(id, void *, _QWORD);
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v12 = (void (**)(id, void *, _QWORD))a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v20 = (id)objc_msgSend(a3, "mutableCopy");
  LOBYTE(v19) = 0;
  -[USUsageQuerying _computeWebUsageWithEvents:timeZoneByDevice:lastEventDateByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByWebDomain:partition:referenceDate:focalOnly:](self, "_computeWebUsageWithEvents:timeZoneByDevice:lastEventDateByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByWebDomain:partition:referenceDate:focalOnly:", v20, 0, 0, 0, 0, 0, 0, v14, v13, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("LocalDevice"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageQuerying _generateUncategorizedLocalWebUsageWithWebUsageIntervals:uncategorizedDomains:](self, "_generateUncategorizedLocalWebUsageWithWebUsageIntervals:uncategorizedDomains:", v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v12[2](v12, v18, 0);
}

- (id)_generateUncategorizedLocalWebUsageWithWebUsageIntervals:(id)a3 uncategorizedDomains:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[4];
  id v26;

  v5 = a3;
  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __97__USUsageQuerying__generateUncategorizedLocalWebUsageWithWebUsageIntervals_uncategorizedDomains___block_invoke;
  v16[3] = &unk_24C7DB1D0;
  v8 = v6;
  v17 = v8;
  v18 = &v19;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v16);
  v9 = (void *)v20[5];
  if (v9)
  {
    v10 = v9;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __USKeyedNonIntersectingIntervalsCreateDurationDictionary_block_invoke;
    v25[3] = &unk_24C7DB450;
    v12 = v11;
    v26 = v12;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v25);

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)MEMORY[0x24BDBD1B8];
  if (v12)
    v13 = v12;
  v14 = v13;

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __97__USUsageQuerying__generateUncategorizedLocalWebUsageWithWebUsageIntervals_uncategorizedDomains___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v11, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) && objc_msgSend(v11, "trusted"))
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v7)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v6);
    }
    else
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v5, v6, 0);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }

}

- (id)_computeScreenTime:(BOOL)a3 withEvents:(id)a4 intersectingScreenTimeIntervalsByDevice:(id *)a5 longestSessionByDevice:(id *)a6 timeZoneByDevice:(id)a7 lastEventDateByDevice:(id)a8 partition:(id)a9 referenceDate:(id)a10
{
  _BOOL4 v14;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id *v23;
  id *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id *v33;
  id *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  USUsageQuerying *v40;
  id v41;
  id *v42;
  id *v43;
  id v44;
  id v45;

  v14 = a3;
  v36 = a4;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v35 = a10;
  if (v14)
    v19 = (void *)objc_opt_new();
  else
    v19 = 0;
  v33 = a5;
  if (a5)
    a5 = (id *)objc_opt_new();
  v34 = a6;
  if (a6)
    a6 = (id *)objc_opt_new();
  objc_msgSend(v18, "endDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __175__USUsageQuerying__computeScreenTime_withEvents_intersectingScreenTimeIntervalsByDevice_longestSessionByDevice_timeZoneByDevice_lastEventDateByDevice_partition_referenceDate___block_invoke;
  v38[3] = &unk_24C7DB1F8;
  v21 = v18;
  v39 = v21;
  v40 = self;
  v22 = v19;
  v41 = v22;
  v23 = a5;
  v42 = v23;
  v24 = a6;
  v43 = v24;
  v25 = v16;
  v44 = v25;
  v26 = v17;
  v45 = v26;
  -[USUsageQuerying _enumerateEvents:intervalEndDate:block:](self, "_enumerateEvents:intervalEndDate:block:", v36, v20, v38);

  v37 = 0;
  v27 = v35;
  -[USUsageQuerying _currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:](self, "_currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:", v21, &v37, v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v37;
  if (v28)
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v29, v35);
    -[USUsageQuerying _updateScreenTimeWithInterval:rawInterval:deviceIdentifier:partition:event:nonIntersectingScreenTimeIntervalsByDevice:intersectingScreenTimeIntervalsByDevice:longestSessionByDevice:timeZoneByDevice:lastEventDateByDevice:](self, "_updateScreenTimeWithInterval:rawInterval:deviceIdentifier:partition:event:nonIntersectingScreenTimeIntervalsByDevice:intersectingScreenTimeIntervalsByDevice:longestSessionByDevice:timeZoneByDevice:lastEventDateByDevice:", v28, v30, CFSTR("LocalDevice"), v21, 0, v22, v23, v24, v25, v26);

    v27 = v35;
  }
  if (v33)
    *v33 = objc_retainAutorelease(v23);
  if (v34)
    *v34 = objc_retainAutorelease(v24);
  v31 = v22;

  return v31;
}

void __175__USUsageQuerying__computeScreenTime_withEvents_intersectingScreenTimeIntervalsByDevice_longestSessionByDevice_timeZoneByDevice_lastEventDateByDevice_partition_referenceDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "earlierDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "compare:", v9) == 1)
    v10 = 0;
  else
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v6, v9);

  if (v10)
  {
    objc_msgSend(v20, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "syncDeviceID");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("LocalDevice");
    if (v12)
      v14 = (__CFString *)v12;
    v15 = v14;

    v16 = objc_alloc(MEMORY[0x24BDD1508]);
    objc_msgSend(v20, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:", v17, v18);

    objc_msgSend(*(id *)(a1 + 40), "_updateScreenTimeWithInterval:rawInterval:deviceIdentifier:partition:event:nonIntersectingScreenTimeIntervalsByDevice:intersectingScreenTimeIntervalsByDevice:longestSessionByDevice:timeZoneByDevice:lastEventDateByDevice:", v10, v19, v15, *(_QWORD *)(a1 + 32), v20, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  }

}

- (void)_updateScreenTimeWithInterval:(id)a3 rawInterval:(id)a4 deviceIdentifier:(id)a5 partition:(id)a6 event:(id)a7 nonIntersectingScreenTimeIntervalsByDevice:(id)a8 intersectingScreenTimeIntervalsByDevice:(id)a9 longestSessionByDevice:(id)a10 timeZoneByDevice:(id)a11 lastEventDateByDevice:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  uint64_t v108;
  void *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v100 = a4;
  v18 = a5;
  v104 = a6;
  v103 = a7;
  v19 = a8;
  v102 = a9;
  v101 = a10;
  v106 = a11;
  v105 = a12;
  v107 = v19;
  if (v19)
  {
    v20 = v17;
    objc_msgSend(v19, "objectForKeyedSubscript:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v18;
    v99 = v17;
    if (v21)
    {
      v22 = v21;
      v23 = v20;
      v110 = 0u;
      v111 = 0u;
      v112 = 0u;
      v113 = 0u;
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
      if (v24)
      {
        v25 = v24;
        v96 = v20;
        v26 = 0;
        v27 = *(_QWORD *)v111;
        v108 = *(_QWORD *)v111;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v111 != v27)
              objc_enumerationMutation(v22);
            v29 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
            if (objc_msgSend(v29, "intersectsDateInterval:", v23))
            {
              v30 = v22;
              objc_msgSend(v29, "startDate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "startDate");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "earlierDate:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "endDate");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "endDate");
              v35 = v26;
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "laterDate:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              v26 = v35;
              v38 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v33, v37);

              if (v35)
                objc_msgSend(v35, "addObject:", v29);
              else
                v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v29, 0);

              v23 = (id)v38;
              v22 = v30;
              v27 = v108;
            }
          }
          v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
        }
        while (v25);
        if (v26)
          objc_msgSend(v22, "removeObjectsInArray:", v26);
        v19 = v107;
        v20 = v96;
      }
      else
      {
        v26 = 0;
      }
      objc_msgSend(v22, "addObject:", v23);

      v18 = v98;
      v17 = v99;
    }
    else
    {
      v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v20, 0);
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, v18);
    }

    v39 = v19;
    v40 = v20;
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      v97 = v39;
      v42 = v41;
      v95 = v40;
      v43 = v40;
      v110 = 0u;
      v111 = 0u;
      v112 = 0u;
      v113 = 0u;
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
      if (v44)
      {
        v45 = v44;
        v109 = 0;
        v46 = *(_QWORD *)v111;
        do
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v111 != v46)
              objc_enumerationMutation(v42);
            v48 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
            if (objc_msgSend(v48, "intersectsDateInterval:", v43))
            {
              v49 = v42;
              objc_msgSend(v48, "startDate");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "startDate");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "earlierDate:", v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v48, "endDate");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "endDate");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "laterDate:", v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              v56 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v52, v55);
              if (v109)
                objc_msgSend(v109, "addObject:", v48);
              else
                v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v48, 0);

              v43 = (id)v56;
              v42 = v49;
            }
          }
          v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
        }
        while (v45);
        v57 = v109;
        if (v109)
          objc_msgSend(v42, "removeObjectsInArray:", v109);
        v18 = v98;
        v19 = v107;
      }
      else
      {
        v57 = 0;
      }
      objc_msgSend(v42, "addObject:", v43);

      v17 = v99;
      v40 = v95;
      v39 = v97;
    }
    else
    {
      v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v40, 0);
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v42, CFSTR("AllDevices"));
    }

  }
  v58 = v101;
  v59 = v102;
  if (v102)
  {
    objc_msgSend(v100, "startDate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v104, "containsDate:", v60);

    v19 = v107;
    if (v61)
    {
      objc_msgSend(v102, "objectForKeyedSubscript:", v18);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        v63 = v62;
        objc_msgSend(v62, "addObject:", v100);
      }
      else
      {
        v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v100, 0);
        objc_msgSend(v102, "setObject:forKeyedSubscript:", v63, v18);
      }

      v19 = v107;
    }
  }
  if (v101)
  {
    objc_msgSend(v100, "duration");
    v65 = v64;
    objc_msgSend(v101, "objectForKeyedSubscript:", v18);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "duration");
    v68 = v67;

    if (v65 > v68)
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, v18);
    objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "duration");
    v71 = v70;

    v19 = v107;
    if (v65 > v71)
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, CFSTR("AllDevices"));
  }
  if (v106 && v105)
  {
    v72 = v106;
    v73 = v105;
    v74 = v18;
    v75 = v103;
    v76 = v17;
    v77 = v74;
    v78 = v74;
    objc_msgSend(v72, "objectForKeyedSubscript:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v79)
    {
      objc_msgSend(v75, "timeZone");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        objc_msgSend(v72, "setObject:forKeyedSubscript:", v80, v78);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setObject:forKeyedSubscript:", v81, v78);

      }
    }
    objc_msgSend(v76, "endDate");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "objectForKeyedSubscript:", v78);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v83;
    if (!v83 || objc_msgSend(v83, "compare:", v82) == -1)
      objc_msgSend(v73, "setObject:forKeyedSubscript:", v82, v78);

    v85 = v72;
    v86 = v73;
    v87 = v75;
    v88 = v76;
    objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v89)
    {
      objc_msgSend(v87, "timeZone");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      if (v90)
      {
        objc_msgSend(v85, "setObject:forKeyedSubscript:", v90, CFSTR("AllDevices"));
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setObject:forKeyedSubscript:", v91, CFSTR("AllDevices"));

      }
    }
    objc_msgSend(v88, "endDate");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v93;
    if (!v93 || objc_msgSend(v93, "compare:", v92) == -1)
      objc_msgSend(v86, "setObject:forKeyedSubscript:", v92, CFSTR("AllDevices"));

    v18 = v77;
    v19 = v107;
    v58 = v101;
    v59 = v102;
  }

}

- (id)_currentScreenTimeIntervalDuringInterval:(id)a3 usageStartDate:(id *)a4 referenceDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id *v24;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBacklightOnStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageQuerying context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[USUsageQuerying _currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:].cold.1();
    goto LABEL_8;
  }
  if (!objc_msgSend(v12, "BOOLValue"))
  {
LABEL_8:
    v21 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v11, "lastModifiedDateForContextualKeyPath:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v24 = a4;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v15, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "laterDate:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v15;
    objc_msgSend(v15, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "earlierDate:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "compare:", v20) == 1)
      v21 = 0;
    else
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v18, v20);

    *v24 = objc_retainAutorelease(v14);
  }
  else
  {
    v21 = 0;
  }

LABEL_13:
  return v21;
}

- (id)_getBundleIdentiersFromApplicationUsageEvents:(id)a3 videoUsageEvents:(id)a4 interval:(id)a5 referenceDate:(id)a6 focalOnly:(BOOL)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v37;
  _BOOL4 v38;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v38 = a7;
  v55 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v37 = a4;
  v40 = a5;
  v11 = a6;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B000], "appBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v50 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v19, "metadata", v37);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = v21;
        }
        else
        {
          objc_msgSend(v19, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringValue");
          v22 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v12, "addObject:", v22);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v16);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v24 = v37;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v46 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "value", v37);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringValue");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "addObject:", v30);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v26);
  }

  v31 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __115__USUsageQuerying__getBundleIdentiersFromApplicationUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke;
  v43[3] = &unk_24C7DB220;
  v32 = v12;
  v44 = v32;
  -[USUsageQuerying _enumerateCurrentApplicationUsageIntervalsDuringInterval:referenceDate:focalOnly:block:](self, "_enumerateCurrentApplicationUsageIntervalsDuringInterval:referenceDate:focalOnly:block:", v40, v11, v38, v43);
  v41[0] = v31;
  v41[1] = 3221225472;
  v41[2] = __115__USUsageQuerying__getBundleIdentiersFromApplicationUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke_2;
  v41[3] = &unk_24C7DB248;
  v33 = v32;
  v42 = v33;
  -[USUsageQuerying _enumerateCurrentVideoUsageIntervalsDuringInterval:referenceDate:block:](self, "_enumerateCurrentVideoUsageIntervalsDuringInterval:referenceDate:block:", v40, v11, v41);
  v34 = v42;
  v35 = v33;

  return v35;
}

void __115__USUsageQuerying__getBundleIdentiersFromApplicationUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  double v6;
  id v7;

  v7 = a4;
  objc_msgSend(a2, "duration");
  if (v6 > 0.0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __115__USUsageQuerying__getBundleIdentiersFromApplicationUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  double v6;
  id v7;

  v7 = a4;
  objc_msgSend(a2, "duration");
  if (v6 > 0.0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (id)_computeApplicationUsageWithEvents:(id)a3 unboundApplicationUsageIntervalsByDevice:(id *)a4 timeZoneByDevice:(id)a5 lastEventDateByDevice:(id)a6 categoryUsageIntervalsByDevice:(id)a7 aggregatedApplicationUsageIntervalsByDevice:(id)a8 categoryByBundleIdentifier:(id)a9 partition:(id)a10 referenceDate:(id)a11 focalOnly:(BOOL)a12
{
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v56;
  id v57;
  id *v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  USUsageQuerying *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  USUsageQuerying *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  USUsageQuerying *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;

  v59 = a5;
  v56 = a6;
  v17 = a7;
  v18 = a8;
  v49 = a9;
  v19 = a10;
  v53 = a11;
  v51 = a3;
  v20 = (void *)objc_opt_new();
  v58 = a4;
  if (a4)
    v21 = (void *)objc_opt_new();
  else
    v21 = 0;
  objc_msgSend(MEMORY[0x24BE1B000], "appBundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B078], "isUsageTrusted");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "endDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = MEMORY[0x24BDAC760];
  v81[1] = 3221225472;
  v81[2] = __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke;
  v81[3] = &unk_24C7DB270;
  v52 = v19;
  v82 = v52;
  v83 = v22;
  v84 = v23;
  v85 = self;
  v25 = v20;
  v86 = v25;
  v26 = v21;
  v87 = v26;
  v27 = v17;
  v88 = v27;
  v28 = v18;
  v89 = v28;
  v50 = v49;
  v90 = v50;
  v29 = v59;
  v91 = v29;
  v30 = v56;
  v92 = v30;
  v60 = v23;
  v57 = v22;
  -[USUsageQuerying _enumerateEvents:intervalEndDate:block:](self, "_enumerateEvents:intervalEndDate:block:", v51, v24, v81);

  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke_2;
  v71[3] = &unk_24C7DB298;
  v31 = v53;
  v72 = v31;
  v73 = self;
  v32 = v25;
  v74 = v32;
  v33 = v26;
  v75 = v33;
  v34 = v27;
  v76 = v34;
  v35 = v28;
  v77 = v35;
  v36 = v50;
  v78 = v36;
  v37 = v29;
  v79 = v37;
  v38 = v30;
  v80 = v38;
  -[USUsageQuerying _enumerateCurrentApplicationUsageIntervalsDuringInterval:referenceDate:focalOnly:block:](self, "_enumerateCurrentApplicationUsageIntervalsDuringInterval:referenceDate:focalOnly:block:", v52, v31, a12, v71);
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke_3;
  v61[3] = &unk_24C7DB2C0;
  v62 = v31;
  v63 = self;
  v39 = v32;
  v64 = v39;
  v40 = v33;
  v65 = v40;
  v66 = v34;
  v67 = v35;
  v68 = v36;
  v69 = v37;
  v70 = v38;
  v54 = v38;
  v41 = v37;
  v42 = v36;
  v43 = v35;
  v44 = v34;
  v45 = v31;
  -[USUsageQuerying _enumerateCurrentVideoUsageIntervalsDuringInterval:referenceDate:block:](self, "_enumerateCurrentVideoUsageIntervalsDuringInterval:referenceDate:block:", v52, v45, v61);
  if (v58)
    *v58 = objc_retainAutorelease(v40);
  v46 = v70;
  v47 = v39;

  return v47;
}

void __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;

  v31 = a2;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "earlierDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "compare:", v9) == 1)
    v10 = 0;
  else
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v6, v9);

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BDD1508]);
    objc_msgSend(v31, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);

    objc_msgSend(v31, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "syncDeviceID");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("LocalDevice");
    if (v16)
      v18 = (__CFString *)v16;
    v19 = v18;

    objc_msgSend(v31, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = v21;
    }
    else
    {
      objc_msgSend(v31, "value");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringValue");
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v31, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v27 = (void *)MEMORY[0x24BDBD1C8];
    if (v25)
      v27 = (void *)v25;
    v28 = v27;

    v29 = *(void **)(a1 + 56);
    v30 = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(v29, "_updateApplicationUsageWithInterval:unboundInterval:bundleIdentifier:trustedApplicationUsage:deviceIdentifier:event:applicationUsageIntervalsByDevice:unboundApplicationUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:categoryByBundleIdentifier:timeZoneByDevice:lastEventDateByDevice:", v10, v14, v22, v30, v19, v31, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112));
  }

}

void __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = (objc_class *)MEMORY[0x24BDD1508];
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v13 = (id)objc_msgSend([v9 alloc], "initWithStartDate:endDate:", v11, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "_updateApplicationUsageWithInterval:unboundInterval:bundleIdentifier:trustedApplicationUsage:deviceIdentifier:event:applicationUsageIntervalsByDevice:unboundApplicationUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:categoryByBundleIdentifier:timeZoneByDevice:lastEventDateByDevice:", v12, v13, v10, a5, CFSTR("LocalDevice"), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
}

void __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = (objc_class *)MEMORY[0x24BDD1508];
  v11 = a4;
  v12 = a3;
  v13 = a2;
  v14 = (id)objc_msgSend([v10 alloc], "initWithStartDate:endDate:", v12, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "_updateApplicationUsageWithInterval:unboundInterval:bundleIdentifier:trustedApplicationUsage:deviceIdentifier:event:applicationUsageIntervalsByDevice:unboundApplicationUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:categoryByBundleIdentifier:timeZoneByDevice:lastEventDateByDevice:", v13, v14, v11, a6, CFSTR("LocalDevice"), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
}

- (void)_updateApplicationUsageWithInterval:(id)a3 unboundInterval:(id)a4 bundleIdentifier:(id)a5 trustedApplicationUsage:(BOOL)a6 deviceIdentifier:(id)a7 event:(id)a8 applicationUsageIntervalsByDevice:(id)a9 unboundApplicationUsageIntervalsByDevice:(id)a10 categoryUsageIntervalsByDevice:(id)a11 aggregatedApplicationUsageIntervalsByDevice:(id)a12 categoryByBundleIdentifier:(id)a13 timeZoneByDevice:(id)a14 lastEventDateByDevice:(id)a15
{
  _BOOL8 v17;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
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
  id v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  id v121;
  void *v122;
  id v123;
  id v124;
  id v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  id v151;
  id v152;
  id v153;
  id v154;
  void *v155;
  id v156;
  id v157;
  id v158;
  void *v159;
  id v160;
  id v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  void *v168;
  id v169;
  id v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  id v183;
  id v184;
  void *v185;
  id v186;
  id v187;
  id v188;
  void *v189;
  id v190;
  id v191;
  id v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  id v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  uint64_t v206;
  void *v207;
  void *v208;
  void *v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  id v221;
  id v222;
  id v223;
  id v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  id v232;
  id v233;
  id v234;
  id v235;
  void *v236;
  id v237;
  id v238;
  id v239;
  void *v240;
  id v241;
  id v242;
  id v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t i;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  uint64_t v255;
  void *v256;
  void *v257;
  void *v258;
  id v259;
  id v260;
  void *v261;
  id v262;
  id v263;
  id v264;
  id v265;
  id v266;
  id v267;
  id v268;
  id v269;
  id v270;
  id v271;
  id v272;
  id v273;
  id v274;
  id v275;
  id v276;
  id v277;
  id v278;
  id v279;
  id v280;
  id v281;
  id v282;
  _BOOL4 v283;
  id v284;
  id v285;
  id v286;
  id v287;
  id v288;
  void *v289;
  id v290;
  id v291;
  id v292;
  id v293;
  void *v294;
  id v295;
  id v296;
  id v297;
  id v298;
  void *v299;
  id v300;
  id v301;
  id v302;
  id v303;
  id v304;
  uint64_t v305;
  id v306;
  id v307;
  id v308;
  id v309;
  id v310;
  id v311;
  id v312;
  id v313;
  id v314;
  id v315;
  id v316;
  id v317;
  id v318;
  uint64_t v319;
  id v320;
  uint64_t v321;
  id v322;
  id v323;
  id v324;
  uint64_t v325;
  void *v326;
  void *v327;
  uint64_t v328;
  void *v329;
  uint64_t v330;
  void *v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  _BYTE v336[128];
  uint64_t v337;

  v17 = a6;
  v337 = *MEMORY[0x24BDAC8D0];
  v324 = a3;
  v291 = a4;
  v20 = a5;
  v21 = a7;
  v287 = a8;
  v22 = a9;
  v290 = a10;
  v302 = a11;
  v301 = a12;
  v296 = a13;
  v300 = a14;
  v295 = a15;
  v299 = v20;
  v283 = v17;
  +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v20, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22;
  v25 = v21;
  v26 = v23;
  v27 = v324;
  objc_msgSend(v24, "objectForKeyedSubscript:", v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v292 = v25;
  if (v28)
  {
    v29 = v28;
    v30 = v26;
    v31 = v27;
    objc_msgSend(v29, "objectForKeyedSubscript:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = v32;
      v317 = v31;
      v34 = v31;
      v332 = 0u;
      v333 = 0u;
      v334 = 0u;
      v335 = 0u;
      v35 = v33;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
      if (v36)
      {
        v37 = v36;
        v288 = v30;
        v293 = v29;
        v297 = v27;
        v303 = v26;
        v310 = v24;
        v38 = 0;
        v39 = *(_QWORD *)v333;
        v276 = v34;
        do
        {
          v40 = 0;
          v325 = v37;
          do
          {
            if (*(_QWORD *)v333 != v39)
              objc_enumerationMutation(v35);
            v41 = *(void **)(*((_QWORD *)&v332 + 1) + 8 * v40);
            if (objc_msgSend(v41, "intersectsDateInterval:", v34))
            {
              v42 = v35;
              objc_msgSend(v41, "startDate");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "startDate");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "earlierDate:", v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v41, "endDate");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "endDate");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "laterDate:", v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              v49 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v45, v48);
              if (v38)
                objc_msgSend(v38, "addObject:", v41);
              else
                v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v41, 0);

              v34 = (id)v49;
              v35 = v42;
              v37 = v325;
            }
            ++v40;
          }
          while (v37 != v40);
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
        }
        while (v37);

        if (v38)
        {
          objc_msgSend(v35, "removeObjectsInArray:", v38);
          v50 = v38;
        }
        else
        {
          v50 = 0;
        }
        v26 = v303;
        v24 = v310;
        v27 = v297;
        v29 = v293;
        v30 = v288;
        v52 = v276;
      }
      else
      {

        v50 = 0;
        v52 = v34;
      }
      objc_msgSend(v35, "addObject:", v34);

      v25 = v292;
      v31 = v317;
    }
    else
    {
      v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v31, 0);
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, v30);
    }

  }
  else
  {
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v27, 0);
    v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v51, v26, 0);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, v25);

  }
  v53 = v24;
  v54 = v26;
  v55 = v27;
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("AllDevices"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v298 = v55;
  v294 = v54;
  v289 = v53;
  if (v56)
  {
    v57 = v56;
    v58 = v54;
    v59 = v55;
    objc_msgSend(v57, "objectForKeyedSubscript:", v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      v61 = v60;
      v62 = v59;
      v332 = 0u;
      v333 = 0u;
      v334 = 0u;
      v335 = 0u;
      v63 = v61;
      v64 = (void *)objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
      if (v64)
      {
        v304 = v59;
        v311 = v58;
        v318 = v57;
        v65 = 0;
        v66 = *(_QWORD *)v333;
        v277 = v62;
        v67 = v62;
        do
        {
          v68 = 0;
          v326 = v64;
          do
          {
            if (*(_QWORD *)v333 != v66)
              objc_enumerationMutation(v63);
            v69 = *(void **)(*((_QWORD *)&v332 + 1) + 8 * (_QWORD)v68);
            if (objc_msgSend(v69, "intersectsDateInterval:", v67))
            {
              v70 = v63;
              objc_msgSend(v69, "startDate");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "startDate");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "earlierDate:", v72);
              v73 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v69, "endDate");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "endDate");
              v75 = (void *)v65;
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "laterDate:", v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();

              v65 = (uint64_t)v75;
              v78 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v73, v77);

              if (v75)
                objc_msgSend(v75, "addObject:", v69);
              else
                v65 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v69, 0);

              v67 = (void *)v78;
              v63 = v70;
              v64 = v326;
            }
            v68 = (char *)v68 + 1;
          }
          while (v64 != v68);
          v64 = (void *)objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
        }
        while (v64);

        if (v65)
        {
          objc_msgSend(v63, "removeObjectsInArray:", v65);
          v55 = v298;
          v57 = v318;
          v64 = (void *)v65;
        }
        else
        {
          v64 = 0;
          v55 = v298;
          v57 = v318;
        }
        v59 = v304;
        v58 = v311;
        v62 = v277;
      }
      else
      {

        v67 = v62;
      }
      objc_msgSend(v63, "addObject:", v67);

      v25 = v292;
    }
    else
    {
      v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v59, 0);
      objc_msgSend(v57, "setObject:forKeyedSubscript:", v63, v58);
    }

    v80 = v57;
    v79 = v289;
    v54 = v294;
  }
  else
  {
    v57 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v55, 0);
    v79 = v53;
    v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v57, v54, 0);
    objc_msgSend(v79, "setObject:forKeyedSubscript:", v80, CFSTR("AllDevices"));
  }

  if (v302)
  {
    objc_msgSend(v296, "objectForKeyedSubscript:", v299);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "identifier");
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = (void *)v82;
    v84 = (void *)*MEMORY[0x24BE157A8];
    if (v82)
      v84 = (void *)v82;
    v85 = v84;

    v86 = v302;
    v87 = v25;
    v88 = v85;
    v89 = v55;
    objc_msgSend(v86, "objectForKeyedSubscript:", v87);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v90)
    {
      v91 = v90;
      v92 = v88;
      v278 = v89;
      v93 = v89;
      v94 = v92;
      v95 = v93;
      objc_msgSend(v91, "objectForKeyedSubscript:", v94);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (v96)
      {
        v261 = v94;
        v266 = v91;
        v271 = v88;
        v97 = v96;
        v98 = v95;
        v332 = 0u;
        v333 = 0u;
        v334 = 0u;
        v335 = 0u;
        v99 = v97;
        v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
        if (v100)
        {
          v101 = v100;
          v259 = v86;
          v327 = 0;
          v102 = *(_QWORD *)v333;
          v103 = v98;
          v305 = *(_QWORD *)v333;
          v312 = v98;
          do
          {
            v104 = 0;
            v319 = v101;
            do
            {
              if (*(_QWORD *)v333 != v102)
                objc_enumerationMutation(v99);
              v105 = *(void **)(*((_QWORD *)&v332 + 1) + 8 * v104);
              if (objc_msgSend(v105, "intersectsDateInterval:", v103))
              {
                v106 = v99;
                v107 = v95;
                v108 = v87;
                objc_msgSend(v105, "startDate");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v103, "startDate");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "earlierDate:", v110);
                v111 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v105, "endDate");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v103, "endDate");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v112, "laterDate:", v113);
                v114 = (void *)objc_claimAutoreleasedReturnValue();

                v115 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v111, v114);
                if (v327)
                  objc_msgSend(v327, "addObject:", v105);
                else
                  v327 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v105, 0);
                v87 = v108;

                v103 = (void *)v115;
                v95 = v107;
                v99 = v106;
                v102 = v305;
                v98 = v312;
                v101 = v319;
              }
              ++v104;
            }
            while (v101 != v104);
            v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
          }
          while (v101);

          v116 = v327;
          if (v327)
            objc_msgSend(v99, "removeObjectsInArray:", v327);
          v55 = v298;
          v86 = v259;
        }
        else
        {

          v116 = 0;
          v103 = v98;
        }
        v88 = v271;
        objc_msgSend(v99, "addObject:", v103);

        v25 = v292;
        v94 = v261;
        v91 = v266;
      }
      else
      {
        v99 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v95, 0);
        objc_msgSend(v91, "setObject:forKeyedSubscript:", v99, v94);
      }

      v118 = v91;
      v117 = v278;
    }
    else
    {
      v91 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v89, 0);
      v117 = v89;
      v118 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v91, v88, 0);
      objc_msgSend(v86, "setObject:forKeyedSubscript:", v118, v87);
    }

    v119 = v86;
    v120 = v88;
    v121 = v117;
    objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (v122)
    {
      v123 = v122;
      v124 = v120;
      v125 = v121;
      objc_msgSend(v123, "objectForKeyedSubscript:", v124);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      if (v126)
      {
        v127 = v126;
        v320 = v125;
        v128 = v125;
        v332 = 0u;
        v333 = 0u;
        v334 = 0u;
        v335 = 0u;
        v129 = v127;
        v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
        if (v130)
        {
          v131 = v130;
          v267 = v124;
          v272 = v123;
          v279 = v121;
          v306 = v120;
          v313 = v119;
          v132 = 0;
          v133 = *(_QWORD *)v333;
          v262 = v128;
          v134 = v129;
          do
          {
            v135 = 0;
            v328 = v131;
            do
            {
              if (*(_QWORD *)v333 != v133)
                objc_enumerationMutation(v134);
              v136 = *(void **)(*((_QWORD *)&v332 + 1) + 8 * v135);
              if (objc_msgSend(v136, "intersectsDateInterval:", v128))
              {
                v137 = v134;
                objc_msgSend(v136, "startDate");
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v128, "startDate");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v138, "earlierDate:", v139);
                v140 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v136, "endDate");
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v128, "endDate");
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v141, "laterDate:", v142);
                v143 = (void *)objc_claimAutoreleasedReturnValue();

                v144 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v140, v143);
                if (v132)
                  objc_msgSend(v132, "addObject:", v136);
                else
                  v132 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v136, 0);

                v128 = (id)v144;
                v134 = v137;
                v131 = v328;
              }
              ++v135;
            }
            while (v131 != v135);
            v131 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
          }
          while (v131);

          if (v132)
          {
            objc_msgSend(v134, "removeObjectsInArray:", v132);
            v55 = v298;
            v129 = v134;
            v120 = v306;
            v119 = v313;
            v145 = v132;
          }
          else
          {
            v145 = 0;
            v55 = v298;
            v129 = v134;
            v120 = v306;
            v119 = v313;
          }
          v123 = v272;
          v121 = v279;
          v147 = v262;
          v124 = v267;
        }
        else
        {

          v145 = 0;
          v147 = v128;
        }
        objc_msgSend(v129, "addObject:", v128);

        v25 = v292;
        v125 = v320;
      }
      else
      {
        v129 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v125, 0);
        objc_msgSend(v123, "setObject:forKeyedSubscript:", v129, v124);
      }

      v146 = v123;
    }
    else
    {
      v123 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v121, 0);
      v146 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v123, v120, 0);
      objc_msgSend(v119, "setObject:forKeyedSubscript:", v146, CFSTR("AllDevices"));
    }

  }
  if (v301)
  {
    objc_msgSend(v296, "objectForKeyedSubscript:", v299);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "canonicalBundleIdentifier");
    v149 = (id)objc_claimAutoreleasedReturnValue();

    if (!v149)
      v149 = v299;
    +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v149, v283);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = v301;
    v152 = v25;
    v153 = v150;
    v154 = v55;
    objc_msgSend(v151, "objectForKeyedSubscript:", v152);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    if (v155)
    {
      v156 = v155;
      v157 = v153;
      v158 = v154;
      objc_msgSend(v156, "objectForKeyedSubscript:", v157);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      if (v159)
      {
        v273 = v156;
        v280 = v152;
        v284 = v154;
        v307 = v153;
        v160 = v159;
        v161 = v158;
        v332 = 0u;
        v333 = 0u;
        v334 = 0u;
        v335 = 0u;
        v162 = v160;
        v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
        v268 = v158;
        v314 = v149;
        if (v163)
        {
          v164 = v163;
          v260 = v161;
          v263 = v151;
          v329 = 0;
          v165 = *(_QWORD *)v333;
          v166 = v161;
          do
          {
            v167 = 0;
            v321 = v164;
            do
            {
              if (*(_QWORD *)v333 != v165)
                objc_enumerationMutation(v162);
              v168 = *(void **)(*((_QWORD *)&v332 + 1) + 8 * v167);
              if (objc_msgSend(v168, "intersectsDateInterval:", v166))
              {
                v169 = v162;
                v170 = v157;
                objc_msgSend(v168, "startDate");
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "startDate");
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v171, "earlierDate:", v172);
                v173 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v168, "endDate");
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "endDate");
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v174, "laterDate:", v175);
                v176 = (void *)objc_claimAutoreleasedReturnValue();

                v177 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v173, v176);
                if (v329)
                  objc_msgSend(v329, "addObject:", v168);
                else
                  v329 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v168, 0);
                v157 = v170;

                v166 = (void *)v177;
                v162 = v169;
                v164 = v321;
              }
              ++v167;
            }
            while (v164 != v167);
            v164 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
          }
          while (v164);

          v178 = v329;
          if (v329)
            objc_msgSend(v162, "removeObjectsInArray:", v329);
          v179 = v260;
          v151 = v263;
        }
        else
        {

          v178 = 0;
          v166 = v161;
          v179 = v161;
        }
        v153 = v307;
        v152 = v280;
        v154 = v284;
        v156 = v273;
        objc_msgSend(v162, "addObject:", v166);

        v181 = v162;
        v25 = v292;
        v158 = v268;
        v149 = v314;
      }
      else
      {
        v181 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v158, 0);
        objc_msgSend(v156, "setObject:forKeyedSubscript:", v181, v157);
      }

      v180 = v156;
    }
    else
    {
      v156 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v154, 0);
      v180 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v156, v153, 0);
      objc_msgSend(v151, "setObject:forKeyedSubscript:", v180, v152);
    }

    v182 = v151;
    v183 = v153;
    v184 = v154;
    objc_msgSend(v182, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    if (v185)
    {
      v186 = v185;
      v187 = v183;
      v188 = v184;
      objc_msgSend(v186, "objectForKeyedSubscript:", v187);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v298;
      if (v189)
      {
        v190 = v189;
        v322 = v188;
        v191 = v188;
        v332 = 0u;
        v333 = 0u;
        v334 = 0u;
        v335 = 0u;
        v192 = v190;
        v193 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
        v315 = v149;
        if (v193)
        {
          v194 = v193;
          v269 = v187;
          v274 = v186;
          v281 = v184;
          v285 = v183;
          v308 = v182;
          v195 = 0;
          v196 = *(_QWORD *)v333;
          v264 = v191;
          do
          {
            v197 = 0;
            v330 = v194;
            do
            {
              if (*(_QWORD *)v333 != v196)
                objc_enumerationMutation(v192);
              v198 = *(void **)(*((_QWORD *)&v332 + 1) + 8 * v197);
              if (objc_msgSend(v198, "intersectsDateInterval:", v191))
              {
                v199 = v192;
                objc_msgSend(v198, "startDate");
                v200 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v191, "startDate");
                v201 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v200, "earlierDate:", v201);
                v202 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v198, "endDate");
                v203 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v191, "endDate");
                v204 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v203, "laterDate:", v204);
                v205 = (void *)objc_claimAutoreleasedReturnValue();

                v206 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v202, v205);
                if (v195)
                  objc_msgSend(v195, "addObject:", v198);
                else
                  v195 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v198, 0);

                v191 = (id)v206;
                v192 = v199;
                v194 = v330;
              }
              ++v197;
            }
            while (v194 != v197);
            v194 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
          }
          while (v194);

          if (v195)
          {
            objc_msgSend(v192, "removeObjectsInArray:", v195);
            v182 = v308;
            v207 = v195;
          }
          else
          {
            v207 = 0;
            v182 = v308;
          }
          v184 = v281;
          v183 = v285;
          v187 = v269;
          v186 = v274;
          v188 = v322;
          v209 = v264;
        }
        else
        {

          v207 = 0;
          v209 = v191;
        }
        objc_msgSend(v192, "addObject:", v191);

        v25 = v292;
        v55 = v298;
        v149 = v315;
      }
      else
      {
        v192 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v188, 0);
        objc_msgSend(v186, "setObject:forKeyedSubscript:", v192, v187);
      }

      v208 = v186;
    }
    else
    {
      v186 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v184, 0);
      v208 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v186, v183, 0);
      objc_msgSend(v182, "setObject:forKeyedSubscript:", v208, CFSTR("AllDevices"));
      v55 = v298;
    }

  }
  if (v300 && v295)
  {
    v210 = v300;
    v211 = v295;
    v212 = v287;
    v213 = v55;
    v214 = v25;
    objc_msgSend(v210, "objectForKeyedSubscript:", v214);
    v215 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v215)
    {
      objc_msgSend(v212, "timeZone");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      if (v216)
      {
        objc_msgSend(v210, "setObject:forKeyedSubscript:", v216, v214);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v210, "setObject:forKeyedSubscript:", v217, v214);

      }
    }
    objc_msgSend(v213, "endDate");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "objectForKeyedSubscript:", v214);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = v219;
    if (!v219 || objc_msgSend(v219, "compare:", v218) == -1)
      objc_msgSend(v211, "setObject:forKeyedSubscript:", v218, v214);

    v221 = v210;
    v222 = v211;
    v223 = v212;
    v224 = v213;
    objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v225 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = v298;
    if (!v225)
    {
      objc_msgSend(v223, "timeZone");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      if (v226)
      {
        objc_msgSend(v221, "setObject:forKeyedSubscript:", v226, CFSTR("AllDevices"));
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v227 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v221, "setObject:forKeyedSubscript:", v227, CFSTR("AllDevices"));

      }
    }
    objc_msgSend(v224, "endDate");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    v230 = v229;
    if (!v229 || objc_msgSend(v229, "compare:", v228) == -1)
      objc_msgSend(v222, "setObject:forKeyedSubscript:", v228, CFSTR("AllDevices"));

  }
  v231 = v290;
  if (v290)
  {
    v232 = v290;
    v233 = v25;
    v234 = v294;
    v235 = v291;
    objc_msgSend(v232, "objectForKeyedSubscript:", v233);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    if (v236)
    {
      v237 = v236;
      v238 = v234;
      v239 = v235;
      objc_msgSend(v237, "objectForKeyedSubscript:", v238);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      if (v240)
      {
        v286 = v238;
        v309 = v237;
        v316 = v235;
        v323 = v234;
        v241 = v240;
        v282 = v239;
        v242 = v239;
        v332 = 0u;
        v333 = 0u;
        v334 = 0u;
        v335 = 0u;
        v243 = v241;
        v244 = objc_msgSend(v243, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
        if (v244)
        {
          v245 = v244;
          v270 = v233;
          v275 = v232;
          v331 = 0;
          v246 = *(_QWORD *)v333;
          v265 = v242;
          do
          {
            for (i = 0; i != v245; ++i)
            {
              if (*(_QWORD *)v333 != v246)
                objc_enumerationMutation(v243);
              v248 = *(void **)(*((_QWORD *)&v332 + 1) + 8 * i);
              if (objc_msgSend(v248, "intersectsDateInterval:", v242))
              {
                objc_msgSend(v248, "startDate");
                v249 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v242, "startDate");
                v250 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v249, "earlierDate:", v250);
                v251 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v248, "endDate");
                v252 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v242, "endDate");
                v253 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v252, "laterDate:", v253);
                v254 = (void *)objc_claimAutoreleasedReturnValue();

                v255 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v251, v254);
                if (v331)
                  objc_msgSend(v331, "addObject:", v248);
                else
                  v331 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v248, 0);

                v242 = (id)v255;
              }
            }
            v245 = objc_msgSend(v243, "countByEnumeratingWithState:objects:count:", &v332, v336, 16);
          }
          while (v245);

          v256 = v331;
          if (v331)
            objc_msgSend(v243, "removeObjectsInArray:", v331);
          v25 = v292;
          v233 = v270;
          v232 = v275;
          v257 = v265;
        }
        else
        {

          v256 = 0;
          v257 = v242;
          v25 = v292;
        }
        objc_msgSend(v243, "addObject:", v242);

        v55 = v298;
        v235 = v316;
        v234 = v323;
        v237 = v309;
        v239 = v282;
        v238 = v286;
      }
      else
      {
        v243 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v239, 0);
        objc_msgSend(v237, "setObject:forKeyedSubscript:", v243, v238);
      }

      v258 = v237;
    }
    else
    {
      v237 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v235, 0);
      v258 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v237, v234, 0);
      objc_msgSend(v232, "setObject:forKeyedSubscript:", v258, v233);
    }

    v231 = v290;
  }

}

- (void)_enumerateCurrentApplicationUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4 focalOnly:(BOOL)a5 block:(id)a6
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(id, void *, id, void *, uint64_t);
  id obj;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v36 = a5;
  v50 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v40 = a4;
  v34 = (void (**)(id, void *, id, void *, uint64_t))a6;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForAppUsageDataDictionaries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageQuerying context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v32 = v10;
    v33 = v9;
    objc_msgSend(MEMORY[0x24BE1B180], "appUsageBundleID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "appUsageStartDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "isUsageTrusted");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "appUsageType");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v31 = v11;
    obj = v11;
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v44)
    {
      v42 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v46 != v42)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v43, v31);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (!v14 || (v16 = objc_msgSend(v14, "integerValue"), !v36) || v16 == 1)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", v39);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v38);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v37);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)v19;
            v21 = (void *)MEMORY[0x24BDBD1C8];
            if (v19)
              v21 = (void *)v19;
            v22 = v21;

            v23 = v41;
            v24 = v18;
            v25 = v40;
            objc_msgSend(v23, "startDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "laterDate:", v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "endDate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "earlierDate:", v25);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v27, "compare:", v29) == 1)
              v30 = 0;
            else
              v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v27, v29);

            if (v30)
              v34[2](v34, v30, v24, v17, objc_msgSend(v22, "BOOLValue"));

          }
        }
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v44);
    }

    v10 = v32;
    v9 = v33;
    v11 = v31;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    -[USUsageQuerying _currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:].cold.1();
  }

}

- (id)_getWebDomainsFromWebUsageEvents:(id)a3 videoUsageEvents:(id)a4 interval:(id)a5 referenceDate:(id)a6 focalOnly:(BOOL)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v34;
  id v35;
  _BOOL4 v36;
  id v37;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v36 = a7;
  v53 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v37 = a6;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B078], "webDomain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "metadata");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          objc_msgSend(v13, "addObject:", v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v17);
  }

  if (v11)
  {
    v34 = v12;
    objc_msgSend(MEMORY[0x24BE1B010], "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v35 = v11;
    v23 = v11;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v44 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "metadata");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "host");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend(v13, "addObject:", v30);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v25);
    }

    v12 = v34;
    v11 = v35;
  }
  v31 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __102__USUsageQuerying__getWebDomainsFromWebUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke;
  v41[3] = &unk_24C7DB2E8;
  v32 = v13;
  v42 = v32;
  -[USUsageQuerying _enumerateCurrentWebUsageIntervalsDuringInterval:referenceDate:focalOnly:block:](self, "_enumerateCurrentWebUsageIntervalsDuringInterval:referenceDate:focalOnly:block:", v12, v37, v36, v41);
  if (v11)
  {
    v39[0] = v31;
    v39[1] = 3221225472;
    v39[2] = __102__USUsageQuerying__getWebDomainsFromWebUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke_2;
    v39[3] = &unk_24C7DB248;
    v40 = v32;
    -[USUsageQuerying _enumerateCurrentVideoUsageIntervalsDuringInterval:referenceDate:block:](self, "_enumerateCurrentVideoUsageIntervalsDuringInterval:referenceDate:block:", v12, v37, v39);

  }
  return v32;
}

void __102__USUsageQuerying__getWebDomainsFromWebUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "duration");
  if (v5 > 0.0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __102__USUsageQuerying__getWebDomainsFromWebUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  double v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(a2, "duration");
  v8 = v9;
  if (v9 && v7 > 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    v8 = v9;
  }

}

- (id)_computeWebUsageWithEvents:(id)a3 timeZoneByDevice:(id)a4 lastEventDateByDevice:(id)a5 categoryUsageIntervalsByDevice:(id)a6 aggregatedApplicationUsageIntervalsByDevice:(id)a7 aggregatedWebUsageIntervalsByDevice:(id)a8 categoryByWebDomain:(id)a9 partition:(id)a10 referenceDate:(id)a11 focalOnly:(BOOL)a12
{
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[5];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  _QWORD v71[5];
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  USUsageQuerying *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;

  v59 = a4;
  v61 = a5;
  v18 = a6;
  v50 = a7;
  v55 = a8;
  v57 = a9;
  v19 = a10;
  v53 = a11;
  v52 = a3;
  v20 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B078], "webDomain");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B078], "isUsageTrusted");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B010], "URL");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B130], "appMediaUsageStream");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "endDate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x24BDAC760];
  v79[1] = 3221225472;
  v79[2] = __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke;
  v79[3] = &unk_24C7DB310;
  v80 = v23;
  v81 = v48;
  v82 = v47;
  v83 = v19;
  v84 = v21;
  v85 = self;
  v24 = v20;
  v86 = v24;
  v25 = v18;
  v87 = v25;
  v26 = v50;
  v88 = v26;
  v27 = v55;
  v89 = v27;
  v51 = v57;
  v90 = v51;
  v28 = v59;
  v91 = v28;
  v29 = v61;
  v92 = v29;
  v62 = v21;
  v30 = v19;
  v60 = v47;
  v58 = v48;
  v56 = v23;
  -[USUsageQuerying _enumerateEvents:intervalEndDate:block:](self, "_enumerateEvents:intervalEndDate:block:", v52, v49, v79);

  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke_2;
  v71[3] = &unk_24C7DB338;
  v71[4] = self;
  v31 = v24;
  v72 = v31;
  v32 = v25;
  v73 = v32;
  v33 = v26;
  v74 = v33;
  v34 = v27;
  v75 = v34;
  v35 = v51;
  v76 = v35;
  v36 = v28;
  v77 = v36;
  v37 = v29;
  v78 = v37;
  -[USUsageQuerying _enumerateCurrentWebUsageIntervalsDuringInterval:referenceDate:focalOnly:block:](self, "_enumerateCurrentWebUsageIntervalsDuringInterval:referenceDate:focalOnly:block:", v30, v53, a12, v71);
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke_3;
  v63[3] = &unk_24C7DB360;
  v63[4] = self;
  v38 = v31;
  v64 = v38;
  v65 = v32;
  v66 = v33;
  v67 = v34;
  v68 = v35;
  v69 = v36;
  v70 = v37;
  v54 = v37;
  v39 = v36;
  v40 = v35;
  v41 = v34;
  v42 = v33;
  v43 = v32;
  -[USUsageQuerying _enumerateCurrentVideoUsageIntervalsDuringInterval:referenceDate:block:](self, "_enumerateCurrentVideoUsageIntervalsDuringInterval:referenceDate:block:", v30, v53, v63);

  v44 = v70;
  v45 = v38;

  return v45;
}

void __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;

  v31 = a2;
  objc_msgSend(v31, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncDeviceID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("LocalDevice");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(v31, "stream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v9, "isEqualToString:", a1[4]);
  objc_msgSend(v31, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v8)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", a1[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", a1[6]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v13)
  {
    v14 = (void *)a1[7];
    v15 = v31;
    v16 = v14;
    objc_msgSend(v16, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "laterDate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "endDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "earlierDate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "compare:", v22) == 1)
      v23 = 0;
    else
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v19, v22);

    if (v23)
    {
      objc_msgSend(v15, "metadata");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", a1[8]);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = (void *)MEMORY[0x24BDBD1C8];
      if (v25)
        v27 = (void *)v25;
      v28 = v27;

      v29 = (void *)a1[9];
      v30 = objc_msgSend(v28, "BOOLValue");

      objc_msgSend(v29, "_updateWebUsageWithInterval:webDomain:trustedWebUsage:deviceIdentifier:event:webUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByWebDomain:timeZoneByDevice:lastEventDateByDevice:", v23, v13, v30, v7, v15, a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16]);
    }

  }
}

uint64_t __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWebUsageWithInterval:webDomain:trustedWebUsage:deviceIdentifier:event:webUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByWebDomain:timeZoneByDevice:lastEventDateByDevice:", a2, a3, a5, CFSTR("LocalDevice"), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

uint64_t __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a5)
    return objc_msgSend(*(id *)(result + 32), "_updateWebUsageWithInterval:webDomain:trustedWebUsage:deviceIdentifier:event:webUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByWebDomain:timeZoneByDevice:lastEventDateByDevice:", a2, a5, a6, CFSTR("LocalDevice"), 0, *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 56), *(_QWORD *)(result + 64), *(_QWORD *)(result + 72), *(_QWORD *)(result + 80), *(_QWORD *)(result + 88));
  return result;
}

- (void)_updateWebUsageWithInterval:(id)a3 webDomain:(id)a4 trustedWebUsage:(BOOL)a5 deviceIdentifier:(id)a6 event:(id)a7 webUsageIntervalsByDevice:(id)a8 categoryUsageIntervalsByDevice:(id)a9 aggregatedApplicationUsageIntervalsByDevice:(id)a10 aggregatedWebUsageIntervalsByDevice:(id)a11 categoryByWebDomain:(id)a12 timeZoneByDevice:(id)a13 lastEventDateByDevice:(id)a14
{
  _BOOL8 v17;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t i;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *j;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  void *v118;
  id v119;
  id v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t k;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  id v146;
  void *v147;
  id v148;
  id v149;
  id v150;
  void *v151;
  id v152;
  id v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t m;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  id v172;
  id v173;
  id v174;
  void *v175;
  id v176;
  id v177;
  id v178;
  void *v179;
  id v180;
  id v181;
  id v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  uint64_t v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  uint64_t v200;
  void *v201;
  void *v202;
  id v203;
  id v204;
  id v205;
  id v206;
  void *v207;
  id v208;
  id v209;
  id v210;
  void *v211;
  id v212;
  id v213;
  id v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t n;
  void *v219;
  id v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  void *v230;
  id v231;
  id v232;
  id v233;
  id v234;
  void *v235;
  id v236;
  id v237;
  id v238;
  void *v239;
  id v240;
  id v241;
  id v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  id v261;
  id v262;
  id v263;
  id v264;
  id v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  id v272;
  id v273;
  id v274;
  id v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  id v282;
  id v283;
  id v284;
  id v285;
  id v286;
  id v287;
  id v288;
  id v289;
  id v290;
  id v291;
  id v292;
  id v293;
  id v294;
  id v295;
  id v296;
  id v297;
  id v298;
  id v299;
  id v300;
  id v301;
  id v302;
  id v303;
  id v304;
  id v305;
  id v306;
  id v307;
  id v308;
  id v309;
  id v310;
  id v311;
  id v312;
  id v313;
  id v314;
  id v315;
  id v316;
  id v317;
  id v318;
  id v319;
  id v320;
  id v321;
  id v322;
  id v323;
  id v324;
  void *v325;
  id v326;
  id v327;
  id v328;
  id v329;
  void *v330;
  void *v331;
  id v332;
  id v333;
  id v334;
  id v335;
  void *v336;
  _BOOL4 v337;
  id v338;
  id v339;
  id v340;
  id v341;
  void *v342;
  id v343;
  id v344;
  id v345;
  id v346;
  __int128 v347;
  id v348;
  id v349;
  id v350;
  id v351;
  id v352;
  id v353;
  id v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  uint64_t v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  _BYTE v367[128];
  uint64_t v368;

  v17 = a5;
  v368 = *MEMORY[0x24BDAC8D0];
  v354 = a3;
  v19 = a4;
  v20 = a6;
  v340 = a7;
  v21 = a8;
  v346 = a9;
  *((_QWORD *)&v347 + 1) = a10;
  *(_QWORD *)&v347 = a11;
  v341 = a12;
  v345 = a13;
  v344 = a14;
  v342 = v19;
  v337 = v17;
  +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v19, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21;
  v24 = v20;
  v25 = v22;
  v26 = v354;
  objc_msgSend(v23, "objectForKeyedSubscript:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v343 = v24;
  if (v27)
  {
    v28 = v27;
    v29 = v25;
    v30 = v26;
    objc_msgSend(v28, "objectForKeyedSubscript:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = v31;
      v352 = v30;
      v33 = v30;
      v363 = 0u;
      v364 = 0u;
      v365 = 0u;
      v366 = 0u;
      v34 = v32;
      v35 = (void *)objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
      if (v35)
      {
        v319 = v29;
        v326 = v28;
        v332 = v26;
        v348 = v25;
        v350 = v23;
        v36 = 0;
        v37 = *(_QWORD *)v364;
        v311 = v33;
        do
        {
          v38 = 0;
          v355 = v35;
          do
          {
            if (*(_QWORD *)v364 != v37)
              objc_enumerationMutation(v34);
            v39 = *(void **)(*((_QWORD *)&v363 + 1) + 8 * (_QWORD)v38);
            if (objc_msgSend(v39, "intersectsDateInterval:", v33))
            {
              v40 = v34;
              objc_msgSend(v39, "startDate");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "startDate");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "earlierDate:", v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v39, "endDate");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "endDate");
              v45 = (void *)v36;
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "laterDate:", v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              v36 = (uint64_t)v45;
              v48 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v43, v47);

              if (v45)
                objc_msgSend(v45, "addObject:", v39);
              else
                v36 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v39, 0);

              v33 = (id)v48;
              v34 = v40;
              v35 = v355;
            }
            v38 = (char *)v38 + 1;
          }
          while (v35 != v38);
          v35 = (void *)objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
        }
        while (v35);

        if (v36)
        {
          objc_msgSend(v34, "removeObjectsInArray:", v36);
          v23 = v350;
          v35 = (void *)v36;
        }
        else
        {
          v35 = 0;
          v23 = v350;
        }
        v25 = v348;
        v28 = v326;
        v26 = v332;
        v50 = v311;
        v29 = v319;
      }
      else
      {

        v50 = v33;
      }
      objc_msgSend(v34, "addObject:", v33);

      v24 = v343;
      v30 = v352;
    }
    else
    {
      v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v30, 0);
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v34, v29);
    }

  }
  else
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v26, 0);
    v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v49, v25, 0);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v28, v24);

  }
  v51 = v23;
  v52 = v25;
  v53 = v26;
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("AllDevices"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v349 = v53;
  v351 = v51;
  v353 = v52;
  if (v54)
  {
    v55 = v54;
    v56 = v52;
    v57 = v53;
    objc_msgSend(v55, "objectForKeyedSubscript:", v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      v59 = v58;
      v60 = v57;
      v363 = 0u;
      v364 = 0u;
      v365 = 0u;
      v366 = 0u;
      v61 = v59;
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
      if (v62)
      {
        v63 = v62;
        v320 = v57;
        v327 = v56;
        v333 = v55;
        v356 = 0;
        v64 = *(_QWORD *)v364;
        v312 = v60;
        v52 = v353;
        v65 = v61;
        do
        {
          for (i = 0; i != v63; ++i)
          {
            if (*(_QWORD *)v364 != v64)
              objc_enumerationMutation(v65);
            v67 = *(void **)(*((_QWORD *)&v363 + 1) + 8 * i);
            if (objc_msgSend(v67, "intersectsDateInterval:", v60))
            {
              objc_msgSend(v67, "startDate");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "startDate");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "earlierDate:", v69);
              v70 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v67, "endDate");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "endDate");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "laterDate:", v72);
              v73 = (void *)objc_claimAutoreleasedReturnValue();

              v74 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v70, v73);
              if (v356)
                objc_msgSend(v356, "addObject:", v67);
              else
                v356 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v67, 0);

              v60 = (id)v74;
              v51 = v351;
              v52 = v353;
            }
          }
          v63 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
        }
        while (v63);

        v75 = v356;
        if (v356)
          objc_msgSend(v65, "removeObjectsInArray:", v356);
        v24 = v343;
        v56 = v327;
        v55 = v333;
        v61 = v65;
        v76 = v312;
        v57 = v320;
      }
      else
      {

        v75 = 0;
        v76 = v60;
        v24 = v343;
        v52 = v353;
      }
      objc_msgSend(v61, "addObject:", v60);

      v53 = v349;
    }
    else
    {
      v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v57, 0);
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v61, v56);
    }

    v77 = v55;
  }
  else
  {
    v55 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v53, 0);
    v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v55, v52, 0);
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v77, CFSTR("AllDevices"));
  }

  if (v346)
  {
    objc_msgSend(v341, "objectForKeyedSubscript:", v342);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "identifier");
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = (void *)v79;
    v81 = (void *)*MEMORY[0x24BE157A8];
    if (v79)
      v81 = (void *)v79;
    v82 = v81;

    v83 = v346;
    v84 = v24;
    v85 = v82;
    v86 = v53;
    objc_msgSend(v83, "objectForKeyedSubscript:", v84);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87)
    {
      v334 = v84;
      v88 = v87;
      v89 = v85;
      v90 = v86;
      objc_msgSend(v88, "objectForKeyedSubscript:", v89);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      if (v91)
      {
        v321 = v89;
        v328 = v88;
        v92 = v91;
        v313 = v90;
        v93 = v90;
        v363 = 0u;
        v364 = 0u;
        v365 = 0u;
        v366 = 0u;
        v94 = v92;
        v95 = (void *)objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
        if (v95)
        {
          v293 = v86;
          v299 = v85;
          v305 = v83;
          v357 = 0;
          v96 = *(_QWORD *)v364;
          v288 = v93;
          v97 = v94;
          do
          {
            for (j = 0; j != v95; j = (char *)j + 1)
            {
              if (*(_QWORD *)v364 != v96)
                objc_enumerationMutation(v97);
              v99 = *(void **)(*((_QWORD *)&v363 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v99, "intersectsDateInterval:", v93))
              {
                objc_msgSend(v99, "startDate");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "startDate");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "earlierDate:", v101);
                v102 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v99, "endDate");
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "endDate");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v103, "laterDate:", v104);
                v105 = (void *)objc_claimAutoreleasedReturnValue();

                v106 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v102, v105);
                if (v357)
                  objc_msgSend(v357, "addObject:", v99);
                else
                  v357 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v99, 0);
                v53 = v349;

                v93 = (id)v106;
              }
            }
            v95 = (void *)objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
          }
          while (v95);

          v95 = v357;
          if (v357)
            objc_msgSend(v97, "removeObjectsInArray:", v357);
          v52 = v353;
          v85 = v299;
          v83 = v305;
          v94 = v97;
          v107 = v288;
          v86 = v293;
        }
        else
        {

          v107 = v93;
          v52 = v353;
        }
        objc_msgSend(v94, "addObject:", v93);

        v51 = v351;
        v89 = v321;
        v88 = v328;
        v110 = v313;
      }
      else
      {
        v94 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v90, 0);
        objc_msgSend(v88, "setObject:forKeyedSubscript:", v94, v89);
        v110 = v90;
        v52 = v353;
      }

      v108 = v88;
      v109 = v334;
    }
    else
    {
      v88 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v86, 0);
      v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v88, v85, 0);
      objc_msgSend(v83, "setObject:forKeyedSubscript:", v108, v84);
      v109 = v84;
      v52 = v353;
    }

    v111 = v83;
    v112 = v85;
    v113 = v86;
    objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (v114)
    {
      v115 = v114;
      v116 = v112;
      v117 = v113;
      objc_msgSend(v115, "objectForKeyedSubscript:", v116);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      if (v118)
      {
        v306 = v116;
        v314 = v115;
        v322 = v113;
        v329 = v112;
        v335 = v111;
        v119 = v118;
        v300 = v117;
        v120 = v117;
        v363 = 0u;
        v364 = 0u;
        v365 = 0u;
        v366 = 0u;
        v121 = v119;
        v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
        if (v122)
        {
          v123 = v122;
          v358 = 0;
          v124 = *(_QWORD *)v364;
          v294 = v120;
          do
          {
            for (k = 0; k != v123; ++k)
            {
              if (*(_QWORD *)v364 != v124)
                objc_enumerationMutation(v121);
              v126 = *(void **)(*((_QWORD *)&v363 + 1) + 8 * k);
              if (objc_msgSend(v126, "intersectsDateInterval:", v120))
              {
                objc_msgSend(v126, "startDate");
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "startDate");
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "earlierDate:", v128);
                v129 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v126, "endDate");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "endDate");
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v130, "laterDate:", v131);
                v132 = (void *)objc_claimAutoreleasedReturnValue();

                v133 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v129, v132);
                if (v358)
                  objc_msgSend(v358, "addObject:", v126);
                else
                  v358 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v126, 0);

                v120 = (id)v133;
              }
            }
            v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
          }
          while (v123);

          v53 = v349;
          v134 = v358;
          if (v358)
            objc_msgSend(v121, "removeObjectsInArray:", v358);
          v51 = v351;
          v52 = v353;
          v135 = v294;
        }
        else
        {

          v134 = 0;
          v135 = v120;
          v51 = v351;
        }
        objc_msgSend(v121, "addObject:", v120);

        v112 = v329;
        v111 = v335;
        v115 = v314;
        v113 = v322;
        v137 = v121;
        v117 = v300;
        v116 = v306;
      }
      else
      {
        v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v117, 0);
        objc_msgSend(v115, "setObject:forKeyedSubscript:", v137, v116);
      }

      v136 = v115;
    }
    else
    {
      v115 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v113, 0);
      v136 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v115, v112, 0);
      objc_msgSend(v111, "setObject:forKeyedSubscript:", v136, CFSTR("AllDevices"));
    }
    v24 = v343;

  }
  if (v347 != 0)
  {
    objc_msgSend(v341, "objectForKeyedSubscript:", v342);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v138;
    if (*((_QWORD *)&v347 + 1))
    {
      objc_msgSend(v138, "canonicalBundleIdentifier");
      v140 = objc_claimAutoreleasedReturnValue();
      v141 = (void *)v140;
      if (v140)
      {
        v330 = v139;
        v336 = (void *)v140;
        +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v140, v337);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = *((id *)&v347 + 1);
        v144 = v24;
        v145 = v142;
        v146 = v53;
        objc_msgSend(v143, "objectForKeyedSubscript:", v144);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        if (v147)
        {
          v148 = v147;
          v149 = v145;
          v150 = v146;
          objc_msgSend(v148, "objectForKeyedSubscript:", v149);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          v323 = v145;
          if (v151)
          {
            v289 = v149;
            v295 = v148;
            v301 = v144;
            v307 = v146;
            v315 = v143;
            v152 = v151;
            v153 = v150;
            v363 = 0u;
            v364 = 0u;
            v365 = 0u;
            v366 = 0u;
            v154 = v152;
            v155 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
            v284 = v150;
            if (v155)
            {
              v156 = v155;
              v359 = 0;
              v157 = *(_QWORD *)v364;
              v282 = v153;
              do
              {
                for (m = 0; m != v156; ++m)
                {
                  if (*(_QWORD *)v364 != v157)
                    objc_enumerationMutation(v154);
                  v159 = *(void **)(*((_QWORD *)&v363 + 1) + 8 * m);
                  if (objc_msgSend(v159, "intersectsDateInterval:", v153))
                  {
                    v160 = v154;
                    objc_msgSend(v159, "startDate");
                    v161 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v153, "startDate");
                    v162 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v161, "earlierDate:", v162);
                    v163 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v159, "endDate");
                    v164 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v153, "endDate");
                    v165 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v164, "laterDate:", v165);
                    v166 = (void *)objc_claimAutoreleasedReturnValue();

                    v167 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v163, v166);
                    if (v359)
                      objc_msgSend(v359, "addObject:", v159);
                    else
                      v359 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v159, 0);
                    v53 = v349;

                    v153 = (id)v167;
                    v154 = v160;
                  }
                }
                v156 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
              }
              while (v156);

              v168 = v359;
              if (v359)
                objc_msgSend(v154, "removeObjectsInArray:", v359);
              v24 = v343;
              v149 = v289;
              v169 = v282;
            }
            else
            {

              v168 = 0;
              v169 = v153;
              v24 = v343;
              v149 = v289;
            }
            objc_msgSend(v154, "addObject:", v153);

            v51 = v351;
            v146 = v307;
            v143 = v315;
            v148 = v295;
            v171 = v301;
            v150 = v284;
          }
          else
          {
            v171 = v144;
            v154 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v150, 0);
            objc_msgSend(v148, "setObject:forKeyedSubscript:", v154, v149);
          }

          v170 = v148;
          v144 = v171;
          v145 = v323;
        }
        else
        {
          v148 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v146, 0);
          v170 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v148, v145, 0);
          objc_msgSend(v143, "setObject:forKeyedSubscript:", v170, v144);
        }

        v172 = v143;
        v173 = v145;
        v174 = v146;
        objc_msgSend(v172, "objectForKeyedSubscript:", CFSTR("AllDevices"));
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        if (v175)
        {
          v176 = v175;
          v177 = v173;
          v178 = v174;
          objc_msgSend(v176, "objectForKeyedSubscript:", v177);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          v316 = v172;
          if (v179)
          {
            v296 = v177;
            v302 = v176;
            v308 = v174;
            v324 = v173;
            v180 = v179;
            v290 = v178;
            v181 = v178;
            v363 = 0u;
            v364 = 0u;
            v365 = 0u;
            v366 = 0u;
            v182 = v180;
            v183 = (void *)objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
            if (v183)
            {
              v184 = 0;
              v185 = *(_QWORD *)v364;
              v285 = v181;
              do
              {
                v186 = 0;
                v360 = v183;
                do
                {
                  if (*(_QWORD *)v364 != v185)
                    objc_enumerationMutation(v182);
                  v187 = *(void **)(*((_QWORD *)&v363 + 1) + 8 * (_QWORD)v186);
                  if (objc_msgSend(v187, "intersectsDateInterval:", v181))
                  {
                    objc_msgSend(v187, "startDate");
                    v188 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v181, "startDate");
                    v189 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v188, "earlierDate:", v189);
                    v190 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v187, "endDate");
                    v191 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v181, "endDate");
                    v192 = (void *)v184;
                    v193 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v191, "laterDate:", v193);
                    v194 = (void *)objc_claimAutoreleasedReturnValue();

                    v184 = (uint64_t)v192;
                    v195 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v190, v194);

                    if (v192)
                      objc_msgSend(v192, "addObject:", v187);
                    else
                      v184 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v187, 0);

                    v181 = (id)v195;
                    v183 = v360;
                  }
                  v186 = (char *)v186 + 1;
                }
                while (v183 != v186);
                v183 = (void *)objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
              }
              while (v183);

              v52 = v353;
              if (v184)
              {
                objc_msgSend(v182, "removeObjectsInArray:", v184);
                v53 = v349;
                v51 = v351;
                v183 = (void *)v184;
              }
              else
              {
                v183 = 0;
                v53 = v349;
                v51 = v351;
              }
              v199 = v285;
            }
            else
            {

              v199 = v181;
              v51 = v351;
              v52 = v353;
            }
            objc_msgSend(v182, "addObject:", v181);

            v24 = v343;
            v173 = v324;
            v176 = v302;
            v174 = v308;
            v198 = v182;
            v178 = v290;
            v177 = v296;
          }
          else
          {
            v198 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v178, 0);
            objc_msgSend(v176, "setObject:forKeyedSubscript:", v198, v177);
            v52 = v353;
          }

          v196 = v176;
          v197 = v316;
        }
        else
        {
          v176 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v174, 0);
          v196 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v176, v173, 0);
          objc_msgSend(v172, "setObject:forKeyedSubscript:", v196, CFSTR("AllDevices"));
          v197 = v172;
          v52 = v353;
        }

        v139 = v330;
        v141 = v336;
      }
    }
    else
    {
      v141 = 0;
    }
    if ((_QWORD)v347 && !v141)
    {
      objc_msgSend(v139, "primaryWebDomain");
      v200 = objc_claimAutoreleasedReturnValue();
      v201 = (void *)v200;
      if (v200)
      {
        v325 = (void *)v200;
        v331 = v139;
        +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v200, v337);
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        v203 = (id)v347;
        v204 = v24;
        v205 = v202;
        v206 = v53;
        objc_msgSend(v203, "objectForKeyedSubscript:", v204);
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        if (v207)
        {
          v208 = v207;
          v209 = v205;
          v210 = v206;
          objc_msgSend(v208, "objectForKeyedSubscript:", v209);
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          v338 = v205;
          if (v211)
          {
            v286 = v209;
            v297 = v208;
            v303 = v204;
            v309 = v206;
            v317 = v203;
            v212 = v211;
            v213 = v210;
            v363 = 0u;
            v364 = 0u;
            v365 = 0u;
            v366 = 0u;
            v214 = v212;
            v215 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
            v291 = v210;
            if (v215)
            {
              v216 = v215;
              v361 = 0;
              v217 = *(_QWORD *)v364;
              v283 = v213;
              do
              {
                for (n = 0; n != v216; ++n)
                {
                  if (*(_QWORD *)v364 != v217)
                    objc_enumerationMutation(v214);
                  v219 = *(void **)(*((_QWORD *)&v363 + 1) + 8 * n);
                  if (objc_msgSend(v219, "intersectsDateInterval:", v213))
                  {
                    v220 = v214;
                    objc_msgSend(v219, "startDate");
                    v221 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v213, "startDate");
                    v222 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v221, "earlierDate:", v222);
                    v223 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v219, "endDate");
                    v224 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v213, "endDate");
                    v225 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v224, "laterDate:", v225);
                    v226 = (void *)objc_claimAutoreleasedReturnValue();

                    v227 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v223, v226);
                    if (v361)
                      objc_msgSend(v361, "addObject:", v219);
                    else
                      v361 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v219, 0);

                    v213 = (id)v227;
                    v53 = v349;
                    v214 = v220;
                  }
                }
                v216 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
              }
              while (v216);

              v228 = v361;
              if (v361)
                objc_msgSend(v214, "removeObjectsInArray:", v361);
              v24 = v343;
              v229 = v283;
              v209 = v286;
            }
            else
            {

              v228 = 0;
              v229 = v213;
              v24 = v343;
              v209 = v286;
            }
            objc_msgSend(v214, "addObject:", v213);

            v51 = v351;
            v206 = v309;
            v203 = v317;
            v208 = v297;
            v231 = v303;
            v210 = v291;
          }
          else
          {
            v231 = v204;
            v214 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v210, 0);
            objc_msgSend(v208, "setObject:forKeyedSubscript:", v214, v209);
          }

          v230 = v208;
          v204 = v231;
          v205 = v338;
        }
        else
        {
          v208 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v206, 0);
          v230 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v208, v205, 0);
          objc_msgSend(v203, "setObject:forKeyedSubscript:", v230, v204);
        }

        v232 = v203;
        v233 = v205;
        v234 = v206;
        objc_msgSend(v232, "objectForKeyedSubscript:", CFSTR("AllDevices"));
        v235 = (void *)objc_claimAutoreleasedReturnValue();
        if (v235)
        {
          v236 = v235;
          v237 = v233;
          v238 = v234;
          objc_msgSend(v236, "objectForKeyedSubscript:", v237);
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          v318 = v232;
          if (v239)
          {
            v298 = v237;
            v304 = v236;
            v310 = v234;
            v339 = v233;
            v240 = v239;
            v292 = v238;
            v241 = v238;
            v363 = 0u;
            v364 = 0u;
            v365 = 0u;
            v366 = 0u;
            v242 = v240;
            v243 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
            if (v243)
            {
              v244 = v243;
              v245 = 0;
              v246 = *(_QWORD *)v364;
              v287 = v241;
              do
              {
                v247 = 0;
                v362 = v244;
                do
                {
                  if (*(_QWORD *)v364 != v246)
                    objc_enumerationMutation(v242);
                  v248 = *(void **)(*((_QWORD *)&v363 + 1) + 8 * v247);
                  if (objc_msgSend(v248, "intersectsDateInterval:", v241))
                  {
                    objc_msgSend(v248, "startDate");
                    v249 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v241, "startDate");
                    v250 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v249, "earlierDate:", v250);
                    v251 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v248, "endDate");
                    v252 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v241, "endDate");
                    v253 = v245;
                    v254 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v252, "laterDate:", v254);
                    v255 = (void *)objc_claimAutoreleasedReturnValue();

                    v245 = v253;
                    v256 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v251, v255);

                    if (v253)
                      objc_msgSend(v253, "addObject:", v248);
                    else
                      v245 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v248, 0);

                    v241 = (id)v256;
                    v244 = v362;
                  }
                  ++v247;
                }
                while (v244 != v247);
                v244 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v363, v367, 16);
              }
              while (v244);

              v53 = v349;
              v52 = v353;
              if (v245)
                objc_msgSend(v242, "removeObjectsInArray:", v245);
              v51 = v351;
              v257 = v287;
            }
            else
            {

              v245 = 0;
              v257 = v241;
              v51 = v351;
              v52 = v353;
            }
            objc_msgSend(v242, "addObject:", v241);

            v24 = v343;
            v233 = v339;
            v236 = v304;
            v234 = v310;
            v260 = v242;
            v238 = v292;
            v237 = v298;
          }
          else
          {
            v260 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v238, 0);
            objc_msgSend(v236, "setObject:forKeyedSubscript:", v260, v237);
            v52 = v353;
          }

          v258 = v236;
          v259 = v318;
        }
        else
        {
          v236 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v234, 0);
          v258 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v236, v233, 0);
          objc_msgSend(v232, "setObject:forKeyedSubscript:", v258, CFSTR("AllDevices"));
          v259 = v232;
          v52 = v353;
        }

        v201 = v325;
        v139 = v331;
      }

      v141 = 0;
    }

  }
  if (v345 && v344)
  {
    v261 = v345;
    v262 = v344;
    v263 = v340;
    v264 = v53;
    v265 = v24;
    objc_msgSend(v261, "objectForKeyedSubscript:", v265);
    v266 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v266)
    {
      objc_msgSend(v263, "timeZone");
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      if (v267)
      {
        objc_msgSend(v261, "setObject:forKeyedSubscript:", v267, v265);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v261, "setObject:forKeyedSubscript:", v268, v265);

      }
    }
    objc_msgSend(v264, "endDate");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v262, "objectForKeyedSubscript:", v265);
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    v271 = v270;
    if (!v270 || objc_msgSend(v270, "compare:", v269) == -1)
      objc_msgSend(v262, "setObject:forKeyedSubscript:", v269, v265);

    v272 = v261;
    v273 = v262;
    v274 = v263;
    v275 = v264;
    objc_msgSend(v272, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v276 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v343;
    if (!v276)
    {
      objc_msgSend(v274, "timeZone");
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      if (v277)
      {
        objc_msgSend(v272, "setObject:forKeyedSubscript:", v277, CFSTR("AllDevices"));
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v278 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v272, "setObject:forKeyedSubscript:", v278, CFSTR("AllDevices"));

      }
    }
    objc_msgSend(v275, "endDate");
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v273, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    v281 = v280;
    if (!v280 || objc_msgSend(v280, "compare:", v279) == -1)
      objc_msgSend(v273, "setObject:forKeyedSubscript:", v279, CFSTR("AllDevices"));

    v52 = v353;
  }

}

- (void)_enumerateCurrentWebUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4 focalOnly:(BOOL)a5 block:(id)a6
{
  _BOOL4 v7;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
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
  void (**v41)(id, void *, void *, void *, uint64_t);
  uint64_t v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  id obj;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v7 = a5;
  v58 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  v48 = a4;
  v41 = (void (**)(id, void *, void *, void *, uint64_t))a6;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForAppWebUsageDataDictionaries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageQuerying context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v38 = v11;
    v39 = v10;
    objc_msgSend(MEMORY[0x24BE1B180], "appWebUsageWebDomain");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "appWebUsageStartDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "isUsageTrusted");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "appWebUsageBundleID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "appWebUsageType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v37 = v12;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v54;
      v44 = v7;
      v42 = *(_QWORD *)v54;
      v43 = v13;
      do
      {
        v17 = 0;
        v50 = v15;
        do
        {
          if (*(_QWORD *)v54 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v17);
          objc_msgSend(v18, "objectForKeyedSubscript:", v13, v37);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "integerValue");
          v21 = objc_msgSend(v19, "integerValue");
          v22 = v20 == 1;
          if (!v7)
            v22 = v20 == 1 || v21 == 0;
          if (v22)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", v47);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v46);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v45);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = (void *)v24;
            v26 = (void *)MEMORY[0x24BDBD1C8];
            if (v24)
              v26 = (void *)v24;
            v27 = v26;

            v28 = v49;
            v29 = v23;
            v30 = v48;
            objc_msgSend(v28, "startDate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "laterDate:", v29);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "endDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "earlierDate:", v30);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v32, "compare:", v34) == 1)
              v35 = 0;
            else
              v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v32, v34);

            if (v35)
            {
              objc_msgSend(v18, "objectForKeyedSubscript:", v40);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v41[2](v41, v35, v52, v36, objc_msgSend(v27, "BOOLValue"));

            }
            v7 = v44;
            v16 = v42;
            v13 = v43;
            v15 = v50;
          }

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v15);
    }

    v11 = v38;
    v10 = v39;
    v12 = v37;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    -[USUsageQuerying _currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:].cold.1();
  }

}

- (void)_computeNowPlayingUsageWithEvents:(id)a3 categoryUsageIntervalsByDevice:(id)a4 timeZoneByDevice:(id)a5 lastEventDateByDevice:(id)a6 partition:(id)a7 referenceDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a7;
  v19 = a3;
  objc_msgSend(v18, "endDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __147__USUsageQuerying__computeNowPlayingUsageWithEvents_categoryUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_partition_referenceDate___block_invoke;
  v25[3] = &unk_24C7DB388;
  v25[4] = self;
  v24 = v14;
  v26 = v24;
  v21 = v15;
  v27 = v21;
  v22 = v16;
  v28 = v22;
  -[USUsageQuerying _enumerateEvents:intervalEndDate:block:](self, "_enumerateEvents:intervalEndDate:block:", v19, v20, v25);

  -[USUsageQuerying _currentNowPlayingUsageIntervalsDuringInterval:referenceDate:](self, "_currentNowPlayingUsageIntervalsDuringInterval:referenceDate:", v18, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    -[USUsageQuerying _updateNowPlayingUsageWithInterval:event:deviceIdentifier:categoryUsageIntervalsByDevice:timeZoneByDevice:lastEventDateByDevice:](self, "_updateNowPlayingUsageWithInterval:event:deviceIdentifier:categoryUsageIntervalsByDevice:timeZoneByDevice:lastEventDateByDevice:", v23, 0, CFSTR("LocalDevice"), v24, v21, v22);

}

void __147__USUsageQuerying__computeNowPlayingUsageWithEvents_categoryUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_partition_referenceDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncDeviceID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("LocalDevice");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  v9 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(v3, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);

  objc_msgSend(*(id *)(a1 + 32), "_updateNowPlayingUsageWithInterval:event:deviceIdentifier:categoryUsageIntervalsByDevice:timeZoneByDevice:lastEventDateByDevice:", v12, v3, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_updateNowPlayingUsageWithInterval:(id)a3 event:(id)a4 deviceIdentifier:(id)a5 categoryUsageIntervalsByDevice:(id)a6 timeZoneByDevice:(id)a7 lastEventDateByDevice:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t i;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  uint64_t v114;
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  id v119;
  id obj;
  id obja;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v113 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (v15)
  {
    v105 = v17;
    v18 = (void *)*MEMORY[0x24BE15790];
    v19 = v13;
    v20 = v15;
    v21 = v14;
    v22 = v18;
    v106 = v19;
    v23 = v19;
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = v24;
      v26 = v23;
      objc_msgSend(v25, "objectForKeyedSubscript:", v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v99 = v22;
        v101 = v20;
        v103 = v14;
        v28 = v27;
        v29 = v26;
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v125 = 0u;
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v122, v126, 16);
        v98 = v26;
        if (v30)
        {
          v31 = v30;
          v107 = v16;
          v110 = v15;
          obj = 0;
          v32 = *(_QWORD *)v123;
          v114 = *(_QWORD *)v123;
          v116 = v28;
          do
          {
            v33 = 0;
            v118 = v31;
            do
            {
              if (*(_QWORD *)v123 != v32)
                objc_enumerationMutation(v28);
              v34 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v33);
              if (objc_msgSend(v34, "intersectsDateInterval:", v29))
              {
                v35 = v25;
                v36 = v21;
                v37 = v23;
                objc_msgSend(v34, "startDate");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "startDate");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "earlierDate:", v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v34, "endDate");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "endDate");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "laterDate:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                v44 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v40, v43);
                if (obj)
                  objc_msgSend(obj, "addObject:", v34);
                else
                  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v34, 0);
                v23 = v37;

                v29 = (id)v44;
                v21 = v36;
                v25 = v35;
                v32 = v114;
                v28 = v116;
                v31 = v118;
              }
              ++v33;
            }
            while (v31 != v33);
            v31 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v122, v126, 16);
          }
          while (v31);
          v45 = obj;
          if (obj)
            objc_msgSend(v28, "removeObjectsInArray:", obj);
          v14 = v103;
          v16 = v107;
          v15 = v110;
        }
        else
        {
          v45 = 0;
        }
        objc_msgSend(v28, "addObject:", v29);

        v22 = v99;
        v20 = v101;
        v26 = v98;
      }
      else
      {
        v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v26, 0);
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, v22);
      }

    }
    else
    {
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v23, 0);
      v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v46, v22, 0);
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, v21);

    }
    v47 = v20;
    v48 = v22;
    v49 = v23;
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      v51 = v50;
      v52 = v49;
      objc_msgSend(v51, "objectForKeyedSubscript:", v48);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v106;
      if (v53)
      {
        v111 = v15;
        v104 = v14;
        v54 = v53;
        v55 = v52;
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v125 = 0u;
        obja = v54;
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v122, v126, 16);
        if (v56)
        {
          v57 = v56;
          v100 = v52;
          v102 = v51;
          v115 = v49;
          v117 = v48;
          v119 = v47;
          v108 = v16;
          v58 = 0;
          v59 = *(_QWORD *)v123;
          v60 = obja;
          do
          {
            for (i = 0; i != v57; ++i)
            {
              if (*(_QWORD *)v123 != v59)
                objc_enumerationMutation(v60);
              v62 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
              if (objc_msgSend(v62, "intersectsDateInterval:", v55))
              {
                objc_msgSend(v62, "startDate");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "startDate");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "earlierDate:", v64);
                v65 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v62, "endDate");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "endDate");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "laterDate:", v67);
                v68 = (void *)objc_claimAutoreleasedReturnValue();

                v69 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v65, v68);
                if (v58)
                  objc_msgSend(v58, "addObject:", v62);
                else
                  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v62, 0);

                v55 = (id)v69;
                v60 = obja;
              }
            }
            v57 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v122, v126, 16);
          }
          while (v57);
          if (v58)
            objc_msgSend(v60, "removeObjectsInArray:", v58);
          v51 = v102;
          v14 = v104;
          v16 = v108;
          v48 = v117;
          v47 = v119;
          v49 = v115;
          v70 = v60;
          v52 = v100;
        }
        else
        {
          v58 = 0;
          v70 = obja;
        }
        objc_msgSend(v70, "addObject:", v55);

        v13 = v106;
        v15 = v111;
      }
      else
      {
        v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v52, 0);
        objc_msgSend(v51, "setObject:forKeyedSubscript:", v70, v48);
      }

      v71 = v51;
    }
    else
    {
      v51 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v49, 0);
      v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v51, v48, 0);
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v71, CFSTR("AllDevices"));
      v13 = v106;
    }

    v17 = v105;
  }
  if (v16 && v17)
  {
    v109 = v16;
    v112 = v15;
    v72 = v17;
    v73 = v16;
    v74 = v72;
    v75 = v72;
    v76 = v113;
    v77 = v13;
    v78 = v14;
    v79 = v77;
    v80 = v78;
    v81 = v78;
    objc_msgSend(v73, "objectForKeyedSubscript:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v82)
    {
      objc_msgSend(v76, "timeZone");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (v83)
      {
        objc_msgSend(v73, "setObject:forKeyedSubscript:", v83, v81);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setObject:forKeyedSubscript:", v84, v81);

      }
    }
    objc_msgSend(v79, "endDate");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectForKeyedSubscript:", v81);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v86;
    if (!v86 || objc_msgSend(v86, "compare:", v85) == -1)
      objc_msgSend(v75, "setObject:forKeyedSubscript:", v85, v81);

    v88 = v73;
    v89 = v75;
    v90 = v76;
    v91 = v79;
    objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v92)
    {
      objc_msgSend(v90, "timeZone");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      if (v93)
      {
        objc_msgSend(v88, "setObject:forKeyedSubscript:", v93, CFSTR("AllDevices"));
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setObject:forKeyedSubscript:", v94, CFSTR("AllDevices"));

      }
    }
    objc_msgSend(v91, "endDate");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("AllDevices"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v96;
    if (!v96 || objc_msgSend(v96, "compare:", v95) == -1)
      objc_msgSend(v89, "setObject:forKeyedSubscript:", v95, CFSTR("AllDevices"));

    v14 = v80;
    v16 = v109;
    v15 = v112;
    v17 = v74;
  }

}

- (id)_currentNowPlayingUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNowPlayingDataDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageQuerying context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[USUsageQuerying _currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:].cold.1();
    goto LABEL_7;
  }
  if (!usageContextContainsPlayingQuickLookVideo(v10))
  {
LABEL_7:
    v19 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v9, "lastModifiedDateForContextualKeyPath:", v8);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = v7;
  objc_msgSend(v13, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)v12;
  objc_msgSend(v15, "laterDate:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "earlierDate:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "compare:", v18) == 1)
    v19 = 0;
  else
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v16, v18);

LABEL_10:
  return v19;
}

- (void)_enumerateCurrentVideoUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4 block:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  void (**v32)(id, void *, id, void *, void *, uint64_t);
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v38 = a4;
  v32 = (void (**)(id, void *, id, void *, void *, uint64_t))a5;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForAppMediaUsageDataDictionaries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageQuerying context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v29 = v9;
    v30 = v8;
    objc_msgSend(MEMORY[0x24BE1B180], "appMediaUsageBundleID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "appMediaUsageStartDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "appMediaUsageURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "isUsageTrusted");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v28 = v10;
    obj = v10;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v40)
    {
      v33 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v43 != v33)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", v37, v28);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v35);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "host");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v36);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v34);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          v18 = (void *)MEMORY[0x24BDBD1C8];
          if (v16)
            v18 = (void *)v16;
          v19 = v18;

          v20 = v39;
          v21 = v15;
          v22 = v38;
          objc_msgSend(v20, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "laterDate:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "endDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "earlierDate:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v24, "compare:", v26) == 1)
            v27 = 0;
          else
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v24, v26);

          if (v27)
            v32[2](v32, v27, v21, v41, v14, objc_msgSend(v19, "BOOLValue"));

        }
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v40);
    }

    v9 = v29;
    v8 = v30;
    v10 = v28;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    -[USUsageQuerying _currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:].cold.1();
  }

}

- (id)_computeNotificationsWithEvents:(id)a3 timeZoneByDevice:(id)a4 lastEventDateByDevice:(id)a5 partition:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  USUsageQuerying *v32;
  id v33;
  id v34;
  id v35;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B000], "appBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0D0], "bundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B078], "isUsageTrusted");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __100__USUsageQuerying__computeNotificationsWithEvents_timeZoneByDevice_lastEventDateByDevice_partition___block_invoke;
  v28[3] = &unk_24C7DB1F8;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = self;
  v19 = v14;
  v33 = v19;
  v34 = v10;
  v35 = v11;
  v20 = v11;
  v21 = v10;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  -[USUsageQuerying _enumerateEvents:intervalEndDate:block:](self, "_enumerateEvents:intervalEndDate:block:", v13, v18, v28);

  v25 = v35;
  v26 = v19;

  return v26;
}

void __100__USUsageQuerying__computeNotificationsWithEvents_timeZoneByDevice_lastEventDateByDevice_partition___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", a1[5]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v4;
  else
    v7 = (void *)v5;
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v20, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "syncDeviceID");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("LocalDevice");
    if (v10)
      v12 = (__CFString *)v10;
    v13 = v12;

    objc_msgSend(v3, "objectForKeyedSubscript:", a1[6]);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = (void *)MEMORY[0x24BDBD1C8];
    if (v14)
      v16 = (void *)v14;
    v17 = v16;

    v18 = (void *)a1[7];
    v19 = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v18, "_updateNotificationsWithEvent:bundleIdentifier:trustedNotification:deviceIdentifier:notificationsByDevice:timeZoneByDevice:lastEventDateByDevice:", v20, v8, v19, v13, a1[8], a1[9], a1[10]);
  }

}

- (void)_updateNotificationsWithEvent:(id)a3 bundleIdentifier:(id)a4 trustedNotification:(BOOL)a5 deviceIdentifier:(id)a6 notificationsByDevice:(id)a7 timeZoneByDevice:(id)a8 lastEventDateByDevice:(id)a9
{
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  v12 = a5;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", a4, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v16;
  v21 = v15;
  objc_msgSend(v20, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = v22;
    v24 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v22, "objectForKeyedSubscript:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "unsignedIntegerValue") + 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, v19);

  }
  else
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", &unk_24C7E0608, v19, 0);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, v21);
  }

  v27 = v20;
  v28 = v19;
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("AllDevices"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = v29;
    v31 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v29, "objectForKeyedSubscript:", v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v32, "unsignedIntegerValue") + 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, v28);

  }
  else
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", &unk_24C7E0608, v28, 0);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("AllDevices"));
  }

  v34 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(v14, "startDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v34, "initWithStartDate:endDate:", v35, v36);

  v38 = v17;
  v39 = v18;
  v40 = v14;
  v41 = v37;
  v42 = v21;
  objc_msgSend(v38, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
  {
    objc_msgSend(v40, "timeZone");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v44, v42);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v45, v42);

    }
  }
  objc_msgSend(v41, "endDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", v42);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (!v47 || objc_msgSend(v47, "compare:", v46) == -1)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v46, v42);

  v49 = v38;
  v50 = v39;
  v58 = v40;
  v51 = v41;
  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("AllDevices"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52)
  {
    objc_msgSend(v58, "timeZone");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v53, CFSTR("AllDevices"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v54, CFSTR("AllDevices"));

    }
  }
  objc_msgSend(v51, "endDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("AllDevices"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (!v56 || objc_msgSend(v56, "compare:", v55) == -1)
    objc_msgSend(v50, "setObject:forKeyedSubscript:", v55, CFSTR("AllDevices"));

}

- (void)_enumerateEvents:(id)a3 intervalEndDate:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__USUsageQuerying__enumerateEvents_intervalEndDate_block___block_invoke;
  v14[3] = &unk_24C7DB3B0;
  v15 = v7;
  v16 = v10;
  v17 = v8;
  v11 = v8;
  v12 = v10;
  v13 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);
  objc_msgSend(v9, "removeObjectsAtIndexes:", v12);

}

void __58__USUsageQuerying__enumerateEvents_intervalEndDate_block___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v13 = v7;
  objc_msgSend(v7, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  if (v10 == -1)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v13, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "compare:", *(_QWORD *)(a1 + 32));

    if (v12 == -1)
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (_CDUserContext)context
{
  return (_CDUserContext *)objc_getProperty(self, a2, 8, 1);
}

- (BMCoreDuetStream)duetStream
{
  return (BMCoreDuetStream *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duetStream, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

+ (void)queryUsageDuringInterval:(id)a3 partitionInterval:(double)a4 adjustedStartDate:(id)a5 eventStreams:(id)a6 categoryByBundleIdentifier:(id)a7 categoryByWebDomain:(id)a8 usageReportHandler:(id)a9 completionHandler:(id)a10
{
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  USUsageAccumulator *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  USUsageAccumulator *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v51[4];
  id v52;
  USUsageAccumulator *v53;
  id v54;
  _QWORD *v55;
  double v56;
  _QWORD v57[4];
  USUsageAccumulator *v58;
  id v59;
  id v60;
  id v61;
  _QWORD *v62;
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[4];
  USUsageAccumulator *v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v49 = a5;
  v48 = a6;
  v46 = a7;
  v47 = a8;
  v42 = a9;
  v43 = a10;
  v45 = v16;
  objc_msgSend(v16, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[USUsageAccumulator initWithApplicationCategories:webCategories:]([USUsageAccumulator alloc], "initWithApplicationCategories:webCategories:", v46, v47);
  if (objc_msgSend(v49, "compare:", v17) == -1)
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v49, v17, 0, 0, 0);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v48, "count"));
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v19 = v48;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v73;
      v22 = *MEMORY[0x24BE0C1B0];
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v73 != v21)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", v22);

          if ((v26 & 1) == 0)
            objc_msgSend(v18, "addObject:", v24);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      }
      while (v20);
    }

    objc_msgSend(a1, "_chronologicalPublisherWithOptions:eventStreams:", v41, v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke;
    v69[3] = &unk_24C7DB540;
    v70 = v41;
    v71 = a1;
    v66[0] = MEMORY[0x24BDAC760];
    v66[2] = __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_2;
    v66[3] = &unk_24C7DB568;
    v66[1] = 3221225472;
    v67 = v44;
    v68 = v17;
    v28 = v41;
    v29 = (id)objc_msgSend(v27, "sinkWithCompletion:receiveInput:", v69, v66);

  }
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__1;
  v64[4] = __Block_byref_object_dispose__1;
  v65 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v17, a4);
  v30 = objc_alloc(MEMORY[0x24BE0CC98]);
  objc_msgSend(v45, "endDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v17, v31, 0, 0, 0);

  objc_msgSend(a1, "_chronologicalPublisherWithOptions:eventStreams:", v32, v48);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x24BDAC760];
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_149;
  v57[3] = &unk_24C7DB590;
  v58 = v44;
  v62 = v64;
  v60 = v42;
  v63 = a1;
  v35 = v32;
  v59 = v35;
  v36 = v43;
  v61 = v36;
  v51[0] = v34;
  v51[1] = 3221225472;
  v51[2] = __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_2_150;
  v51[3] = &unk_24C7DB5B8;
  v55 = v64;
  v37 = v45;
  v52 = v37;
  v38 = v58;
  v53 = v38;
  v39 = v60;
  v54 = v39;
  v56 = a4;
  v40 = (id)objc_msgSend(v33, "sinkWithCompletion:receiveInput:", v57, v51);

  _Block_object_dispose(v64, 8);
}

uint64_t __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_completion:options:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "accumulateEvent:timestamp:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_149(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t result;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v3, "aggregateUsageForInterval:usageReportHandler:", v4, v5);
  objc_msgSend(*(id *)(a1 + 72), "_completion:options:", v6, *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_2_150(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "absoluteTimestamp"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = objc_alloc(MEMORY[0x24BDBCE60]);
    objc_msgSend(v3, "timestamp");
    v5 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "compare:", v7) == -1)
  {

  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "containsDate:", v5);

    if (v8)
    {
      if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containsDate:", v5) & 1) == 0)
      {
        do
        {
          objc_msgSend(*(id *)(a1 + 40), "aggregateUsageForInterval:usageReportHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "endDate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v9, *(double *)(a1 + 64));
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v12 = *(void **)(v11 + 40);
          *(_QWORD *)(v11 + 40) = v10;

        }
        while (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containsDate:", v5));
      }
      objc_msgSend(*(id *)(a1 + 40), "accumulateEvent:timestamp:", v3, v5);
      goto LABEL_12;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "eventBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Skipping event that occurred outside of the report interval %{public}@", (uint8_t *)&v14, 0xCu);

  }
LABEL_12:

}

+ (id)_chronologicalPublisherWithOptions:(id)a3 eventStreams:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "publisherWithOptions:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      v21 = v8;
      v23 = v5;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count") - 1);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v22 = v6;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v15, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqualToString:", v17);

            if ((v18 & 1) == 0)
            {
              objc_msgSend(v15, "publisherWithOptions:", v23);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v19);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v12);
      }

      objc_msgSend(v21, "orderedMergeWithOthers:comparator:", v9, &__block_literal_global);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v22;
      v5 = v23;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __74__USUsageQuerying_Biome___chronologicalPublisherWithOptions_eventStreams___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  objc_msgSend(v6, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v7, "absoluteTimestamp"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = objc_alloc(MEMORY[0x24BDBCE60]);
    objc_msgSend(v6, "timestamp");
    v8 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
  }

  v10 = v5;
  objc_msgSend(v10, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v11, "absoluteTimestamp"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13 = objc_alloc(MEMORY[0x24BDBCE60]);
    objc_msgSend(v10, "timestamp");
    v12 = (void *)objc_msgSend(v13, "initWithTimeIntervalSinceReferenceDate:");
  }

  v14 = objc_msgSend(v8, "compare:", v12);
  return v14;
}

+ (void)_completion:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "state");
  if (v7 == 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[USUsageQuerying(Biome) _completion:options:].cold.1((uint64_t)v6, v5);
  }
  else if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Successfully queried Biome for usage reports with options %{public}@", (uint8_t *)&v8, 0xCu);
  }

}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Looking up %lu application categories to build a usage report", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2_cold_2(uint8_t *buf, _BYTE *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Found notification event with no bundle ID. Skipping event", buf, 2u);
}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_29_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Looking up %lu web domain categories to build a usage report", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Looking up %lu application categories to determine remaining budget time", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_57_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Looking up %lu web domain categories to determine remaining budget time", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

void __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Looking up %lu web domain categories to report uncategorized web domain usage", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

- (void)_currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20D894000, MEMORY[0x24BDACB70], v0, "_CDClientContext has no knowledge of %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

@end
