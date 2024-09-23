@implementation SLODLDInputTokenParams

- (SLODLDInputTokenParams)initWithShape:(id)a3
{
  id v5;
  SLODLDInputTokenParams *v6;
  SLODLDInputTokenParams *v7;
  void *v8;
  NSObject *v10;
  uint64_t v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLODLDInputTokenParams;
  v6 = -[SLODLDInputTokenParams init](&v12, sel_init);
  if (!v6)
    goto LABEL_4;
  if (objc_msgSend(v5, "count") == 2)
  {
    objc_storeStrong((id *)&v6->_shape, a3);
    -[SLODLDInputTokenParams _initWithDefaults](v6, "_initWithDefaults");
LABEL_4:
    v7 = v6;
    goto LABEL_8;
  }
  v8 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v10 = v8;
    v11 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 136315394;
    v14 = "-[SLODLDInputTokenParams initWithShape:]";
    v15 = 2048;
    v16 = v11;
    _os_log_error_impl(&dword_213B50000, v10, OS_LOG_TYPE_ERROR, "%s Expected 2D array, got %lu, not running model", buf, 0x16u);

  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (void)_initWithDefaults
{
  void *v3;
  uint64_t v4;
  NSMutableArray *v5;
  NSMutableArray *mlInputIds;
  NSMutableArray *v7;
  NSMutableArray *mlTypeIds;
  NSMutableArray *v9;
  NSMutableArray *mlAttnMask;
  NSMutableArray *v11;
  NSMutableArray *mlPadMask;
  uint64_t i;

  -[NSArray objectAtIndexedSubscript:](self->_shape, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v4);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  mlInputIds = self->_mlInputIds;
  self->_mlInputIds = v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v4);
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  mlTypeIds = self->_mlTypeIds;
  self->_mlTypeIds = v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v4);
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  mlAttnMask = self->_mlAttnMask;
  self->_mlAttnMask = v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v4);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  mlPadMask = self->_mlPadMask;
  self->_mlPadMask = v11;

  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_mlInputIds, "setObject:atIndexedSubscript:", &unk_24D0CB258, i);
      -[NSMutableArray setObject:atIndexedSubscript:](self->_mlTypeIds, "setObject:atIndexedSubscript:", &unk_24D0CB258, i);
      -[NSMutableArray setObject:atIndexedSubscript:](self->_mlAttnMask, "setObject:atIndexedSubscript:", &unk_24D0CB258, i);
      -[NSMutableArray setObject:atIndexedSubscript:](self->_mlPadMask, "setObject:atIndexedSubscript:", &unk_24D0CB268, i);
    }
  }
}

- (void)populateWithTokens:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *shape;
  id v8;
  void *v9;
  const __CFString **v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD v17[6];
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  shape = self->_shape;
  if (shape)
  {
    if (-[NSArray count](shape, "count") > 1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_shape, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __51__SLODLDInputTokenParams_populateWithTokens_error___block_invoke;
      v17[3] = &unk_24D0C60E0;
      v17[4] = self;
      v17[5] = v14;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
      v15 = objc_msgSend(v6, "count");
      if (v15 < v14)
      {
        v16 = v15;
        do
        {
          -[NSMutableArray setObject:atIndexedSubscript:](self->_mlInputIds, "setObject:atIndexedSubscript:", &unk_24D0CB258, v16);
          -[NSMutableArray setObject:atIndexedSubscript:](self->_mlTypeIds, "setObject:atIndexedSubscript:", &unk_24D0CB258, v16);
          -[NSMutableArray setObject:atIndexedSubscript:](self->_mlAttnMask, "setObject:atIndexedSubscript:", &unk_24D0CB258, v16);
          -[NSMutableArray setObject:atIndexedSubscript:](self->_mlPadMask, "setObject:atIndexedSubscript:", &unk_24D0CB268, v16++);
        }
        while (v14 != v16);
      }
    }
    else if (a4)
    {
      v8 = objc_alloc(MEMORY[0x24BDD1540]);
      v18 = *MEMORY[0x24BDD0FC8];
      v19 = CFSTR("Index in toeken shape is not valid");
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = &v19;
      v11 = &v18;
LABEL_7:
      objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 116, v12);

    }
  }
  else if (a4)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    v20 = *MEMORY[0x24BDD0FC8];
    v21[0] = CFSTR("Toekn shape not initialized");
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (const __CFString **)v21;
    v11 = &v20;
    goto LABEL_7;
  }

}

- (NSMutableArray)mlInputIds
{
  return self->_mlInputIds;
}

- (void)setMlInputIds:(id)a3
{
  objc_storeStrong((id *)&self->_mlInputIds, a3);
}

- (NSMutableArray)mlTypeIds
{
  return self->_mlTypeIds;
}

- (void)setMlTypeIds:(id)a3
{
  objc_storeStrong((id *)&self->_mlTypeIds, a3);
}

- (NSMutableArray)mlAttnMask
{
  return self->_mlAttnMask;
}

- (void)setMlAttnMask:(id)a3
{
  objc_storeStrong((id *)&self->_mlAttnMask, a3);
}

- (NSMutableArray)mlPadMask
{
  return self->_mlPadMask;
}

- (void)setMlPadMask:(id)a3
{
  objc_storeStrong((id *)&self->_mlPadMask, a3);
}

- (NSArray)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
  objc_storeStrong((id *)&self->_shape, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_mlPadMask, 0);
  objc_storeStrong((id *)&self->_mlAttnMask, 0);
  objc_storeStrong((id *)&self->_mlTypeIds, 0);
  objc_storeStrong((id *)&self->_mlInputIds, 0);
}

uint64_t __51__SLODLDInputTokenParams_populateWithTokens_error___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  if (*(_QWORD *)(result + 40) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    v5 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 8), "setObject:atIndexedSubscript:", a2, a3);
    objc_msgSend(*(id *)(*(_QWORD *)(v5 + 32) + 16), "setObject:atIndexedSubscript:", &unk_24D0CB268, a3);
    objc_msgSend(*(id *)(*(_QWORD *)(v5 + 32) + 24), "setObject:atIndexedSubscript:", &unk_24D0CB268, a3);
    return objc_msgSend(*(id *)(*(_QWORD *)(v5 + 32) + 32), "setObject:atIndexedSubscript:", &unk_24D0CB258, a3);
  }
  return result;
}

@end
