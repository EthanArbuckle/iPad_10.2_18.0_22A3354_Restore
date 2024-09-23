@implementation IDSIDInfoResult

- (BOOL)supportsFriendingViaPush
{
  return -[IDSIDInfoResult hasAnyDeviceSupportCapability:](self, "hasAnyDeviceSupportCapability:", IDSGameCenterSupportsFriendingViaPush);
}

- (BOOL)supportsMessageTransportV2
{
  return -[IDSIDInfoResult hasAnyDeviceSupportCapability:](self, "hasAnyDeviceSupportCapability:", IDSGameCenterSupportsMessageTransportV2);
}

- (BOOL)hasAnyDeviceSupportCapability:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDInfoResult endpoints](self, "endpoints", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "capabilities"));
        v10 = objc_msgSend(v9, "valueForCapability:", v4);

        if (v10 == (id)1)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

@end
