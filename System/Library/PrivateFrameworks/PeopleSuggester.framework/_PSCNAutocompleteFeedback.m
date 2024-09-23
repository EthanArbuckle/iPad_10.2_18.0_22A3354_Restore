@implementation _PSCNAutocompleteFeedback

- (_PSCNAutocompleteFeedback)initWithBundleIdentifier:(id)a3 feedbackType:(int64_t)a4 isImplicit:(BOOL)a5 entered:(id)a6 exited:(id)a7 vendedSuggestions:(id)a8 tappedSuggestion:(id)a9 typedHandle:(id)a10 erasedHandle:(id)a11
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  void *v26;
  id v27;
  _BOOL4 v30;
  _PSCNAutocompleteFeedback *v31;

  v30 = a5;
  v15 = (void *)MEMORY[0x1E0C99D68];
  v27 = a11;
  v25 = a10;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v24 = a3;
  objc_msgSend(v15, "now");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSUserName();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "processName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[_PSCNAutocompleteFeedback initWithDataVersion:reportTime:userIdentifier:bundleIdentifier:sourceBundleIdentifier:isImplicit:feedbackType:entered:exited:vendedSuggestions:tappedSuggestion:typedHandle:erasedHandle:](self, "initWithDataVersion:reportTime:userIdentifier:bundleIdentifier:sourceBundleIdentifier:isImplicit:feedbackType:entered:exited:vendedSuggestions:tappedSuggestion:typedHandle:erasedHandle:", 3, v26, v20, v24, v22, v30, a4, v19, v18, v17, v16, v25, v27);

  return v31;
}

- (_PSCNAutocompleteFeedback)initWithDataVersion:(unsigned int)a3 reportTime:(id)a4 userIdentifier:(id)a5 bundleIdentifier:(id)a6 sourceBundleIdentifier:(id)a7 isImplicit:(BOOL)a8 feedbackType:(int64_t)a9 entered:(id)a10 exited:(id)a11 vendedSuggestions:(id)a12 tappedSuggestion:(id)a13 typedHandle:(id)a14 erasedHandle:(id)a15
{
  id v18;
  id v19;
  _PSCNAutocompleteFeedback *v20;
  _PSCNAutocompleteFeedback *v21;
  id *p_entered;
  id v23;
  id v27;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v18 = a4;
  v37 = a5;
  v27 = a6;
  v36 = a6;
  v35 = a7;
  v34 = a10;
  v33 = a11;
  v32 = a12;
  v31 = a13;
  v30 = a14;
  v19 = a15;
  v38.receiver = self;
  v38.super_class = (Class)_PSCNAutocompleteFeedback;
  v20 = -[_PSCNAutocompleteFeedback init](&v38, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_dataVersion = a3;
    objc_storeStrong((id *)&v20->_userIdentifier, a5);
    objc_storeStrong((id *)&v21->_reportTime, a4);
    objc_storeStrong((id *)&v21->_bundleIdentifier, v27);
    objc_storeStrong((id *)&v21->_sourceBundleIdentifier, a7);
    v21->_isImplicit = a8;
    v21->_feedbackType = a9;
    switch(a9)
    {
      case 0:
        p_entered = (id *)&v21->_entered;
        v23 = a10;
        goto LABEL_9;
      case 1:
        p_entered = (id *)&v21->_exited;
        v23 = a11;
        goto LABEL_9;
      case 2:
        p_entered = (id *)&v21->_vendedSuggestions;
        v23 = a12;
        goto LABEL_9;
      case 3:
        p_entered = (id *)&v21->_tappedSuggestion;
        v23 = a13;
        goto LABEL_9;
      case 4:
        p_entered = (id *)&v21->_typedHandle;
        v23 = a14;
        goto LABEL_9;
      case 5:
        p_entered = (id *)&v21->_erasedHandle;
        v23 = a15;
LABEL_9:
        objc_storeStrong(p_entered, v23);
        break;
      default:
        v21->_feedbackType = 6;
        break;
    }
  }

  return v21;
}

