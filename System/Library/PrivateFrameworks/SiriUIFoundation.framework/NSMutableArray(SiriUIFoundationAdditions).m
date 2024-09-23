@implementation NSMutableArray(SiriUIFoundationAdditions)

- (uint64_t)sruif_isValidIndexSetToInsert:()SiriUIFoundationAdditions
{
  id v4;
  uint64_t v5;
  _QWORD v7[6];
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v9 = objc_msgSend(a1, "count");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__NSMutableArray_SiriUIFoundationAdditions__sruif_isValidIndexSetToInsert___block_invoke;
  v7[3] = &unk_24DC1AB80;
  v7[4] = v8;
  v7[5] = &v10;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v7);
  v5 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);

  return v5;
}

@end
