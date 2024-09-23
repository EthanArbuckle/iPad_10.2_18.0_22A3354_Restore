@implementation PSICollection

- (PSICollection)initWithUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 subtitle:(id)a7 keyAssetPrivate:(id)a8 keyAssetShared:(id)a9 type:(unint64_t)a10 assetsCountPrivate:(unint64_t)a11 assetsCountShared:(unint64_t)a12 sortDate:(id)a13
{
  id v20;
  id v21;
  id v22;
  id v23;
  PSICollection *v24;
  PSICollection *v25;
  uint64_t v26;
  NSString *title;
  uint64_t v28;
  NSString *subtitle;
  uint64_t v30;
  PSIAsset *keyAssetPrivate;
  uint64_t v32;
  PSIAsset *keyAssetShared;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v35 = a4;
  v20 = a5;
  v37 = a6;
  v36 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a13;
  v38.receiver = self;
  v38.super_class = (Class)PSICollection;
  v24 = -[PSIObject initWithUUID:](&v38, sel_initWithUUID_, a3);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_startDate, a4);
    objc_storeStrong((id *)&v25->_endDate, a5);
    v26 = objc_msgSend(v37, "copy");
    title = v25->_title;
    v25->_title = (NSString *)v26;

    v28 = objc_msgSend(v36, "copy");
    subtitle = v25->_subtitle;
    v25->_subtitle = (NSString *)v28;

    v25->_type = a10;
    v25->_assetsCountPrivate = a11;
    v25->_assetsCountShared = a12;
    v30 = objc_msgSend(v21, "copy");
    keyAssetPrivate = v25->_keyAssetPrivate;
    v25->_keyAssetPrivate = (PSIAsset *)v30;

    v32 = objc_msgSend(v22, "copy");
    keyAssetShared = v25->_keyAssetShared;
    v25->_keyAssetShared = (PSIAsset *)v32;

    objc_storeStrong((id *)&v25->_sortDate, a13);
  }

  return v25;
}

- (id)_initForCopy:(BOOL)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSICollection;
  v4 = -[PSIObject _initForCopy:](&v8, sel__initForCopy_);
  if (v4 && !a3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3940]);
    v6 = (void *)v4[7];
    v4[7] = v5;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PSICollection;
  v4 = -[PSIObject copyWithZone:](&v14, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 5, self->_startDate);
  objc_storeStrong(v4 + 6, self->_endDate);
  v5 = -[NSString copy](self->_title, "copy");
  v6 = v4[7];
  v4[7] = (id)v5;

  v7 = -[NSString copy](self->_subtitle, "copy");
  v8 = v4[8];
  v4[8] = (id)v7;

  v4[9] = (id)self->_type;
  v9 = -[PSIAsset copy](self->_keyAssetPrivate, "copy");
  v10 = v4[13];
  v4[13] = (id)v9;

  v11 = -[PSIAsset copy](self->_keyAssetShared, "copy");
  v12 = v4[14];
  v4[14] = (id)v11;

  v4[11] = (id)self->_assetsCountPrivate;
  v4[12] = (id)self->_assetsCountShared;
  objc_storeStrong(v4 + 10, self->_sortDate);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[PSIObject uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("UUID: %@, "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("Title: %@, "), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("subtitle: %@, "), self->_subtitle);
  -[PSIObject uuid](self->_keyAssetPrivate, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("keyAssetUUIDPrivate: %@, "), v5);

  -[PSIObject uuid](self->_keyAssetShared, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("keyAssetUUIDShared: %@, "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("assetsCountPrivate: %lu, "), self->_assetsCountPrivate);
  objc_msgSend(v3, "appendFormat:", CFSTR("assetsCountShared: %lu, "), self->_assetsCountShared);
  return v3;
}

- (unint64_t)objectType
{
  return 1;
}

- (PSIDate)startDate
{
  return (PSIDate *)objc_getProperty(self, a2, 40, 1);
}

- (PSIDate)endDate
{
  return (PSIDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDate)sortDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (unint64_t)assetsCountPrivate
{
  return self->_assetsCountPrivate;
}

- (unint64_t)assetsCountShared
{
  return self->_assetsCountShared;
}

- (PSIAsset)keyAssetPrivate
{
  return self->_keyAssetPrivate;
}

- (void)setKeyAssetPrivate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PSIAsset)keyAssetShared
{
  return self->_keyAssetShared;
}

- (void)setKeyAssetShared:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetShared, 0);
  objc_storeStrong((id *)&self->_keyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_sortDate, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
