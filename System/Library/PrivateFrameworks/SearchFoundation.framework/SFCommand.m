@implementation SFCommand

- (SFCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SFCommand *v6;
  _SFPBCommand *v7;
  SFCommand *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [SFCommand alloc];
  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v5);
  v8 = -[SFCommand initWithProtobuf:](v6, "initWithProtobuf:", v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCommand *v6;

  v4 = a3;
  v6 = -[_SFPBCommand initWithFacade:]([_SFPBCommand alloc], "initWithFacade:", self);
  -[_SFPBCommand data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCommand *v2;
  void *v3;

  v2 = -[_SFPBCommand initWithFacade:]([_SFPBCommand alloc], "initWithFacade:", self);
  -[_SFPBCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCommand *v2;
  void *v3;

  v2 = -[_SFPBCommand initWithFacade:]([_SFPBCommand alloc], "initWithFacade:", self);
  -[_SFPBCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFCommand commandDetail](self, "commandDetail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCommandDetail:", v6);

  -[SFCommand normalizedTopic](self, "normalizedTopic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setNormalizedTopic:", v8);

  -[SFCommand backendData](self, "backendData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setBackendData:", v10);

  -[SFCommand commandReference](self, "commandReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setCommandReference:", v12);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFCommand *v5;
  SFCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
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
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v5 = (SFCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFCommand commandDetail](self, "commandDetail");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCommand commandDetail](v6, "commandDetail");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_37:

        goto LABEL_38;
      }
      -[SFCommand commandDetail](self, "commandDetail");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFCommand commandDetail](self, "commandDetail");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCommand commandDetail](v6, "commandDetail");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_35;
        }
        v41 = v10;
      }
      -[SFCommand normalizedTopic](self, "normalizedTopic");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCommand normalizedTopic](v6, "normalizedTopic");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_34;
      }
      -[SFCommand normalizedTopic](self, "normalizedTopic");
      v15 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v15;
      if (v15)
      {
        v16 = (void *)v15;
        v35 = v14;
        v17 = v12;
        -[SFCommand normalizedTopic](self, "normalizedTopic");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCommand normalizedTopic](v6, "normalizedTopic");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          v11 = 0;
          v12 = v17;
          v14 = v35;
          goto LABEL_32;
        }
        v39 = v3;
        v12 = v17;
        v14 = v35;
      }
      else
      {
        v39 = v3;
      }
      -[SFCommand backendData](self, "backendData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCommand backendData](v6, "backendData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v19 == 0) == (v20 != 0))
      {

        v11 = 0;
        v3 = v39;
        v16 = v40;
        if (!v40)
          goto LABEL_33;
        goto LABEL_32;
      }
      v33 = v20;
      v34 = v19;
      -[SFCommand backendData](self, "backendData");
      v16 = v40;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36
        || (-[SFCommand backendData](self, "backendData"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFCommand backendData](v6, "backendData"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = v21,
            objc_msgSend(v21, "isEqual:")))
      {
        -[SFCommand commandReference](self, "commandReference");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCommand commandReference](v6, "commandReference");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v22 == 0) == (v23 != 0))
        {

          v11 = 0;
          v16 = v40;
        }
        else
        {
          v29 = v22;
          v30 = v23;
          -[SFCommand commandReference](self, "commandReference");
          v24 = objc_claimAutoreleasedReturnValue();
          v16 = v40;
          if (v24)
          {
            v28 = (void *)v24;
            -[SFCommand commandReference](self, "commandReference");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFCommand commandReference](v6, "commandReference");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v27, "isEqual:");

          }
          else
          {

            v11 = 1;
          }
        }
        v3 = v39;
        if (!v36)
        {
LABEL_31:

          if (!v16)
          {
LABEL_33:

LABEL_34:
            v10 = v41;
            if (!v9)
            {
LABEL_36:

              goto LABEL_37;
            }
LABEL_35:

            goto LABEL_36;
          }
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        v11 = 0;
        v3 = v39;
      }

      goto LABEL_31;
    }
    v11 = 0;
  }
