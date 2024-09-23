@implementation RCPEventStream

- (void)setEvents:(id)a3
{
  NSMutableArray *rawEvents;
  id v5;

  rawEvents = self->_rawEvents;
  v5 = a3;
  -[NSMutableArray removeAllObjects](rawEvents, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_rawEvents, "addObjectsFromArray:", v5);

}

- (RCPEventStream)init
{
  RCPEventStream *v2;
  uint64_t v3;
  NSMutableArray *rawEvents;
  uint64_t v5;
  RCPEventEnvironment *environment;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCPEventStream;
  v2 = -[RCPEventStream init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    rawEvents = v2->_rawEvents;
    v2->_rawEvents = (NSMutableArray *)v3;

    +[RCPEventEnvironment currentEnvironment](RCPEventEnvironment, "currentEnvironment");
    v5 = objc_claimAutoreleasedReturnValue();
    environment = v2->_environment;
    v2->_environment = (RCPEventEnvironment *)v5;

  }
  return v2;
}

- (RCPEventEnvironment)environment
{
  return self->_environment;
}

- (NSArray)events
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_rawEvents);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawEvents, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  v4 = (void *)objc_opt_class();
  -[RCPEventStream dataRepresentation](self, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "eventStreamWithData:error:", v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  if (!v6)
    NSLog(CFSTR("error: %@"), v7);

  return v6;
}

- (id)dataRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v3, "appendBytes:length:", objc_msgSend(CFSTR("RECAP0"), "UTF8String"), 6);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 0);
  v10[0] = CFSTR("env");
  -[RCPEventStream environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("events");
  v11[0] = v5;
  -[RCPEventStream rawEvents](self, "rawEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB2CD0]);

  objc_msgSend(v4, "finishEncoding");
  objc_msgSend(v4, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v8);

  return v3;
}

- (void)writeToURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RCPEventStream dataRepresentation](self, "dataRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeToURL:options:error:", v4, 1, 0);

}

- (id)trimmedFrom:(unint64_t)a3 to:(unint64_t)a4
{
  RCPEventStream *v5;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;

  if (a4 < a3)
  {
    v5 = (RCPEventStream *)-[RCPEventStream copy](self, "copy");
    return v5;
  }
  v8 = -[NSMutableArray count](self->_rawEvents, "count") - 1;
  v9 = 0;
  if (!-[NSMutableArray count](self->_rawEvents, "count"))
    goto LABEL_12;
  v10 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_rawEvents, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "timestamp");

    if (v12 >= a3)
      break;
    v9 = ++v10;
LABEL_9:
    if (v10 >= -[NSMutableArray count](self->_rawEvents, "count"))
      goto LABEL_12;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_rawEvents, "objectAtIndexedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "timestamp");

  if (v14 <= a4)
  {
    ++v10;
    goto LABEL_9;
  }
  v8 = v10;
LABEL_12:
  v5 = objc_alloc_init(RCPEventStream);
  if (v8 > v9)
  {
    -[NSMutableArray subarrayWithRange:](self->_rawEvents, "subarrayWithRange:", v9, v8 - v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCPEventStream setEvents:](v5, "setEvents:", v15);

  }
  -[RCPEventStream environment](self, "environment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPEventStream setEnvironment:](v5, "setEnvironment:", v16);

  return v5;
}

- (id)streamByAddingEventsFromStream:(id)a3 withDistance:(double)a4
{
  id v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  double v28;

  v6 = a3;
  v7 = (id *)objc_opt_new();
  -[RCPEventStream environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnvironment:", v8);
  -[RCPEventStream events](self, "events");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEvents:", v9);

  -[RCPEventStream environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray lastObject](self->_rawEvents, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalForMachAbsoluteTime:", objc_msgSend(v11, "deliveryTimestamp"));
  v13 = v12;
  objc_msgSend(v6, "environment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "events");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalForMachAbsoluteTime:", objc_msgSend(v16, "deliveryTimestamp"));
  v18 = v13 - v17 + a4;

  v19 = v7[2];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __62__RCPEventStream_streamByAddingEventsFromStream_withDistance___block_invoke;
  v25[3] = &unk_1E4FC24A0;
  v28 = v18;
  v26 = v8;
  v27 = v19;
  v20 = v19;
  v21 = v8;
  objc_msgSend(v6, "enumerateEventsUsingBlock:", v25);

  v22 = v27;
  v23 = v7;

  return v23;
}

void __62__RCPEventStream_streamByAddingEventsFromStream_withDistance___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "timeIntervalForMachAbsoluteTime:", objc_msgSend(v4, "deliveryTimestamp"));
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "eventAdjustedForDeliveryTimeInterval:eventEnvironment:", *(_QWORD *)(a1 + 32), v5 + *(double *)(a1 + 48));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
}

- (id)emptyCopy
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[RCPEventStream environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnvironment:", v4);

  return v3;
}

- (void)_addEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_rawEvents, "addObject:", a3);
}

