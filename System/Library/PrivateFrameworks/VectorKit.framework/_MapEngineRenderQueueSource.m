@implementation _MapEngineRenderQueueSource

- (BOOL)isDelayedRenderQueueConsumptionSupported
{
  _QWORD *mapEngine;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  BOOL v9;
  _BOOL4 v10;

  mapEngine = self->_mapEngine;
  v3 = (uint64_t *)mapEngine[141];
  v4 = *v3;
  v5 = v3[1];
  v6 = v4;
  if (v4 != v5)
  {
    v6 = v4;
    while (*(_BYTE *)v6 != 20)
    {
      v6 += 16;
      if (v6 == v5)
        goto LABEL_9;
    }
  }
  if (v6 == v5)
  {
LABEL_9:
    LODWORD(v7) = 0;
    if (v4 != v5)
    {
LABEL_10:
      while (*(_BYTE *)v4 != 22)
      {
        v4 += 16;
        if (v4 == v5)
          goto LABEL_15;
      }
    }
  }
  else
  {
    v7 = *(_QWORD *)(v6 + 8);
    if (v4 != v5)
      goto LABEL_10;
  }
  if (v4 == v5)
LABEL_15:
    v8 = 1;
  else
    v8 = *(_QWORD *)(v4 + 8) == 0;
  if (*((_BYTE *)mapEngine + 1241))
    v9 = v7 > 0xA;
  else
    v9 = 1;
  if (v9)
    goto LABEL_24;
  LOBYTE(v10) = 1;
  if (((1 << v7) & 0x418) != 0)
  {
LABEL_26:
    *(_BYTE *)(mapEngine[112] + 377) = 1;
    return v10;
  }
  if (((1 << v7) & 6) == 0)
  {
LABEL_24:
    *(_BYTE *)(mapEngine[112] + 377) = 0;
    if (v7 > 0xA)
    {
      LOBYTE(v10) = 1;
      return v10;
    }
    return (0x3E7u >> v7) & 1;
  }
  if (!v8)
    goto LABEL_26;
  *(_BYTE *)(mapEngine[112] + 377) = 0;
  return (0x3E7u >> v7) & 1;
}

- (_MapEngineRenderQueueSource)initWithEngine:(void *)a3
{
  _MapEngineRenderQueueSource *v4;
  _MapEngineRenderQueueSource *v5;
  _MapEngineRenderQueueSource *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MapEngineRenderQueueSource;
  v4 = -[_MapEngineRenderQueueSource init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_mapEngine = a3;
    v6 = v4;
  }

  return v5;
}

- (void)renderQueueForTimestamp:(double)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v3 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315650;
    v6 = "false";
    v7 = 2080;
    v8 = "/Library/Caches/com.apple.xbs/Sources/VectorKit/src/MDMapEngine.mm";
    v9 = 1024;
    v10 = 2167;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_FAULT, "Unsupported: Assertion with expression - %s : Failed in file - %s line - %i", (uint8_t *)&v5, 0x1Cu);
  }

  return 0;
}

@end
