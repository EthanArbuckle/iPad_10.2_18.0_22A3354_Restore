@implementation SMBNode

- (id)init:(id)a3
{
  id v4;
  SMBNode *v5;
  SMBNode *v6;
  SMBNode *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMBNode;
  v5 = -[SMBNode init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SMBNode setPd:](v5, "setPd:", v4);
    v7 = v6;
  }

  return v6;
}

- (int)commonInit:(id)a3 onShareID:(unsigned int)a4 name:(id)a5 streamName:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  int v12;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a6;
  v12 = -[SMBNode commonInit:onShareID:](self, "commonInit:onShareID:", a3, v7);
  if (!v12)
  {
    -[SMBNode setName:](self, "setName:", v10);
    -[SMBNode setStreamName:](self, "setStreamName:", v11);
  }

  return v12;
}

- (int)commonInit:(id)a3 onShareID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  int v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "getShare:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SMBNode setPd:](self, "setPd:", v6);
    -[SMBNode setShareID:](self, "setShareID:", v4);
    -[SMBNode setTreeID:](self, "setTreeID:", objc_msgSend(v7, "tree_id"));
    -[SMBNode setOnEncryptedShare:](self, "setOnEncryptedShare:", objc_msgSend(v7, "isEncrypted"));
    v8 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBNode commonInit:onShareID:].cold.1();
    v8 = 2;
  }

  return v8;
}

- (id)initForCmpd:(id)a3 onShareID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SMBNode *v7;
  SMBNode *v8;
  SMBNode *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMBNode;
  v7 = -[SMBNode init](&v11, sel_init);
  v8 = v7;
  if (v7 && !-[SMBNode commonInit:onShareID:](v7, "commonInit:onShareID:", v6, v4))
  {
    v8->_isCmpd = 1;
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)nodeForCmpd:(id)a3 onShareID:(unsigned int)a4 callBack:(id)a5
{
  uint64_t v5;
  id v7;
  SMBNode *v8;
  void (**v9)(void);

  v5 = *(_QWORD *)&a4;
  v9 = (void (**)(void))a5;
  v7 = a3;
  v8 = objc_alloc_init(SMBNode);
  LODWORD(v5) = -[SMBNode commonInit:onShareID:](v8, "commonInit:onShareID:", v7, v5);

  if (!(_DWORD)v5)
    -[SMBNode setIsCmpd:](v8, "setIsCmpd:", 1);
  v9[2]();

}

- (id)init:(smb_create *)a3 onPiston:(id)a4 onShareID:(unsigned int)a5 withName:(id)a6 withStreamName:(id)a7 callBack:(id)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  SMBNode *v18;
  SMBNode *v19;
  SMBNode *v20;
  objc_super v22;

  v11 = *(_QWORD *)&a5;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)SMBNode;
  v18 = -[SMBNode init](&v22, sel_init);
  v19 = v18;
  if (v18
    && !-[SMBNode commonInit:onShareID:name:streamName:](v18, "commonInit:onShareID:name:streamName:", v14, v11, v15, v16))
  {
    piston_create_file(v19, (uint64_t)a3, v17);
    v20 = v19;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (SMBNode)nodeWithParameters:(smb_create *)a3 onPiston:(id)a4 onShareID:(unsigned int)a5 withName:(id)a6 withStreamName:(id)a7 callBack:(id)a8
{
  uint64_t v10;
  void (**v13)(id, uint64_t, _QWORD);
  id v14;
  id v15;
  id v16;
  SMBNode *v17;
  uint64_t v18;
  SMBNode *result;
  _QWORD v20[4];
  SMBNode *v21;
  void (**v22)(id, uint64_t, _QWORD);

  v10 = *(_QWORD *)&a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a8;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = objc_alloc_init(SMBNode);
  v18 = -[SMBNode commonInit:onShareID:name:streamName:](v17, "commonInit:onShareID:name:streamName:", v16, v10, v15, v14);

  if ((_DWORD)v18)
  {
    v13[2](v13, v18, 0);
  }
  else
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __82__SMBNode_nodeWithParameters_onPiston_onShareID_withName_withStreamName_callBack___block_invoke;
    v20[3] = &unk_24FE01550;
    v22 = v13;
    v21 = v17;
    piston_create_file(v21, (uint64_t)a3, v20);

  }
  return result;
}

