@implementation BKTouchContactSet

- (id)copy
{
  BKTouchContactSet *v3;
  NSMutableArray *v4;
  NSMutableArray *contacts;
  uint64_t i;

  v3 = objc_alloc_init(BKTouchContactSet);
  v4 = (NSMutableArray *)-[NSMutableArray mutableCopy](self->_contacts, "mutableCopy");
  contacts = v3->_contacts;
  v3->_contacts = v4;

  for (i = 16; i != 256; i += 8)
    *(Class *)((char *)&v3->super.isa + i) = *(Class *)((char *)&self->super.isa + i);
  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)-[NSMutableArray countByEnumeratingWithState:objects:count:](self->_contacts, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (BKTouchContactSet)init
{
  BKTouchContactSet *v2;
  NSMutableArray *v3;
  NSMutableArray *contacts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKTouchContactSet;
  v2 = -[BKTouchContactSet init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    contacts = v2->_contacts;
    v2->_contacts = v3;

  }
  return v2;
}

- (int64_t)count
{
  return (int64_t)-[NSMutableArray count](self->_contacts, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self->_contacts);
}

@end
