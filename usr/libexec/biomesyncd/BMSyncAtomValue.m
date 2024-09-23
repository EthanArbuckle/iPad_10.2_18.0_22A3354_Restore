@implementation BMSyncAtomValue

- (BMSyncAtomValue)initWithAtomType:(unint64_t)a3 value:(id)a4 version:(int64_t)a5
{
  id v9;
  BMSyncAtomValue *v10;
  BMSyncAtomValue *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMSyncAtomValue;
  v10 = -[BMSyncAtomValue init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_value, a4);
    v11->_version = a5;
  }

  return v11;
}

- (id)serializeProto
{
  return -[BMSyncAtomValue encodeAsProto](self, "encodeAsProto");
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncAtomValue proto](self, "proto"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "data"));

  return v3;
}

- (BMSyncAtomValue)initWithProto:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  BMStoreEventAtomValue *v8;
  uint64_t v9;
  void *v10;
  BMStoreEventAtomValue *v11;
  BMSyncAtomValue *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_class(BMPBSyncAtomValue, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      if (sub_1000199D4((uint64_t)v7) && sub_100019B10((_BOOL8)v7))
      {
        v8 = [BMStoreEventAtomValue alloc];
        v9 = sub_10001A26C((uint64_t)v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = -[BMStoreEventAtomValue initWithProto:](v8, "initWithProto:", v10);

        self = -[BMSyncAtomValue initWithAtomType:value:version:](self, "initWithAtomType:value:version:", (int)sub_100019960((uint64_t)v7), v11, 1);
        v12 = self;
LABEL_13:

        goto LABEL_14;
      }
      v16 = __biome_log_for_category(4);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        sub_100042FC0((uint64_t)self, (uint64_t)v17, v18, v19);

    }
    else
    {
      v13 = __biome_log_for_category(4);
      v7 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        sub_100043038((uint64_t)self, (uint64_t)v7, v14, v15);
    }
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (BMSyncAtomValue)initWithProtoData:(id)a3
{
  id v4;
  BMPBSyncAtomValue *v5;
  BMSyncAtomValue *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSyncAtomValue initWithData:]([BMPBSyncAtomValue alloc], "initWithData:", v4);

    self = -[BMSyncAtomValue initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  BMPBSyncAtomValue *v3;
  void *v4;
  void *v5;

  v3 = objc_opt_new(BMPBSyncAtomValue);
  sub_10001998C((uint64_t)v3, (int)-[BMSyncAtomValue type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncAtomValue value](self, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "proto"));

  sub_10001A01C((uint64_t)v3, v5);
  return v3;
}

+ (id)atomValueFromData:(id)a3 version:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  __int128 buf;
  uint64_t v18;
  char v19;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else if (a4)
  {
    v12 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000430B0();

    v7 = 0;
  }
  else
  {
    v16 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", a1, v6, &v16));
    v8 = v16;
    if (v8)
    {
      v9 = __biome_log_for_category(11);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v18 = 0x2020000000;
      v19 = 16;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100025610;
      v15[3] = &unk_100068AA0;
      v15[4] = &buf;
      if (qword_10007BE58 != -1)
        dispatch_once(&qword_10007BE58, v15);
      v11 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      if (os_log_type_enabled(v10, v11))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "failed to deserialize BMSyncAtomValue with error %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }

  return v7;
}

- (id)serialize
{
  int64_t version;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  int64_t v13;
  _QWORD block[5];
  _QWORD v15[5];
  id v16;
  __int128 buf;
  uint64_t v18;
  char v19;

  version = self->_version;
  if (version == 1)
    return (id)objc_claimAutoreleasedReturnValue(-[BMSyncAtomValue serializeProto](self, "serializeProto"));
  if (version)
  {
    v10 = __biome_log_for_category(11);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x2020000000;
    v19 = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000258B4;
    block[3] = &unk_100068AA0;
    block[4] = &buf;
    if (qword_10007BE68 != -1)
      dispatch_once(&qword_10007BE68, block);
    v12 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = self->_version;
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "cannot serialize atom value with version %lu", (uint8_t *)&buf, 0xCu);
    }

    v4 = 0;
  }
  else
  {
    v16 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v16));
    v5 = v16;
    if (v5)
    {
      v6 = __biome_log_for_category(11);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v18 = 0x2020000000;
      v19 = 16;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000258A0;
      v15[3] = &unk_100068AA0;
      v15[4] = &buf;
      if (qword_10007BE60 != -1)
        dispatch_once(&qword_10007BE60, v15);
      v8 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      if (os_log_type_enabled(v7, v8))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "failed to serialize BMSyncAtomValue with error %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  void *v5;
  id v6;

  type = self->_type;
  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", type));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("atomType"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_value, CFSTR("atomValue"));
}

- (BMSyncAtomValue)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  BMSyncAtomValue *v12;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v5), CFSTR("atomType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(BMStoreEventAtomValue, v9), CFSTR("atomValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = -[BMSyncAtomValue initWithAtomType:value:version:](self, "initWithAtomType:value:version:", v8, v11, 0);
  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (BMStoreEventAtomValue)value
{
  return self->_value;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
