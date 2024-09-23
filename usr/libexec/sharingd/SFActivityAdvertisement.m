@implementation SFActivityAdvertisement

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SFActivityAdvertisement device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uniqueID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SFActivityAdvertisement advertisementPayload](self, "advertisementPayload"));
  v6 = SFAdvertisementDescriptionFromPayloadData(v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFActivityAdvertisement options](self, "options"));
  v9 = SFCompactStringFromCollection(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SFActivityAdvertisement device](self, "device"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SFActivityAdvertisement device](self, "device"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, deviceUniqueID:%@, advertisementPayload:%@, options:%@, deviceName:%@, deviceModelIdentifier:%@>"), v17, self, v5, v7, v10, v12, v14));

  return v15;
}

@end
