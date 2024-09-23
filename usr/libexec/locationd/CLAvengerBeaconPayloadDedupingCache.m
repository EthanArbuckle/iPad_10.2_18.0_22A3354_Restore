@implementation CLAvengerBeaconPayloadDedupingCache

- (CLAvengerBeaconPayloadDedupingCache)init
{
  CLAvengerBeaconPayloadDedupingCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLAvengerBeaconPayloadDedupingCache;
  v2 = -[CLAvengerBeaconPayloadDedupingCache init](&v4, "init");
  if (v2)
    v2->_beaconPayloadCache = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAvengerBeaconPayloadDedupingCache;
  -[CLAvengerBeaconPayloadDedupingCache dealloc](&v3, "dealloc");
}

- (BOOL)isNewPayload:(id)a3
{
  id v5;
  id v6;

  -[CLAvengerBeaconPayloadDedupingCache pruneCache](self, "pruneCache");
  if (-[NSMutableArray count](self->_beaconPayloadCache, "count"))
  {
    v5 = -[NSMutableArray reverseObjectEnumerator](self->_beaconPayloadCache, "reverseObjectEnumerator");
    while (1)
    {
      v6 = objc_msgSend(v5, "nextObject");
      if (!v6)
        break;
      if ((objc_msgSend(a3, "isEqualToPayload:", v6) & 1) != 0)
        return 0;
    }
  }
  -[CLAvengerBeaconPayloadDedupingCache appendPayload:](self, "appendPayload:", a3);
  return 1;
}

- (void)appendPayload:(id)a3
{
  -[NSMutableArray addObject:](self->_beaconPayloadCache, "addObject:", a3);
}

- (void)pruneCache
{
  uint64_t v3;
  uint64_t v4;
  NSMutableArray *beaconPayloadCache;
  id v6;
  _QWORD v7[6];

  -[NSDate timeIntervalSinceReferenceDate](+[NSDate now](NSDate, "now"), "timeIntervalSinceReferenceDate");
  v4 = v3;
  v6 = objc_alloc_init((Class)NSMutableIndexSet);
  beaconPayloadCache = self->_beaconPayloadCache;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10108C118;
  v7[3] = &unk_10219E418;
  v7[5] = v4;
  v7[4] = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](beaconPayloadCache, "enumerateObjectsUsingBlock:", v7);
  -[NSMutableArray removeObjectsAtIndexes:](self->_beaconPayloadCache, "removeObjectsAtIndexes:", v6);

}

- (void)pruneCacheWithSize:(int64_t)a3
{
  NSMutableArray *i;

  for (i = self->_beaconPayloadCache;
        (unint64_t)-[NSMutableArray count](i, "count") > a3;
        i = self->_beaconPayloadCache)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_beaconPayloadCache, "removeObjectAtIndex:", 0);
  }
}

- (void)removeAllObjects
{
  -[NSMutableArray removeAllObjects](self->_beaconPayloadCache, "removeAllObjects");
}

- (NSMutableArray)beaconPayloadCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBeaconPayloadCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

@end
