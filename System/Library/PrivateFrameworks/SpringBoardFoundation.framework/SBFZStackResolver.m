@implementation SBFZStackResolver

- (void)_resolveHomeGestureOwnershipOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  void (**v5)(id, void *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a2, "reverseObjectEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v7)
      goto LABEL_16;
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "preferences");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (((v9 ^ objc_msgSend(v12, "ownsHomeGesture")) & 1) == 0)
        {
          v5[2](v5, v12);
          objc_msgSend(v12, "setOwnsHomeGesture:", !v9);
        }
        v14 = objc_msgSend(v13, "homeGestureConsumption");
        if (v14 == 1)
          goto LABEL_12;
        if (v14)
          goto LABEL_14;
        if (v9)
LABEL_12:
          v9 = 1;
        else
          v9 = objc_msgSend(v13, "activationPolicyForParticipantsBelow") != 0;
LABEL_14:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v8)
      {
LABEL_16:

        break;
      }
    }
  }

}

- (void)_resolveHomeAffordanceDrawingSuppressionOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          objc_msgSend(v12, "preferences");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "homeAffordanceDrawingSuppression");
          if (v14 == 1)
          {
            v9 = 1;
            if ((objc_msgSend(v12, "homeAffordanceDrawingSuppressed") & 1) == 0)
              goto LABEL_11;
          }
          else
          {
            if (!v14)
              v9 &= objc_msgSend(v13, "activationPolicyForParticipantsBelow") == 0;
            if ((v9 & 1) != objc_msgSend(v12, "homeAffordanceDrawingSuppressed"))
            {
LABEL_11:
              v6[2](v6, v12);
              objc_msgSend(v12, "setHomeAffordanceDrawingSuppressed:", v9 & 1);
            }
          }

          ++v11;
        }
        while (v8 != v11);
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v8 = v15;
      }
      while (v15);
    }
  }

}

- (void)_resolveSystemApertureSuppressionOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  int v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v27 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    v7 = 0;
    v8 = 0;
    if (!v27)
      goto LABEL_27;
    v9 = 0;
    obj = v5;
    v26 = *(_QWORD *)v29;
    while (1)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "activationState");
        v13 = objc_msgSend(v11, "activationState");
        objc_msgSend(v11, "preferences");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v12)
          v9 = 0;
        else
          v9 |= objc_msgSend(v14, "suppressSystemApertureForSystemChromeSuppression");
        if (v13 == 2)
        {

          v7 = 0;
          v16 = 0;
LABEL_20:

          goto LABEL_21;
        }
        objc_msgSend(v15, "associatedBundleIdentifiersToSuppressInSystemAperture");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18)
        {
          if (!v8)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "associatedBundleIdentifiersToSuppressInSystemAperture");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "unionSet:", v19);

        }
        v16 = v8;
        objc_msgSend(v15, "associatedSceneIdentifiersToSuppressInSystemAperture");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "associatedSceneIdentifiersToSuppressInSystemAperture");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "unionSet:", v8);
          goto LABEL_20;
        }
LABEL_21:
        v8 = v16;
        v22 = objc_msgSend(v11, "systemApertureSuppressedForSystemChromeSuppression");
        objc_msgSend(v11, "associatedBundleIdentifiersToSuppressInSystemAperture");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "associatedSceneIdentifiersToSuppressInSystemAperture");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!BSEqualSets() || !BSEqualSets() || ((v9 ^ v22) & 1) != 0)
        {
          v6[2](v6, v11);
          objc_msgSend(v11, "setSystemApertureSuppressedForSystemChromeSuppression:", v9 & 1);
          objc_msgSend(v11, "setAssociatedSceneIdentifiersToSuppressInSystemAperture:", v7);
          objc_msgSend(v11, "setAssociatedBundleIdentifiersToSuppressInSystemAperture:", v8);
        }

      }
      v5 = obj;
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (!v27)
      {
LABEL_27:

        break;
      }
    }
  }

}

