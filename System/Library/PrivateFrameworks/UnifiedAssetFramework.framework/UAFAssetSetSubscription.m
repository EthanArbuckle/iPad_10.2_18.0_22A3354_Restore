@implementation UAFAssetSetSubscription

- (id)init:(id)a3 assetSets:(id)a4 usageAliases:(id)a5
{
  return -[UAFAssetSetSubscription initWithName:assetSets:usageAliases:expires:](self, "initWithName:assetSets:usageAliases:expires:", a3, a4, a5, 0);
}

- (UAFAssetSetSubscription)initWithName:(id)a3 assetSets:(id)a4 usageAliases:(id)a5
{
  return -[UAFAssetSetSubscription initWithName:assetSets:usageAliases:expires:](self, "initWithName:assetSets:usageAliases:expires:", a3, a4, a5, 0);
}

- (UAFAssetSetSubscription)initWithName:(id)a3 assetSets:(id)a4 usageAliases:(id)a5 expires:(id)a6
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  UAFAssetSetSubscription *v15;
  id *p_isa;
  UAFAssetSetSubscription *v17;
  objc_super v19;

  v11 = a3;
  v12 = (unint64_t)a4;
  v13 = (unint64_t)a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)UAFAssetSetSubscription;
  v15 = -[UAFAssetSetSubscription init](&v19, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15 && v12 | v13)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    if (v12)
      objc_storeStrong(p_isa + 2, a4);
    if (v13)
      objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    v17 = p_isa;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetSets, CFSTR("assetSets"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_usageAliases, CFSTR("usageAliases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiration, CFSTR("expiration"));

}

- (UAFAssetSetSubscription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  UAFAssetSetSubscription *v16;
  const char *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("assetSets"));
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("usageAliases"));
    v13 = objc_claimAutoreleasedReturnValue();

    if (!(v9 | v13))
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = -[NSString UTF8String](self->_name, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v20 = "-[UAFAssetSetSubscription initWithCoder:]";
        v21 = 2080;
        v22 = v18;
        _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, "%s Decoding of the subscription %s failed: both asset sets and usage aliases are nil", buf, 0x16u);
      }

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self = (UAFAssetSetSubscription *)-[UAFAssetSetSubscription init:assetSets:usageAliases:expires:](self, "init:assetSets:usageAliases:expires:", v5, v9, v13, v15);

    v16 = self;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[UAFAssetSetSubscription initWithCoder:]";
      _os_log_error_impl(&dword_229282000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "%s Decoding of the asset set subscription name failed", buf, 0xCu);
    }
    v16 = 0;
  }

  return v16;
}

