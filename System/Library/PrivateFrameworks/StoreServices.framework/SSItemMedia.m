@implementation SSItemMedia

- (SSItemMedia)init
{
  SSItemMedia *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItemMedia;
  result = -[SSItemMedia init](&v3, sel_init);
  if (result)
    result->_duration = -1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItemMedia;
  -[SSItemMedia dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItemMedia;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: (%@) %@"), -[SSItemMedia description](&v3, sel_description), self->_mediaKind, self->_url);
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_url, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSURL isEqual:](self->_url, "isEqual:", objc_msgSend(a3, "URL"));
  else
    return 0;
}

- (SSItemMedia)initWithStoreOfferDictionary:(id)a3
{
  SSItemMedia *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SSItemMedia;
  v4 = -[SSItemMedia init](&v16, sel_init);
  if (!v4)
    return v4;
  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("preview-url"));
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("preview-duration"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (int)objc_msgSend(v7, "intValue");
    else
      v8 = -1;
    v4->_duration = v8;
    v4->_protected = 1;
  }
  else
  {
    v9 = objc_msgSend(a3, "objectForKey:", CFSTR("asset-url"));
    if (!v9)
      goto LABEL_14;
    v6 = v9;
    v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("duration"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (int)objc_msgSend(v10, "intValue");
    else
      v11 = -1;
    v4->_duration = v11;
  }
  v4->_url = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
LABEL_14:
  v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("duration"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = (int)objc_msgSend(v12, "intValue");
  else
    v13 = -1;
  v4->_fullDuration = v13;
  v14 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("size"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4->_mediaFileSize = objc_msgSend(v14, "longLongValue");
  return v4;
}

- (int64_t)durationInMilliseconds
{
  return self->_duration;
}

- (int64_t)fullDurationInMilliseconds
{
  return self->_fullDuration;
}

- (int64_t)mediaFileSize
{
  return self->_mediaFileSize;
}

- (NSString)mediaKind
{
  return self->_mediaKind;
}

- (void)setMediaKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isProtectedMedia
{
  return self->_protected;
}

- (NSURL)URL
{
  return self->_url;
}

@end