uint64_t __39__SBFZStackResolver__updateResolutions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)_updateResolutionsForAddedParticipant:(void *)a3 removedParticipant:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  const __CFString *v33;
  unint64_t v34;
  __CFString *v35;
  void *v36;
  unint64_t v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  __CFString *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  __CFString *v56;
  __CFString *v57;
  int v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id obj;
  id v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  __CFString *v82;
  const __CFString *v83;
  _QWORD v84[6];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(id *)(a1 + 16);
    v8 = v5;
    v80 = v5;
    v71 = v6;
    if (v5 || (v8 = v6) != 0)
      v79 = v8;
    else
      v79 = 0;
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v90 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
          _SBFZStackParticipantIdentifierDescription(objc_msgSend(v15, "identifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "copy");
          objc_msgSend(v9, "setObject:forKey:", v17, v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
      }
      while (v12);
    }

    v74 = (void *)a1;
    -[SBFZStackResolver _updateResolutions]((_QWORD *)a1);
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v86;
      v21 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v86 != v20)
            objc_enumerationMutation(obj);
          v23 = *(id *)(*((_QWORD *)&v85 + 1) + 8 * j);
          if (v23 != v79)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * j), "delegate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "zStackParticipantDidChange:", v23);

            v25 = objc_msgSend(v23, "identifier");
            v84[0] = v21;
            v84[1] = 3221225472;
            v84[2] = __78__SBFZStackResolver__updateResolutionsForAddedParticipant_removedParticipant___block_invoke;
            v84[3] = &unk_1E200F098;
            v84[4] = v23;
            v84[5] = v25;
            -[SBFZStackResolver _enumerateObserversOfParticipantWithIdentifier:withBlock:](a1, v25, v84);
          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
      }
      while (v19);
    }
    v75 = v9;
    v26 = v10;
    v76 = v5;
    v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v73 = v26;
    v81 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v93, buf, 16);
    if (v81)
    {
      v77 = *(_QWORD *)v94;
      v27 = 0x1E0CB3000uLL;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v94 != v77)
            objc_enumerationMutation(v73);
          v29 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v28);
          _SBFZStackParticipantIdentifierDescription(objc_msgSend(v29, "identifier"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v5 && (v31 = objc_msgSend(v29, "identifier"), v31 == objc_msgSend(v76, "identifier")))
          {
            v32 = v76;
            v33 = CFSTR("++");
          }
          else
          {
            objc_msgSend(v75, "objectForKey:", v30);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            v33 = &stru_1E2010FC0;
          }
          v83 = v33;
          v34 = objc_msgSend(v29, "activationState");
          if (v34 > 2)
            v35 = 0;
          else
            v35 = off_1E200F290[v34];
          objc_msgSend(v29, "preferences");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "homeAffordanceDrawingSuppression");
          if (v37 > 2)
            v82 = 0;
          else
            v82 = off_1E200F2D8[v37];

          v38 = objc_msgSend(v29, "ownsHomeGesture");
          if (v38 == objc_msgSend(v32, "ownsHomeGesture"))
          {
            v42 = &stru_1E2010FC0;
            if (!objc_msgSend(v29, "ownsHomeGesture"))
              goto LABEL_41;
            v43 = *(void **)(v27 + 2368);
            MEMORY[0x18D773350](objc_msgSend(v29, "ownsHomeGesture"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("ownsHomeGesture: %@; "), v40);
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v39 = *(void **)(v27 + 2368);
            MEMORY[0x18D773350](objc_msgSend(v32, "ownsHomeGesture"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            MEMORY[0x18D773350](objc_msgSend(v29, "ownsHomeGesture"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "stringWithFormat:", CFSTR("ownsHomeGesture: from %@ to %@; "), v40, v41);
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
LABEL_41:
          v44 = objc_msgSend(v29, "activationState");
          if (v44 == objc_msgSend(v32, "activationState"))
          {
            objc_msgSend(*(id *)(v27 + 2368), "stringWithFormat:", CFSTR("%@; "), v35, v69);
          }
          else
          {
            v45 = objc_msgSend(v32, "activationState");
            if (v45 > 2)
              v46 = 0;
            else
              v46 = off_1E200F290[v45];
            objc_msgSend(*(id *)(v27 + 2368), "stringWithFormat:", CFSTR("%@ to %@; "), v46, v35);
          }
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "preferences");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "homeAffordanceDrawingSuppression");
          objc_msgSend(v32, "preferences");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "homeAffordanceDrawingSuppression");

          if (v49 != v51)
          {
            objc_msgSend(v32, "preferences");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "homeAffordanceDrawingSuppression");
            if (v55 > 2)
              v56 = 0;
            else
              v56 = off_1E200F2D8[v55];
            v27 = 0x1E0CB3000uLL;

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suppression: from %@ to %@; "), v56, v82);
            goto LABEL_54;
          }
          objc_msgSend(v29, "preferences");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "homeAffordanceDrawingSuppression");

          if (v53)
          {
            v27 = 0x1E0CB3000uLL;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suppression: %@; "), v82, v70);
LABEL_54:
            v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_55;
          }
          v57 = &stru_1E2010FC0;
          v27 = 0x1E0CB3000;
