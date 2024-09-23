@implementation WFRemoteExecutionIncomingDialogRequestSession

- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4 destinations:(id)a5 options:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFRemoteExecutionDialogRequest *v15;
  void *v16;
  WFRemoteExecutionDialogRequest *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __objc2_class **v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  __objc2_class **v28;
  id v29;
  void *v30;
  void *v31;
  WFRemoteExecutionDialogRequest *v32;
  void *v33;
  int v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  _BOOL4 v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  WFRemoteExecutionDialogRequest *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  WFRemoteExecutionIncomingDialogRequestSession *v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  _QWORD v74[5];
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  id v82;
  uint8_t v83[128];
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionIncomingDialogRequestSession.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("protobuf"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionIncomingDialogRequestSession.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responseDestinations"));

LABEL_3:
  -[WFRemoteExecutionSession setState:](self, "setState:", 200);
  v15 = [WFRemoteExecutionDialogRequest alloc];
  objc_msgSend(v11, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0;
  v17 = -[WFRemoteExecutionDialogRequest initWithData:error:](v15, "initWithData:error:", v16, &v82);
  v18 = v82;

  if (v17)
  {
    v70 = v18;
    v71 = v14;
    v69 = self;
    -[WFRemoteExecutionSession setRequest:](self, "setRequest:", v17);
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v19 = v12;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    if (!v20)
    {

      goto LABEL_33;
    }
    v21 = v20;
    v66 = v11;
    v67 = v13;
    v65 = v12;
    v72 = 0;
    v22 = *(_QWORD *)v78;
    v23 = off_1E7AC4000;
LABEL_6:
    v24 = 0;
    v73 = v21;
    while (1)
    {
      if (*(_QWORD *)v78 != v22)
        objc_enumerationMutation(v19);
      v25 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v24);
      v26 = objc_opt_class();
      v27 = v25;
      if (!v27)
        goto LABEL_18;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = v23;
        v29 = v19;
        objc_msgSend(v27, "request");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v17;
        -[WFRemoteExecutionDialogRequest runRequestIdentifier](v17, "runRequestIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v31, "isEqualToString:", v33);

        if (!v34)
        {
          v17 = v32;
          v19 = v29;
          v23 = v28;
          v21 = v73;
          goto LABEL_18;
        }
        v35 = v27;
        v27 = v72;
        v72 = v35;
        v17 = v32;
        v19 = v29;
        v23 = v28;
        v21 = v73;
      }
      else
      {
        getWFGeneralLogObject();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          v37 = (void *)objc_opt_class();
          *(_DWORD *)buf = 136315906;
          v85 = "WFEnforceClass";
          v86 = 2114;
          v87 = v27;
          v88 = 2114;
          v89 = v37;
          v90 = 2114;
          v91 = v26;
          v38 = v37;
          _os_log_impl(&dword_1C15B3000, v36, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

        }
        v35 = 0;
      }

      v27 = v35;
LABEL_18:

      if (v21 == ++v24)
      {
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
        if (!v21)
        {

          v12 = v65;
          v11 = v66;
          v13 = v67;
          v39 = v72;
          if (v72)
          {
            v18 = v70;
            if (VCIsDeviceLocked())
            {
              -[WFRemoteExecutionSession setState:](v69, "setState:", 1);
              getWFRemoteExecutionLogObject();
              v40 = objc_claimAutoreleasedReturnValue();
              v14 = v71;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:des"
                      "tinations:options:]";
                _os_log_impl(&dword_1C15B3000, v40, OS_LOG_TYPE_ERROR, "%s Found a outgoing run request session to show the alert in, but the device is locked", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "finishWithError:", v41);

            }
            else
            {
              objc_msgSend(v72, "userInterface");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_opt_respondsToSelector();

              v14 = v71;
              if ((v51 & 1) != 0)
              {
                objc_msgSend(v72, "userInterface");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "dialogTransformer");
                v53 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v53, "userInterfacePresenter");
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                if (v54)
                {
                  objc_msgSend(v53, "userInterfacePresenter");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFRemoteExecutionDialogRequest dialogRequest](v17, "dialogRequest");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "runningContext");
                  v57 = v17;
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v74[0] = MEMORY[0x1E0C809B0];
                  v74[1] = 3221225472;
                  v74[2] = __117__WFRemoteExecutionIncomingDialogRequestSession_handleIncomingProtobuf_currentlyActiveSessions_destinations_options___block_invoke;
                  v74[3] = &unk_1E7AEF280;
                  v74[4] = v69;
                  v75 = v67;
                  v76 = v71;
                  objc_msgSend(v55, "showDialogRequest:runningContext:completionHandler:", v56, v58, v74);

                  v17 = v57;
                  v39 = v72;

                }
                else
                {
                  getWFRemoteExecutionLogObject();
                  v61 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions"
                          ":destinations:options:]";
                    _os_log_impl(&dword_1C15B3000, v61, OS_LOG_TYPE_DEFAULT, "%s Unable to handle dialog request locally, need to handoff", buf, 0xCu);
                  }

                  objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "finishWithError:", v62);

                  -[WFRemoteExecutionSession finish](v69, "finish");
                }

              }
              else
              {
                getWFRemoteExecutionLogObject();
                v59 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:d"
                        "estinations:options:]";
                  _os_log_impl(&dword_1C15B3000, v59, OS_LOG_TYPE_DEFAULT, "%s Unable to handle dialog request locally, need to handoff", buf, 0xCu);
                }

                objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "finishWithError:", v60);

                -[WFRemoteExecutionSession finish](v69, "finish");
              }
            }

            goto LABEL_52;
          }
