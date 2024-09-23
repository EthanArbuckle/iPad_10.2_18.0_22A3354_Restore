@implementation DreamworksPurseRecord

+ (id)recordNumber:(unsigned __int8)a3 recordData:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setSfi:", 4);
  objc_msgSend(v6, "setNumber:", v4);
  objc_msgSend(v6, "setData:", v5);
  objc_msgSend(v6, "setTrt:", objc_msgSend(v5, "u8:", 0));
  objc_msgSend(v6, "setBalance:", objc_msgSend(v5, "u32BE:", 2));
  objc_msgSend(v6, "setSeqnum:", objc_msgSend(v5, "u32BE:", 6));
  objc_msgSend(v6, "setAmount:", objc_msgSend(v5, "u32BE:", 10));
  objc_msgSend(v6, "setIdSam:", objc_msgSend(v5, "u64BE:", 14));
  v7 = objc_msgSend(v5, "u32BE:", 22);

  objc_msgSend(v6, "setSnSam:", v7);
  return v6;
}

+ (void)adjustRecords:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  int v14;
  _QWORD v15[5];

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 >= 2)
  {
    v5 = v4;
    v6 = 1;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __39__DreamworksPurseRecord_adjustRecords___block_invoke;
      v15[3] = &__block_descriptor_40_e31_B16__0__DreamworksPurseRecord_8l;
      v15[4] = v6;
      objc_msgSend(v3, "firstWhere:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "trt") != 1 && objc_msgSend(v8, "trt") != 64)
      {
        v9 = objc_msgSend(v8, "seqnum");
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __39__DreamworksPurseRecord_adjustRecords___block_invoke_2;
        v12[3] = &unk_1E7D8A618;
        v13 = v8;
        v14 = v9;
        objc_msgSend(v3, "firstWhere:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
          objc_msgSend(v10, "setSeqnum:", (v9 - 1));

      }
      ++v6;
    }
    while (v5 != v6);
  }

}

BOOL __39__DreamworksPurseRecord_adjustRecords___block_invoke(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) == objc_msgSend(a2, "number");
}

BOOL __39__DreamworksPurseRecord_adjustRecords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _BOOL8 v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "number");
  v5 = objc_msgSend(*(id *)(a1 + 32), "number") + 1 == v4
    && objc_msgSend(v3, "seqnum") == *(_DWORD *)(a1 + 40);

  return v5;
}

- (unsigned)trt
{
  return self->_trt;
}

- (void)setTrt:(unsigned __int8)a3
{
  self->_trt = a3;
}

- (unsigned)balance
{
  return self->_balance;
}

- (void)setBalance:(unsigned int)a3
{
  self->_balance = a3;
}

- (unsigned)amount
{
  return self->_amount;
}

- (void)setAmount:(unsigned int)a3
{
  self->_amount = a3;
}

- (unint64_t)idSam
{
  return self->_idSam;
}

- (void)setIdSam:(unint64_t)a3
{
  self->_idSam = a3;
}

- (unsigned)snSam
{
  return self->_snSam;
}

- (void)setSnSam:(unsigned int)a3
{
  self->_snSam = a3;
}

@end
