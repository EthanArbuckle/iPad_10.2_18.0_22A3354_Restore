@implementation TFFeedbackDataContainer

- (TFFeedbackDataContainer)initWithName:(id)a3 includedGroupIdentifiers:(id)a4 loadingEntryIdentifiers:(id)a5 stringEntryMap:(id)a6 numberEntryMap:(id)a7 imageCollectionEntryMap:(id)a8 dirtyGroupIdentifiers:(id)a9 dirtyEntryIdentifiers:(id)a10
{
  id v16;
  id v17;
  TFFeedbackDataContainer *v18;
  uint64_t v19;
  NSString *name;
  id v21;
  const char *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *accessQueue;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v16 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v28 = a7;
  v27 = a8;
  v26 = a9;
  v17 = a10;
  v32.receiver = self;
  v32.super_class = (Class)TFFeedbackDataContainer;
  v18 = -[TFFeedbackDataContainer init](&v32, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v16, "copy");
    name = v18->_name;
    v18->_name = (NSString *)v19;

    objc_storeStrong((id *)&v18->_includedGroupIdentifiers, a4);
    objc_storeStrong((id *)&v18->_loadingEntryIdentifiers, a5);
    objc_storeStrong((id *)&v18->_stringEntryMap, a6);
    objc_storeStrong((id *)&v18->_numberEntryMap, a7);
    objc_storeStrong((id *)&v18->_imageCollectionEntryMap, a8);
    objc_storeStrong((id *)&v18->_dirtyGroupIdentifiers, a9);
    objc_storeStrong((id *)&v18->_dirtyEntryIdentifiers, a10);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.TestFlightCore.TFFeedbackDataContainer.%@"), v16);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    v23 = dispatch_queue_create(v22, MEMORY[0x24BDAC9C0]);
    accessQueue = v18->_accessQueue;
    v18->_accessQueue = (OS_dispatch_queue *)v23;

  }
  return v18;
}

