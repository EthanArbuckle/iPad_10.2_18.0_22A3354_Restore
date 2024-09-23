@implementation PPTransaction

void __49__PPTransaction_readTransactionWithHandle_block___block_invoke(uint64_t a1)
{
  uint64_t v1;
  PPReadTransaction *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[PPReadTransaction initWithHandle:]([PPReadTransaction alloc], "initWithHandle:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, PPReadTransaction *))(v1 + 16))(v1, v2);

}

void __50__PPTransaction_writeTransactionWithHandle_block___block_invoke(uint64_t a1)
{
  uint64_t v1;
  PPWriteTransaction *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[PPWriteTransaction initWithHandle:]([PPWriteTransaction alloc], "initWithHandle:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, PPWriteTransaction *))(v1 + 16))(v1, v2);

}

+ (void)writeTransactionWithHandle:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PPTransaction_writeTransactionWithHandle_block___block_invoke;
  v9[3] = &unk_1E7E1D3B0;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "writeTransaction:", v9);

}

+ (void)readTransactionWithHandle:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PPTransaction_readTransactionWithHandle_block___block_invoke;
  v9[3] = &unk_1E7E1D3B0;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "readTransaction:", v9);

}

@end
