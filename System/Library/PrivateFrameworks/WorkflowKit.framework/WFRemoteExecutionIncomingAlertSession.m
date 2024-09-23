@implementation WFRemoteExecutionIncomingAlertSession

- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4 responseDestinations:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  WFRemoteExecutionAlertRequest *v40;
  id v41;
  id v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  WFRemoteExecutionIncomingAlertSession *v54;
  void *v55;
  WFRemoteExecutionAlertRequest *v56;
  _QWORD v57[5];
  WFRemoteExecutionAlertRequest *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  uint8_t v66[128];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[WFRemoteExecutionIncomingAlertSession setLastKnownDestinations:](self, "setLastKnownDestinations:", v12);
  -[WFRemoteExecutionIncomingAlertSession setLastKnownOptions:](self, "setLastKnownOptions:", v13);
  v54 = self;
  -[WFRemoteExecutionSession setState:](self, "setState:", 200);
  v14 = objc_alloc(MEMORY[0x1E0D82B90]);
  objc_msgSend(v10, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithData:", v15);

  v65 = 0;
  v56 = objc_alloc_init(WFRemoteExecutionAlertRequest);
  LOBYTE(v14) = -[WFRemoteExecutionRequest readFrom:error:](v56, "readFrom:error:", v16, &v65);
  v17 = v65;
  if ((v14 & 1) != 0)
    goto LABEL_6;
  v18 = +[WFRemoteExecutionRequest isUnsupportedVersionError:](WFRemoteExecutionRequest, "isUnsupportedVersionError:", v17);
  getWFRemoteExecutionLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v68 = "-[WFRemoteExecutionIncomingAlertSession handleIncomingProtobuf:currentlyActiveSessions:responseDestinations:options:]";
      _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of an alert request", buf, 0xCu);
    }

    -[WFRemoteExecutionSession setState:](v54, "setState:", 2);
LABEL_6:
    v53 = v17;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v21 = v11;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (!v22)
    {

      goto LABEL_25;
    }
    v23 = v22;
    v52 = v16;
    v49 = v13;
    v50 = v12;
    v51 = v11;
    v55 = 0;
    v24 = *(_QWORD *)v62;
LABEL_8:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v62 != v24)
        objc_enumerationMutation(v21);
      v26 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v25);
      v27 = objc_opt_class();
      v28 = v26;
      if (!v28)
        goto LABEL_19;
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v28, "request");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionAlertRequest associatedRunRequestIdentifier](v56, "associatedRunRequestIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToString:", v31);

      if (v32)
      {
        v33 = v28;
        v28 = v55;
        v55 = v33;
LABEL_18:

        v28 = v33;
      }
LABEL_19:

      if (v23 == ++v25)
      {
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        if (!v23)
        {

          v11 = v51;
          v13 = v49;
          v12 = v50;
          v16 = v52;
          v37 = v55;
          if (v55)
          {
            v17 = v53;
            if (-[WFRemoteExecutionSession state](v54, "state") == 2)
            {
              objc_msgSend(v55, "finishWithError:", v53);
            }
            else if (VCIsDeviceLocked())
            {
              -[WFRemoteExecutionSession setState:](v54, "setState:", 1);
              getWFRemoteExecutionLogObject();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v68 = "-[WFRemoteExecutionIncomingAlertSession handleIncomingProtobuf:currentlyActiveSessions:responseDes"
                      "tinations:options:]";
                _os_log_impl(&dword_1C15B3000, v38, OS_LOG_TYPE_ERROR, "%s Found a outgoing run request session to show the alert in, but the device is locked", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "finishWithError:", v39);

            }
            else
            {
              v57[0] = MEMORY[0x1E0C809B0];
              v57[1] = 3221225472;
              v57[2] = __117__WFRemoteExecutionIncomingAlertSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_options___block_invoke;
              v57[3] = &unk_1E7AEFF50;
              v57[4] = v54;
              v40 = v56;
              v58 = v40;
              v41 = v50;
              v59 = v41;
              v42 = v49;
              v60 = v42;
              -[WFRemoteExecutionAlertRequest inflateAlertWithBlock:](v40, "inflateAlertWithBlock:", v57);
              -[WFRemoteExecutionSession setRequest:](v54, "setRequest:", v40);
              objc_msgSend(v55, "userInterface");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "isRunningWithSiriUI");

              if (v44)
              {
                -[WFRemoteExecutionRequest identifier](v40, "identifier");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFRemoteExecutionIncomingAlertSession sendSelectedButton:forAlertWithIdentifier:error:destinations:options:](v54, "sendSelectedButton:forAlertWithIdentifier:error:destinations:options:", 0, v45, v46, v41, v42);

                objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = v55;
                objc_msgSend(v55, "finishWithError:", v47);
              }
              else
              {
                v37 = v55;
                objc_msgSend(v55, "userInterface");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFRemoteExecutionAlertRequest alert](v40, "alert");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "presentAlert:", v48);

              }
              v16 = v52;

            }
            goto LABEL_38;
          }
LABEL_25:
          -[WFRemoteExecutionSession setState:](v54, "setState:", -420);
          v17 = v53;
          goto LABEL_38;
        }
        goto LABEL_8;
      }
    }
    getWFGeneralLogObject();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      v35 = (void *)objc_opt_class();
      *(_DWORD *)buf = 136315906;
      v68 = "WFEnforceClass";
      v69 = 2114;
      v70 = v28;
      v71 = 2114;
      v72 = v35;
      v73 = 2114;
      v74 = v27;
      v36 = v35;
      _os_log_impl(&dword_1C15B3000, v34, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    v33 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v68 = "-[WFRemoteExecutionIncomingAlertSession handleIncomingProtobuf:currentlyActiveSessions:responseDestinations:options:]";
    v69 = 2114;
    v70 = v17;
    _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_FAULT, "%s failed to read alert request: %{public}@", buf, 0x16u);
  }