- (_PSCNAutocompleteFeedback)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v15;
  void *v16;
  void *v17;
  unsigned int v18;
  _PSCNAutocompleteFeedback *v19;

  v3 = a3;
  v18 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("dataVersion"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reportTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceBundleIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isImplicit"));
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("feedbackType"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entered"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exited"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendedSuggestions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tappedSuggestion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typedHandle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("erasedHandle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[_PSCNAutocompleteFeedback initWithDataVersion:reportTime:userIdentifier:bundleIdentifier:sourceBundleIdentifier:isImplicit:feedbackType:entered:exited:vendedSuggestions:tappedSuggestion:typedHandle:erasedHandle:](self, "initWithDataVersion:reportTime:userIdentifier:bundleIdentifier:sourceBundleIdentifier:isImplicit:feedbackType:entered:exited:vendedSuggestions:tappedSuggestion:typedHandle:erasedHandle:", v18, v4, v5, v17, v16, v15, v6, v7, v8, v9, v10, v11, v12);
  return v19;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;

  -[_PSCNAutocompleteFeedback entered](self, "entered");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0x1E0CB3000uLL;
  if (v3)
  {
    -[_PSCNAutocompleteFeedback entered](self, "entered");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "enterStatus");

    if (v6)
    {
      -[_PSCNAutocompleteFeedback entered](self, "entered");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "enterStatus");

      if (v8 == 1)
        v9 = CFSTR("\nenterStatus: Resumed");
      else
        v9 = CFSTR("\nenterStatus: Unknown");
    }
    else
    {
      v9 = CFSTR("\nenterStatus: Started");
    }
    v15 = CFSTR("entered");
  }
  else
  {
    -[_PSCNAutocompleteFeedback exited](self, "exited");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[_PSCNAutocompleteFeedback exited](self, "exited");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "exitStatus");

      if (v12)
      {
        -[_PSCNAutocompleteFeedback exited](self, "exited");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "exitStatus");

        if (v14 == 1)
          v9 = CFSTR("\nexitStatus: Paused");
        else
          v9 = CFSTR("\nexitStatus: Unknown");
      }
      else
      {
        v9 = CFSTR("\nexitStatus: Finished");
      }
      v15 = CFSTR("exited");
    }
    else
    {
      -[_PSCNAutocompleteFeedback vendedSuggestions](self, "vendedSuggestions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v65 = (void *)MEMORY[0x1E0CB3940];
        -[_PSCNAutocompleteFeedback vendedSuggestions](self, "vendedSuggestions");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "suggestions");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "firstObject");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "trialID");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSCNAutocompleteFeedback vendedSuggestions](self, "vendedSuggestions");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "suggestions");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v74, "count");
        -[_PSCNAutocompleteFeedback vendedSuggestions](self, "vendedSuggestions");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "suggestions");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "firstObject");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "groupName");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSCNAutocompleteFeedback vendedSuggestions](self, "vendedSuggestions");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "suggestions");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "firstObject");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "recipients");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v66, "count");
        -[_PSCNAutocompleteFeedback vendedSuggestions](self, "vendedSuggestions");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "suggestions");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "firstObject");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "recipients");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "description");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSCNAutocompleteFeedback vendedSuggestions](self, "vendedSuggestions");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "suggestions");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "lastObject");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "groupName");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSCNAutocompleteFeedback vendedSuggestions](self, "vendedSuggestions");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "suggestions");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "recipients");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");
        -[_PSCNAutocompleteFeedback vendedSuggestions](self, "vendedSuggestions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "suggestions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "recipients");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "description");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "stringWithFormat:", CFSTR("\ntrialID: %@ \ncountSuggestions: %lu \nfirstSuggestionGroupName: %@ \nfirstSuggestionCountRecipients: %lu \nfirstSuggestionRecipients: %@ \nlastSuggestionGroupName: %@ \nlastSuggestionCountRecipients: %lu \nlastSuggestionRecipients: %@"), v86, v61, v84, v56, v53, v52, v19, v24);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v4 = 0x1E0CB3000;
        v15 = CFSTR("vendedSuggestions");
      }
      else
      {
        -[_PSCNAutocompleteFeedback tappedSuggestion](self, "tappedSuggestion");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v79 = (void *)MEMORY[0x1E0CB3940];
          -[_PSCNAutocompleteFeedback tappedSuggestion](self, "tappedSuggestion");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "suggestion");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "trialID");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSCNAutocompleteFeedback tappedSuggestion](self, "tappedSuggestion");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "suggestion");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "groupName");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSCNAutocompleteFeedback tappedSuggestion](self, "tappedSuggestion");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "suggestion");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "recipients");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "count");
          -[_PSCNAutocompleteFeedback tappedSuggestion](self, "tappedSuggestion");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "suggestion");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "recipients");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "description");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "stringWithFormat:", CFSTR("\ntrialID: %@ \ngroupName: %@ \ncountRecipients:%lu \nrecipients: %@"), v75, v73, v35, v39);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v4 = 0x1E0CB3000;
          v15 = CFSTR("tappedSuggestion");
        }
        else
        {
          -[_PSCNAutocompleteFeedback typedHandle](self, "typedHandle");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            v41 = (void *)MEMORY[0x1E0CB3940];
            -[_PSCNAutocompleteFeedback typedHandle](self, "typedHandle");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v42, "viaContactPicker"))
              v43 = CFSTR("YES");
            else
              v43 = CFSTR("NO");
            -[_PSCNAutocompleteFeedback typedHandle](self, "typedHandle");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "contact");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "description");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringWithFormat:", CFSTR("\nviaContactPicker: %@\ncontact: %@"), v43, v46);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v15 = CFSTR("typedHandle");
          }
          else
          {
            -[_PSCNAutocompleteFeedback erasedHandle](self, "erasedHandle");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (v47)
            {
              v48 = (void *)MEMORY[0x1E0CB3940];
              -[_PSCNAutocompleteFeedback erasedHandle](self, "erasedHandle");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "contact");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "description");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "stringWithFormat:", CFSTR("\ncontact: %@"), v51);
              v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v15 = CFSTR("erasedHandle");
            }
            else
            {
              v9 = &stru_1E4402490;
              v15 = CFSTR("unknown");
            }
          }
        }
      }
    }
  }
  v25 = *(void **)(v4 + 2368);
  v26 = objc_opt_class();
  -[_PSCNAutocompleteFeedback reportTime](self, "reportTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSCNAutocompleteFeedback bundleIdentifier](self, "bundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_PSCNAutocompleteFeedback isImplicit](self, "isImplicit"))
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@ %p>\nreportTime: %@\nbundleId: %@\nisImplicit: %@\nfeedbackType: %@%@"), v26, self, v27, v28, v29, v15, v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v30;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t dataVersion;
  id v5;

  dataVersion = self->_dataVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", dataVersion, CFSTR("dataVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reportTime, CFSTR("reportTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIdentifier, CFSTR("userIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceBundleIdentifier, CFSTR("sourceBundleIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isImplicit, CFSTR("isImplicit"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_feedbackType, CFSTR("feedbackType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entered, CFSTR("entered"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_exited, CFSTR("exited"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendedSuggestions, CFSTR("vendedSuggestions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tappedSuggestion, CFSTR("tappedSuggestion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typedHandle, CFSTR("typedHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_erasedHandle, CFSTR("erasedHandle"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;

  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = a3;
  v17 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v17;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[_PSCNAutocompleteFeedback eventWithData:dataVersion:].cold.1((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);

  }
  return v6;
}

- (id)serialize
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v13;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_PSCNAutocompleteFeedback serialize].cold.1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  }
  return v2;
}

+ (id)createEnteredFeedbackWithBundleIdentifier:(id)a3 status:(int64_t)a4
{
  id v6;
  id v7;
  _PSCNAutocompleteFeedbackEntered *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  v8 = -[_PSCNAutocompleteFeedbackEntered initWithEnterStatus:]([_PSCNAutocompleteFeedbackEntered alloc], "initWithEnterStatus:", a4);
  v9 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:feedbackType:isImplicit:entered:exited:vendedSuggestions:tappedSuggestion:typedHandle:erasedHandle:", v6, 0, 0, v8, 0, 0, 0, 0, 0);

  return v9;
}

+ (id)createExitedFeedbackWithBundleIdentifier:(id)a3 status:(int64_t)a4
{
  id v6;
  id v7;
  _PSCNAutocompleteFeedbackExited *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  v8 = -[_PSCNAutocompleteFeedbackExited initWithExitStatus:]([_PSCNAutocompleteFeedbackExited alloc], "initWithExitStatus:", a4);
  v9 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:feedbackType:isImplicit:entered:exited:vendedSuggestions:tappedSuggestion:typedHandle:erasedHandle:", v6, 1, 0, 0, v8, 0, 0, 0, 0);

  return v9;
}

+ (id)createVendedSuggestionsFeedbackWithBundleIdentifier:(id)a3 suggestions:(id)a4 isImplicit:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  _PSCNAutocompleteFeedbackVendedSuggestions *v11;
  void *v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)a1);
  v11 = -[_PSCNAutocompleteFeedbackVendedSuggestions initWithSuggestions:]([_PSCNAutocompleteFeedbackVendedSuggestions alloc], "initWithSuggestions:", v8);

  v12 = (void *)objc_msgSend(v10, "initWithBundleIdentifier:feedbackType:isImplicit:entered:exited:vendedSuggestions:tappedSuggestion:typedHandle:erasedHandle:", v9, 2, v5, 0, 0, v11, 0, 0, 0);
  return v12;
}

