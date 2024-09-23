@implementation SFDevice

- (BOOL)cad_matchesDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice idsIdentifier](self, "idsIdentifier"));
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice identifier](self, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    if ((objc_msgSend(v8, "isEqualToString:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice rapportIdentifier](self, "rapportIdentifier"));
      v6 = objc_msgSend(v9, "isEqualToString:", v4);

    }
  }

  return v6;
}

@end
