@implementation PDSDaemonListener

- (PDSDaemonListener)initWithEntryStore:(id)a3 userTracker:(id)a4
{
  PDSDaemonListener *result;

  result = -[PDSDaemonListener initWithClientIDs:entryStore:userTracker:](self, "initWithClientIDs:entryStore:userTracker:", &unk_24D4AF210, a3, a4);
  if (result)
    result->_bypassClientIDCheck = 1;
  return result;
}

- (PDSDaemonListener)initWithClientIDs:(id)a3 entryStore:(id)a4 userTracker:(id)a5
{
  id v10;
  id v11;
  id v12;
  PDSDaemonListener *v13;
  PDSDaemonListener *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemonListener.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientIDs"));

  }
  if (objc_msgSend(v10, "count"))
  {
    if (v11)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemonListener.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entryStore"));

    if (v12)
      goto LABEL_6;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemonListener.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientIDs.count > 0"));

  if (!v11)
    goto LABEL_10;
LABEL_5:
  if (v12)
    goto LABEL_6;
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemonListener.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userTracker"));

LABEL_6:
  v20.receiver = self;
  v20.super_class = (Class)PDSDaemonListener;
  v13 = -[PDSDaemonListener init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_clientIDs, a3);
    objc_storeStrong((id *)&v14->_entryStore, a4);
    objc_storeStrong((id *)&v14->_userTracker, a5);
    v14->_bypassClientIDCheck = 0;
  }

  return v14;
}

- (void)storeEntries:(id)a3 deleteEntries:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  char v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  id v58;
  void (**v59)(id, id);
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    v59 = v10;
    if (-[PDSDaemonListener bypassClientIDCheck](self, "bypassClientIDCheck"))
      goto LABEL_4;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v40 = v8;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v79;
LABEL_37:
      v44 = 0;
      while (1)
      {
        if (*(_QWORD *)v79 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v44);
        -[PDSDaemonListener clientIDs](self, "clientIDs");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "clientID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v46, "containsObject:", v47);

        if (!v48)
          break;
        if (v42 == ++v44)
        {
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
          if (v42)
            goto LABEL_37;
          goto LABEL_43;
        }
      }
    }
    else
    {
LABEL_43:

      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v40 = v9;
      v49 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
      if (!v49)
      {
LABEL_51:

LABEL_4:
        if (objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
        {
          v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v12 = v8;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v71;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v71 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "registration");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v17);

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
            }
            while (v14);
          }

          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v18 = v9;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v67;
            while (2)
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v67 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "registration");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v11, "containsObject:", v23);

                if ((v24 & 1) != 0)
                {

                  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E558], -305, 0);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v10 = v59;
                  v59[2](v59, v57);

                  goto LABEL_58;
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
              if (v20)
                continue;
              break;
            }
          }

        }
        v58 = v9;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v25 = v8;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v63;
          do
          {
            for (k = 0; k != v27; ++k)
            {
              if (*(_QWORD *)v63 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
              if (objc_msgSend(v30, "state", v58) == 1)
              {
                -[PDSDaemonListener userTracker](self, "userTracker");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "user");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = 0;
                v33 = objc_msgSend(v31, "validUser:withError:", v32, &v61);
                v34 = v61;

                if ((v33 & 1) == 0)
                {
                  v10 = v59;
                  v59[2](v59, v34);

                  v9 = v58;
                  goto LABEL_58;
                }
              }
              else
              {
                v34 = 0;
              }

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
          }
          while (v27);
        }

        -[PDSDaemonListener entryStore](self, "entryStore");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        v9 = v58;
        objc_msgSend(v35, "storeEntries:deleteEntries:withError:", v25, v58, &v60);
        v36 = v60;

        if (v36)
        {
          v37 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(v36, "domain");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, objc_msgSend(v36, "code"), 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v39 = 0;
        }
        v10 = v59;
        v59[2](v59, v39);

        goto LABEL_57;
      }
      v50 = v49;
      v51 = *(_QWORD *)v75;
LABEL_45:
      v52 = 0;
      while (1)
      {
        if (*(_QWORD *)v75 != v51)
          objc_enumerationMutation(v40);
        v53 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v52);
        -[PDSDaemonListener clientIDs](self, "clientIDs");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "clientID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v54, "containsObject:", v55);

        if (!v56)
          break;
        if (v50 == ++v52)
        {
          v50 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
          if (v50)
            goto LABEL_45;
          goto LABEL_51;
        }
      }
    }
    v10 = v59;

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E558], -303, 0);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v36);
LABEL_57:

    goto LABEL_58;
  }
  v10[2](v10, 0);
LABEL_58:

}

