@implementation WBSJSONReader

- (BOOL)parseData:(id)a3 error:(id *)a4
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  char v9;
  int v10;
  std::string::size_type size;
  int v12;
  char v13;
  int v14;
  int v15;
  int v16;
  std::string::size_type v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  std::string::size_type v23;
  int v24;
  std::string::size_type v25;
  std::string::size_type v26;
  std::string::size_type v27;
  std::string::size_type v28;
  std::string::size_type v29;
  std::string::size_type v30;
  std::string *v31;
  __int128 v32;
  std::string *v33;
  __int128 v34;
  uint64_t (**v35)(_anonymous_namespace_::JSONSAXAdapter *__hidden);
  WBSJSONReader *v36;
  id v37;
  std::string v38;
  std::string v39;
  std::string v40;
  std::exception v41;
  _BYTE v42[24];
  std::string v43;
  std::string __p;
  _QWORD v45[3];
  _QWORD *v46;
  _BYTE v47[24];
  _BYTE *v48;
  int v49;
  _BYTE v50[24];
  std::string v51;
  _QWORD v52[10];

  v52[9] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v35 = &off_1E649E768;
  v36 = self;
  v37 = WeakRetained;
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v46 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::iterator_input_adapter<char const*>>(v8, v8 + objc_msgSend(v7, "length"), v45, 1, (uint64_t)v47);
  memset(&__p, 0, sizeof(__p));
  while (2)
  {
    switch(v49)
    {
      case 1:
        v9 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), uint64_t))v35[1])(&v35, 1);
        goto LABEL_18;
      case 2:
        v9 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), _QWORD))v35[1])(&v35, 0);
        goto LABEL_18;
      case 3:
        v9 = (*v35)((_anonymous_namespace_::JSONSAXAdapter *)&v35);
        goto LABEL_18;
      case 4:
        v9 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), _QWORD *))v35[5])(&v35, v52);
        goto LABEL_18;
      case 5:
        v9 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), _QWORD))v35[3])(&v35, v52[5]);
        goto LABEL_18;
      case 6:
        v9 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), _QWORD))v35[2])(&v35, v52[4]);
        goto LABEL_18;
      case 7:
        if ((v52[6] & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
        {
          v30 = v51.__r_.__value_.__r.__words[0];
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v50, &v43);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v50, &v38);
          v31 = std::string::insert(&v38, 0, "number overflow parsing '", 0x19uLL);
          v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
          v39.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v32;
          v31->__r_.__value_.__l.__size_ = 0;
          v31->__r_.__value_.__r.__words[2] = 0;
          v31->__r_.__value_.__r.__words[0] = 0;
          v33 = std::string::append(&v39, "'", 1uLL);
          v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
          v40.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v34;
          v33->__r_.__value_.__l.__size_ = 0;
          v33->__r_.__value_.__r.__words[2] = 0;
          v33->__r_.__value_.__r.__words[0] = 0;
          nlohmann::detail::out_of_range::create(406, (uint64_t)&v40, (nlohmann::detail::exception *)&v41);
          v16 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), std::string::size_type, std::string *, std::exception *))v35[12])(&v35, v30, &v43, &v41);
          v41.__vftable = (std::exception_vtbl *)&unk_1E649E898;
          MEMORY[0x1B5E26B48](v42);
          std::exception::~exception(&v41);
          if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v40.__r_.__value_.__l.__data_);
          goto LABEL_67;
        }
        if (((unsigned int (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), _QWORD *))v35[4])(&v35, v52))
        {
          goto LABEL_19;
        }
        goto LABEL_63;
      case 8:
        if (!((unsigned int (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), uint64_t))v35[10])(&v35, -1))goto LABEL_63;
        v49 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v50);
        if (v49 == 10)
        {
          v9 = v35[11]((_anonymous_namespace_::JSONSAXAdapter *)&v35);
          goto LABEL_18;
        }
        LOBYTE(v41.__vftable) = 1;
        std::vector<BOOL>::push_back((uint64_t)&__p, &v41);
        continue;
      case 9:
        if ((((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), uint64_t))v35[7])(&v35, -1) & 1) == 0)goto LABEL_63;
        v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v50);
        v49 = v10;
        if (v10 != 11)
        {
          if (v10 != 4)
            goto LABEL_75;
          if (!((unsigned int (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), _QWORD *))v35[8])(&v35, v52))goto LABEL_63;
          v49 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v50);
          if (v49 != 12)
            goto LABEL_76;
          LOBYTE(v41.__vftable) = 0;
          std::vector<BOOL>::push_back((uint64_t)&__p, &v41);
          v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v50);
