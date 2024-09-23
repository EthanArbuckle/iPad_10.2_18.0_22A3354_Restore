@implementation PTCinematographyNetworkLabelSignal

- (PTCinematographyNetworkLabelSignal)initWithModelDictionary:(id)a3
{
  id v4;
  PTCinematographyNetworkLabelSignal *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSDictionary *remap;
  void *v23;
  id v24;
  id v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PTCinematographyNetworkLabelSignal;
  v5 = -[PTCinematographyNetworkSignal initWithModelDictionary:](&v26, sel_initWithModelDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("params"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("zero_label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_labelZero = objc_msgSend(v7, "unsignedIntegerValue");

    if (v5->_labelZero)
      v8 = -1;
    else
      v8 = 0;
    v5->_labelOffset = v8;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("remap"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v23 = v6;
      v24 = v4;
      v10 = (void *)objc_opt_new();
      if (objc_msgSend(v9, "count"))
      {
        v11 = 0;
        v25 = v9;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            v13 = v12;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v28;
              do
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v28 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v18);

                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
              }
              while (v15);
              v9 = v25;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              -[PTCinematographyNetworkLabelSignal initWithModelDictionary:].cold.1();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
            v13 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v12);
          }

          ++v11;
        }
        while (v11 < objc_msgSend(v9, "count"));
      }
      v20 = objc_msgSend(v10, "copy");

      v4 = v24;
      v6 = v23;
    }
    else
    {
      v20 = 0;
    }

    remap = v5->_remap;
    v5->_remap = (NSDictionary *)v20;

  }
  return v5;
}

- (void)writePayload:(id)a3 toStream:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if (-[PTCinematographyNetworkSignal checkSignalForStream:](self, "checkSignalForStream:", v7))
  {
    objc_msgSend(v6, "detection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PTCinematographyNetworkLabelSignal _networkLabelForDetection:](self, "_networkLabelForDetection:", v8);

    objc_msgSend(v7, "writeOneHot:count:", v9, -[PTCinematographyNetworkSignal count](self, "count"));
  }
  else
  {
    _PTLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PTCinematographyNetworkNamedSignal writePayload:toStream:].cold.2(v10);

  }
}

- (unint64_t)_networkLabelForDetection:(id)a3
{
  id v4;
  NSDictionary *remap;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  int64_t labelZero;

  v4 = a3;
  remap = self->_remap;
  v6 = objc_msgSend(v4, "trackIdentifier");
  if (remap)
  {
    if (v6 == 0x1000000000)
      v7 = 0;
    else
      v7 = objc_msgSend(v4, "detectionType");
    v8 = self->_remap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    labelZero = objc_msgSend(v10, "unsignedIntegerValue");

  }
  else if (v6 == 0x1000000000)
  {
    labelZero = self->_labelZero;
  }
  else
  {
    labelZero = self->_labelOffset + objc_msgSend(v4, "detectionType");
  }

  return labelZero;
}

- (int64_t)labelOffset
{
  return self->_labelOffset;
}

- (unint64_t)labelZero
{
  return self->_labelZero;
}

- (NSDictionary)remap
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remap, 0);
}

- (void)initWithModelDictionary:.cold.1()
{
  __assert_rtn("DictionaryFromRemapParam", "PTCinematographyNetworkLabelSignal.m", 57, "[element isKindOfClass:[NSNumber class]]");
}

@end
