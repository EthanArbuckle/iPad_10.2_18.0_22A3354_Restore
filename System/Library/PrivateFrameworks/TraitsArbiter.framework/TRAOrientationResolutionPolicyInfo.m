@implementation TRAOrientationResolutionPolicyInfo

- (int64_t)resolutionPolicy
{
  return self->_resolutionPolicy;
}

- (NSString)associatedParticipantRole
{
  return self->_associatedParticipantRole;
}

+ (id)resolutionPolicyInfoIsolation
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithResolutionPolicy:", 0);
}

+ (id)resolutionPolicyInfoDeviceOrientation
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithResolutionPolicy:", 1);
}

+ (id)resolutionPolicyInfoForAssociatedParticipantWithRole:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResolutionPolicy:associatedParticipantRole:", 3, v4);

  return v5;
}

+ (id)resolutionPolicyInfoOrientationBelow
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithResolutionPolicy:", 2);
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantUniqueID:(id)a4 associatedParticipantRole:(id)a5 associatedAccStateTypes:(id)a6
{
  return -[TRAOrientationResolutionPolicyInfo initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:associatedAccStateTypesByMask:](self, "initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:associatedAccStateTypesByMask:", a3, a4, a5, a6, 0);
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3
{
  return -[TRAOrientationResolutionPolicyInfo initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:](self, "initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:", a3, 0, 0, 0);
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantRole:(id)a4
{
  return -[TRAOrientationResolutionPolicyInfo initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:](self, "initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:", a3, 0, a4, 0);
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantUniqueID:(id)a4 associatedParticipantRole:(id)a5 associatedAccStateTypes:(id)a6 associatedAccStateTypesByMask:(id)a7
{
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  TRAOrientationResolutionPolicyInfo *v17;
  TRAOrientationResolutionPolicyInfo *v18;
  uint64_t v19;
  NSString *associatedParticipantUniqueIdentifier;
  uint64_t v21;
  NSString *associatedParticipantRole;
  uint64_t v23;
  NSDictionary *associatedDeviceOrientationStateTypesBySupportedOrientationMask;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v13 = (unint64_t)a4;
  v14 = (unint64_t)a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)TRAOrientationResolutionPolicyInfo;
  v17 = -[TRAOrientationResolutionPolicyInfo init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_resolutionPolicy = a3;
    if (a3 != 3)
      goto LABEL_6;
    if (!(v13 | v14))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("TRAResolutionPolicy.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participantUniqueID || participantRole"));

    }
    if ((v14 != 0) == (v13 != 0))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("TRAResolutionPolicy.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(!participantUniqueID && participantRole) || (participantUniqueID && !participantRole)"));

      if (v15)
        goto LABEL_7;
    }
    else
    {
LABEL_6:
      if (v15)
      {
LABEL_7:
        if (v18->_resolutionPolicy == 1 && !objc_msgSend(v15, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("TRAResolutionPolicy.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("associatedAccStateTypes == nil || [associatedAccStateTypes count] > 0"));

        }
      }
    }
    v19 = objc_msgSend((id)v13, "copy");
    associatedParticipantUniqueIdentifier = v18->_associatedParticipantUniqueIdentifier;
    v18->_associatedParticipantUniqueIdentifier = (NSString *)v19;

    v21 = objc_msgSend((id)v14, "copy");
    associatedParticipantRole = v18->_associatedParticipantRole;
    v18->_associatedParticipantRole = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    associatedDeviceOrientationStateTypesBySupportedOrientationMask = v18->_associatedDeviceOrientationStateTypesBySupportedOrientationMask;
    v18->_associatedDeviceOrientationStateTypesBySupportedOrientationMask = (NSDictionary *)v23;

    -[TRAOrientationResolutionPolicyInfo setAssociatedDeviceOrientationStateTypes:](v18, "setAssociatedDeviceOrientationStateTypes:", v15);
  }

  return v18;
}

