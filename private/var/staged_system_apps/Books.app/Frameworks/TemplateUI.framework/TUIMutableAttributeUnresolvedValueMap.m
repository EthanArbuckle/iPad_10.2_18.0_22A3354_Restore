@implementation TUIMutableAttributeUnresolvedValueMap

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUIAttributeUnresolvedValueMap initWithOther:]([TUIAttributeUnresolvedValueMap alloc], "initWithOther:", self);
}

- (void)setValue:(id)a3 forAttribute:(unsigned __int16)a4
{
  unsigned __int16 v6;
  unsigned __int16 *v7;

  v6 = a4;
  if (TUIValueIsNil(a3.var0))
  {
    sub_35230(&self->super._map.__table_.__bucket_list_.__ptr_.__value_, &v6);
  }
  else
  {
    v7 = &v6;
    *(($738B17BD11CC339B30296C0EA03CEC2B *)sub_353D8((uint64_t)&self->super._map, &v6, (uint64_t)&std::piecewise_construct, &v7)+ 5) = a3;
  }
}

@end
