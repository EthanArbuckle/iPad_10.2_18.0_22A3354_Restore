@implementation TransceiverWrapper

- (TransceiverWrapper)initWithTransceiver:(id)a3
{
  id v5;
  TransceiverWrapper *v6;
  TransceiverWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransceiverWrapper;
  v6 = -[TransceiverWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transceiver, a3);
    v7->_circbuff = (_CircularBuffer *)CircularBufferInit(v7->_circBuffStorage, 0x1000uLL);
    v7->_isMultiOS = objc_opt_respondsToSelector() & 1;
  }

  return v7;
}

+ (id)withTransceiver:(id)a3
{
  id v3;
  TransceiverWrapper *v4;

  v3 = a3;
  v4 = -[TransceiverWrapper initWithTransceiver:]([TransceiverWrapper alloc], "initWithTransceiver:", v3);

  return v4;
}

- (id)transceive:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  SETransceiver *transceiver;
  void *v9;
  void *v10;
  id v11;
  char v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 62;
  v14 = &v13;
  v15 = 1;
  v6 = objc_retainAutorelease(a3);
  v16 = objc_msgSend(v6, "bytes");
  if ((unint64_t)objc_msgSend(v6, "length") <= 0x300)
    v7 = objc_msgSend(v6, "length");
  else
    v7 = 768;
  v17 = v7;
  CircularBufferAddScattered((const void **)&self->_circbuff->var0, (uint64_t)&v14, 2);
  transceiver = self->_transceiver;
  if (self->_isMultiOS)
    -[SETransceiver transceive:toOS:error:](transceiver, "transceive:toOS:error:", v6, 0, a4);
  else
    -[SETransceiver transceive:error:](transceiver, "transceive:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v13 = 60;
    v14 = &v13;
    v15 = 1;
    v11 = objc_retainAutorelease(v9);
    v16 = objc_msgSend(v11, "bytes");
    v17 = objc_msgSend(v11, "length");
    CircularBufferAddScattered((const void **)&self->_circbuff->var0, (uint64_t)&v14, 2);
  }

  return v10;
}

- (void)dumpAPDUs:(id)a3
{
  id v4;
  _CircularBuffer *circbuff;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  circbuff = self->_circbuff;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__TransceiverWrapper_dumpAPDUs___block_invoke;
  v7[3] = &unk_1E7D8AAF0;
  v8 = v4;
  v6 = v4;
  CircularBufferDump((const void **)&circbuff->var0, (uint64_t)v7);

}

