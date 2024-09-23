@implementation _UIRIPDeliveryRecord

- (_UIRIPDeliveryRecord)initWithPresses:(id)a3 inPhase:(int64_t)a4 withEvent:(id)a5
{
  id v9;
  id v10;
  _UIRIPDeliveryRecord *v11;
  _UIRIPDeliveryRecord *v12;
  uint64_t v13;
  NSMapTable *receivers;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIRIPDeliveryRecord;
  v11 = -[_UIRIPDeliveryRecord init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_presses, a3);
    v12->_phase = a4;
    objc_storeStrong((id *)&v12->_event, a5);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    receivers = v12->_receivers;
    v12->_receivers = (NSMapTable *)v13;

  }
  return v12;
}

- (void)responder:(id)a3 class:(Class)a4 receivedPresses:(id)a5 inPhase:(int64_t)a6 withEvent:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  _UIRIPReceiver *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v13;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_receivers, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v20 = (void *)objc_opt_new();
          -[NSMapTable setObject:forKey:](self->_receivers, "setObject:forKey:", v20, v19);
        }
        v21 = -[_UIRIPReceiver initWithResponder:class:press:inPhase:withEvent:]([_UIRIPReceiver alloc], "initWithResponder:class:press:inPhase:withEvent:", v12, a4, v19, a6, v14);
        objc_msgSend(v20, "addObject:", v21);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Delivery record for phase %d:\n"), self->_phase);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("event delivered:   %@\n"), self->_event);
  objc_msgSend(v3, "appendFormat:", CFSTR("presses delivered: %@\n"), self->_presses);
  return v3;
}

