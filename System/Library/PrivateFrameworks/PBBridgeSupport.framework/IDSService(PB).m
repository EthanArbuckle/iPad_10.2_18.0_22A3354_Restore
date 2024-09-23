@implementation IDSService(PB)

- (id)pb_mineTinkerDevices
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "linkedDevicesWithRelationship:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "linkedDevicesWithRelationship:", 2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v2 | v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend((id)v3, "count") + objc_msgSend((id)v2, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v2)
      objc_msgSend(v4, "addObjectsFromArray:", v2);
    if (v3)
      objc_msgSend(v5, "addObjectsFromArray:", v3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)pb_defaultPairedDeviceIDIncludingTinkerDevices
{
  return (id)*MEMORY[0x24BE4FD60];
}

@end