LABEL_33:
          -[WFRemoteExecutionSession setState:](v69, "setState:", -420);
          -[WFRemoteExecutionSession finish](v69, "finish");
          v18 = v70;
          v14 = v71;
          goto LABEL_52;
        }
        goto LABEL_6;
      }
    }
  }
  v42 = +[WFRemoteExecutionRequest isUnsupportedVersionError:](WFRemoteExecutionRequest, "isUnsupportedVersionError:", v18);
  getWFRemoteExecutionLogObject();
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = os_log_type_enabled(v43, OS_LOG_TYPE_FAULT);
  if (v42)
  {
    v68 = v13;
    if (v44)
    {
      *(_DWORD *)buf = 136315138;
      v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:destinations:options:]";
      _os_log_impl(&dword_1C15B3000, v43, OS_LOG_TYPE_FAULT, "%s Encountered unsupported version of dialog request", buf, 0xCu);
    }

    -[WFRemoteExecutionSession setState:](self, "setState:", 2);
    objc_msgSend(v11, "data");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0;
    +[WFRemoteExecutionRequest identifierFromData:error:](WFRemoteExecutionRequest, "identifierFromData:error:", v45, &v81);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v81;

    getWFRemoteExecutionLogObject();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v46)
    {
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:destinations:options:]";
        _os_log_impl(&dword_1C15B3000, v49, OS_LOG_TYPE_DEFAULT, "%s Sending unsupported dialog request error back", buf, 0xCu);
      }

      v13 = v68;
      -[WFRemoteExecutionIncomingDialogRequestSession sendResponseWithOriginatingRequestIdentifier:dialogResponse:error:destinations:options:](self, "sendResponseWithOriginatingRequestIdentifier:dialogResponse:error:destinations:options:", v46, 0, v18, v68, v14);
    }
    else
    {
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:destinations:options:]";
        v86 = 2112;
        v87 = v47;
        _os_log_impl(&dword_1C15B3000, v49, OS_LOG_TYPE_FAULT, "%s Unable to read identifier from base request: %@, so unable to send unsupported version error back", buf, 0x16u);
      }

      -[WFRemoteExecutionSession finish](self, "finish");
      v13 = v68;
    }

    v17 = 0;
  }
  else
  {
    if (v44)
    {
      *(_DWORD *)buf = 136315394;
      v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:destinations:options:]";
      v86 = 2114;
      v87 = v18;
      _os_log_impl(&dword_1C15B3000, v43, OS_LOG_TYPE_FAULT, "%s failed to read incoming dialog request from data, error: %{public}@", buf, 0x16u);
    }

    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    -[WFRemoteExecutionSession finish](self, "finish");
  }
