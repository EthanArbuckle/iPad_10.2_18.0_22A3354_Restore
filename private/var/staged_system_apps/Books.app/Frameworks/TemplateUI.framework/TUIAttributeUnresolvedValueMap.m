@implementation TUIAttributeUnresolvedValueMap

- (TUIAttributeUnresolvedValueMap)initWithOther:(id)a3
{
  TUIAttributeUnresolvedValueMap *v4;
  TUIAttributeUnresolvedValueMap *v5;
  TUIAttributeUnresolvedValueMap *v6;
  BOOL v7;
  objc_super v9;

  v4 = (TUIAttributeUnresolvedValueMap *)a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIAttributeUnresolvedValueMap;
  v5 = -[TUIAttributeUnresolvedValueMap init](&v9, "init");
  v6 = v5;
  if (v4)
  {
    if (v5)
      v7 = v5 == v4;
    else
      v7 = 1;
    if (!v7)
    {
      v5->_map.__table_.__p3_.__value_ = v4->_map.__table_.__p3_.__value_;
      sub_34C20(&v5->_map.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v4->_map.__table_.__p1_.__value_.__next_, 0);
    }
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TUIAttributeUnresolvedValueMap initWithOther:](+[TUIMutableAttributeUnresolvedValueMap allocWithZone:](TUIMutableAttributeUnresolvedValueMap, "allocWithZone:", a3), "initWithOther:", self);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)valueForAttribute:(unsigned __int16)a3
{
  uint64_t **v3;
  $738B17BD11CC339B30296C0EA03CEC2B *v4;
  unsigned __int16 v6;

  v6 = a3;
  v3 = sub_1529C(&self->_map.__table_.__bucket_list_.__ptr_.__value_, &v6);
  v4 = ($738B17BD11CC339B30296C0EA03CEC2B *)v3 + 5;
  if (!v3)
    v4 = ($738B17BD11CC339B30296C0EA03CEC2B *)&TUIValueNil;
  return ($738B17BD11CC339B30296C0EA03CEC2B)v4->var0;
}

- (void)enumerateAttributesAndValuesUsingBlock:(id)a3
{
  id v4;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned short, TUIValue>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned short, TUIValue>, void *>>> *p_p1;
  char v6;

  v4 = a3;
  v6 = 0;
  p_p1 = &self->_map.__table_.__p1_;
  do
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned short, TUIValue>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned short, TUIValue>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1)
      break;
    (*((void (**)(id, _QWORD, _QWORD, char *))v4 + 2))(v4, LOWORD(p_p1[2].__value_.__next_), HIDWORD(p_p1[2].__value_.__next_), &v6);
  }
  while (!v6);

}

- (void).cxx_destruct
{
  sub_14B0C((uint64_t)&self->_map);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end
