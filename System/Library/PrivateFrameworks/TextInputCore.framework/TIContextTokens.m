@implementation TIContextTokens

- (void)lmContext
{
  return self->_context;
}

- (TIContextTokens)init
{
  return -[TIContextTokens initWithContext:contextLength:contextStringTokens:](self, "initWithContext:contextLength:contextStringTokens:", 0, 0, MEMORY[0x1E0C9AA60]);
}

- (TIContextTokens)initWithContext:(const TITokenID *)a3 contextLength:(unint64_t)a4 contextStringTokens:(id)a5
{
  id v8;
  TIContextTokens *v9;
  unint64_t v10;
  unint64_t v11;
  std::string *v12;
  uint64_t v13;
  size_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::string *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  std::string *v30;
  char *v31;
  std::string *v32;
  objc_super v33;
  std::string **v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v33.receiver = self;
  v33.super_class = (Class)TIContextTokens;
  v9 = -[TIContextTokens init](&v33, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "count");
    v31 = 0;
    v32 = 0;
    v30 = 0;
    if (v10)
    {
      v11 = v10;
      if (v10 >= 0xAAAAAAAAAAAAAABLL)
        abort();
      v12 = (std::string *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v10);
      v30 = v12;
      v32 = &v12[v13];
      v14 = 24 * ((24 * v11 - 24) / 0x18) + 24;
      bzero(v12, v14);
      v31 = (char *)v12 + v14;
    }
    else
    {
      v12 = 0;
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v27;
      v20 = v12;
      v21 = *(_QWORD *)v27;
      while (1)
      {
        if (v21 != v19)
          objc_enumerationMutation(v15);
        v22 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v18));
        std::string::__assign_external(v20, (const std::string::value_type *)objc_msgSend(v22, "UTF8String", (_QWORD)v26));
        if (++v18 >= v17)
        {
          v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
          if (!v23)
            break;
          v17 = v23;
          v18 = 0;
        }
        v21 = *(_QWORD *)v27;
        ++v20;
      }
    }

    v24 = operator new();
    v9->_context = (void *)KB::LanguageModelContext::LanguageModelContext(v24, (unint64_t *)a3, a4, (uint64_t)v12);
    v34 = &v30;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v34);
  }

  return v9;
}

- (void)dealloc
{
  char *context;
  void *v4;
  uint64_t v5;
  objc_super v6;
  void **v7;

  context = (char *)self->_context;
  if (context)
  {
    v7 = (void **)(context + 80);
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v7);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(context + 72));
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(context + 64));
    v4 = (void *)*((_QWORD *)context + 2);
    if (v4)
    {
      *((_QWORD *)context + 3) = v4;
      operator delete(v4);
    }
    v5 = std::shared_ptr<language_modeling::v1::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)context);
    MEMORY[0x1DF0A2144](v5, 0x1020C40C12D0AD1);
  }
  v6.receiver = self;
  v6.super_class = (Class)TIContextTokens;
  -[TIContextTokens dealloc](&v6, sel_dealloc);
}

- (void)appendToken:(TITokenID)a3 string:(id)a4
{
  KB::LanguageModelContext *context;
  void *__p[2];
  char v7;

  context = (KB::LanguageModelContext *)self->_context;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(a4), "UTF8String"));
  KB::LanguageModelContext::append(context, *(_QWORD *)&a3, (uint64_t)__p, 0);
  if (v7 < 0)
    operator delete(__p[0]);
}

- (void)popBack
{
  KB::LanguageModelContext::pop_back((_QWORD *)self->_context);
}

- (void)clear
{
  KB::LanguageModelContext::clear((KB::LanguageModelContext *)self->_context);
}

- (const)begin
{
  return (const TITokenID *)*((_QWORD *)self->_context + 2);
}

- (unint64_t)size
{
  return (uint64_t)(*((_QWORD *)self->_context + 3) - *((_QWORD *)self->_context + 2)) >> 3;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

@end
