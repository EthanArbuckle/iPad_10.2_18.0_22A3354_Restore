@implementation BKEventSenderUsagePairDictionary

- (id)description
{
  BKEventSenderUsagePairDictionary *v2;
  void *v3;
  NSMutableDictionary *usagePairsPerSenderID;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = self;
  if (self)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
    usagePairsPerSenderID = v2->_usagePairsPerSenderID;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002050C;
    v7[3] = &unk_1000E9C68;
    v5 = v3;
    v8 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](usagePairsPerSenderID, "enumerateKeysAndObjectsUsingBlock:", v7);

    v2 = (BKEventSenderUsagePairDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "build"));
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usagePairsPerSenderID, 0);
}

@end