- (TFFeedbackDataContainer)initWithName:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  TFFeedbackDataContainer *v13;

  v4 = (objc_class *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = -[TFFeedbackDataContainer initWithName:includedGroupIdentifiers:loadingEntryIdentifiers:stringEntryMap:numberEntryMap:imageCollectionEntryMap:dirtyGroupIdentifiers:dirtyEntryIdentifiers:](self, "initWithName:includedGroupIdentifiers:loadingEntryIdentifiers:stringEntryMap:numberEntryMap:imageCollectionEntryMap:dirtyGroupIdentifiers:dirtyEntryIdentifiers:", v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  id v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  NSObject *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  id v74;
  void *v75;
  NSObject *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  NSObject *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  id v91;
  void *v92;
  NSObject *v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  NSObject *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  id v109;
  void *v110;
  NSObject *v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  void *v118;
  NSObject *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint8_t buf[4];
  id v131;
  __int16 v132;
  void *v133;
  __int16 v134;
  void *v135;
  uint64_t v136;

  v136 = *MEMORY[0x24BDAC8D0];
  -[TFFeedbackDataContainer includedGroupIdentifiers](self, "includedGroupIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generatedLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v131 = (id)objc_opt_class();
      v6 = v131;
      _os_log_impl(&dword_2174E1000, v5, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property includedGroupIdentifiers", buf, 0xCu);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generatedLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      v11 = (void *)objc_opt_class();
      v12 = v11;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v131 = v9;
      v132 = 2114;
      v133 = v11;
      v134 = 2114;
      v135 = v13;
      v14 = v13;
      _os_log_impl(&dword_2174E1000, v8, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property includedGroupIdentifiers", buf, 0x20u);

    }
  }
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "generatedLogger");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v131 = v17;
    v18 = v17;
    _os_log_impl(&dword_2174E1000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property includedGroupIdentifiers", buf, 0xCu);

  }
  objc_msgSend(v3, "description");
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFFeedbackDataContainer loadingEntryIdentifiers](self, "loadingEntryIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "generatedLogger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v131 = v22;
      v23 = v22;
      _os_log_impl(&dword_2174E1000, v21, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property loadingEntryIdentifiers", buf, 0xCu);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "generatedLogger");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)objc_opt_class();
      v27 = v26;
      v28 = (void *)objc_opt_class();
      v29 = v28;
      v30 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v131 = v26;
      v132 = 2114;
      v133 = v28;
      v134 = 2114;
      v135 = v30;
      v31 = v30;
      _os_log_impl(&dword_2174E1000, v25, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property loadingEntryIdentifiers", buf, 0x20u);

    }
  }
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "generatedLogger");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v131 = v34;
    v35 = v34;
    _os_log_impl(&dword_2174E1000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property loadingEntryIdentifiers", buf, 0xCu);

  }
  objc_msgSend(v19, "description");
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFFeedbackDataContainer stringEntryMap](self, "stringEntryMap");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "generatedLogger");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v131 = v39;
      v40 = v39;
      _os_log_impl(&dword_2174E1000, v38, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property stringEntryMap", buf, 0xCu);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "generatedLogger");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = (void *)objc_opt_class();
      v44 = v43;
      v45 = (void *)objc_opt_class();
      v46 = v45;
      v47 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v131 = v43;
      v132 = 2114;
      v133 = v45;
      v134 = 2114;
      v135 = v47;
      v48 = v47;
      _os_log_impl(&dword_2174E1000, v42, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property stringEntryMap", buf, 0x20u);

    }
  }
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "generatedLogger");
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v131 = v51;
    v52 = v51;
    _os_log_impl(&dword_2174E1000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property stringEntryMap", buf, 0xCu);

  }
  objc_msgSend(v36, "description");
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFFeedbackDataContainer numberEntryMap](self, "numberEntryMap");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "generatedLogger");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v56 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v131 = v56;
      v57 = v56;
      _os_log_impl(&dword_2174E1000, v55, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property numberEntryMap", buf, 0xCu);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "generatedLogger");
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = (void *)objc_opt_class();
      v61 = v60;
      v62 = (void *)objc_opt_class();
      v63 = v62;
      v64 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v131 = v60;
      v132 = 2114;
      v133 = v62;
      v134 = 2114;
      v135 = v64;
      v65 = v64;
      _os_log_impl(&dword_2174E1000, v59, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property numberEntryMap", buf, 0x20u);

    }
  }
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "generatedLogger");
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v68 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v131 = v68;
    v69 = v68;
    _os_log_impl(&dword_2174E1000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property numberEntryMap", buf, 0xCu);

  }
  objc_msgSend(v53, "description");
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFFeedbackDataContainer imageCollectionEntryMap](self, "imageCollectionEntryMap");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v70)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "generatedLogger");
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      v73 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v131 = v73;
      v74 = v73;
      _os_log_impl(&dword_2174E1000, v72, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property imageCollectionEntryMap", buf, 0xCu);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "generatedLogger");
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      v77 = (void *)objc_opt_class();
      v78 = v77;
      v79 = (void *)objc_opt_class();
      v80 = v79;
      v81 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v131 = v77;
      v132 = 2114;
      v133 = v79;
      v134 = 2114;
      v135 = v81;
      v82 = v81;
      _os_log_impl(&dword_2174E1000, v76, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property imageCollectionEntryMap", buf, 0x20u);

    }
  }
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "generatedLogger");
  v84 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    v85 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v131 = v85;
    v86 = v85;
    _os_log_impl(&dword_2174E1000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property imageCollectionEntryMap", buf, 0xCu);

  }
  objc_msgSend(v70, "description");
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFFeedbackDataContainer dirtyGroupIdentifiers](self, "dirtyGroupIdentifiers");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v87)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "generatedLogger");
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      v90 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v131 = v90;
      v91 = v90;
      _os_log_impl(&dword_2174E1000, v89, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property dirtyGroupIdentifiers", buf, 0xCu);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "generatedLogger");
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      v94 = (void *)objc_opt_class();
      v95 = v94;
      v96 = (void *)objc_opt_class();
      v97 = v96;
      v98 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v131 = v94;
      v132 = 2114;
      v133 = v96;
      v134 = 2114;
      v135 = v98;
      v99 = v98;
      _os_log_impl(&dword_2174E1000, v93, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property dirtyGroupIdentifiers", buf, 0x20u);

    }
  }
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "generatedLogger");
  v101 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
  {
    v102 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v131 = v102;
    v103 = v102;
    _os_log_impl(&dword_2174E1000, v101, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property dirtyGroupIdentifiers", buf, 0xCu);

  }
  objc_msgSend(v87, "description");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFFeedbackDataContainer dirtyEntryIdentifiers](self, "dirtyEntryIdentifiers");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v105)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "generatedLogger");
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      v108 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v131 = v108;
      v109 = v108;
      _os_log_impl(&dword_2174E1000, v107, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property dirtyEntryIdentifiers", buf, 0xCu);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "generatedLogger");
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      v112 = (void *)objc_opt_class();
      v113 = v112;
      v114 = (void *)objc_opt_class();
      v115 = v114;
      v116 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v131 = v112;
      v132 = 2114;
      v133 = v114;
      v134 = 2114;
      v135 = v116;
      v117 = v116;
      _os_log_impl(&dword_2174E1000, v111, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property dirtyEntryIdentifiers", buf, 0x20u);

    }
  }
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "generatedLogger");
  v119 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
  {
    v120 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v131 = v120;
    v121 = v120;
    _os_log_impl(&dword_2174E1000, v119, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property dirtyEntryIdentifiers", buf, 0xCu);

  }
  objc_msgSend(v105, "description");
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("includedGroupIdentifiers: %@\nloadingEntryIdentifiers: %@\nstringEntryMap: %@\nnumberEntryMap: %@\nimageCollectionEntryMap: %@\ndirtyGroupIdentifiers: %@\ndirtyEntryIdentifiers: %@\n"), v129, v128, v127, v126, v125, v104, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v123;
}

