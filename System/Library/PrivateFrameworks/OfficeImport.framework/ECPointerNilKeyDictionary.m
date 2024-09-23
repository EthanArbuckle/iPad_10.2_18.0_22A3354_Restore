@implementation ECPointerNilKeyDictionary

- (id)objectForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)ECPointerNilKeyDictionary;
    -[OITSUNoCopyDictionary objectForKey:](&v8, sel_objectForKey_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->mNilKeyObject;
  }
  v6 = v5;

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  objc_super v9;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)ECPointerNilKeyDictionary;
    -[OITSUNoCopyDictionary setObject:forKey:](&v9, sel_setObject_forKey_, v7, v8);
  }
  else
  {
    objc_storeStrong(&self->mNilKeyObject, a3);
  }

}

- (void)setObject:(id)a3 forUncopiedKey:(id)a4
{
  id v7;
  id v8;
  objc_super v9;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)ECPointerNilKeyDictionary;
    -[OITSUNoCopyDictionary setObject:forUncopiedKey:](&v9, sel_setObject_forUncopiedKey_, v7, v8);
  }
  else
  {
    objc_storeStrong(&self->mNilKeyObject, a3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mNilKeyObject, 0);
}

@end