uint64_t __32__TransceiverWrapper_dumpAPDUs___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransceiverWrapper transceiveAndCheckSW:inArray:keepingSW:error:](self, "transceiveAndCheckSW:inArray:keepingSW:error:", v7, &unk_1E7D9CEE8, 0, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 inArray:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v10 = (void *)MEMORY[0x1E0C99D50];
  v11 = a5;
  objc_msgSend(v10, "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransceiverWrapper transceiveAndCheckSW:inArray:keepingSW:error:](self, "transceiveAndCheckSW:inArray:keepingSW:error:", v12, v11, 0, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 keepingSW:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  void *v9;
  void *v10;

  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransceiverWrapper transceiveAndCheckSW:inArray:keepingSW:error:](self, "transceiveAndCheckSW:inArray:keepingSW:error:", v9, &unk_1E7D9CF00, v7, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 inArray:(id)a5 keepingSW:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a6;
  v12 = (void *)MEMORY[0x1E0C99D50];
  v13 = a5;
  objc_msgSend(v12, "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransceiverWrapper transceiveAndCheckSW:inArray:keepingSW:error:](self, "transceiveAndCheckSW:inArray:keepingSW:error:", v14, v13, v8, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)transceiveAndCheckSW:(id)a3 error:(id *)a4
{
  return -[TransceiverWrapper transceiveAndCheckSW:inArray:keepingSW:error:](self, "transceiveAndCheckSW:inArray:keepingSW:error:", a3, &unk_1E7D9CF18, 0, a4);
}

- (id)transceiveAndCheckSW:(id)a3 inArray:(id)a4 error:(id *)a5
{
  return -[TransceiverWrapper transceiveAndCheckSW:inArray:keepingSW:error:](self, "transceiveAndCheckSW:inArray:keepingSW:error:", a3, a4, 0, a5);
}

- (id)transceiveAndCheckSW:(id)a3 keepingSW:(BOOL)a4 error:(id *)a5
{
  return -[TransceiverWrapper transceiveAndCheckSW:inArray:keepingSW:error:](self, "transceiveAndCheckSW:inArray:keepingSW:error:", a3, &unk_1E7D9CF30, a4, a5);
}

- (id)transceiveAndCheckSW:(id)a3 inArray:(id)a4 keepingSW:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _QWORD v40[2];
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint64_t v48;
  _QWORD v49[2];

  v7 = a5;
  v49[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  -[TransceiverWrapper transceive:error:](self, "transceive:error:", a3, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    ATLLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v16, OS_LOG_TYPE_ERROR, "nil response", buf, 2u);
    }

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("nil response"));
    v18 = (void *)v17;
    if (!a6)
      goto LABEL_22;
    v19 = *a6;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    if (*a6)
    {
      v21 = *MEMORY[0x1E0CB3388];
      v46[0] = *MEMORY[0x1E0CB2D50];
      v46[1] = v21;
      v47[0] = v17;
      v47[1] = v19;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = v47;
      v24 = v46;
      v25 = 2;
    }
    else
    {
      v48 = *MEMORY[0x1E0CB2D50];
      v49[0] = v17;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = v49;
      v24 = &v48;
      v25 = 1;
    }
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v20;
    v38 = 4;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", GetSW(v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "containsObject:", v13);

  if ((v14 & 1) == 0)
  {
    ATLLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v12;
      _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_ERROR, "Unexpected SW %@", buf, 0xCu);
    }

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected SW %@"), v12);
    v18 = (void *)v27;
    if (!a6)
      goto LABEL_22;
    v28 = *a6;
    v29 = (void *)MEMORY[0x1E0CB35C8];
    if (*a6)
    {
      v30 = *MEMORY[0x1E0CB3388];
      v40[0] = *MEMORY[0x1E0CB2D50];
      v40[1] = v30;
      v41[0] = v27;
      v41[1] = v28;
      v31 = (void *)MEMORY[0x1E0C99D80];
      v32 = v41;
      v33 = v40;
      v34 = 2;
    }
    else
    {
      v42 = *MEMORY[0x1E0CB2D50];
      v43 = v27;
      v31 = (void *)MEMORY[0x1E0C99D80];
      v32 = &v43;
      v33 = &v42;
      v34 = 1;
    }
    objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v29;
    v38 = 5;
LABEL_21:
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v38, v36);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
    v35 = 0;
    goto LABEL_23;
  }
  if (v7)
  {
    v15 = v12;
  }
  else
  {
    objc_msgSend(v12, "subdataWithRange:", 0, objc_msgSend(v12, "length") - 2);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v35 = v15;
LABEL_23:

  return v35;
}

- (id)transceiveAndGetAllData:(id)a3 withMoreDataSW:(unsigned __int16)a4 withError:(id *)a5
{
  return -[TransceiverWrapper transceiveAndGetAllData:withGetMoreData:withMoreDataSW:withError:](self, "transceiveAndGetAllData:withGetMoreData:withMoreDataSW:withError:", a3, a3, a4, a5);
}

- (id)transceiveAndGetAllData:(id)a3 withGetMoreData:(id)a4 withMoreDataSW:(unsigned __int16)a5 withError:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[3];

  v7 = a5;
  v23[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v23[0] = &unk_1E7D9AEF0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[TransceiverWrapper transceiveAndCheckSW:inArray:keepingSW:error:](self, "transceiveAndCheckSW:inArray:keepingSW:error:", v10, v13, 1, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
    v16 = (void *)MEMORY[0x1E0C99DF0];
    objc_msgSend(v14, "subdataWithRange:", 0, objc_msgSend(v14, "length") - 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataWithData:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (GetSW(v15) == (_DWORD)v7)
    {
      while (1)
      {
        -[TransceiverWrapper transceiveAndCheckSW:inArray:keepingSW:error:](self, "transceiveAndCheckSW:inArray:keepingSW:error:", v11, v13, 1, a6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          break;
        objc_msgSend(v19, "subdataWithRange:", 0, objc_msgSend(v19, "length") - 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendData:", v20);

        v15 = v19;
        if (GetSW(v19) != (_DWORD)v7)
          goto LABEL_8;
      }
      v21 = 0;
    }
    else
    {
      v19 = v15;
LABEL_8:
      v21 = v18;

    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)applyScript:(id)a3 error:(id *)a4
{
  return -[TransceiverWrapper applyScript:ignoreSW:error:](self, "applyScript:ignoreSW:error:", a3, 0, a4);
}

- (BOOL)applyScript:(id)a3 ignoreSW:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v14 = -[TransceiverWrapper transceive:error:](self, "transceive:error:", v13, 0);

        }
        else
        {
          -[TransceiverWrapper transceiveAndCheckSW:error:](self, "transceiveAndCheckSW:error:", v13, a5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            v16 = 0;
            goto LABEL_13;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_13:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transceiver, 0);
}

@end