- (void)prepareInitialValuesForForm:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  TFFeedbackDataContainer *v9;

  v4 = a3;
  -[TFFeedbackDataContainer accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__TFFeedbackDataContainer_prepareInitialValuesForForm___block_invoke;
  block[3] = &unk_24D794740;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

void __55__TFFeedbackDataContainer_prepareInitialValuesForForm___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "entryGroups", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = (objc_msgSend(v7, "election") & 0xFFFFFFFFFFFFFFFDLL) == 0;
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v7, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setGroupInclusionForIdentifier:toValue:", v10, v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (BOOL)isGroupWithIdentifierIncluded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[TFFeedbackDataContainer accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__TFFeedbackDataContainer_isGroupWithIdentifierIncluded___block_invoke;
  block[3] = &unk_24D7947B8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __57__TFFeedbackDataContainer_isGroupWithIdentifierIncluded___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "includedGroupIdentifiers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (BOOL)isEntryWithIdentifierLoading:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[TFFeedbackDataContainer accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__TFFeedbackDataContainer_isEntryWithIdentifierLoading___block_invoke;
  block[3] = &unk_24D7947B8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __56__TFFeedbackDataContainer_isEntryWithIdentifierLoading___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "loadingEntryIdentifiers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (id)stringForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[TFFeedbackDataContainer accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__TFFeedbackDataContainer_stringForIdentifier___block_invoke;
  block[3] = &unk_24D7947B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__TFFeedbackDataContainer_stringForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "stringEntryMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)numberForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[TFFeedbackDataContainer accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__TFFeedbackDataContainer_numberForIdentifier___block_invoke;
  block[3] = &unk_24D7947B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__TFFeedbackDataContainer_numberForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "numberEntryMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)imageCollectionForIdentifer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[TFFeedbackDataContainer accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__TFFeedbackDataContainer_imageCollectionForIdentifer___block_invoke;
  block[3] = &unk_24D7947B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__TFFeedbackDataContainer_imageCollectionForIdentifer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "imageCollectionEntryMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isLoading
{
  TFFeedbackDataContainer *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[TFFeedbackDataContainer accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__TFFeedbackDataContainer_isLoading__block_invoke;
  v5[3] = &unk_24D7947E0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __36__TFFeedbackDataContainer_isLoading__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "loadingEntryIdentifiers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count") != 0;

}

- (void)performBatchUpdates:(id)a3
{
  -[TFFeedbackDataContainer performBatchUpdates:suppressingNotifications:](self, "performBatchUpdates:suppressingNotifications:", a3, 0);
}

- (void)performBatchUpdates:(id)a3 suppressingNotifications:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[TFFeedbackDataContainer accessQueue](self, "accessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__TFFeedbackDataContainer_performBatchUpdates_suppressingNotifications___block_invoke;
  block[3] = &unk_24D794808;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_barrier_sync(v7, block);

}

void __72__TFFeedbackDataContainer_performBatchUpdates_suppressingNotifications___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_clearDirtyIdentifiers");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generatedLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (void *)objc_opt_class();
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v4;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_2174E1000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: [%@] performBatchUpdates did update:\n%@", (uint8_t *)&v9, 0x20u);

  }
  if (!*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserverOfUpdates");
}

