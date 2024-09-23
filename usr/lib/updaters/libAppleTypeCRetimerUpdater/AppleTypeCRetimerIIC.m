@implementation AppleTypeCRetimerIIC

- (unsigned)sleepTimeForCommandResultPollIteration:(unsigned int)a3
{
  int v3;
  int v4;
  unsigned int v5;

  if (a3 >= 0x69)
    v3 = 1000000;
  else
    v3 = 250000;
  if (a3 >= 0x63)
    v4 = v3;
  else
    v4 = 100000;
  if (a3 >= 0x5F)
    v5 = v4;
  else
    v5 = 2000;
  if (a3 >= 0x32)
    return v5;
  else
    return 200;
}

- (id)sendCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  useconds_t v16;
  int v17;
  int v18;
  __objc2_class *v19;
  id v20;
  uint64_t v21;
  __objc2_class *v22;
  NSObject *v23;
  int v24;
  unsigned int v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "inputData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_retainAutorelease(v5);
    if (-[AppleTypeCRetimerIICBase writeRegister:buffer:length:](self, "writeRegister:buffer:length:", 9, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length")))
    {
      -[AppleTypeCRetimerIICBase log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AppleTypeCRetimerIIC sendCommand:].cold.7(v4);
LABEL_8:

LABEL_9:
      v9 = 0;
      goto LABEL_10;
    }
  }
  v25 = bswap32(objc_msgSend(v4, "code"));
  if (-[AppleTypeCRetimerIICBase writeRegister:buffer:length:](self, "writeRegister:buffer:length:", 8, &v25, 4))
  {
    -[AppleTypeCRetimerIICBase log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerIIC sendCommand:].cold.6(v4);
    goto LABEL_8;
  }
  -[AppleTypeCPacketDumper dumpCommand:](self->_dumper, "dumpCommand:", v4);
  if (!objc_msgSend(v4, "hasResponse"))
    goto LABEL_9;
  v24 = 0;
  v11 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 8, &v24, 4);
  if (v11)
  {
    v12 = v11;
    LODWORD(v13) = 0;
LABEL_14:
    -[AppleTypeCRetimerIICBase log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "codeString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v27 = "-[AppleTypeCRetimerIIC sendCommand:]";
      v28 = 2112;
      v29 = v14;
      v30 = 1024;
      v31 = v13;
      v32 = 1024;
      v33 = v12;
      _os_log_error_impl(&dword_24BC99000, v8, OS_LOG_TYPE_ERROR, "%s: Command response read for %@ failed on iteration %u (0x%08x)", buf, 0x22u);

    }
    goto LABEL_8;
  }
  v15 = 0;
  v13 = 0;
  while (v24)
  {
    if (v24 == 1145914145)
    {
      -[AppleTypeCRetimerIICBase log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AppleTypeCRetimerIIC sendCommand:].cold.5(v4);
      goto LABEL_8;
    }
    if (v24 != v25)
    {
      -[AppleTypeCRetimerIICBase log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AppleTypeCRetimerIIC sendCommand:].cold.2();
      goto LABEL_8;
    }
    v16 = -[AppleTypeCRetimerIIC sleepTimeForCommandResultPollIteration:](self, "sleepTimeForCommandResultPollIteration:", v13);
    usleep(v16);
    v15 += v16;
    if (v15 >= 0x989681)
    {
      -[AppleTypeCRetimerIICBase log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AppleTypeCRetimerIIC sendCommand:].cold.1(v4);
      goto LABEL_8;
    }
    v13 = (v13 + 1);
    v24 = 0;
    v17 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 8, &v24, 4);
    if (v17)
    {
      v12 = v17;
      goto LABEL_14;
    }
  }
  if (objc_msgSend(v4, "code") != 1397118825)
  {
    if (objc_msgSend(v4, "code") == 1397118820)
    {
      *(_DWORD *)buf = 0;
      v18 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 9, buf, 4);
      if (v18)
        goto LABEL_43;
      v22 = ATCRTResponseSFWd;
    }
    else
    {
      if (objc_msgSend(v4, "code") != 1397118822)
      {
        if (objc_msgSend(v4, "code") != 1397118835)
        {
          if (objc_msgSend(v4, "code") == 1195460932
            || objc_msgSend(v4, "code") == 1197566308)
          {
            goto LABEL_9;
          }
          -[AppleTypeCRetimerIICBase log](self, "log");
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            -[AppleTypeCRetimerIIC sendCommand:].cold.4(v4);
          goto LABEL_8;
        }
        buf[0] = 0;
        v18 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 9, buf, 1);
        if (!v18)
        {
          v19 = ATCRTResponseSFWs;
          goto LABEL_26;
        }
LABEL_43:
        v9 = 0;
        goto LABEL_44;
      }
      *(_DWORD *)buf = 0;
      v18 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 9, buf, 4);
      if (v18)
        goto LABEL_43;
      v22 = ATCRTResponseSFWf;
    }
    v21 = objc_msgSend([v22 alloc], "initWithOutput:", buf);
    goto LABEL_40;
  }
  buf[0] = 0;
  v18 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 9, buf, 1);
  if (v18)
    goto LABEL_43;
  v19 = ATCRTResponseSFWi;