LABEL_35:
          v49 = v15;
          continue;
        }
        v9 = v35[9]((_anonymous_namespace_::JSONSAXAdapter *)&v35);
LABEL_18:
        if ((v9 & 1) == 0)
          goto LABEL_63;
LABEL_19:
        size = __p.__r_.__value_.__l.__size_;
        if (!__p.__r_.__value_.__l.__size_)
        {
LABEL_41:
          v16 = 1;
          goto LABEL_42;
        }
        while (2)
        {
          if (((*(_QWORD *)(__p.__r_.__value_.__r.__words[0] + (((size - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (size - 1)) & 1) != 0)
          {
            v12 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v50);
            v49 = v12;
            if (v12 == 13)
              goto LABEL_34;
            if (v12 != 10)
            {
              v26 = v51.__r_.__value_.__r.__words[0];
              nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v50, &v43);
              v40 = v51;
              std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, "array");
              nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v47, 0xAu, (uint64_t)&v38, &v39);
              nlohmann::detail::parse_error::create(101, (uint64_t *)&v40, (uint64_t)&v39, (nlohmann::detail::exception *)&v41);
              v24 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), std::string::size_type, std::string *, std::exception *))v35[12])(&v35, v26, &v43, &v41);
              goto LABEL_66;
            }
            v13 = v35[11]((_anonymous_namespace_::JSONSAXAdapter *)&v35);
LABEL_27:
            if ((v13 & 1) == 0)
              goto LABEL_63;
            size = --__p.__r_.__value_.__l.__size_;
            if (!__p.__r_.__value_.__l.__size_)
              goto LABEL_41;
            continue;
          }
          break;
        }
        v14 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v50);
        v49 = v14;
        if (v14 != 13)
        {
          if (v14 != 11)
          {
            v27 = v51.__r_.__value_.__r.__words[0];
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v50, &v43);
            v40 = v51;
            std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, "object");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v47, 0xBu, (uint64_t)&v38, &v39);
            nlohmann::detail::parse_error::create(101, (uint64_t *)&v40, (uint64_t)&v39, (nlohmann::detail::exception *)&v41);
            v24 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), std::string::size_type, std::string *, std::exception *))v35[12])(&v35, v27, &v43, &v41);
            goto LABEL_66;
          }
          v13 = v35[9]((_anonymous_namespace_::JSONSAXAdapter *)&v35);
          goto LABEL_27;
        }
        v49 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v50);
        if (v49 != 4)
        {
LABEL_75:
          v28 = v51.__r_.__value_.__r.__words[0];
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v50, &v43);
          v40 = v51;
          std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, "object key");
          nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v47, 4u, (uint64_t)&v38, &v39);
          nlohmann::detail::parse_error::create(101, (uint64_t *)&v40, (uint64_t)&v39, (nlohmann::detail::exception *)&v41);
          v24 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), std::string::size_type, std::string *, std::exception *))v35[12])(&v35, v28, &v43, &v41);
          goto LABEL_66;
        }
        if (!((unsigned int (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), _QWORD *))v35[8])(&v35, v52))
        {
LABEL_63:
          v16 = 0;
          goto LABEL_42;
        }
        v49 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v50);
        if (v49 == 12)
        {
LABEL_34:
          v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v50);
          goto LABEL_35;
        }