uint64_t __82__SMBNode_nodeWithParameters_onPiston_onShareID_withName_withStreamName_callBack___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (int)cmpdAddCreate:(smb_create *)a3 withName:(id)a4 withStreamName:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  id v28;
  void *v29;
  Class *v30;
  Class v31;
  id v32;
  id v33;

  v8 = a4;
  v9 = a5;
  if (!self->_isCmpd)
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      -[SMBNode cmpdAddCreate:withName:withStreamName:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_7;
  }
  if (self->_marshallPos >= 5)
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      -[SMBNode cmpdAddCreate:withName:withStreamName:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_7:
    v26 = 12;
    goto LABEL_8;
  }
  -[SMBNode setName:](self, "setName:", v8);
  -[SMBNode setStreamName:](self, "setStreamName:", v9);
  v33 = 0;
  v26 = smb2_smb_create(self, (uint64_t)a3, 0, &v33, 0);
  v28 = v33;
  v29 = v28;
  if (v26 || !v28)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBNode cmpdAddCreate:withName:withStreamName:].cold.3();

  }
  else
  {
    v30 = &self->super.isa + self->_marshallPos;
    v31 = v30[1];
    v30[1] = (Class)v28;
    v32 = v28;

    -[SMBNode updateCmpdHdr](self, "updateCmpdHdr");
    v26 = 0;
  }
LABEL_8:

  return v26;
}

- (int)cmpdParseCreate:(smb_create *)a3
{
  int result;
  __n128 *v6;
  unsigned int v7;

  v7 = 0;
  v6 = 0;
  result = -[SMBNode parseNextHeader:retNTStatus:retMdpp:](self, "parseNextHeader:retNTStatus:retMdpp:", 5, &v7, &v6);
  a3->var10 = v7;
  if (!result)
  {
    result = smb2_smb_parse_create(self, v6, (uint64_t)a3, 0);
    if (!result)
    {
      -[SMBNode setFid:](self, "setFid:", a3->var22.var0, a3->var22.var1);
      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  SMBPiston *pd;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t i;
  void *v9;
  void *v10;
  objc_super v11;
  _OWORD v12[4];

  memset(v12, 0, sizeof(v12));
  if (self->_isOpen)
  {
    pd = self->_pd;
    if (pd)
    {
      -[SMBPiston sock](pd, "sock");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        -[SMBPiston sock](self->_pd, "sock");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "writeEnabled");

        if (v7 == 1)
          -[SMBNode close:withFlags:callBack:](self, "close:withFlags:callBack:", v12, 0, 0);
      }
    }
  }
  if (self->_isCmpd)
  {
    for (i = 8; i != 48; i += 8)
    {
      v9 = *(Class *)((char *)&self->super.isa + i);
      if (v9)
      {
        objc_msgSend(v9, "smb_rq_done");
        v10 = *(Class *)((char *)&self->super.isa + i);
        *(Class *)((char *)&self->super.isa + i) = 0;

      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SMBNode;
  -[SMBNode dealloc](&v11, sel_dealloc);
}

- (void)close:(smb_close *)a3 withFlags:(unsigned __int16)a4 callBack:(id)a5
{
  piston_close_file(self, a4, a3, a5);
}

- (int)cmpdAddClose:(smb_close *)a3 withFlags:(unsigned __int16)a4
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v23;
  void *v24;
  Class *v25;
  Class v26;
  id v27;
  id v28;

  if (!self->_isCmpd)
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
      -[SMBNode cmpdAddClose:withFlags:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    return 12;
  }
  if (self->_marshallPos >= 5)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      -[SMBNode cmpdAddClose:withFlags:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
    return 12;
  }
  v28 = 0;
  v21 = smb2_smb_close(self, a4, a3, &v28, 0);
  v23 = v28;
  v24 = v23;
  if (v21 || !v23)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBNode cmpdAddClose:withFlags:].cold.3();

  }
  else
  {
    v25 = &self->super.isa + self->_marshallPos;
    v26 = v25[1];
    v25[1] = (Class)v23;
    v27 = v23;

    -[SMBNode updateCmpdHdr](self, "updateCmpdHdr");
    return 0;
  }
  return v21;
}

- (int)cmpdParseClose:(smb_close *)a3 withFlags:(unsigned __int16)a4
{
  char v4;
  int result;
  _QWORD *v8;
  unsigned int v9;

  v4 = a4;
  v9 = 0;
  v8 = 0;
  result = -[SMBNode parseNextHeader:retNTStatus:retMdpp:](self, "parseNextHeader:retNTStatus:retMdpp:", 6, &v9, &v8);
  a3->var0 = v9;
  if (!result)
  {
    result = smb2_smb_parse_close(v8, v4 & 1, (uint64_t)a3);
    if (!result)
    {
      -[SMBNode setIsOpen:](self, "setIsOpen:", 0);
      return 0;
    }
  }
  return result;
}

- (void)flush:(smb_flush *)a3 callBack:(id)a4
{
  piston_flush(self, a3, a4);
}

- (void)read:(smb_read_write *)a3 intoBuffer:(id)a4 callBack:(id)a5
{
  piston_read(self, (uint64_t)a3, a4, 0, a5);
}