LABEL_26:
  v20 = [v19 alloc];
  v21 = objc_msgSend(v20, "initWithByte0:", buf[0]);
LABEL_40:
  v9 = (void *)v21;
LABEL_44:
  if (v18)
  {
    -[AppleTypeCRetimerIICBase log](self, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerIIC sendCommand:].cold.3(v4);

  }
  if (v9)
    -[AppleTypeCPacketDumper dumpResponse:](self->_dumper, "dumpResponse:", v9);
LABEL_10:

  return v9;
}

- (unsigned)sfwfBlockCount:(const char *)a3 length:(unsigned int)a4
{
  unsigned int v4;
  int v5;
  const char *v7;
  int8x16_t v8;
  BOOL v9;
  _OWORD v10[4];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a4 - 64;
  if (a4 >= 0x40)
  {
    v7 = a3;
    v5 = 0;
    v8 = vld1q_dup_s8(a3);
    v10[0] = v8;
    v10[1] = v8;
    v10[2] = v8;
    v10[3] = v8;
    do
    {
      if (memcmp(v7, v10, 0x40uLL))
        break;
      ++v5;
      v9 = v4 >= 0x40;
      v4 -= 64;
      if (!v9)
        break;
      v7 += 64;
    }
    while (v5 != 255);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)transferFirmware:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  ATCRTCommandSFWf *v13;
  ATCRTCommandSFWd *v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  int v21;
  id WeakRetained;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  NSObject *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  _OWORD v32[4];
  _OWORD v33[4];
  uint64_t v34;

  v4 = *(_QWORD *)&a4;
  v34 = *MEMORY[0x24BDAC8D0];
  memset(v33, 0, sizeof(v33));
  -[AppleTypeCRetimerIICBase writeRegister:buffer:length:](self, "writeRegister:buffer:length:", 9, v33, 64);
  +[ATCRTCommandSFWi command](ATCRTCommandSFWi, "command");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATCRTCommandSFWi command](ATCRTCommandSFWi, "command");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppleTypeCRetimerIIC sendCommand:](self, "sendCommand:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v9;
  if ((objc_msgSend(v9, "success") & 1) != 0)
  {
    v29 = v7;
    v31 = (v4 + 63) & 0xFFFFFFC0;
    if (!v31)
    {
LABEL_17:
      +[ATCRTCommandSFWs command](ATCRTCommandSFWs, "command");
      v13 = (ATCRTCommandSFWf *)objc_claimAutoreleasedReturnValue();
      -[AppleTypeCRetimerIIC sendCommand:](self, "sendCommand:", v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "success");
      v7 = v29;
      if ((v24 & 1) == 0)
      {
        -[AppleTypeCRetimerIICBase log](self, "log");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[AppleTypeCRetimerIIC transferFirmware:length:].cold.1();

      }
      goto LABEL_24;
    }
    v10 = 0;
    while (1)
    {
      v11 = -[AppleTypeCRetimerIIC sfwfBlockCount:length:](self, "sfwfBlockCount:length:", a3, v4);
      if ((_DWORD)v11)
      {
        v12 = v11;
        v13 = -[ATCRTCommandSFWf initWithBlockCount:value:]([ATCRTCommandSFWf alloc], "initWithBlockCount:value:", v11, *(unsigned __int8 *)a3);
        -[AppleTypeCRetimerIIC sendCommand:](self, "sendCommand:", v13);
        v14 = (ATCRTCommandSFWd *)objc_claimAutoreleasedReturnValue();
        if ((-[ATCRTCommandSFWd success](v14, "success") & 1) == 0)
        {
          -[AppleTypeCRetimerIICBase log](self, "log");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[AppleTypeCRetimerIIC transferFirmware:length:].cold.1();
LABEL_33:

          v24 = 0;
          v7 = v29;
          goto LABEL_24;
        }
        v15 = -[ATCRTCommandSFWd bytesWritten](v14, "bytesWritten");
        v16 = v12 << 6;
        v17 = v12 << 6;
      }
      else
      {
        if (v4 >= 0x40)
          v16 = 64;
        else
          v16 = v4;
        if (v4 >= 0x40)
        {
          v18 = (void *)MEMORY[0x24BDBCE50];
          v19 = a3;
        }
        else
        {
          memset(v32, 0, sizeof(v32));
          __memcpy_chk();
          v18 = (void *)MEMORY[0x24BDBCE50];
          v19 = (const char *)v32;
        }
        objc_msgSend(v18, "dataWithBytes:length:", v19, 64);
        v13 = (ATCRTCommandSFWf *)objc_claimAutoreleasedReturnValue();
        v14 = -[ATCRTCommandSFWd initWithWriteData:]([ATCRTCommandSFWd alloc], "initWithWriteData:", v13);
        -[AppleTypeCRetimerIIC sendCommand:](self, "sendCommand:", v14);
        v20 = objc_claimAutoreleasedReturnValue();
        if ((-[NSObject success](v20, "success") & 1) == 0)
        {
          -[AppleTypeCRetimerIICBase log](self, "log");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            -[AppleTypeCRetimerIIC transferFirmware:length:].cold.1();

          goto LABEL_33;
        }
        v15 = -[NSObject bytesWritten](v20, "bytesWritten");

        v17 = 64;
      }

      v21 = v17 + v10;
      if (v17 + v10 != (_DWORD)v15)
        break;
      v4 = (v4 - v16);
      a3 += v17;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "bytesSent:bytesTotal:", v15, v31);

      v10 = v15;
      if ((_DWORD)v15 == v31)
        goto LABEL_17;
    }
    -[AppleTypeCRetimerIICBase log](self, "log");
    v13 = (ATCRTCommandSFWf *)objc_claimAutoreleasedReturnValue();
    v7 = v29;
    if (os_log_type_enabled(&v13->super.super, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerIIC transferFirmware:length:].cold.2(v21, v15, &v13->super.super);
  }
  else
  {
    -[AppleTypeCRetimerIICBase log](self, "log");
    v13 = (ATCRTCommandSFWf *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super.super, OS_LOG_TYPE_ERROR))
    {
      v26 = v30;
      -[AppleTypeCRetimerIIC transferFirmware:length:].cold.1();
      v24 = 0;
      goto LABEL_25;
    }
  }
  v24 = 0;
