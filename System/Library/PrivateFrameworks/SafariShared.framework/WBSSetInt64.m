@implementation WBSSetInt64

- (WBSSetInt64)init
{
  WBSSetInt64 *v2;
  WBSSetInt64 *v3;
  WBSSetInt64 *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSSetInt64;
  v2 = -[WBSSetInt64 init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (WBSSetInt64)initWithInt64:(int64_t)a3
{
  WBSSetInt64 *v3;
  WBSSetInt64 *v4;
  WBSSetInt64 *v5;
  objc_super v7;
  int64_t v8;

  v7.receiver = self;
  v7.super_class = (Class)WBSSetInt64;
  v8 = a3;
  v3 = -[WBSSetInt64 init](&v7, sel_init);
  v4 = v3;
  if (v3)
  {
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v3->_set, (unint64_t *)&v8, &v8);
    v5 = v4;
  }

  return v4;
}

- (WBSSetInt64)initWithSet:(const void *)a3
{
  WBSSetInt64 *v4;
  WBSSetInt64 *v5;
  unordered_set<long long, std::hash<long long>, std::equal_to<long long>, std::allocator<long long>> *p_set;
  WBSSetInt64 *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSSetInt64;
  v4 = -[WBSSetInt64 init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    p_set = &v4->_set;
    if (&v5->_set != a3)
    {
      v5->_set.__table_.__p3_.__value_ = *((float *)a3 + 8);
      std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<long long,void *> *>>(p_set, *((_QWORD **)a3 + 2), 0);
    }
    v7 = v5;
  }

  return v5;
}

- (WBSSetInt64)initWithMovableSet:(void *)a3
{
  WBSSetInt64 *v4;
  WBSSetInt64 *v5;
  WBSSetInt64 *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSSetInt64;
  v4 = -[WBSSetInt64 init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__move_assign((uint64_t)&v4->_set, (uint64_t *)a3);
    v6 = v5;
  }

  return v5;
}

- (WBSSetInt64)initWithCoder:(id)a3
{
  id v4;
  WBSSetInt64 *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  WBSSetInt64 *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSSetInt64;
  v5 = -[WBSSetInt64 init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");
    if (v7 >= 8)
    {
      v8 = v7 >> 3;
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)&v5->_set, vcvtps_u32_f32((float)(v7 >> 3) / v5->_set.__table_.__p3_.__value_));
      v9 = (unint64_t *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
      if (v8 <= 1)
        v8 = 1;
      do
      {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v5->_set, v9, v9);
        ++v9;
        --v8;
      }
      while (v8);
    }
    v10 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t value;
  id v5;
  _QWORD *v6;
  _QWORD *i;
  id v8;

  v8 = a3;
  value = self->_set.__table_.__p2_.__value_;
  if (value)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * value);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (_QWORD *)objc_msgSend(v5, "mutableBytes");
    for (i = self->_set.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
      *v6++ = i[2];
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("data"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("data"));
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (const)set
{
  return &self->_set;
}

- (BOOL)contains:(int64_t)a3
{
  int64_t v4;

  v4 = a3;
  return std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(&self->_set.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v4) != 0;
}

- (unint64_t)count
{
  return self->_set.__table_.__p2_.__value_;
}

- (id)commaSeparatedValues
{
  _QWORD *next;
  char v4;
  uint64_t v5;
  std::string *p_p;
  std::string::size_type size;
  std::string *v8;
  void *v9;
  std::string __p;
  std::string v12;

  memset(&v12, 0, sizeof(v12));
  std::string::reserve(&v12, 3 * self->_set.__table_.__p2_.__value_);
  next = self->_set.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v4 = 1;
    do
    {
      v5 = next[2];
      if ((v4 & 1) == 0)
        std::string::append(&v12, ",", 1uLL);
      std::to_string(&__p, v5);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        size = __p.__r_.__value_.__l.__size_;
      std::string::append(&v12, (const std::string::value_type *)p_p, size);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v4 = 0;
      next = (_QWORD *)*next;
    }
    while (next);
  }
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v12;
  else
    v8 = (std::string *)v12.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  return v9;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&self->_set);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end