- (int)cmpdAddRead:(smb_read_write *)a3 intoBuffer:(id)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v25;
  void *v26;
  Class *v27;
  Class v28;
  id v29;
  id v30;

  v6 = a4;
  if (!self->_isCmpd)
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      -[SMBNode cmpdAddRead:intoBuffer:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_7;
  }
  if (self->_marshallPos >= 5)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      -[SMBNode cmpdAddRead:intoBuffer:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
LABEL_7:
    v23 = 12;
    goto LABEL_8;
  }
  v30 = 0;
  v23 = smb2_smb_read_one(self, (uint64_t)a3, v6, &v30, 0);
  v25 = v30;
  v26 = v25;
  if (v23 || !v25)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBNode cmpdAddRead:intoBuffer:].cold.3();

  }
  else
  {
    v27 = &self->super.isa + self->_marshallPos;
    v28 = v27[1];
    v27[1] = (Class)v25;
    v29 = v25;

    -[SMBNode updateCmpdHdr](self, "updateCmpdHdr");
    v23 = 0;
  }
LABEL_8:

  return v23;
}

- (int)cmpdParseRead:(smb_read_write *)a3 intoBuffer:(id)a4
{
  id v6;
  int one;
  _QWORD *v9;
  unsigned int v10;

  v6 = a4;
  v10 = 0;
  v9 = 0;
  one = -[SMBNode parseNextHeader:retNTStatus:retMdpp:](self, "parseNextHeader:retNTStatus:retMdpp:", 8, &v10, &v9);
  a3->var4 = v10;
  if (!one)
    one = smb2_smb_parse_read_one(v9, (uint64_t)a3);

  return one;
}

- (void)write:(smb_read_write *)a3 fromBuffer:(id)a4 callBack:(id)a5
{
  piston_write(self, (uint64_t)a3, 0, a4, a5);
}

- (int)cmpdAddWrite:(smb_read_write *)a3 fromBuffer:(id)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v25;
  void *v26;
  Class *v27;
  Class v28;
  id v29;
  id v30;

  v6 = a4;
  if (!self->_isCmpd)
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      -[SMBNode cmpdAddWrite:fromBuffer:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_7;
  }
  if (self->_marshallPos >= 5)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      -[SMBNode cmpdAddWrite:fromBuffer:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
LABEL_7:
    v23 = 12;
    goto LABEL_8;
  }
  v30 = 0;
  v23 = smb2_smb_write_one(self, (uint64_t)a3, v6, &v30, 0);
  v25 = v30;
  v26 = v25;
  if (v23 || !v25)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBNode cmpdAddWrite:fromBuffer:].cold.3();

  }
  else
  {
    v27 = &self->super.isa + self->_marshallPos;
    v28 = v27[1];
    v27[1] = (Class)v25;
    v29 = v25;

    -[SMBNode updateCmpdHdr](self, "updateCmpdHdr");
    v23 = 0;
  }
LABEL_8:

  return v23;
}

- (int)cmpdParseWrite:(smb_read_write *)a3
{
  int result;
  _QWORD *v5;
  unsigned int v6;

  v6 = 0;
  v5 = 0;
  result = -[SMBNode parseNextHeader:retNTStatus:retMdpp:](self, "parseNextHeader:retNTStatus:retMdpp:", 9, &v6, &v5);
  a3->var4 = v6;
  if (!result)
    return smb2_smb_parse_write_one(v5, (uint64_t)a3);
  return result;
}

- (void)lockUnlock:(smb_lock *)a3 callBack:(id)a4
{
  piston_lock(self, (int *)a3, a4);
}

- (void)ioctl:(smb_ioctl *)a3 getReparsePoint:(id)a4 callBack:(id)a5
{
  piston_ioctl(0, self, 0, (uint64_t)a3, 0, 0, a4, 0, 0, a5);
}

- (void)ioctl:(smb_ioctl *)a3 setReparsePoint:(id)a4 callBack:(id)a5
{
  piston_ioctl(0, self, 0, (uint64_t)a3, 0, 0, a4, 0, 0, a5);
}

- (void)ioctl:(smb_ioctl *)a3 pipeTransceive:(id)a4 withRecvData:(id)a5 callBack:(id)a6
{
  piston_ioctl(0, self, 0, (uint64_t)a3, a4, a5, 0, 0, 0, a6);
}

- (int)cmpdAddIoctl:(smb_ioctl *)a3 getReparsePoint:(id)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  void *v17;
  Class *v18;
  Class v19;
  id v20;
  id v22;

  v6 = a4;
  if (!self->_isCmpd)
    self->_isCmpd = 1;
  if (self->_marshallPos < 5)
  {
    v22 = 0;
    v15 = smb2_smb_ioctl(0, self, 0, (uint64_t)a3, v6, 0, 0, 0, 0, &v22, 0);
    v16 = v22;
    v17 = v16;
    if (v15 || !v16)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[SMBNode cmpdAddIoctl:getReparsePoint:].cold.2();

    }
    else
    {
      v18 = &self->super.isa + self->_marshallPos;
      v19 = v18[1];
      v18[1] = (Class)v16;
      v20 = v16;

      -[SMBNode updateCmpdHdr](self, "updateCmpdHdr");
      v15 = 0;
    }
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      -[SMBNode cmpdAddIoctl:getReparsePoint:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = 12;
  }

  return v15;
}

