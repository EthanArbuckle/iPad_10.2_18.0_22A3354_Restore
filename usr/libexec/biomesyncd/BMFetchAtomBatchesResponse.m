@implementation BMFetchAtomBatchesResponse

- (id)initFromDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMFetchAtomBatchesResponse;
  v5 = -[BMPeerToPeerMessage initFromDictionary:](&v31, "initFromDictionary:", v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unseenPeers")));
    v7 = (void *)v5[6];
    v5[6] = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("atomBatches")));
    if (!v8
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null")),
          v9,
          v8 == v9))
    {
      v19 = 0;
    }
    else
    {
      v11 = objc_opt_class(NSDictionary, v10);
      v13 = objc_opt_class(NSArray, v12);
      v15 = objc_opt_class(NSData, v14);
      v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v13, v15, objc_opt_class(NSString, v16), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v30 = 0;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v18, v8, &v30));
      v20 = v30;
      if (v20)
      {
        v21 = __biome_log_for_category(11);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          sub_100042C54();

      }
      v5[8] = objc_msgSend(v8, "length");

    }
    v23 = (void *)v5[7];
    v5[7] = v19;
    v24 = v19;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("moreComing")));
    *((_BYTE *)v5 + 40) = objc_msgSend(v25, "BOOLValue");

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchSequenceNumber")));
    v5[10] = objc_msgSend(v26, "unsignedIntegerValue");

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deletedLocations")));
    v28 = (void *)v5[9];
    v5[9] = v27;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  NSDictionary *atomBatches;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSArray *unseenPeers;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *deletedLocations;
  NSDictionary *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v23;
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];

  atomBatches = self->_atomBatches;
  if (atomBatches)
  {
    v24 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", atomBatches, 1, &v24));
    v5 = v24;
    if (v5)
    {
      v6 = __biome_log_for_category(11);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        sub_100042CB4();

    }
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  v25[0] = CFSTR("unseenPeers");
  unseenPeers = self->_unseenPeers;
  v9 = (uint64_t)unseenPeers;
  if (!unseenPeers)
    v9 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = v9;
  v22 = v5;
  v26[0] = v9;
  v25[1] = CFSTR("atomBatches");
  v10 = v4;
  if (!v4)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v9));
  v26[1] = v10;
  v25[2] = CFSTR("moreComing");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_moreComing, v20));
  v26[2] = v11;
  v25[3] = CFSTR("batchSequenceNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_batchSequenceNumber));
  v26[3] = v12;
  v25[4] = CFSTR("deletedLocations");
  deletedLocations = self->_deletedLocations;
  v14 = deletedLocations;
  if (!deletedLocations)
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v26[4] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 5));
  v16 = objc_msgSend(v15, "mutableCopy");

  if (!deletedLocations)
  if (!v4)

  if (!unseenPeers)
  v23.receiver = self;
  v23.super_class = (Class)BMFetchAtomBatchesResponse;
  v17 = -[BMPeerToPeerMessage dictionaryRepresentation](&v23, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v16, "addEntriesFromDictionary:", v18);

  return v16;
}

- (NSArray)unseenPeers
{
  return self->_unseenPeers;
}

- (void)setUnseenPeers:(id)a3
{
  objc_storeStrong((id *)&self->_unseenPeers, a3);
}

- (NSDictionary)atomBatches
{
  return self->_atomBatches;
}

- (void)setAtomBatches:(id)a3
{
  objc_storeStrong((id *)&self->_atomBatches, a3);
}

- (unint64_t)atomBatchBytes
{
  return self->_atomBatchBytes;
}

- (void)setAtomBatchBytes:(unint64_t)a3
{
  self->_atomBatchBytes = a3;
}

- (NSDictionary)deletedLocations
{
  return self->_deletedLocations;
}

- (void)setDeletedLocations:(id)a3
{
  objc_storeStrong((id *)&self->_deletedLocations, a3);
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
}

- (unint64_t)batchSequenceNumber
{
  return self->_batchSequenceNumber;
}

- (void)setBatchSequenceNumber:(unint64_t)a3
{
  self->_batchSequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedLocations, 0);
  objc_storeStrong((id *)&self->_atomBatches, 0);
  objc_storeStrong((id *)&self->_unseenPeers, 0);
}

@end
