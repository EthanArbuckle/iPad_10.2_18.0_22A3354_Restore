@implementation DataStreamFragmentAssembler

- (DataStreamFragmentAssembler)initWithSequenceNumber:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  void *v9;
  DataStreamFragmentAssembler *v10;
  DataStreamFragmentAssembler *v11;
  NSString *v12;
  NSString *type;
  uint64_t v14;
  NSMutableData *data;
  NSNumber *currentChunkSequenceNumber;
  DataStreamFragmentAssembler *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure(CFSTR("sequenceNumber"));
LABEL_9:
    _HMFPreconditionFailure(CFSTR("type"));
  }
  v9 = v8;
  if (!v8)
    goto LABEL_9;
  v24.receiver = self;
  v24.super_class = (Class)DataStreamFragmentAssembler;
  v10 = -[DataStreamFragmentAssembler init](&v24, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sequenceNumber, a3);
    v12 = (NSString *)objc_msgSend(v9, "copy");
    type = v11->_type;
    v11->_type = v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    data = v11->_data;
    v11->_data = (NSMutableData *)v14;

    currentChunkSequenceNumber = v11->_currentChunkSequenceNumber;
    v11->_currentChunkSequenceNumber = (NSNumber *)&off_100245810;

    v17 = v11;
    v19 = sub_10007CCE4((uint64_t)v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = sub_10007CD2C(v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138543874;
      v26 = v22;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}@Initialized data chunk assembler with sequence number: %@ type: %@", buf, 0x20u);

    }
  }

  return v11;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  void *v20;
  _QWORD v21[5];

  v3 = objc_alloc((Class)HMFAttributeDescription);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler sequenceNumber](self, "sequenceNumber"));
  v19 = objc_msgSend(v3, "initWithName:value:", CFSTR("Sequence Number"), v20);
  v21[0] = v19;
  v4 = objc_alloc((Class)HMFAttributeDescription);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler type](self, "type"));
  v6 = objc_msgSend(v4, "initWithName:value:", CFSTR("Type"), v5);
  v21[1] = v6;
  v7 = objc_alloc((Class)HMFAttributeDescription);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler data](self, "data"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length")));
  v10 = objc_msgSend(v7, "initWithName:value:", CFSTR("Data Length"), v9);
  v21[2] = v10;
  v11 = objc_alloc((Class)HMFAttributeDescription);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler currentChunkSequenceNumber](self, "currentChunkSequenceNumber"));
  v13 = objc_msgSend(v11, "initWithName:value:", CFSTR("Current Chunk Sequence Number"), v12);
  v21[3] = v13;
  v14 = objc_alloc((Class)HMFAttributeDescription);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler assembledFragment](self, "assembledFragment"));
  v16 = objc_msgSend(v14, "initWithName:value:", CFSTR("Assembled Fragment"), v15);
  v21[4] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 5));

  return v17;
}

- (BOOL)addFragmentChunk:(id)a3 error:(id *)a4
{
  id v6;
  DataStreamFragmentAssembler *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  DataStreamFragmentAssembler *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  void *v23;
  char *v24;
  void *v25;
  void *v26;
  void *v27;
  DataStreamFragment *v28;
  void *v29;
  void *v30;
  void *v31;
  DataStreamFragment *v32;
  BOOL v33;
  DataStreamFragmentAssembler *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  DataStreamFragmentAssembler *v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  __CFString *v45;
  void *v46;
  int v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;

  v6 = a3;
  v7 = self;
  v9 = sub_10007CCE4((uint64_t)v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = sub_10007CD2C(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v48 = 138543618;
    v49 = v12;
    v50 = 2112;
    v51 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@Adding chunk: %@", (uint8_t *)&v48, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler assembledFragment](v7, "assembledFragment"));

  if (v13)
  {
    v14 = v7;
    v16 = sub_10007CCE4((uint64_t)v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = sub_10007CD2C(v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v48 = 138543618;
      v49 = v19;
      v50 = 2112;
      v51 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@Asked to add fragment chunk %@ but the last data chunk has already been received", (uint8_t *)&v48, 0x16u);

    }
    if (a4)
    {
      v20 = 1;
LABEL_18:
      v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DataStreamFragmentAssemblerErrorDomain"), v20, 0));
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler currentChunkSequenceNumber](v7, "currentChunkSequenceNumber"));
  v22 = (char *)objc_msgSend(v21, "unsignedLongLongValue");

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sequenceNumber"));
  v24 = (char *)objc_msgSend(v23, "unsignedLongLongValue");

  if (v24 != v22 + 1)
  {
    v34 = v7;
    v36 = sub_10007CCE4((uint64_t)v34, v35);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = sub_10007CD2C(v34);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler currentChunkSequenceNumber](v34, "currentChunkSequenceNumber"));
      v48 = 138543874;
      v49 = v39;
      v50 = 2112;
      v51 = v6;
      v52 = 2112;
      v53 = v40;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}@Asked to add fragment chunk %@ with non-sequential sequence number compared to current stream data chunk sequence number %@", (uint8_t *)&v48, 0x20u);

    }
    if (a4)
    {
      v20 = 2;
      goto LABEL_18;
    }
LABEL_23:
    v33 = 0;
    goto LABEL_24;
  }
  if (v24 == (char *)-1 && (objc_msgSend(v6, "isLast") & 1) == 0)
  {
    v41 = v7;
    v43 = sub_10007CCE4((uint64_t)v41, v42);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = sub_10007CD2C(v41);
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      v48 = 138543618;
      v49 = v46;
      v50 = 2112;
      v51 = v6;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%{public}@Asked to add non-last fragment chunk with maximum allowed sequence number: %@", (uint8_t *)&v48, 0x16u);

    }
    if (a4)
    {
      v20 = 3;
      goto LABEL_18;
    }
    goto LABEL_23;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sequenceNumber"));
  -[DataStreamFragmentAssembler setCurrentChunkSequenceNumber:](v7, "setCurrentChunkSequenceNumber:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler data](v7, "data"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data"));
  objc_msgSend(v26, "appendData:", v27);

  if (objc_msgSend(v6, "isLast"))
  {
    v28 = [DataStreamFragment alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler data](v7, "data"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler sequenceNumber](v7, "sequenceNumber"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentAssembler type](v7, "type"));
    v32 = -[DataStreamFragment initWithData:sequenceNumber:type:](v28, "initWithData:sequenceNumber:type:", v29, v30, v31);
    -[DataStreamFragmentAssembler setAssembledFragment:](v7, "setAssembledFragment:", v32);

  }
  v33 = 1;
LABEL_24:

  return v33;
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (DataStreamFragment)assembledFragment
{
  return (DataStreamFragment *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAssembledFragment:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)currentChunkSequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentChunkSequenceNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentChunkSequenceNumber, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_assembledFragment, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
}

@end
