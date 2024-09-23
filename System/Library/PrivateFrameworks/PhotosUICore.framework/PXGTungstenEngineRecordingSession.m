@implementation PXGTungstenEngineRecordingSession

- (PXGTungstenEngineRecordingSession)initWithEngine:(id)a3 directoryURL:(id)a4
{
  id v7;
  id v8;
  PXGTungstenRecordingJSONSerializer *v9;
  PXGTungstenEngineRecordingSession *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(PXGTungstenRecordingJSONSerializer);
  -[PXGTungstenRecordingJSONSerializer setPrettyPrint:](v9, "setPrettyPrint:", 1);
  v21.receiver = self;
  v21.super_class = (Class)PXGTungstenEngineRecordingSession;
  v10 = -[PXGTungstenRecordingSession initWithSerializer:directoryURL:](&v21, sel_initWithSerializer_directoryURL_, v9, v8);
  if (v10)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v7, "renderers", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "setRecordingSession:", v10);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v13);
    }

    objc_storeStrong((id *)&v10->_engine, a3);
  }

  return v10;
}

- (void)stop
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PXGTungstenEngineRecordingSession;
  -[PXGTungstenRecordingSession stop](&v12, sel_stop);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[PXGEngine renderers](self->_engine, "renderers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setRecordingSession:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

  -[PXGEngine setRecordingSession:](self->_engine, "setRecordingSession:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
}

@end
