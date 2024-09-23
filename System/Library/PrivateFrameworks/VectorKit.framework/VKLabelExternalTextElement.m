@implementation VKLabelExternalTextElement

- (VKLabelExternalTextElement)initWithTextElement:(const void *)a3
{
  VKLabelExternalTextElement *v4;
  VKLabelExternalTextElement *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKLabelExternalTextElement;
  v4 = -[VKLabelExternalTextElement init](&v7, sel_init);
  v5 = v4;
  if (v4)
    md::LabelExternalTextElement::operator=((uint64_t)&v4->_element, a3);
  return v5;
}

- (VKLabelExternalTextElement)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  const char *v6;
  unsigned __int8 v7;
  size_t v8;
  size_t v9;
  const std::string::value_type **p_dst;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const std::string::value_type *v14;
  std::string::size_type v15;
  const std::string::value_type *v16;
  const char *v17;
  unsigned __int8 v18;
  size_t v19;
  size_t v20;
  const std::string::value_type **v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const std::string::value_type *v25;
  std::string::size_type v26;
  const std::string::value_type *v27;
  id v28;
  const char *v29;
  unsigned __int8 v30;
  size_t v31;
  size_t v32;
  const std::string::value_type **v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const std::string::value_type *v37;
  std::string::size_type v38;
  const std::string::value_type *v39;
  id v40;
  const char *v41;
  unsigned __int8 v42;
  size_t v43;
  size_t v44;
  const std::string::value_type **v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  const std::string::value_type *v49;
  std::string::size_type v50;
  const std::string::value_type *v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  const std::string::value_type *__dst;
  size_t v60;
  int64_t v61;
  uint64_t v62;
  objc_super v63;

  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)VKLabelExternalTextElement;
  v5 = -[VKLabelExternalTextElement init](&v63, sel_init);
  if (!v5)
    goto LABEL_71;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v58, "UTF8String");
  {
    v53 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v53, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v62 = mdm::Allocator::instance(void)::alloc;
  v8 = strlen(v6);
  if (v8 > 0x7FFFFFFFFFFFFFF7)
    abort();
  v9 = v8;
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    p_dst = (const std::string::value_type **)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 16))(mdm::Allocator::instance(void)::alloc, v11 + 1, 1);
    v60 = v9;
    v61 = v12 | 0x8000000000000000;
    __dst = (const std::string::value_type *)p_dst;
    goto LABEL_10;
  }
  HIBYTE(v61) = v8;
  p_dst = &__dst;
  if (v8)
LABEL_10:
    memmove(p_dst, v6, v9);
  *((_BYTE *)p_dst + v9) = 0;
  v13 = SHIBYTE(v61);
  v14 = __dst;
  if (v61 >= 0)
    v15 = HIBYTE(v61);
  else
    v15 = v60;
  if (v61 >= 0)
    v16 = (const std::string::value_type *)&__dst;
  else
    v16 = __dst;
  std::string::__assign_external((std::string *)(v5 + 16), v16, v15);
  if (v13 < 0)
    (*(void (**)(uint64_t, const std::string::value_type *, int64_t))(*(_QWORD *)v62 + 40))(v62, v14, v61 & 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textLocale"));
  v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = (const char *)objc_msgSend(v57, "UTF8String");
  {
    v54 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v54, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v62 = mdm::Allocator::instance(void)::alloc;
  v19 = strlen(v17);
  if (v19 > 0x7FFFFFFFFFFFFFF7)
    abort();
  v20 = v19;
  if (v19 >= 0x17)
  {
    v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v22 = v19 | 7;
    v23 = v22 + 1;
    v21 = (const std::string::value_type **)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                                                 + 16))(mdm::Allocator::instance(void)::alloc, v22 + 1, 1);
    v60 = v20;
    v61 = v23 | 0x8000000000000000;
    __dst = (const std::string::value_type *)v21;
    goto LABEL_27;
  }
  HIBYTE(v61) = v19;
  v21 = &__dst;
  if (v19)
LABEL_27:
    memmove(v21, v17, v20);
  *((_BYTE *)v21 + v20) = 0;
  v24 = SHIBYTE(v61);
  v25 = __dst;
  if (v61 >= 0)
    v26 = HIBYTE(v61);
  else
    v26 = v60;
  if (v61 >= 0)
    v27 = (const std::string::value_type *)&__dst;
  else
    v27 = __dst;
  std::string::__assign_external((std::string *)(v5 + 40), v27, v26);
  if (v24 < 0)
    (*(void (**)(uint64_t, const std::string::value_type *, int64_t))(*(_QWORD *)v62 + 40))(v62, v25, v61 & 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedText"));
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29 = (const char *)objc_msgSend(v28, "UTF8String");
  {
    v55 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v55, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v62 = mdm::Allocator::instance(void)::alloc;
  v31 = strlen(v29);
  if (v31 > 0x7FFFFFFFFFFFFFF7)
    abort();
  v32 = v31;
  if (v31 >= 0x17)
  {
    v34 = (v31 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v31 | 7) != 0x17)
      v34 = v31 | 7;
    v35 = v34 + 1;
    v33 = (const std::string::value_type **)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                                                 + 16))(mdm::Allocator::instance(void)::alloc, v34 + 1, 1);
    v60 = v32;
    v61 = v35 | 0x8000000000000000;
    __dst = (const std::string::value_type *)v33;
    goto LABEL_44;
  }
  HIBYTE(v61) = v31;
  v33 = &__dst;
  if (v31)
