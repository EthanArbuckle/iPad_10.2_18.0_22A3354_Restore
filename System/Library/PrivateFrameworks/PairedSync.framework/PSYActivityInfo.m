@implementation PSYActivityInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backboardPrelaunchBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dependentBuddyStages, 0);
  objc_storeStrong((id *)&self->_dependentServices, 0);
  objc_storeStrong((id *)&self->_sessionTypes, 0);
  objc_storeStrong((id *)&self->_timeoutSeconds, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

+ (id)activityWithPlist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id obj;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _QWORD v51[4];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("Label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("MachServiceName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SessionTypes"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = 0x24BDBC000uLL;
      v38 = (void *)v7;
      v39 = v6;
      if (v7)
      {
        v9 = (void *)v7;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        obj = v9;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v47;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v47 != v12)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_24;
              v15 = v14;
              v16 = &unk_24C5EC068;
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Initial")) & 1) == 0)
              {
                v16 = &unk_24C5EC068;
                if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FullSync")) & 1) == 0)
                {
                  v16 = &unk_24C5EC080;
                  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Reunion")) & 1) == 0)
                  {
                    if (objc_msgSend(v15, "isEqualToString:", CFSTR("Migration")))
                      v16 = &unk_24C5EC098;
                    else
                      v16 = 0;
                  }
                }
              }

              if (!v16)
              {
LABEL_24:
                v17 = 0;
                v6 = v39;
                goto LABEL_43;
              }
              objc_msgSend(v41, "addObject:", v16);
            }
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
            v8 = 0x24BDBC000;
            if (v11)
              continue;
            break;
          }
        }

        v6 = v39;
      }
      else
      {
        v41 = 0;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("BackboardPrelaunchBundleIdentifier"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("DependentServices"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("DependentBuddyStages"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDBCF20];
      v51[0] = CFSTR("InstallAllAvailableAppsSelection");
      v51[1] = CFSTR("Activation");
      v51[2] = CFSTR("AppleID");
      v51[3] = CFSTR("ApplePay");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v19;
      v24 = objc_alloc_init(*(Class *)(v8 + 3768));
      if (objc_msgSend(v19, "count"))
      {
        v35 = v18;
        v36 = v5;
        v37 = v4;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v34 = v19;
        v25 = v19;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v43 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
              if (objc_msgSend(v22, "containsObject:", v30, v34, v35, v36, v37, v38))
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "buddyStageValueForString:", v30));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "addObject:", v31);

              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          }
          while (v27);
        }

        v5 = v36;
        v4 = v37;
        v6 = v39;
        v23 = v34;
        v18 = v35;
      }
      v17 = objc_alloc_init((Class)a1);
      objc_msgSend(v17, "setLabel:", v5);
      objc_msgSend(v17, "setMachServiceName:", v6);
      objc_msgSend(v17, "setBackboardPrelaunchBundleIdentifier:", obj);
      objc_msgSend(v17, "setSessionTypes:", v41);
      objc_msgSend(v17, "setDependentServices:", v18);
      if (objc_msgSend(v24, "count"))
        objc_msgSend(v17, "setDependentBuddyStages:", v24);
      objc_msgSend(v4, "objectForKey:", CFSTR("Timeout"), v34, v35, v36, v37);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v17, "setTimeoutSeconds:", v32);
      }

LABEL_43:
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setSessionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setMachServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDependentServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setBackboardPrelaunchBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

+ (unint64_t)buddyStageValueForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InstallAllAvailableAppsSelection")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Activation")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppleID")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ApplePay")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  -[PSYActivityInfo label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Label"));

  -[PSYActivityInfo machServiceName](self, "machServiceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MachServiceName"));

  -[PSYActivityInfo priority](self, "priority");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("Priority"));

  -[PSYActivityInfo backboardPrelaunchBundleIdentifier](self, "backboardPrelaunchBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("BackboardPrelaunchBundleIdentifier"));

  -[PSYActivityInfo timeoutSeconds](self, "timeoutSeconds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("Timeout"));

  -[PSYActivityInfo sessionTypes](self, "sessionTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("SessionTypes"));

  -[PSYActivityInfo dependentServices](self, "dependentServices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("DependentServices"));

  -[PSYActivityInfo dependentBuddyStages](self, "dependentBuddyStages");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("DependentBuddyStages"));

}

- (PSYActivityInfo)initWithCoder:(id)a3
{
  id v4;
  PSYActivityInfo *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  NSString *machServiceName;
  uint64_t v10;
  NSString *priority;
  uint64_t v12;
  NSString *backboardPrelaunchBundleIdentifier;
  uint64_t v14;
  NSNumber *timeoutSeconds;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *sessionTypes;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *dependentServices;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *dependentBuddyStages;
  objc_super v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PSYActivityInfo;
  v5 = -[PSYActivityInfo init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MachServiceName"));
    v8 = objc_claimAutoreleasedReturnValue();
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Priority"));
    v10 = objc_claimAutoreleasedReturnValue();
    priority = v5->_priority;
    v5->_priority = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BackboardPrelaunchBundleIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    backboardPrelaunchBundleIdentifier = v5->_backboardPrelaunchBundleIdentifier;
    v5->_backboardPrelaunchBundleIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Timeout"));
    v14 = objc_claimAutoreleasedReturnValue();
    timeoutSeconds = v5->_timeoutSeconds;
    v5->_timeoutSeconds = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("SessionTypes"));
    v19 = objc_claimAutoreleasedReturnValue();
    sessionTypes = v5->_sessionTypes;
    v5->_sessionTypes = (NSArray *)v19;

    v21 = (void *)MEMORY[0x24BDBCF20];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("DependentServices"));
    v24 = objc_claimAutoreleasedReturnValue();
    dependentServices = v5->_dependentServices;
    v5->_dependentServices = (NSArray *)v24;

    v26 = (void *)MEMORY[0x24BDBCF20];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithArray:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("DependentBuddyStages"));
    v29 = objc_claimAutoreleasedReturnValue();
    dependentBuddyStages = v5->_dependentBuddyStages;
    v5->_dependentBuddyStages = (NSArray *)v29;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSYActivityInfo label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSYActivityInfo machServiceName](self, "machServiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; label=%@; machServiceName=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)priority
{
  return self->_priority;
}

- (void)setPriority:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)sessionTypes
{
  return self->_sessionTypes;
}

- (NSArray)dependentServices
{
  return self->_dependentServices;
}

- (NSArray)dependentBuddyStages
{
  return self->_dependentBuddyStages;
}

- (void)setDependentBuddyStages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)backboardPrelaunchBundleIdentifier
{
  return self->_backboardPrelaunchBundleIdentifier;
}

@end