- (int)cmpdAddIoctl:(smb_ioctl *)a3 setReparsePoint:(id)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  void *v17;
  Class *v18;
  Class v19;
  id v20;
  id v22;

  v6 = a4;
  if (!self->_isCmpd)
    self->_isCmpd = 1;
  if (self->_marshallPos < 5)
  {
    v22 = 0;
    v15 = smb2_smb_ioctl(0, self, 0, (uint64_t)a3, v6, 0, 0, 0, 0, &v22, 0);
    v16 = v22;
    v17 = v16;
    if (v15 || !v16)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[SMBNode cmpdAddIoctl:setReparsePoint:].cold.2();

    }
    else
    {
      v18 = &self->super.isa + self->_marshallPos;
      v19 = v18[1];
      v18[1] = (Class)v16;
      v20 = v16;

      -[SMBNode updateCmpdHdr](self, "updateCmpdHdr");
      v15 = 0;
    }
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      -[SMBNode cmpdAddIoctl:setReparsePoint:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = 12;
  }

  return v15;
}

- (int)cmpdAddIoctl:(smb_ioctl *)a3 pipeTransceive:(id)a4 withRecvData:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  void *v20;
  Class *v21;
  Class v22;
  id v23;
  id v25;

  v8 = a4;
  v9 = a5;
  if (!self->_isCmpd)
    self->_isCmpd = 1;
  if (self->_marshallPos < 5)
  {
    v25 = 0;
    v18 = smb2_smb_ioctl(0, self, 0, (uint64_t)a3, 0, v8, v9, 0, 0, &v25, 0);
    v19 = v25;
    v20 = v19;
    if (v18 || !v19)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[SMBNode cmpdAddIoctl:pipeTransceive:withRecvData:].cold.2();

    }
    else
    {
      v21 = &self->super.isa + self->_marshallPos;
      v22 = v21[1];
      v21[1] = (Class)v19;
      v23 = v19;

      -[SMBNode updateCmpdHdr](self, "updateCmpdHdr");
      v18 = 0;
    }
  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      -[SMBNode cmpdAddIoctl:pipeTransceive:withRecvData:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    v18 = 12;
  }

  return v18;
}

- (int)cmpdParseIoctl:(smb_ioctl *)a3 reparsePoint:(id)a4 sendInputBuffer:(id)a5 rcvOutputBuffer:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  _QWORD *v15;
  unsigned int v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16 = 0;
  v15 = 0;
  v13 = -[SMBNode parseNextHeader:retNTStatus:retMdpp:](self, "parseNextHeader:retNTStatus:retMdpp:", 11, &v16, &v15);
  a3->var3 = v16;
  if (!v13)
    v13 = smb2_smb_parse_ioctl(self, v15, (uint64_t)a3, v10, v11, v12);

  return v13;
}

- (void)queryDirectory:(smb_query_dir *)a3 onDir:(id)a4 returnDataIn:(id)a5 callBack:(id)a6
{
  piston_query_dir(self, (uint64_t)a3, a4, a5, a6);
}

- (int)cmpdAddQueryDirectory:(smb_query_dir *)a3 onDir:(id)a4 returnDataIn:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  id v28;
  void *v29;
  Class *v30;
  Class v31;
  id v32;
  id v33;

  v8 = a4;
  v9 = a5;
  if (!self->_isCmpd)
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      -[SMBNode cmpdAddQueryDirectory:onDir:returnDataIn:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_7;
  }
  if (self->_marshallPos >= 5)
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      -[SMBNode cmpdAddQueryDirectory:onDir:returnDataIn:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_7:
    v26 = 12;
    goto LABEL_8;
  }
  v33 = 0;
  v26 = smb2_smb_query_dir(self, (uint64_t)a3, v8, v9, 0, &v33, 0);
  v28 = v33;
  v29 = v28;
  if (v26 || !v28)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBNode cmpdAddQueryDirectory:onDir:returnDataIn:].cold.3();

  }
  else
  {
    v30 = &self->super.isa + self->_marshallPos;
    v31 = v30[1];
    v30[1] = (Class)v28;
    v32 = v28;

    -[SMBNode updateCmpdHdr](self, "updateCmpdHdr");
    v26 = 0;
  }
LABEL_8:

  return v26;
}

- (int)cmpdParseQueryDirectory:(smb_query_dir *)a3 returnDataIn:(id)a4
{
  id v6;
  int dir;
  _QWORD *v9;
  unsigned int v10;

  v6 = a4;
  v10 = 0;
  v9 = 0;
  dir = -[SMBNode parseNextHeader:retNTStatus:retMdpp:](self, "parseNextHeader:retNTStatus:retMdpp:", 14, &v10, &v9);
  a3->ntStatus = v10;
  if (!dir)
    dir = smb2_smb_parse_query_dir(v9, (uint64_t)a3, v6, 0);

  return dir;
}

