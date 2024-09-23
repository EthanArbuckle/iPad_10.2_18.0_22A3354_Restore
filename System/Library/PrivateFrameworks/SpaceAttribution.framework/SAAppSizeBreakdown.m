@implementation SAAppSizeBreakdown

- (SAAppSizeBreakdown)init
{
  SAAppSizeBreakdown *v2;
  uint64_t v3;
  NSMutableDictionary *dataPathsSizes;
  uint64_t v5;
  NSMutableDictionary *fixedPathsSizes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SAAppSizeBreakdown;
  v2 = -[SAAppSizeBreakdown init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dataPathsSizes = v2->_dataPathsSizes;
    v2->_dataPathsSizes = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    fixedPathsSizes = v2->_fixedPathsSizes;
    v2->_fixedPathsSizes = (NSMutableDictionary *)v5;

    v2->_tagsSize = 0;
    v2->_pluginCacheSize = 0;
    v2->_maxPathLength = 0;
  }
  return v2;
}

- (void)addPath:(id)a3 fixedPath:(BOOL)a4 size:(unint64_t)a5
{
  _BOOL4 v6;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t maxPathLength;
  unint64_t v13;
  unint64_t v14;

  v6 = a4;
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a3;
  objc_msgSend(v8, "numberWithUnsignedLongLong:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 8;
  if (v6)
    v11 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v11), "setObject:forKeyedSubscript:", v10, v9);

  maxPathLength = self->_maxPathLength;
  v13 = objc_msgSend(v9, "length");

  if (maxPathLength <= v13)
    v14 = v13;
  else
    v14 = maxPathLength;
  self->_maxPathLength = v14;
}

- (void)updatePath:(id)a3 cacheSize:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataPathsSizes, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "unsignedLongLongValue") - a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataPathsSizes, "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (void)updatePath:(id)a3 cloneSize:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataPathsSizes, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "unsignedLongLongValue") + a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataPathsSizes, "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (void)addTagSize:(unint64_t)a3
{
  self->_tagsSize += a3;
}

- (void)addPluginCacheSize:(unint64_t)a3
{
  self->_pluginCacheSize += a3;
}

- (void)mergeWithAppSizeBreakdown:(id)a3
{
  NSMutableDictionary *dataPathsSizes;
  id v5;
  void *v6;
  NSMutableDictionary *fixedPathsSizes;
  void *v8;
  uint64_t v9;
  unint64_t maxPathLength;
  unint64_t v11;
  unint64_t v12;

  dataPathsSizes = self->_dataPathsSizes;
  v5 = a3;
  objc_msgSend(v5, "dataPathsSizes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](dataPathsSizes, "addEntriesFromDictionary:", v6);

  fixedPathsSizes = self->_fixedPathsSizes;
  objc_msgSend(v5, "fixedPathsSizes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](fixedPathsSizes, "addEntriesFromDictionary:", v8);

  self->_tagsSize += objc_msgSend(v5, "tagsSize");
  v9 = objc_msgSend(v5, "pluginCacheSize");
  maxPathLength = self->_maxPathLength;
  self->_pluginCacheSize += v9;
  v11 = objc_msgSend(v5, "maxPathLength");

  if (maxPathLength <= v11)
    v12 = v11;
  else
    v12 = maxPathLength;
  self->_maxPathLength = v12;
}

- (id)generateDictionary
{
  void *v3;
  NSMutableDictionary *dataPathsSizes;
  NSMutableDictionary *fixedPathsSizes;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDBCE70];
  dataPathsSizes = self->_dataPathsSizes;
  fixedPathsSizes = self->_fixedPathsSizes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tagsSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_pluginCacheSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxPathLength);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", dataPathsSizes, CFSTR("Data Paths"), fixedPathsSizes, CFSTR("Fixed Paths"), v6, CFSTR("Attribution Tags"), v7, CFSTR("Plugin Cache Size"), v8, CFSTR("Max Path Length"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMutableDictionary)dataPathsSizes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDataPathsSizes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)fixedPathsSizes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFixedPathsSizes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)tagsSize
{
  return self->_tagsSize;
}

- (void)setTagsSize:(unint64_t)a3
{
  self->_tagsSize = a3;
}

- (unint64_t)pluginCacheSize
{
  return self->_pluginCacheSize;
}

- (void)setPluginCacheSize:(unint64_t)a3
{
  self->_pluginCacheSize = a3;
}

- (unint64_t)maxPathLength
{
  return self->_maxPathLength;
}

- (void)setMaxPathLength:(unint64_t)a3
{
  self->_maxPathLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedPathsSizes, 0);
  objc_storeStrong((id *)&self->_dataPathsSizes, 0);
}

@end