- (id)diffToRecord:(id)a3 press:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  uint64_t v54;
  void *v56;
  void *v57;
  id v58;
  id *v59;
  void *v60;
  char v61;
  int v62;
  _UIRIPDeliveryRecord *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  -[_UIRIPDeliveryRecord event](self, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[_UIRIPDeliveryRecord event](self, "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "event");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Unable to generate diff for records from different events: %p and %p"), v11, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_66;
  }
  -[NSMapTable objectForKey:](self->_receivers, "objectForKey:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6[1], "objectForKey:", v7);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v14 || !v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate diff. Press is not present in both records."));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_65;
  }
  v17 = (void *)MEMORY[0x1E0CB37A0];
  _NSStringFromUIPressPhase(-[_UIRIPDeliveryRecord phase](self, "phase"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIPressPhase(objc_msgSend(v6, "phase"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("Difference between phase %@ and %@:\n"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "differenceFromArray:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "hasChanges"))
  {
    v13 = 0;
    goto LABEL_64;
  }
  v63 = self;
  v58 = v7;
  v59 = v6;
  objc_msgSend(v21, "removals");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_opt_new();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v74 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(v23, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "index"));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    }
    while (v26);
  }
  v68 = v20;

  v57 = v21;
  objc_msgSend(v21, "insertions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_opt_new();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v31 = v29;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v70 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(v30, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "index"));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v33);
  }
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v56 = v31;
  v65 = v23;
  v66 = v16;
  v64 = v24;
  v67 = v14;
  v60 = v30;
  while (1)
  {

    if (v36 >= objc_msgSend(v14, "count") && v37 >= objc_msgSend(v16, "count"))
      break;
    if (v36 >= objc_msgSend(v14, "count"))
    {
      v31 = 0;
    }
    else
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v36);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v37 >= objc_msgSend(v16, "count"))
    {
      v39 = 0;
    }
    else
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v31, "responder");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "responder");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 == v41)
    {
      v42 = objc_opt_class();
      v43 = objc_opt_class();

      if (v42 == v43)
      {
        __appendDescription(v68, v38, v31, 0);
        objc_msgSend(v31, "responder");
        v54 = objc_claimAutoreleasedReturnValue();

        ++v36;
        ++v37;
        v38 = (void *)v54;
        goto LABEL_60;
      }
    }
    else
    {

    }
    objc_msgSend(v31, "responder");
    v44 = objc_claimAutoreleasedReturnValue();
    if ((void *)v44 == v38)
    {

      if ((objc_msgSend(v23, "containsIndex:", v37) & 1) == 0)
      {
        ++v37;
        if ((objc_msgSend(v30, "containsIndex:", v36) & 1) == 0)
        {
LABEL_58:
          ++v36;
          goto LABEL_60;
        }
        goto LABEL_48;
      }
LABEL_37:
      _NSStringFromUIPressPhase(-[_UIRIPDeliveryRecord phase](v63, "phase"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "appendFormat:", CFSTR("  --- missing calls in %@ ---\n"), v47);
      v61 = 0;
      goto LABEL_38;
    }
    v45 = (void *)v44;
    objc_msgSend(v39, "responder");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v23, "containsIndex:", v37) & 1) == 0)
    {
      ++v37;
      if ((objc_msgSend(v30, "containsIndex:", v36) & 1) == 0)
        goto LABEL_58;
      if (v46 == v38)
        goto LABEL_48;
      goto LABEL_46;
    }
    if (v46 == v38)
      goto LABEL_37;
    _NSStringFromUIPressPhase(-[_UIRIPDeliveryRecord phase](v63, "phase"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "appendFormat:", CFSTR("-#- missing responder in %@ -#-\n"), v47);
    v61 = 1;
LABEL_38:

    if (objc_msgSend(v23, "containsIndex:", v37))
    {
      v48 = v39;
      v49 = v38;
      do
      {
        objc_msgSend(v66, "objectAtIndexedSubscript:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        __appendDescription(v68, v49, v39, -1);
        objc_msgSend(v39, "responder");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        ++v37;
        v48 = v39;
        v49 = v38;
      }
      while ((objc_msgSend(v65, "containsIndex:", v37) & 1) != 0);
    }
    if ((v61 & 1) == 0)
    {
      objc_msgSend(v68, "appendFormat:", CFSTR("  === end missing calls ===\n"));
      v30 = v60;
      v23 = v65;
      if ((objc_msgSend(v60, "containsIndex:", v36) & 1) == 0)
        goto LABEL_58;
LABEL_48:
      _NSStringFromUIPressPhase(-[_UIRIPDeliveryRecord phase](v63, "phase"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "appendFormat:", CFSTR("  +++ additional calls in %@ +++\n"), v50);
      v62 = 0;
      goto LABEL_49;
    }
    objc_msgSend(v68, "appendFormat:", CFSTR("=#= end missing responder =#=\n"));
    v30 = v60;
    v23 = v65;
    if ((objc_msgSend(v60, "containsIndex:", v36) & 1) == 0)
      goto LABEL_58;
LABEL_46:
    _NSStringFromUIPressPhase(-[_UIRIPDeliveryRecord phase](v63, "phase"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "appendFormat:", CFSTR("+#+ additional responder in %@ +#+\n"), v50);
    v62 = 1;
LABEL_49:
    v51 = v38;

    if (objc_msgSend(v30, "containsIndex:", v36))
    {
      do
      {
        objc_msgSend(v67, "objectAtIndexedSubscript:", v36);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        __appendDescription(v68, v51, v52, 1);
        objc_msgSend(v52, "responder");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        ++v36;
        v31 = v52;
        v51 = v38;
      }
      while ((objc_msgSend(v30, "containsIndex:", v36) & 1) != 0);
    }
    else
    {
      v52 = v31;
    }
    v23 = v65;
    if (v62)
      v53 = CFSTR("=#= end additional responder =#=\n");
    else
      v53 = CFSTR("  === end additional calls ===\n");
    objc_msgSend(v68, "appendFormat:", v53);
    v31 = v52;
LABEL_60:
    v24 = v64;

    v16 = v66;
    v14 = v67;
  }
  v20 = v68;
  v13 = v68;

  v7 = v58;
  v6 = v59;
  v21 = v57;
LABEL_64:

LABEL_65:
LABEL_66:

  return v13;
}

- (int64_t)phase
{
  return self->_phase;
}

- (UIEvent)event
{
  return self->_event;
}

- (NSSet)presses
{
  return self->_presses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presses, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
}

@end