- (void)changeNotify:(smb_change_notify *)a3 withFlags:(unsigned __int16)a4 withFilter:(unsigned int)a5 returnDataIn:(id)a6 callBack:(id)a7
{
  piston_change_notify(self, a3, a4, a5, a6, a7);
}

- (void)queryInformation:(smb_query_info *)a3 withStreamName:(id)a4 forFileAllInfo:(id)a5 withInputBuffer:(id)a6 withOutputBuffer:(id)a7 callBack:(id)a8
{
  piston_query_info(self, &a3->var0, a4, a5, a6, a7, a8);
}

- (int)cmpdAddQueryInformation:(smb_query_info *)a3 withStreamName:(id)a4 forFileAllInfo:(id)a5 withInputBuffer:(id)a6 withOutputBuffer:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  id v34;
  void *v35;
  Class *v36;
  Class v37;
  id v38;
  id v39;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!self->_isCmpd)
  {
    v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v24)
      -[SMBNode cmpdAddQueryInformation:withStreamName:forFileAllInfo:withInputBuffer:withOutputBuffer:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_7;
  }
  if (self->_marshallPos >= 5)
  {
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v16)
      -[SMBNode cmpdAddQueryInformation:withStreamName:forFileAllInfo:withInputBuffer:withOutputBuffer:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_7:
    v32 = 12;
    goto LABEL_8;
  }
  v39 = 0;
  v32 = smb2_smb_query_info(self, &a3->var0, v12, v13, v14, v15, &v39, 0);
  v34 = v39;
  v35 = v34;
  if (v32 || !v34)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBNode cmpdAddQueryInformation:withStreamName:forFileAllInfo:withInputBuffer:withOutputBuffer:].cold.3();

  }
  else
  {
    v36 = &self->super.isa + self->_marshallPos;
    v37 = v36[1];
    v36[1] = (Class)v34;
    v38 = v34;

    -[SMBNode updateCmpdHdr](self, "updateCmpdHdr");
    v32 = 0;
  }
LABEL_8:

  return v32;
}

- (int)cmpdParseQueryInformation:(smb_query_info *)a3 withStreamName:(id)a4 forFileAllInfo:(id)a5 withOutputBuffer:(id)a6
{
  id v10;
  id v11;
  id v12;
  int info;
  _QWORD *v15;
  unsigned int v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16 = 0;
  v15 = 0;
  info = -[SMBNode parseNextHeader:retNTStatus:retMdpp:](self, "parseNextHeader:retNTStatus:retMdpp:", 16, &v16, &v15);
  a3->var4 = v16;
  if (!info)
    info = smb2_smb_parse_query_info(self, v15, &a3->var0, v10, v11, v12);

  return info;
}

- (void)setInformation:(smb_setinfo *)a3 withInputBuffer:(id)a4 withRenameTarget:(id)a5 callBack:(id)a6
{
  piston_set_info(self, (uint64_t)a3, a4, a5, a6);
}

- (int)cmpdAddSetInformation:(smb_setinfo *)a3 withInputBuffer:(id)a4 withRenameTarget:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  void *v20;
  Class *v21;
  Class v22;
  id v23;
  id v25;

  v8 = a4;
  v9 = a5;
  if (!self->_isCmpd)
    self->_isCmpd = 1;
  if (self->_marshallPos < 5)
  {
    v25 = 0;
    v18 = smb2_smb_set_info(self, (uint64_t)a3, v8, v9, &v25, 0);
    v19 = v25;
    v20 = v19;
    if (v18 || !v19)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[SMBNode cmpdAddSetInformation:withInputBuffer:withRenameTarget:].cold.2();

    }
    else
    {
      v21 = &self->super.isa + self->_marshallPos;
      v22 = v21[1];
      v21[1] = (Class)v19;
      v23 = v19;

      -[SMBNode updateCmpdHdr](self, "updateCmpdHdr");
      v18 = 0;
    }
  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      -[SMBNode cmpdAddSetInformation:withInputBuffer:withRenameTarget:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    v18 = 12;
  }

  return v18;
}

- (int)cmpdParseSetInformation:(smb_setinfo *)a3
{
  int result;
  uint64_t v5;
  unsigned int v6;

  v6 = 0;
  v5 = 0;
  result = -[SMBNode parseNextHeader:retNTStatus:retMdpp:](self, "parseNextHeader:retNTStatus:retMdpp:", 17, &v6, &v5);
  a3->var8 = v6;
  return result;
}

