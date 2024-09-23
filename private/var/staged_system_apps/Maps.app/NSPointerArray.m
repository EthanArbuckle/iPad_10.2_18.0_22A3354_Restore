@implementation NSPointerArray

- (id)_maps_lastObject
{
  void *v3;

  v3 = -[NSPointerArray count](self, "count");
  if (v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPointerArray pointerAtIndex:](self, "pointerAtIndex:", (char *)-[NSPointerArray count](self, "count") - 1));
  return v3;
}

- (BOOL)_maps_containsObject:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  BOOL v7;

  v4 = a3;
  if (v4 && -[NSPointerArray count](self, "count"))
  {
    v5 = 0;
    do
    {
      v6 = -[NSPointerArray pointerAtIndex:](self, "pointerAtIndex:", v5);
      v7 = v6 == v4;
      if (v6 == v4)
        break;
      ++v5;
    }
    while (v5 < -[NSPointerArray count](self, "count"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_maps_moveOrAddObjectToTop:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    if (-[NSPointerArray count](self, "count"))
    {
      v5 = 0;
      while (-[NSPointerArray pointerAtIndex:](self, "pointerAtIndex:", v5) != v6)
      {
        if (++v5 >= -[NSPointerArray count](self, "count"))
          goto LABEL_8;
      }
      -[NSPointerArray removePointerAtIndex:](self, "removePointerAtIndex:", v5);
    }
LABEL_8:
    -[NSPointerArray addPointer:](self, "addPointer:", v6);
    v4 = v6;
  }

}

- (void)_maps_removeObject:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (v5 && -[NSPointerArray count](self, "count"))
  {
    v4 = 0;
    while (-[NSPointerArray pointerAtIndex:](self, "pointerAtIndex:", v4) != v5)
    {
      if (++v4 >= -[NSPointerArray count](self, "count"))
        goto LABEL_8;
    }
    -[NSPointerArray removePointerAtIndex:](self, "removePointerAtIndex:", v4);
  }
LABEL_8:

}

- (void)_maps_removeAllObjects
{
  -[NSPointerArray setCount:](self, "setCount:", 0);
}

- (void)_maps_compact
{
  -[NSPointerArray addPointer:](self, "addPointer:", 0);
  -[NSPointerArray compact](self, "compact");
}

@end
