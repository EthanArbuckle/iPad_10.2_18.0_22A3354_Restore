@implementation SKLastPartitionResizer

- (unint64_t)currentSize
{
  SKLastPartitions *v3;
  void *v4;
  SKLastPartitions *v5;
  void *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  char *v17;
  char *v19;

  v3 = [SKLastPartitions alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase disk](self, "disk"));
  v5 = -[SKLastPartitions initWithDisk:](v3, "initWithDisk:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v5, "resizablePart"));
  v7 = (char *)objc_msgSend(v6, "unformattedSize");

  v19 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v5, "resizablePart"));
  v9 = objc_opt_class(SKAPFSStoreDisk);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v5, "resizablePart"));
  v12 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "container"));

    if (v13)
    {
      v7 = (char *)objc_msgSend(v13, "totalSpace");
      v19 = v7;
    }

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "type"));
    v15 = objc_msgSend(v14, "isEqualToString:", kSKDiskTypeHFS);

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v5, "resizablePart"));
      +[SKLastPartitions hfsMinimalSizeForDisk:currentSize:](SKLastPartitions, "hfsMinimalSizeForDisk:currentSize:", v16, &v19);

      v7 = v19;
    }
  }
  v17 = &v7[-[SKLastPartitions nonResizableSize](v5, "nonResizableSize")];

  return (unint64_t)v17;
}

- (id)partResize:(id *)a3
{
  SKLastPartitions *v5;
  void *v6;
  SKLastPartitions *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  SKPartitionTable *v23;
  void *v24;
  SKPartitionTable *v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unint64_t v34;

  v5 = [SKLastPartitions alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase disk](self, "disk"));
  v7 = -[SKLastPartitions initWithDisk:](v5, "initWithDisk:", v6);

  v8 = objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v7, "resizablePart"));
  if (!v8)
    goto LABEL_3;
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v7, "resizablePart"));
  v11 = objc_msgSend(v10, "isWholeDisk");

  if ((v11 & 1) != 0)
    goto LABEL_3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SKError frameworkBundle](SKError, "frameworkBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Resizing partition..."), &stru_100046738, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  objc_msgSend(v17, "setLocalizedAdditionalDescription:", v16);

  v18 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
  v19 = v18 - -[SKLastPartitions nonResizableSize](v7, "nonResizableSize");
  v20 = sub_10000BA9C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v7, "resizablePart"));
    v29 = 136315650;
    v30 = "-[SKLastPartitionResizer partResize:]";
    v31 = 2112;
    v32 = v22;
    v33 = 2048;
    v34 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: Resizing partition %@ to %lld bytes", (uint8_t *)&v29, 0x20u);

  }
  v23 = [SKPartitionTable alloc];
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase disk](self, "disk"));
  v25 = -[SKPartitionTable initWithDisk:error:](v23, "initWithDisk:error:", v24, a3);

  if (!v25)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3));
    goto LABEL_4;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v7, "resizablePart"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[SKPartitionTable partitionIDFromDisk:](SKPartitionTable, "partitionIDFromDisk:", v26));

  if (!v27)
  {
    v28 = +[SKError errorWithCode:debugDescription:error:](SKError, "errorWithCode:debugDescription:error:", 117, CFSTR("Failed to get the ID of the resized partition"), a3);
    goto LABEL_14;
  }
  if (!-[SKPartitionTable resizePartitionID:size:offset:error:](v25, "resizePartitionID:size:offset:error:", v27, v19, 0, a3))
  {
LABEL_14:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3));

    goto LABEL_5;
  }

LABEL_3:
  -[SKDiskResizerBase setCompletedUnitCount:](self, "setCompletedUnitCount:", (char *)-[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 10);
  v12 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase eventFromSize](self, "eventFromSize"));
LABEL_4:
  v13 = (void *)v12;
LABEL_5:

  return v13;
}

- (id)fsResize:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  SKLastPartitions *v8;
  void *v9;
  SKLastPartitions *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  __MKMedia *v28;
  void *v29;
  unsigned int v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  SKLastPartitions *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  _QWORD v44[4];
  SKLastPartitions *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  unint64_t v51;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SKError frameworkBundle](SKError, "frameworkBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Resizing file system..."), &stru_100046738, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  objc_msgSend(v7, "setLocalizedAdditionalDescription:", v6);

  v8 = [SKLastPartitions alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase disk](self, "disk"));
  v10 = -[SKLastPartitions initWithDisk:](v8, "initWithDisk:", v9);

  v11 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
  v12 = v11 - -[SKLastPartitions nonResizableSize](v10, "nonResizableSize");
  v13 = sub_10000BA9C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v10, "resizablePart"));
    *(_DWORD *)buf = 136315650;
    v47 = "-[SKLastPartitionResizer fsResize:]";
    v48 = 2112;
    v49 = v15;
    v50 = 2048;
    v51 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Resizing filesystem on %@ to %lld", buf, 0x20u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v10, "resizablePart"));
  v17 = objc_opt_class(SKAPFSStoreDisk);
  isKindOfClass = objc_opt_isKindOfClass(v16, v17);

  if ((isKindOfClass & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v10, "resizablePart"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "type"));
    v26 = objc_msgSend(v25, "isEqualToString:", kSKDiskTypeHFS);

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v10, "resizablePart"));
      v28 = +[SKPartitionTable createMediaRefWithDisk:error:](SKPartitionTable, "createMediaRefWithDisk:error:", v27, a3);

      if (!v28)
      {
LABEL_16:
        v23 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3));