- (void)setGroupInclusionForIdentifier:(id)a3 toValue:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v9 = v6;
    -[TFFeedbackDataContainer includedGroupIdentifiers](self, "includedGroupIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
      objc_msgSend(v7, "addObject:", v9);
    else
      objc_msgSend(v7, "removeObject:", v9);

    -[TFFeedbackDataContainer _markGroupIdentifierDirty:](self, "_markGroupIdentifierDirty:", v9);
    v6 = v9;
  }

}

- (void)setEntryLoadingForIdentifier:(id)a3 toValue:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v9 = v6;
    -[TFFeedbackDataContainer loadingEntryIdentifiers](self, "loadingEntryIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
      objc_msgSend(v7, "addObject:", v9);
    else
      objc_msgSend(v7, "removeObject:", v9);

    -[TFFeedbackDataContainer _markEntryIdentifierDirty:](self, "_markEntryIdentifierDirty:", v9);
    v6 = v9;
  }

}

- (void)setStringForIdentifier:(id)a3 toValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    if (v6)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[TFFeedbackDataContainer stringEntryMap](self, "stringEntryMap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    }
    else
    {
      -[TFFeedbackDataContainer stringEntryMap](self, "stringEntryMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v9);
    }

    -[TFFeedbackDataContainer _markEntryIdentifierDirty:](self, "_markEntryIdentifierDirty:", v9);
  }

}

- (void)setNumberForIdentifier:(id)a3 toValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    if (v6)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[TFFeedbackDataContainer numberEntryMap](self, "numberEntryMap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    }
    else
    {
      -[TFFeedbackDataContainer numberEntryMap](self, "numberEntryMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v9);
    }

    -[TFFeedbackDataContainer _markEntryIdentifierDirty:](self, "_markEntryIdentifierDirty:", v9);
  }

}

- (void)setImageCollectionForIdentifier:(id)a3 toValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    if (v6)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[TFFeedbackDataContainer imageCollectionEntryMap](self, "imageCollectionEntryMap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    }
    else
    {
      -[TFFeedbackDataContainer imageCollectionEntryMap](self, "imageCollectionEntryMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v9);
    }

    -[TFFeedbackDataContainer _markEntryIdentifierDirty:](self, "_markEntryIdentifierDirty:", v9);
  }

}

- (void)overwriteWithContentsOfDataContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v4, "stringEntryMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v4, "stringForIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TFFeedbackDataContainer setStringForIdentifier:toValue:](self, "setStringForIdentifier:toValue:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v8);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v4, "numberEntryMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v4, "numberForIdentifier:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[TFFeedbackDataContainer setNumberForIdentifier:toValue:](self, "setNumberForIdentifier:toValue:", v19, v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v16);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "imageCollectionEntryMap", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k);
        objc_msgSend(v4, "imageCollectionForIdentifer:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[TFFeedbackDataContainer setImageCollectionForIdentifier:toValue:](self, "setImageCollectionForIdentifier:toValue:", v27, v28);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v24);
  }

}