LABEL_38:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[SFCommand commandDetail](self, "commandDetail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFCommand normalizedTopic](self, "normalizedTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFCommand backendData](self, "backendData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFCommand commandReference](self, "commandReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (void)setCommandDetail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SFTopic)normalizedTopic
{
  return self->_normalizedTopic;
}

- (void)setNormalizedTopic:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedTopic, a3);
}

- (NSData)backendData
{
  return self->_backendData;
}

- (void)setBackendData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SFCommandReference)commandReference
{
  return self->_commandReference;
}

- (void)setCommandReference:(id)a3
{
  objc_storeStrong((id *)&self->_commandReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandReference, 0);
  objc_storeStrong((id *)&self->_backendData, 0);
  objc_storeStrong((id *)&self->_normalizedTopic, 0);
  objc_storeStrong((id *)&self->_commandDetail, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFCommandReference *v14;
  void *v15;
  SFCommandReference *v16;
  void *v17;
  SFShowContactCardCommand *v18;
  uint64_t v19;
  SFCommand *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
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
  SFCommandReference *v79;
  void *v80;
  SFCommandReference *v81;
  objc_super v83;

  v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)SFCommand;
  v5 = -[SFCommand init](&v83, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "commandDetail");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "commandDetail");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v7);

    }
    objc_msgSend(v4, "normalizedTopic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "normalizedTopic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBTopicHandwrittenTranslator(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v10);

    }
    objc_msgSend(v4, "backendData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "backendData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCommand setBackendData:](v5, "setBackendData:", v12);

    }
    objc_msgSend(v4, "commandReference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = [SFCommandReference alloc];
      objc_msgSend(v4, "commandReference");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SFCommandReference initWithProtobuf:](v14, "initWithProtobuf:", v15);
      -[SFCommand setCommandReference:](v5, "setCommandReference:", v16);

    }
    objc_msgSend(v4, "showContactCardCommand");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = [SFShowContactCardCommand alloc];
      objc_msgSend(v4, "showContactCardCommand");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "showSFCardCommand");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v18 = [SFShowSFCardCommand alloc];
        objc_msgSend(v4, "showSFCardCommand");
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "showAppStoreSheetCommand");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v18 = [SFShowAppStoreSheetCommand alloc];
          objc_msgSend(v4, "showAppStoreSheetCommand");
          v19 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "openPunchoutCommand");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v18 = [SFOpenPunchoutCommand alloc];
            objc_msgSend(v4, "openPunchoutCommand");
            v19 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v4, "openFileProviderItemCommand");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              v18 = [SFOpenFileProviderItemCommand alloc];
              objc_msgSend(v4, "openFileProviderItemCommand");
              v19 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v4, "openAppClipCommand");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
              {
                v18 = [SFOpenAppClipCommand alloc];
                objc_msgSend(v4, "openAppClipCommand");
                v19 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v4, "openWebClipCommand");
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (v26)
                {
                  v18 = [SFOpenWebClipCommand alloc];
                  objc_msgSend(v4, "openWebClipCommand");
                  v19 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v4, "requestAppClipInstallCommand");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v27)
                  {
                    v18 = [SFRequestAppClipInstallCommand alloc];
                    objc_msgSend(v4, "requestAppClipInstallCommand");
                    v19 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend(v4, "requestUserReportCommand");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v28)
                    {
                      v18 = [SFRequestUserReportCommand alloc];
                      objc_msgSend(v4, "requestUserReportCommand");
                      v19 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_msgSend(v4, "launchAppCommand");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v29)
                      {
                        v18 = [SFLaunchAppCommand alloc];
                        objc_msgSend(v4, "launchAppCommand");
                        v19 = objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        objc_msgSend(v4, "runVoiceShortcutCommand");
                        v30 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v30)
                        {
                          v18 = [SFRunVoiceShortcutCommand alloc];
                          objc_msgSend(v4, "runVoiceShortcutCommand");
                          v19 = objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          objc_msgSend(v4, "indexedUserActivityCommand");
                          v31 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v31)
                          {
                            v18 = [SFIndexedUserActivityCommand alloc];
                            objc_msgSend(v4, "indexedUserActivityCommand");
                            v19 = objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            objc_msgSend(v4, "openCoreSpotlightItemCommand");
                            v32 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v32)
                            {
                              v18 = [SFOpenCoreSpotlightItemCommand alloc];
                              objc_msgSend(v4, "openCoreSpotlightItemCommand");
                              v19 = objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              objc_msgSend(v4, "performIntentCommand");
                              v33 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v33)
                              {
                                v18 = [SFPerformIntentCommand alloc];
                                objc_msgSend(v4, "performIntentCommand");
                                v19 = objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                objc_msgSend(v4, "searchInAppCommand");
                                v34 = (void *)objc_claimAutoreleasedReturnValue();

                                if (v34)
                                {
                                  v18 = [SFSearchInAppCommand alloc];
                                  objc_msgSend(v4, "searchInAppCommand");
                                  v19 = objc_claimAutoreleasedReturnValue();
                                }
                                else
                                {
                                  objc_msgSend(v4, "updateSearchQueryCommand");
                                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                                  if (v35)
                                  {
                                    v18 = [SFUpdateSearchQueryCommand alloc];
                                    objc_msgSend(v4, "updateSearchQueryCommand");
                                    v19 = objc_claimAutoreleasedReturnValue();
                                  }
                                  else
                                  {
                                    objc_msgSend(v4, "searchWebCommand");
                                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                                    if (v36)
                                    {
                                      v18 = [SFSearchWebCommand alloc];
                                      objc_msgSend(v4, "searchWebCommand");
                                      v19 = objc_claimAutoreleasedReturnValue();
                                    }
                                    else
                                    {
                                      objc_msgSend(v4, "invokeSiriCommand");
                                      v37 = (void *)objc_claimAutoreleasedReturnValue();

                                      if (v37)
                                      {
                                        v18 = [SFInvokeSiriCommand alloc];
                                        objc_msgSend(v4, "invokeSiriCommand");
                                        v19 = objc_claimAutoreleasedReturnValue();
                                      }
                                      else
                                      {
                                        objc_msgSend(v4, "performContactQueryCommand");
                                        v38 = (void *)objc_claimAutoreleasedReturnValue();

                                        if (v38)
                                        {
                                          v18 = [SFPerformContactQueryCommand alloc];
                                          objc_msgSend(v4, "performContactQueryCommand");
                                          v19 = objc_claimAutoreleasedReturnValue();
                                        }
                                        else
                                        {
                                          objc_msgSend(v4, "openCalculationCommand");
                                          v39 = (void *)objc_claimAutoreleasedReturnValue();

                                          if (v39)
                                          {
                                            v18 = [SFOpenCalculationCommand alloc];
                                            objc_msgSend(v4, "openCalculationCommand");
                                            v19 = objc_claimAutoreleasedReturnValue();
                                          }
                                          else
                                          {
                                            objc_msgSend(v4, "playVideoCommand");
                                            v40 = (void *)objc_claimAutoreleasedReturnValue();

                                            if (v40)
                                            {
                                              v18 = [SFPlayVideoCommand alloc];
                                              objc_msgSend(v4, "playVideoCommand");
                                              v19 = objc_claimAutoreleasedReturnValue();
                                            }
                                            else
                                            {
                                              objc_msgSend(v4, "callCommand");
                                              v41 = (void *)objc_claimAutoreleasedReturnValue();

                                              if (v41)
                                              {
                                                v18 = [SFCallCommand alloc];
                                                objc_msgSend(v4, "callCommand");
                                                v19 = objc_claimAutoreleasedReturnValue();
                                              }
                                              else
                                              {
                                                objc_msgSend(v4, "emailCommand");
                                                v42 = (void *)objc_claimAutoreleasedReturnValue();

                                                if (v42)
                                                {
                                                  v18 = [SFEmailCommand alloc];
                                                  objc_msgSend(v4, "emailCommand");
                                                  v19 = objc_claimAutoreleasedReturnValue();
                                                }
                                                else
                                                {
                                                  objc_msgSend(v4, "beginMapsRoutingCommand");
                                                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                                                  if (v43)
                                                  {
                                                    v18 = [SFBeginMapsRoutingCommand alloc];
                                                    objc_msgSend(v4, "beginMapsRoutingCommand");
                                                    v19 = objc_claimAutoreleasedReturnValue();
                                                  }
                                                  else
                                                  {
                                                    objc_msgSend(v4, "toggleAudioCommand");
                                                    v44 = (void *)objc_claimAutoreleasedReturnValue();

                                                    if (v44)
                                                    {
                                                      v18 = [SFToggleAudioCommand alloc];
                                                      objc_msgSend(v4, "toggleAudioCommand");
                                                      v19 = objc_claimAutoreleasedReturnValue();
                                                    }
                                                    else
                                                    {
                                                      objc_msgSend(v4, "performPersonEntityQueryCommand");
                                                      v45 = (void *)objc_claimAutoreleasedReturnValue();

                                                      if (v45)
                                                      {
                                                        v18 = [SFPerformPersonEntityQueryCommand alloc];
                                                        objc_msgSend(v4, "performPersonEntityQueryCommand");
                                                        v19 = objc_claimAutoreleasedReturnValue();
                                                      }
                                                      else
                                                      {
                                                        objc_msgSend(v4, "showPurchaseRequestSheetCommand");
                                                        v46 = (void *)objc_claimAutoreleasedReturnValue();

                                                        if (v46)
                                                        {
                                                          v18 = [SFShowPurchaseRequestSheetCommand alloc];
                                                          objc_msgSend(v4, "showPurchaseRequestSheetCommand");
                                                          v19 = objc_claimAutoreleasedReturnValue();
                                                        }
                                                        else
                                                        {
                                                          objc_msgSend(v4, "showScreenTimeRequestSheetCommand");
                                                          v47 = (void *)objc_claimAutoreleasedReturnValue();

                                                          if (v47)
                                                          {
                                                            v18 = [SFShowScreenTimeRequestSheetCommand alloc];
                                                            objc_msgSend(v4, "showScreenTimeRequestSheetCommand");
                                                            v19 = objc_claimAutoreleasedReturnValue();
                                                          }
                                                          else
                                                          {
                                                            objc_msgSend(v4, "performEntityQueryCommand");
                                                            v48 = (void *)objc_claimAutoreleasedReturnValue();

                                                            if (v48)
                                                            {
                                                              v18 = [SFPerformEntityQueryCommand alloc];
                                                              objc_msgSend(v4, "performEntityQueryCommand");
                                                              v19 = objc_claimAutoreleasedReturnValue();
                                                            }
                                                            else
                                                            {
                                                              objc_msgSend(v4, "shareCommand");
                                                              v49 = (void *)objc_claimAutoreleasedReturnValue();

                                                              if (v49)
                                                              {
                                                                v18 = [SFShareCommand alloc];
                                                                objc_msgSend(v4, "shareCommand");
                                                                v19 = objc_claimAutoreleasedReturnValue();
                                                              }
                                                              else
                                                              {
                                                                v50 = (void *)objc_msgSend(v4, "copyCommand");

                                                                if (v50)
                                                                {
                                                                  v18 = [SFCopyCommand alloc];
                                                                  v19 = objc_msgSend(v4, "copyCommand");
                                                                }
                                                                else
                                                                {
                                                                  objc_msgSend(v4, "toggleWatchListStatusCommand");
                                                                  v51 = (void *)objc_claimAutoreleasedReturnValue();

                                                                  if (v51)
                                                                  {
                                                                    v18 = [SFToggleWatchListStatusCommand alloc];
                                                                    objc_msgSend(v4, "toggleWatchListStatusCommand");
                                                                    v19 = objc_claimAutoreleasedReturnValue();
                                                                  }
                                                                  else
                                                                  {
                                                                    objc_msgSend(v4, "showPhotosOneUpViewCommand");
                                                                    v52 = (void *)objc_claimAutoreleasedReturnValue();

                                                                    if (v52)
                                                                    {
                                                                      v18 = [SFShowPhotosOneUpViewCommand alloc];
                                                                      objc_msgSend(v4, "showPhotosOneUpViewCommand");
                                                                      v19 = objc_claimAutoreleasedReturnValue();
                                                                    }
                                                                    else
                                                                    {
                                                                      objc_msgSend(v4, "playMediaCommand");
                                                                      v53 = (void *)objc_claimAutoreleasedReturnValue();

                                                                      if (v53)
                                                                      {
                                                                        v18 = [SFPlayMediaCommand alloc];
                                                                        objc_msgSend(v4, "playMediaCommand");
                                                                        v19 = objc_claimAutoreleasedReturnValue();
                                                                      }
                                                                      else
                                                                      {
                                                                        objc_msgSend(v4, "openMediaCommand");
                                                                        v54 = (void *)objc_claimAutoreleasedReturnValue();

                                                                        if (v54)
                                                                        {
                                                                          v18 = [SFOpenMediaCommand alloc];
                                                                          objc_msgSend(v4, "openMediaCommand");
                                                                          v19 = objc_claimAutoreleasedReturnValue();
                                                                        }
                                                                        else
                                                                        {
                                                                          objc_msgSend(v4, "addToPhotosLibraryCommand");
                                                                          v55 = (void *)objc_claimAutoreleasedReturnValue();

                                                                          if (v55)
                                                                          {
                                                                            v18 = [SFAddToPhotosLibraryCommand alloc];
                                                                            objc_msgSend(v4, "addToPhotosLibraryCommand");
                                                                            v19 = objc_claimAutoreleasedReturnValue();
                                                                          }
                                                                          else
                                                                          {
                                                                            objc_msgSend(v4, "performContactActionCommand");
                                                                            v56 = (void *)objc_claimAutoreleasedReturnValue();

                                                                            if (v56)
                                                                            {
                                                                              v18 = [SFPerformContactActionCommand alloc];
                                                                              objc_msgSend(v4, "performContactActionCommand");
                                                                              v19 = objc_claimAutoreleasedReturnValue();
                                                                            }
                                                                            else
                                                                            {
                                                                              objc_msgSend(v4, "expandInlineCommand");
                                                                              v57 = (void *)objc_claimAutoreleasedReturnValue();

                                                                              if (v57)
                                                                              {
                                                                                v18 = [SFExpandInlineCommand alloc];
                                                                                objc_msgSend(v4, "expandInlineCommand");
                                                                                v19 = objc_claimAutoreleasedReturnValue();
                                                                              }
                                                                              else
                                                                              {
                                                                                objc_msgSend(v4, "subscribeForUpdatesCommand");
                                                                                v58 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                if (v58)
                                                                                {
                                                                                  v18 = [SFSubscribeForUpdatesCommand alloc];
                                                                                  objc_msgSend(v4, "subscribeForUpdatesCommand");
                                                                                  v19 = objc_claimAutoreleasedReturnValue();
                                                                                }
                                                                                else
                                                                                {
                                                                                  objc_msgSend(v4, "viewEmailCommand");
                                                                                  v59 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                  if (v59)
                                                                                  {
                                                                                    v18 = [SFViewEmailCommand alloc];
                                                                                    objc_msgSend(v4, "viewEmailCommand");
                                                                                    v19 = objc_claimAutoreleasedReturnValue();
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    objc_msgSend(v4, "rejectPeopleInPhotoCommand");
                                                                                    v60 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                    if (v60)
                                                                                    {
                                                                                      v18 = [SFRejectPeopleInPhotoCommand alloc];
                                                                                      objc_msgSend(v4, "rejectPeopleInPhotoCommand");
                                                                                      v19 = objc_claimAutoreleasedReturnValue();
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      objc_msgSend(v4, "showWrapperResponseViewCommand");
                                                                                      v61 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                      if (v61)
                                                                                      {
                                                                                        v18 = [SFShowWrapperResponseViewCommand alloc];
                                                                                        objc_msgSend(v4, "showWrapperResponseViewCommand");
                                                                                        v19 = objc_claimAutoreleasedReturnValue();
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        objc_msgSend(v4, "clearProactiveCategoryCommand");
                                                                                        v62 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                        if (v62)
                                                                                        {
                                                                                          v18 = [SFClearProactiveCategoryCommand alloc];
                                                                                          objc_msgSend(v4, "clearProactiveCategoryCommand");
                                                                                          v19 = objc_claimAutoreleasedReturnValue();
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          objc_msgSend(v4, "createContactCommand");
                                                                                          v63 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                          if (v63)
                                                                                          {
                                                                                            v18 = [SFCreateContactCommand alloc];
                                                                                            objc_msgSend(v4, "createContactCommand");
                                                                                            v19 = objc_claimAutoreleasedReturnValue();
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            objc_msgSend(v4, "createCalendarEventCommand");
                                                                                            v64 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                            if (v64)
                                                                                            {
                                                                                              v18 = [SFCreateCalendarEventCommand alloc];
                                                                                              objc_msgSend(v4, "createCalendarEventCommand");
                                                                                              v19 = objc_claimAutoreleasedReturnValue();
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              objc_msgSend(v4, "createReminderCommand");
                                                                                              v65 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                              if (v65)
                                                                                              {
                                                                                                v18 = [SFCreateReminderCommand alloc];
                                                                                                objc_msgSend(v4, "createReminderCommand");
                                                                                                v19 = objc_claimAutoreleasedReturnValue();
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                objc_msgSend(v4, "manageReservationCommand");
                                                                                                v66 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                                if (v66)
                                                                                                {
                                                                                                  v18 = [SFManageReservationCommand alloc];
                                                                                                  objc_msgSend(v4, "manageReservationCommand");
                                                                                                  v19 = objc_claimAutoreleasedReturnValue();
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  objc_msgSend(v4, "updateSportsFollowingStatusCommand");
                                                                                                  v67 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                                  if (v67)
                                                                                                  {
                                                                                                    v18 = [SFUpdateSportsFollowingStatusCommand alloc];
                                                                                                    objc_msgSend(v4, "updateSportsFollowingStatusCommand");
                                                                                                    v19 = objc_claimAutoreleasedReturnValue();
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    objc_msgSend(v4, "requestProductPageCommand");
                                                                                                    v68 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                                    if (v68)
                                                                                                    {
                                                                                                      v18 = [SFRequestProductPageCommand alloc];
                                                                                                      objc_msgSend(v4, "requestProductPageCommand");
                                                                                                      v19 = objc_claimAutoreleasedReturnValue();
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      objc_msgSend(v4, "flightCheckinCommand");
                                                                                                      v69 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                                      if (!v69)
                                                                                                      {
                                                                                                        v20 = v5;
                                                                                                        goto LABEL_119;
                                                                                                      }
                                                                                                      v18 = [SFFlightCheckinCommand alloc];
                                                                                                      objc_msgSend(v4, "flightCheckinCommand");
                                                                                                      v19 = objc_claimAutoreleasedReturnValue();
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v70 = (void *)v19;
    v20 = -[SFShowContactCardCommand initWithProtobuf:](v18, "initWithProtobuf:", v19);

    objc_msgSend(v4, "commandDetail");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v71)
    {
      objc_msgSend(v4, "commandDetail");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCommand setCommandDetail:](v20, "setCommandDetail:", v72);

    }
    objc_msgSend(v4, "normalizedTopic");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend(v4, "normalizedTopic");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBTopicHandwrittenTranslator(v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCommand setNormalizedTopic:](v20, "setNormalizedTopic:", v75);

    }
    objc_msgSend(v4, "backendData");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76)
    {
      objc_msgSend(v4, "backendData");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCommand setBackendData:](v20, "setBackendData:", v77);

    }
    objc_msgSend(v4, "commandReference");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {
      v79 = [SFCommandReference alloc];
      objc_msgSend(v4, "commandReference");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = -[SFCommandReference initWithProtobuf:](v79, "initWithProtobuf:", v80);
      -[SFCommand setCommandReference:](v20, "setCommandReference:", v81);

    }
  }
  else
  {
    v20 = 0;
  }
LABEL_119:

  return v20;
}

- (id)embeddedCards
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
