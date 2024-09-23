@implementation PSICollectionResult

- (PSICollectionResult)initWithUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 subtitle:(id)a7 keyAssetUUIDPrivate:(id)a8 keyAssetUUIDShared:(id)a9 type:(unint64_t)a10 assetsCountPrivate:(unint64_t)a11 assetsCountShared:(unint64_t)a12 sortDate:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PSICollectionResult *v24;
  uint64_t v25;
  NSString *uuid;
  uint64_t v27;
  NSString *title;
  uint64_t v29;
  NSString *subtitle;
  uint64_t v31;
  NSString *keyAssetUUIDPrivate;
  uint64_t v33;
  NSString *keyAssetUUIDShared;
  uint64_t v35;
  NSDate *sortDate;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v40 = a3;
  v19 = a4;
  v20 = a5;
  v39 = a6;
  v38 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a13;
  v41.receiver = self;
  v41.super_class = (Class)PSICollectionResult;
  v24 = -[PSICollectionResult init](&v41, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v40, "copy");
    uuid = v24->_uuid;
    v24->_uuid = (NSString *)v25;

    objc_storeStrong((id *)&v24->_startDate, a4);
    objc_storeStrong((id *)&v24->_endDate, a5);
    v27 = objc_msgSend(v39, "copy");
    title = v24->_title;
    v24->_title = (NSString *)v27;

    v29 = objc_msgSend(v38, "copy");
    subtitle = v24->_subtitle;
    v24->_subtitle = (NSString *)v29;

    v24->_type = a10;
    v24->_assetsCountPrivate = a11;
    v24->_assetsCountShared = a12;
    v31 = objc_msgSend(v21, "copy");
    keyAssetUUIDPrivate = v24->_keyAssetUUIDPrivate;
    v24->_keyAssetUUIDPrivate = (NSString *)v31;

    v33 = objc_msgSend(v22, "copy");
    keyAssetUUIDShared = v24->_keyAssetUUIDShared;
    v24->_keyAssetUUIDShared = (NSString *)v33;

    v35 = objc_msgSend(v23, "copy");
    sortDate = v24->_sortDate;
    v24->_sortDate = (NSDate *)v35;

  }
  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_uuid, "copy");
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  objc_storeStrong((id *)(v4 + 16), self->_startDate);
  objc_storeStrong((id *)(v4 + 24), self->_endDate);
  v7 = -[NSString copy](self->_title, "copy");
  v8 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v7;

  v9 = -[NSString copy](self->_subtitle, "copy");
  v10 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v9;

  *(_QWORD *)(v4 + 48) = self->_type;
  *(_QWORD *)(v4 + 64) = self->_assetsCountPrivate;
  *(_QWORD *)(v4 + 72) = self->_assetsCountShared;
  v11 = -[NSString copy](self->_keyAssetUUIDPrivate, "copy");
  v12 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v11;

  v13 = -[NSString copy](self->_keyAssetUUIDShared, "copy");
  v14 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v13;

  v15 = -[NSDate copy](self->_sortDate, "copy");
  v16 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v15;

  return (id)v4;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (PSIDate)startDate
{
  return self->_startDate;
}

- (PSIDate)endDate
{
  return self->_endDate;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDate)sortDate
{
  return self->_sortDate;
}

- (unint64_t)assetsCountPrivate
{
  return self->_assetsCountPrivate;
}

- (unint64_t)assetsCountShared
{
  return self->_assetsCountShared;
}

- (NSString)keyAssetUUIDPrivate
{
  return self->_keyAssetUUIDPrivate;
}

- (NSString)keyAssetUUIDShared
{
  return self->_keyAssetUUIDShared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetUUIDShared, 0);
  objc_storeStrong((id *)&self->_keyAssetUUIDPrivate, 0);
  objc_storeStrong((id *)&self->_sortDate, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