- (void)_markGroupIdentifierDirty:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TFFeedbackDataContainer dirtyGroupIdentifiers](self, "dirtyGroupIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    -[TFFeedbackDataContainer dirtyGroupIdentifiers](self, "dirtyGroupIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (void)_markEntryIdentifierDirty:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TFFeedbackDataContainer dirtyEntryIdentifiers](self, "dirtyEntryIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    -[TFFeedbackDataContainer dirtyEntryIdentifiers](self, "dirtyEntryIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (void)_clearDirtyIdentifiers
{
  void *v3;
  id v4;

  -[TFFeedbackDataContainer dirtyGroupIdentifiers](self, "dirtyGroupIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TFFeedbackDataContainer dirtyEntryIdentifiers](self, "dirtyEntryIdentifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)_notifyObserverOfUpdates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  -[TFFeedbackDataContainer dirtyGroupIdentifiers](self, "dirtyGroupIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[TFFeedbackDataContainer dirtyEntryIdentifiers](self, "dirtyEntryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[TFFeedbackDataContainer _clearDirtyIdentifiers](self, "_clearDirtyIdentifiers");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__TFFeedbackDataContainer__notifyObserverOfUpdates__block_invoke;
  block[3] = &unk_24D794830;
  block[4] = self;
  v10 = v4;
  v11 = v6;
  v7 = v6;
  v8 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __51__TFFeedbackDataContainer__notifyObserverOfUpdates__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedbackDataContainer:didUpdateValuesForGroupIdentifiers:entryIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[TFFeedbackDataContainer accessQueue](self, "accessQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__TFFeedbackDataContainer_copyWithZone___block_invoke;
  v7[3] = &unk_24D7947E0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_barrier_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __40__TFFeedbackDataContainer_copyWithZone___block_invoke(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  void *v13;
  TFFeedbackDataContainer *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v14 = [TFFeedbackDataContainer alloc];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "includedGroupIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "loadingEntryIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v17, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "stringEntryMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "numberEntryMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v15, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "imageCollectionEntryMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "dirtyGroupIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "dirtyEntryIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = -[TFFeedbackDataContainer initWithName:includedGroupIdentifiers:loadingEntryIdentifiers:stringEntryMap:numberEntryMap:imageCollectionEntryMap:dirtyGroupIdentifiers:dirtyEntryIdentifiers:](v14, "initWithName:includedGroupIdentifiers:loadingEntryIdentifiers:stringEntryMap:numberEntryMap:imageCollectionEntryMap:dirtyGroupIdentifiers:dirtyEntryIdentifiers:", v20, v19, v2, v3, v4, v6, v8, v10);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

- (TFFeedbackDataContainerObserver)observer
{
  return (TFFeedbackDataContainerObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NSString)name
{
  return self->_name;
}

- (NSMutableSet)includedGroupIdentifiers
{
  return self->_includedGroupIdentifiers;
}

- (NSMutableSet)loadingEntryIdentifiers
{
  return self->_loadingEntryIdentifiers;
}

- (NSMutableDictionary)stringEntryMap
{
  return self->_stringEntryMap;
}

- (NSMutableDictionary)numberEntryMap
{
  return self->_numberEntryMap;
}

- (NSMutableDictionary)imageCollectionEntryMap
{
  return self->_imageCollectionEntryMap;
}

- (NSMutableArray)dirtyGroupIdentifiers
{
  return self->_dirtyGroupIdentifiers;
}

- (NSMutableArray)dirtyEntryIdentifiers
{
  return self->_dirtyEntryIdentifiers;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_dirtyEntryIdentifiers, 0);
  objc_storeStrong((id *)&self->_dirtyGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageCollectionEntryMap, 0);
  objc_storeStrong((id *)&self->_numberEntryMap, 0);
  objc_storeStrong((id *)&self->_stringEntryMap, 0);
  objc_storeStrong((id *)&self->_loadingEntryIdentifiers, 0);
  objc_storeStrong((id *)&self->_includedGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_observer);
}

- (id)objectForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TFFeedbackDataContainer stringForIdentifier:](self, "stringForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[TFFeedbackDataContainer numberForIdentifier:](self, "numberForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[TFFeedbackDataContainer imageCollectionForIdentifer:](self, "imageCollectionForIdentifer:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

@end
