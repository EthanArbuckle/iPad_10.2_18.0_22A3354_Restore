@implementation TRIClientFactorPackStreamingWriter

- (TRIClientFactorPackStreamingWriter)initWithPath:(id)a3
{
  id v4;
  TRIClientFactorPackStreamingWriter *v5;
  uint64_t v6;
  NSOutputStream *underlying;
  uint64_t v8;
  TRIPBCodedOutputStream *stream;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIClientFactorPackStreamingWriter;
  v5 = -[TRIClientFactorPackStreamingWriter init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToFileAtPath:append:", v4, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    underlying = v5->_underlying;
    v5->_underlying = (NSOutputStream *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F28]), "initWithOutputStream:", v5->_underlying);
    stream = v5->_stream;
    v5->_stream = (TRIPBCodedOutputStream *)v8;

  }
  return v5;
}

- (unsigned)_fieldNumberForFieldName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  unsigned int v15;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(MEMORY[0x1E0DC0E90], "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "fields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v3, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = objc_msgSend(v11, "number");

    if (v15 == -1)
      goto LABEL_10;
  }
  else
  {
LABEL_9:

LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientFactorPackStreaming.m"), 209, CFSTR("Failed to determine field number for \"%@\"), v3);

    v15 = -1;
  }

  objc_autoreleasePoolPop(v4);
  return v15;
}

- (BOOL)_streamExecWithError:(id *)a3 block:(id)a4
{
  void (**v7)(id, TRIPBCodedOutputStream *);
  NSError *firstError;
  void *v10;

  v7 = (void (**)(id, TRIPBCodedOutputStream *))a4;
  if (!self->_stream)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientFactorPackStreaming.m"), 216, CFSTR("writing a field to a closed stream"));

  }
  firstError = self->_firstError;
  if (firstError)
  {
    if (a3)
    {
      objc_storeStrong(a3, firstError);
      LOBYTE(a3) = 0;
    }
  }
  else
  {
    v7[2](v7, self->_stream);
    LOBYTE(a3) = 1;
  }

  return (char)a3;
}

- (void)writeFactorPackId:(id)a3
{
  id v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unsigned int v12;

  v5 = a3;
  if (self->_hasFactorPackId)
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientFactorPackStreaming.m"), 243, CFSTR("writeFactorPackId: must be called no more than once"));

    v5 = v9;
  }
  self->_hasFactorPackId = 1;
  if (!self->_firstError)
  {
    v8 = v5;
    v6 = -[TRIClientFactorPackStreamingWriter _fieldNumberForFieldName:](self, "_fieldNumberForFieldName:", CFSTR("factorPackId"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__TRIClientFactorPackStreamingWriter_writeFactorPackId___block_invoke;
    v10[3] = &unk_1E3BFEB40;
    v12 = v6;
    v11 = v8;
    -[TRIClientFactorPackStreamingWriter _streamExecWithError:block:](self, "_streamExecWithError:block:", 0, v10);

    v5 = v8;
  }

}

uint64_t __56__TRIClientFactorPackStreamingWriter_writeFactorPackId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeString:value:", *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)writeSelectedNamespace:(id)a3
{
  id v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unsigned int v12;

  v5 = a3;
  if (self->_hasSelectedNamespace)
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientFactorPackStreaming.m"), 255, CFSTR("writeSelectedNamespace: must be called no more than once"));

    v5 = v9;
  }
  self->_hasSelectedNamespace = 1;
  if (!self->_firstError)
  {
    v8 = v5;
    v6 = -[TRIClientFactorPackStreamingWriter _fieldNumberForFieldName:](self, "_fieldNumberForFieldName:", CFSTR("selectedNamespace"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__TRIClientFactorPackStreamingWriter_writeSelectedNamespace___block_invoke;
    v10[3] = &unk_1E3BFEB40;
    v12 = v6;
    v11 = v8;
    -[TRIClientFactorPackStreamingWriter _streamExecWithError:block:](self, "_streamExecWithError:block:", 0, v10);

    v5 = v8;
  }

}

uint64_t __61__TRIClientFactorPackStreamingWriter_writeSelectedNamespace___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeMessage:value:", *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)appendFactorLevel:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  int v9;
  _QWORD block[5];

  v4 = a3;
  if (!self->_firstError)
  {
    v5 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__TRIClientFactorPackStreamingWriter_appendFactorLevel___block_invoke;
    block[3] = &unk_1E3BFE828;
    block[4] = self;
    v6 = v4;
    if (qword_1ECED7D90 != -1)
      dispatch_once(&qword_1ECED7D90, block);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __56__TRIClientFactorPackStreamingWriter_appendFactorLevel___block_invoke_2;
    v7[3] = &unk_1E3BFEB40;
    v9 = _MergedGlobals_6;
    v8 = v6;
    -[TRIClientFactorPackStreamingWriter _streamExecWithError:block:](self, "_streamExecWithError:block:", 0, v7);

    v4 = v6;
  }

}

void __56__TRIClientFactorPackStreamingWriter_appendFactorLevel___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A1AC6B8C]();
  _MergedGlobals_6 = objc_msgSend(*(id *)(a1 + 32), "_fieldNumberForFieldName:", CFSTR("factorLevelArray"));
  objc_autoreleasePoolPop(v2);
}