LABEL_44:
    memmove(v33, v29, v32);
  *((_BYTE *)v33 + v32) = 0;
  v36 = SHIBYTE(v61);
  v37 = __dst;
  if (v61 >= 0)
    v38 = HIBYTE(v61);
  else
    v38 = v60;
  if (v61 >= 0)
    v39 = (const std::string::value_type *)&__dst;
  else
    v39 = __dst;
  std::string::__assign_external((std::string *)(v5 + 64), v39, v38);
  if (v36 < 0)
    (*(void (**)(uint64_t, const std::string::value_type *, int64_t))(*(_QWORD *)v62 + 40))(v62, v37, v61 & 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTextLocale"));
  v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v41 = (const char *)objc_msgSend(v40, "UTF8String");
  {
    v56 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v56, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v62 = mdm::Allocator::instance(void)::alloc;
  v43 = strlen(v41);
  if (v43 > 0x7FFFFFFFFFFFFFF7)
    abort();
  v44 = v43;
  if (v43 >= 0x17)
  {
    v46 = (v43 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v43 | 7) != 0x17)
      v46 = v43 | 7;
    v47 = v46 + 1;
    v45 = (const std::string::value_type **)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                                                 + 16))(mdm::Allocator::instance(void)::alloc, v46 + 1, 1);
    v60 = v44;
    v61 = v47 | 0x8000000000000000;
    __dst = (const std::string::value_type *)v45;
  }
  else
  {
    HIBYTE(v61) = v43;
    v45 = &__dst;
    if (!v43)
      goto LABEL_62;
  }
  memmove(v45, v41, v44);
LABEL_62:
  *((_BYTE *)v45 + v44) = 0;
  v48 = SHIBYTE(v61);
  v49 = __dst;
  if (v61 >= 0)
    v50 = HIBYTE(v61);
  else
    v50 = v60;
  if (v61 >= 0)
    v51 = (const std::string::value_type *)&__dst;
  else
    v51 = __dst;
  std::string::__assign_external((std::string *)(v5 + 88), v51, v50);
  if (v48 < 0)
    (*(void (**)(uint64_t, const std::string::value_type *, int64_t))(*(_QWORD *)v62 + 40))(v62, v49, v61 & 0x7FFFFFFFFFFFFFFFLL);
  v5[9] = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("textType"));
  v5[8] = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("minZoom"));

LABEL_71:
  return (VKLabelExternalTextElement *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  StringWithLocaleImp<std::string> *p_text;
  void *v5;
  int *p_var0;
  void *v7;
  LabelExternalTextElement *p_element;
  void *v9;
  _QWORD *v10;
  void *v11;
  id v12;

  v12 = a3;
  p_text = &self->_element.text;
  if (*((char *)&self->_element.text.text.__r_.__value_.var0.__l + 23) < 0)
    p_text = (StringWithLocaleImp<std::string> *)p_text->text.__r_.__value_.var0.__l.__data_;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_text);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("text"));
  p_var0 = &self->_element.text.text.__r_.var0;
  if (SHIBYTE(self[1].super.isa) < 0)
    p_var0 = *(int **)p_var0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("textLocale"));
  p_element = &self[1]._element;
  if (self[1]._element.text.text.__r_.__value_.var0.__s.__data_[15] < 0)
    p_element = *(LabelExternalTextElement **)&p_element->minZoom;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_element);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("localizedText"));
  v10 = &self[1]._element.text.text.__r_.__value_.var0.__l + 1;
  if (SHIBYTE(self[1]._element.text.text.var0) < 0)
    v10 = (_QWORD *)*v10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("localizedTextLocale"));
  objc_msgSend(v12, "encodeInt32:forKey:", self->_element.textType, CFSTR("textType"));
  objc_msgSend(v12, "encodeInt32:forKey:", self->_element.minZoom, CFSTR("minZoom"));

}

- (const)element
{
  return &self->_element;
}

- (void).cxx_destruct
{
  if (SHIBYTE(self[1]._element.text.text.var0) < 0)
  {
    operator delete(*((void **)&self[1]._element.text.text.__r_.__value_.var0.__l + 2));
    if ((self[1]._element.text.text.__r_.__value_.var0.__s.__data_[15] & 0x80000000) == 0)
    {
LABEL_3:
      if ((SHIBYTE(self[1].super.isa) & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((self[1]._element.text.text.__r_.__value_.var0.__s.__data_[15] & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)&self[1]._element.minZoom);
  if ((SHIBYTE(self[1].super.isa) & 0x80000000) == 0)
  {
LABEL_4:
    if ((*((char *)&self->_element.text.text.__r_.__value_.var0.__l + 23) & 0x80000000) == 0)
      return;
LABEL_9:
    operator delete(self->_element.text.text.__r_.__value_.var0.__l.__data_);
    return;
  }
LABEL_8:
  operator delete(*(void **)&self->_element.text.text.__r_.var0);
  if (*((char *)&self->_element.text.text.__r_.__value_.var0.__l + 23) < 0)
    goto LABEL_9;
}

- (id).cxx_construct
{
  *((_WORD *)self + 4) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
