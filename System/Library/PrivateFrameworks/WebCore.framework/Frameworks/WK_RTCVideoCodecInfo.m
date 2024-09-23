@implementation WK_RTCVideoCodecInfo

- (WK_RTCVideoCodecInfo)initWithNativeSdpVideoFormat:(SdpVideoFormat *)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  SdpVideoFormat *var0;
  SdpVideoFormat *v10;
  BOOL v11;
  void *v12;
  WK_RTCVideoCodecInfo *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a3->var0.var0.var1.var0[0];
  if ((unint64_t *)v6 != &a3->var0.var0.var1.var0[1])
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "rtcStringForStdString:", v6 + 56);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "rtcStringForStdString:", v6 + 32);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v7, v8);

      var0 = *(SdpVideoFormat **)(v6 + 8);
      if (var0)
      {
        do
        {
          v10 = var0;
          var0 = (SdpVideoFormat *)var0->var0.var0.var0.var0.var1.var0;
        }
        while (var0);
      }
      else
      {
        do
        {
          v10 = *(SdpVideoFormat **)(v6 + 16);
          v11 = v10->var0.var0.var0.var0.var1.var0 == (char *)v6;
          v6 = (unint64_t)v10;
        }
        while (!v11);
      }
      v6 = (unint64_t)v10;
    }
    while (v10 != (SdpVideoFormat *)&a3->var0.var0.var1.var0[1]);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "rtcStringForStdString:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WK_RTCVideoCodecInfo initWithName:parameters:](self, "initWithName:parameters:", v12, v5);

  return v13;
}

