@implementation WFRemoteExecutionIncomingAskEachTimeSession

- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4 responseDestinations:(id)a5 responseOptions:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFRemoteExecutionAskEachTimeRequest *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  _BOOL4 v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  id v74;
  NSObject *v75;
  NSObject *v76;
  WFRemoteExecutionAskEachTimeRequestResponse *v77;
  NSObject *v78;
  void *v79;
  WFRemoteExecutionAskEachTimeRequestResponse *v80;
  void *v81;
  void *v82;
  WFRemoteExecutionAskEachTimeRequestResponse *v83;
  void *v84;
  WFRemoteExecutionAskEachTimeRequestResponse *v85;
  void *v86;
  void *v87;
  WFRemoteExecutionAskEachTimeRequestResponse *v88;
  void *v89;
  void *v90;
  void *v91;
  WFRemoteExecutionIncomingAskEachTimeSession *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  void *obj;
  void *v99;
  void *v100;
  _QWORD v101[4];
  id v102;
  WFRemoteExecutionIncomingAskEachTimeSession *v103;
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  id v118;
  id v119;
  _BYTE v120[128];
  _BYTE v121[128];
  uint8_t v122[128];
  uint8_t buf[4];
  const char *v124;
  __int16 v125;
  id v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  uint64_t v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionIncomingAskEachTimeSession.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("protobuf"));

    if (v13)
      goto LABEL_3;
LABEL_69:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionIncomingAskEachTimeSession.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinations"));

    goto LABEL_3;
  }
  if (!v13)
    goto LABEL_69;
LABEL_3:
  -[WFRemoteExecutionIncomingAskEachTimeSession setLastKnownDestinations:](self, "setLastKnownDestinations:", v13);
  -[WFRemoteExecutionIncomingAskEachTimeSession setLastKnownOptions:](self, "setLastKnownOptions:", v14);
  -[WFRemoteExecutionSession setState:](self, "setState:", 200);
  v15 = [WFRemoteExecutionAskEachTimeRequest alloc];
  objc_msgSend(v11, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = 0;
  v17 = -[WFRemoteExecutionAskEachTimeRequest initWithData:error:](v15, "initWithData:error:", v16, &v119);
  v18 = v119;

  v100 = (void *)v17;
  if (!v17)
  {
    v69 = +[WFRemoteExecutionRequest isUnsupportedVersionError:](WFRemoteExecutionRequest, "isUnsupportedVersionError:", v18);
    getWFRemoteExecutionLogObject();
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (v69)
    {
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v124 = "-[WFRemoteExecutionIncomingAskEachTimeSession handleIncomingProtobuf:currentlyActiveSessions:responseDest"
               "inations:responseOptions:]";
        _os_log_impl(&dword_1C15B3000, v71, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of ask each time request", buf, 0xCu);
      }

      -[WFRemoteExecutionSession setState:](self, "setState:", 2);
      objc_msgSend(v11, "data");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = 0;
      +[WFRemoteExecutionRequest identifierFromData:error:](WFRemoteExecutionRequest, "identifierFromData:error:", v72, &v118);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v118;

      getWFRemoteExecutionLogObject();
      v75 = objc_claimAutoreleasedReturnValue();
      v76 = v75;
      if (v73)
      {
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v124 = "-[WFRemoteExecutionIncomingAskEachTimeSession handleIncomingProtobuf:currentlyActiveSessions:responseDe"
                 "stinations:responseOptions:]";
          _os_log_impl(&dword_1C15B3000, v76, OS_LOG_TYPE_DEFAULT, "%s Sending unsupported version of ask each time request back", buf, 0xCu);
        }

        v77 = -[WFRemoteExecutionAskEachTimeRequestResponse initWithOriginatingRequestIdentifier:inputtedStates:error:]([WFRemoteExecutionAskEachTimeRequestResponse alloc], "initWithOriginatingRequestIdentifier:inputtedStates:error:", v73, 0, v18);
        -[WFRemoteExecutionIncomingAskEachTimeSession sendResponse:destinations:options:](self, "sendResponse:destinations:options:", v77, v13, v14);

      }
      else
      {
        if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v124 = "-[WFRemoteExecutionIncomingAskEachTimeSession handleIncomingProtobuf:currentlyActiveSessions:responseDe"
                 "stinations:responseOptions:]";
          v125 = 2112;
          v126 = v74;
          _os_log_impl(&dword_1C15B3000, v76, OS_LOG_TYPE_FAULT, "%s Unable to read identifier from base request: %@, so unable to send unsupported version error back", buf, 0x16u);
        }

        -[WFRemoteExecutionSession finish](self, "finish");
      }

    }
    else
    {
      if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v124 = "-[WFRemoteExecutionIncomingAskEachTimeSession handleIncomingProtobuf:currentlyActiveSessions:responseDest"
               "inations:responseOptions:]";
        v125 = 2114;
        v126 = v18;
        _os_log_impl(&dword_1C15B3000, v71, OS_LOG_TYPE_FAULT, "%s Failed to read incoming ask each time protobuf: %{public}@", buf, 0x16u);
      }

      -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    }
    goto LABEL_67;
  }
  v96 = v18;
  v97 = v14;
  v93 = v13;
  v94 = v12;
  v95 = v11;
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v19 = v12;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
  if (!v20)
  {

    goto LABEL_52;
  }
  v21 = v20;
  v92 = self;
  v99 = 0;
  v22 = *(_QWORD *)v115;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v115 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
      v25 = objc_opt_class();
      v26 = v24;
      if (v26)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v26, "request");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "associatedRunRequestIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "isEqualToString:", v29);

          if (!v30)
            goto LABEL_17;
          v31 = v26;
          v26 = v99;
          v99 = v31;
        }
        else
        {
          getWFGeneralLogObject();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          {
            v33 = (void *)objc_opt_class();
            *(_DWORD *)buf = 136315906;
            v124 = "WFEnforceClass";
            v125 = 2114;
            v126 = v26;
            v127 = 2114;
            v128 = v33;
            v129 = 2114;
            v130 = v25;
            v34 = v33;
            _os_log_impl(&dword_1C15B3000, v32, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

          }
          v31 = 0;
        }

        v26 = v31;
      }
