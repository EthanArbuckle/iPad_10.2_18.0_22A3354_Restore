@implementation PASSqliteTransaction

uint64_t __66___PASSqliteTransaction_writeTransactionWithHandle_failableBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _PASSqlWriteTransaction *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[_PASSqlWriteTransaction initWithHandle:]([_PASSqlWriteTransaction alloc], "initWithHandle:", *(_QWORD *)(a1 + 32));
  v3 = (*(uint64_t (**)(uint64_t, _PASSqlWriteTransaction *))(v1 + 16))(v1, v2);

  return v3;
}

uint64_t __65___PASSqliteTransaction_readTransactionWithHandle_failableBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _PASSqlReadTransaction *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[_PASSqlReadTransaction initWithHandle:]([_PASSqlReadTransaction alloc], "initWithHandle:", *(_QWORD *)(a1 + 32));
  v3 = (*(uint64_t (**)(uint64_t, _PASSqlReadTransaction *))(v1 + 16))(v1, v2);

  return v3;
}

void __58___PASSqliteTransaction_writeTransactionWithHandle_block___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _PASSqlWriteTransaction *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[_PASSqlWriteTransaction initWithHandle:]([_PASSqlWriteTransaction alloc], "initWithHandle:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, _PASSqlWriteTransaction *))(v1 + 16))(v1, v2);

}

void __57___PASSqliteTransaction_readTransactionWithHandle_block___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _PASSqlReadTransaction *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[_PASSqlReadTransaction initWithHandle:]([_PASSqlReadTransaction alloc], "initWithHandle:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, _PASSqlReadTransaction *))(v1 + 16))(v1, v2);

}

@end