- (SdpVideoFormat)nativeSdpVideoFormat
{
  void *v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t i;
  void **v6;
  size_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  size_t v16;
  void **v17;
  unint64_t v18;
  BOOL v19;
  char v20;
  void **v21;
  size_t v22;
  const void **v23;
  const void *v24;
  size_t v25;
  size_t v26;
  int v27;
  void **v28;
  size_t v29;
  size_t v30;
  int v31;
  uint64_t v32;
  char *v33;
  std::string *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  _BYTE *v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  std::string *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  SdpVideoFormat *v51;
  uint64_t *v52;
  __raw *p_var1;
  uint64_t *v54;
  SdpVideoFormat *result;
  uint64_t *v56;
  uint64_t *v57;
  id obj;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63[2];
  int64_t v64;
  void *__p[2];
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t *v71;
  char *v72;
  uint64_t v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v72 = 0;
  v73 = 0;
  v61 = v1;
  v71 = (uint64_t *)&v72;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v1, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  v4 = 0x24BDD1000;
  if (v3)
  {
    v60 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v3; i = v32 + 1)
      {
        while (1)
        {
          if (*(_QWORD *)v68 != v60)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(*(id *)(v4 + 1992), "rtcStdStringForString:", v8);
          v9 = *(void **)(v4 + 1992);
          objc_msgSend(v61, "parameters");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "rtcStdStringForString:", v11);
          v62 = i;
          v12 = v3;

          v13 = (uint64_t)v72;
          v14 = (uint64_t *)&v72;
          v15 = (uint64_t *)&v72;
          if (v72)
          {
            v16 = HIBYTE(v66);
            v17 = (void **)__p[0];
            v18 = (unint64_t)__p[1];
            if (__p[1])
              v19 = __p[0] == 0;
            else
              v19 = 0;
            v20 = !v19;
            while (1)
            {
              v14 = (uint64_t *)v13;
              if ((v16 & 0x80) != 0)
              {
                if ((v18 & 0x8000000000000000) != 0 || (v21 = v17, v22 = v18, (v20 & 1) == 0))
                {
LABEL_102:
                  __break(1u);
                  goto LABEL_103;
                }
              }
              else
              {
                v21 = __p;
                v22 = v16;
              }
              v23 = (const void **)(v13 + 32);
              v4 = *(unsigned __int8 *)(v13 + 55);
              v24 = (const void *)(v13 + 32);
              v25 = v4;
              if (*(char *)(v13 + 55) < 0)
              {
                v25 = *(_QWORD *)(v13 + 40);
                if ((v25 & 0x8000000000000000) != 0)
                  goto LABEL_102;
                v24 = *v23;
                if (v25)
                {
                  if (!v24)
                    goto LABEL_102;
                }
              }
              if (v25 >= v22)
                v26 = v22;
              else
                v26 = v25;
              v27 = memcmp(v21, v24, v26);
              if (v27)
              {
                if (v27 < 0)
                  goto LABEL_24;
LABEL_40:
                if ((v4 & 0x80) != 0)
                {
                  v4 = v14[5];
                  if ((v4 & 0x8000000000000000) != 0)
                    goto LABEL_102;
                  v23 = (const void **)*v23;
                  if (v4)
                  {
                    if (!v23)
                      goto LABEL_102;
                  }
                }
                if ((v16 & 0x80) != 0)
                {
                  if ((v18 & 0x8000000000000000) != 0)
                    goto LABEL_102;
                  v28 = v17;
                  v29 = v18;
                  if ((v20 & 1) == 0)
                    goto LABEL_102;
                }
                else
                {
                  v28 = __p;
                  v29 = v16;
                }
                if (v29 >= v4)
                  v30 = v4;
                else
                  v30 = v29;
                v31 = memcmp(v23, v28, v30);
                if (v31)
                {
                  if ((v31 & 0x80000000) == 0)
                    goto LABEL_81;
                }
                else if (v4 >= v29)
                {
LABEL_81:
                  v33 = (char *)v14;
                  v3 = v12;
                  v32 = v62;
                  v47 = (std::string *)(v14 + 7);
                  if (v14 + 7 != (uint64_t *)v63)
                    goto LABEL_89;
LABEL_11:
                  if (SHIBYTE(v64) < 0)
                    operator delete(v63[0]);
                  goto LABEL_13;
                }
                v13 = v14[1];
                if (!v13)
                {
                  v15 = v14 + 1;
                  break;
                }
              }
              else
              {
                if (v22 >= v25)
                  goto LABEL_40;
LABEL_24:
                v13 = *v14;
                v15 = v14;
                if (!*v14)
                  break;
              }
            }
          }
          v3 = v12;
          v32 = v62;
          v33 = (char *)operator new(0x50uLL);
          v34 = (std::string *)(v33 + 32);
          if (SHIBYTE(v66) < 0)
          {
            std::string::__init_copy_ctor_external(v34, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
          }
          else
          {
            *(_OWORD *)&v34->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
            *((_QWORD *)v33 + 6) = v66;
          }
          *((_QWORD *)v33 + 7) = 0;
          *((_QWORD *)v33 + 8) = 0;
          *((_QWORD *)v33 + 9) = 0;
          *(_QWORD *)v33 = 0;
          *((_QWORD *)v33 + 1) = 0;
          *((_QWORD *)v33 + 2) = v14;
          *v15 = (uint64_t)v33;
          v35 = v33;
          if (*v71)
          {
            v71 = (uint64_t *)*v71;
            v35 = (char *)*v15;
          }
          v36 = (uint64_t)v72;
          v19 = v35 == v72;
          v35[24] = v35 == v72;
          if (!v19)
          {
            do
            {
              v37 = *((_QWORD *)v35 + 2);
              if (*(_BYTE *)(v37 + 24))
                break;
              v38 = *(char **)(v37 + 16);
              v39 = *(_QWORD *)v38;
              if (*(_QWORD *)v38 == v37)
              {
                v42 = *((_QWORD *)v38 + 1);
                if (!v42 || (v43 = *(unsigned __int8 *)(v42 + 24), v40 = (_BYTE *)(v42 + 24), v43))
                {
                  if (*(char **)v37 == v35)
                  {
                    *(_BYTE *)(v37 + 24) = 1;
                    v38[24] = 0;
                    v46 = *(_QWORD *)(v37 + 8);
                    *(_QWORD *)v38 = v46;
                    if (v46)
                      goto LABEL_79;
                  }
                  else
                  {
                    v44 = *(uint64_t **)(v37 + 8);
                    v45 = *v44;
                    *(_QWORD *)(v37 + 8) = *v44;
                    if (v45)
                    {
                      *(_QWORD *)(v45 + 16) = v37;
                      v38 = *(char **)(v37 + 16);
                    }
                    v44[2] = (uint64_t)v38;
                    *(_QWORD *)(*(_QWORD *)(v37 + 16) + 8 * (**(_QWORD **)(v37 + 16) != v37)) = v44;
                    *v44 = v37;
                    *(_QWORD *)(v37 + 16) = v44;
                    v38 = (char *)v44[2];
                    v37 = *(_QWORD *)v38;
                    *((_BYTE *)v44 + 24) = 1;
                    v38[24] = 0;
                    v46 = *(_QWORD *)(v37 + 8);
                    *(_QWORD *)v38 = v46;
                    if (v46)
LABEL_79:
                      *(_QWORD *)(v46 + 16) = v38;
                  }
                  *(_QWORD *)(v37 + 16) = *((_QWORD *)v38 + 2);
                  *(_QWORD *)(*((_QWORD *)v38 + 2) + 8 * (**((_QWORD **)v38 + 2) != (_QWORD)v38)) = v37;
                  *(_QWORD *)(v37 + 8) = v38;
LABEL_87:
                  *((_QWORD *)v38 + 2) = v37;
                  break;
                }
              }
              else if (!v39 || (v41 = *(unsigned __int8 *)(v39 + 24), v40 = (_BYTE *)(v39 + 24), v41))
              {
                if (*(char **)v37 == v35)
                {
                  v49 = *((_QWORD *)v35 + 1);
                  *(_QWORD *)v37 = v49;
                  if (v49)
                  {
                    *(_QWORD *)(v49 + 16) = v37;
                    v38 = *(char **)(v37 + 16);
                  }
                  *((_QWORD *)v35 + 2) = v38;
                  *(_QWORD *)(*(_QWORD *)(v37 + 16) + 8 * (**(_QWORD **)(v37 + 16) != v37)) = v35;
                  *((_QWORD *)v35 + 1) = v37;
                  *(_QWORD *)(v37 + 16) = v35;
                  v38 = (char *)*((_QWORD *)v35 + 2);
                  v35[24] = 1;
                  v38[24] = 0;
                  v37 = *((_QWORD *)v38 + 1);
                  v48 = *(char **)v37;
                  *((_QWORD *)v38 + 1) = *(_QWORD *)v37;
                  if (v48)
LABEL_85:
                    *((_QWORD *)v48 + 2) = v38;
                }
                else
                {
                  *(_BYTE *)(v37 + 24) = 1;
                  v38[24] = 0;
                  v37 = *((_QWORD *)v38 + 1);
                  v48 = *(char **)v37;
                  *((_QWORD *)v38 + 1) = *(_QWORD *)v37;
                  if (v48)
                    goto LABEL_85;
                }
                *(_QWORD *)(v37 + 16) = *((_QWORD *)v38 + 2);
                *(_QWORD *)(*((_QWORD *)v38 + 2) + 8 * (**((_QWORD **)v38 + 2) != (_QWORD)v38)) = v37;
                *(_QWORD *)v37 = v38;
                goto LABEL_87;
              }
              *(_BYTE *)(v37 + 24) = 1;
              v35 = v38;
              v38[24] = v38 == (char *)v36;
              *v40 = 1;
            }
            while (v38 != (char *)v36);
          }
          ++v73;
          v47 = (std::string *)(v33 + 56);
          if (v33 + 56 == (char *)v63)
            goto LABEL_11;
LABEL_89:
          if (v33[79] < 0)
          {
            if (v64 >= 0)
              v6 = v63;
            else
              v6 = (void **)v63[0];
            if (v64 >= 0)
              v7 = HIBYTE(v64);
            else
              v7 = (size_t)v63[1];
            std::string::__assign_no_alias<false>(v47, (const std::string::value_type *)v6, v7);
            goto LABEL_11;
          }
          if (v64 < 0)
          {
            std::string::__assign_no_alias<true>(v47, (char *)v63[0], (size_t)v63[1]);
            goto LABEL_11;
          }
          *(_OWORD *)&v47->__r_.__value_.__l.__data_ = *(_OWORD *)v63;
          v47->__r_.__value_.__r.__words[2] = v64;
LABEL_13:
          v4 = 0x24BDD1000uLL;
          if (SHIBYTE(v66) < 0)
            break;
          i = v32 + 1;
          if (i == v3)
            goto LABEL_99;
        }
        operator delete(__p[0]);
      }
LABEL_99:
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v3);
  }

  v50 = *(void **)(v4 + 1992);
  objc_msgSend(v61, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "rtcStdStringForString:", v4);
  if (SHIBYTE(v66) < 0)
  {
LABEL_103:
    v51 = retstr;
    std::string::__init_copy_ctor_external((std::string *)retstr, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
  }
  else
  {
    v51 = retstr;
    *(_OWORD *)retstr->var0.var0.var0.var0.var0.var0 = *(_OWORD *)__p;
    *((_QWORD *)&retstr->var0.var0.var0.var0.var1 + 2) = v66;
  }
  v51->var0.var0.var1.var0[1] = 0;
  v52 = (uint64_t *)&v51->var0.var0.var1.var0[1];
  v51->var0.var0.var1.var0[0] = (unint64_t)&v51->var0.var0.var1.var0[1];
  p_var1 = &v51->var0.var0.var1;
  p_var1->var0[2] = 0;
  v54 = v71;
  if (v71 != (uint64_t *)&v72)
  {
    do
    {
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,std::string> const&>((uint64_t **)p_var1, v52, (uint64_t)(v54 + 4), (uint64_t)(v54 + 4));
      v56 = (uint64_t *)v54[1];
      if (v56)
      {
        do
        {
          v57 = v56;
          v56 = (uint64_t *)*v56;
        }
        while (v56);
      }
      else
      {
        do
        {
          v57 = (uint64_t *)v54[2];
          v19 = *v57 == (_QWORD)v54;
          v54 = v57;
        }
        while (!v19);
      }
      v54 = v57;
    }
    while (v57 != (uint64_t *)&v72);
  }
  retstr[1].var0.var0.var0.var0.var1.var0 = 0;
  if (SHIBYTE(v66) < 0)
    operator delete(__p[0]);

  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v71, (uint64_t)v72);
  return result;
}