LABEL_38:
}

- (void)sendSelectedButton:(id)a3 forAlertWithIdentifier:(id)a4 error:(id)a5 destinations:(id)a6 options:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  WFRemoteExecutionAlertRequestResponse *v18;
  id v19;
  BOOL v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = v17;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionIncomingAlertSession.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    v17 = v33;
    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = v17;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionIncomingAlertSession.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinations"));

  v17 = v35;
LABEL_3:
  -[WFRemoteExecutionSession setState:](self, "setState:", 201);
  v18 = -[WFRemoteExecutionAlertRequestResponse initWithSelectedButton:requestIdentifier:error:]([WFRemoteExecutionAlertRequestResponse alloc], "initWithSelectedButton:requestIdentifier:error:", v13, v14, v15);
  v19 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  v43 = 0;
  v20 = -[WFRemoteExecutionRequest writeTo:error:](v18, "writeTo:error:", v19, &v43);
  v21 = v43;
  if (v20)
  {
    v40 = v17;
    v37 = v15;
    v22 = objc_alloc(MEMORY[0x1E0D34348]);
    objc_msgSend(v19, "immutableData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v22, "initWithProtobufData:type:isResponse:", v23, 4, 0);

    getWFRemoteExecutionLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      -[WFRemoteExecutionRequest identifier](v18, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v45 = "-[WFRemoteExecutionIncomingAlertSession sendSelectedButton:forAlertWithIdentifier:error:destinations:options:]";
      v46 = 2114;
      v47 = v25;
      v48 = 2114;
      v49 = v14;
      v50 = 2114;
      v51 = v13;
      _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_INFO, "%s <%{public}@> sending response for alert (%{public}@) with selected button: %{public}@", buf, 0x2Au);

    }
    v38 = v13;

    -[WFRemoteExecutionSession restartTimeout](self, "restartTimeout");
    -[WFRemoteExecutionSession service](self, "service");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v42 = 0;
    v27 = objc_msgSend(v26, "sendProtobuf:toDestinations:priority:options:identifier:error:", v39, v16, 300, v40, &v42, &v41);
    v28 = v42;
    v29 = v41;

    if ((v27 & 1) != 0)
    {
      -[WFRemoteExecutionSession setIdsIdentifier:](self, "setIdsIdentifier:", v28);
      -[WFRemoteExecutionSession setState:](self, "setState:", 202);
      -[WFRemoteExecutionSession finish](self, "finish");
    }
    else
    {
      getWFRemoteExecutionLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        -[WFRemoteExecutionRequest identifier](v18, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v45 = "-[WFRemoteExecutionIncomingAlertSession sendSelectedButton:forAlertWithIdentifier:error:destinations:options:]";
        v46 = 2114;
        v47 = v32;
        v48 = 2114;
        v49 = v29;
        _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_FAULT, "%s <%{public}@> Failed to send alert response: %{public}@", buf, 0x20u);

      }
      -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    }

    v15 = v37;
    v13 = v38;
    v17 = v40;
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[WFRemoteExecutionIncomingAlertSession sendSelectedButton:forAlertWithIdentifier:error:destinations:options:]";
      v46 = 2114;
      v47 = v21;
      _os_log_impl(&dword_1C15B3000, v30, OS_LOG_TYPE_FAULT, "%s failed to write alert response protobuf: %{public}@", buf, 0x16u);
    }

    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
  }

}

- (void)finishWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WFRemoteExecutionSession finish](self, "finish");
  -[WFRemoteExecutionIncomingAlertSession lastKnownDestinations](self, "lastKnownDestinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFRemoteExecutionSession request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionIncomingAlertSession lastKnownDestinations](self, "lastKnownDestinations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionIncomingAlertSession lastKnownOptions](self, "lastKnownOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionIncomingAlertSession sendSelectedButton:forAlertWithIdentifier:error:destinations:options:](self, "sendSelectedButton:forAlertWithIdentifier:error:destinations:options:", 0, v6, v9, v7, v8);

  }
}

- (void)handleTimeout
{
  -[WFRemoteExecutionSession setState:](self, "setState:", 203);
  -[WFRemoteExecutionSession finish](self, "finish");
}

- (double)timeoutLimitInSeconds
{
  return 30.0;
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

id __117__WFRemoteExecutionIncomingAlertSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  id obj;
  _QWORD v23[6];
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", (int)objc_msgSend(v3, "preferredStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v3, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  objc_msgSend(v4, "setMessage:", v6);

  v7 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v3;
  objc_msgSend(v3, "buttons");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1E0D13DE8];
        objc_msgSend(v12, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (int)objc_msgSend(v12, "style");
        v16 = objc_msgSend(v12, "preferred");
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __117__WFRemoteExecutionIncomingAlertSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_options___block_invoke_2;
        v23[3] = &unk_1E7AF2C98;
        v17 = *(void **)(a1 + 40);
        v23[4] = *(_QWORD *)(a1 + 32);
        v23[5] = v12;
        v24 = v17;
        v25 = *(id *)(a1 + 48);
        v26 = *(id *)(a1 + 56);
        objc_msgSend(v13, "buttonWithTitle:style:preferred:handler:", v14, v15, v16, v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v18);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  objc_msgSend(v20, "setButtons:", v7);
  return v20;
}

void __117__WFRemoteExecutionIncomingAlertSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_options___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendSelectedButton:forAlertWithIdentifier:error:destinations:options:", v4, v3, 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

@end