LABEL_55:
          v58 = objc_msgSend(v29, "participantBelowAllowsDimming");
          v59 = objc_msgSend(v32, "participantBelowAllowsDimming");
          v60 = *(void **)(v27 + 2368);
          if (v58 == v59)
          {
            MEMORY[0x18D773350](objc_msgSend(v29, "participantBelowAllowsDimming"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "stringWithFormat:", CFSTR("participantBelowAllowsDimming: %@"), v61);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            MEMORY[0x18D773350](objc_msgSend(v32, "participantBelowAllowsDimming"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            MEMORY[0x18D773350](objc_msgSend(v29, "participantBelowAllowsDimming"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "stringWithFormat:", CFSTR("participantBelowAllowsDimming: from %@ to %@;"), v61, v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = 0x1E0CB3000;
          }
          v5 = v80;

          objc_msgSend(*(id *)(v27 + 2368), "stringWithFormat:", CFSTR("%@<%@> %@%@%@%@"), v83, v30, v42, v47, v57, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "addObject:", v64);

          ++v28;
        }
        while (v81 != v28);
        v65 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v93, buf, 16);
        v81 = v65;
      }
      while (v65);
    }

    objc_msgSend(v78, "description");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v71;
    if ((BSEqualStrings() & 1) == 0)
    {
      objc_setProperty_nonatomic_copy(v74, v67, v66, 40);
      SBLogZStack();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v100 = v66;
        _os_log_impl(&dword_18AB69000, v68, OS_LOG_TYPE_DEFAULT, "Resolved Stack %{public}@", buf, 0xCu);
      }

    }
  }

}

uint64_t __39__SBFZStackResolver__updateResolutions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v26;
  unsigned int v27;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "preferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "identifier");
  objc_msgSend(v6, "assertIsAboveParticipantIdentifiers");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v6, "assertIsAboveParticipantIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "lastIndex");

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = objc_msgSend(v4, "identifier");
      objc_msgSend(v6, "assertIsAboveParticipantIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "lastIndex");

      if (v8 <= v14)
        v8 = v14;
    }
  }
  v15 = objc_msgSend(v5, "identifier");
  objc_msgSend(v7, "assertIsAboveParticipantIdentifiers");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v7, "assertIsAboveParticipantIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "lastIndex");

    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = objc_msgSend(v5, "identifier");
      objc_msgSend(v7, "assertIsAboveParticipantIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "lastIndex");

      if (v15 <= v21)
        v15 = v21;
    }
  }
  if (v8 < v15)
  {
LABEL_13:
    v22 = -1;
    goto LABEL_14;
  }
  if (v8 <= v15)
  {
    objc_msgSend(v7, "assertIsAboveParticipantIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "containsIndex:", objc_msgSend(v4, "identifier"));

    if ((v24 & 1) == 0)
    {
      objc_msgSend(v6, "assertIsAboveParticipantIdentifiers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "containsIndex:", objc_msgSend(v5, "identifier"));

      v22 = v27;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v22 = 1;
LABEL_14:

  return v22;
}

- (void)_enumerateObserversOfParticipantWithIdentifier:(void *)a3 withBlock:
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD, _QWORD))v5;
  if (a1 && v5)
  {
    v7 = *(void **)(a1 + 24);
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v7;
    objc_msgSend(v8, "numberWithInteger:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v11, "allObjects", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v18;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v18 != v15)
              objc_enumerationMutation(v12);
            v6[2](v6, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v14);
      }

    }
  }

}