LABEL_17:

    }
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
  }
  while (v21);

  if (!v99)
  {
LABEL_52:
    -[WFRemoteExecutionSession setState:](self, "setState:", -420);
    -[WFRemoteExecutionSession finish](self, "finish");
    v12 = v94;
    v11 = v95;
    v13 = v93;
    goto LABEL_66;
  }
  -[WFRemoteExecutionSession setRequest:](self, "setRequest:", v100);
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "actionIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "actionSerializedParameters");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "createActionWithIdentifier:serializedParameters:", v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "initializeParametersIfNecessary");
  objc_msgSend(v100, "inflateParameterStatesWithAction:", v38);
  objc_msgSend(v100, "parameterKeys");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v41 = v39;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v110, v121, 16);
  obj = v41;
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v111;
    while (2)
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v111 != v44)
          objc_enumerationMutation(obj);
        v46 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
        objc_msgSend(v38, "parameterForKey:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "possibleStatesByParameterKey");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "allKeys");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "containsObject:", v46);

        if (v50)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v51 = v47;
            objc_msgSend(v100, "possibleStatesByParameterKey");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "objectForKey:", v46);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setPossibleStatesFromRemoteSource:", v53);

          }
        }
        if (!v47)
        {
          getWFRemoteExecutionLogObject();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v38, "parameters");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v124 = "-[WFRemoteExecutionIncomingAskEachTimeSession handleIncomingProtobuf:currentlyActiveSessions:response"
                   "Destinations:responseOptions:]";
            v125 = 2114;
            v126 = v46;
            v127 = 2114;
            v128 = v79;
            _os_log_impl(&dword_1C15B3000, v78, OS_LOG_TYPE_ERROR, "%s Ask Each Time request needs to resolve parameter (%{public}@) but the parameter is nil. action parameters: %{public}@", buf, 0x20u);

          }
          -[WFRemoteExecutionSession setState:](v92, "setState:", 1);
          v80 = [WFRemoteExecutionAskEachTimeRequestResponse alloc];
          objc_msgSend(v100, "identifier");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFRemoteExecutionIncomingAskEachTimeSession missingParameterError](v92, "missingParameterError");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = -[WFRemoteExecutionAskEachTimeRequestResponse initWithOriginatingRequestIdentifier:inputtedStates:error:](v80, "initWithOriginatingRequestIdentifier:inputtedStates:error:", v81, 0, v82);

          v13 = v93;
          -[WFRemoteExecutionIncomingAskEachTimeSession sendResponse:destinations:options:](v92, "sendResponse:destinations:options:", v83, v93, v97);

          v84 = obj;
          v56 = obj;
          v12 = v94;
          v11 = v95;
          v63 = v99;
          goto LABEL_65;
        }
        objc_msgSend(v40, "addObject:", v47);

      }
      v41 = obj;
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v121, 16);
      if (v43)
        continue;
      break;
    }
  }

  -[WFRemoteExecutionSession setState:](v92, "setState:", 201);
  objc_msgSend(v99, "userInterface");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "isRunningWithSiriUI");

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v56 = v40;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
  v13 = v93;
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v107;
    while (2)
    {
      for (k = 0; k != v58; ++k)
      {
        if (*(_QWORD *)v107 != v59)
          objc_enumerationMutation(v56);
        v61 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * k);
        objc_msgSend(v99, "parameterInputProvider");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v61) = objc_msgSend(v62, "action:canProvideInputForParameter:", v38, v61) ^ 1 | v55;

        if ((_DWORD)v61 == 1)
        {
          v85 = [WFRemoteExecutionAskEachTimeRequestResponse alloc];
          objc_msgSend(v100, "identifier");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = -[WFRemoteExecutionAskEachTimeRequestResponse initWithOriginatingRequestIdentifier:inputtedStates:error:](v85, "initWithOriginatingRequestIdentifier:inputtedStates:error:", v86, 0, v87);

          -[WFRemoteExecutionIncomingAskEachTimeSession sendResponse:destinations:options:](v92, "sendResponse:destinations:options:", v88, v93, v97);
          objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v99;
          objc_msgSend(v99, "finishWithError:", v89);

          goto LABEL_64;
        }
      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
      if (v58)
        continue;
      break;
    }
  }

  v63 = v99;
  objc_msgSend(v99, "parameterInputProvider");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "parameterKeysAndStates");
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)v65;
  v67 = MEMORY[0x1E0C9AA70];
  if (v65)
    v68 = v65;
  else
    v68 = MEMORY[0x1E0C9AA70];
  v101[0] = MEMORY[0x1E0C809B0];
  v101[1] = 3221225472;
  v101[2] = __131__WFRemoteExecutionIncomingAskEachTimeSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_responseOptions___block_invoke;
  v101[3] = &unk_1E7AF4740;
  v102 = v100;
  v103 = v92;
  v104 = v93;
  v105 = v97;
  objc_msgSend(v64, "action:provideInputForParameters:withDefaultStates:prompts:completionHandler:", v38, v56, v68, v67, v101);

  v56 = v102;
