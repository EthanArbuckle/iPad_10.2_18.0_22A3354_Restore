@implementation RCPMovie

- (RCPMovie)initWithEventStream:(id)a3 snapshots:(id)a4
{
  RCPEventStream *v6;
  id v7;
  RCPMovie *v8;
  RCPEventStream *eventStream;
  RCPEventStream *v10;
  uint64_t v11;
  NSArray *snapshots;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = (RCPEventStream *)a3;
  v18.receiver = self;
  v18.super_class = (Class)RCPMovie;
  v7 = a4;
  v8 = -[RCPMovie init](&v18, sel_init);
  eventStream = v8->_eventStream;
  v8->_eventStream = v6;
  v10 = v6;

  v11 = objc_msgSend(v7, "copy", v18.receiver, v18.super_class);
  snapshots = v8->_snapshots;
  v8->_snapshots = (NSArray *)v11;

  -[NSArray lastObject](v8->_snapshots, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "snapshotImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_interfaceOrientation = objc_msgSend(v14, "imageOrientation");

  -[NSArray objectAtIndexedSubscript:](v8->_snapshots, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_startTimestamp = objc_msgSend(v15, "timestamp");

  -[NSArray lastObject](v8->_snapshots, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v8->_endTimestamp = objc_msgSend(v16, "timestamp");
  return v8;
}

- (id)trimmedFrom:(unint64_t)a3 to:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  RCPMovie *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[RCPMovie eventStream](self, "eventStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trimmedFrom:to:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[RCPMovie snapshots](self, "snapshots", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v15, "timestamp") >= a3 && objc_msgSend(v15, "timestamp") <= a4)
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v16 = -[RCPMovie initWithEventStream:snapshots:]([RCPMovie alloc], "initWithEventStream:snapshots:", v8, v9);
  -[RCPMovie screenshot](self, "screenshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPMovie setScreenshot:](v16, "setScreenshot:", v17);

  return v16;
}

- (RCPMovie)initWithXPC:(id)a3
{
  void *v3;
  int64_t count;
  void *v5;
  size_t i;
  void *v7;
  void *v8;
  IOSurfaceRef v9;
  uint64_t uint64;
  uint64_t v11;
  RCPScreenSnapshot *v12;
  void *v13;
  const void *data;
  void *v15;
  void *v16;
  RCPMovie *v17;
  xpc_object_t xdict;
  size_t length;

  xdict = a3;
  xpc_dictionary_get_array(xdict, "snapshots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  count = xpc_array_get_count(v3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (count >= 1)
  {
    for (i = 0; i != count; ++i)
    {
      xpc_array_get_value(v3, i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_get_value(v7, "iosurface");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = IOSurfaceLookupFromXPCObject(v8);

      uint64 = xpc_dictionary_get_uint64(v7, "timestamp");
      v11 = xpc_dictionary_get_uint64(v7, "orientation");
      v12 = objc_alloc_init(RCPScreenSnapshot);
      -[RCPScreenSnapshot setTimestamp:](v12, "setTimestamp:", uint64);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "_initWithIOSurface:scale:orientation:", v9, v11, 1.0);
      -[RCPScreenSnapshot setSnapshotImage:](v12, "setSnapshotImage:", v13);

      objc_msgSend(v5, "addObject:", v12);
      CFRelease(v9);

    }
  }
  length = 0;
  data = xpc_dictionary_get_data(xdict, "eventStream", &length);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCPEventStream eventStreamWithData:error:](RCPEventStream, "eventStreamWithData:error:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[RCPMovie initWithEventStream:snapshots:](self, "initWithEventStream:snapshots:", v16, v5);
  return v17;
}

- (id)encodeToXPC
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  xpc_object_t XPCObject;
  void *v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  void *v12;
  xpc_object_t v13;
  xpc_object_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  size_t v21;
  char *v22;
  xpc_object_t v23;
  id v24;
  xpc_object_t v25;
  xpc_object_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  id v33;
  const char *v34;
  __int128 v35;
  char *v36;
  id v37;
  id v38;
  id v39;
  xpc_object_t v40[2];
  char *v41[2];
  xpc_object_t values[3];
  char *keys[2];
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[RCPMovie snapshots](self, "snapshots");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v32 = &v29;
  v30 = objc_msgSend(v33, "count");
  v36 = (char *)&v29 - ((8 * v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = 8 * v30;
  bzero(v36, 8 * v30);
  -[RCPMovie snapshots](self, "snapshots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    v35 = xmmword_1E4FC2458;
    v34 = "orientation";
    do
    {
      *(_OWORD *)keys = v35;
      v44 = v34;
      -[RCPMovie snapshots](self, "snapshots");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", v5);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "snapshotImage");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      XPCObject = IOSurfaceCreateXPCObject((IOSurfaceRef)objc_msgSend(v37, "ioSurface"));
      values[0] = XPCObject;
      -[RCPMovie snapshots](self, "snapshots");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = xpc_uint64_create(objc_msgSend(v8, "timestamp"));
      values[1] = v9;
      -[RCPMovie snapshots](self, "snapshots");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "snapshotImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = xpc_uint64_create(objc_msgSend(v12, "imageOrientation"));
      values[2] = v13;
      v14 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
      v15 = *(void **)&v36[8 * v5];
      *(_QWORD *)&v36[8 * v5] = v14;

      ++v5;
      -[RCPMovie snapshots](self, "snapshots");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v5 < v17);
  }
  -[RCPMovie eventStream](self, "eventStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dataRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v41[0] = "snapshots";
  v41[1] = "eventStream";
  -[RCPMovie snapshots](self, "snapshots");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");
  v22 = v36;
  v23 = xpc_array_create((xpc_object_t *)v36, v21);
  v40[0] = v23;
  v24 = objc_retainAutorelease(v19);
  v25 = xpc_data_create((const void *)objc_msgSend(v24, "bytes"), objc_msgSend(v24, "length"));
  v40[1] = v25;
  v26 = xpc_dictionary_create((const char *const *)v41, v40, 2uLL);

  v27 = v31;
  if (v30)
  {
    do
    {

      v27 -= 8;
    }
    while (v27);
  }

  return v26;
}

- (RCPMovie)initWithContentsOfURL:(id)a3
{
  id v4;
  RCPMovie *v5;
  uint64_t v6;
  AVAsset *screenRecording;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *eventStream;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  RCPMovie *v32;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)RCPMovie;
  v5 = -[RCPMovie init](&v41, sel_init);
  v34 = v4;
  objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v4, &unk_1E4FCD1F0);
  v6 = objc_claimAutoreleasedReturnValue();
  screenRecording = v5->_screenRecording;
  v5->_screenRecording = (AVAsset *)v6;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[RCPMovie screenRecording](v5, "screenRecording");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (!v10)
    goto LABEL_22;
  v11 = v10;
  v12 = *(_QWORD *)v38;
  v13 = *MEMORY[0x1E0C8A950];
  v36 = *MEMORY[0x1E0C8A988];
  v35 = *MEMORY[0x1E0C8A938];
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v38 != v12)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v14);
      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v13);

      if (v17)
      {
        objc_msgSend(v15, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_startTimestamp = objc_msgSend(v18, "integerValue");
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v15, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("mdta/com.apple.recap.endTimestamp"));

      if (v20)
      {
        objc_msgSend(v15, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_endTimestamp = objc_msgSend(v18, "integerValue");
        goto LABEL_17;
      }
      objc_msgSend(v15, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("mdta/com.apple.recap.events"));

      if (v22)
      {
        objc_msgSend(v15, "dataValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[RCPEventStream eventStreamWithData:error:](RCPEventStream, "eventStreamWithData:error:", v18, 0);
        v23 = objc_claimAutoreleasedReturnValue();
        eventStream = v5->_eventStream;
        v5->_eventStream = (RCPEventStream *)v23;
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v15, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", v36);

      if (v26)
      {
        objc_msgSend(v15, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_interfaceOrientation = objc_msgSend(v18, "integerValue");
        goto LABEL_17;
      }
      objc_msgSend(v15, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", v35);

      if (v28)
      {
        v29 = (void *)MEMORY[0x1E0CEA638];
        objc_msgSend(v15, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "imageWithData:", v18);
        v30 = objc_claimAutoreleasedReturnValue();
        eventStream = v5->_screenshot;
        v5->_screenshot = (UIImage *)v30;
        goto LABEL_16;
      }
      NSLog(CFSTR("Unknown metadata: %@"), v15);
LABEL_18:
      ++v14;
    }
    while (v11 != v14);
    v31 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    v11 = v31;
  }
  while (v31);
LABEL_22:

  if (v5->_eventStream)
    v32 = v5;
  else
    v32 = 0;

  return v32;
}

- (void)writeToURL:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIImage *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  OS_dispatch_queue *v44;
  OS_dispatch_queue *serializationQueue;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  OS_dispatch_queue *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  void (**v63)(_QWORD);
  _QWORD *v64;
  double v65;
  double v66;
  double v67;
  _QWORD v68[4];
  CMTime v69;
  id v70;
  id v71;
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[4];
  _QWORD v75[7];

  v75[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  objc_msgSend(v8, "removeItemAtURL:error:", v6, &v71);
  v9 = v71;

  -[RCPMovie snapshots](self, "snapshots");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "snapshotImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;

  v17 = objc_alloc(MEMORY[0x1E0C8B018]);
  v18 = *MEMORY[0x1E0C8A2E8];
  v70 = v9;
  v19 = (void *)objc_msgSend(v17, "initWithURL:fileType:error:", v6, v18, &v70);
  v20 = v70;

  if (v20)
  {
    NSLog(CFSTR("Failed to create asset writer: %@"), v20);
    v7[2](v7);
  }
  else
  {
    v57 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v57, "setIdentifier:", *MEMORY[0x1E0C8A950]);
    v21 = *MEMORY[0x1E0CA2480];
    objc_msgSend(v57, "setDataType:", *MEMORY[0x1E0CA2480]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[RCPMovie startTimestamp](self, "startTimestamp"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setValue:", v22);

    v56 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v56, "setIdentifier:", CFSTR("mdta/com.apple.recap.endTimestamp"));
    objc_msgSend(v56, "setDataType:", v21);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[RCPMovie endTimestamp](self, "endTimestamp"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setValue:", v23);

    v55 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v55, "setIdentifier:", *MEMORY[0x1E0C8A988]);
    objc_msgSend(v55, "setDataType:", *MEMORY[0x1E0CA2468]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RCPMovie interfaceOrientation](self, "interfaceOrientation"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setValue:", v24);

    v25 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v25, "setIdentifier:", CFSTR("mdta/com.apple.recap.events"));
    objc_msgSend(v25, "setDataType:", *MEMORY[0x1E0CA2440]);
    -[RCPMovie eventStream](self, "eventStream");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dataRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:", v27);

    -[RCPMovie screenshot](self, "screenshot");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[RCPMovie screenshot](self, "screenshot");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      RCPCGImageBackedImageFromImage(v29);
      v30 = (UIImage *)objc_claimAutoreleasedReturnValue();

      v31 = objc_alloc_init(MEMORY[0x1E0C8B278]);
      objc_msgSend(v31, "setIdentifier:", *MEMORY[0x1E0C8A938]);
      objc_msgSend(v31, "setDataType:", *MEMORY[0x1E0CA2408]);
      UIImageJPEGRepresentation(v30, 0.8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setValue:", v32);

      v75[0] = v57;
      v75[1] = v56;
      v75[2] = v55;
      v75[3] = v25;
      v75[4] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setMetadata:", v33);

    }
    else
    {
      v74[0] = v57;
      v74[1] = v56;
      v74[2] = v55;
      v74[3] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
      v30 = (UIImage *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setMetadata:", v30);
    }

    v34 = *MEMORY[0x1E0C8AE68];
    v73[0] = *MEMORY[0x1E0C8AE70];
    v35 = *MEMORY[0x1E0C8AF60];
    v72[0] = v34;
    v72[1] = v35;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v36;
    v72[2] = *MEMORY[0x1E0C8AEF0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 3);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v54);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B038], "assetWriterInputPixelBufferAdaptorWithAssetWriterInput:sourcePixelBufferAttributes:", v38, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addInput:", v38);
    -[RCPMovie eventStream](self, "eventStream");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "environment");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeScale");
    v43 = v42;

    objc_msgSend(v19, "startWriting");
    CMTimeMakeWithSeconds(&v69, v43 * (double)-[RCPMovie startTimestamp](self, "startTimestamp") / 1000000000.0, 600);
    objc_msgSend(v19, "startSessionAtSourceTime:", &v69);
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    v68[3] = 0;
    if (!self->_serializationQueue)
    {
      v44 = (OS_dispatch_queue *)dispatch_queue_create("movie-output", 0);
      serializationQueue = self->_serializationQueue;
      self->_serializationQueue = v44;

      v46 = self->_serializationQueue;
      dispatch_get_global_queue(17, 0);
      v47 = objc_claimAutoreleasedReturnValue();
      dispatch_set_target_queue(v46, v47);

    }
    -[RCPMovie snapshots](self, "snapshots");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "copy");

    v50 = self->_serializationQueue;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __34__RCPMovie_writeToURL_completion___block_invoke;
    v58[3] = &unk_1E4FC2478;
    v51 = v38;
    v59 = v51;
    v64 = v68;
    v52 = v49;
    v60 = v52;
    v65 = v14;
    v66 = v16;
    v67 = v43;
    v53 = v39;
    v61 = v53;
    v62 = v19;
    v63 = v7;
    objc_msgSend(v51, "requestMediaDataWhenReadyOnQueue:usingBlock:", v50, v58);

    _Block_object_dispose(v68, 8);
  }

}

void __34__RCPMovie_writeToURL_completion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CVBuffer *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  unint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  CMTime v26;
  CMTime v27;

  if (objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData"))
  {
    do
    {
      v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      if (v2 >= objc_msgSend(*(id *)(a1 + 40), "count"))
        break;
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "snapshotImage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      RCPCGImageBackedImageFromImage(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)MEMORY[0x1E0CEA638];
      v7 = objc_retainAutorelease(v5);
      v8 = objc_msgSend(v7, "CGImage");
      objc_msgSend(v7, "scale");
      v10 = v9;
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "snapshotImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v8, objc_msgSend(v12, "imageOrientation"), v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 40), "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "snapshotImage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = +[RCPMovie pixelBufferFromUIImage:size:orientation:](RCPMovie, "pixelBufferFromUIImage:size:orientation:", v13, objc_msgSend(v15, "imageOrientation"), *(double *)(a1 + 80), *(double *)(a1 + 88));

        memset(&v27, 0, sizeof(v27));
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeWithSeconds(&v27, *(double *)(a1 + 96) * (double)(unint64_t)objc_msgSend(v17, "timestamp") / 1000000000.0, 600);

        if (!objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData"))
          goto LABEL_12;
        v18 = *(void **)(a1 + 48);
        v26 = v27;
        v19 = objc_msgSend(v18, "appendPixelBuffer:withPresentationTime:", v16, &v26);
        CFRelease(v16);
        if (!v19 || objc_msgSend(*(id *)(a1 + 56), "status") == 3)
        {
          objc_msgSend(*(id *)(a1 + 56), "error");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("Failed to write movie: %@"), v20);

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "count");
        }
      }
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      if (v21 >= objc_msgSend(*(id *)(a1 + 40), "count") - 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
        v22 = *(void **)(a1 + 56);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __34__RCPMovie_writeToURL_completion___block_invoke_2;
        v23[3] = &unk_1E4FC2120;
        v24 = v22;
        v25 = *(id *)(a1 + 64);
        objc_msgSend(v24, "finishWritingWithCompletionHandler:", v23);

LABEL_12:
        return;
      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

    }
    while ((objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData") & 1) != 0);
  }
}

uint64_t __34__RCPMovie_writeToURL_completion___block_invoke_2(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "status") != 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed to write movie: %@"), v2);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (__CVBuffer)pixelBufferFromUIImage:(id)a3 size:(CGSize)a4 orientation:(int64_t)a5
{
  int width;
  int height;
  uint64_t v8;
  void *v9;
  id v10;
  const __CFDictionary *v11;
  void *BaseAddress;
  CGColorSpace *DeviceRGB;
  size_t BytesPerRow;
  CGContext *v15;
  CGContext *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  CGImage *v29;
  __CVBuffer *v30;
  CGAffineTransform v32;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v34[2];
  _QWORD v35[3];
  CGRect v36;

  v35[2] = *MEMORY[0x1E0C80C00];
  width = (int)a4.width;
  height = (int)a4.height;
  v8 = *MEMORY[0x1E0CA8F70];
  v34[0] = *MEMORY[0x1E0CA8F78];
  v34[1] = v8;
  v35[0] = MEMORY[0x1E0C9AAB0];
  v35[1] = MEMORY[0x1E0C9AAB0];
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  pixelBufferOut = 0;
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], width, height, 0x20u, v11, &pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  v15 = CGBitmapContextCreate(BaseAddress, width, height, 8uLL, BytesPerRow, DeviceRGB, 6u);
  v16 = v15;
  v17 = (double)-height;
  v18 = (double)width;
  v19 = (double)height;
  v20 = (double)-width;
  v21 = v20;
  v22 = v17;
  if (a5 == 1)
    v23 = (double)height;
  else
    v23 = 0.0;
  if (a5 == 1)
    v24 = (double)width;
  else
    v24 = 0.0;
  if (a5 != 1)
  {
    v22 = (double)height;
    v21 = (double)width;
  }
  if (a5 == 2)
  {
    v23 = 0.0;
    v24 = (double)width;
    v22 = 0.0;
  }
  else
  {
    v20 = 0.0;
  }
  if (a5 == 2)
    v25 = (double)height;
  else
    v25 = 0.0;
  if (a5 == 2)
    v21 = 0.0;
  if (a5 == 3)
    v22 = 0.0;
  else
    v19 = v23;
  if (a5 == 3)
  {
    v26 = 0.0;
  }
  else
  {
    v18 = v20;
    v17 = v25;
    v26 = v21;
  }
  v32.a = v26;
  v32.b = v17;
  v32.c = v18;
  v32.d = v22;
  if (a5 == 3)
    v27 = 0.0;
  else
    v27 = v24;
  v32.tx = v27;
  v32.ty = v19;
  CGContextConcatCTM(v15, &v32);
  v28 = objc_retainAutorelease(v10);
  v29 = (CGImage *)objc_msgSend(v28, "CGImage", *(_QWORD *)&v32.a, *(_QWORD *)&v32.b, *(_QWORD *)&v32.c, *(_QWORD *)&v32.d);

  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.width = 1.0;
  v36.size.height = 1.0;
  CGContextDrawImage(v16, v36, v29);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v16);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  v30 = pixelBufferOut;

  return v30;
}

- (RCPEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_eventStream, a3);
}

- (AVAsset)screenRecording
{
  return self->_screenRecording;
}

- (void)setScreenRecording:(id)a3
{
  objc_storeStrong((id *)&self->_screenRecording, a3);
}

- (NSArray)snapshots
{
  return self->_snapshots;
}

- (void)setSnapshots:(id)a3
{
  objc_storeStrong((id *)&self->_snapshots, a3);
}

- (UIImage)screenshot
{
  return self->_screenshot;
}

- (void)setScreenshot:(id)a3
{
  objc_storeStrong((id *)&self->_screenshot, a3);
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (unint64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshot, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_screenRecording, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_serializationQueue, 0);
}

@end