- (id)_updateResolutions
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[6];

  v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[2];
    v3 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__SBFZStackResolver__updateResolutions__block_invoke;
    v11[3] = &unk_1E200F0E0;
    v11[4] = a1;
    v11[5] = sel__updateResolutions;
    v4 = v2;
    objc_msgSend(v4, "sortedArrayUsingComparator:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __39__SBFZStackResolver__updateResolutions__block_invoke_2;
    v9[3] = &unk_1E200F108;
    v6 = (id)objc_opt_new();
    v10 = v6;
    v7 = (void *)MEMORY[0x18D774178](v9);
    -[SBFZStackResolver _resolveActivationStateOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v5, v7);
    -[SBFZStackResolver _resolveHomeGestureOwnershipOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v5, v7);
    -[SBFZStackResolver _resolveHomeAffordanceDrawingSuppressionOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v5, v7);
    -[SBFZStackResolver _resolveSystemApertureSuppressionOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v5, v7);
    -[SBFZStackResolver _resolvePhysicalButtonSceneTargetsOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v5, v7);
    -[SBFZStackResolver _resolveCaptureButtonFullFidelityEventRequestingScenesOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v5, v7);
    -[SBFZStackResolver _resolveForegroundCaptureApplicationsOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v5, v7);
    -[SBFZStackResolver _resolveAudioCategoriesDisablingVolumeHUDOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v5, v7);
    -[SBFZStackResolver _resolveParticipantBelowAllowsDimmingOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v5, v7);
    v1 = v6;

  }
  return v1;
}

- (void)_resolvePhysicalButtonSceneTargetsOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "activationState");
          objc_msgSend(v12, "preferences");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v13)
          {
            v16 = v9;
            v9 = 0;
          }
          else
          {
            objc_msgSend(v14, "physicalButtonSceneTargets");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              if (!v9)
                v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v9, "addObjectsFromArray:", v16);
            }
          }

          objc_msgSend(v12, "physicalButtonSceneTargets");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((BSEqualArrays() & 1) == 0)
          {
            v6[2](v6, v12);
            objc_msgSend(v12, "setPhysicalButtonSceneTargets:", v9);
          }

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

  }
}

- (void)_resolveAudioCategoriesDisablingVolumeHUDOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v12, "activationState") == 2)
          {
            v13 = v9;
            v9 = 0;
          }
          else
          {
            objc_msgSend(v12, "preferences");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "audioCategoriesDisablingVolumeHUD");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            SBFAudioCategoriesDisablingVolumeHUDUnion(v9, v14);
            v15 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v15;
          }

          objc_msgSend(v12, "audioCategoriesDisablingVolumeHUD");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((BSEqualSets() & 1) == 0)
          {
            v6[2](v6, v12);
            objc_msgSend(v12, "setAudioCategoriesDisablingVolumeHUD:", v9);
          }

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);

    }
  }

}

- (void)_resolveActivationStateOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  void (**v5)(id, void *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(a2, "reverseObjectEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v12, "activationState") != v9)
          {
            v5[2](v5, v12);
            objc_msgSend(v12, "setActivationState:", v9);
          }
          objc_msgSend(v12, "preferences");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "activationPolicyForParticipantsBelow");
          if (v9 <= 1)
            v15 = 1;
          else
            v15 = v9;
          if (v14 != 1)
            v15 = v9;
          if (v14 == 2)
            v9 = 2;
          else
            v9 = v15;

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
}

