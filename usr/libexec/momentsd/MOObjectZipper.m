@implementation MOObjectZipper

- (MOObjectZipper)initWithObjects:(id)a3 others:(id)a4 comparator:(id)a5
{
  id v8;
  id v9;
  id v10;
  MOObjectZipper *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSEnumerator *objectEnumerator;
  uint64_t v16;
  NSEnumerator *otherEnumerator;
  uint64_t v18;
  id object;
  uint64_t v20;
  id other;
  id v22;
  id objectComparator;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MOObjectZipper;
  v11 = -[MOObjectZipper init](&v25, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingComparator:", v10));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingComparator:", v10));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectEnumerator"));
    objectEnumerator = v11->objectEnumerator;
    v11->objectEnumerator = (NSEnumerator *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectEnumerator"));
    otherEnumerator = v11->otherEnumerator;
    v11->otherEnumerator = (NSEnumerator *)v16;

    v18 = objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](v11->objectEnumerator, "nextObject"));
    object = v11->object;
    v11->object = (id)v18;

    v20 = objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](v11->otherEnumerator, "nextObject"));
    other = v11->other;
    v11->other = (id)v20;

    v22 = objc_retainBlock(v10);
    objectComparator = v11->objectComparator;
    v11->objectComparator = v22;

    v8 = v12;
    v9 = v13;
  }

  return v11;
}

- (BOOL)nextObjectPairWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (self->object && self->other)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v6 = (*((uint64_t (**)(void))self->objectComparator + 2))();
    v7 = 16;
    if (v6 == -1)
    {
      v7 = 8;
      v8 = 24;
    }
    else
    {
      v8 = 32;
    }
    v9 = (objc_class *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.isa + v7), "nextObject"));
    v10 = *(Class *)((char *)&self->super.isa + v8);
    *(Class *)((char *)&self->super.isa + v8) = v9;

    v11 = -[MOObjectZipper hasNextObjectPair](self, "hasNextObjectPair");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasNextObjectPair
{
  return self->object && self->other != 0;
}

- (NSArray)objects
{
  return self->_objects;
}

- (NSArray)others
{
  return self->_others;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_others, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong(&self->objectComparator, 0);
  objc_storeStrong(&self->other, 0);
  objc_storeStrong(&self->object, 0);
  objc_storeStrong((id *)&self->otherEnumerator, 0);
  objc_storeStrong((id *)&self->objectEnumerator, 0);
}

@end