LABEL_25:
        v42 = (void *)v23;
        goto LABEL_26;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v10, "resizablePart"));
      v30 = objc_msgSend(v29, "getSectorSize");

      if (v30)
        v31 = v30;
      else
        v31 = 512;
      v32 = MKHFSResizeVolume(v12 / v31, v28, 0);
      CFRelease(v28);
      if ((_DWORD)v32)
      {
        v33 = +[SKError errorWithOSStatus:error:](SKError, "errorWithOSStatus:error:", v32, a3);
        goto LABEL_16;
      }
    }
LABEL_24:
    -[SKDiskResizerBase setCompletedUnitCount:](self, "setCompletedUnitCount:", (char *)-[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 80);
    v23 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase eventFromSize](self, "eventFromSize"));
    goto LABEL_25;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  if ((objc_msgSend(v19, "isCancelled") & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));

    if (!v20)
    {
      v21 = sub_10000BA9C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[SKLastPartitionResizer fsResize:]";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Cancelling resize before it starts", buf, 0xCu);
      }

      v23 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase cancelWithError:](self, "cancelWithError:", a3));
      goto LABEL_25;
    }
  }
  else
  {

  }
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10002B8F8;
  v44[3] = &unk_100044B78;
  v34 = v10;
  v45 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  objc_msgSend(v35, "setCancellationHandler:", v44);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v34, "resizablePart"));
  v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "diskIdentifier")));
  v38 = APFSContainerResize(objc_msgSend(v37, "UTF8String"), v12);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  LODWORD(v37) = objc_msgSend(v39, "isCancelled");

  if (!(_DWORD)v37)
  {
    if ((_DWORD)v38)
    {
      v41 = +[SKError nilWithOSStatus:debugDescription:error:](SKError, "nilWithOSStatus:debugDescription:error:", v38, CFSTR("APFS container resize failed"), a3);
      v40 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3));
      goto LABEL_22;
    }

    goto LABEL_24;
  }
  v40 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase cancelWithError:](self, "cancelWithError:", a3));
LABEL_22:
  v42 = (void *)v40;

LABEL_26:
  return v42;
}

- (id)resizeStateMachine:(id *)a3
{
  SKStateTransitionEntry *v4;
  SKStateTransitionEntry *v5;
  void *v6;
  id v7;
  void *v8;
  SKStateTransitionEntry *v9;
  void *v10;
  SKStateTransitionEntry *v11;
  void *v12;
  SKStateTransitionEntry *v13;
  void *v14;
  id v15;
  void *v16;
  SKStateTransitionEntry *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[8];

  v4 = sub_10000A21C((uint64_t)CFSTR("kPartitionResize"), (uint64_t)off_100051810, (uint64_t)"partResize:", (uint64_t)CFSTR("kFSResize"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v27[0] = v26;
  v5 = sub_10000A21C((uint64_t)CFSTR("kFSResize"), (uint64_t)off_100051810, (uint64_t)"fsResize:", (uint64_t)off_100051828);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v27[1] = v6;
  v7 = sub_10000A250((uint64_t)off_100051828, (uint64_t)off_100051810);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v27[2] = v8;
  v9 = sub_10000A21C((uint64_t)off_100051828, (uint64_t)off_100051818, (uint64_t)"fsResize:", (uint64_t)CFSTR("kPartitionResize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v27[3] = v10;
  v11 = sub_10000A21C((uint64_t)CFSTR("kFSResize"), (uint64_t)off_100051818, (uint64_t)"fsResize:", (uint64_t)CFSTR("kPartitionResize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v27[4] = v12;
  v13 = sub_10000A21C((uint64_t)CFSTR("kPartitionResize"), (uint64_t)off_100051818, (uint64_t)"partResize:", (uint64_t)off_100051830);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v27[5] = v14;
  v15 = sub_10000A250((uint64_t)off_100051830, (uint64_t)off_100051818);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v27[6] = v16;
  v17 = sub_10000A21C((uint64_t)off_100051830, (uint64_t)off_100051810, (uint64_t)"partResize:", (uint64_t)CFSTR("kFSResize"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v27[7] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 8));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:](SKStateTransitionTable, "tableWithTransitionEntries:selectorTarget:", v19, self));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase eventFromSize](self, "eventFromSize"));
  if (objc_msgSend(v21, "isEqualToString:", off_100051810))
    v22 = CFSTR("kPartitionResize");
  else
    v22 = CFSTR("kFSResize");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase eventFromSize](self, "eventFromSize"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SKStateMachine machineWithStateTransitionTable:startState:startEvent:](SKStateMachine, "machineWithStateTransitionTable:startState:startEvent:", v20, v22, v23));

  return v24;
}

@end