void __78__SBFZStackResolver__updateResolutionsForAddedParticipant_removedParticipant___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "zStackParticipantWithIdentifier:settingsDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (SBFZStackResolver)init
{
  SBFZStackResolver *v2;
  NSMutableArray *v3;
  NSMutableArray *participants;
  uint64_t v5;
  NSMapTable *participantObservers;
  uint64_t v7;
  SBFZStackParticipant *highestZStackParticipant;
  id v9;
  void *v10;
  uint64_t v11;
  BSInvalidatable *stateCaptureHandle;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBFZStackResolver;
  v2 = -[SBFZStackResolver init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    participants = v2->_participants;
    v2->_participants = v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    participantObservers = v2->_participantObservers;
    v2->_participantObservers = (NSMapTable *)v5;

    -[SBFZStackResolver acquireParticipantWithIdentifier:delegate:](v2, "acquireParticipantWithIdentifier:delegate:", 30, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    highestZStackParticipant = v2->_highestZStackParticipant;
    v2->_highestZStackParticipant = (SBFZStackParticipant *)v7;

    objc_initWeak(&location, v2);
    v9 = MEMORY[0x1E0C80D38];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SpringBoard - Z Stack Resolver - %p"), v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v14, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v11 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (BSInvalidatable *)v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __25__SBFZStackResolver_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  SBFZStackResolver *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v2 = self;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  if (self)
    self = (SBFZStackResolver *)self->_participants;
  v3 = (void *)-[SBFZStackResolver copy](self, "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[SBFZStackResolver _unregisterParticipant:]((uint64_t)v2, *(void **)(*((_QWORD *)&v9 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[BSInvalidatable invalidate](v2->_stateCaptureHandle, "invalidate");
  v8.receiver = v2;
  v8.super_class = (Class)SBFZStackResolver;
  -[SBFZStackResolver dealloc](&v8, sel_dealloc);
}

- (uint64_t)participants
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)_unregisterParticipant:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "identifier");
    v6 = MEMORY[0x1E0C809B0];
    v7 = *(void **)(a1 + 16);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __44__SBFZStackResolver__unregisterParticipant___block_invoke;
    v17[3] = &__block_descriptor_40_e30_B16__0__SBFZStackParticipant_8l;
    v17[4] = v5;
    objc_msgSend(v7, "bs_firstObjectPassingTest:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__unregisterParticipant_, a1, CFSTR("SBFZStackResolver.m"), 171, CFSTR("Cannot unregister participant, because it isn't registered to begin with. Participant to unregister:%@, registered participants:%@"), v4, *(_QWORD *)(a1 + 16));

    }
    SBLogZStack();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      _SBFZStackParticipantIdentifierDescription(objc_msgSend(v4, "identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v10;
      _os_log_impl(&dword_18AB69000, v9, OS_LOG_TYPE_DEFAULT, "Unregistered participant: <%{public}@>", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 16), "removeObject:", v4);
    objc_msgSend(v4, "setResolver:", 0);
    -[SBFZStackResolver _updateResolutionsForAddedParticipant:removedParticipant:](a1, 0, v4);
    if (objc_msgSend(v4, "ownsHomeGesture"))
    {
      objc_msgSend(v4, "setOwnsHomeGesture:", 0);
      objc_msgSend(v4, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "zStackParticipantDidChange:", v4);

      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __44__SBFZStackResolver__unregisterParticipant___block_invoke_30;
      v14[3] = &unk_1E200F098;
      v16 = v5;
      v15 = v4;
      -[SBFZStackResolver _enumerateObserversOfParticipantWithIdentifier:withBlock:](a1, v5, v14);

    }
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __44__SBFZStackResolver__unregisterParticipant___block_invoke_2;
    v13[3] = &__block_descriptor_40_e40_v16__0___SBFZStackParticipantObserver__8l;
    v13[4] = v5;
    -[SBFZStackResolver _enumerateObserversOfParticipantWithIdentifier:withBlock:](a1, v5, v13);

  }
}

