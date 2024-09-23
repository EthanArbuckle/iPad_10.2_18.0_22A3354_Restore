@implementation DMDEngineUpdateDeclarationsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  void *j;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSMutableArray *v52;
  NSMutableArray *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *k;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  void *m;
  void *v69;
  void *v70;
  void *v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  NSObject *v80;
  uint64_t v81;
  NSObject *v82;
  void *v83;
  unsigned __int8 v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  DMDEngineUpdateDeclarationsOperation *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  id obj;
  uint64_t v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  id v129;
  _BYTE v130[128];
  _BYTE v131[128];
  uint8_t v132[128];
  uint8_t buf[4];
  void *v134;
  _BYTE v135[128];
  _BYTE v136[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](self, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organizationIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:](DMDDeclarationPayloadMetadata, "fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:", v6));

  v129 = 0;
  v99 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v7, &v129));
  v9 = v129;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v126;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v126 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)i), "setFailed:", 0);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
    }
    while (v12);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](self, "request"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "removeDeclarations"));

  v103 = v10;
  v94 = self;
  if (objc_msgSend(v16, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", DMFDeclarationPayloadIdentifierKey));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self != %@"), v18));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "filteredArrayUsingPredicate:", v19));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](self, "request"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "organizationIdentifier"));
    v95 = (void *)v20;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata fetchRequestForDeclarationsFromOrganizationWithIdentifier:withIdentifiers:](DMDDeclarationPayloadMetadata, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:withIdentifiers:", v22, v20));

    v124 = v9;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "execute:", &v124));
    v92 = v124;

    if (!v24)
    {
      v77 = DMFConfigurationEngineLog(v25);
      v78 = objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        sub_10007700C(v92);

      -[DMDEngineUpdateDeclarationsOperation setError:](v94, "setError:", v92);
      v34 = v92;
      v36 = (void *)v20;
      goto LABEL_70;
    }
    v89 = v7;
    v91 = v16;
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v121;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v121 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)v30);
          v32 = DMFConfigurationEngineLog(v27);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v134 = v31;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Marking configuration for removal: %{public}@", buf, 0xCu);
          }

          v27 = objc_msgSend(v31, "setAvailable:", 0);
          v30 = (char *)v30 + 1;
        }
        while (v28 != v30);
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
        v28 = v27;
      }
      while (v27);
    }

    v7 = v89;
    v34 = v92;
    self = v94;
    v10 = v103;
  }
  else
  {
    v91 = v16;
    v34 = v9;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](self, "request"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "upsertDeclarations"));

  if (!objc_msgSend(v36, "count"))
  {
    v16 = v91;
LABEL_65:
    v83 = v34;
    v105 = v34;
    v84 = objc_msgSend(v99, "save:", &v105);
    v34 = v105;

    if ((v84 & 1) != 0)
    {
      -[DMDEngineUpdateDeclarationsOperation setResultObject:](self, "setResultObject:", 0);
    }
    else
    {
      v86 = DMFConfigurationEngineLog(v85);
      v87 = objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        sub_100076EA4(v34);

      -[DMDEngineUpdateDeclarationsOperation setError:](self, "setError:", v34);
    }
    goto LABEL_70;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](self, "request"));
  v38 = v34;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "organizationIdentifier"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:](DMDDeclarationPayloadMetadata, "fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:", v39));

  v119 = v38;
  v88 = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "execute:", &v119));
  v42 = v119;

  if (v41)
  {
    v96 = v36;
    v90 = v7;
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v41, "count")));
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    obj = v41;
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v116;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(_QWORD *)v116 != v46)
            objc_enumerationMutation(obj);
          v48 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)j);
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "identifier"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", v49));
          v51 = v50;
          if (v50)
            v52 = v50;
          else
            v52 = objc_opt_new(NSMutableArray);
          v53 = v52;

          -[NSMutableArray addObject:](v53, "addObject:", v48);
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "identifier"));
          objc_msgSend(v104, "setObject:forKeyedSubscript:", v53, v54);

        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
      }
      while (v45);
    }

    self = v94;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](v94, "request"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "organizationIdentifier"));
    v114 = v42;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata declarationsWithDictionaries:organizationIdentifier:context:error:](DMDDeclarationPayloadMetadata, "declarationsWithDictionaries:organizationIdentifier:context:error:", v96, v56, v99, &v114));
    v93 = v114;

    v58 = objc_msgSend(v57, "mutableCopy");
    if (v58)
    {
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v98 = v58;
      v97 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "allValues"));
      v102 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v110, v131, 16);
      if (v102)
      {
        v101 = *(_QWORD *)v111;
        do
        {
          for (k = 0; k != v102; k = (char *)k + 1)
          {
            if (*(_QWORD *)v111 != v101)
              objc_enumerationMutation(v97);
            v61 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)k);
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "identifier"));
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", v62));

            v108 = 0u;
            v109 = 0u;
            v106 = 0u;
            v107 = 0u;
            v64 = v63;
            v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v106, v130, 16);
            if (v65)
            {
              v66 = v65;
              v67 = *(_QWORD *)v107;
              while (2)
              {
                for (m = 0; m != v66; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v107 != v67)
                    objc_enumerationMutation(v64);
                  v69 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)m);
                  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "serverHash"));
                  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "serverHash"));
                  v72 = objc_msgSend(v70, "isEqualToString:", v71);

                  if (v72)
                  {
                    v74 = DMFConfigurationEngineLog(v73);
                    v75 = objc_claimAutoreleasedReturnValue(v74);
                    if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543362;
                      v134 = v61;
                      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "Declaration already installed, skipping: %{public}@", buf, 0xCu);
                    }

                    objc_msgSend(v99, "deleteObject:", v61);
                    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "identifier"));
                    objc_msgSend(v98, "removeObjectForKey:", v76);

                    v10 = v103;
                    goto LABEL_51;
                  }
                  objc_msgSend(v69, "setAvailable:", 0);
                }
                v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v106, v130, 16);
                v10 = v103;
                if (v66)
                  continue;
                break;
              }
            }
LABEL_51:

          }
          v102 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v110, v131, 16);
        }
        while (v102);
      }

      v7 = v90;
      v16 = v91;
      self = v94;
      v36 = v96;
      v34 = v93;
      v58 = v98;
    }
    else
    {
      v81 = DMFConfigurationEngineLog(v59);
      v82 = objc_claimAutoreleasedReturnValue(v81);
      v7 = v90;
      v34 = v93;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        sub_100076F94(v93);

      -[DMDEngineUpdateDeclarationsOperation setError:](v94, "setError:", v93);
      v16 = v91;
      v36 = v96;
    }

    if (v58)
      goto LABEL_65;
  }
  else
  {
    v79 = DMFConfigurationEngineLog(v43);
    v80 = objc_claimAutoreleasedReturnValue(v79);
    v16 = v91;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      sub_100076F1C(v42);

    -[DMDEngineUpdateDeclarationsOperation setError:](self, "setError:", v42);
    v34 = v42;
  }
LABEL_70:

}

- (DMFUpdateDeclarationsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
