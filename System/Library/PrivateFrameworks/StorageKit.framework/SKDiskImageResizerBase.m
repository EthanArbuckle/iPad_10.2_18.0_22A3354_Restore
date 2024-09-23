@implementation SKDiskImageResizerBase

- (SKDiskImageResizerBase)initWithDiskImage:(id)a3 limits:(id)a4 resizeParams:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  SKDiskImageResizerBase *v15;
  SKDiskImageResizerBase *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v11, "deduceDiskWithError:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_8;
  if (!objc_msgSend(v13, "size"))
    objc_msgSend(v13, "setSize:", objc_msgSend(v12, "minBytes"));
  v18.receiver = self;
  v18.super_class = (Class)SKDiskImageResizerBase;
  v15 = -[SKDiskResizerBase initWithDisk:requestedSize:](&v18, sel_initWithDisk_requestedSize_, v14, objc_msgSend(v13, "size"));
  self = v15;
  if (!v15
    || (objc_storeStrong((id *)&v15->_resizeParams, a5),
        objc_storeStrong((id *)&self->_image, a3),
        objc_storeStrong((id *)&self->_limits, a4),
        -[SKDiskImageResizerBase checkLimitsWithError:](self, "checkLimitsWithError:", a6))
    && -[SKDiskImageResizerBase prepareRecoveryMoverWithError:](self, "prepareRecoveryMoverWithError:", a6))
  {
    self = self;
    v16 = self;
  }
  else
  {
LABEL_8:
    v16 = 0;
  }

  return v16;
}

- (BOOL)prepareRecoveryMoverWithError:(id *)a3
{
  SKLastPartitions *v5;
  void *v6;
  SKLastPartitions *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  void *v33;
  void *v34;
  SKRecoveryMoverInfo *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  SKRecoveryMoverInfo *v39;
  SKRecoveryMoverInfo *recoveryMoverInfo;
  int v41;
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = [SKLastPartitions alloc];
  -[SKDiskResizerBase disk](self, "disk");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SKLastPartitions initWithDisk:](v5, "initWithDisk:", v6);

  -[SKLastPartitions recoveryPart](v7, "recoveryPart");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_12;
  -[SKDiskResizerBase disk](self, "disk");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[SKLastPartitions secondaryPartitionTableSizeWithDiskType:](SKLastPartitions, "secondaryPartitionTableSizeWithDiskType:", v10);

  -[SKLastPartitions recoveryPart](v7, "recoveryPart");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unformattedSize") + v11;

  if (-[SKDiskResizerBase requestedSize](self, "requestedSize") <= v13)
  {
    SKGetOSLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v41 = 136315138;
      v42 = "-[SKDiskImageResizerBase prepareRecoveryMoverWithError:]";
      _os_log_impl(&dword_22FE50000, v31, OS_LOG_TYPE_ERROR, "%s: The requested size to resize is smaller than the recovery partition", (uint8_t *)&v41, 0xCu);
    }

    v30 = +[SKError failWithSKErrorCode:error:](SKError, "failWithSKErrorCode:error:", 257, a3);
    goto LABEL_16;
  }
  v14 = -[SKDiskResizerBase requestedSize](self, "requestedSize") - v13;
  -[SKLastPartitions recoveryPart](v7, "recoveryPart");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "startLocation");

  v17 = v14 - v16;
  if (v14 == v16)
  {
LABEL_12:
    v30 = 1;
    goto LABEL_16;
  }
  -[SKLastPartitions recoveryPart](v7, "recoveryPart");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unformattedSize");
  if (v17 >= 0)
    v20 = v17;
  else
    v20 = -v17;

  if (v19 > v20)
  {
    SKGetOSLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[SKLastPartitions recoveryPart](v7, "recoveryPart");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "startLocation");
      -[SKLastPartitions recoveryPart](v7, "recoveryPart");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 136315906;
      v42 = "-[SKDiskImageResizerBase prepareRecoveryMoverWithError:]";
      v43 = 2048;
      v44 = v23;
      v45 = 2048;
      v46 = v14;
      v47 = 2048;
      v48 = objc_msgSend(v24, "unformattedSize");
      _os_log_impl(&dword_22FE50000, v21, OS_LOG_TYPE_DEFAULT, "%s: Recovery partition current offset %lld, new offset %lld, size %lld, need to perform a 2-step move", (uint8_t *)&v41, 0x2Au);

    }
    -[SKLastPartitions recoveryPart](v7, "recoveryPart");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "startLocation");
    -[SKLastPartitions recoveryPart](v7, "recoveryPart");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "unformattedSize");

    -[SKLastPartitions recoveryPart](v7, "recoveryPart");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDiskImageResizerBase setRequiredSizeForRecoveryMove:](self, "setRequiredSizeForRecoveryMove:", v26 + v11 + v28 + objc_msgSend(v29, "unformattedSize"));

    if (v17 >= 1)
      -[SKDiskImageResizerBase setRequiredSizeForRecoveryMove:](self, "setRequiredSizeForRecoveryMove:", -[SKDiskImageResizerBase requiredSizeForRecoveryMove](self, "requiredSizeForRecoveryMove") + v17);
    goto LABEL_12;
  }
  -[SKLastPartitions recoveryPart](v7, "recoveryPart");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPartitionTable partitionIDFromDisk:](SKPartitionTable, "partitionIDFromDisk:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v35 = [SKRecoveryMoverInfo alloc];
    -[SKLastPartitions recoveryPart](v7, "recoveryPart");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "startLocation");
    -[SKLastPartitions recoveryPart](v7, "recoveryPart");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[SKRecoveryMoverInfo initWithSrcOffset:dstOffset:length:partitionID:](v35, "initWithSrcOffset:dstOffset:length:partitionID:", v37, v14, objc_msgSend(v38, "unformattedSize"), v34);
    recoveryMoverInfo = self->_recoveryMoverInfo;
    self->_recoveryMoverInfo = v39;

    v30 = 1;
  }
  else
  {
    v30 = +[SKError failWithSKErrorCode:debugDescription:error:](SKError, "failWithSKErrorCode:debugDescription:error:", 117, CFSTR("Failed to retrieve the recovery partition ID"), a3);
  }