- (id)acquireParticipantWithIdentifier:(int64_t)a3 delegate:(id)a4
{
  id v6;
  SBFZStackParticipant *v7;

  v6 = a4;
  v7 = -[SBFZStackParticipant initWithIdentifier:delegate:]([SBFZStackParticipant alloc], "initWithIdentifier:delegate:", a3, v6);

  -[SBFZStackResolver _registerParticipant:]((uint64_t)self, v7);
  return v7;
}

- (void)_registerParticipant:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "identifier");
    v6 = MEMORY[0x1E0C809B0];
    v7 = *(void **)(a1 + 16);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __42__SBFZStackResolver__registerParticipant___block_invoke;
    v15[3] = &__block_descriptor_40_e30_B16__0__SBFZStackParticipant_8l;
    v15[4] = v5;
    objc_msgSend(v7, "bs_firstObjectPassingTest:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerParticipant_, a1, CFSTR("SBFZStackResolver.m"), 143, CFSTR("Cannot register participant, there's already a participant with the same identifier. Participant to register:%@, registered participants:%@"), v4, *(_QWORD *)(a1 + 16));

    }
    SBLogZStack();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      _SBFZStackParticipantIdentifierDescription(objc_msgSend(v4, "identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      _os_log_impl(&dword_18AB69000, v9, OS_LOG_TYPE_DEFAULT, "Registered participant: <%{public}@>", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 16), "addObject:", v4);
    objc_msgSend(*(id *)(a1 + 16), "sortUsingComparator:", &__block_literal_global_20);
    objc_msgSend(v4, "_updatePreferences");
    objc_msgSend(v4, "setResolver:", a1);
    -[SBFZStackResolver _updateResolutionsForAddedParticipant:removedParticipant:](a1, v4, 0);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __42__SBFZStackResolver__registerParticipant___block_invoke_2;
    v12[3] = &unk_1E200F098;
    v14 = v5;
    v13 = v4;
    -[SBFZStackResolver _enumerateObserversOfParticipantWithIdentifier:withBlock:](a1, v5, v12);

  }
}

- (id)addObserver:(id)a3 ofParticipantWithIdentifier:(int64_t)a4
{
  id v7;
  NSMapTable *participantObservers;
  NSMapTable *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *participants;
  void *v14;
  void *v16;
  _QWORD v17[5];

  v7 = a3;
  if (v7)
  {
    if (self)
    {
LABEL_3:
      participantObservers = self->_participantObservers;
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFZStackResolver.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

    if (self)
      goto LABEL_3;
  }
  participantObservers = 0;
LABEL_4:
  v9 = participantObservers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v9, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(v11, "addObject:", v7);
  if (self)
    participants = self->_participants;
  else
    participants = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__SBFZStackResolver_addObserver_ofParticipantWithIdentifier___block_invoke;
  v17[3] = &__block_descriptor_40_e30_B16__0__SBFZStackParticipant_8l;
  v17[4] = a4;
  -[NSMutableArray bs_firstObjectPassingTest:](participants, "bs_firstObjectPassingTest:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (uint64_t)participantObservers
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

BOOL __61__SBFZStackResolver_addObserver_ofParticipantWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier") == *(_QWORD *)(a1 + 32);
}

- (void)removeObserver:(id)a3 ofParticipantWithIdentifier:(int64_t)a4
{
  NSMapTable *participantObservers;
  NSMapTable *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFZStackResolver.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

    if (self)
      goto LABEL_3;
LABEL_9:
    participantObservers = 0;
    goto LABEL_4;
  }
  if (!self)
    goto LABEL_9;
LABEL_3:
  participantObservers = self->_participantObservers;
LABEL_4:
  v8 = participantObservers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "removeObject:", v15);
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](v8, "removeObjectForKey:", v13);

    }
  }

}

- (NSArray)_registeredParticipants
{
  NSMutableArray *v3;
  SBFZStackParticipant *highestZStackParticipant;
  void *v5;

  if (self)
  {
    v3 = self->_participants;
    highestZStackParticipant = self->_highestZStackParticipant;
  }
  else
  {
    v3 = 0;
    highestZStackParticipant = 0;
  }
  -[NSMutableArray removeObject:](v3, "removeObject:", highestZStackParticipant);
  v5 = (void *)-[NSMutableArray copy](v3, "copy");

  return (NSArray *)v5;
}

