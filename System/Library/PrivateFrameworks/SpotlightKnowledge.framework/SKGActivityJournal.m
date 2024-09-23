@implementation SKGActivityJournal

+ (id)sharedJournal
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SKGActivityJournal_sharedJournal__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedJournal_onceToken != -1)
    dispatch_once(&sharedJournal_onceToken, block);
  return (id)sharedJournal__sharedJournal;
}

void __35__SKGActivityJournal_sharedJournal__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  activityJournalPath();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithParentPath:fileName:limit:", v4, CFSTR("SKGActivityJournal.log"), 0x100000);
  v3 = (void *)sharedJournal__sharedJournal;
  sharedJournal__sharedJournal = v2;

}

- (SKGActivityJournal)initWithParentPath:(id)a3 fileName:(id)a4 limit:(int64_t)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSString *v19;
  NSString *path;
  int64_t v21;
  unint64_t v22;
  NSObject *v23;
  double Current;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  id v30;
  _OWORD v31[2];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = isAppleInternalInstall();
  self->_isInternalInstall = v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:", v8);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v14 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v30);
      v15 = v30;

      if ((v14 & 1) == 0)
      {
        SKGLogInit();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[SKGActivityJournal initWithParentPath:fileName:limit:].cold.3((uint64_t)v15, (uint64_t)v8, v16);

      }
    }
    v17 = objc_retainAutorelease(v8);
    open((const char *)objc_msgSend(v17, "fileSystemRepresentation"), 0x100000);
    v18 = objc_retainAutorelease(v9);
    objc_msgSend(v18, "UTF8String");
    self->_fd = (fd_obj *)fd_create_protected();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v17, v18);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    path = self->_path;
    self->_path = v19;

    if (self->_fd)
    {
      self->_lock._os_unfair_lock_opaque = 0;
      if (a5)
      {
        v21 = fd_lseek();
        if (v21 > a5)
        {
          v22 = v21;
          SKGLogInit();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[SKGActivityJournal initWithParentPath:fileName:limit:].cold.2(v22, a5, v23);

          fd_zero_truncate();
          memset(v31, 0, sizeof(v31));
          Current = CFAbsoluteTimeGetCurrent();
          v25 = (unint64_t)Current;
          if ((unint64_t)Current > 0x7F)
          {
            if (v25 >> 14)
            {
              if (v25 >> 21)
              {
                if (v25 >> 28)
                {
                  if (v25 >> 35)
                  {
                    if (v25 >> 42)
                    {
                      if (v25 >> 49)
                      {
                        if (HIBYTE(v25))
                        {
                          LOBYTE(v31[0]) = -1;
                          *(_QWORD *)((char *)v31 + 1) = (unint64_t)Current;
                          v26 = 9;
                        }
                        else
                        {
                          LOBYTE(v31[0]) = -2;
                          BYTE1(v31[0]) = (unint64_t)Current >> 48;
                          BYTE2(v31[0]) = (unsigned __int16)((unint64_t)Current >> 32) >> 8;
                          BYTE3(v31[0]) = (unint64_t)Current >> 32;
                          BYTE4(v31[0]) = (unint64_t)Current >> 24;
                          BYTE5(v31[0]) = (unint64_t)Current >> 16;
                          BYTE6(v31[0]) = (unsigned __int16)(unint64_t)Current >> 8;
                          v26 = 8;
                          BYTE7(v31[0]) = (unint64_t)Current;
                        }
                      }
                      else
                      {
                        LOBYTE(v31[0]) = BYTE6(v25) | 0xFC;
                        BYTE1(v31[0]) = (unsigned __int16)((unint64_t)Current >> 32) >> 8;
                        BYTE2(v31[0]) = (unint64_t)Current >> 32;
                        BYTE3(v31[0]) = (unint64_t)Current >> 24;
                        BYTE4(v31[0]) = (unint64_t)Current >> 16;
                        BYTE5(v31[0]) = (unsigned __int16)(unint64_t)Current >> 8;
                        v26 = 7;
                        BYTE6(v31[0]) = (unint64_t)Current;
                      }
                    }
                    else
                    {
                      LOBYTE(v31[0]) = BYTE5(v25) | 0xF8;
                      BYTE1(v31[0]) = (unint64_t)Current >> 32;
                      BYTE2(v31[0]) = (unint64_t)Current >> 24;
                      BYTE3(v31[0]) = (unint64_t)Current >> 16;
                      BYTE4(v31[0]) = (unsigned __int16)(unint64_t)Current >> 8;
                      BYTE5(v31[0]) = (unint64_t)Current;
                      v26 = 6;
                    }
                  }
                  else
                  {
                    LOBYTE(v31[0]) = BYTE4(v25) | 0xF0;
                    BYTE1(v31[0]) = (unint64_t)Current >> 24;
                    BYTE2(v31[0]) = (unint64_t)Current >> 16;
                    BYTE3(v31[0]) = (unsigned __int16)(unint64_t)Current >> 8;
                    BYTE4(v31[0]) = (unint64_t)Current;
                    v26 = 5;
                  }
                }
                else
                {
                  LOBYTE(v31[0]) = BYTE3(v25) | 0xE0;
                  BYTE1(v31[0]) = (unint64_t)Current >> 16;
                  BYTE2(v31[0]) = (unsigned __int16)(unint64_t)Current >> 8;
                  BYTE3(v31[0]) = (unint64_t)Current;
                  v26 = 4;
                }
              }
              else
              {
                LOBYTE(v31[0]) = BYTE2(v25) | 0xC0;
                BYTE1(v31[0]) = (unsigned __int16)(unint64_t)Current >> 8;
                BYTE2(v31[0]) = (unint64_t)Current;
                v26 = 3;
              }
            }
            else
            {
              LOBYTE(v31[0]) = BYTE1(v25) | 0x80;
              BYTE1(v31[0]) = (unint64_t)Current;
              v26 = 2;
            }
          }
          else
          {
            LOBYTE(v31[0]) = (unint64_t)Current;
            v26 = 1;
          }
          v28 = v2_writeVInt64((uint64_t)v31, v26, v22);
          *((_BYTE *)v31 + v28) = 0;
          -[SKGActivityJournal writeEvent:data:dataSize:](self, "writeEvent:data:dataSize:", 2, v31, (v28 + 1));
        }
      }
    }
    else
    {
      SKGLogInit();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[SKGActivityJournal initWithParentPath:fileName:limit:].cold.1(v17, (uint64_t)v18, v27);

    }
  }

  return self;
}

