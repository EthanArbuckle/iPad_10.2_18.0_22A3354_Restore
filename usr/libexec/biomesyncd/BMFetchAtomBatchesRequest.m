@implementation BMFetchAtomBatchesRequest

- (id)initFromDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BMFetchAtomBatchesRequest;
  v5 = -[BMPeerToPeerMessage initFromDictionary:](&v18, "initFromDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchSize")));
    v5[8] = objc_msgSend(v6, "unsignedIntegerValue");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchSequenceNumber")));
    v5[9] = objc_msgSend(v7, "unsignedIntegerValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isReciprocalRequest")));
    *((_BYTE *)v5 + 40) = objc_msgSend(v8, "BOOLValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("atomBatchVersion")));
    v5[7] = objc_msgSend(v9, "unsignedIntegerValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vectorClock")));
    v17 = 0;
    v11 = objc_claimAutoreleasedReturnValue(+[BMMultiStreamVectorClock deserialize:error:](BMMultiStreamVectorClock, "deserialize:error:", v10, &v17));
    v12 = v17;
    v13 = (void *)v5[6];
    v5[6] = v11;

    if (v12)
    {
      v14 = __biome_log_for_category(11);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        sub_100042B94();

    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  BMMultiStreamVectorClock *vectorClock;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  objc_super v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];

  vectorClock = self->_vectorClock;
  v19 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMMultiStreamVectorClock serialize:](vectorClock, "serialize:", &v19));
  v5 = v19;
  if (v5)
  {
    v6 = __biome_log_for_category(11);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_100042BF4();

  }
  v20[0] = CFSTR("batchSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_batchSize));
  v21[0] = v8;
  v20[1] = CFSTR("batchSequenceNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_batchSequenceNumber));
  v21[1] = v9;
  v20[2] = CFSTR("vectorClock");
  v10 = v4;
  if (!v4)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v21[2] = v10;
  v20[3] = CFSTR("isReciprocalRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isReciprocalRequest));
  v21[3] = v11;
  v20[4] = CFSTR("atomBatchVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_atomBatchVersion));
  v21[4] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 5));
  v14 = objc_msgSend(v13, "mutableCopy");

  if (!v4)
  v18.receiver = self;
  v18.super_class = (Class)BMFetchAtomBatchesRequest;
  v15 = -[BMPeerToPeerMessage dictionaryRepresentation](&v18, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v14, "addEntriesFromDictionary:", v16);

  return v14;
}

- (BMMultiStreamVectorClock)vectorClock
{
  return self->_vectorClock;
}

- (void)setVectorClock:(id)a3
{
  objc_storeStrong((id *)&self->_vectorClock, a3);
}

- (unint64_t)atomBatchVersion
{
  return self->_atomBatchVersion;
}

- (void)setAtomBatchVersion:(unint64_t)a3
{
  self->_atomBatchVersion = a3;
}

- (BOOL)isReciprocalRequest
{
  return self->_isReciprocalRequest;
}

- (void)setIsReciprocalRequest:(BOOL)a3
{
  self->_isReciprocalRequest = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
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
  objc_storeStrong((id *)&self->_vectorClock, 0);
}

@end
