@implementation PTCinematographyNetworkNamedSignal

- (PTCinematographyNetworkNamedSignal)initWithModelDictionary:(id)a3
{
  id v4;
  PTCinematographyNetworkNamedSignal *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PTCinematographyNetworkNamedSignal;
  v5 = -[PTCinematographyNetworkSignal initWithModelDictionary:](&v8, sel_initWithModelDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flatten"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_flatten = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (void)writePayload:(id)a3 toStream:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PTCinematographyNetworkSignal checkSignalForStream:](self, "checkSignalForStream:", v7))
  {
    objc_msgSend(v6, "detection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_namedSignals");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyNetworkSignal name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (-[PTCinematographyNetworkNamedSignal flatten](self, "flatten"))
      {
        -[PTCinematographyNetworkNamedSignal _flattenArray:](self, "_flattenArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v12;
        if (!v11)
          goto LABEL_22;
      }
      else
      {
        v11 = v11;
      }
      if (!objc_msgSend(v6, "isMissingDetection"))
      {
        v13 = -[NSObject count](v11, "count");
        if (v13 == -[PTCinematographyNetworkSignal count](self, "count"))
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v11 = v11;
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v20;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v20 != v16)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "floatValue", (_QWORD)v19);
                objc_msgSend(v7, "writeFloat:");
              }
              v15 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            }
            while (v15);
          }

          goto LABEL_23;
        }
        _PTLogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[PTCinematographyNetworkNamedSignal writePayload:toStream:].cold.1(self, v11, v18);

      }
    }
LABEL_22:
    objc_msgSend(v7, "writeZerosWithCount:", -[PTCinematographyNetworkSignal count](self, "count"));
LABEL_23:

    goto LABEL_24;
  }
  _PTLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[PTCinematographyNetworkNamedSignal writePayload:toStream:].cold.2(v11);
LABEL_24:

}

- (id)_flattenArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[PTCinematographyNetworkNamedSignal _flattenArray:toMutableArray:](self, "_flattenArray:toMutableArray:", v4, v5);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (void)_flattenArray:(id)a3 toMutableArray:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[PTCinematographyNetworkNamedSignal _flattenArray:toMutableArray:](self, "_flattenArray:toMutableArray:", v12, v7);
        else
          objc_msgSend(v7, "addObject:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)flatten
{
  return self->_flatten;
}

- (void)writePayload:(NSObject *)a3 toStream:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "count");
  objc_msgSend(a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218498;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2048;
  v13 = objc_msgSend(a2, "count");
  _os_log_error_impl(&dword_1C9281000, a3, OS_LOG_TYPE_ERROR, "Expected %ld values for named signal %@, got %ld values", (uint8_t *)&v8, 0x20u);

}

- (void)writePayload:(os_log_t)log toStream:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "not enough room to write signal for network payload", v1, 2u);
}

@end
