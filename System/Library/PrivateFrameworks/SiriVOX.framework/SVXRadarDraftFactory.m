@implementation SVXRadarDraftFactory

- (SVXRadarDraftFactory)init
{
  SVXRadarDraftFactory *v2;
  void *v3;
  uint64_t v4;
  NSString *timeZone;
  NSISO8601DateFormatter *v6;
  NSISO8601DateFormatter *ttrTimeFormatter;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SVXRadarDraftFactory;
  v2 = -[SVXRadarDraftFactory init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = objc_claimAutoreleasedReturnValue();
    timeZone = v2->_timeZone;
    v2->_timeZone = (NSString *)v4;

    v6 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x24BDD15D0]);
    ttrTimeFormatter = v2->_ttrTimeFormatter;
    v2->_ttrTimeFormatter = v6;

    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSISO8601DateFormatter setTimeZone:](v2->_ttrTimeFormatter, "setTimeZone:", v8);

    -[NSISO8601DateFormatter setFormatOptions:](v2->_ttrTimeFormatter, "setFormatOptions:", 4083);
  }
  return v2;
}

- (id)createWithRequiredContent:(id)a3 extraContent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSISO8601DateFormatter *ttrTimeFormatter;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v6 = a3;
  v7 = a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2050000000;
  v8 = (void *)getRadarDraftClass_softClass;
  v44 = getRadarDraftClass_softClass;
  if (!getRadarDraftClass_softClass)
  {
    v36 = MEMORY[0x24BDAC760];
    v37 = 3221225472;
    v38 = __getRadarDraftClass_block_invoke;
    v39 = &unk_24D24D1E0;
    v40 = &v41;
    __getRadarDraftClass_block_invoke((uint64_t)&v36);
    v8 = (void *)v42[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v41, 8);
  v10 = objc_alloc_init(v9);
  objc_msgSend(v6, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v11);

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "radarDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ttrTimeFormatter = self->_ttrTimeFormatter;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSISO8601DateFormatter stringFromDate:](ttrTimeFormatter, "stringFromDate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Please add relevant iPhones and AppleTVs to the radar\n\n%@ - Timestamp (when radar draft was created on HomePod): %@ (%@ time)"), v13, v16, self->_timeZone);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProblemDescription:", v17);

  objc_msgSend(v10, "setIsUserInitiated:", 0);
  objc_msgSend(v6, "componentName");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v6, "componentVersion");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(v6, "componentID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_10;
      v41 = 0;
      v42 = &v41;
      v43 = 0x2050000000;
      v23 = (void *)getRadarComponentClass_softClass;
      v44 = getRadarComponentClass_softClass;
      if (!getRadarComponentClass_softClass)
      {
        v36 = MEMORY[0x24BDAC760];
        v37 = 3221225472;
        v38 = __getRadarComponentClass_block_invoke;
        v39 = &unk_24D24D1E0;
        v40 = &v41;
        __getRadarComponentClass_block_invoke((uint64_t)&v36);
        v23 = (void *)v42[3];
      }
      v24 = objc_retainAutorelease(v23);
      _Block_object_dispose(&v41, 8);
      v25 = [v24 alloc];
      objc_msgSend(v6, "componentName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentVersion");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v25, "initWithName:version:identifier:", v19, v26, objc_msgSend(v27, "integerValue"));
      objc_msgSend(v10, "setComponent:", v28);

    }
  }
LABEL_10:
  if (v7)
  {
    objc_msgSend(v7, "deviceIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v7, "deviceIDs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDeviceIDs:", v30);

    }
    objc_msgSend(v7, "extensionIDs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v7, "extensionIDs");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDiagnosticExtensionIDs:", v32);

    }
    objc_msgSend(v7, "attachmentURLs");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v7, "attachmentURLs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAttachments:", v34);

    }
  }
  objc_msgSend(v10, "setBundleID:", CFSTR("com.apple.siri"));
  objc_msgSend(v10, "setReproducibility:", 5);
  objc_msgSend(v10, "setClassification:", 6);
  objc_msgSend(v10, "setRemoteDeviceClasses:", 9);
  objc_msgSend(v10, "setRemoteDeviceSelections:", 16);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttrTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end
