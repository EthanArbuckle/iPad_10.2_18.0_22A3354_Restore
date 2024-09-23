@implementation _PointQueue

- (_PointQueue)init
{
  _PointQueue *v2;
  NSMutableArray *v3;
  NSMutableArray *nonSentinelPoints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PointQueue;
  v2 = -[_PointQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nonSentinelPoints = v2->_nonSentinelPoints;
    v2->_nonSentinelPoints = v3;

  }
  return v2;
}

- (unint64_t)effectiveStartIndexBasedOnLength
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[NSMutableArray lastObject](self->_nonSentinelPoints, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PointQueue nonSentinelPoints](self, "nonSentinelPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___PointQueue_effectiveStartIndexBasedOnLength__block_invoke;
  v8[3] = &unk_1E16D9218;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (NSMutableArray)nonSentinelPoints
{
  return self->_nonSentinelPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonSentinelPoints, 0);
}

@end
