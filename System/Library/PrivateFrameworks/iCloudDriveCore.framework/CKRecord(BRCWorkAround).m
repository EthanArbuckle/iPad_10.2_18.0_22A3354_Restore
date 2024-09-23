@implementation CKRecord(BRCWorkAround)

+ (id)brc_fakeRecordWithErrorMarkerFor20716676
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:", CFSTR("BRCFakeRecordWithErrorMarkerFor20716676"));
}

- (uint64_t)brc_isfakeRecordWithErrorMarkerFor20716676
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "recordType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("BRCFakeRecordWithErrorMarkerFor20716676"));

  return v2;
}

@end
