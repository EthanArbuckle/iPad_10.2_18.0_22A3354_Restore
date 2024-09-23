@implementation DMDPayload

- (id)identifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayload payloadDictionary](self, "payloadDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Identifier")));

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[0] = CFSTR("objectID");
  v7[1] = CFSTR("identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

@end
