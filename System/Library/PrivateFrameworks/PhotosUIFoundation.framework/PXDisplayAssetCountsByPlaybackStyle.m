@implementation PXDisplayAssetCountsByPlaybackStyle

- (PXDisplayAssetCountsByPlaybackStyle)init
{
  return -[PXDisplayAssetCountsByPlaybackStyle initWithCountsByPlaybackStyle:](self, "initWithCountsByPlaybackStyle:", 0);
}

- (PXDisplayAssetCountsByPlaybackStyle)initWithCountsByPlaybackStyle:(id)a3
{
  id v4;
  PXDisplayAssetCountsByPlaybackStyle *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *countsByPlaybackStyle;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXDisplayAssetCountsByPlaybackStyle;
  v5 = -[PXDisplayAssetCountsByPlaybackStyle init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 6);
    countsByPlaybackStyle = v5->_countsByPlaybackStyle;
    v5->_countsByPlaybackStyle = v8;

  }
  return v5;
}

- (PXDisplayAssetCountsByPlaybackStyle)initWithAssetFetchResult:(id)a3
{
  id v4;
  PXDisplayAssetCountsByPlaybackStyle *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;

  v4 = a3;
  v5 = -[PXDisplayAssetCountsByPlaybackStyle init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "count");
    if (v6 >= 1)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(v4, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXDisplayAssetCountsByPlaybackStyle addPlaybackStyle:](v5, "addPlaybackStyle:", objc_msgSend(v9, "playbackStyle"));

      }
    }
  }

  return v5;
}

- (int64_t)countForPlaybackStyle:(int64_t)a3
{
  NSMutableDictionary *countsByPlaybackStyle;
  void *v4;
  void *v5;
  int64_t v6;

  countsByPlaybackStyle = self->_countsByPlaybackStyle;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](countsByPlaybackStyle, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (void)addPlaybackStyle:(int64_t)a3
{
  -[PXDisplayAssetCountsByPlaybackStyle setCount:forPlaybackStyle:](self, "setCount:forPlaybackStyle:", -[PXDisplayAssetCountsByPlaybackStyle countForPlaybackStyle:](self, "countForPlaybackStyle:") + 1, a3);
}

- (void)setCount:(int64_t)a3 forPlaybackStyle:(int64_t)a4
{
  NSMutableDictionary *countsByPlaybackStyle;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  countsByPlaybackStyle = self->_countsByPlaybackStyle;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](countsByPlaybackStyle, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)enumerateCountsUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *countsByPlaybackStyle;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  countsByPlaybackStyle = self->_countsByPlaybackStyle;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__PXDisplayAssetCountsByPlaybackStyle_enumerateCountsUsingBlock___block_invoke;
  v7[3] = &unk_2514CFFE0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](countsByPlaybackStyle, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (int64_t)totalCount
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__PXDisplayAssetCountsByPlaybackStyle_totalCount__block_invoke;
  v4[3] = &unk_2514D0008;
  v4[4] = &v5;
  -[PXDisplayAssetCountsByPlaybackStyle enumerateCountsUsingBlock:](self, "enumerateCountsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_countsByPlaybackStyle, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PXDisplayAssetCountsByPlaybackStyle *v4;
  char v5;

  v4 = (PXDisplayAssetCountsByPlaybackStyle *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSMutableDictionary isEqualToDictionary:](self->_countsByPlaybackStyle, "isEqualToDictionary:", v4->_countsByPlaybackStyle);
    else
      v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCountsByPlaybackStyle:", self->_countsByPlaybackStyle);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countsByPlaybackStyle, 0);
}

uint64_t __49__PXDisplayAssetCountsByPlaybackStyle_totalCount__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  return result;
}

uint64_t __65__PXDisplayAssetCountsByPlaybackStyle_enumerateCountsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  v8 = objc_msgSend(a2, "integerValue");
  v9 = objc_msgSend(v7, "integerValue");

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v8, v9, a4);
}

@end
