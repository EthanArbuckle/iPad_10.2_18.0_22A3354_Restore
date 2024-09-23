@implementation TUIAttributeSet

+ (id)set
{
  return objc_alloc_init((Class)a1);
}

+ (id)setWithArray:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:", v4);

  return v5;
}

- (TUIAttributeSet)initWithArray:(id)a3
{
  id v4;
  TUIAttributeSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  unsigned int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUIAttributeSet;
  v5 = -[TUIAttributeSet init](&v16, "init");
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = +[TUIAttributeRegistry attributeWithName:](TUIAttributeRegistry, "attributeWithName:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
          if (v10 >= 0x100)
            sub_87B1C("bitset set argument out of range");
          *(unint64_t *)((char *)v5->_bitset.__first_ + (((unint64_t)v10 >> 3) & 0x1FF8)) |= 1 << v10;
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
  return v5;
}

- (TUIAttributeSet)initWithSet:(id)a3
{
  id v4;
  TUIAttributeSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  unsigned int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUIAttributeSet;
  v5 = -[TUIAttributeSet init](&v16, "init");
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = +[TUIAttributeRegistry attributeWithName:](TUIAttributeRegistry, "attributeWithName:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
          if (v10 >= 0x100)
            sub_87B1C("bitset set argument out of range");
          *(unint64_t *)((char *)v5->_bitset.__first_ + (((unint64_t)v10 >> 3) & 0x1FF8)) |= 1 << v10;
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
  return v5;
}

- (TUIAttributeSet)initWithOther:(id)a3
{
  char *v4;
  char *v5;
  TUIAttributeSet *v6;
  __int128 v7;
  objc_super v9;

  v4 = (char *)a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIAttributeSet;
  v5 = -[TUIAttributeSet init](&v9, "init");
  v6 = (TUIAttributeSet *)v5;
  if (v4 && v5)
  {
    v7 = *(_OWORD *)(v4 + 8);
    *(_OWORD *)(v5 + 24) = *(_OWORD *)(v4 + 24);
    *(_OWORD *)(v5 + 8) = v7;
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TUIAttributeSet initWithOther:](+[TUIMutableAttributeSet allocWithZone:](TUIMutableAttributeSet, "allocWithZone:", a3), "initWithOther:", self);
}

- (const)_bitset
{
  return &self->_bitset;
}

- (BOOL)containsAttribute:(unsigned __int16)a3
{
  _BOOL8 v3;

  if (a3 == 0xFFFF)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    if (a3 >= 0x100u)
      sub_87B1C("bitset test argument out of range");
    return (*(unint64_t *)((char *)self->_bitset.__first_ + (((unint64_t)a3 >> 3) & 0x1FF8)) >> a3) & 1;
  }
  return v3;
}

- (unint64_t)count
{
  char v3;

  v3 = 1;
  return sub_163588((int8x8_t *)&self->_bitset, 0, (uint64_t)&self[1], 0, &v3);
}

- (id)setByAddingAttributesFromSet:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[TUIAttributeSet mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "unionSet:", v4);

  return v5;
}

- (id)setByAddingAttributesFromArray:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = -[TUIAttributeSet mutableCopy](self, "mutableCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUIAttributeSet setWithArray:](TUIAttributeSet, "setWithArray:", v4));
  objc_msgSend(v5, "unionSet:", v6);

  return v5;
}

+ (id)allSupportedAttributes
{
  if (qword_2CBA50 != -1)
    dispatch_once(&qword_2CBA50, &stru_243028);
  return (id)qword_2CBA48;
}

+ (id)globallySupportedAttributes
{
  if (qword_2CBA60 != -1)
    dispatch_once(&qword_2CBA60, &stru_243048);
  return (id)qword_2CBA58;
}

+ (id)supportedAttributesStyling
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_162888;
  block[3] = &unk_23EBF8;
  block[4] = a1;
  if (qword_2CBA70 != -1)
    dispatch_once(&qword_2CBA70, block);
  return (id)qword_2CBA68;
}

+ (id)supportedAttributesTextStyling
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_162D58;
  block[3] = &unk_23EBF8;
  block[4] = a1;
  if (qword_2CBA80 != -1)
    dispatch_once(&qword_2CBA80, block);
  return (id)qword_2CBA78;
}

+ (id)supportedAttributesSize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_162EEC;
  block[3] = &unk_23EBF8;
  block[4] = a1;
  if (qword_2CBA90 != -1)
    dispatch_once(&qword_2CBA90, block);
  return (id)qword_2CBA88;
}

+ (id)supportedAttributesSizeAndIntrinsic
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_163138;
  block[3] = &unk_23EBF8;
  block[4] = a1;
  if (qword_2CBAA0 != -1)
    dispatch_once(&qword_2CBAA0, block);
  return (id)qword_2CBA98;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
