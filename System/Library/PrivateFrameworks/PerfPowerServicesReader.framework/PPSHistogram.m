@implementation PPSHistogram

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PPSHistogram initWithHistogram:](+[PPSHistogram allocWithZone:](PPSHistogram, "allocWithZone:", a3), "initWithHistogram:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSHistogram)initWithCoder:(id)a3
{
  id v4;
  PPSHistogram *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const boost::archive::detail::basic_iserializer *instance;
  pps::Histogram_Internal *v11;
  Histogram_Internal *value;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *dimensions;
  char *v19[14];
  std::string __p;
  uint64_t v21;
  objc_super v22;
  uint64_t v23[12];
  char v24;
  _QWORD v25[21];

  v25[20] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PPSHistogram;
  v5 = -[PPSHistogram init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_PPSHistogram"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100](&__p, (void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
    std::istringstream::basic_istringstream[abi:ne180100](v23, &__p, 8);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    boost::archive::text_iarchive::text_iarchive((boost::archive::detail::basic_iarchive *)&__p, v23, 0);
    v7 = pps::Histogram_Internal::Histogram_Internal((pps::Histogram_Internal *)v19);
    instance = (const boost::archive::detail::basic_iserializer *)boost::serialization::singleton<boost::archive::detail::iserializer<boost::archive::text_iarchive,pps::Histogram_Internal>>::get_instance(v7, v8, v9);
    boost::archive::detail::basic_iarchive::load_object((boost::archive::detail::basic_iarchive_impl **)&__p, (unint64_t)v19, instance);
    v11 = (pps::Histogram_Internal *)operator new();
    pps::Histogram_Internal::Histogram_Internal(v11, (const pps::Histogram_Internal *)v19);
    value = v5->_histogramPtr.__ptr_.__value_;
    v5->_histogramPtr.__ptr_.__value_ = (Histogram_Internal *)v11;
    if (value)
      (*(void (**)(Histogram_Internal *))(*(_QWORD *)value + 8))(value);
    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("dimensions"));
    v16 = objc_claimAutoreleasedReturnValue();
    dimensions = v5->_dimensions;
    v5->_dimensions = (NSArray *)v16;

    pps::Histogram_Internal::~Histogram_Internal(v19);
    boost::archive::detail::basic_iarchive::~basic_iarchive((boost::archive::detail::basic_iarchive *)&__p);
    boost::archive::basic_text_iprimitive<std::istream>::~basic_text_iprimitive((uint64_t)&v21);
    v23[0] = *MEMORY[0x24BEDB7F8];
    *(uint64_t *)((char *)v23 + *(_QWORD *)(v23[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F8] + 24);
    v23[2] = MEMORY[0x24BEDB848] + 16;
    if (v24 < 0)
      operator delete((void *)v23[10]);
    std::streambuf::~streambuf();
    std::istream::~istream();
    MEMORY[0x2494FECBC](v25);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  boost::archive::detail::basic_oarchive *v5;
  Histogram_Internal *value;
  uint64_t v7;
  uint64_t v8;
  const boost::archive::detail::basic_oserializer *instance;
  void **v10;
  unint64_t v11;
  void *v12;
  void *__p[2];
  unsigned __int8 v14;
  boost::archive::detail::basic_oarchive_impl *v15[6];
  uint64_t v16;
  uint64_t v17[11];
  char v18;
  _QWORD v19[20];

  v19[19] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v17);
  v5 = boost::archive::text_oarchive::text_oarchive((boost::archive::detail::basic_oarchive *)v15, v17, 0);
  value = self->_histogramPtr.__ptr_.__value_;
  instance = (const boost::archive::detail::basic_oserializer *)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,pps::Histogram_Internal>>::get_instance((uint64_t)v5, v7, v8);
  boost::archive::detail::basic_oarchive::save_object(v15, (unint64_t)value, instance);
  std::stringbuf::str();
  if ((v14 & 0x80u) == 0)
    v10 = __p;
  else
    v10 = (void **)__p[0];
  if ((v14 & 0x80u) == 0)
    v11 = v14;
  else
    v11 = (unint64_t)__p[1];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("_PPSHistogram"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_dimensions, CFSTR("dimensions"));
  if ((char)v14 < 0)
    operator delete(__p[0]);
  boost::archive::detail::basic_oarchive::~basic_oarchive((boost::archive::detail::basic_oarchive *)v15);
  boost::archive::basic_text_oprimitive<std::ostream>::~basic_text_oprimitive((uint64_t)&v16);
  v17[0] = *MEMORY[0x24BEDB800];
  *(uint64_t *)((char *)v17 + *(_QWORD *)(v17[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v17[1] = MEMORY[0x24BEDB848] + 16;
  if (v18 < 0)
    operator delete((void *)v17[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2494FECBC](v19);

}

- (PPSHistogram)initWithBinCount:(unint64_t)a3 range:(id)a4 metricName:(id)a5
{
  double var1;
  double var0;
  id v9;
  PPSHistogram *v10;
  pps::Histogram_Internal *v11;
  Histogram_Internal *value;
  PPSHistogramDimension *v13;
  uint64_t v14;
  NSArray *dimensions;
  objc_super v17;
  _QWORD v18[2];

  var1 = a4.var1;
  var0 = a4.var0;
  v18[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PPSHistogram;
  v10 = -[PPSHistogram init](&v17, sel_init);
  if (v10)
  {
    v11 = (pps::Histogram_Internal *)operator new();
    pps::Histogram_Internal::Histogram_Internal(v11, a3, var0, var1);
    value = v10->_histogramPtr.__ptr_.__value_;
    v10->_histogramPtr.__ptr_.__value_ = (Histogram_Internal *)v11;
    if (value)
      (*(void (**)(Histogram_Internal *))(*(_QWORD *)value + 8))(value);
    v13 = -[PPSHistogramDimension initWithBinCount:range:metricName:]([PPSHistogramDimension alloc], "initWithBinCount:range:metricName:", a3, v9, var0, var1);
    v18[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    dimensions = v10->_dimensions;
    v10->_dimensions = (NSArray *)v14;

  }
  return v10;
}

- (PPSHistogram)initWithBinCount:(unint64_t)a3 range:(id)a4 metricName:(id)a5 samples:(id)a6
{
  double var1;
  double var0;
  id v11;
  PPSHistogram *v12;
  PPSHistogram *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  PPSHistogram *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  var1 = a4.var1;
  var0 = a4.var0;
  v27 = *MEMORY[0x24BDAC8D0];
  v11 = a6;
  v12 = -[PPSHistogram initWithBinCount:range:metricName:](self, "initWithBinCount:range:metricName:", a3, a5, var0, var1);
  v13 = v12;
  if (v12)
  {
    if (!v12->_histogramPtr.__ptr_.__value_)
    {
      v19 = 0;
      goto LABEL_13;
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v14);
          v25 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17);
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1, (_QWORD)v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPSHistogram recordSample:](v13, "recordSample:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v15);
    }

  }
  v19 = v13;
LABEL_13:

  return v19;
}

- (PPSHistogram)initWithDimensions:(id)a3
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _OWORD *v19;
  __int128 v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  std::string *v24;
  std::string *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  PPSHistogram *v45;
  uint64_t v46;
  Histogram_Internal *value;
  PPSHistogram *v48;
  NSObject *v49;
  id obj;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  objc_super v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  void *__p[2];
  std::string::size_type v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  double v69;
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  std::__split_buffer<std::string> __v;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v78 = 0;
  v79 = 0;
  v80 = 0;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = a3;
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v75;
LABEL_3:
    v56 = 0;
    while (1)
    {
      if (*(_QWORD *)v75 != v55)
        objc_enumerationMutation(obj);
      v3 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v56);
      v4 = objc_msgSend(v3, "size");
      objc_msgSend(v3, "range");
      v6 = v5;
      objc_msgSend(v3, "range");
      v8 = v7;
      if (v4)
      {
        if (v6 == 0.0 && v7 == 0.0)
        {
          objc_msgSend(v3, "edges");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "count") == 0;

          if (v10)
          {
            logHandle();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              -[PPSHistogram initWithDimensions:].cold.3();
            goto LABEL_78;
          }
        }
      }
      if (v8 < v6)
        break;
      if (!v4
        || (objc_msgSend(v3, "edges"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "count") == 0,
            v11,
            v12))
      {
        logHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[PPSHistogram initWithDimensions:].cold.5();
LABEL_78:

        v48 = 0;
        goto LABEL_79;
      }
      LODWORD(v68) = v4;
      *((double *)&v68 + 1) = v6;
      v69 = v8;
      v70 = 0;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      objc_msgSend(v3, "edges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count") == 0;

      if (!v14)
      {
        if (objc_msgSend(v3, "isCategoryDimension"))
        {
          v66 = 0uLL;
          v67 = 0uLL;
          v64 = 0uLL;
          v65 = 0uLL;
          objc_msgSend(v3, "edges");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v65;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v65 != v17)
                  objc_enumerationMutation(v15);
                std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i)), "UTF8String"));
                v19 = (_OWORD *)*((_QWORD *)&v71 + 1);
                if (*((_QWORD *)&v71 + 1) >= (unint64_t)v72)
                {
                  v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v71 + 1) - v71) >> 3);
                  v22 = v21 + 1;
                  if (v21 + 1 > 0xAAAAAAAAAAAAAAALL)
                    std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
                  if (0x5555555555555556 * ((uint64_t)(v72 - v71) >> 3) > v22)
                    v22 = 0x5555555555555556 * ((uint64_t)(v72 - v71) >> 3);
                  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v72 - v71) >> 3) >= 0x555555555555555)
                    v23 = 0xAAAAAAAAAAAAAAALL;
                  else
                    v23 = v22;
                  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v72;
                  if (v23)
                    v24 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v72, v23);
                  else
                    v24 = 0;
                  v25 = v24 + v21;
                  __v.__first_ = v24;
                  __v.__begin_ = v25;
                  __v.__end_cap_.__value_ = &v24[v23];
                  v26 = *(_OWORD *)__p;
                  v25->__r_.__value_.__r.__words[2] = v63;
                  *(_OWORD *)&v25->__r_.__value_.__l.__data_ = v26;
                  __p[1] = 0;
                  v63 = 0;
                  __p[0] = 0;
                  __v.__end_ = v25 + 1;
                  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)&v71, &__v);
                  v27 = *((_QWORD *)&v71 + 1);
                  std::__split_buffer<std::string>::~__split_buffer(&__v);
                  *((_QWORD *)&v71 + 1) = v27;
                  if (SHIBYTE(v63) < 0)
                    operator delete(__p[0]);
                }
                else
                {
                  v20 = *(_OWORD *)__p;
                  *(_QWORD *)(*((_QWORD *)&v71 + 1) + 16) = v63;
                  *v19 = v20;
                  *((_QWORD *)&v71 + 1) = (char *)v19 + 24;
                }
              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
            }
            while (v16);
          }
        }
        else
        {
          v60 = 0uLL;
          v61 = 0uLL;
          v58 = 0uLL;
          v59 = 0uLL;
          objc_msgSend(v3, "edges");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
          if (v28)
          {
            v29 = *(_QWORD *)v59;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v59 != v29)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "doubleValue");
                v32 = v31;
                v33 = (char *)v73;
                if ((unint64_t)v73 >= *((_QWORD *)&v73 + 1))
                {
                  v35 = (char *)*((_QWORD *)&v72 + 1);
                  v36 = (uint64_t)(v73 - *((_QWORD *)&v72 + 1)) >> 3;
                  v37 = v36 + 1;
                  if ((unint64_t)(v36 + 1) >> 61)
                    std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
                  v38 = *((_QWORD *)&v73 + 1) - *((_QWORD *)&v72 + 1);
                  if ((uint64_t)(*((_QWORD *)&v73 + 1) - *((_QWORD *)&v72 + 1)) >> 2 > v37)
                    v37 = v38 >> 2;
                  if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
                    v39 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v39 = v37;
                  if (v39)
                  {
                    v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v73 + 8, v39);
                    v35 = (char *)*((_QWORD *)&v72 + 1);
                    v33 = (char *)v73;
                  }
                  else
                  {
                    v40 = 0;
                  }
                  v41 = &v40[8 * v36];
                  *(_QWORD *)v41 = v32;
                  v34 = v41 + 8;
                  while (v33 != v35)
                  {
                    v42 = *((_QWORD *)v33 - 1);
                    v33 -= 8;
                    *((_QWORD *)v41 - 1) = v42;
                    v41 -= 8;
                  }
                  *((_QWORD *)&v72 + 1) = v41;
                  *(_QWORD *)&v73 = v34;
                  *((_QWORD *)&v73 + 1) = &v40[8 * v39];
                  if (v35)
                    operator delete(v35);
                }
                else
                {
                  *(_QWORD *)v73 = v31;
                  v34 = v33 + 8;
                }
                *(_QWORD *)&v73 = v34;
              }
              v28 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
            }
            while (v28);
          }
        }

      }
      v43 = v79;
      if (v79 >= v80)
      {
        v44 = std::vector<pps::AxisConfig_Internal>::__emplace_back_slow_path<pps::AxisConfig_Internal&>(&v78, &v68);
      }
      else
      {
        std::allocator<pps::AxisConfig_Internal>::construct[abi:ne180100]<pps::AxisConfig_Internal,pps::AxisConfig_Internal&>((uint64_t)&v80, v79, &v68);
        v44 = v43 + 80;
      }
      v79 = v44;
      if (*((_QWORD *)&v72 + 1))
      {
        *(_QWORD *)&v73 = *((_QWORD *)&v72 + 1);
        operator delete(*((void **)&v72 + 1));
      }
      __v.__first_ = (std::__split_buffer<std::string>::pointer)&v71;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
      if (++v56 == v54)
      {
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
        if (v54)
          goto LABEL_3;
        goto LABEL_67;
      }
    }
    logHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      -[PPSHistogram initWithDimensions:].cold.4();
    goto LABEL_78;
  }
