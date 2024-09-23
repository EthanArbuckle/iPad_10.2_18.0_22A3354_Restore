@implementation BECFIUtilitiesJSOptions

- (BECFIUtilitiesJSOptions)init
{
  return -[BECFIUtilitiesJSOptions initWithManifestId:assetId:chapterIndex:spineIndex:](self, "initWithManifestId:assetId:chapterIndex:spineIndex:", &stru_38FF08, &stru_38FF08, 0, 0);
}

- (BECFIUtilitiesJSOptions)initWithManifestId:(id)a3 assetId:(id)a4 chapterIndex:(unint64_t)a5 spineIndex:(unint64_t)a6
{
  id v10;
  id v11;
  BECFIUtilitiesJSOptions *v12;
  NSString *v13;
  NSString *manifestId;
  NSString *v15;
  NSString *assetId;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BECFIUtilitiesJSOptions;
  v12 = -[BECFIUtilitiesJSOptions init](&v18, "init");
  if (v12)
  {
    v13 = (NSString *)objc_msgSend(v10, "copy");
    manifestId = v12->_manifestId;
    v12->_manifestId = v13;

    v15 = (NSString *)objc_msgSend(v11, "copy");
    assetId = v12->_assetId;
    v12->_assetId = v15;

    v12->_chapterIndex = a5;
    v12->_spineIndex = a6;
  }

  return v12;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (-[NSString length](self->_manifestId, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_manifestId, CFSTR("manifestId"));
  if (-[NSString length](self->_assetId, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_assetId, CFSTR("assetId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_chapterIndex));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("chapterIndex"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_spineIndex));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("spineIndex"));

  return v3;
}

- (NSString)jsonRepresentation
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BECFIUtilitiesJSOptions _dictionaryRepresentation](self, "_dictionaryRepresentation"));
  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v2, 0, &v6));

  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;

  return (NSString *)v4;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BECFIUtilitiesJSOptions spineIndex](self, "spineIndex")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BECFIUtilitiesJSOptions chapterIndex](self, "chapterIndex")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BECFIUtilitiesJSOptions manifestId](self, "manifestId"));
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BECFIUtilitiesJSOptions manifestId](self, "manifestId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p spine:%@ chapterIndex:%@ manifestID:%@>"), v5, self, v6, v7, v9));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p spine:%@ chapterIndex:%@ manifestID:%@>"), v5, self, v6, v7, CFSTR("{none}")));
  }

  return v10;
}

- (NSString)manifestId
{
  return self->_manifestId;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (unint64_t)chapterIndex
{
  return self->_chapterIndex;
}

- (unint64_t)spineIndex
{
  return self->_spineIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_manifestId, 0);
}

@end