- (void)batchUpdateEntries:(id)a3 forClientID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v54 = v9;
  v53 = a5;
  if (!-[PDSDaemonListener bypassClientIDCheck](self, "bypassClientIDCheck"))
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v71;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v71 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          -[PDSDaemonListener clientIDs](self, "clientIDs");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "clientID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "containsObject:", v18);

          if (!v19)
          {

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E558], -303, 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v53;
            (*((void (**)(id, void *))v53 + 2))(v53, v31);
            goto LABEL_46;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
        if (v13)
          continue;
        break;
      }
    }

  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v20 = v10;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v67;
    while (2)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v67 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        -[PDSDaemonListener userTracker](self, "userTracker");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "user");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = 0;
        v28 = objc_msgSend(v26, "validUser:withError:", v27, &v65);
        v29 = v65;

        if ((v28 & 1) == 0)
        {
          v48 = v53;
          (*((void (**)(id, id))v53 + 2))(v53, v29);

          v31 = v20;
          goto LABEL_46;
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
      if (v22)
        continue;
      break;
    }
  }

  -[PDSDaemonListener entryStore](self, "entryStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "entriesWithClientID:", v54);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v31, "count"))
  {
    v52 = v10;
    v32 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v33 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v34 = v31;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v61 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * k);
          if ((objc_msgSend(v20, "containsObject:", v39, v52) & 1) == 0)
            objc_msgSend(v33, "addObject:", v39);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
      }
      while (v36);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v40 = v20;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v57;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v57 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * m);
          if ((objc_msgSend(v34, "containsObject:", v45, v52) & 1) == 0)
            objc_msgSend(v32, "addObject:", v45);
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
      }
      while (v42);
    }

    -[PDSDaemonListener entryStore](self, "entryStore");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    objc_msgSend(v46, "storeEntries:deleteEntries:withError:", v32, v33, &v55);
    v47 = v55;

    v10 = v52;
  }
  else
  {
    -[PDSDaemonListener entryStore](self, "entryStore");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    objc_msgSend(v32, "storeEntries:deleteEntries:withError:", v20, 0, &v64);
    v47 = v64;
  }

  v48 = v53;
  if (v47)
  {
    v49 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v47, "domain");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", v50, objc_msgSend(v47, "code"), 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v51 = 0;
  }
  (*((void (**)(id, void *))v53 + 2))(v53, v51);

LABEL_46:
}

- (void)removeAllEntriesForUser:(id)a3 withClientID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[PDSDaemonListener bypassClientIDCheck](self, "bypassClientIDCheck")
    || (-[PDSDaemonListener clientIDs](self, "clientIDs"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "containsObject:", v9),
        v11,
        (v12 & 1) != 0))
  {
    -[PDSDaemonListener entryStore](self, "entryStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v13, "updateEntryState:forUser:clientID:withError:", 2, v8, v9, &v18);
    v14 = v18;

    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v14, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, objc_msgSend(v14, "code"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    v10[2](v10, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E558], -303, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v14);
  }

}

- (void)activeUsersWithClientID:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  if (-[PDSDaemonListener bypassClientIDCheck](self, "bypassClientIDCheck")
    || (-[PDSDaemonListener clientIDs](self, "clientIDs"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", v14),
        v7,
        (v8 & 1) != 0))
  {
    v9 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE6E540]);
    -[PDSDaemonListener entryStore](self, "entryStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "activeUsers");
    else
      objc_msgSend(v10, "activeUsersWithClientID:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v12;
    else
      v13 = (void *)MEMORY[0x24BDBD1A8];
    v6[2](v6, v13, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E558], -303, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v12);
  }

}

- (void)usersWithClientID:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  if (-[PDSDaemonListener bypassClientIDCheck](self, "bypassClientIDCheck")
    || (-[PDSDaemonListener clientIDs](self, "clientIDs"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", v14),
        v7,
        (v8 & 1) != 0))
  {
    v9 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE6E540]);
    -[PDSDaemonListener entryStore](self, "entryStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "users");
    else
      objc_msgSend(v10, "usersWithClientID:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v12;
    else
      v13 = (void *)MEMORY[0x24BDBD1A8];
    v6[2](v6, v13, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E558], -303, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v12);
  }

}

- (void)entriesForUser:(id)a3 clientID:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  char v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  if (-[PDSDaemonListener bypassClientIDCheck](self, "bypassClientIDCheck")
    || (-[PDSDaemonListener clientIDs](self, "clientIDs"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "containsObject:", v8),
        v10,
        (v11 & 1) != 0))
  {
    v12 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE6E540]);
    -[PDSDaemonListener entryStore](self, "entryStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      objc_msgSend(v13, "entriesForUser:", v16);
    else
      objc_msgSend(v13, "entriesForUser:withClientID:", v16, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v9[2](v9, v15, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E558], -303, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v9)[2](v9, 0, v15);
  }

}

- (void)entriesForClientID:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  if (-[PDSDaemonListener bypassClientIDCheck](self, "bypassClientIDCheck")
    || (-[PDSDaemonListener clientIDs](self, "clientIDs"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", v13),
        v7,
        (v8 & 1) != 0))
  {
    v9 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE6E540]);
    -[PDSDaemonListener entryStore](self, "entryStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "entries");
    else
      objc_msgSend(v10, "entriesWithClientID:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v6[2](v6, v12, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E558], -303, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v12);
  }

}

- (BOOL)bypassClientIDCheck
{
  return self->_bypassClientIDCheck;
}

- (NSArray)clientIDs
{
  return self->_clientIDs;
}

- (void)setClientIDs:(id)a3
{
  objc_storeStrong((id *)&self->_clientIDs, a3);
}

- (PDSEntryStore)entryStore
{
  return self->_entryStore;
}

- (void)setEntryStore:(id)a3
{
  objc_storeStrong((id *)&self->_entryStore, a3);
}

- (PDSUserTracker)userTracker
{
  return self->_userTracker;
}

- (void)setUserTracker:(id)a3
{
  objc_storeStrong((id *)&self->_userTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTracker, 0);
  objc_storeStrong((id *)&self->_entryStore, 0);
  objc_storeStrong((id *)&self->_clientIDs, 0);
}

@end