LABEL_76:
        v29 = v51.__r_.__value_.__r.__words[0];
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v50, &v43);
        v40 = v51;
        std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, "object separator");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v47, 0xCu, (uint64_t)&v38, &v39);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&v40, (uint64_t)&v39, (nlohmann::detail::exception *)&v41);
        v24 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), std::string::size_type, std::string *, std::exception *))v35[12])(&v35, v29, &v43, &v41);
LABEL_66:
        v16 = v24;
        v41.__vftable = (std::exception_vtbl *)&unk_1E649E898;
        MEMORY[0x1B5E26B48](v42);
        std::exception::~exception(&v41);
LABEL_67:
        if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v39.__r_.__value_.__l.__data_);
        if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v38.__r_.__value_.__l.__data_);
        if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v43.__r_.__value_.__l.__data_);
LABEL_42:
        if (__p.__r_.__value_.__r.__words[0])
          operator delete(__p.__r_.__value_.__l.__data_);
        if (v16)
        {
          v49 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v50);
          if (v49 != 15)
          {
            v17 = v51.__r_.__value_.__r.__words[0];
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v50, &__p);
            v43 = v51;
            std::string::basic_string[abi:sn180100]<0>(&v39.__r_.__value_.__l.__data_, "value");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v47, 0xFu, (uint64_t)&v39, &v40);
            nlohmann::detail::parse_error::create(101, (uint64_t *)&v43, (uint64_t)&v40, (nlohmann::detail::exception *)&v41);
            ((void (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), std::string::size_type, std::string *, std::exception *))v35[12])(&v35, v17, &__p, &v41);
            v41.__vftable = (std::exception_vtbl *)&unk_1E649E898;
            MEMORY[0x1B5E26B48](v42);
            std::exception::~exception(&v41);
            if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v40.__r_.__value_.__l.__data_);
            if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v39.__r_.__value_.__l.__data_);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer((uint64_t)v50);
        v18 = v48;
        if (v48 == v47)
        {
          v19 = 4;
          v18 = v47;
LABEL_56:
          (*(void (**)(void))(*v18 + 8 * v19))();
        }
        else if (v48)
        {
          v19 = 5;
          goto LABEL_56;
        }
        v20 = v46;
        if (v46 == v45)
        {
          v21 = 4;
          v20 = v45;
LABEL_61:
          (*(void (**)(void))(*v20 + 8 * v21))();
        }
        else if (v46)
        {
          v21 = 5;
          goto LABEL_61;
        }

        return 1;
      case 14:
        v23 = v51.__r_.__value_.__r.__words[0];
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v50, &v43);
        v40 = v51;
        std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v47, 0, (uint64_t)&v38, &v39);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&v40, (uint64_t)&v39, (nlohmann::detail::exception *)&v41);
        v24 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), std::string::size_type, std::string *, std::exception *))v35[12])(&v35, v23, &v43, &v41);
        goto LABEL_66;
      default:
        v25 = v51.__r_.__value_.__r.__words[0];
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v50, &v43);
        v40 = v51;
        std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v47, 0x10u, (uint64_t)&v38, &v39);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&v40, (uint64_t)&v39, (nlohmann::detail::exception *)&v41);
        v24 = ((uint64_t (*)(uint64_t (***)(_anonymous_namespace_::JSONSAXAdapter *__hidden), std::string::size_type, std::string *, std::exception *))v35[12])(&v35, v25, &v43, &v41);
        goto LABEL_66;
    }
  }
}