LABEL_67:

  v57.receiver = self;
  v57.super_class = (Class)PPSHistogram;
  v45 = -[PPSHistogram init](&v57, sel_init);
  if (v45)
  {
    v46 = operator new();
    pps::Histogram_Internal::Histogram_Internal(v46, &v78);
    value = v45->_histogramPtr.__ptr_.__value_;
    v45->_histogramPtr.__ptr_.__value_ = (Histogram_Internal *)v46;
    if (value)
      (*(void (**)(Histogram_Internal *))(*(_QWORD *)value + 8))(value);
    objc_storeStrong((id *)&v45->_dimensions, a3);
  }
  v48 = v45;
  self = v48;
LABEL_79:
  *(_QWORD *)&v68 = &v78;
  std::vector<pps::AxisConfig_Internal>::__destroy_vector::operator()[abi:ne180100]((void ***)&v68);

  return v48;
}

- (BOOL)isEqualToHistogram:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  Histogram_Internal *value;
  uint64_t *v23;

  v4 = a3;
  v5 = -[PPSHistogram rank](self, "rank");
  if (v5 != objc_msgSend(v4, "rank"))
    goto LABEL_12;
  v6 = 0;
  while (v6 < -[PPSHistogram rank](self, "rank"))
  {
    -[PPSHistogram dimensions](self, "dimensions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "range");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "dimensions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "range");
    v16 = v15;
    v18 = v17;

    v19 = 0;
    if (v10 == v16)
    {
      ++v6;
      if (v12 == v18)
        continue;
    }
    goto LABEL_13;
  }
  if (v4
    && (v20 = -[PPSHistogram size](self, "size"), v20 == objc_msgSend(v4, "size"))
    && (v21 = -[PPSHistogram sum:](self, "sum:", 1), v21 == objc_msgSend(v4, "sum:", 1)))
  {
    value = self->_histogramPtr.__ptr_.__value_;
    v23 = (uint64_t *)v4[1];
    if (value == (Histogram_Internal *)v23)
      v19 = 1;
    else
      v19 = pps::Histogram_Internal::operator==((uint64_t)value, v23);
  }
  else
  {
LABEL_12:
    v19 = 0;
  }
