@implementation wspSetBindingsIn

- (wspSetBindingsIn)initWithCtx:(id)a3
{
  id v5;
  char *v6;
  wspSetBindingsIn *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)wspSetBindingsIn;
  v6 = -[wspSetBindingsIn init](&v9, sel_init);
  v7 = (wspSetBindingsIn *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_227C48D00;
    objc_storeStrong((id *)v6 + 3, a3);
  }

  return v7;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v6;
  id v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  unint64_t v43;
  unsigned int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id obj;
  int v50;
  void *v51;
  unsigned int *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  unsigned int v57;
  _BYTE v58[128];
  uint64_t v59;

  v6 = *(_QWORD *)&a4;
  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v57 = 0;
  v9 = objc_msgSend(v8, "length");
  v10 = v9;
  if (v9 <= v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.21(v10, v6, v14, v15, v16, v17, v18, v19);
    goto LABEL_7;
  }
  v11 = v9 - v6;
  v12 = objc_retainAutorelease(v8);
  v13 = objc_msgSend(v12, "bytes");
  if (v11 <= 0xF)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.1(v11);
LABEL_7:
    v20 = 12;
    goto LABEL_8;
  }
  v22 = v13;
  *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v13 + v6) = self->msghdr;
  if (v11 - 16 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.2();
    goto LABEL_7;
  }
  -[wspSetBindingsIn wctx](self, "wctx");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "cursor");

  *(_DWORD *)(v22 + (v6 + 16)) = v24;
  if (v11 - 20 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.3();
    goto LABEL_7;
  }
  v52 = a5;
  -[wspSetBindingsIn wctx](self, "wctx");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pidMap");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "rowLength");

  *(_DWORD *)(v22 + (v6 + 20)) = v27;
  if (v11 - 24 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.4();
    goto LABEL_7;
  }
  if (v11 - 28 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.5();
    goto LABEL_7;
  }
  *(_DWORD *)(v22 + (v6 + 28)) = 0;
  if (v11 - 32 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.6();
    goto LABEL_7;
  }
  -[wspSetBindingsIn wctx](self, "wctx");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pidMap");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "colTableArr");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v30, "count");

  *(_DWORD *)(v22 + (v6 + 32)) = v50;
  v31 = (v6 + 36);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[wspSetBindingsIn wctx](self, "wctx");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "pidMap");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "colTableArr");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v34;
  v47 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (!v47)
    goto LABEL_48;
  v35 = 0;
  v36 = 0;
  v37 = v11 - 36;
  v48 = *(_QWORD *)v54;
  while (2)
  {
    v38 = 0;
    v39 = v35;
    v40 = v36;
    do
    {
      if (*(_QWORD *)v54 != v48)
        objc_enumerationMutation(obj);
      v35 = *(id *)(*((_QWORD *)&v53 + 1) + 8 * v38);

      objc_msgSend(v35, "propSpec");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = v41;
      v42 = objc_msgSend(v41, "encodeBuffer:BufferOffset:BytesWritten:", v12, v31, &v57);
      if (v42)
      {
        v20 = v42;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.20(v41, v20);
        goto LABEL_78;
      }
      v43 = v37 - v57;
      if (v43 <= 3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.7();
        goto LABEL_77;
      }
      v44 = v57 + v31;
      *(_DWORD *)(v22 + v44) = objc_msgSend(v35, "vType");
      if (v43 == 4)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.8();
        goto LABEL_77;
      }
      *(_BYTE *)(v22 + v44 + 4) = objc_msgSend(v35, "aggregateUsed");
      if (v43 == 5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.9();
        goto LABEL_77;
      }
      *(_BYTE *)(v22 + v44 + 5) = objc_msgSend(v35, "aggregateType");
      if (v43 == 6)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.10();
        goto LABEL_77;
      }
      *(_BYTE *)(v22 + v44 + 6) = objc_msgSend(v35, "valueUsed");
      if (v43 == 7)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.11();
        goto LABEL_77;
      }
      *(_BYTE *)(v22 + v44 + 7) = 0;
      if (v43 - 8 <= 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.12();
        goto LABEL_77;
      }
      *(_WORD *)(v22 + v44 + 8) = objc_msgSend(v35, "valueOffset");
      if (v43 - 10 <= 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.13();
        goto LABEL_77;
      }
      *(_WORD *)(v22 + v44 + 10) = objc_msgSend(v35, "valueSize");
      if (v43 == 12)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.14();
        goto LABEL_77;
      }
      *(_BYTE *)(v22 + v44 + 12) = objc_msgSend(v35, "statusUsed");
      if (v43 == 13)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.15();
        goto LABEL_77;
      }
      *(_BYTE *)(v22 + v44 + 13) = 0;
      if (v43 - 14 <= 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.16();
        goto LABEL_77;
      }
      *(_WORD *)(v22 + v44 + 14) = objc_msgSend(v35, "statusOffset");
      if (v43 == 16)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.17();
        goto LABEL_77;
      }
      v45 = objc_msgSend(v35, "lengthUsed");
      *(_BYTE *)(v22 + v44 + 16) = v45;
      v31 = v44 + 17;
      v37 = v43 - 17;
      if (!v45)
        goto LABEL_45;
      if (v43 == 17)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.18();
LABEL_77:
        v20 = 12;
LABEL_78:

        goto LABEL_8;
      }
      *(_BYTE *)(v22 + v31) = 0;
      if (v43 - 18 <= 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.19();
        goto LABEL_77;
      }
      *(_WORD *)(v22 + v44 + 18) = objc_msgSend(v35, "lengthOffset");
      v31 = v44 + 20;
      v37 = v43 - 20;
LABEL_45:
      ++v38;
      v39 = v35;
      v40 = v51;
    }
    while (v47 != v38);
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    v36 = v51;
    v47 = v46;
    if (v46)
      continue;
    break;
  }

LABEL_48:
  *(_DWORD *)(v22 + (v6 + 24)) = v31 - 32;
  v20 = 0;
  *(_DWORD *)(v22 + 8) = getChecksum32(208, (int *)(v22 + 16), (int)v31 - 16);
  *v52 = v31 + 3;
LABEL_8:

  return v20;
}

- (wspContext)wctx
{
  return (wspContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWctx:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wctx, 0);
}

- (void)encodeBuffer:(uint64_t)a1 BufferOffset:BytesWritten:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "wspSetBindingsIn:encodeBuffer: no buffer space for WSP header, sizeAvail: %llu\n", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for hCursor, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for cbRow field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for cBindingDesc field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for dummy field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for cColumns field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for vType field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for AggregateUsed field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for AggregateType field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for ValueUsed field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for _padding field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for ValueOffset field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for ValuesSize field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for StatusUsed field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for padding2 field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for StatusOffset field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for LengthUsed field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for padding3 field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspSetBindingsIn:encodeBuffer: no buffer space for LengthOffset field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(int)a2 BytesWritten:.cold.20(void *a1, int a2)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = objc_msgSend(a1, "propID");
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "wspSetBindingsIn:encodeBuffer: PropSpecId: %u, encodeBuffer error: %d\n", (uint8_t *)v3, 0xEu);
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspSetBindingsIn:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
