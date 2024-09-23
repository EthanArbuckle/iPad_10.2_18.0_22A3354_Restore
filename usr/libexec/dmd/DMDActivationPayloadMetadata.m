@implementation DMDActivationPayloadMetadata

- (void)updateStateDictionaryIfNeeded
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  char v7;
  __objc2_class **p_superclass;
  char v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  id v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableDictionary *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  DMDActivationPayloadMetadata *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableDictionary *v42;
  NSMutableArray *v43;
  NSMutableArray *v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _BYTE v62[128];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata status](self, "status"));
  v42 = objc_opt_new(NSMutableDictionary);
  v44 = objc_opt_new(NSMutableArray);
  v43 = objc_opt_new(NSMutableArray);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v38 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[DMDActivationPayloadMetadata outgoingPayloadMetadataReferences](self, "outgoingPayloadMetadataReferences"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v47;
    v39 = DMFDeclarationPayloadServerHashKey;
    v40 = DMFDeclarationPayloadIdentifierKey;
    v7 = 1;
    p_superclass = &OBJC_METACLASS___DMDBeginTransactionOperation.superclass;
    v9 = 1;
    v41 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v6)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(p_superclass + 164, v4);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v60[0] = v40;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          v60[1] = v39;
          v61[0] = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serverHash"));
          v61[1] = v14;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 2));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v15, v16);

          v17 = objc_msgSend(v11, "installed");
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", v18));
          if (v17)
            v20 = v44;
          else
            v20 = v43;
          v7 &= v17 ^ 1;
          v9 &= v17;
          v6 = v41;
          -[NSMutableArray addObject:](v20, "addObject:", v19);

          p_superclass = (__objc2_class **)(&OBJC_METACLASS___DMDBeginTransactionOperation + 8);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1;
    v9 = 1;
  }

  -[NSMutableArray sortUsingComparator:](v44, "sortUsingComparator:", &stru_1000B9B80);
  -[NSMutableArray sortUsingComparator:](v43, "sortUsingComparator:", &stru_1000B9B80);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v42, "allValues"));
  v22 = objc_msgSend(v21, "mutableCopy");

  objc_msgSend(v22, "sortUsingComparator:", &stru_1000B9B80);
  v23 = objc_opt_new(NSMutableDictionary);
  v24 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v22, CFSTR("ActivatedConfigurations"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPayloadMetadata predicatePayloadMetadata](self, "predicatePayloadMetadata"));
  -[NSMutableDictionary addEntriesFromDictionary:](v24, "addEntriesFromDictionary:", v25);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v24, DMFDeclarationStatePayloadKey);
  if (-[DMDActivationPayloadMetadata installed](self, "installed"))
  {
    if ((v9 & 1) != 0)
    {
      v26 = v37;
      if ((objc_msgSend(v37, "isEqualToString:", DMFDeclarationStatusRemoved) & 1) == 0)
      {
        v27 = DMFDeclarationStatusInstalled;
        v28 = DMFDeclarationStateStatusKey;
        v29 = v23;
LABEL_22:
        -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v27, v28);
LABEL_26:
        -[DMDDeclarationPayloadMetadata setStateDictionary:](v38, "setStateDictionary:", v23);
        goto LABEL_27;
      }
      goto LABEL_27;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", DMFDeclarationStatusPendingClient, DMFDeclarationStateStatusKey);
    v31 = DMFCommandStateReasonCodeKey;
    v57[0] = DMFCommandStateReasonCodeKey;
    v57[1] = DMFCEMReasonCodePayloadPhase;
    v58[0] = DMFCEMReasonCodePayloadPhase;
    v58[1] = CFSTR("Install");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 2));
    v59[0] = v32;
    v55[0] = v31;
    v55[1] = DMFCEMReasonCodePendingConfigurations;
    v56[0] = DMFCEMReasonCodePendingConfigurations;
    v56[1] = v43;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 2));
    v59[1] = v33;
    v34 = v59;
LABEL_25:
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v36, DMFDeclarationStateReasonKey);

    v26 = v37;
    goto LABEL_26;
  }
  if ((v7 & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", DMFDeclarationStatusPendingClient, DMFDeclarationStateStatusKey);
    v35 = DMFCommandStateReasonCodeKey;
    v52[0] = DMFCommandStateReasonCodeKey;
    v52[1] = DMFCEMReasonCodePayloadPhase;
    v53[0] = DMFCEMReasonCodePayloadPhase;
    v53[1] = CFSTR("Remove");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 2));
    v54[0] = v32;
    v50[0] = v35;
    v50[1] = DMFCEMReasonCodePendingConfigurations;
    v51[0] = DMFCEMReasonCodePendingConfigurations;
    v51[1] = v44;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 2));
    v54[1] = v33;
    v34 = v54;
    goto LABEL_25;
  }
  v30 = DMFDeclarationStatusRemoved;
  v26 = v37;
  if ((objc_msgSend(v37, "isEqualToString:", DMFDeclarationStatusRemoved) & 1) == 0)
  {
    v28 = DMFDeclarationStateStatusKey;
    v29 = v23;
    v27 = v30;
    goto LABEL_22;
  }
LABEL_27:

}

+ (id)fetchRequestForActivationsFromOrganizationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("organization.identifier"), v4));

  objc_msgSend(v5, "setPredicate:", v6);
  return v5;
}

@end