LABEL_64:
  v12 = v94;
  v11 = v95;
  v84 = obj;
LABEL_65:

LABEL_66:
  v18 = v96;
  v14 = v97;
LABEL_67:

}

- (void)sendResponse:(id)a3 destinations:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionIncomingAskEachTimeSession.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionIncomingAskEachTimeSession.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinations"));

LABEL_3:
  -[WFRemoteExecutionIncomingAskEachTimeSession setLastKnownDestinations:](self, "setLastKnownDestinations:", v10);
  -[WFRemoteExecutionIncomingAskEachTimeSession setLastKnownOptions:](self, "setLastKnownOptions:", v11);
  v12 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  v31 = 0;
  v13 = objc_msgSend(v9, "writeTo:error:", v12, &v31);
  v14 = v31;
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    v28 = v14;
    v16 = objc_alloc(MEMORY[0x1E0D34348]);
    objc_msgSend(v12, "immutableData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithProtobufData:type:isResponse:", v17, 6, 0);

    -[WFRemoteExecutionSession service](self, "service");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v30 = 0;
    v20 = objc_msgSend(v19, "sendProtobuf:toDestinations:priority:options:identifier:error:", v18, v10, 300, v11, &v30, &v29);
    v21 = v30;
    v22 = v29;

    if ((v20 & 1) != 0)
    {
      -[WFRemoteExecutionSession setIdsIdentifier:](self, "setIdsIdentifier:", v21);
      v23 = 202;
    }
    else
    {
      getWFRemoteExecutionLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[WFRemoteExecutionIncomingAskEachTimeSession sendResponse:destinations:options:]";
        v34 = 2114;
        v35 = v22;
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s Failed to send ask each time request response: %{public}@", buf, 0x16u);
      }

      v23 = 1;
    }
    v15 = v28;
    -[WFRemoteExecutionSession setState:](self, "setState:", v23);

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[WFRemoteExecutionIncomingAskEachTimeSession sendResponse:destinations:options:]";
      v34 = 2114;
      v35 = v15;
      _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_FAULT, "%s Failed to write response for ask each time request: %{public}@", buf, 0x16u);
    }

    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
  }

}