+ (id)createVendedSuggestionsFeedbackWithBundleIdentifier:(id)a3 suggestions:(id)a4
{
  return (id)objc_msgSend(a1, "createVendedSuggestionsFeedbackWithBundleIdentifier:suggestions:isImplicit:", a3, a4, 0);
}

+ (id)createTappedSuggestionFeedbackWithBundleIdentifier:(id)a3 suggestion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _PSCNAutocompleteFeedbackTappedSuggestion *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v9 = -[_PSCNAutocompleteFeedbackTappedSuggestion initWithSuggestion:]([_PSCNAutocompleteFeedbackTappedSuggestion alloc], "initWithSuggestion:", v6);

  v10 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:feedbackType:isImplicit:entered:exited:vendedSuggestions:tappedSuggestion:typedHandle:erasedHandle:", v7, 3, 0, 0, 0, 0, v9, 0, 0);
  return v10;
}

+ (id)createTypedHandleFeedbackWithBundleIdentifier:(id)a3 contact:(id)a4 viaContactPicker:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  _PSCNAutocompleteFeedbackTypedHandle *v11;
  void *v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)a1);
  v11 = -[_PSCNAutocompleteFeedbackTypedHandle initWithContact:viaContactPicker:]([_PSCNAutocompleteFeedbackTypedHandle alloc], "initWithContact:viaContactPicker:", v8, v5);

  v12 = (void *)objc_msgSend(v10, "initWithBundleIdentifier:feedbackType:isImplicit:entered:exited:vendedSuggestions:tappedSuggestion:typedHandle:erasedHandle:", v9, 4, 0, 0, 0, 0, 0, v11, 0);
  return v12;
}