- (WK_RTCVideoCodecInfo)initWithName:(id)a3
{
  return -[WK_RTCVideoCodecInfo initWithName:parameters:](self, "initWithName:parameters:", a3, 0);
}

- (WK_RTCVideoCodecInfo)initWithName:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  WK_RTCVideoCodecInfo *v9;
  WK_RTCVideoCodecInfo *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WK_RTCVideoCodecInfo;
  v9 = -[WK_RTCVideoCodecInfo init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    if (v8)
      v11 = v8;
    else
      v11 = (void *)MEMORY[0x24BDBD1B8];
    objc_storeStrong((id *)&v10->_parameters, v11);
  }

  return v10;
}

- (BOOL)isEqualToCodecInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  if (v4)
  {
    -[WK_RTCVideoCodecInfo name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[WK_RTCVideoCodecInfo parameters](self, "parameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToDictionary:", v8) ^ 1;

    }
    else
    {
      LOBYTE(v9) = 1;
    }

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9 ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  WK_RTCVideoCodecInfo *v4;
  WK_RTCVideoCodecInfo *v5;
  BOOL v6;

  v4 = (WK_RTCVideoCodecInfo *)a3;
  v5 = v4;
  if (self == v4)
  {

    return 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[WK_RTCVideoCodecInfo isEqualToCodecInfo:](self, "isEqualToCodecInfo:", v5);

      return v6;
    }
    else
    {

      return 0;
    }
  }
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WK_RTCVideoCodecInfo name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WK_RTCVideoCodecInfo parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (WK_RTCVideoCodecInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WK_RTCVideoCodecInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WK_RTCVideoCodecInfo initWithName:parameters:](self, "initWithName:parameters:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));

}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
