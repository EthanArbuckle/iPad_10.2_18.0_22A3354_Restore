@implementation TUIMutableAttributeSet

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUIAttributeSet initWithOther:](+[TUIAttributeSet allocWithZone:](TUIAttributeSet, "allocWithZone:", a3), "initWithOther:", self);
}

- (void)addAttribute:(unsigned __int16)a3
{
  if (a3 >= 0x100u)
    sub_87B1C("bitset set argument out of range");
  *(unint64_t *)((char *)self->super._bitset.__first_ + (((unint64_t)a3 >> 3) & 0x1FF8)) |= 1 << a3;
}

- (void)removeAttribute:(unsigned __int16)a3
{
  if (a3 >= 0x100u)
    sub_87B1C("bitset reset argument out of range");
  *(unint64_t *)((char *)self->super._bitset.__first_ + (((unint64_t)a3 >> 3) & 0x1FF8)) &= ~(1 << a3);
}

- (void)addAttributesFromArray:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  bitset<256UL> *p_bitset;
  void *v8;
  unsigned int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    p_bitset = &self->super._bitset;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v9 = +[TUIAttributeRegistry attributeWithName:](TUIAttributeRegistry, "attributeWithName:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), (_QWORD)v10);
        if (v9 >= 0x100)
          sub_87B1C("bitset set argument out of range");
        *(unint64_t *)((char *)p_bitset->__first_ + (((unint64_t)v9 >> 3) & 0x1FF8)) |= 1 << v9;
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)unionSet:(id)a3
{
  uint64_t i;

  if (a3)
  {
    for (i = 0; i != 4; ++i)
      self->super._bitset.__first_[i] |= *(_QWORD *)((char *)a3 + i * 8 + 8);
  }
}

@end