LABEL_52:

}

- (void)finishWithError:(id)a3
{
  -[WFRemoteExecutionSession setState:](self, "setState:", 202);
  -[WFRemoteExecutionSession finish](self, "finish");
}

- (void)handleTimeout
{
  -[WFRemoteExecutionSession setState:](self, "setState:", 203);
  -[WFRemoteExecutionSession finish](self, "finish");
}

- (double)timeoutLimitInSeconds
{
  return 120.0;
}

- (void)sendResponseWithOriginatingRequestIdentifier:(id)a3 dialogResponse:(id)a4 error:(id)a5 destinations:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WFRemoteExecutionDialogRequestResponse *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[WFRemoteExecutionDialogRequestResponse initWithOriginatingRequestIdentifier:dialogResponse:error:]([WFRemoteExecutionDialogRequestResponse alloc], "initWithOriginatingRequestIdentifier:dialogResponse:error:", v16, v15, v14);

  -[WFRemoteExecutionIncomingDialogRequestSession setResponse:](self, "setResponse:", v17);
  -[WFRemoteExecutionIncomingDialogRequestSession sendToDestinations:options:](self, "sendToDestinations:options:", v13, v12);

}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  WFRemoteExecutionIncomingDialogRequestSession *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  WFRemoteExecutionIncomingDialogRequestSession *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  WFRemoteExecutionIncomingDialogRequestSession *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)WFRemoteExecutionIncomingDialogRequestSession;
  -[WFRemoteExecutionSession sendToDestinations:options:](&v30, sel_sendToDestinations_options_, v6, v7);
  v8 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  -[WFRemoteExecutionIncomingDialogRequestSession response](self, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v10 = objc_msgSend(v9, "writeTo:error:", v8, &v29);
  v11 = v29;

  if ((v10 & 1) != 0)
  {
    v12 = objc_alloc(MEMORY[0x1E0D34348]);
    objc_msgSend(v8, "immutableData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithProtobufData:type:isResponse:", v13, 11, 0);

    getWFRemoteExecutionLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      -[WFRemoteExecutionIncomingDialogRequestSession response](self, "response");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (WFRemoteExecutionIncomingDialogRequestSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v32 = "-[WFRemoteExecutionIncomingDialogRequestSession sendToDestinations:options:]";
      v33 = 2114;
      v34 = v17;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_INFO, "%s <%{public}@> sending dialog request response", buf, 0x16u);

    }
    -[WFRemoteExecutionSession service](self, "service");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = 0;
    v19 = objc_msgSend(v18, "sendProtobuf:toDestinations:priority:options:identifier:error:", v14, v6, 300, v7, &v28, &v27);
    v20 = v28;
    v21 = v27;

    if ((v19 & 1) != 0)
    {
      -[WFRemoteExecutionSession setIdsIdentifier:](self, "setIdsIdentifier:", v20);
      v22 = 202;
    }
    else
    {
      getWFRemoteExecutionLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v32 = "-[WFRemoteExecutionIncomingDialogRequestSession sendToDestinations:options:]";
        v33 = 2114;
        v34 = self;
        v35 = 2114;
        v36 = v21;
        _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      v22 = 1;
    }
    -[WFRemoteExecutionSession setState:](self, "setState:", v22);
    -[WFRemoteExecutionSession finish](self, "finish");

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      -[WFRemoteExecutionIncomingDialogRequestSession response](self, "response");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (WFRemoteExecutionIncomingDialogRequestSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v32 = "-[WFRemoteExecutionIncomingDialogRequestSession sendToDestinations:options:]";
      v33 = 2114;
      v34 = v25;
      v35 = 2114;
      v36 = v11;
      _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);

    }
    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
  }

}

- (WFRemoteExecutionDialogRequestResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

void __117__WFRemoteExecutionIncomingDialogRequestSession_handleIncomingProtobuf_currentlyActiveSessions_destinations_options___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)a1[4];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "request");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendResponseWithOriginatingRequestIdentifier:dialogResponse:error:destinations:options:", v8, v7, v6, a1[5], a1[6]);

}

@end