- (int)updateCmpdHdr
{
  unsigned int marshallPos;
  SMB_rq **rqp;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int result;

  if (self->_isCmpd)
  {
    marshallPos = self->_marshallPos;
    if (marshallPos)
    {
      rqp = self->rqp;
      v5 = objc_msgSend(*((id *)&self->super.isa + marshallPos), "writeLen");
      v6 = v5;
      if ((v5 & 7) != 0)
        v6 = (v5 & 0xFFFFFFF8) + 8;
      if (v5)
        v7 = v6;
      else
        v7 = 0;
      -[SMB_rq smb_rq_set_sr_nextcmdp:](rqp[self->_marshallPos - 1], "smb_rq_set_sr_nextcmdp:", v7);
      -[SMB_rq setSr_next_rqp:](rqp[self->_marshallPos - 1], "setSr_next_rqp:", rqp[self->_marshallPos]);
      -[SMB_rq smb_rq_set_srflagsp:](rqp[self->_marshallPos], "smb_rq_set_srflagsp:", 4);
      v8 = self->_marshallPos + 1;
    }
    else
    {
      v8 = 1;
    }
    result = 0;
    self->_marshallPos = v8;
  }
  else
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      -[SMBNode updateCmpdHdr].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    return 22;
  }
  return result;
}

- (int)parseNextHeader:(unsigned __int16)a3 retNTStatus:(unsigned int *)a4 retMdpp:(mdchain *)a5
{
  unsigned int *p_parsePos;
  SMB_rq **rqp;
  SMB_rq *v8;
  uint64_t v11;
  mdchain *v12;
  int command;
  int v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int mem;
  uint64_t v44;
  NSObject *v45;
  void **v46;
  int v47;
  __int128 *v48;
  __int128 v49;
  int v50;
  BOOL v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v62;
  __int128 *v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  uint64_t v71;
  _OWORD __dst[4];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v64 = 0u;
  v65 = 0u;
  v63 = &v64;
  memset(__dst, 0, sizeof(__dst));
  if (!self->_isCmpd)
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    return 22;
  }
  p_parsePos = &self->_parsePos;
  rqp = self->rqp;
  v8 = self->rqp[self->_parsePos];
  if (!v8)
  {
    v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v23)
      -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);
    return 22;
  }
  if (-[SMB_rq sr_command](v8, "sr_command") != a3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.8(p_parsePos, (uint64_t)rqp);
    return 22;
  }
  v11 = *p_parsePos;
  if ((_DWORD)v11)
  {
    if (!rqp[(v11 - 1)])
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.5((uint64_t)p_parsePos, v36, v37, v38, v39, v40, v41, v42);
      return 22;
    }
    if ((-[SMB_rq sr_extflags](rqp[v11], "sr_extflags") & 2) != 0)
    {
      v12 = -[SMB_rq smb_rq_getreply](rqp[*p_parsePos], "smb_rq_getreply");
      *a5 = v12;
    }
    else
    {
      v12 = -[SMB_rq smb_rq_getreply](self->rqp[0], "smb_rq_getreply");
      *a5 = v12;
      command = smb2_rq_next_command(rqp[self->_parsePos - 1], &self->_cmpdNextCmdOffset, v12);
      if (command)
      {
        v14 = command;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.7(p_parsePos, (uint64_t)rqp);
        return v14;
      }
    }
    mem = md_get_mem(v12, (char *)__dst, 64, 0);
    if (mem)
    {
      v14 = mem;
      if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.6(p_parsePos, (uint64_t)rqp);
    }
    else
    {
      v14 = -[SMB_rq replyError](rqp[*p_parsePos], "replyError");
      *a4 = -[SMB_rq sr_ntstatus](rqp[(*p_parsePos)++], "sr_ntstatus");
    }
  }
  else
  {
    v32 = -[SMB_rq smb_rq_getreply](*rqp, "smb_rq_getreply");
    *a5 = (mdchain *)v32;
    v33 = *(_OWORD *)(v32 + 16);
    v64 = *(_OWORD *)v32;
    v65 = v33;
    v35 = -[SMB_rq sr_command](*rqp, "sr_command") == 5 && -[SMB_rq replyError](*rqp, "replyError") == 0;
    if (self->_marshallPos >= 2)
    {
      v44 = 1;
      v45 = MEMORY[0x24BDACB70];
      *(_QWORD *)&v34 = 136315650;
      v62 = v34;
      v46 = (void **)rqp;
      do
      {
        if ((objc_msgSend(v46[1], "sr_extflags", v62) & 2) != 0)
        {
          v48 = (__int128 *)objc_msgSend(v46[1], "smb_rq_getreply");
          v49 = v48[1];
          v64 = *v48;
          v65 = v49;
        }
        else
        {
          if (!*v46)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.3(v44, v54, v55, v56, v57, v58, v59, v60);
            return 22;
          }
          v47 = smb2_rq_next_command(*v46, &self->_cmpdNextCmdOffset, &v64);
          if (v47)
          {
            v14 = v47;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.4(v46);
            return v14;
          }
        }
        v50 = smb2_rq_parse_header(v46[1], &v63);
        if (v50)
          v51 = piston_log_level == 0;
        else
          v51 = 1;
        if (!v51)
        {
          v52 = v50;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v53 = objc_msgSend(v46[1], "sr_messageid");
            *(_DWORD *)buf = v62;
            v67 = "-[SMBNode parseNextHeader:retNTStatus:retMdpp:]";
            v68 = 1024;
            v69 = v52;
            v70 = 2048;
            v71 = v53;
            _os_log_error_impl(&dword_23028F000, v45, OS_LOG_TYPE_ERROR, "%s: smb2_rq_parse_header failed %d, id %lld\n", buf, 0x1Cu);
          }
        }
        if (objc_msgSend(v46[1], "sr_command") == 5 && !objc_msgSend(v46[1], "replyError"))
          ++v35;
        if (objc_msgSend(v46[1], "sr_command") == 6)
          v35 = (__PAIR64__(v35, objc_msgSend(v46[1], "replyError")) - 1) >> 32;
        ++v44;
        ++v46;
      }
      while (self->_marshallPos > v44);
    }
    if (v35 >= 1)
      -[SMBNode setIsOpen:](self, "setIsOpen:", 1);
    self->_cmpdNextCmdOffset = 0;
    v14 = -[SMB_rq replyError](rqp[self->_parsePos], "replyError");
    *a4 = -[SMB_rq sr_ntstatus](rqp[self->_parsePos++], "sr_ntstatus");
  }
  return v14;
}