LABEL_16:
  return v30;
}

- (void)setRequestedSize:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  -[SKDiskImageResizerBase resizeParams](self, "resizeParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSize:", a3);

  v6.receiver = self;
  v6.super_class = (Class)SKDiskImageResizerBase;
  -[SKDiskResizerBase setRequestedSize:](&v6, sel_setRequestedSize_, a3);
}

- (id)attachForResizeParams
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIsManagedAttach:", 1);
  objc_msgSend(v2, "setPolicy:", 0);
  return v2;
}

- (BOOL)checkLimitsWithError:(id *)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v5 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
  -[SKDiskImageResizerBase limits](self, "limits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= objc_msgSend(v6, "minBytes"))
  {
    -[SKDiskImageResizerBase limits](self, "limits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maxBytes");
    v9 = -[SKDiskResizerBase requestedSize](self, "requestedSize");

    if (v8 >= v9)
      return 1;
  }
  else
  {

  }
  -[SKDiskImageResizerBase limits](self, "limits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "maxBytes");
  v12 = -[SKDiskResizerBase requestedSize](self, "requestedSize");

  if (v11 < v12)
    v13 = 256;
  else
    v13 = 257;
  return +[SKError failWithSKErrorCode:error:](SKError, "failWithSKErrorCode:error:", v13, a3);
}

- (id)volumeResize:(id *)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = dispatch_semaphore_create(0);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  -[SKDiskResizerBase disk](self, "disk");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __39__SKDiskImageResizerBase_volumeResize___block_invoke;
  v22 = &unk_24FDBFF80;
  v24 = &v25;
  v8 = v5;
  v23 = v8;
  objc_msgSend(v6, "resizeToSize:completionBlock:", v7, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKDiskResizerBase resizeError](self, "resizeError", v19, v20, v21, v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = v10 == 0;

  if ((_DWORD)v6)
  {
    -[SKDiskResizerBase progress](self, "progress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "chainChildProgress:withPendingUnitCount:", v9, 70);

  }
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v26[5])
  {
    SKGetOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)v26[5];
      *(_DWORD *)buf = 136315394;
      v32 = "-[SKDiskImageResizerBase volumeResize:]";
      v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_22FE50000, v12, OS_LOG_TYPE_DEFAULT, "%s: Resize failed: %@", buf, 0x16u);
    }

    if (a3)
      *a3 = objc_retainAutorelease((id)v26[5]);
    -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SKGetOSLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskResizerBase disk](self, "disk");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v32 = "-[SKDiskImageResizerBase volumeResize:]";
      v33 = 2112;
      v34 = v16;
      _os_log_impl(&dword_22FE50000, v15, OS_LOG_TYPE_DEFAULT, "%s: %@ resized successfully", buf, 0x16u);

    }
    -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v14;

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __39__SKDiskImageResizerBase_volumeResize___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)imageResize:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  SKGetOSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SKDiskImageResizerBase image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136315394;
    v23 = "-[SKDiskImageResizerBase imageResize:]";
    v24 = 2112;
    v25 = (uint64_t)v6;
    _os_log_impl(&dword_22FE50000, v5, OS_LOG_TYPE_DEFAULT, "%s: Resizing disk image %@", (uint8_t *)&v22, 0x16u);

  }
  -[SKDiskResizerBase disk](self, "disk");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ejectWithError:", a3);

  if ((v8 & 1) == 0)
    goto LABEL_9;
  +[SKError frameworkBundle](SKError, "frameworkBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Resizing disk image..."), &stru_24FDC08E8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskResizerBase progress](self, "progress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocalizedAdditionalDescription:", v10);

  -[SKDiskResizerBase setCompletedUnitCount:](self, "setCompletedUnitCount:", -[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 2);
  -[SKDiskImageResizerBase image](self, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskImageResizerBase resizeParams](self, "resizeParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "diResize:error:", v13, a3);

  SKGetOSLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315394;
    v23 = "-[SKDiskImageResizerBase imageResize:]";
    v24 = 2048;
    v25 = v14;
    _os_log_impl(&dword_22FE50000, v15, OS_LOG_TYPE_DEFAULT, "%s: Resized disk image to new size %lld", (uint8_t *)&v22, 0x16u);
  }

  if (v14)
  {
    -[SKDiskImageResizerBase setRequestedSize:](self, "setRequestedSize:", v14);
    -[SKDiskResizerBase setCompletedUnitCount:](self, "setCompletedUnitCount:", -[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 6);
    -[SKDiskImageResizerBase image](self, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDiskImageResizerBase attachForResizeParams](self, "attachForResizeParams");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attachWithParams:error:", v17, a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDiskResizerBase setDisk:](self, "setDisk:", v18);

    -[SKDiskResizerBase setCompletedUnitCount:](self, "setCompletedUnitCount:", -[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 2);
    -[SKDiskResizerBase disk](self, "disk");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      return 0;
    -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v20;
}

- (id)moveRecovery:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  unint64_t v45;
  const char *v46;
  NSObject *v47;
  uint64_t v48;
  int v49;
  id v50;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  SKPartitionTable *v58;
  void *v59;
  SKPartitionTable *v60;
  void *v61;
  void *v62;
  void *v63;
  BOOL v64;
  id v65;
  void *v66;
  id v67;
  id *v68;
  uint64_t v69;
  _QWORD v70[4];
  _QWORD v71[4];
  _QWORD v72[6];
  _QWORD v73[6];
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  _QWORD v82[2];
  _QWORD v83[5];

  v83[2] = *MEMORY[0x24BDAC8D0];
  -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_22;
  +[SKError frameworkBundle](SKError, "frameworkBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Moving recovery partition..."), &stru_24FDC08E8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskResizerBase progress](self, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocalizedAdditionalDescription:", v7);

  -[SKDiskResizerBase disk](self, "disk");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "getSectorSize");

  -[SKDiskResizerBase disk](self, "disk");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[SKMediaKit newMediaRefForDisk:options:error:](SKMediaKit, "newMediaRefForDisk:options:error:", v11, 0, a3);

  if (!v12)
  {
    SKGetOSLog();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v75 = "-[SKDiskImageResizerBase moveRecovery:]";
      _os_log_impl(&dword_22FE50000, v47, OS_LOG_TYPE_ERROR, "%s: Failed creating MediaKit reference for reading", buf, 0xCu);
    }

    -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
    v48 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v82[0] = CFSTR("Shared Writer");
  v82[1] = CFSTR("Writable");
  v83[0] = MEMORY[0x24BDBD1C8];
  v83[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskResizerBase disk](self, "disk");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[SKMediaKit newMediaRefForDisk:options:error:](SKMediaKit, "newMediaRefForDisk:options:error:", v14, v13, a3);

  SKGetOSLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    v66 = v13;
    v68 = a3;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v15;
      v20 = objc_msgSend(v18, "length");
      -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "srcOffset");
      -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
      v23 = v12;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v75 = "-[SKDiskImageResizerBase moveRecovery:]";
      v76 = 2048;
      v77 = v20;
      v15 = v19;
      v78 = 2048;
      v79 = v22;
      v80 = 2048;
      v81 = objc_msgSend(v24, "dstOffset");
      _os_log_impl(&dword_22FE50000, v17, OS_LOG_TYPE_DEFAULT, "%s: Moving recovery partition of size %lld from offset %lld to %lld...", buf, 0x2Au);

      v12 = v23;
    }

    v72[0] = CFSTR("Instruction Code");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v25;
    v73[1] = v12;
    v67 = v12;
    v72[1] = CFSTR("Source Device");
    v72[2] = CFSTR("Target Device");
    v65 = v15;
    v73[2] = v15;
    v72[3] = CFSTR("Source Offset");
    v26 = (void *)MEMORY[0x24BDD16E0];
    -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v10;
    objc_msgSend(v26, "numberWithUnsignedLongLong:", objc_msgSend(v27, "srcOffset") / (unint64_t)v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v73[3] = v29;
    v72[4] = CFSTR("Target Offset");
    v30 = (void *)MEMORY[0x24BDD16E0];
    -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithUnsignedLongLong:", objc_msgSend(v31, "dstOffset") / (unint64_t)v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v73[4] = v32;
    v72[5] = CFSTR("Block Count");
    v33 = (void *)MEMORY[0x24BDD16E0];
    -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "numberWithUnsignedLongLong:", objc_msgSend(v34, "length") / v28);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v73[5] = v35;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 6);
    v36 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v36;
    v70[0] = CFSTR("Block Size");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v28);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v38;
    v71[1] = &unk_24FDCC950;
    v70[1] = CFSTR("Buffer Size");
    v70[2] = CFSTR("Buffer Count");
    v71[2] = &unk_24FDCC968;
    v70[3] = CFSTR("Instructions");
    v69 = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v39;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = IOJobSetup();
    if ((_DWORD)v41)
    {
      v42 = v41;
      SKGetOSLog();
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v68;
      v45 = 0x24FDBF000;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "-[SKDiskImageResizerBase moveRecovery:]";
        v76 = 1024;
        LODWORD(v77) = v42;
        v46 = "%s: IOJobSetup failed, err=%d";
LABEL_18:
        _os_log_impl(&dword_22FE50000, v43, OS_LOG_TYPE_ERROR, v46, buf, 0x12u);
      }
    }
    else
    {
      v42 = IOJobInitiate();
      IOJobDispose();
      v44 = v68;
      v45 = 0x24FDBF000uLL;
      if (!(_DWORD)v42)
      {
        -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "dstOffset");

        -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "srcOffset");
        -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setDstOffset:", v55);

        -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setSrcOffset:", v53);

        v58 = [SKPartitionTable alloc];
        -[SKDiskResizerBase disk](self, "disk");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = -[SKPartitionTable initWithDisk:error:](v58, "initWithDisk:error:", v59, v68);

        if (!v60)
          goto LABEL_28;
        -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "partitionID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = -[SKPartitionTable resizePartitionID:size:offset:error:](v60, "resizePartitionID:size:offset:error:", v62, objc_msgSend(v63, "length"), v53, v68);

        if (v64)
        {
          v49 = 0;
        }
        else
        {
LABEL_28:
          -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", v68);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 1;
        }

        goto LABEL_20;
      }
      SKGetOSLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "-[SKDiskImageResizerBase moveRecovery:]";
        v76 = 1024;
        LODWORD(v77) = v42;
        v46 = "%s: Recovery partition blocks copy failed, err=%d";
        goto LABEL_18;
      }
    }

    v50 = (id)objc_msgSend(*(id *)(v45 + 1096), "errorWithPOSIXCode:error:", v42, v44);
    -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", v44);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 1;
