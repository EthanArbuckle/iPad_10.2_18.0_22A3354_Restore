@implementation DataStreamFragmentChunk

- (DataStreamFragmentChunk)initWithData:(id)a3 sequenceNumber:(id)a4 fragmentSequenceNumber:(id)a5 type:(id)a6 isLast:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  DataStreamFragmentChunk *v18;
  DataStreamFragmentChunk *v19;
  NSNumber *v20;
  NSNumber *sequenceNumber;
  NSNumber *v22;
  NSNumber *fragmentSequenceNumber;
  NSString *v24;
  NSString *type;
  DataStreamFragmentChunk *v27;
  SEL v28;
  id v29;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v13)
  {
    _HMFPreconditionFailure(CFSTR("data"));
    goto LABEL_9;
  }
  if (!v14)
  {
LABEL_9:
    _HMFPreconditionFailure(CFSTR("sequenceNumber"));
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure(CFSTR("fragmentSequenceNumber"));
    goto LABEL_11;
  }
  v17 = v16;
  if (!v16)
  {
LABEL_11:
    v27 = (DataStreamFragmentChunk *)_HMFPreconditionFailure(CFSTR("type"));
    return -[DataStreamFragmentChunk initWithDictionaryRepresentation:](v27, v28, v29);
  }
  v30.receiver = self;
  v30.super_class = (Class)DataStreamFragmentChunk;
  v18 = -[DataStreamFragmentChunk init](&v30, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a3);
    v20 = (NSNumber *)objc_msgSend(v14, "copy");
    sequenceNumber = v19->_sequenceNumber;
    v19->_sequenceNumber = v20;

    v22 = (NSNumber *)objc_msgSend(v15, "copy");
    fragmentSequenceNumber = v19->_fragmentSequenceNumber;
    v19->_fragmentSequenceNumber = v22;

    v24 = (NSString *)objc_msgSend(v17, "copy");
    type = v19->_type;
    v19->_type = v24;

    v19->_last = a7;
  }

  return v19;
}