- (void)sendCmpdRequest:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  SMB_rq *v6;
  void (**v7)(id, uint64_t);
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  void (**v18)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (!self->_isCmpd)
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
    {
      -[SMBNode sendCmpdRequest:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
      if (!v4)
        goto LABEL_10;
    }
    else if (!v4)
    {
      goto LABEL_10;
    }
    v4[2](v4, 22);
    goto LABEL_10;
  }
  -[SMBNode pd](self, "pd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->rqp[0];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __27__SMBNode_sendCmpdRequest___block_invoke;
  v17[3] = &unk_24FE01550;
  v7 = v4;
  v17[4] = self;
  v18 = v7;
  v8 = smb_rq_simple_block(v5, v6, v17);

  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[SMBNode sendCmpdRequest:].cold.2();
      if (!v7)
        goto LABEL_6;
      goto LABEL_5;
    }
    if (v7)
LABEL_5:
      v7[2](v7, v8);
  }
LABEL_6:

LABEL_10:
}

void __27__SMBNode_sendCmpdRequest___block_invoke(uint64_t a1, int a2)
{
  void (**v4)(_QWORD, _QWORD);

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 40));
  if (a2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __27__SMBNode_sendCmpdRequest___block_invoke_cold_1(a1);
    if (!v4)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (v4)
LABEL_4:
    v4[2](v4, 0);
LABEL_5:

}

- (int)resetCmpdRequest
{
  uint64_t i;
  void *v4;
  void *v5;
  int result;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (self->_isCmpd)
  {
    for (i = 8; i != 48; i += 8)
    {
      v4 = *(Class *)((char *)&self->super.isa + i);
      if (v4)
      {
        objc_msgSend(v4, "smb_rq_done");
        v5 = *(Class *)((char *)&self->super.isa + i);
        *(Class *)((char *)&self->super.isa + i) = 0;

      }
    }
    result = 0;
    self->_marshallPos = 0;
    self->_parsePos = 0;
    self->_cmpdNextCmdOffset = 0;
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      -[SMBNode resetCmpdRequest].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    return 12;
  }
  return result;
}

