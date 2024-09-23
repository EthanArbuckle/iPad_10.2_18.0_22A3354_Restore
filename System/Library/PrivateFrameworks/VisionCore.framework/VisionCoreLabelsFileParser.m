@implementation VisionCoreLabelsFileParser

+ (BOOL)isValidLabel:(id)a3
{
  id v3;
  id v4;
  int v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "length"))
      v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("CVML_UNKNOWN_")) ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)parseLabels:(id *)a3 fromContentsOfURL:(id)a4 invalidLabelPlaceholderObject:(id)a5 validLabelIndexes:(id *)a6 error:(id *)a7
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  std::locale::id *v13;
  const std::locale::facet *v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _BYTE *v18;
  int v19;
  BOOL v20;
  id v21;
  std::string *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v31;
  id v32;
  std::string v33;
  std::locale v34;
  _QWORD v35[2];
  _BYTE v36[20];
  _BYTE v37[388];
  _QWORD v38[21];

  v38[19] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v31 = objc_retainAutorelease(v9);
  if (!objc_msgSend(v31, "fileSystemRepresentation"))
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unable to open %@"), v31);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v25);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v20 = 0;
    goto LABEL_42;
  }
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v32 = objc_alloc_init(MEMORY[0x24BDD1698]);
  memset(&v33, 0, sizeof(v33));
  std::ifstream::basic_ifstream(v35);
  v12 = 0;
  v13 = (std::locale::id *)MEMORY[0x24BEDB350];
  while (2)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v35 + *(_QWORD *)(v35[0] - 24)));
    v14 = std::locale::use_facet(&v34, v13);
    v15 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
    std::locale::~locale(&v34);
    MEMORY[0x2207A5F78](&v34, v35, 1);
    if (!LOBYTE(v34.__locale_))
      goto LABEL_20;
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    {
      *v33.__r_.__value_.__l.__data_ = 0;
      v33.__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      v33.__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&v33.__r_.__value_.__s + 23) = 0;
    }
    v16 = 0;
    while (1)
    {
      v17 = *(_QWORD **)&v37[*(_QWORD *)(v35[0] - 24) + 4];
      v18 = (_BYTE *)v17[3];
      if (v18 != (_BYTE *)v17[4])
      {
        v17[3] = v18 + 1;
        LOBYTE(v17) = *v18;
        goto LABEL_11;
      }
      LODWORD(v17) = (*(uint64_t (**)(_QWORD *))(*v17 + 80))(v17);
      if ((_DWORD)v17 == -1)
        break;
LABEL_11:
      if (v15 == v17)
      {
        v19 = 0;
        goto LABEL_19;
      }
      std::string::push_back(&v33, (std::string::value_type)v17);
      ++v16;
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0 && v33.__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7)
      {
        v19 = 4;
        goto LABEL_19;
      }
    }
    if (v16)
      v19 = 2;
    else
      v19 = 6;
LABEL_19:
    std::ios_base::clear((std::ios_base *)((char *)v35 + *(_QWORD *)(v35[0] - 24)), *(_DWORD *)&v36[*(_QWORD *)(v35[0] - 24) + 16] | v19);
LABEL_20:
    v20 = (*(_DWORD *)&v36[*(_QWORD *)(v35[0] - 24) + 16] & 5) != 0;
    if ((*(_DWORD *)&v36[*(_QWORD *)(v35[0] - 24) + 16] & 5) != 0)
    {
      if (a3)
        *a3 = (id)objc_msgSend(v11, "copy");
      if (a6)
        *a6 = (id)objc_msgSend(v32, "copy");
    }
    else
    {
      v21 = objc_alloc(MEMORY[0x24BDD17C8]);
      if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v22 = &v33;
      else
        v22 = (std::string *)v33.__r_.__value_.__r.__words[0];
      v23 = (void *)objc_msgSend(v21, "initWithUTF8String:", v22);
      if (objc_msgSend(a1, "isValidLabel:", v23))
      {
        objc_msgSend(v32, "addIndex:", v12);
LABEL_28:
        objc_msgSend(v11, "addObject:", v23);

        ++v12;
        continue;
      }
      if (v10)
      {
        v24 = v10;

        v23 = v24;
        goto LABEL_28;
      }
      if (a7)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Line %lu of %@ contains an invalid label of \"%@\"), v12 + 1, v31, v23, v37);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForCorruptedResourceWithLocalizedDescription:", v26);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    break;
  }
  v35[0] = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)v35 + *(_QWORD *)(v35[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 24);
  MEMORY[0x2207A5F6C](v36);
  std::istream::~istream();
  MEMORY[0x2207A5FB4](v38);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);

LABEL_42:
  return v20;
}

@end
