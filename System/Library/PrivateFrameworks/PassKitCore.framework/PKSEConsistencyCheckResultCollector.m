@implementation PKSEConsistencyCheckResultCollector

- (PKSEConsistencyCheckResultCollector)init
{
  PKSEConsistencyCheckResultCollector *v2;
  NSMutableArray *v3;
  NSMutableArray *requestedActions;
  NSMutableDictionary *v5;
  NSMutableDictionary *resultSummary;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKSEConsistencyCheckResultCollector;
  v2 = -[PKSEConsistencyCheckResultCollector init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestedActions = v2->_requestedActions;
    v2->_requestedActions = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    resultSummary = v2->_resultSummary;
    v2->_resultSummary = v5;

    v2->_addCleanupActionsToResultsSummary = 1;
    v2->_sendCleanupReasons = os_variant_has_internal_ui();
  }
  return v2;
}

- (void)addCleanupActions:(int64_t)a3 cleanupReason:(id)a4 forDeviceCredential:(id)a5 passCredential:(id)a6
{
  id v10;
  id v11;
  PKSEConsistencyCheckRequestedAction *v12;
  void *v13;
  PKSEConsistencyCheckRequestedAction *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  int64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  id v71;

  v71 = a4;
  v10 = a5;
  v11 = a6;
  -[PKSEConsistencyCheckResultCollector addCleanupActions:](self, "addCleanupActions:", a3);
  if (a3 && v10)
  {
    v12 = [PKSEConsistencyCheckRequestedAction alloc];
    objc_msgSend(v11, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKSEConsistencyCheckRequestedAction initWithActions:deviceCredential:address:](v12, "initWithActions:deviceCredential:address:", a3, v10, v13);

    -[NSMutableArray addObject:](self->_requestedActions, "addObject:", v14);
  }
  if (self->_addCleanupActionsToResultsSummary)
  {
    if (v11)
    {
      v15 = objc_msgSend(v11, "type");
      if (!v10 || !v15)
      {
        if (!v15)
        {
LABEL_14:
          v24 = v10;
          v17 = v71;
          objc_msgSend(v11, "paymentApplication");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "applicationIdentifier");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            objc_msgSend(v24, "address");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "appletIdentifier");
            v19 = (id)objc_claimAutoreleasedReturnValue();

            if (!v19)
              goto LABEL_68;
          }
          -[NSMutableDictionary objectForKey:](self->_resultSummary, "objectForKey:", v19);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            -[NSMutableDictionary setObject:forKey:](self->_resultSummary, "setObject:forKey:", v20, v19);
          }
          if (a3)
          {
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("cleanupAction"));
            v68 = v19;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v20;
            v28 = objc_msgSend(v26, "integerValue");

            v29 = v28 | a3;
            v20 = v27;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("cleanupAction"));

            v19 = v68;
          }
          if (v18)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "state"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v31, CFSTR("passState"));

          }
          if (v24 && !objc_msgSend(v24, "type"))
          {
            objc_msgSend(v24, "underlyingCredentialState");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, CFSTR("appletState"));

          }
          if (a3 && self->_sendCleanupReasons)
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, CFSTR("appletCleanupReason"));
LABEL_67:

LABEL_68:
          goto LABEL_69;
        }
