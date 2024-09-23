@implementation APOdmlAppInfo

- (APOdmlAppInfo)initWithBundleID:(id)a3 adamID:(unint64_t)a4
{
  id v6;
  APOdmlAppInfo *v7;
  const char *v8;
  APOdmlAppInfo *v9;
  const char *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)APOdmlAppInfo;
  v7 = -[APOdmlAppInfo init](&v12, sel_init);
  v9 = v7;
  if (v7)
  {
    objc_msgSend_setBundleID_(v7, v8, (uint64_t)v6);
    objc_msgSend_setAdamID_(v9, v10, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    v9 = objc_msgSend_adamID(self, v7, v8);
    v12 = v9 == objc_msgSend_adamID(v4, v10, v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(unint64_t)a3
{
  self->_adamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