LABEL_13:

  return v19;
}

- (NSArray)metrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[PPSHistogram dimensions](self, "dimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PPSHistogram dimensions](self, "dimensions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "metricName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v11;
}

- (unint64_t)rank
{
  return pps::Histogram_Internal::axisCount((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_);
}

- (unint64_t)size
{
  return pps::Histogram_Internal::binCount((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_);
}

- (id)JSONRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[PPSHistogram dimensions](self, "dimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PPSHistogram dimensions](self, "dimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "performSelector:", sel_dictionary);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v5, "addObject:", v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_opt_new();
  -[PPSHistogram counts:](self, "counts:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("counts"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, CFSTR("dimensions"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PPSHistogram sum:](self, "sum:", 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("sum"));

  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v11, 1, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;
  if (v15)
  {
    PPSReaderLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[PPSHistogram JSONRepresentation].cold.1();

  }
  return v14;
}

- (id)counts:(BOOL)a3
{
  double v3;
  _BOOL8 v4;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;
  void *__p[3];
  _QWORD v16[3];
  _QWORD *v17;
  _QWORD v18[3];
  _QWORD *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  pps::Histogram_Internal::data((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_, a3, (uint64_t)__p, v3);
  -[PPSHistogram createArrayFromDimensionIdx:withFlowBins:](self, "createArrayFromDimensionIdx:withFlowBins:", 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v17 = 0;
  v7 = operator new(0x20uLL);
  *v7 = &off_25142C778;
  v7[1] = &v14;
  v7[2] = __p;
  v7[3] = v16;
  v19 = v7;
  std::__function::__value_func<void ()(NSMutableArray *)>::swap[abi:ne180100](v18, v16);
  v8 = v19;
  if (v19 == v18)
  {
    v9 = 4;
    v8 = v18;
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_6:
  std::function<void ()(NSMutableArray *)>::operator()((uint64_t)v16, v6);
  v10 = (void *)objc_msgSend(v6, "copy");
  v11 = v17;
  if (v17 == v16)
  {
    v12 = 4;
    v11 = v16;
  }
  else
  {
    if (!v17)
      goto LABEL_11;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_11:

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v10;
}

- (id)indicesFor:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double *v12;
  double *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char **v20;
  char *v21;
  char **v22;
  int v23;
  double *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  std::string::size_type size;
  std::string::size_type v31;
  double i;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  int v36;
  void **v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  BOOL v42;
  uint64_t v44;
  double *v45;
  double *v46;
  double *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  double *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  int *j;
  std::string::size_type v58;
  void *v59;
  void *v60;
  PPSHistogram *v62;
  id v63;
  void *__p[2];
  unsigned __int8 v65;
  std::string v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  char *v72[2];
  void *v73;
  double *v74;
  char *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v73 = 0;
  v74 = 0;
  v75 = 0;
  v63 = a3;
  std::vector<double>::reserve(&v73, objc_msgSend(v63, "count"));
  v62 = self;
  pps::Histogram_Internal::categoriesPerAxis((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_, &v71);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v4 = v63;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v68;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v68 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "doubleValue");
          v11 = v10;
          v12 = v74;
          if (v74 >= (double *)v75)
          {
            v13 = (double *)v73;
            v14 = ((char *)v74 - (_BYTE *)v73) >> 3;
            v15 = v14 + 1;
            if ((unint64_t)(v14 + 1) >> 61)
              std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
            v16 = v75 - (_BYTE *)v73;
            if ((v75 - (_BYTE *)v73) >> 2 > v15)
              v15 = v16 >> 2;
            if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
              v17 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v17 = v15;
            if (v17)
            {
              v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v75, v17);
              v13 = (double *)v73;
              v12 = v74;
            }
            else
            {
              v18 = 0;
            }
            v28 = (double *)&v18[8 * v14];
            *v28 = v11;
            v24 = v28 + 1;
            while (v12 != v13)
            {
              v29 = *((_QWORD *)v12-- - 1);
              *((_QWORD *)v28-- - 1) = v29;
            }
LABEL_74:
            v73 = v28;
            v74 = v24;
            v75 = &v18[8 * v17];
            if (v13)
              operator delete(v13);
            goto LABEL_76;
          }
          goto LABEL_28;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_77;
        v19 = v72[0];
        if (!v72[0])
          goto LABEL_27;
        v20 = v72;
        do
        {
          v21 = v19;
          v22 = v20;
          v23 = *((_DWORD *)v19 + 8);
          if (v23 >= v6)
            v20 = (char **)v19;
          else
            v19 += 8;
          v19 = *(char **)v19;
        }
        while (v19);
        if (v20 == v72)
          goto LABEL_27;
        if (v23 < v6)
          v21 = (char *)v22;
        if (*((_DWORD *)v21 + 8) > v6)
        {
LABEL_27:
          v11 = (double)(unint64_t)objc_msgSend(v4, "count", v62);
          v12 = v74;
          if (v74 >= (double *)v75)
          {
            v13 = (double *)v73;
            v25 = ((char *)v74 - (_BYTE *)v73) >> 3;
            v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 61)
              std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
            v27 = v75 - (_BYTE *)v73;
            if ((v75 - (_BYTE *)v73) >> 2 > v26)
              v26 = v27 >> 2;
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
              v17 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v17 = v26;
            if (v17)
            {
              v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v75, v17);
              v13 = (double *)v73;
              v12 = v74;
            }
            else
            {
              v18 = 0;
            }
            v28 = (double *)&v18[8 * v25];
            *v28 = v11;
            v24 = v28 + 1;
            while (v12 != v13)
            {
              v44 = *((_QWORD *)v12-- - 1);
              *((_QWORD *)v28-- - 1) = v44;
            }
            goto LABEL_74;
          }
LABEL_28:
          *v12 = v11;
          v24 = v12 + 1;
LABEL_76:
          v74 = v24;
          goto LABEL_77;
        }
        memset(&v66, 0, sizeof(v66));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v66, (__int128 *)v20[5], (__int128 *)v20[6], 0xAAAAAAAAAAAAAAABLL * ((v20[6] - v20[5]) >> 3));
        size = v66.__r_.__value_.__l.__size_;
        v31 = v66.__r_.__value_.__r.__words[0];
        for (i = 0.0; v31 != size; v31 += 24)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String", v62));
          v33 = *(unsigned __int8 *)(v31 + 23);
          if ((v33 & 0x80u) == 0)
            v34 = (void *)*(unsigned __int8 *)(v31 + 23);
          else
            v34 = *(void **)(v31 + 8);
          v35 = v65;
          v36 = (char)v65;
          if ((v65 & 0x80u) != 0)
            v35 = (unint64_t)__p[1];
          if (v34 == (void *)v35)
          {
            if ((v65 & 0x80u) == 0)
              v37 = __p;
            else
              v37 = (void **)__p[0];
            if ((v33 & 0x80) != 0)
            {
              v42 = memcmp(*(const void **)v31, v37, *(_QWORD *)(v31 + 8)) == 0;
              if (v36 < 0)
                goto LABEL_63;
            }
            else if (*(_BYTE *)(v31 + 23))
            {
              v38 = 0;
              v39 = v33 - 1;
              do
              {
                v40 = *(unsigned __int8 *)(v31 + v38);
                v41 = *((unsigned __int8 *)v37 + v38);
                v42 = v40 == v41;
              }
              while (v40 == v41 && v39 != v38++);
              if ((char)v65 < 0)
              {
LABEL_63:
                operator delete(__p[0]);
                if (v42)
                  break;
                goto LABEL_64;
              }
            }
            else
            {
              v42 = 1;
              if ((char)v65 < 0)
                goto LABEL_63;
            }
          }
          else
          {
            v42 = 0;
            if ((char)v65 < 0)
              goto LABEL_63;
          }
          if (v42)
            break;
LABEL_64:
          i = i + 1.0;
        }
        v45 = v74;
        if (v74 >= (double *)v75)
        {
          v47 = (double *)v73;
          v48 = ((char *)v74 - (_BYTE *)v73) >> 3;
          v49 = v48 + 1;
          if ((unint64_t)(v48 + 1) >> 61)
            std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
          v50 = v75 - (_BYTE *)v73;
          if ((v75 - (_BYTE *)v73) >> 2 > v49)
            v49 = v50 >> 2;
          if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8)
            v51 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v51 = v49;
          if (v51)
          {
            v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v75, v51);
            v47 = (double *)v73;
            v45 = v74;
          }
          else
          {
            v52 = 0;
          }
          v53 = (double *)&v52[8 * v48];
          *v53 = i;
          v46 = v53 + 1;
          while (v45 != v47)
          {
            v54 = *((_QWORD *)v45-- - 1);
            *((_QWORD *)v53-- - 1) = v54;
          }
          v73 = v53;
          v74 = v46;
          v75 = &v52[8 * v51];
          if (v47)
            operator delete(v47);
        }
        else
        {
          *v74 = i;
          v46 = v45 + 1;
        }
        v74 = v46;
        __p[0] = &v66;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
