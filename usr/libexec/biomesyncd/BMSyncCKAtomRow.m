@implementation BMSyncCKAtomRow

- (BMSyncCKAtomRow)initWithLocation:(id)a3 timestamp:(id)a4 referenceLocation:(id)a5 causalReference:(id)a6 type:(unint64_t)a7 segmentName:(id)a8 segmentOffset:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  BMSyncCKAtomRow *v19;
  BMSyncCKAtomRow *v20;
  void *v22;
  void *v23;
  id v26;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v26 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSyncCKAtomRow.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location"));

    if (v16)
      goto LABEL_3;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSyncCKAtomRow.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timestamp"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)BMSyncCKAtomRow;
  v19 = -[BMSyncCKAtomRow init](&v27, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_location, a3);
    objc_storeStrong((id *)&v20->_timestamp, a4);
    objc_storeStrong((id *)&v20->_referenceLocation, a5);
    objc_storeStrong((id *)&v20->_causalReference, a6);
    v20->_type = a7;
    objc_storeStrong((id *)&v20->_segmentName, a8);
    v20->_segmentOffset = a9;
  }

  return v20;
}

- (BMSyncCKAtomRow)initWithLocation:(id)a3 timestamp:(id)a4 referenceLocation:(id)a5 causalReference:(id)a6 type:(unint64_t)a7 valueVersion:(int64_t)a8 valueData:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMSyncCKAtomRow *v18;
  BMSyncCKAtomRow *v19;
  void *v21;
  void *v22;
  id v26;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v26 = a5;
  v16 = a6;
  v17 = a9;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSyncCKAtomRow.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location"));

    if (v15)
      goto LABEL_3;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSyncCKAtomRow.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timestamp"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)BMSyncCKAtomRow;
  v18 = -[BMSyncCKAtomRow init](&v27, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_location, a3);
    objc_storeStrong((id *)&v19->_timestamp, a4);
    objc_storeStrong((id *)&v19->_referenceLocation, a5);
    objc_storeStrong((id *)&v19->_causalReference, a6);
    v19->_type = a7;
    v19->_valueVersion = a8;
    objc_storeStrong((id *)&v19->_valueData, a9);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unsigned __int8 v8;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    if (-[BMSyncCRDTLocationRow isEqual:](self->_location, "isEqual:", v7[1]))
      v8 = -[CKDistributedTimestamp isEqual:](self->_timestamp, "isEqual:", v7[2]);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[BMSyncCRDTLocationRow hash](self->_location, "hash");
  return (unint64_t)-[CKDistributedTimestamp hash](self->_timestamp, "hash") ^ v3;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc((Class)NSString);
  v5 = objc_opt_class(self, v4);
  v6 = sub_1000250CC(self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow description](self->_location, "description"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKDistributedTimestamp bm_description](self->_timestamp, "bm_description"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKAtomReference timestamp](self->_causalReference, "timestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bm_description"));
  v12 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: type=%@, location=%@, atomID=%@, refID=%@ bookmarkOffset=%lu>"), v5, v7, v8, v9, v11, self->_segmentOffset);

  return v12;
}

- (BMSyncCRDTLocationRow)location
{
  return self->_location;
}

- (CKDistributedTimestamp)timestamp
{
  return self->_timestamp;
}

- (BMSyncCRDTLocationRow)referenceLocation
{
  return self->_referenceLocation;
}

- (CKAtomReference)causalReference
{
  return self->_causalReference;
}

- (NSString)segmentName
{
  return self->_segmentName;
}

- (unint64_t)segmentOffset
{
  return self->_segmentOffset;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)valueVersion
{
  return self->_valueVersion;
}

- (NSData)valueData
{
  return self->_valueData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueData, 0);
  objc_storeStrong((id *)&self->_segmentName, 0);
  objc_storeStrong((id *)&self->_causalReference, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (BMSyncCKAtomRow)initWithFMResultSet:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  BMSyncCRDTLocationRow *v10;
  BMSyncCRDTLocationRow *v11;
  uint64_t v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  BMSyncCRDTLocationRow *v21;
  BMSyncCKAtomRow *v22;
  id v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;

  v3 = a3;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForColumn:", CFSTR("stream")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForColumn:", CFSTR("site")));
  v5 = objc_alloc((Class)CKDistributedSiteIdentifier);
  v33 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));
  v7 = objc_msgSend(v5, "initWithIdentifier:", v6);

  v8 = objc_msgSend(v3, "longForColumn:", CFSTR("clock"));
  v28 = objc_msgSend(v3, "longForColumn:", CFSTR("type"));
  v32 = v7;
  v9 = objc_msgSend(objc_alloc((Class)CKDistributedTimestamp), "initWithSiteIdentifierObject:clockValue:", v7, v8);
  v10 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]([BMSyncCRDTLocationRow alloc], "initWithFMResultSet:modifier:", v3, 1);
  v11 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]([BMSyncCRDTLocationRow alloc], "initWithFMResultSet:modifier:", v3, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](v11, "location"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ckMergeableValueIDWithFormatVersion:", 0));
  v13 = objc_msgSend(v3, "longForColumn:", CFSTR("ref_type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForColumn:", CFSTR("ref_site")));
  v15 = objc_alloc((Class)CKDistributedSiteIdentifier);
  v26 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataUsingEncoding:", 4));
  v17 = objc_msgSend(v15, "initWithIdentifier:", v16);

  v18 = objc_msgSend(objc_alloc((Class)CKDistributedTimestamp), "initWithSiteIdentifierObject:clockValue:", v17, objc_msgSend(v3, "longForColumn:", CFSTR("ref_clock")));
  if (v12)
    v19 = objc_msgSend(objc_alloc((Class)CKAtomReference), "initWithMergeableValueID:timestamp:type:", v12, v18, v13);
  else
    v19 = 0;
  v27 = (void *)v12;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForColumn:", CFSTR("segment_name")));
  v21 = v10;
  if (v20)
  {
    v22 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:](self, "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:", v10, v9, v11, v19, v28, v20, objc_msgSend(v3, "longForColumn:", CFSTR("segment_offset")));
  }
  else
  {
    v23 = objc_msgSend(v3, "longForColumn:", CFSTR("value_version"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataForColumn:", CFSTR("value_data")));
    v22 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:valueVersion:valueData:](self, "initWithLocation:timestamp:referenceLocation:causalReference:type:valueVersion:valueData:", v21, v9, v11, v19, v28, v23, v24);

  }
  return v22;
}

@end