- (void)handleTimeout
{
  -[WFRemoteExecutionSession setState:](self, "setState:", 203);
  -[WFRemoteExecutionSession finish](self, "finish");
}

- (void)finishWithError:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  WFRemoteExecutionAskEachTimeRequestResponse *v7;
  void *v8;
  void *v9;
  WFRemoteExecutionAskEachTimeRequestResponse *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[WFRemoteExecutionSession finish](self, "finish");
  -[WFRemoteExecutionIncomingAskEachTimeSession lastKnownDestinations](self, "lastKnownDestinations");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[WFRemoteExecutionSession request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [WFRemoteExecutionAskEachTimeRequestResponse alloc];
      -[WFRemoteExecutionSession request](self, "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WFRemoteExecutionAskEachTimeRequestResponse initWithOriginatingRequestIdentifier:inputtedStates:error:](v7, "initWithOriginatingRequestIdentifier:inputtedStates:error:", v9, 0, v13);

      -[WFRemoteExecutionIncomingAskEachTimeSession lastKnownDestinations](self, "lastKnownDestinations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingAskEachTimeSession lastKnownOptions](self, "lastKnownOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingAskEachTimeSession sendResponse:destinations:options:](self, "sendResponse:destinations:options:", v10, v11, v12);

    }
  }

}

- (id)missingParameterError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v8[0] = *MEMORY[0x1E0CB2D68];
  WFLocalizedString(CFSTR("Could Not Run Action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("An error occurred while executing an action on your iPhone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFRemoteExecutionCoordinatorErrorDomain"), 3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)lastKnownDestinations
{
  return self->_lastKnownDestinations;
}

- (void)setLastKnownDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownDestinations, a3);
}

- (NSDictionary)lastKnownOptions
{
  return self->_lastKnownOptions;
}

- (void)setLastKnownOptions:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownOptions, 0);
  objc_storeStrong((id *)&self->_lastKnownDestinations, 0);
}

void __131__WFRemoteExecutionIncomingAskEachTimeSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_responseOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WFRemoteExecutionAskEachTimeRequestResponse *v7;
  void *v8;
  WFRemoteExecutionAskEachTimeRequestResponse *v9;

  v5 = a3;
  v6 = a2;
  v7 = [WFRemoteExecutionAskEachTimeRequestResponse alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFRemoteExecutionAskEachTimeRequestResponse initWithOriginatingRequestIdentifier:inputtedStates:error:](v7, "initWithOriginatingRequestIdentifier:inputtedStates:error:", v8, v6, v5);

  objc_msgSend(*(id *)(a1 + 40), "sendResponse:destinations:options:", v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
