@implementation TUIMutableAttributeValueMap

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUIAttributeValueMap init](+[TUIAttributeValueMap allocWithZone:](TUIAttributeValueMap, "allocWithZone:", a3), "init");
}

- (void)setValue:(const ResolvedValue *)a3 forAttribute:(unsigned __int16)a4
{
  _QWORD *v5;
  unsigned __int16 v6;
  unsigned __int16 *v7;

  v6 = a4;
  v7 = &v6;
  v5 = sub_35914((uint64_t)&self->super._map, &v6, (uint64_t)&std::piecewise_construct, &v7);
  *((_DWORD *)v5 + 6) = a3->_kind;
  objc_storeStrong((id *)v5 + 4, a3->_object);
  v5[5] = a3->var0._integer;
}

@end
