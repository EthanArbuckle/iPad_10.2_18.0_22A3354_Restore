@implementation NSManagedObjectContext(MTChannel)

- (id)channelForStoreId:()MTChannel
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__NSManagedObjectContext_MTChannel__channelForStoreId___block_invoke;
  v5[3] = &unk_1E54D13F8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = a1;
  objc_msgSend(a1, "performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

@end