- (id)propertiesAsDictionary
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  -[UAFAssetSetSubscription expirationAsString](self, "expirationAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("name");
  -[UAFAssetSetSubscription name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UAFAssetSetSubscription name](self, "name");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24F1F9848;
  }
  v13[0] = v5;
  v12[1] = CFSTR("assetSets");
  -[UAFAssetSetSubscription assetSets](self, "assetSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UAFAssetSetSubscription assetSets](self, "assetSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1B8];
  }
  v13[1] = v7;
  v12[2] = CFSTR("usageAliases");
  -[UAFAssetSetSubscription usageAliases](self, "usageAliases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UAFAssetSetSubscription usageAliases](self, "usageAliases");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1B8];
  }
  v12[3] = CFSTR("expiration");
  v13[2] = v9;
  v13[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)

  if (v6)
  if (v4)

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  UAFAssetSetSubscription *v5;
  UAFAssetSetSubscription *v6;
  UAFAssetSetSubscription *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = (UAFAssetSetSubscription *)a3;
  v6 = v5;
  if (v5)
  {
    if (self == v5)
    {
      v14 = 1;
      goto LABEL_38;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[UAFAssetSetSubscription name](v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAFAssetSetSubscription name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqualToString:", v9))
      {
        v14 = 0;
LABEL_37:

        goto LABEL_38;
      }
      -[UAFAssetSetSubscription assetSets](v7, "assetSets");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        || (-[UAFAssetSetSubscription assetSets](self, "assetSets"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[UAFAssetSetSubscription assetSets](v7, "assetSets");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UAFAssetSetSubscription assetSets](self, "assetSets");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v11;
        if ((objc_msgSend(v11, "isEqual:", v12) & 1) == 0)
        {

          v14 = 0;
LABEL_34:
          if (!v10)

          goto LABEL_37;
        }
        v31 = v12;
        v13 = 1;
      }
      else
      {
        v13 = 0;
      }
      -[UAFAssetSetSubscription usageAliases](v7, "usageAliases");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15
        || (-[UAFAssetSetSubscription usageAliases](self, "usageAliases"),
            (v27 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v16 = v10;
        v17 = v15;
        v18 = v3;
        -[UAFAssetSetSubscription usageAliases](v7, "usageAliases");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UAFAssetSetSubscription usageAliases](self, "usageAliases");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v19;
        if (!objc_msgSend(v19, "isEqual:", v32))
        {
          v14 = 0;
          v3 = v18;
          v15 = v17;
          v10 = v16;
LABEL_29:

          goto LABEL_30;
        }
        v29 = 1;
        v30 = v13;
        v3 = v18;
        v15 = v17;
        v10 = v16;
      }
      else
      {
        v29 = 0;
        v30 = v13;
        v27 = 0;
      }
      -[UAFAssetSetSubscription expiration](v7, "expiration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20
        || (-[UAFAssetSetSubscription expiration](self, "expiration"), (v25 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v28 = v3;
        -[UAFAssetSetSubscription expiration](v7, "expiration", v25, v27);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UAFAssetSetSubscription expiration](self, "expiration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v21, "isEqual:", v22);

        if (v20)
        {

          if (v29)
          {
            v3 = v28;
            v13 = v30;
            goto LABEL_29;
          }
          v3 = v28;
          v13 = v30;
LABEL_30:
          if (!v15)

          if (v13)
          {

          }
          goto LABEL_34;
        }
        v3 = v28;
        v23 = v26;
      }
      else
      {
        v23 = 0;
        v14 = 1;
      }

      v13 = v30;
      if ((v29 & 1) != 0)
        goto LABEL_29;
      goto LABEL_30;
    }
  }
  v14 = 0;
LABEL_38:

  return v14;
}

- (id)expirationAsString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  -[UAFAssetSetSubscription expiration](self, "expiration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeZone:", v5);

    -[UAFAssetSetSubscription expiration](self, "expiration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("never");
  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[UAFAssetSetSubscription name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFAssetSetSubscription assetSets](self, "assetSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFAssetSetSubscription usageAliases](self, "usageAliases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFAssetSetSubscription expirationAsString](self, "expirationAsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Subscription '%@' with assetSets %@ and usageAliases %@ expires: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isValid:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void **v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void **v55;
  uint64_t *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void **v64;
  uint64_t *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void **v74;
  uint64_t *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  const char *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  id *v90;
  id *v91;
  id obj;
  UAFAssetSetSubscription *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  void *v107;
  _QWORD v108[2];
  _QWORD v109[2];
  uint64_t v110;
  void *v111;
  _QWORD v112[2];
  _QWORD v113[2];
  uint8_t v114[128];
  uint8_t buf[4];
  const char *v116;
  __int16 v117;
  void *v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  void *v122;
  uint64_t v123;
  void *v124;
  _QWORD v125[2];
  _QWORD v126[2];
  _BYTE v127[128];
  uint64_t v128;
  void *v129;
  _QWORD v130[2];
  _QWORD v131[2];
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
  {
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  -[UAFAssetSetSubscription assetSets](self, "assetSets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v132, 16);
  v93 = self;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v103;
    v89 = v6;
    v90 = a4;
    v87 = *(_QWORD *)v103;
    while (2)
    {
      v10 = 0;
      v88 = v8;
      do
      {
        if (*(_QWORD *)v103 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v10);
        objc_msgSend(v6, "getAssetSet:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          if (v90)
          {
            v68 = (void *)MEMORY[0x24BDD1540];
            if (*v90)
            {
              v130[0] = *MEMORY[0x24BDD0FC8];
              v69 = (void *)MEMORY[0x24BDD17C8];
              -[UAFAssetSetSubscription name](self, "name");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "stringWithFormat:", CFSTR("Subscription %@ references unknown asset set %@"), v70, v11);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v130[1] = *MEMORY[0x24BDD1398];
              v72 = *v90;
              v131[0] = v71;
              v131[1] = v72;
              v73 = (void *)MEMORY[0x24BDBCE70];
              v74 = (void **)v131;
              v75 = v130;
              v76 = 2;
            }
            else
            {
              v128 = *MEMORY[0x24BDD0FC8];
              v84 = (void *)MEMORY[0x24BDD17C8];
              -[UAFAssetSetSubscription name](self, "name");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "stringWithFormat:", CFSTR("Subscription %@ references unknown asset set %@"), v70, v11);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v129 = v71;
              v73 = (void *)MEMORY[0x24BDBCE70];
              v74 = &v129;
              v75 = &v128;
              v76 = 1;
            }
            objc_msgSend(v73, "dictionaryWithObjects:forKeys:count:", v74, v75, v76);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v85);
            *v90 = (id)objc_claimAutoreleasedReturnValue();

            self = v93;
          }
          UAFGetLogCategory((id *)&UAFLogContextConfiguration);
          v13 = objc_claimAutoreleasedReturnValue();
          v24 = obj;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            -[UAFAssetSetSubscription name](self, "name");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v116 = "-[UAFAssetSetSubscription isValid:error:]";
            v117 = 2112;
            v118 = v79;
            v119 = 2112;
            v120 = v11;
            v80 = "%s Subscription %@ references unknown asset set %@";
LABEL_62:
            _os_log_error_impl(&dword_229282000, v13, OS_LOG_TYPE_ERROR, v80, buf, 0x20u);

          }
          goto LABEL_38;
        }
        v13 = v12;
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        -[UAFAssetSetSubscription assetSets](self, "assetSets");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v11;
        objc_msgSend(v14, "objectForKeyedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v98, v127, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v99;
          while (2)
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v99 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
              -[NSObject usageTypes](v13, "usageTypes");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "containsObject:", v21);

              if ((v23 & 1) == 0)
              {
                v36 = v15;
                if (v90)
                {
                  v37 = (void *)MEMORY[0x24BDD1540];
                  if (*v90)
                  {
                    v125[0] = *MEMORY[0x24BDD0FC8];
                    v38 = (void *)MEMORY[0x24BDD17C8];
                    -[UAFAssetSetSubscription name](v93, "name");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "stringWithFormat:", CFSTR("Subscription %@ references unknown usage type %@ in asset set %@"), v39, v21, v15);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    v125[1] = *MEMORY[0x24BDD1398];
                    v41 = *v90;
                    v126[0] = v40;
                    v126[1] = v41;
                    v42 = (void *)MEMORY[0x24BDBCE70];
                    v43 = (void **)v126;
                    v44 = v125;
                    v45 = 2;
                  }
                  else
                  {
                    v123 = *MEMORY[0x24BDD0FC8];
                    v46 = (void *)MEMORY[0x24BDD17C8];
                    -[UAFAssetSetSubscription name](v93, "name");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "stringWithFormat:", CFSTR("Subscription %@ references unknown usage type %@ in asset set %@"), v39, v21, v15);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    v124 = v40;
                    v42 = (void *)MEMORY[0x24BDBCE70];
                    v43 = &v124;
                    v44 = &v123;
                    v45 = 1;
                  }
                  objc_msgSend(v42, "dictionaryWithObjects:forKeys:count:", v43, v44, v45);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v47);
                  *v90 = (id)objc_claimAutoreleasedReturnValue();

                }
                UAFGetLogCategory((id *)&UAFLogContextConfiguration);
                v48 = objc_claimAutoreleasedReturnValue();
                v24 = obj;
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  -[UAFAssetSetSubscription name](v93, "name");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315906;
                  v116 = "-[UAFAssetSetSubscription isValid:error:]";
                  v117 = 2112;
                  v118 = v67;
                  v119 = 2112;
                  v120 = v21;
                  v121 = 2112;
                  v122 = v36;
                  _os_log_error_impl(&dword_229282000, v48, OS_LOG_TYPE_ERROR, "%s Subscription %@ references unknown usage type %@ in asset set %@", buf, 0x2Au);

                }
                v6 = v89;
                goto LABEL_38;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v98, v127, 16);
            if (v18)
              continue;
            break;
          }
        }

        ++v10;
        v6 = v89;
        self = v93;
        v9 = v87;
      }
      while (v10 != v88);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v132, 16);
      a4 = v90;
      if (v8)
        continue;
      break;
    }
  }

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  -[UAFAssetSetSubscription usageAliases](self, "usageAliases");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
  if (v25)
  {
    v26 = v25;
    v91 = a4;
    v27 = *(_QWORD *)v95;
LABEL_21:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v95 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v28);
      objc_msgSend(v6, "getUsageAlias:", v29);
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
        break;
      v13 = v30;
      -[UAFAssetSetSubscription usageAliases](self, "usageAliases");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject values](v13, "values");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
        if (v91)
        {
          v58 = v6;
          v59 = (void *)MEMORY[0x24BDD1540];
          if (*v91)
          {
            v108[0] = *MEMORY[0x24BDD0FC8];
            v60 = (void *)MEMORY[0x24BDD17C8];
            -[UAFAssetSetSubscription name](v93, "name");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "stringWithFormat:", CFSTR("Subscription %@ references unknown value %@ in usage type %@"), v61, v32, v29);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v108[1] = *MEMORY[0x24BDD1398];
            v109[0] = v62;
            v109[1] = *v91;
            v63 = (void *)MEMORY[0x24BDBCE70];
            v64 = (void **)v109;
            v65 = v108;
            v66 = 2;
          }
          else
          {
            v106 = *MEMORY[0x24BDD0FC8];
            v81 = (void *)MEMORY[0x24BDD17C8];
            -[UAFAssetSetSubscription name](v93, "name");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "stringWithFormat:", CFSTR("Subscription %@ references unknown value %@ in usage type %@"), v61, v32, v29);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = v62;
            v63 = (void *)MEMORY[0x24BDBCE70];
            v64 = &v107;
            v65 = &v106;
            v66 = 1;
          }
          objc_msgSend(v63, "dictionaryWithObjects:forKeys:count:", v64, v65, v66);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v82);
          *v91 = (id)objc_claimAutoreleasedReturnValue();

          v6 = v58;
        }
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v83 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          -[UAFAssetSetSubscription name](v93, "name");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v116 = "-[UAFAssetSetSubscription isValid:error:]";
          v117 = 2112;
          v118 = v86;
          v119 = 2112;
          v120 = v32;
          v121 = 2112;
          v122 = v29;
          _os_log_error_impl(&dword_229282000, v83, OS_LOG_TYPE_ERROR, "%s Subscription %@ references unknown value %@ in usage type %@", buf, 0x2Au);

        }
        goto LABEL_38;
      }

      ++v28;
      self = v93;
      if (v26 == v28)
      {
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
        v35 = 1;
        if (v26)
          goto LABEL_21;
        goto LABEL_39;
      }
    }
    if (v91)
    {
      v50 = (void *)MEMORY[0x24BDD1540];
      if (*v91)
      {
        v112[0] = *MEMORY[0x24BDD0FC8];
        v51 = (void *)MEMORY[0x24BDD17C8];
        -[UAFAssetSetSubscription name](self, "name");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "stringWithFormat:", CFSTR("Subscription %@ references unknown usage alias %@"), v52, v29);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v112[1] = *MEMORY[0x24BDD1398];
        v113[0] = v53;
        v113[1] = *v91;
        v54 = (void *)MEMORY[0x24BDBCE70];
        v55 = (void **)v113;
        v56 = v112;
        v57 = 2;
      }
      else
      {
        v110 = *MEMORY[0x24BDD0FC8];
        v77 = (void *)MEMORY[0x24BDD17C8];
        -[UAFAssetSetSubscription name](self, "name");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "stringWithFormat:", CFSTR("Subscription %@ references unknown usage alias %@"), v52, v29);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v53;
        v54 = (void *)MEMORY[0x24BDBCE70];
        v55 = &v111;
        v56 = &v110;
        v57 = 1;
      }
      objc_msgSend(v54, "dictionaryWithObjects:forKeys:count:", v55, v56, v57);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v78);
      *v91 = (id)objc_claimAutoreleasedReturnValue();

      self = v93;
    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[UAFAssetSetSubscription name](self, "name");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v116 = "-[UAFAssetSetSubscription isValid:error:]";
      v117 = 2112;
      v118 = v79;
      v119 = 2112;
      v120 = v29;
      v80 = "%s Subscription %@ references unknown usage alias %@";
      goto LABEL_62;
    }
LABEL_38:

    v35 = 0;
  }
  else
  {
    v35 = 1;
  }
LABEL_39:

  return v35;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)assetSets
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)usageAliases
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)expiration
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_usageAliases, 0);
  objc_storeStrong((id *)&self->_assetSets, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