- (void)setAssociatedDeviceOrientationStateTypes:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *associatedDeviceOrientationStateTypes;
  id v7;

  v4 = a3;
  if (self->_resolutionPolicy == 1)
  {
    v7 = v4;
    if (v4)
    {
      v5 = (NSArray *)objc_msgSend(v4, "copy");
      associatedDeviceOrientationStateTypes = self->_associatedDeviceOrientationStateTypes;
      self->_associatedDeviceOrientationStateTypes = v5;
    }
    else
    {
      associatedDeviceOrientationStateTypes = self->_associatedDeviceOrientationStateTypes;
      self->_associatedDeviceOrientationStateTypes = (NSArray *)&unk_251A0EAF8;
    }

    v4 = v7;
  }

}

- (NSString)associatedParticipantUniqueIdentifier
{
  return self->_associatedParticipantUniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actuationContext, 0);
  objc_storeStrong((id *)&self->_associatedDeviceOrientationStateTypesBySupportedOrientationMask, 0);
  objc_storeStrong((id *)&self->_associatedDeviceOrientationStateTypes, 0);
  objc_storeStrong((id *)&self->_associatedParticipantRole, 0);
  objc_storeStrong((id *)&self->_associatedParticipantUniqueIdentifier, 0);
}

- (NSArray)associatedDeviceOrientationStateTypes
{
  return self->_associatedDeviceOrientationStateTypes;
}

- (NSDictionary)associatedDeviceOrientationStateTypesBySupportedOrientationMask
{
  return self->_associatedDeviceOrientationStateTypesBySupportedOrientationMask;
}

+ (id)resolutionPolicyInfoForAssociatedParticipantWithUniqueID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResolutionPolicy:associatedParticipantUniqueID:", 3, v4);

  return v5;
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantUniqueID:(id)a4
{
  return -[TRAOrientationResolutionPolicyInfo initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:](self, "initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:", a3, a4, 0, 0);
}

- (void)setActuationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setForceResolution:(BOOL)a3
{
  self->_forceResolution = a3;
}

+ (id)resolutionPolicyInfoDeviceOrientationWithStateTypesBySupportedOrientationMask:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResolutionPolicy:associatedAccStateTypesByMask:", 1, v4);

  return v5;
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedAccStateTypesByMask:(id)a4
{
  return -[TRAOrientationResolutionPolicyInfo initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:associatedAccStateTypesByMask:](self, "initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:associatedAccStateTypesByMask:", a3, 0, 0, 0, a4);
}

- (TRASettingsActuationContext)actuationContext
{
  return self->_actuationContext;
}

+ (id)resolutionPolicyInfoDeviceOrientationWithStateTypes:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResolutionPolicy:associatedAccStateTypes:", 1, v4);

  return v5;
}

+ (id)resolutionPolicyInfoOrientationBelowParticipantWithUniqueID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResolutionPolicy:associatedParticipantUniqueID:", 2, v4);

  return v5;
}

