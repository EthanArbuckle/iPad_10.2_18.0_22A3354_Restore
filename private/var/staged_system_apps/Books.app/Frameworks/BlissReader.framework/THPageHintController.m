@implementation THPageHintController

- (THPageHintController)init
{
  THPageHintController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THPageHintController;
  v2 = -[THPageHintController init](&v4, "init");
  if (v2)
    v2->_pageHints = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_pageHints = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPageHintController;
  -[THPageHintController dealloc](&v3, "dealloc");
}

- (BOOL)hasFullHintForRelativePageIndex:(unint64_t)a3
{
  unsigned int v5;

  objc_sync_enter(self);
  if ((unint64_t)-[NSMutableArray count](self->_pageHints, "count") <= a3)
    LOBYTE(v5) = 0;
  else
    v5 = objc_msgSend(-[NSMutableArray objectAtIndex:](self->_pageHints, "objectAtIndex:", a3), "isEqual:", +[NSNull null](NSNull, "null")) ^ 1;
  objc_sync_exit(self);
  return v5;
}

- (void)setHint:(id)a3 forRelativePageIndex:(unint64_t)a4
{
  objc_sync_enter(self);
  while ((unint64_t)-[NSMutableArray count](self->_pageHints, "count") <= a4)
    -[NSMutableArray addObject:](self->_pageHints, "addObject:", +[NSNull null](NSNull, "null"));
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_pageHints, "replaceObjectAtIndex:withObject:", a4, a3);
  objc_sync_exit(self);
}

- (void)clearHintsOnRelativePageIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  if ((unint64_t)-[NSMutableArray count](self->_pageHints, "count") > a3)
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_pageHints, "replaceObjectAtIndex:withObject:", a3, +[NSNull null](NSNull, "null"));
  objc_sync_exit(self);
}

- (id)hintForRelativePageIndex:(unint64_t)a3
{
  NSNull *v5;

  v5 = +[NSNull null](NSNull, "null");
  objc_sync_enter(self);
  if ((unint64_t)-[NSMutableArray count](self->_pageHints, "count") > a3)
    v5 = (NSNull *)-[NSMutableArray objectAtIndex:](self->_pageHints, "objectAtIndex:", a3);
  objc_sync_exit(self);
  return v5;
}

- (void)removeAllHints
{
  objc_sync_enter(self);
  -[NSMutableArray removeAllObjects](self->_pageHints, "removeAllObjects");
  objc_sync_exit(self);
}

- (void)clearHintsStartingAtRelativePageIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  -[NSMutableArray removeObjectsInRange:](self->_pageHints, "removeObjectsInRange:", a3, (char *)-[NSMutableArray count](self->_pageHints, "count") - a3);
  objc_sync_exit(self);
}

- (unint64_t)pageCount
{
  id v3;

  objc_sync_enter(self);
  v3 = -[NSMutableArray count](self->_pageHints, "count");
  objc_sync_exit(self);
  return (unint64_t)v3;
}

- (NSArray)pageHints
{
  NSArray *v3;

  objc_sync_enter(self);
  v3 = (NSArray *)-[NSMutableArray copy](self->_pageHints, "copy");
  objc_sync_exit(self);
  return v3;
}

- (void)setPageHints:(id)a3
{
  objc_sync_enter(self);
  -[NSMutableArray removeAllObjects](self->_pageHints, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_pageHints, "addObjectsFromArray:", a3);
  objc_sync_exit(self);
}

@end