- (BOOL)parseURL:(id)a3 error:(id *)a4
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t (**v14)(_anonymous_namespace_::JSONSAXAdapter *__hidden);
  WBSJSONReader *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _BYTE v19[408];
  uint64_t v20;
  _QWORD v21[3];
  _QWORD *v22;
  _BYTE v23[24];
  _BYTE *v24;
  _QWORD v25[19];

  v25[18] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = &off_1E649E768;
  v15 = self;
  v16 = WeakRetained;
  objc_msgSend(v5, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "fileSystemRepresentation");
  std::ifstream::basic_ifstream(v18);

  v8 = *(_QWORD *)&v19[*(_QWORD *)(v18[0] - 24) + 24];
  v17[0] = v18;
  v17[1] = v8;
  v22 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::input_stream_adapter>((uint64_t)v17, v21, 1, (uint64_t)v23);
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~lexer((uint64_t)v25);
  v9 = v24;
  if (v24 == v23)
  {
    v10 = 4;
    v9 = v23;
  }
  else
  {
    if (!v24)
      goto LABEL_6;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_6:
  v11 = v22;
  if (v22 == v21)
  {
    v12 = 4;
    v11 = v21;
  }
  else
  {
    if (!v22)
      goto LABEL_11;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_11:
  if (v17[0])
    std::ios_base::clear((std::ios_base *)(v17[0] + *(_QWORD *)(*(_QWORD *)v17[0] - 24)), *(_DWORD *)(v17[0] + *(_QWORD *)(*(_QWORD *)v17[0] - 24) + 32) & 2);
  v18[0] = *MEMORY[0x1E0DE4F40];
  *(_QWORD *)((char *)v18 + *(_QWORD *)(v18[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 24);
  MEMORY[0x1B5E26B90](v19);
  std::istream::~istream();
  MEMORY[0x1B5E26BE4](&v20);

  return 1;
}

- (BOOL)parseFileHandle:(id)a3 error:(id *)a4
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v13[2];
  std::ios_base v14;
  uint64_t v15;
  int v16;
  uint64_t (**v17)(_anonymous_namespace_::JSONSAXAdapter *__hidden);
  WBSJSONReader *v18;
  id v19;
  _QWORD v20[2];
  _QWORD __sb[8];
  int v22;
  _BYTE v23[1028];
  _QWORD v24[3];
  _QWORD *v25;
  _BYTE v26[24];
  _BYTE *v27;
  _QWORD v28[19];

  v28[18] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = &off_1E649E768;
  v18 = self;
  v19 = WeakRetained;
  LODWORD(self) = objc_msgSend(v5, "fileDescriptor");
  std::streambuf::basic_streambuf();
  v22 = (int)self;
  __sb[0] = &off_1E649E7F0;
  __sb[2] = v23;
  __sb[3] = v23;
  __sb[4] = v23;
  v13[1] = 0;
  v14.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E0DE4F98] + 64);
  v13[0] = MEMORY[0x1E0DE4F98] + 24;
  std::ios_base::init(&v14, __sb);
  v15 = 0;
  v16 = -1;
  v7 = *(std::streamsize *)((char *)&v14.__width_ + *(_QWORD *)(v13[0] - 24));
  v20[0] = v13;
  v20[1] = v7;
  v25 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::input_stream_adapter>((uint64_t)v20, v24, 1, (uint64_t)v26);
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~lexer((uint64_t)v28);
  v8 = v27;
  if (v27 == v26)
  {
    v9 = 4;
    v8 = v26;
  }
  else
  {
    if (!v27)
      goto LABEL_6;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_6:
  v10 = v25;
  if (v25 == v24)
  {
    v11 = 4;
    v10 = v24;
  }
  else
  {
    if (!v25)
      goto LABEL_11;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_11:
  if (v20[0])
    std::ios_base::clear((std::ios_base *)(v20[0] + *(_QWORD *)(*(_QWORD *)v20[0] - 24)), *(_DWORD *)(v20[0] + *(_QWORD *)(*(_QWORD *)v20[0] - 24) + 32) & 2);
  std::istream::~istream();
  std::streambuf::~streambuf();

  return 1;
}

- (WBSJSONReaderDelegate)delegate
{
  return (WBSJSONReaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
