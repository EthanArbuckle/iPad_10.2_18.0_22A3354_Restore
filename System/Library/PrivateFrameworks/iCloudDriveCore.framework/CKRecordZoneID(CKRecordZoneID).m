@implementation CKRecordZoneID(CKRecordZoneID)

+ (id)brc_containerMetadataZoneID
{
  id v0;

  v0 = objc_alloc(MEMORY[0x24BDB91F8]);
  return (id)objc_msgSend(v0, "initWithZoneName:ownerName:", *MEMORY[0x24BE17540], *MEMORY[0x24BDB8E88]);
}

+ (id)brc_zoneHealthZoneID
{
  id v0;

  v0 = objc_alloc(MEMORY[0x24BDB91F8]);
  return (id)objc_msgSend(v0, "initWithZoneName:ownerName:", *MEMORY[0x24BE175C0], *MEMORY[0x24BDB8E88]);
}

+ (id)brc_sideCarZoneID
{
  id v0;

  v0 = objc_alloc(MEMORY[0x24BDB91F8]);
  return (id)objc_msgSend(v0, "initWithZoneName:ownerName:", *MEMORY[0x24BE17900], *MEMORY[0x24BDB8E88]);
}

@end
