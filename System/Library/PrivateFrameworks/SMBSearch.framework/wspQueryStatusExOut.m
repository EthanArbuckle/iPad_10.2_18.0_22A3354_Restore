@implementation wspQueryStatusExOut

- (wspQueryStatusExOut)init
{
  wspQueryStatusExOut *v2;
  wspQueryStatusExOut *v3;
  wspHeader *v4;
  wspHeader *whdr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)wspQueryStatusExOut;
  v2 = -[wspQueryStatusExOut init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_qStatus = 0;
    v4 = objc_alloc_init(wspHeader);
    whdr = v3->_whdr;
    v3->_whdr = v4;

    if (!v3->_whdr)
    {

      return 0;
    }
  }
  return v3;
}

- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5
{
  uint64_t v6;
  id v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  unsigned int v14;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  unsigned int v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v25 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.14();
    v13 = 12;
  }
  else
  {
    v10 = objc_retainAutorelease(v8);
    v11 = objc_msgSend(v10, "bytes");
    -[wspQueryStatusExOut whdr](self, "whdr");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "decodeBuffer:BufferOffset:BytesDecoded:", v10, v6, &v25);

    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.13();
      v14 = v25;
      goto LABEL_6;
    }
    v16 = v25;
    -[wspQueryStatusExOut whdr](self, "whdr");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "msgid");

    if (v18 == 231)
    {
      -[wspQueryStatusExOut whdr](self, "whdr");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "status");

      if (!v20)
      {
        v21 = v16 + v6;
        v22 = v9 - v6 - v16;
        if (v22 > 3)
        {
          -[wspQueryStatusExOut setQStatus:](self, "setQStatus:", *(unsigned int *)(v11 + v21));
          v25 += 4;
          v23 = v22 & 0xFFFFFFFFFFFFFFFCLL;
          if (v23 == 4)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.2();
          }
          else
          {
            -[wspQueryStatusExOut setCFilteredDocuments:](self, "setCFilteredDocuments:", *(unsigned int *)(v11 + v21 + 4));
            v25 += 4;
            if (v23 == 8)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.3();
            }
            else
            {
              -[wspQueryStatusExOut setCDocumentsToFilter:](self, "setCDocumentsToFilter:", *(unsigned int *)(v11 + v21 + 8));
              v25 += 4;
              if (v23 == 12)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.4();
              }
              else
              {
                -[wspQueryStatusExOut setDwRatioFinishedDenominator:](self, "setDwRatioFinishedDenominator:", *(unsigned int *)(v11 + v21 + 12));
                v25 += 4;
                if (v23 == 16)
                {
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.5();
                }
                else
                {
                  -[wspQueryStatusExOut setDwRatioFinishedNumerator:](self, "setDwRatioFinishedNumerator:", *(unsigned int *)(v11 + v21 + 16));
                  v25 += 4;
                  if (v23 == 20)
                  {
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.6();
                  }
                  else
                  {
                    -[wspQueryStatusExOut setRowsetBookMark:](self, "setRowsetBookMark:", *(unsigned int *)(v11 + v21 + 20));
                    v25 += 4;
                    if (v23 == 24)
                    {
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.7();
                    }
                    else
                    {
                      -[wspQueryStatusExOut setCRowsTotal:](self, "setCRowsTotal:", *(unsigned int *)(v11 + v21 + 24));
                      v25 += 4;
                      if (v23 == 28)
                      {
                        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                          -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.8();
                      }
                      else
                      {
                        -[wspQueryStatusExOut setMaxRank:](self, "setMaxRank:", *(unsigned int *)(v11 + v21 + 28));
                        v25 += 4;
                        if (v23 == 32)
                        {
                          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                            -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.9();
                        }
                        else
                        {
                          -[wspQueryStatusExOut setCResultsFound:](self, "setCResultsFound:", *(unsigned int *)(v11 + v21 + 32));
                          v25 += 4;
                          v24 = v21 + 36;
                          if (v23 != 36)
                          {
                            -[wspQueryStatusExOut setWhereID:](self, "setWhereID:", *(unsigned int *)(v11 + v24));
                            v13 = 0;
                            v14 = v25 + 4;
                            v25 += 4;
LABEL_6:
                            *a5 = v14;
                            goto LABEL_10;
                          }
                          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                            -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.10();
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.1();
        }
        v13 = 55;
        goto LABEL_10;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.11(self);
      v13 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.12(self);
      v13 = 5;
    }
  }
LABEL_10:

  return v13;
}

- (wspHeader)whdr
{
  return (wspHeader *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWhdr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unsigned)qStatus
{
  return self->_qStatus;
}

- (void)setQStatus:(unsigned int)a3
{
  self->_qStatus = a3;
}

- (unsigned)cFilteredDocuments
{
  return self->_cFilteredDocuments;
}

- (void)setCFilteredDocuments:(unsigned int)a3
{
  self->_cFilteredDocuments = a3;
}

- (unsigned)cDocumentsToFilter
{
  return self->_cDocumentsToFilter;
}

- (void)setCDocumentsToFilter:(unsigned int)a3
{
  self->_cDocumentsToFilter = a3;
}

- (unsigned)dwRatioFinishedDenominator
{
  return self->_dwRatioFinishedDenominator;
}

- (void)setDwRatioFinishedDenominator:(unsigned int)a3
{
  self->_dwRatioFinishedDenominator = a3;
}

- (unsigned)dwRatioFinishedNumerator
{
  return self->_dwRatioFinishedNumerator;
}

- (void)setDwRatioFinishedNumerator:(unsigned int)a3
{
  self->_dwRatioFinishedNumerator = a3;
}

- (unsigned)rowsetBookMark
{
  return self->_rowsetBookMark;
}

- (void)setRowsetBookMark:(unsigned int)a3
{
  self->_rowsetBookMark = a3;
}

- (unsigned)cRowsTotal
{
  return self->_cRowsTotal;
}

- (void)setCRowsTotal:(unsigned int)a3
{
  self->_cRowsTotal = a3;
}

- (unsigned)maxRank
{
  return self->_maxRank;
}

- (void)setMaxRank:(unsigned int)a3
{
  self->_maxRank = a3;
}

- (unsigned)cResultsFound
{
  return self->_cResultsFound;
}

- (void)setCResultsFound:(unsigned int)a3
{
  self->_cResultsFound = a3;
}

- (unsigned)whereID
{
  return self->_whereID;
}

- (void)setWhereID:(unsigned int)a3
{
  self->_whereID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whdr, 0);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode qStatus, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode cFilteredDocuments, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode cDocumentsToFilter, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode dwRatioFinishedDenominator, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode dwRatioFinishedNumerator, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode rowsetBookMark, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode cRowsTotal, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode maxRank, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode cResultsFound, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode whereID, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.11(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "whdr");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0(v2, v3);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v4, "wspQueryStatusExOut:decodeBuffer: hdr status: 0x%x\n", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.12(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "whdr");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0(v2, v3);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v4, "wspQueryStatusExOut:decodeBuffer: Unexpected MsgId: 0x%x\n", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: Failed to decode wsp header, error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExOut:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
