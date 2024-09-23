@implementation TSLStemmer

- (TSLStemmer)initWithLocale:(__CFLocale *)a3
{
  TSLStemmer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSLStemmer;
  v3 = -[TSLStemmer init](&v5, "init", a3);
  if (v3)
    v3->mStemmer = (sb_stemmer *)sb_stemmer_new("english", 0);
  return v3;
}

- (void)dealloc
{
  sb_stemmer *mStemmer;
  objc_super v4;

  mStemmer = self->mStemmer;
  if (mStemmer)
  {
    sb_stemmer_delete(mStemmer);
    self->mStemmer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSLStemmer;
  -[TSLStemmer dealloc](&v4, "dealloc");
}

- (id)stemWord:(id)a3
{
  return -[TSLStemmer newStemmedWord:](self, "newStemmedWord:", a3);
}

- (id)newStemmedWord:(id)a3
{
  const char *v5;
  char *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  v5 = (const char *)objc_msgSend(a3, "UTF8String");
  if (!v5)
    return 0;
  v6 = (char *)v5;
  v7 = strlen(v5);
  v8 = sb_stemmer_stem((uint64_t)self->mStemmer, v6, v7);
  if (v8)
  {
    v9 = v8;
    v10 = sb_stemmer_length((uint64_t)self->mStemmer);
    if (v10)
      return objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v9, v10, 4);
    return 0;
  }
  return objc_msgSend(a3, "copy");
}

@end