+ (RCPEventStream)eventStreamWithData:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  unsigned int (**v16)(_QWORD, _QWORD);
  void *v17;
  id *v18;
  id *v19;
  id *v20;
  void *v21;
  uint64_t v22;
  FILE *v23;
  id v24;
  FILE *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  unsigned int (**v36)(_QWORD, _QWORD);
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id *v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(CFSTR("RECAP0"), "length");
  if (objc_msgSend(v5, "length") >= v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = objc_retainAutorelease(v5);
    v9 = (void *)objc_msgSend(v7, "initWithBytes:length:encoding:", objc_msgSend(v8, "bytes"), v6, 4);
    v10 = objc_msgSend(v9, "isEqual:", CFSTR("RECAP0"));

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v8, "subdataWithRange:", v6, objc_msgSend(v8, "length") - v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v11, &v44);
      v13 = v44;
      v14 = v13;
      if (!v12)
      {
        v23 = (FILE *)*MEMORY[0x1E0C80C10];
        objc_msgSend(v13, "description");
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        fprintf(v23, "error: decoder returned nil with error:%s.\n\n", (const char *)objc_msgSend(v24, "UTF8String"));

        if (a4)
        {
          v14 = objc_retainAutorelease(v14);
          v20 = 0;
          *a4 = v14;
        }
        else
        {
          v20 = 0;
        }
        goto LABEL_31;
      }
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __44__RCPEventStream_eventStreamWithData_error___block_invoke;
      v41[3] = &unk_1E4FC24C8;
      v15 = v13;
      v42 = v15;
      v43 = a4;
      v16 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1A85B7660](v41);
      objc_msgSend(v12, "setRequiresSecureCoding:", 0);
      objc_msgSend(v12, "decodeObjectForKey:", *MEMORY[0x1E0CB2CD0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(v12, "error");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        v25 = (FILE *)*MEMORY[0x1E0C80C10];
        objc_msgSend(v14, "description");
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        fprintf(v25, "error: this file contains no root object:%s\n\n", (const char *)objc_msgSend(v26, "UTF8String"));

        if (a4)
        {
          v14 = objc_retainAutorelease(v14);
          v20 = 0;
          *a4 = v14;
        }
        else
        {
          v20 = 0;
        }
        goto LABEL_30;
      }
      v18 = (id *)objc_opt_new();
      objc_opt_class();
      v19 = v18 + 2;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        fputs("warning: this event stream appears to be from ≈2015 C.E. and may not work on current OS versions. Proceed with caution.\n\n", (FILE *)*MEMORY[0x1E0C80C10]);
        objc_storeStrong(v18 + 2, v17);
        v14 = v15;
      }
      else
      {
        objc_msgSend(v17, "objectForKey:", CFSTR("events"));
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *v19;
        *v19 = (id)v27;

        objc_msgSend(v12, "error");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (!((unsigned int (**)(_QWORD, const char *))v16)[2](v16, "decoding events"))
          goto LABEL_28;
        v36 = v16;
        if (!objc_msgSend(*v19, "count"))
          fputs("warning: this event stream contains no events\n\n", (FILE *)*MEMORY[0x1E0C80C10]);
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v29 = *v19;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v38 != v32)
                objc_enumerationMutation(v29);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "hidEvent");
              IOHIDEventSetAttributeData();
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v31);
        }

        objc_msgSend(v17, "objectForKey:", CFSTR("env"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setEnvironment:", v34);

        v16 = v36;
        if (!((unsigned int (**)(_QWORD, const char *))v36)[2](v36, "decoding environment"))
        {
LABEL_28:
          v20 = 0;
          goto LABEL_29;
        }
        objc_msgSend(v18, "environment");
        v20 = (id *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          fputs("error: this event stream contains no environment\n\n", (FILE *)*MEMORY[0x1E0C80C10]);
          goto LABEL_29;
        }
      }
      v20 = v18;
LABEL_29:

LABEL_30:
LABEL_31:

      goto LABEL_32;
    }
  }
  if (a4)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = kRPCEventStreamErrorDomainFile;
    v46 = *MEMORY[0x1E0CB2D68];
    v47[0] = CFSTR("Wrong file format.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 1, v11);
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

    goto LABEL_33;
  }
  v20 = 0;
LABEL_33:

  return (RCPEventStream *)v20;
}

BOOL __44__RCPEventStream_eventStreamWithData_error___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v2;
  FILE *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v5 = (FILE *)*MEMORY[0x1E0C80C10];
    objc_msgSend(*(id *)(a1 + 32), "description");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(v5, "error: %s:%s\n\n", a2, (const char *)objc_msgSend(v6, "UTF8String"));

    if (*(_QWORD *)(a1 + 40))
      **(_QWORD **)(a1 + 40) = objc_retainAutorelease(*(id *)(a1 + 32));
  }
  return v2 == 0;
}

+ (RCPEventStream)eventStreamWithFileURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "eventStreamWithData:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (RCPEventStream *)v7;
}