- (uint64_t)highestZStackParticipant
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

BOOL __42__SBFZStackResolver__registerParticipant___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier") == *(_QWORD *)(a1 + 32);
}

BOOL __42__SBFZStackResolver__registerParticipant___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "identifier");
  v6 = objc_msgSend(v4, "identifier");

  return v5 < v6;
}

void __42__SBFZStackResolver__registerParticipant___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "zStackParticipantWithIdentifier:wasAcquiredWithSettings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

BOOL __44__SBFZStackResolver__unregisterParticipant___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier") == *(_QWORD *)(a1 + 32);
}

void __44__SBFZStackResolver__unregisterParticipant___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "zStackParticipantWithIdentifier:settingsDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

void __44__SBFZStackResolver__unregisterParticipant___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "zStackParticipantWasInvalidated:", *(_QWORD *)(a1 + 32));

}

- (void)_setNeedsUpdateFromParticipant:(uint64_t)a1
{
  if (a1)
    -[SBFZStackResolver _updateResolutionsForAddedParticipant:removedParticipant:](a1, 0, 0);
}

- (void)_resolveCaptureButtonFullFidelityEventRequestingScenesOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "activationState");
          objc_msgSend(v12, "preferences");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v13)
          {
            v16 = v9;
            v9 = 0;
          }
          else
          {
            objc_msgSend(v14, "captureButtonFullFidelityEventRequestingScenes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              if (!v9)
                v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v9, "addObjectsFromArray:", v16);
            }
          }

          objc_msgSend(v12, "captureButtonFullFidelityEventRequestingScenes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((BSEqualArrays() & 1) == 0)
          {
            v6[2](v6, v12);
            objc_msgSend(v12, "setCaptureButtonFullFidelityEventRequestingScenes:", v9);
          }

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

  }
}

- (void)_resolveForegroundCaptureApplicationsOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "activationState");
          objc_msgSend(v12, "preferences");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v13)
          {
            v16 = v9;
            v9 = 0;
          }
          else
          {
            objc_msgSend(v14, "foregroundCaptureSceneTargets");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              if (!v9)
                v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v9, "addObjectsFromArray:", v16);
            }
          }

          objc_msgSend(v12, "foregroundCaptureSceneTargets");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((BSEqualArrays() & 1) == 0)
          {
            v6[2](v6, v12);
            objc_msgSend(v12, "setForegroundCaptureSceneTargets:", v9);
          }

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

  }
}

- (void)_resolveParticipantBelowAllowsDimmingOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((v9 & 1) != objc_msgSend(v12, "participantBelowAllowsDimming"))
          {
            v6[2](v6, v12);
            objc_msgSend(v12, "setParticipantBelowAllowsDimming:", v9 & 1);
          }
          if (objc_msgSend(v12, "activationState") == 1)
          {
            objc_msgSend(v12, "preferences");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "allowsDimmingWhenForegroundInactive");

            if (v14 == 2)
            {
              v9 = 0;
            }
            else if (v14 == 1)
            {
              v9 = 1;
            }
          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
  }

}

- (void)setResolvedStackDescription:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 40);
}

- (NSString)description
{
  return (NSString *)-[SBFZStackResolver descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFZStackResolver succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFZStackResolver descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBFZStackResolver *v11;

  v4 = a3;
  -[SBFZStackResolver succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SBFZStackResolver_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E200E2A0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

uint64_t __59__SBFZStackResolver_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 16);
  else
    v4 = 0;
  return objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("participants"), 0);
}

- (uint64_t)stateCaptureHandle
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void)setStateCaptureHandle:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)setParticipants:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setParticipantObservers:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setHighestZStackParticipant:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (uint64_t)resolvedStackDescription
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedStackDescription, 0);
  objc_storeStrong((id *)&self->_highestZStackParticipant, 0);
  objc_storeStrong((id *)&self->_participantObservers, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
}

@end
