@implementation PLDuplicateDetectorLivePhotoContextData

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLDuplicateDetectorLivePhotoContextData subtype](self, "subtype") + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  if (-[PLDuplicateDetectorLivePhotoContextData isSharedLibrary](self, "isSharedLibrary"))
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(v5, "numberWithInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") + v4;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  _BOOL4 v6;
  int v7;

  v4 = a3;
  v5 = -[PLDuplicateDetectorLivePhotoContextData subtype](self, "subtype");
  if (v5 == objc_msgSend(v4, "subtype"))
  {
    v6 = -[PLDuplicateDetectorLivePhotoContextData isSharedLibrary](self, "isSharedLibrary");
    v7 = v6 ^ objc_msgSend(v4, "isSharedLibrary") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  int v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLDuplicateDetectorLivePhotoContextData;
  -[PLDuplicateDetectorLivePhotoContextData description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLDuplicateDetectorLivePhotoContextData subtype](self, "subtype");
  v5 = -[PLDuplicateDetectorLivePhotoContextData isSharedLibrary](self, "isSharedLibrary");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" subType: %d, isSharedLibrary: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (signed)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(signed __int16)a3
{
  self->_subtype = a3;
}

- (BOOL)isSharedLibrary
{
  return self->_isSharedLibrary;
}

- (void)setIsSharedLibrary:(BOOL)a3
{
  self->_isSharedLibrary = a3;
}

+ (id)dataWithSubtype:(signed __int16)a3 isSharedLibrary:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  PLDuplicateDetectorLivePhotoContextData *v6;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(PLDuplicateDetectorLivePhotoContextData);
  -[PLDuplicateDetectorLivePhotoContextData setSubtype:](v6, "setSubtype:", v5);
  -[PLDuplicateDetectorLivePhotoContextData setIsSharedLibrary:](v6, "setIsSharedLibrary:", v4);
  return v6;
}

@end