- (void)dealloc
{
  fd_obj *fd;
  objc_super v4;

  fd = self->_fd;
  self->_fd = 0;
  if (fd)
    fd_release();
  v4.receiver = self;
  v4.super_class = (Class)SKGActivityJournal;
  -[SKGActivityJournal dealloc](&v4, sel_dealloc);
}

- (void)writeInit
{
  unsigned int v2;
  uint64_t v3;
  CFAbsoluteTime Current;
  uint64_t v5;
  char *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFString *Value;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[31];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (self->_fd)
  {
    memset(v25, 0, sizeof(v25));
    v24 = 0u;
    v23 = 0u;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v19 = 0u;
    v18 = 0u;
    v17 = 0u;
    v16 = 0u;
    v15 = 0u;
    v14 = 0u;
    v13 = 0u;
    v12 = 0u;
    v11 = 0u;
    self->_started = 1;
    v10 = 3;
    v2 = getpid();
    if (v2 > 0x7F)
    {
      if (v2 >> 14)
      {
        if (v2 >> 21)
        {
          if (v2 >> 28)
          {
            LOBYTE(v11) = -16;
            *(_DWORD *)((char *)&v11 + 1) = v2;
            v3 = 6;
          }
          else
          {
            LOBYTE(v11) = HIBYTE(v2) | 0xE0;
            BYTE1(v11) = BYTE2(v2);
            BYTE2(v11) = BYTE1(v2);
            BYTE3(v11) = v2;
            v3 = 5;
          }
        }
        else
        {
          LOBYTE(v11) = BYTE2(v2) | 0xC0;
          BYTE1(v11) = BYTE1(v2);
          BYTE2(v11) = v2;
          v3 = 4;
        }
      }
      else
      {
        LOBYTE(v11) = BYTE1(v2) | 0x80;
        BYTE1(v11) = v2;
        v3 = 3;
      }
    }
    else
    {
      LOBYTE(v11) = v2;
      v3 = 2;
    }
    Current = CFAbsoluteTimeGetCurrent();
    v5 = v2_writeVInt64((uint64_t)&v10, v3, (unint64_t)Current);
    v6 = &v10 + v5;
    *(&v10 + v5) = 0;
    v7 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
    if (v7)
    {
      v8 = v7;
      Value = (const __CFString *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x24BDBD1F0]);
      if (Value)
      {
        if (!CFStringGetCString(Value, v6, 256 - v5, 0x8000100u))
          *v6 = 0;
      }
      CFRelease(v8);
    }
    strlen(v6);
    fd_write();
  }
}