LABEL_77:
        ++v6;
        ++v8;
      }
      while (v8 != v5);
      v55 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      v5 = v55;
    }
    while (v55);
  }

  pps::Histogram_Internal::indicesOfSample((pps::Histogram_Internal *)v62->_histogramPtr.__ptr_.__value_, &v73, &v66.__r_.__value_.__l.__data_);
  v56 = (void *)objc_opt_new();
  v58 = v66.__r_.__value_.__l.__size_;
  for (j = (int *)v66.__r_.__value_.__r.__words[0]; j != (int *)v58; ++j)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *j, v62);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addObject:", v59);

  }
  v60 = (void *)objc_msgSend(v56, "copy", v62);

  if (v66.__r_.__value_.__r.__words[0])
  {
    v66.__r_.__value_.__l.__size_ = v66.__r_.__value_.__r.__words[0];
    operator delete(v66.__r_.__value_.__l.__data_);
  }
  std::__tree<std::__value_type<int,std::vector<std::string>>,std::__map_value_compare<int,std::__value_type<int,std::vector<std::string>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<std::string>>>>::destroy((uint64_t)&v71, v72[0]);
  if (v73)
  {
    v74 = (double *)v73;
    operator delete(v73);
  }

  return v60;
}

- (void)recordSample:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double *v12;
  double *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char **v20;
  char *v21;
  char **v22;
  int v23;
  double *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  std::string::size_type size;
  std::string::size_type v31;
  double v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  int v36;
  void **v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  BOOL v42;
  uint64_t v44;
  double *v45;
  double *v46;
  double *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  double *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  PPSHistogram *v57;
  void *__p[2];
  unsigned __int8 v59;
  std::string v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  char *v66[2];
  void *v67;
  double *v68;
  char *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v67 = 0;
  v68 = 0;
  v69 = 0;
  v56 = a3;
  pps::Histogram_Internal::categoriesPerAxis((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_, &v65);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v4 = v56;
  v57 = self;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v61, v70, 16, v56);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v62;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v62 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "doubleValue");
          v11 = v10;
          v12 = v68;
          if (v68 < (double *)v69)
            goto LABEL_28;
          v13 = (double *)v67;
          v14 = ((char *)v68 - (_BYTE *)v67) >> 3;
          v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 61)
            std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
          v16 = v69 - (_BYTE *)v67;
          if ((v69 - (_BYTE *)v67) >> 2 > v15)
            v15 = v16 >> 2;
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
            v17 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v17 = v15;
          if (v17)
          {
            v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v69, v17);
            v13 = (double *)v67;
            v12 = v68;
          }
          else
          {
            v18 = 0;
          }
          v28 = (double *)&v18[8 * v14];
          *v28 = v11;
          v24 = v28 + 1;
          while (v12 != v13)
          {
            v29 = *((_QWORD *)v12-- - 1);
            *((_QWORD *)v28-- - 1) = v29;
          }
          goto LABEL_74;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_77;
        v19 = v66[0];
        if (!v66[0])
          goto LABEL_27;
        v20 = v66;
        do
        {
          v21 = v19;
          v22 = v20;
          v23 = *((_DWORD *)v19 + 8);
          if (v23 >= v6)
            v20 = (char **)v19;
          else
            v19 += 8;
          v19 = *(char **)v19;
        }
        while (v19);
        if (v20 == v66)
          goto LABEL_27;
        if (v23 < v6)
          v21 = (char *)v22;
        if (*((_DWORD *)v21 + 8) > v6)
        {
LABEL_27:
          v11 = (double)(int)objc_msgSend(v4, "count");
          v12 = v68;
          if (v68 < (double *)v69)
          {
LABEL_28:
            *v12 = v11;
            v24 = v12 + 1;
LABEL_76:
            v68 = v24;
            goto LABEL_77;
          }
          v13 = (double *)v67;
          v25 = ((char *)v68 - (_BYTE *)v67) >> 3;
          v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 61)
            std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
          v27 = v69 - (_BYTE *)v67;
          if ((v69 - (_BYTE *)v67) >> 2 > v26)
            v26 = v27 >> 2;
          if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
            v17 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v17 = v26;
          if (v17)
          {
            v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v69, v17);
            v13 = (double *)v67;
            v12 = v68;
          }
          else
          {
            v18 = 0;
          }
          v28 = (double *)&v18[8 * v25];
          *v28 = v11;
          v24 = v28 + 1;
          while (v12 != v13)
          {
            v44 = *((_QWORD *)v12-- - 1);
            *((_QWORD *)v28-- - 1) = v44;
          }