uint64_t __56__TRIClientFactorPackStreamingWriter_appendFactorLevel___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeMessage:value:", *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)closeWithError:(id *)a3
{
  TRIPBCodedOutputStream *stream;

  -[TRIPBCodedOutputStream flush](self->_stream, "flush");
  stream = self->_stream;
  self->_stream = 0;

  if (a3)
    objc_storeStrong(a3, self->_firstError);
  return self->_firstError == 0;
}

+ (BOOL)copySourceFactorPack:(id)a3 toDestPath:(id)a4 error:(id *)a5 modifyFactorLevel:(id)a6
{
  id v9;
  id v10;
  id v11;
  TRIClientFactorPackStreamingWriter *v12;
  void *v13;
  void *v14;
  id v15;
  TRIClientFactorPackStreamingWriter *v16;
  BOOL v17;
  void *v18;
  id v19;
  BOOL v20;
  _QWORD v22[4];
  TRIClientFactorPackStreamingWriter *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = -[TRIClientFactorPackStreamingWriter initWithPath:]([TRIClientFactorPackStreamingWriter alloc], "initWithPath:", v10);
  if (objc_msgSend(v9, "hasFactorPackId"))
  {
    objc_msgSend(v9, "factorPackId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIClientFactorPackStreamingWriter writeFactorPackId:](v12, "writeFactorPackId:", v13);

  }
  if (objc_msgSend(v9, "hasSelectedNamespace"))
  {
    objc_msgSend(v9, "selectedNamespace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIClientFactorPackStreamingWriter writeSelectedNamespace:](v12, "writeSelectedNamespace:", v14);

  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __94__TRIClientFactorPackStreamingWriter_copySourceFactorPack_toDestPath_error_modifyFactorLevel___block_invoke;
  v22[3] = &unk_1E3BFEB68;
  v15 = v11;
  v24 = v15;
  v25 = &v26;
  v16 = v12;
  v23 = v16;
  objc_msgSend(v9, "enumerateFactorLevelsWithBlock:", v22);
  v17 = -[TRIClientFactorPackStreamingWriter closeWithError:](v16, "closeWithError:", a5);
  if (*((_BYTE *)v27 + 24))
  {
    if (a5)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, 0);
      v19 = *a5;
      *a5 = v18;

    }
    v20 = 0;
  }
  else
  {
    v20 = v17;
  }

  _Block_object_dispose(&v26, 8);
  return v20;
}

void __94__TRIClientFactorPackStreamingWriter_copySourceFactorPack_toDestPath_error_modifyFactorLevel___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "appendFactorLevel:", v5);
    v5 = v6;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