LABEL_12:
        objc_msgSend(v11, "address");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v11;
        v18 = v10;
        v19 = v71;
        v20 = v16;
        objc_msgSend(v17, "subcredential");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "address");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "appletIdentifier");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = v22;

        }
        else
        {
          objc_msgSend(v20, "appletIdentifier");
          v23 = objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
LABEL_66:

            v24 = v20;
            goto LABEL_67;
          }
        }
        -[NSMutableDictionary objectForKey:](self->_resultSummary, "objectForKey:", v23);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        if (!v33)
        {
          v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          -[NSMutableDictionary setObject:forKey:](self->_resultSummary, "setObject:forKey:", v33, v23);
        }
        v64 = (void *)v23;
        v69 = v19;
        objc_msgSend(v33, "objectForKey:", CFSTR("subkeys"));
        v34 = (id)objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
          v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v33, "setObject:forKey:", v34, CFSTR("subkeys"));
        }
        v63 = v33;
        objc_msgSend(v18, "address");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "subcredentialIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        v65 = v20;
        if (v36)
        {
          v38 = v36;
        }
        else
        {
          objc_msgSend(v20, "subcredentialIdentifier");
          v38 = (id)objc_claimAutoreleasedReturnValue();
        }
        v39 = v38;

        v66 = v39;
        objc_msgSend(v34, "objectForKey:", v39);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        if (!v40)
        {
          v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v34, "setObject:forKey:", v40, v66);
        }
        v67 = v17;
        if (a3)
        {
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("cleanupAction"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "integerValue");

          v43 = v42 | a3;
          v17 = v67;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v44, CFSTR("cleanupAction"));

        }
        v45 = v70;
        if (v70)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v70, "state"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v46, CFSTR("passState"));

        }
        if (!v18)
        {
LABEL_62:
          v61 = objc_msgSend(v45, "credentialType");
          if (v61 || (v61 = objc_msgSend(v18, "credentialType")) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setObject:forKeyedSubscript:", v62, CFSTR("credentialType"));

          }
          v19 = v69;
          v20 = v65;
          goto LABEL_66;
        }
        v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v18, "underlyingCredentialState");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v48, CFSTR("keyState"));

        v49 = objc_msgSend(v18, "type");
        v50 = v49;
        if (v49 == 2)
        {
          objc_msgSend(v18, "underlyingCredentialState");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v51, CFSTR("isoKeyState"));

          if (!a3 || !self->_sendCleanupReasons)
            goto LABEL_54;
          v52 = CFSTR("isoCleanupReason");
        }
        else
        {
          if (v49 != 1)
          {
            if (!v49)
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKSecureElementConsistencyChecker: tried to add an applet device credential to a subcredential state. Credential: %@"), v18);
            goto LABEL_54;
          }
          objc_msgSend(v18, "underlyingCredentialState");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v53, CFSTR("keyState"));

          if (!a3 || !self->_sendCleanupReasons)
          {
LABEL_54:
            if (a3 && self->_sendCleanupReasons)
              objc_msgSend(v47, "setObject:forKeyedSubscript:", v69, CFSTR("cleanupReason"));
            objc_msgSend(v67, "keyMaterialHashForDeviceCredentialType");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v50);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectForKeyedSubscript:", v55);
            v56 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "keyMaterialHash");
            v57 = objc_claimAutoreleasedReturnValue();
            if (v56 | v57)
            {
              objc_msgSend((id)v56, "base64EncodedStringWithOptions:", 0);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setObject:forKeyedSubscript:", v58, CFSTR("passPayloadMaterialHash"));

              objc_msgSend((id)v57, "base64EncodedStringWithOptions:", 0);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setObject:forKeyedSubscript:", v59, CFSTR("devicePayloadMaterialHash"));

            }
            if (objc_msgSend(v47, "count"))
            {
              PKSEConsistencyCheckDeviceCredentialTypeToString(v50);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setObject:forKeyedSubscript:", v47, v60);

            }
            v17 = v67;
            v45 = v70;
            goto LABEL_62;
          }
          v52 = CFSTR("subcredentialCleanupReason");
        }
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v69, v52);
        goto LABEL_54;
      }
    }
    else if (!v10)
    {
      goto LABEL_12;
    }
    if (!objc_msgSend(v10, "type"))
      goto LABEL_14;
    goto LABEL_12;
  }
LABEL_69:

}

- (void)addCleanupActions:(int64_t)a3
{
  unint64_t v3;

  if (self->_addCleanupActionsToResultsSummary)
    v3 = a3;
  else
    v3 = a3 & 0xFFFFFFFFFFFFFFFELL;
  self->_cleanupActions |= v3;
}

- (NSDictionary)resultsSummary
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_resultSummary, "copy");
}

- (NSArray)requestedActions
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_requestedActions, "copy");
}

- (BOOL)addCleanupActionsToResultsSummary
{
  return self->_addCleanupActionsToResultsSummary;
}

- (void)setAddCleanupActionsToResultsSummary:(BOOL)a3
{
  self->_addCleanupActionsToResultsSummary = a3;
}

- (int64_t)cleanupActions
{
  return self->_cleanupActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultSummary, 0);
  objc_storeStrong((id *)&self->_requestedActions, 0);
}

@end