LABEL_74:
          v67 = v28;
          v68 = v24;
          v69 = &v18[8 * v17];
          if (v13)
            operator delete(v13);
          goto LABEL_76;
        }
        memset(&v60, 0, sizeof(v60));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v60, (__int128 *)v20[5], (__int128 *)v20[6], 0xAAAAAAAAAAAAAAABLL * ((v20[6] - v20[5]) >> 3));
        size = v60.__r_.__value_.__l.__size_;
        v31 = v60.__r_.__value_.__r.__words[0];
        v32 = 0.0;
        if (v60.__r_.__value_.__r.__words[0] == v60.__r_.__value_.__l.__size_)
          goto LABEL_80;
        while (1)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
          v33 = *(unsigned __int8 *)(v31 + 23);
          if ((v33 & 0x80u) == 0)
            v34 = (void *)*(unsigned __int8 *)(v31 + 23);
          else
            v34 = *(void **)(v31 + 8);
          v35 = v59;
          v36 = (char)v59;
          if ((v59 & 0x80u) != 0)
            v35 = (unint64_t)__p[1];
          if (v34 != (void *)v35)
          {
            v42 = 0;
            if (((char)v59 & 0x80000000) == 0)
              goto LABEL_65;
LABEL_64:
            operator delete(__p[0]);
            goto LABEL_65;
          }
          if ((v59 & 0x80u) == 0)
            v37 = __p;
          else
            v37 = (void **)__p[0];
          if ((v33 & 0x80) != 0)
          {
            v42 = memcmp(*(const void **)v31, v37, *(_QWORD *)(v31 + 8)) == 0;
            goto LABEL_63;
          }
          if (*(_BYTE *)(v31 + 23))
          {
            v38 = 0;
            v39 = v33 - 1;
            do
            {
              v40 = *(unsigned __int8 *)(v31 + v38);
              v41 = *((unsigned __int8 *)v37 + v38);
              v42 = v40 == v41;
            }
            while (v40 == v41 && v39 != v38++);
LABEL_63:
            if ((v36 & 0x80000000) == 0)
              goto LABEL_65;
            goto LABEL_64;
          }
          v42 = 1;
          if ((char)v59 < 0)
            goto LABEL_64;
