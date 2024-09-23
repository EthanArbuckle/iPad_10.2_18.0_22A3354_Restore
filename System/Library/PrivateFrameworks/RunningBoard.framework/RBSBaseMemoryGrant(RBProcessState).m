@implementation RBSBaseMemoryGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  uint8_t buf[4];
  NSObject *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "memoryLimit");
  objc_msgSend(v8, "target");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "process");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;

LABEL_4:
    -[NSObject memoryLimits](v12, "memoryLimits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(a1, "strength");
    objc_msgSend(a1, "category");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "memoryLimitForCategory:strength:", v15, &v28);

    if (v9 == (_DWORD)v16)
    {
      v17 = v28;
      v18 = objc_msgSend(v7, "memoryLimitStrength");
      if (v17 <= v18)
        v19 = v18;
      else
        v19 = v17;
      objc_msgSend(v7, "setMemoryLimitStrength:", v19);
    }
    else if (v9 < (int)v16)
    {
      objc_msgSend(a1, "category");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMemoryLimitCategory:", v20);

      objc_msgSend(v7, "setMemoryLimitStrength:", v28);
      objc_msgSend(v7, "setMemoryLimit:", v16);
    }
    rbs_assertion_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "category");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v7, "memoryLimit");
      objc_msgSend(v8, "assertion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v30 = v12;
      v31 = 1024;
      v32 = v9;
      v33 = 1024;
      v34 = v16;
      v35 = 2112;
      v36 = v27;
      v37 = 1024;
      v38 = v24;
      v39 = 2112;
      v40 = v26;
      _os_log_debug_impl(&dword_21A8B4000, v21, OS_LOG_TYPE_DEBUG, "%@: StateLimit %d, attributeLimit %d(%@) -> %d (%@)", buf, 0x32u);

    }
    goto LABEL_14;
  }
  objc_msgSend(v8, "assertion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lock_targetProcessForAbstract");
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_4;
  rbs_assertion_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "assertion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v23;
    _os_log_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_INFO, "applying Base Memory Grant to process state without concrete target (%@)", buf, 0xCu);

  }
LABEL_14:

}

@end
