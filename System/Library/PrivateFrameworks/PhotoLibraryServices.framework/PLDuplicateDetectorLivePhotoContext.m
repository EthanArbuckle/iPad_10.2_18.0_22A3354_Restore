@implementation PLDuplicateDetectorLivePhotoContext

- (PLDuplicateDetectorLivePhotoContext)init
{
  PLDuplicateDetectorLivePhotoContext *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *container;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLDuplicateDetectorLivePhotoContext;
  v2 = -[PLDuplicateDetectorLivePhotoContext init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    container = v2->_container;
    v2->_container = v3;

  }
  return v2;
}

- (void)addFingerprint:(id)a3 contextData:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_container, "objectForKeyedSubscript:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_container, "setObject:forKeyedSubscript:", v7, v8);
    }
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (BOOL)hasFingerprint:(id)a3 contextData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_container, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "containsObject:", v6);
  else
    v9 = 0;

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLDuplicateDetectorLivePhotoContext;
  -[PLDuplicateDetectorLivePhotoContext description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), self->_container);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end