LABEL_65:
          if (v42)
            break;
          v32 = v32 + 1.0;
          v31 += 24;
          self = v57;
          if (v31 == size)
            goto LABEL_80;
        }
        self = v57;
LABEL_80:
        v45 = v68;
        if (v68 >= (double *)v69)
        {
          v47 = (double *)v67;
          v48 = ((char *)v68 - (_BYTE *)v67) >> 3;
          v49 = v48 + 1;
          if ((unint64_t)(v48 + 1) >> 61)
            std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
          v50 = v69 - (_BYTE *)v67;
          if ((v69 - (_BYTE *)v67) >> 2 > v49)
            v49 = v50 >> 2;
          if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8)
            v51 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v51 = v49;
          if (v51)
          {
            v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v69, v51);
            v47 = (double *)v67;
            v45 = v68;
          }
          else
          {
            v52 = 0;
          }
          v53 = (double *)&v52[8 * v48];
          *v53 = v32;
          v46 = v53 + 1;
          while (v45 != v47)
          {
            v54 = *((_QWORD *)v45-- - 1);
            *((_QWORD *)v53-- - 1) = v54;
          }
          v67 = v53;
          v68 = v46;
          v69 = &v52[8 * v51];
          if (v47)
            operator delete(v47);
        }
        else
        {
          *v68 = v32;
          v46 = v45 + 1;
        }
        v68 = v46;
        __p[0] = &v60;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