+ (id)createErasedHandleFeedbackWithBundleIdentifier:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  id v8;
  _PSCNAutocompleteFeedbackErasedHandle *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v9 = -[_PSCNAutocompleteFeedbackErasedHandle initWithContact:]([_PSCNAutocompleteFeedbackErasedHandle alloc], "initWithContact:", v6);

  v10 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:feedbackType:isImplicit:entered:exited:vendedSuggestions:tappedSuggestion:typedHandle:erasedHandle:", v7, 5, 0, 0, 0, 0, 0, 0, v9);
  return v10;
}

- (int64_t)feedbackType
{
  return self->_feedbackType;
}

- (void)setFeedbackType:(int64_t)a3
{
  self->_feedbackType = a3;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (void)setDataVersion:(unsigned int)a3
{
  self->_dataVersion = a3;
}

- (NSDate)reportTime
{
  return self->_reportTime;
}

- (void)setReportTime:(id)a3
{
  objc_storeStrong((id *)&self->_reportTime, a3);
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentifier, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, a3);
}

- (BOOL)isImplicit
{
  return self->_isImplicit;
}

- (void)setIsImplicit:(BOOL)a3
{
  self->_isImplicit = a3;
}

- (_PSCNAutocompleteFeedbackEntered)entered
{
  return self->_entered;
}

- (void)setEntered:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_PSCNAutocompleteFeedbackExited)exited
{
  return self->_exited;
}

- (void)setExited:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_PSCNAutocompleteFeedbackVendedSuggestions)vendedSuggestions
{
  return self->_vendedSuggestions;
}

- (void)setVendedSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (_PSCNAutocompleteFeedbackTappedSuggestion)tappedSuggestion
{
  return self->_tappedSuggestion;
}

- (void)setTappedSuggestion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (_PSCNAutocompleteFeedbackTypedHandle)typedHandle
{
  return self->_typedHandle;
}

- (void)setTypedHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (_PSCNAutocompleteFeedbackErasedHandle)erasedHandle
{
  return self->_erasedHandle;
}

- (void)setErasedHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_erasedHandle, 0);
  objc_storeStrong((id *)&self->_typedHandle, 0);
  objc_storeStrong((id *)&self->_tappedSuggestion, 0);
  objc_storeStrong((id *)&self->_vendedSuggestions, 0);
  objc_storeStrong((id *)&self->_exited, 0);
  objc_storeStrong((id *)&self->_entered, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_reportTime, 0);
}

+ (void)eventWithData:(uint64_t)a3 dataVersion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "_PSCNAutocompleteFeedback: ERROR unarchiving Biome event: %@", a5, a6, a7, a8, 2u);
}

- (void)serialize
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "_PSCNAutocompleteFeedback: ERROR serializing Biome event: %@", a5, a6, a7, a8, 2u);
}

@end
