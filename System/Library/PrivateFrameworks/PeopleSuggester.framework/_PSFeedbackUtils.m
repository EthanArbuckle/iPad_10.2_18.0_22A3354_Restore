@implementation _PSFeedbackUtils

+ (id)feedbackPayloadWithIndex:(id)a3 reasonType:(id)a4 reason:(id)a5 sourceBundleId:(id)a6 transportBundleId:(id)a7 numberOfVisibleSuggestions:(id)a8 sessionId:(id)a9 delay:(id)a10 testEvent:(id)a11 iCloudFamilyInvocation:(id)a12 engagementType:(int64_t)a13 trialID:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;

  v19 = a3;
  v58 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v59 = a8;
  v60 = a9;
  v23 = a10;
  v24 = (void *)MEMORY[0x1E0C99E08];
  v25 = a14;
  v26 = a12;
  v55 = a11;
  objc_msgSend(v24, "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v19;
  v56 = v26;
  v28 = v21;
  if (objc_msgSend(v19, "integerValue") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("indexSelected"));

  }
  else
  {
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, CFSTR("indexSelected"));
  }
  v30 = v22;
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("indexSelected"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31 == v32)
  {
    v33 = v58;
    v34 = v28;
    if ((objc_msgSend(v58, "containsString:", CFSTR("PS Rewrite")) & 1) == 0
      && !objc_msgSend(v58, "containsString:", CFSTR("PS Legacy")))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v48, CFSTR("reason"));

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v49, CFSTR("reasonType"));

LABEL_29:
      v35 = v59;
      if (v34)
        goto LABEL_30;
LABEL_25:
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v45, CFSTR("sourceBundleID"));

      if (v30)
        goto LABEL_31;
      goto LABEL_26;
    }
    v35 = v59;
    if (v58)
    {
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v58, CFSTR("reasonType"));
      if (v20)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v43, CFSTR("reasonType"));

      if (v20)
      {
LABEL_11:
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v20, CFSTR("reason"));
        if (v34)
          goto LABEL_30;
        goto LABEL_25;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v44, CFSTR("reason"));

    if (v34)
      goto LABEL_30;
    goto LABEL_25;
  }
  if (v58)
  {
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v58, CFSTR("reasonType"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v36, CFSTR("reasonType"));

  }
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("reasonType"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v38 = v20;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("reasonType"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "containsString:", CFSTR("_PSRuleMiningModel"));

    v34 = v28;
    if (v40)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v41, CFSTR("reason"));

      v20 = v38;
      v30 = v22;
      v33 = v58;
      goto LABEL_29;
    }
  }
  else
  {

    v34 = v28;
  }
  v20 = v38;
  v35 = v59;
  if (v38)
  {
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v38, CFSTR("reason"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v42, CFSTR("reason"));

  }
  v30 = v22;
  v33 = v58;
  if (!v34)
    goto LABEL_25;
LABEL_30:
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, CFSTR("sourceBundleID"));
  if (v30)
  {
LABEL_31:
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("transportBundleID"));
    if (v35)
      goto LABEL_32;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v47, CFSTR("numberOfVisibleSuggestions"));

    goto LABEL_33;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v46, CFSTR("transportBundleID"));

  if (!v35)
    goto LABEL_27;
LABEL_32:
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v35, CFSTR("numberOfVisibleSuggestions"));
LABEL_33:
  if (v60)
  {
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v60, CFSTR("sessionID"));
    if (v23)
    {
LABEL_35:
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v23, CFSTR("delay"));
      goto LABEL_38;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v50, CFSTR("sessionID"));

    if (v23)
      goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v51, CFSTR("delay"));

LABEL_38:
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v55, CFSTR("testEvent"));

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v56, CFSTR("iCloudFamilyInvocation"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a13);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v52, CFSTR("engagementType"));

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v25, CFSTR("trackingID"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v25, CFSTR("trialSessionID"));
  LODWORD(v52) = objc_msgSend(v25, "isEqualToString:", CFSTR("null"));

  if ((_DWORD)v52)
    v53 = MEMORY[0x1E0C9AAA0];
  else
    v53 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v53, CFSTR("inTrialSession"));

  return v27;
}

@end