- (SMBPiston)pd
{
  return (SMBPiston *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unsigned)shareID
{
  return self->_shareID;
}

- (void)setShareID:(unsigned int)a3
{
  self->_shareID = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)streamName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStreamName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)fid
{
  unint64_t v2;
  unint64_t v3;
  _QWORD v4[2];
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  objc_copyStruct(v4, &self->_fid, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setFid:(id)a3
{
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v3;

  v3 = a3;
  objc_copyStruct(&self->_fid, &v3, 16, 1, 0);
}

- (unsigned)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(unsigned int)a3
{
  self->_isOpen = a3;
}

- (int)isCmpd
{
  return self->_isCmpd;
}

- (void)setIsCmpd:(int)a3
{
  self->_isCmpd = a3;
}

- (unsigned)marshallPos
{
  return self->_marshallPos;
}

- (void)setMarshallPos:(unsigned int)a3
{
  self->_marshallPos = a3;
}

- (unsigned)parsePos
{
  return self->_parsePos;
}

- (void)setParsePos:(unsigned int)a3
{
  self->_parsePos = a3;
}

- (unint64_t)cmpdNextCmdOffset
{
  return self->_cmpdNextCmdOffset;
}

- (void)setCmpdNextCmdOffset:(unint64_t)a3
{
  self->_cmpdNextCmdOffset = a3;
}

- (unsigned)treeID
{
  return self->_treeID;
}

- (void)setTreeID:(unsigned int)a3
{
  self->_treeID = a3;
}

- (unsigned)onEncryptedShare
{
  return self->_onEncryptedShare;
}

- (void)setOnEncryptedShare:(unsigned int)a3
{
  self->_onEncryptedShare = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pd, 0);
  v3 = 40;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (void)commonInit:onShareID:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddCreate:(uint64_t)a3 withName:(uint64_t)a4 withStreamName:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Not initialized as compound request \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddCreate:(uint64_t)a3 withName:(uint64_t)a4 withStreamName:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Compound chain too long \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddCreate:withName:withStreamName:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_create failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddClose:(uint64_t)a3 withFlags:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Not initialized as compound request \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddClose:(uint64_t)a3 withFlags:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Compound chain too long \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddClose:withFlags:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_close failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddRead:(uint64_t)a3 intoBuffer:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Not initialized as compound request \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddRead:(uint64_t)a3 intoBuffer:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Compound chain too long \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddRead:intoBuffer:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_read_one failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddWrite:(uint64_t)a3 fromBuffer:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Not initialized as compound request \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddWrite:(uint64_t)a3 fromBuffer:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Compound chain too long \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddWrite:fromBuffer:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_write_one failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddIoctl:(uint64_t)a3 getReparsePoint:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Compound chain too long \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddIoctl:getReparsePoint:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_ioctl failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddIoctl:(uint64_t)a3 setReparsePoint:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Compound chain too long \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddIoctl:setReparsePoint:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_ioctl failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddIoctl:(uint64_t)a3 pipeTransceive:(uint64_t)a4 withRecvData:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Compound chain too long \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddIoctl:pipeTransceive:withRecvData:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_ioctl failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddQueryDirectory:(uint64_t)a3 onDir:(uint64_t)a4 returnDataIn:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Not initialized as compound request \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddQueryDirectory:(uint64_t)a3 onDir:(uint64_t)a4 returnDataIn:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Compound chain too long \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddQueryDirectory:onDir:returnDataIn:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_query_dir failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddQueryInformation:(uint64_t)a3 withStreamName:(uint64_t)a4 forFileAllInfo:(uint64_t)a5 withInputBuffer:(uint64_t)a6 withOutputBuffer:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Not initialized as compound request \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddQueryInformation:(uint64_t)a3 withStreamName:(uint64_t)a4 forFileAllInfo:(uint64_t)a5 withInputBuffer:(uint64_t)a6 withOutputBuffer:(uint64_t)a7 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Compound chain too long \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddQueryInformation:withStreamName:forFileAllInfo:withInputBuffer:withOutputBuffer:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_query_info failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddSetInformation:(uint64_t)a3 withInputBuffer:(uint64_t)a4 withRenameTarget:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Compound chain too long \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cmpdAddSetInformation:withInputBuffer:withRenameTarget:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_set_info failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateCmpdHdr
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Not a compound request \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)parseNextHeader:(uint64_t)a3 retNTStatus:(uint64_t)a4 retMdpp:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Not a compound request \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)parseNextHeader:(uint64_t)a3 retNTStatus:(uint64_t)a4 retMdpp:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Current response is NULL \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)parseNextHeader:(uint64_t)a3 retNTStatus:(uint64_t)a4 retMdpp:(uint64_t)a5 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Previous response is NULL [%d]? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)parseNextHeader:(id *)a1 retNTStatus:retMdpp:.cold.4(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(*a1, "sr_messageid");
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: smb2_rq_next_command failed %d id %lld\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6_0();
}

- (void)parseNextHeader:(uint64_t)a3 retNTStatus:(uint64_t)a4 retMdpp:(uint64_t)a5 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Previous response is NULL [%d]? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)parseNextHeader:(unsigned int *)a1 retNTStatus:(uint64_t)a2 retMdpp:.cold.6(unsigned int *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a2 + 8 * *a1), "sr_messageid");
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], v2, "%s: md_get_mem failed %d, id %lld\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_6_0();
}

- (void)parseNextHeader:(_DWORD *)a1 retNTStatus:(uint64_t)a2 retMdpp:.cold.7(_DWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a2 + 8 * (*a1 - 1)), "sr_messageid");
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], v2, "%s: smb2_rq_next_command failed %d id %lld\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_6_0();
}

- (void)parseNextHeader:(unsigned int *)a1 retNTStatus:(uint64_t)a2 retMdpp:.cold.8(unsigned int *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a2 + 8 * *a1), "sr_command");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v2, "%s: Current reply doesn't match command %d != %d \n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)sendCmpdRequest:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Not a compound request \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendCmpdRequest:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __27__SMBNode_sendCmpdRequest___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sr_ntstatus");
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)resetCmpdRequest
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Not initialized as compound request \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