LABEL_77:
        ++v6;
        ++v8;
      }
      while (v8 != v5);
      v55 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      v5 = v55;
    }
    while (v55);
  }

  pps::Histogram_Internal::record((uint64_t)self->_histogramPtr.__ptr_.__value_, (_QWORD **)&v67);
  std::__tree<std::__value_type<int,std::vector<std::string>>,std::__map_value_compare<int,std::__value_type<int,std::vector<std::string>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<std::string>>>>::destroy((uint64_t)&v65, v66[0]);
  if (v67)
  {
    v68 = (double *)v67;
    operator delete(v67);
  }

}

- (void)reset
{
  pps::Histogram_Internal::reset((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_);
}

- (unint64_t)sum:(BOOL)a3
{
  double v3;

  return pps::Histogram_Internal::sum((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_, a3, v3);
}

- (id)createArrayFromDimensionIdx:(unint64_t)a3 withFlowBins:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = a4;
  -[PPSHistogram dimensions](self, "dimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
    return 0;
  -[PPSHistogram dimensions](self, "dimensions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v11 = objc_msgSend(v10, "extent");
  else
    v11 = objc_msgSend(v10, "size");
  v13 = v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v13);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v13; --v13)
  {
    -[PPSHistogram dimensions](self, "dimensions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count") - 1;

    if (v16 == a3)
    {
      objc_msgSend(i, "addObject:", &unk_25143FF58);
    }
    else
    {
      -[PPSHistogram createArrayFromDimensionIdx:withFlowBins:](self, "createArrayFromDimensionIdx:withFlowBins:", a3 + 1, v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(i, "addObject:", v17);

    }
  }
  return i;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[PPSHistogram counts:](self, "counts:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("counts"));

  -[PPSHistogram dimensions](self, "dimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dimensions"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PPSHistogram sum:](self, "sum:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sum"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (PPSHistogram)initWithHistogram:(id)a3
{
  _QWORD *v4;
  PPSHistogram *v5;
  const pps::Histogram_Internal *v6;
  pps::Histogram_Internal *v7;
  Histogram_Internal *value;
  uint64_t v9;
  NSArray *dimensions;
  PPSHistogram *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPSHistogram;
  v5 = -[PPSHistogram init](&v13, sel_init);
  if (!v5)
    goto LABEL_5;
  v6 = (const pps::Histogram_Internal *)v4[1];
  v7 = (pps::Histogram_Internal *)operator new();
  pps::Histogram_Internal::Histogram_Internal(v7, v6);
  value = v5->_histogramPtr.__ptr_.__value_;
  v5->_histogramPtr.__ptr_.__value_ = (Histogram_Internal *)v7;
  if (value)
    (*(void (**)(Histogram_Internal *))(*(_QWORD *)value + 8))(value);
  objc_msgSend(v4, "dimensions");
  v9 = objc_claimAutoreleasedReturnValue();
  dimensions = v5->_dimensions;
  v5->_dimensions = (NSArray *)v9;

  if (!v5->_histogramPtr.__ptr_.__value_)
    v11 = 0;
  else
LABEL_5:
    v11 = v5;

  return v11;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSHistogram description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;

  -[PPSHistogram dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)hash
{
  double v2;

  return pps::Histogram_Internal::hash((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_, v2);
}

- (BOOL)isEqual:(id)a3
{
  PPSHistogram *v4;
  BOOL v5;

  v4 = (PPSHistogram *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PPSHistogram isEqualToHistogram:](self, "isEqualToHistogram:", v4);
  }

  return v5;
}

- (NSArray)dimensions
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  Histogram_Internal *value;

  objc_storeStrong((id *)&self->_dimensions, 0);
  value = self->_histogramPtr.__ptr_.__value_;
  self->_histogramPtr.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Histogram_Internal *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)counts:
{
}

- (__n128)counts:
{
  __n128 result;

  *(_QWORD *)a2 = &off_25142C778;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)counts:
{
    return a1 + 8;
  else
    return 0;
}

- (void)initWithBinCount:range:metricName:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5(v0, v1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2439D9000, v2, v3, "Couldn't initialize <PPSHistogram: %p> due to std::exception - \"%s\", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_8();
}

- (void)initWithBinCount:range:metricName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2(&dword_2439D9000, v0, v1, "Couldn't initialize <PPSHistogram: %p> due to unknown exception", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithDimensions:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2(&dword_2439D9000, v0, v1, "Couldn't initialize <PPSHistogram: %p> - mismatch between number of bins and edges", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithDimensions:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2(&dword_2439D9000, v0, v1, "Couldn't initialize <PPSHistogram: %p> - maxRange < maxRange", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithDimensions:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2(&dword_2439D9000, v0, v1, "Couldn't initialize <PPSHistogram: %p> - invalid number of bins or edges in dimension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)JSONRepresentation
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_2439D9000, v0, OS_LOG_TYPE_DEBUG, "Error while parsing JSON data: %@", v1, 0xCu);
  OUTLINED_FUNCTION_7();
}

- (void)recordSample:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5(v0, v1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2439D9000, v2, v3, "Couldn't record sample for <PPSHistogram: %p> due to std::exception - \"%s\", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_8();
}

- (void)recordSample:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2(&dword_2439D9000, v0, v1, "Couldn't record sample for <PPSHistogram: %p> due to unknown exception", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
