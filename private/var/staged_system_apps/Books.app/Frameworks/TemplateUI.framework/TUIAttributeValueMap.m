@implementation TUIAttributeValueMap

- (TUIAttributeValueMap)initWithOther:(id)a3
{
  id v4;
  TUIAttributeValueMap *v5;
  unordered_map<unsigned short, TUI::Evaluation::ResolvedValue, std::hash<unsigned short>, std::equal_to<unsigned short>, std::allocator<std::pair<const unsigned short, TUI::Evaluation::ResolvedValue>>> *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIAttributeValueMap;
  v5 = -[TUIAttributeValueMap init](&v8, "init");
  if (v5)
  {
    v6 = (unordered_map<unsigned short, TUI::Evaluation::ResolvedValue, std::hash<unsigned short>, std::equal_to<unsigned short>, std::allocator<std::pair<const unsigned short, TUI::Evaluation::ResolvedValue>>> *)objc_msgSend(v4, "map");
    if (&v5->_map != v6)
    {
      v5->_map.__table_.__p3_.__value_ = v6->__table_.__p3_.__value_;
      sub_355FC(&v5->_map.__table_.__bucket_list_.__ptr_.__value_, (_QWORD *)v6->__table_.__p1_.__value_.__next_, 0);
    }
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TUIAttributeValueMap initWithOther:](+[TUIMutableAttributeValueMap allocWithZone:](TUIMutableAttributeValueMap, "allocWithZone:", a3), "initWithOther:", self);
}

- (void)map
{
  return &self->_map;
}

- (ResolvedValue)valueForAttribute:(SEL)a3
{
  ResolvedValue *result;
  ResolvedValue *v6;
  int kind;
  unsigned __int16 v8;

  v8 = a4;
  result = (ResolvedValue *)sub_1529C(&self->_map.__table_.__bucket_list_.__ptr_.__value_, &v8);
  if (result)
  {
    v6 = result;
    kind = result[1]._kind;
    result = result[1]._object;
    retstr->var0._integer = v6[1].var0._integer;
  }
  else
  {
    kind = 0;
  }
  retstr->_kind = kind;
  retstr->_object = (_value *)result;
  return result;
}

- (void).cxx_destruct
{
  sub_358DC((uint64_t)&self->_map);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end