- (DataStreamFragmentChunk)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  DataStreamFragmentChunk *v6;
  DataStreamFragmentChunk *v7;
  DataStreamFragmentChunk *v8;
  DataStreamFragmentChunk *v9;
  DataStreamFragmentChunk *v10;
  DataStreamFragmentChunk *v11;
  DataStreamFragmentChunk *v12;
  DataStreamFragmentChunk *v13;
  DataStreamFragmentChunk *v14;
  uint64_t v15;
  id v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  id v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  id v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  id v28;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  __CFString *v34;
  void *v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  __CFString *v39;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  id v47;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_dataForKey:", CFSTR("data")));
  if (v5)
  {
    v6 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("metadata")));
    v7 = v6;
    if (v6)
    {
      v8 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk hmf_numberForKey:](v6, "hmf_numberForKey:", CFSTR("dataChunkSequenceNumber")));
      if (v8)
      {
        v9 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk hmf_numberForKey:](v7, "hmf_numberForKey:", CFSTR("dataSequenceNumber")));
        if (v9)
        {
          v10 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk hmf_stringForKey:](v7, "hmf_stringForKey:", CFSTR("dataType")));
          if (v10)
          {
            v11 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk hmf_numberForKey:](v7, "hmf_numberForKey:", CFSTR("isLastDataChunk")));
            v12 = v11;
            if (v11)
            {
              v13 = -[DataStreamFragmentChunk initWithData:sequenceNumber:fragmentSequenceNumber:type:isLast:](self, "initWithData:sequenceNumber:fragmentSequenceNumber:type:isLast:", v5, v8, v9, v10, -[DataStreamFragmentChunk BOOLValue](v11, "BOOLValue"));
              v14 = v13;
            }
            else
            {
              v13 = self;
              v37 = sub_10007CCE4((uint64_t)v13, v36);
              v38 = objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                v39 = sub_10007CD2C(v13);
                v41 = (void *)objc_claimAutoreleasedReturnValue(v39);
                *(_DWORD *)buf = 138543874;
                v43 = v41;
                v44 = 2112;
                v45 = CFSTR("isLastDataChunk");
                v46 = 2112;
                v47 = v4;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%{public}@Could not determine isLast (key=%@) from stream data dictionary: %@", buf, 0x20u);

              }
              v14 = 0;
            }
          }
          else
          {
            v12 = self;
            v32 = sub_10007CCE4((uint64_t)v12, v31);
            v33 = objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v34 = sub_10007CD2C(v12);
              v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
              *(_DWORD *)buf = 138543874;
              v43 = v35;
              v44 = 2112;
              v45 = CFSTR("dataType");
              v46 = 2112;
              v47 = v4;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not determine type (key=%@) from stream data dictionary: %@", buf, 0x20u);

            }
            v14 = 0;
            v13 = v12;
          }
        }
        else
        {
          v10 = self;
          v28 = sub_10007CCE4((uint64_t)v10, v27);
          v12 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
          {
            v29 = sub_10007CD2C(v10);
            v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
            *(_DWORD *)buf = 138543874;
            v43 = v30;
            v44 = 2112;
            v45 = CFSTR("dataSequenceNumber");
            v46 = 2112;
            v47 = v4;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, "%{public}@Could not determine fragment sequence number (key=%@) from stream data dictionary: %@", buf, 0x20u);

          }
          v14 = 0;
          v13 = v10;
        }

      }
      else
      {
        v9 = self;
        v24 = sub_10007CCE4((uint64_t)v9, v23);
        v10 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
        {
          v25 = sub_10007CD2C(v9);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          *(_DWORD *)buf = 138543874;
          v43 = v26;
          v44 = 2112;
          v45 = CFSTR("dataChunkSequenceNumber");
          v46 = 2112;
          v47 = v4;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "%{public}@Could not determine sequence number (key=%@) from stream data dictionary: %@", buf, 0x20u);

        }
        v14 = 0;
        v13 = v9;
      }

    }
    else
    {
      v8 = self;
      v20 = sub_10007CCE4((uint64_t)v8, v19);
      v9 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        v21 = sub_10007CD2C(v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138543874;
        v43 = v22;
        v44 = 2112;
        v45 = CFSTR("metadata");
        v46 = 2112;
        v47 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "%{public}@Could not determine metadata (key=%@) from stream data dictionary: %@", buf, 0x20u);

      }
      v14 = 0;
      v13 = v8;
    }

  }
  else
  {
    v7 = self;
    v16 = sub_10007CCE4((uint64_t)v7, v15);
    v8 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      v17 = sub_10007CD2C(v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138543874;
      v43 = v18;
      v44 = 2112;
      v45 = CFSTR("data");
      v46 = 2112;
      v47 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_ERROR, "%{public}@Could not determine data (key=%@) from stream data dictionary: %@", buf, 0x20u);

    }
    v14 = 0;
    v13 = v7;
  }

  return v14;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[2];
  _QWORD v14[2];

  v13[0] = CFSTR("metadata");
  v11[0] = CFSTR("dataChunkSequenceNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk sequenceNumber](self, "sequenceNumber"));
  v12[0] = v3;
  v11[1] = CFSTR("dataSequenceNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk fragmentSequenceNumber](self, "fragmentSequenceNumber"));
  v12[1] = v4;
  v11[2] = CFSTR("dataType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk type](self, "type"));
  v12[2] = v5;
  v11[3] = CFSTR("isLastDataChunk");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DataStreamFragmentChunk isLast](self, "isLast")));
  v12[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
  v13[1] = CFSTR("data");
  v14[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk data](self, "data"));
  v14[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));

  return (NSDictionary *)v9;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v3 = objc_alloc((Class)HMFAttributeDescription);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk data](self, "data"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "length")));
  v4 = objc_msgSend(v3, "initWithName:value:", CFSTR("Data Length"), v20);
  v22[0] = v4;
  v5 = objc_alloc((Class)HMFAttributeDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk sequenceNumber](self, "sequenceNumber"));
  v7 = objc_msgSend(v5, "initWithName:value:", CFSTR("Sequence Number"), v6);
  v22[1] = v7;
  v8 = objc_alloc((Class)HMFAttributeDescription);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk fragmentSequenceNumber](self, "fragmentSequenceNumber"));
  v10 = objc_msgSend(v8, "initWithName:value:", CFSTR("Fragment Sequence Number"), v9);
  v22[2] = v10;
  v11 = objc_alloc((Class)HMFAttributeDescription);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk type](self, "type"));
  v13 = objc_msgSend(v11, "initWithName:value:", CFSTR("Type"), v12);
  v22[3] = v13;
  v14 = objc_alloc((Class)HMFAttributeDescription);
  v15 = HMFBooleanToString(-[DataStreamFragmentChunk isLast](self, "isLast"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_msgSend(v14, "initWithName:value:", CFSTR("Is Last"), v16);
  v22[4] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 5));

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  unsigned int v22;
  void *v23;

  v4 = a3;
  v6 = objc_opt_class(DataStreamFragmentChunk, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk data](self, "data"));
    if (objc_msgSend(v10, "isEqualToData:", v11))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sequenceNumber"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk sequenceNumber](self, "sequenceNumber"));
      if (objc_msgSend(v12, "isEqualToNumber:", v13))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fragmentSequenceNumber"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk fragmentSequenceNumber](self, "fragmentSequenceNumber"));
        if (objc_msgSend(v14, "isEqualToNumber:", v15))
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "type"));
          v17 = objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk type](self, "type"));
          v23 = (void *)v16;
          v18 = (void *)v16;
          v19 = (void *)v17;
          if (objc_msgSend(v18, "isEqualToString:", v17))
          {
            v22 = objc_msgSend(v9, "isLast");
            v20 = v22 ^ -[DataStreamFragmentChunk isLast](self, "isLast") ^ 1;
          }
          else
          {
            LOBYTE(v20) = 0;
          }

        }
        else
        {
          LOBYTE(v20) = 0;
        }

      }
      else
      {
        LOBYTE(v20) = 0;
      }

    }
    else
    {
      LOBYTE(v20) = 0;
    }

  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk data](self, "data"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk sequenceNumber](self, "sequenceNumber"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk fragmentSequenceNumber](self, "fragmentSequenceNumber"));
  v8 = (unint64_t)objc_msgSend(v7, "hash");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamFragmentChunk type](self, "type"));
  v10 = v6 ^ v8 ^ (unint64_t)objc_msgSend(v9, "hash");

  return v10 ^ -[DataStreamFragmentChunk isLast](self, "isLast");
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)fragmentSequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isLast
{
  return self->_last;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_fragmentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