LABEL_20:
    v13 = v66;
    v12 = v67;
    v15 = v65;

    goto LABEL_21;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v75 = "-[SKDiskImageResizerBase moveRecovery:]";
    _os_log_impl(&dword_22FE50000, v17, OS_LOG_TYPE_ERROR, "%s: Failed creating MediaKit reference for writing", buf, 0xCu);
  }

  -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 1;
LABEL_21:

  if (!v49)
  {
LABEL_22:
    -[SKDiskResizerBase setCompletedUnitCount:](self, "setCompletedUnitCount:", -[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 10);
    -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
    v48 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v44 = (void *)v48;
  }
  return v44;
}

- (id)fitToSize:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SKPartitionTable *v14;
  void *v15;
  SKPartitionTable *v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[SKDiskResizerBase disk](self, "disk");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", kSKDiskTypeUninitalized[0]);

  if (v7)
  {
    -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SKGetOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskResizerBase disk](self, "disk");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315650;
      v20 = "-[SKDiskImageResizerBase fitToSize:]";
      v21 = 2112;
      v22 = v10;
      v23 = 2048;
      v24 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
      _os_log_impl(&dword_22FE50000, v9, OS_LOG_TYPE_DEFAULT, "%s: Fitting media of %@ to %llu", (uint8_t *)&v19, 0x20u);

    }
    +[SKError frameworkBundle](SKError, "frameworkBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Fitting partition table to new disk size..."), &stru_24FDC08E8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDiskResizerBase progress](self, "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLocalizedAdditionalDescription:", v12);

    v14 = [SKPartitionTable alloc];
    -[SKDiskResizerBase disk](self, "disk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SKPartitionTable initWithDisk:error:](v14, "initWithDisk:error:", v15, a3);

    if (v16
      && -[SKPartitionTable fitToContainerSize:error:](v16, "fitToContainerSize:error:", -[SKDiskResizerBase requestedSize](self, "requestedSize"), a3))
    {
      -[SKDiskResizerBase setCompletedUnitCount:](self, "setCompletedUnitCount:", -[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 10);
      -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;

    return v18;
  }
}

- (SKDiskImageSizeLimits)limits
{
  return self->_limits;
}

- (void)setLimits:(id)a3
{
  objc_storeStrong((id *)&self->_limits, a3);
}

- (unint64_t)requiredSizeForRecoveryMove
{
  return self->_requiredSizeForRecoveryMove;
}

- (void)setRequiredSizeForRecoveryMove:(unint64_t)a3
{
  self->_requiredSizeForRecoveryMove = a3;
}

- (SKDiskImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (SKDiskImageResizeParams)resizeParams
{
  return self->_resizeParams;
}

- (void)setResizeParams:(id)a3
{
  objc_storeStrong((id *)&self->_resizeParams, a3);
}

- (SKRecoveryMoverInfo)recoveryMoverInfo
{
  return self->_recoveryMoverInfo;
}

- (void)setRecoveryMoverInfo:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryMoverInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryMoverInfo, 0);
  objc_storeStrong((id *)&self->_resizeParams, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_limits, 0);
}

@end