+ (id)resolutionPolicyInfoOrientationBelowParticipantWithRole:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResolutionPolicy:associatedParticipantRole:", 2, v4);

  return v5;
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicyInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  TRAOrientationResolutionPolicyInfo *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "resolutionPolicy");
  objc_msgSend(v4, "associatedParticipantUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associatedParticipantRole");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associatedDeviceOrientationStateTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[TRAOrientationResolutionPolicyInfo initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:](self, "initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:", v5, v6, v7, v8);
  return v9;
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedAccStateTypes:(id)a4
{
  return -[TRAOrientationResolutionPolicyInfo initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:](self, "initWithResolutionPolicy:associatedParticipantUniqueID:associatedParticipantRole:associatedAccStateTypes:", a3, 0, 0, a4);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAOrientationResolutionPolicyInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  int64_t resolutionPolicy;
  NSString *associatedParticipantUniqueIdentifier;
  NSString *v10;
  NSString *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  unint64_t v18;
  const __CFString *v19;
  NSString *v20;
  void *v21;
  NSDictionary *associatedDeviceOrientationStateTypesBySupportedOrientationMask;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  unint64_t v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  TRASettingsActuationContext *actuationContext;
  id v43;
  NSString *v45;
  NSString *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  uint64_t v51;
  void *v52;
  TRAOrientationResolutionPolicyInfo *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = self;
  v4 = self->_resolutionPolicy - 1;
  if (v4 > 2)
    v5 = CFSTR("None");
  else
    v5 = off_251A06EB8[v4];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  resolutionPolicy = self->_resolutionPolicy;
  if (resolutionPolicy == 1)
  {
    v48 = v3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_associatedDeviceOrientationStateTypes, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v13 = self->_associatedDeviceOrientationStateTypes;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v63 != v16)
            objc_enumerationMutation(v13);
          v18 = objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "integerValue") - 1;
          v19 = CFSTR("ValidatedCurrentOrientation");
          if (v18 <= 2)
            v19 = off_251A06ED0[v18];
          objc_msgSend(v12, "addObject:", v19);
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      }
      while (v15);
    }

    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v3 = v48;
  }
  else
  {
    if (resolutionPolicy != 3)
    {
      v21 = (void *)v6;
      goto LABEL_43;
    }
    associatedParticipantUniqueIdentifier = self->_associatedParticipantUniqueIdentifier;
    if (!associatedParticipantUniqueIdentifier)
      associatedParticipantUniqueIdentifier = self->_associatedParticipantRole;
    v10 = associatedParticipantUniqueIdentifier;
    v11 = 0;
  }
  if (v10)
    v20 = v10;
  else
    v20 = v11;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@-(%@)"), v5, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53->_resolutionPolicy == 1)
  {
    associatedDeviceOrientationStateTypesBySupportedOrientationMask = v53->_associatedDeviceOrientationStateTypesBySupportedOrientationMask;
    if (associatedDeviceOrientationStateTypesBySupportedOrientationMask)
    {
      v45 = v10;
      v46 = v11;
      v47 = v21;
      v49 = v3;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSDictionary count](associatedDeviceOrientationStateTypesBySupportedOrientationMask, "count"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      -[NSDictionary allKeys](v53->_associatedDeviceOrientationStateTypesBySupportedOrientationMask, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      if (v23)
      {
        v24 = v23;
        v51 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v59 != v51)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
            -[NSDictionary objectForKey:](v53->_associatedDeviceOrientationStateTypesBySupportedOrientationMask, "objectForKey:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v53->_associatedDeviceOrientationStateTypes, "count"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v29 = v27;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v55;
              do
              {
                for (k = 0; k != v31; ++k)
                {
                  if (*(_QWORD *)v55 != v32)
                    objc_enumerationMutation(v29);
                  v34 = objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * k), "integerValue") - 1;
                  v35 = CFSTR("ValidatedCurrentOrientation");
                  if (v34 <= 2)
                    v35 = off_251A06ED0[v34];
                  objc_msgSend(v28, "addObject:", v35);
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
              }
              while (v31);
            }

            objc_msgSend(v28, "componentsJoinedByString:", CFSTR(","));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "integerValue");
            BSInterfaceOrientationMaskDescription();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setObject:forKey:", v36, v37);

          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
        }
        while (v24);
      }

      v38 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v52, "description");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("-(%@)"), v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v47;
      objc_msgSend(v47, "appendString:", v40);

      v3 = v49;
      v10 = v45;
      v11 = v46;
    }
  }

LABEL_43:
  objc_msgSend(v3, "appendString:withName:", v21, CFSTR("Policy"));
  if (v53->_forceResolution)
    v41 = (id)objc_msgSend(v3, "appendBool:withName:", 1, CFSTR("Force Resolution"));
  actuationContext = v53->_actuationContext;
  if (actuationContext)
    v43 = (id)objc_msgSend(v3, "appendObject:withName:", actuationContext, CFSTR("Actuation Context"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAOrientationResolutionPolicyInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)forceResolution
{
  return self->_forceResolution;
}

@end
