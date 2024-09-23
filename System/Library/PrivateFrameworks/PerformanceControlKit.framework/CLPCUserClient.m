@implementation CLPCUserClient

- (void).cxx_destruct
{
  clpc::user::iokit::CLPC::~CLPC((clpc::user::iokit::CLPC *)&self->clpc);
}

- (BOOL)setGameModeOnProcess:(BOOL)a3 targetProcess:(int)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v9 = setpriority(7, a4, a3);
  if (v9)
  {
    v10 = *__error();
    v11 = CFSTR("disable");
    if (v8)
      v11 = CFSTR("enable");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to %@ Game Mode on process %d."), v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    v17[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v10, v14);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 == 0;
}

- (id).cxx_construct
{
  clpc::user::iokit::CLPC::CLPC((clpc::user::iokit::CLPC *)&self->clpc);
  return self;
}

- (id)init:(id *)a3
{
  CLPCUserClient *v4;
  CLPCUserClient *v5;
  CLPCUserClient *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLPCUserClient;
  v4 = -[CLPCUserClient init](&v8, sel_init);
  v5 = v4;
  if (v4 && (-[CLPCUserClient connect:]((uint64_t)v4, a3) & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (uint64_t)connect:(uint64_t)result
{
  kern_return_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    if (*(_DWORD *)(result + 20))
    {
      return 1;
    }
    else
    {
      v3 = IOServiceOpen(*(_DWORD *)(result + 16), *MEMORY[0x24BDAEC58], 0, (io_connect_t *)(result + 20));
      result = v3 == 0;
      if (a2)
      {
        if (v3)
        {
          v5 = *MEMORY[0x24BDD0BA0];
          v6[0] = CFSTR("Failed to open user client connection to AppleCLPC.");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v3, v4);
          *a2 = (id)objc_claimAutoreleasedReturnValue();

          return 0;
        }
      }
    }
  }
  return result;
}

- (BOOL)setGameMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;
  BOOL v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[6];
  uint64_t v21;
  _QWORD v22[2];

  v6 = a3;
  v22[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
    v7 = 2;
  else
    v7 = 0;
  input[0] = 2;
  input[1] = v7;
  input[2] = a4;
  memset(&input[3], 0, 24);
  output = 0;
  outputCnt = 1;
  v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if ((_DWORD)v8)
    v9 = v8 << 32;
  else
    v9 = 256;
  if (output)
    v10 = (_DWORD)v8 == 0;
  else
    v10 = 0;
  v11 = v9 >> 8;
  if (HIDWORD(v9))
    v12 = 1;
  else
    v12 = v11 == 0;
  if (!v12)
    return 1;
  if (a5)
  {
    v13 = CFSTR("disable");
    if (v6)
      v13 = CFSTR("enable");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to %@ Game Mode."), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0BA0];
    v22[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v9 >> 32, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
    return v10 ^ v6 ^ 1;
  else
    return 0;
}

- (unint64_t)isInGameMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)input = xmmword_243AA6080;
  v10 = 0u;
  v11 = 0u;
  output = 0;
  outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      v12 = *MEMORY[0x24BDD0BA0];
      v13[0] = CFSTR("Failed to determine if Game Mode is enabled.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v4, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (CLPCUserClient)init
{
  return (CLPCUserClient *)-[CLPCUserClient init:](self, "init:", 0);
}

- (unint64_t)isInLowPowerMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  *(int64x2_t *)input = vdupq_n_s64(1uLL);
  v10 = 0u;
  v11 = 0u;
  output = 0;
  outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      v12 = *MEMORY[0x24BDD0BA0];
      v13[0] = CFSTR("Failed to determine if Low Power Mode is enabled.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v4, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setLowPowerMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;
  BOOL v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[2];

  v6 = a3;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v7 = 2;
  if (!a3)
    v7 = 0;
  input[0] = 1;
  input[1] = v7;
  v21 = 0u;
  v22 = 0u;
  output = 0;
  outputCnt = 1;
  v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if ((_DWORD)v8)
    v9 = v8 << 32;
  else
    v9 = 256;
  if (output)
    v10 = (_DWORD)v8 == 0;
  else
    v10 = 0;
  v11 = v9 >> 8;
  if (HIDWORD(v9))
    v12 = 1;
  else
    v12 = v11 == 0;
  if (!v12)
    return 1;
  if (a5)
  {
    v13 = CFSTR("disable");
    if (v6)
      v13 = CFSTR("enable");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to %@ Low Power Mode."), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0BA0];
    v24[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v9 >> 32, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
    return v10 ^ v6 ^ 1;
  else
    return 0;
}

- (unint64_t)isInHotInPocketMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)input = xmmword_243AA6070;
  v10 = 0u;
  v11 = 0u;
  output = 0;
  outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      v12 = *MEMORY[0x24BDD0BA0];
      v13[0] = CFSTR("Failed to determine if Hot In Pocket Mode is enabled.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v4, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setHotInPocketMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;
  BOOL v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[2];

  v6 = a3;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v7 = 2;
  if (!a3)
    v7 = 0;
  input[0] = 4;
  input[1] = v7;
  v21 = 0u;
  v22 = 0u;
  output = 0;
  outputCnt = 1;
  v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if ((_DWORD)v8)
    v9 = v8 << 32;
  else
    v9 = 256;
  if (output)
    v10 = (_DWORD)v8 == 0;
  else
    v10 = 0;
  v11 = v9 >> 8;
  if (HIDWORD(v9))
    v12 = 1;
  else
    v12 = v11 == 0;
  if (!v12)
    return 1;
  if (a5)
  {
    v13 = CFSTR("disable");
    if (v6)
      v13 = CFSTR("enable");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to %@ Hot In Pocket Mode."), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0BA0];
    v24[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v9 >> 32, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
    return v10 ^ v6 ^ 1;
  else
    return 0;
}

- (unint64_t)isInSustainableMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)input = xmmword_243AA6090;
  v10 = 0u;
  v11 = 0u;
  output = 0;
  outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      v12 = *MEMORY[0x24BDD0BA0];
      v13[0] = CFSTR("Failed to determine if Sustainable Mode is enabled.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v4, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setSustainableMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;
  BOOL v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[2];

  v6 = a3;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v7 = 2;
  if (!a3)
    v7 = 0;
  input[0] = 3;
  input[1] = v7;
  v21 = 0u;
  v22 = 0u;
  output = 0;
  outputCnt = 1;
  v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if ((_DWORD)v8)
    v9 = v8 << 32;
  else
    v9 = 256;
  if (output)
    v10 = (_DWORD)v8 == 0;
  else
    v10 = 0;
  v11 = v9 >> 8;
  if (HIDWORD(v9))
    v12 = 1;
  else
    v12 = v11 == 0;
  if (!v12)
    return 1;
  if (a5)
  {
    v13 = CFSTR("disable");
    if (v6)
      v13 = CFSTR("enable");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to %@ Sustainable Mode."), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0BA0];
    v24[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v9 >> 32, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
    return v10 ^ v6 ^ 1;
  else
    return 0;
}

- (unint64_t)isInDockMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)input = xmmword_243AA60A0;
  v10 = 0u;
  v11 = 0u;
  output = 0;
  outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      v12 = *MEMORY[0x24BDD0BA0];
      v13[0] = CFSTR("Failed to determine if Dock Mode is enabled.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v4, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setDockMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;
  BOOL v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[2];

  v6 = a3;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v7 = 2;
  if (!a3)
    v7 = 0;
  input[0] = 5;
  input[1] = v7;
  v21 = 0u;
  v22 = 0u;
  output = 0;
  outputCnt = 1;
  v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if ((_DWORD)v8)
    v9 = v8 << 32;
  else
    v9 = 256;
  if (output)
    v10 = (_DWORD)v8 == 0;
  else
    v10 = 0;
  v11 = v9 >> 8;
  if (HIDWORD(v9))
    v12 = 1;
  else
    v12 = v11 == 0;
  if (!v12)
    return 1;
  if (a5)
  {
    v13 = CFSTR("disable");
    if (v6)
      v13 = CFSTR("enable");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to %@ Dock Mode."), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0BA0];
    v24[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v9 >> 32, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
    return v10 ^ v6 ^ 1;
  else
    return 0;
}

- (unint64_t)isInTaskingMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)input = xmmword_243AA60B0;
  v10 = 0u;
  v11 = 0u;
  output = 0;
  outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      v12 = *MEMORY[0x24BDD0BA0];
      v13[0] = CFSTR("Failed to determine if Tasking Mode is enabled.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v4, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setTaskingMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;
  BOOL v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[2];

  v6 = a3;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v7 = 2;
  if (!a3)
    v7 = 0;
  input[0] = 6;
  input[1] = v7;
  v21 = 0u;
  v22 = 0u;
  output = 0;
  outputCnt = 1;
  v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if ((_DWORD)v8)
    v9 = v8 << 32;
  else
    v9 = 256;
  if (output)
    v10 = (_DWORD)v8 == 0;
  else
    v10 = 0;
  v11 = v9 >> 8;
  if (HIDWORD(v9))
    v12 = 1;
  else
    v12 = v11 == 0;
  if (!v12)
    return 1;
  if (a5)
  {
    v13 = CFSTR("disable");
    if (v6)
      v13 = CFSTR("enable");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to %@ Tasking Mode."), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0BA0];
    v24[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v9 >> 32, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
    return v10 ^ v6 ^ 1;
  else
    return 0;
}

- (unint64_t)isInContextualPowerMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)input = xmmword_243AA60C0;
  v10 = 0u;
  v11 = 0u;
  output = 0;
  outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      v12 = *MEMORY[0x24BDD0BA0];
      v13[0] = CFSTR("Failed to determine if Contextual Power Mode is enabled.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v4, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setContextualPowerMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;
  BOOL v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[6];
  uint64_t v21;
  _QWORD v22[2];

  v6 = a3;
  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = 2;
  if (!a3)
    v7 = 0;
  input[0] = 7;
  input[1] = v7;
  input[2] = a4;
  memset(&input[3], 0, 24);
  output = 0;
  outputCnt = 1;
  v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if ((_DWORD)v8)
    v9 = v8 << 32;
  else
    v9 = 256;
  if (output)
    v10 = (_DWORD)v8 == 0;
  else
    v10 = 0;
  v11 = v9 >> 8;
  if (HIDWORD(v9))
    v12 = 1;
  else
    v12 = v11 == 0;
  if (!v12)
    return 1;
  if (a5)
  {
    v13 = CFSTR("disable");
    if (v6)
      v13 = CFSTR("enable");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to %@ Contextual Power Mode."), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0BA0];
    v22[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v9 >> 32, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
    return v10 ^ v6 ^ 1;
  else
    return 0;
}

- (id)reportingObfuscationData:(id *)a3
{
  kern_return_t v4;
  BOOL v5;
  int v6;
  void *v7;
  uint32_t outputCnt;
  uint64_t v10;
  const __CFString *v11;
  _OWORD v12[2];
  int v13;
  uint64_t output[2];
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)output = 0u;
  v15 = 0u;
  outputCnt = 4;
  v4 = IOConnectCallMethod(self->clpc.connect, 5u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (v4)
    v5 = 1;
  else
    v5 = outputCnt == 4;
  if (v5)
    v6 = v4;
  else
    v6 = -536870212;
  v12[0] = *(_OWORD *)output;
  v12[1] = v15;
  v13 = v6;
  if (v6)
  {
    if (a3)
    {
      v10 = *MEMORY[0x24BDD0BA0];
      v11 = CFSTR("Failed to get reporting obfuscation data.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), v6, v7);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12, 32);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