- (void)writeEvent:(unsigned int)a3 data:(void *)a4 dataSize:(unsigned int)a5
{
  os_unfair_lock_s *p_lock;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  _OWORD v13[16];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_fd)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (!self->_started)
      -[SKGActivityJournal writeInit](self, "writeInit");
    v10 = (2 * a3) | 1;
    memset(v13, 0, sizeof(v13));
    if (v10 > 0x7F)
    {
      v12 = 2 * a3;
      if (v10 >> 14)
      {
        if (v10 >> 21)
        {
          if (v10 >> 28)
          {
            LOBYTE(v13[0]) = -16;
            *(_DWORD *)((char *)v13 + 1) = (2 * a3) | 1;
            v11 = 5;
          }
          else
          {
            LOBYTE(v13[0]) = HIBYTE(v12) | 0xE0;
            BYTE1(v13[0]) = a3 >> 15;
            BYTE2(v13[0]) = (unsigned __int16)a3 >> 7;
            BYTE3(v13[0]) = (2 * a3) | 1;
            v11 = 4;
          }
        }
        else
        {
          LOBYTE(v13[0]) = BYTE2(v12) | 0xC0;
          BYTE1(v13[0]) = (unsigned __int16)a3 >> 7;
          BYTE2(v13[0]) = (2 * a3) | 1;
          v11 = 3;
        }
      }
      else
      {
        LOBYTE(v13[0]) = BYTE1(v12) | 0x80;
        BYTE1(v13[0]) = (2 * a3) | 1;
        v11 = 2;
      }
    }
    else
    {
      LOBYTE(v13[0]) = (2 * a3) | 1;
      v11 = 1;
    }
    if (v11 + (unint64_t)a5 <= 0xFF)
    {
      memcpy((void *)((unint64_t)v13 | v11), a4, a5);
      fd_write();
      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (void)addEventForItem:(int)a3 bundleID:(id)a4 identifier:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v13;
  const char *v14;
  id v15;
  const char *v16;
  size_t v17;
  const char *v18;
  size_t v19;
  const char *v20;
  id v21;
  id v22;
  unint64_t v23;
  unsigned int v24;
  _OWORD v25[8];
  uint64_t v26;

  v6 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (self->_isInternalInstall && v8 != 0 && v9 != 0)
  {
    v24 = 0;
    memset(v25, 0, sizeof(v25));
    v13 = objc_retainAutorelease(v8);
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    v15 = objc_retainAutorelease(v10);
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    v17 = strlen(v14);
    if (v17 <= 0xF)
      v18 = v14;
    else
      v18 = &v14[v17 - 15];
    writeStrToBuf(v18, (uint64_t)v25, &v24);
    v19 = strlen(v16);
    if (v19 <= 0xF)
      v20 = v16;
    else
      v20 = &v16[v19 - 15];
    writeStrToBuf(v20, (uint64_t)v25, &v24);
    v21 = objc_retainAutorelease(v15);
    objc_msgSend(v21, "UTF8String");
    strlen((const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
    v22 = objc_retainAutorelease(v13);
    objc_msgSend(v22, "UTF8String");
    strlen((const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
    v23 = si_compute_oid_for_identifier_bundle_id();
    -[SKGActivityJournal writeEvent:data:dataSize:](self, "writeEvent:data:dataSize:", v6, v25, v2_writeVInt64((uint64_t)v25, v24, v23));
  }

}

- (void)addEventForCSSearchableItems:(int)a3 items:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if (self->_isInternalInstall)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "bundleID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKGActivityJournal addEventForItem:bundleID:identifier:](self, "addEventForItem:bundleID:identifier:", v4, v13, v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
  }

}

- (NSString)path
{
  return self->_path;
}

+ (void)SKGActivityJournalPlayback:(const char *)a3 block:(id)a4
{
  void (**v5)(id, _OWORD *);
  int v6;
  int v7;
  int64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  size_t v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  const char *v19;
  FILE *v20;
  const char *v21;
  size_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;

  v5 = (void (**)(id, _OWORD *))a4;
  v24 = 0u;
  v25 = 0u;
  v6 = open(a3, 0);
  if (v6 == -1)
  {
    v20 = (FILE *)*MEMORY[0x24BDAC8D8];
    v21 = "### file open failed";
    v22 = 20;
LABEL_35:
    fwrite(v21, v22, 1uLL, v20);
    goto LABEL_38;
  }
  v7 = v6;
  v8 = lseek(v6, 0, 2);
  v9 = (char *)mmap(0, v8, 1, 1, v7, 0);
  close(v7);
  if (v9 == (char *)-1)
  {
    v20 = (FILE *)*MEMORY[0x24BDAC8D8];
    v21 = "### mmap failed";
    v22 = 15;
    goto LABEL_35;
  }
  if (v8 < 1)
    goto LABEL_37;
  v10 = 0;
  while (1)
  {
    v11 = v10 + 1;
    v12 = v9[v10];
    if (v9[v10] < 0)
    {
      if (v12 > 0xBF)
      {
        if (v12 > 0xDF)
        {
          if (v12 > 0xEF)
          {
            v12 = *(_DWORD *)&v9[v11];
            v11 = v10 + 5;
          }
          else
          {
            v12 = ((v12 & 0xF) << 24) | (v9[v11] << 16) | (v9[v10 + 2] << 8) | v9[v10 + 3];
            v11 = v10 + 4;
          }
        }
        else
        {
          v12 = ((v12 & 0x1F) << 16) | (v9[v11] << 8) | v9[v10 + 2];
          v11 = v10 + 3;
        }
      }
      else
      {
        v13 = v9[v11] | ((v12 & 0x3F) << 8);
        v11 = v10 + 2;
        v12 = v13;
      }
    }
    v23 = v11;
    v14 = v12 >> 1;
    LODWORD(v24) = v12 >> 1;
    if ((v12 >> 1) - 4 >= 0xB)
      break;
    *((_QWORD *)&v24 + 1) = &v9[v11];
    v15 = v11 + strlen(&v9[v11]) + 1;
    *(_QWORD *)&v25 = &v9[v15];
    v23 = v15 + strlen(&v9[v15]) + 1;
LABEL_15:
    *((_QWORD *)&v25 + 1) = v2_readVInt64((uint64_t)v9, &v23);
LABEL_16:
    v5[2](v5, &v24);
    v10 = v23;
    if (v23 >= v8)
      goto LABEL_37;
  }
  switch(v14)
  {
    case 3u:
      v19 = &v9[v11];
      *((_QWORD *)&v24 + 1) = &v9[v11];
LABEL_32:
      v23 = v11 + strlen(v19) + 1;
      goto LABEL_16;
    case 2u:
      *((double *)&v24 + 1) = (double)v2_readVInt64((uint64_t)v9, &v23);
      *(_QWORD *)&v25 = v2_readVInt64((uint64_t)v9, &v23);
      goto LABEL_15;
    case 1u:
      v16 = v11 + 1;
      v17 = v9[v11];
      if (v9[v11] < 0)
      {
        if (v17 > 0xBF)
        {
          if (v17 > 0xDF)
          {
            if (v17 > 0xEF)
            {
              v17 = *(_DWORD *)&v9[v16];
              v16 = v11 + 5;
            }
            else
            {
              v17 = ((v17 & 0xF) << 24) | (v9[v16] << 16) | (v9[v11 + 2] << 8) | v9[v11 + 3];
              v16 = v11 + 4;
            }
          }
          else
          {
            v17 = ((v17 & 0x1F) << 16) | (v9[v16] << 8) | v9[v11 + 2];
            v16 = v11 + 3;
          }
        }
        else
        {
          v18 = v9[v16] | ((v17 & 0x3F) << 8);
          v16 = v11 + 2;
          v17 = v18;
        }
      }
      v23 = v16;
      DWORD2(v24) = v17;
      *(double *)&v25 = (double)v2_readVInt64((uint64_t)v9, &v23);
      v11 = v23;
      v19 = &v9[v23];
      *((_QWORD *)&v25 + 1) = &v9[v23];
      goto LABEL_32;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "### unknown type %d at offset %ld\n", v14, v11);
LABEL_37:
  munmap(v9, v8);
LABEL_38:

}

+ (void)_SKGActivityDump:(id)a3 dst:(__sFILE *)a4
{
  const __CFAllocator *v6;
  const __CFString *v7;
  id v8;
  __CFCalendar *v9;
  const __CFTimeZone *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[6];

  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v7 = (const __CFString *)*MEMORY[0x24BDBD3B8];
  v8 = a3;
  v9 = CFCalendarCreateWithIdentifier(v6, v7);
  v10 = CFTimeZoneCopySystem();
  CFCalendarSetTimeZone(v9, v10);
  CFRelease(v10);
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "UTF8String");

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __43__SKGActivityJournal__SKGActivityDump_dst___block_invoke;
  v13[3] = &__block_descriptor_48_e60_v16__0r__skg_playback_info_I______Id_____dqq___________q___8l;
  v13[4] = a4;
  v13[5] = v9;
  objc_msgSend(a1, "SKGActivityJournalPlayback:block:", v12, v13);
}

const char *__43__SKGActivityJournal__SKGActivityDump_dst___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  const char *result;
  FILE *v6;
  FILE *v7;
  _OWORD v8[16];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, sizeof(v8));
  v4 = *(_DWORD *)a2;
  result = typeToStr(*(_DWORD *)a2);
  if ((v4 - 4) < 0xB)
    return (const char *)fprintf(*(FILE **)(a1 + 32), "%s for item - bundle: %s identifier: %s oid: 0x%llx\n");
  switch(v4)
  {
    case 3:
      return (const char *)fprintf(*(FILE **)(a1 + 32), "Test %s\n");
    case 2:
      v7 = *(FILE **)(a1 + 32);
      getDateString(*(__CFCalendar **)(a1 + 40), (char *)v8, *(CFAbsoluteTime *)(a2 + 8));
      return (const char *)fprintf(v7, "Journal was reset at time %s, size before reset: %llu, size after reset: %llu\n");
    case 1:
      v6 = *(FILE **)(a1 + 32);
      getDateString(*(__CFCalendar **)(a1 + 40), (char *)v8, *(CFAbsoluteTime *)(a2 + 16));
      return (const char *)fprintf(v6, "%s pid: %d time: %ssbuild: %s\n");
  }
  return result;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (fd_obj)fd
{
  return self->_fd;
}

- (void)setFd:(fd_obj *)a3
{
  self->_fd = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithParentPath:(void *)a1 fileName:(uint64_t)a2 limit:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = *__error();
  objc_msgSend(a1, "stringByAppendingString:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109378;
  v8[1] = v6;
  v9 = 2112;
  v10 = v7;
  _os_log_error_impl(&dword_247964000, a3, OS_LOG_TYPE_ERROR, "### SKGActivityJournal#initWithParentPath error opening errno %d creating %@", (uint8_t *)v8, 0x12u);

}

- (void)initWithParentPath:(uint64_t)a1 fileName:(uint64_t)a2 limit:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LODWORD(v3) = 134218240;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  WORD6(v3) = 2048;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_0(&dword_247964000, a2, a3, "kSKGActivityJournalReset: Journal size %lld is > %lld\n", (_QWORD)v3, *((_QWORD *)&v3 + 1));
}

- (void)initWithParentPath:(uint64_t)a1 fileName:(uint64_t)a2 limit:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_247964000, a2, a3, "### SKGActivityJournal#initWithParentPath Error %@ creating %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end
