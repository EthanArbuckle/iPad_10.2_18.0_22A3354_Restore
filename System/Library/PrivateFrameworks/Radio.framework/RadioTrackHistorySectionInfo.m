@implementation RadioTrackHistorySectionInfo

- (id)copyWithZone:(_NSZone *)a3
{
  RadioTrackHistorySectionInfo *v4;
  uint64_t v5;
  NSString *indexTitle;
  uint64_t v7;
  NSString *name;
  uint64_t v9;
  NSArray *objects;

  v4 = -[RadioTrackHistorySectionInfo init](+[RadioTrackHistorySectionInfo allocWithZone:](RadioTrackHistorySectionInfo, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_indexTitle, "copy");
  indexTitle = v4->_indexTitle;
  v4->_indexTitle = (NSString *)v5;

  v7 = -[NSString copy](self->_name, "copy");
  name = v4->_name;
  v4->_name = (NSString *)v7;

  v4->_numberOfObjects = self->_numberOfObjects;
  v9 = -[NSArray copy](self->_objects, "copy");
  objects = v4->_objects;
  v4->_objects = (NSArray *)v9;

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  RadioMutableTrackHistorySectionInfo *v4;
  uint64_t v5;
  NSString *indexTitle;
  uint64_t v7;
  NSString *name;
  uint64_t v9;
  NSArray *objects;

  v4 = -[RadioMutableTrackHistorySectionInfo init](+[RadioMutableTrackHistorySectionInfo allocWithZone:](RadioMutableTrackHistorySectionInfo, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_indexTitle, "copy");
  indexTitle = v4->super._indexTitle;
  v4->super._indexTitle = (NSString *)v5;

  v7 = -[NSString copy](self->_name, "copy");
  name = v4->super._name;
  v4->super._name = (NSString *)v7;

  v4->super._numberOfObjects = self->_numberOfObjects;
  v9 = -[NSArray copy](self->_objects, "copy");
  objects = v4->super._objects;
  v4->super._objects = (NSArray *)v9;

  return v4;
}

- (NSString)indexTitle
{
  return self->_indexTitle;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)numberOfObjects
{
  return self->_numberOfObjects;
}

- (NSArray)objects
{
  return self->_objects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_indexTitle, 0);
}

@end