+ (RCPEventStream)eventStreamWithStudyLogFileURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  const void *v32;
  const __CFString *v33;
  unint64_t v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  RCPEventStream *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", v5);
  objc_msgSend(v6, "open");
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithStream:options:error:", v6, 4, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "close");
  if (v7)
  {
    v38 = v6;
    v39 = v5;
    v46 = objc_alloc_init(RCPEventStream);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v37 = v7;
    obj = v7;
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v42)
    {
      v41 = *(_QWORD *)v53;
      v8 = CFSTR("data");
      v9 = 0x1E0C99000uLL;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v53 != v41)
            objc_enumerationMutation(obj);
          v45 = v10;
          v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v10);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("start"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("date"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("start"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timestamp"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[RCPEventStream environment](v46, "environment");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v13, "doubleValue");
          objc_msgSend(v17, "dateWithTimeIntervalSince1970:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setStartDate:machAbsoluteTime:", v18, objc_msgSend(v15, "unsignedLongLongValue"));

          v19 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v13, "doubleValue");
          objc_msgSend(v19, "dateWithTimeIntervalSince1970:");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v15;
          v44 = v13;
          NSLog(CFSTR("startDate: %@, %@ - startMachTimestamp: %@"), v13, v20, v15);

          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("entries"));
          v47 = (id)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v49 != v23)
                  objc_enumerationMutation(v47);
                v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                objc_msgSend(v25, "objectForKeyedSubscript:", v8);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("description"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("FromHID"));

                  if (v28)
                  {
                    objc_msgSend(v25, "objectForKeyedSubscript:", v8);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("RawCollectionData"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v30)
                    {
                      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v30, 0);
                      if (v31)
                      {
                        v32 = (const void *)MEMORY[0x1A85B7138](0, v31);
                        v33 = v8;
                        v34 = v9;
                        +[RCPEvent eventWithHIDEvent:deliveryTimeStamp:](RCPEvent, "eventWithHIDEvent:deliveryTimeStamp:", v32, IOHIDEventGetTimeStamp());
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSMutableArray addObject:](v46->_rawEvents, "addObject:", v35);
                        CFRelease(v32);

                        v9 = v34;
                        v8 = v33;
                      }

                    }
                  }
                }

              }
              v22 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            }
            while (v22);
          }

          v10 = v45 + 1;
        }
        while (v45 + 1 != v42);
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v42);
    }

    v6 = v38;
    v5 = v39;
    v7 = v37;
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (id)statistics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  -[RCPEventStream rawEvents](self, "rawEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPEventStream environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPEventStream environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "speedFactorToAdjustRecordingEnvironment:", v6);
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld Events"), objc_msgSend(v4, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "deliveryTimestamp");
  objc_msgSend(v4, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%0.4fs total duration (%0.4fx original)"), RCPTimeIntervalFromMachTimestamp(v12 - objc_msgSend(v13, "deliveryTimestamp")) / v8, 1.0 / v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)timingStatistics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;

  v3 = (void *)objc_opt_new();
  -[RCPEventStream environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPEventStream environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speedFactorToAdjustRecordingEnvironment:", v5);
  v7 = v6;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1;
  v16[4] = __Block_byref_object_dispose__1;
  v17 = 0;
  -[RCPEventStream rawEvents](self, "rawEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__RCPEventStream_timingStatistics__block_invoke;
  v12[3] = &unk_1E4FC24F0;
  v14 = v16;
  v9 = v3;
  v13 = v9;
  v15 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v16, 8);
  return v10;
}

void __34__RCPEventStream_timingStatistics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  unint64_t TimeStamp;
  double v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v5 + 40))
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = RCPTimeIntervalFromMachTimestamp(objc_msgSend(v3, "deliveryTimestamp"));
    v9 = (v8
        - RCPTimeIntervalFromMachTimestamp(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "deliveryTimestamp")))
       * *(double *)(a1 + 48);
    objc_msgSend(v4, "hidEvent");
    TimeStamp = IOHIDEventGetTimeStamp();
    v11 = RCPTimeIntervalFromMachTimestamp(TimeStamp);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "hidEvent");
    v12 = IOHIDEventGetTimeStamp();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%0.9fs, (%0.9fs)"), *(_QWORD *)&v9, v11 - RCPTimeIntervalFromMachTimestamp(v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v13);

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)enumerateEventsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[RCPEventStream rawEvents](self, "rawEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__RCPEventStream_enumerateEventsUsingBlock___block_invoke;
  v7[3] = &unk_1E4FC2518;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __44__RCPEventStream_enumerateEventsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)filterEventsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__RCPEventStream_filterEventsUsingBlock___block_invoke;
  v8[3] = &unk_1E4FC2540;
  v9 = v5;
  v10 = v4;
  v6 = v5;
  v7 = v4;
  -[RCPEventStream enumerateEventsUsingBlock:](self, "enumerateEventsUsingBlock:", v8);
  -[RCPEventStream setEvents:](self, "setEvents:", v6);

}

void __41__RCPEventStream_filterEventsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)transformDigitizerEventLocationsWithTransform:(CGAffineTransform *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[RCPEventStream events](self, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "hidEvent");
        v10 = *(_OWORD *)&a3->c;
        v11[0] = *(_OWORD *)&a3->a;
        v11[1] = v10;
        v11[2] = *(_OWORD *)&a3->tx;
        RCPHIDEventTransformLocation(v9, v11);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (NSMutableArray)rawEvents
{
  return self->_rawEvents;
}

@end