LABEL_24:
  v26 = v30;
LABEL_25:

  return v24;
}

- (void)performReset
{
  id v3;
  id v4;

  +[ATCRTCommandGAID command](ATCRTCommandGAID, "command");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[AppleTypeCRetimerIIC sendCommand:](self, "sendCommand:", v4);

}

- (BOOL)startPacketDumperWithFileName:(id)a3
{
  id v5;
  AppleTypeCPacketDumper *v6;
  AppleTypeCPacketDumper *dumper;

  if (self->_dumper)
    return 0;
  v5 = a3;
  v6 = -[AppleTypeCPacketDumper initWithFileName:]([AppleTypeCPacketDumper alloc], "initWithFileName:", v5);

  dumper = self->_dumper;
  self->_dumper = v6;

  return self->_dumper != 0;
}

- (AppleTypeCRetimerIICDelegate)delegate
{
  return (AppleTypeCRetimerIICDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dumper, 0);
}

- (void)sendCommand:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "codeString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_24BC99000, v2, v3, "%s: Task %@ timed out", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9_0();
}

- (void)sendCommand:.cold.2()
{
  int *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_8_0();
  objc_msgSend(v1, "codeString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  stringForFourCharCode(*v0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_24BC99000, v3, v4, "%s: Task %@, unexpected command response %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)sendCommand:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "codeString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_1(&dword_24BC99000, v2, v3, "%s: Failed to read output for %@ (0x%08x)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)sendCommand:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "codeString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_24BC99000, v2, v3, "%s: Parsing command output not supported for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9_0();
}

- (void)sendCommand:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "codeString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_24BC99000, v2, v3, "%s: Task %@ unrecognized", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9_0();
}

- (void)sendCommand:(void *)a1 .cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "codeString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_1(&dword_24BC99000, v2, v3, "%s: Code write for %@ failed (0x%08x).", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)sendCommand:(void *)a1 .cold.7(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "codeString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_1(&dword_24BC99000, v2, v3, "%s: Data write for %@ failed (0x%08x).", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)transferFirmware:length:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_8_0();
  objc_msgSend(v0, "codeString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_24BC99000, v2, v3, "%s: %@ Command failed\n%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)transferFirmware:(os_log_t)log length:.cold.2(int a1, int a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[AppleTypeCRetimerIIC transferFirmware:length:]";
  v5 = 1024;
  v6 = a1;
  v7 = 1024;
  v8 = a2;
  _os_log_error_impl(&dword_24BC99000, log, OS_LOG_TYPE_ERROR, "%s: Local transfer count did not match chip transfer count (local=%u, chip=%u)", (uint8_t *)&v3, 0x18u);
}

@end
