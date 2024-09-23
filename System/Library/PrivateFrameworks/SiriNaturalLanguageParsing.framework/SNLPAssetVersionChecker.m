@implementation SNLPAssetVersionChecker

+ (id)loadNSNumberListFromPlistURL:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v4 = SNLPOSLoggerForCategory(0);
  return v3;
}

+ (unordered_set<unsigned)loadUInt32ListFromPlistURL:(std:(std:(id)a2 :(SEL)a3 allocator<unsigned int>> *__return_ptr)retstr :(id)a4 equal_to<unsigned)int>
{
  unint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __compressed_pair<std::__hash_node_base<std::__hash_node<unsigned int, void *> *>, std::allocator<std::__hash_node<unsigned int, void *>>> *p_var1;
  uint64_t i;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t var0;
  uint8x8_t v15;
  uint64_t **v16;
  uint64_t *j;
  unint64_t v18;
  _QWORD *v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  void **v26;
  void **v27;
  unint64_t v28;
  unordered_set<unsigned int, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<unsigned int>> *result;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  +[SNLPAssetVersionChecker loadNSNumberListFromPlistURL:](SNLPAssetVersionChecker, "loadNSNumberListFromPlistURL:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  v30 = v6;
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>((uint64_t)retstr, vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v6, "count") / retstr->var0.var3.var0));
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v30;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v33;
    p_var1 = &retstr->var0.var1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(obj);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "unsignedIntValue");
        v12 = v11;
        v13 = v11;
        var0 = retstr->var0.var0.var0.var1.var0.var0;
        if (var0)
        {
          v15 = (uint8x8_t)vcnt_s8((int8x8_t)var0);
          v15.i16[0] = vaddlv_u8(v15);
          if (v15.u32[0] > 1uLL)
          {
            v4 = v11;
            if (var0 <= v11)
              v4 = v11 % var0;
          }
          else
          {
            v4 = ((_DWORD)var0 - 1) & v11;
          }
          v16 = (uint64_t **)retstr->var0.var0.var0.var0[v4];
          if (v16)
          {
            for (j = *v16; j; j = (uint64_t *)*j)
            {
              v18 = j[1];
              if (v18 == v11)
              {
                if (*((_DWORD *)j + 4) == v11)
                  goto LABEL_44;
              }
              else
              {
                if (v15.u32[0] > 1uLL)
                {
                  if (v18 >= var0)
                    v18 %= var0;
                }
                else
                {
                  v18 &= var0 - 1;
                }
                if (v18 != v4)
                  break;
              }
            }
          }
        }
        v19 = operator new(0x18uLL);
        *v19 = 0;
        v19[1] = v13;
        *((_DWORD *)v19 + 4) = v12;
        v20 = (float)(retstr->var0.var2.var0 + 1);
        v21 = retstr->var0.var3.var0;
        if (!var0 || (float)(v21 * (float)var0) < v20)
        {
          v22 = (var0 & (var0 - 1)) != 0;
          if (var0 < 3)
            v22 = 1;
          v23 = v22 | (2 * var0);
          v24 = vcvtps_u32_f32(v20 / v21);
          if (v23 <= v24)
            v25 = v24;
          else
            v25 = v23;
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>((uint64_t)retstr, v25);
          var0 = retstr->var0.var0.var0.var1.var0.var0;
          if ((var0 & (var0 - 1)) != 0)
          {
            if (var0 <= v13)
              v4 = v13 % var0;
            else
              v4 = v13;
          }
          else
          {
            v4 = ((_DWORD)var0 - 1) & v13;
          }
        }
        v26 = retstr->var0.var0.var0.var0;
        v27 = (void **)retstr->var0.var0.var0.var0[v4];
        if (v27)
        {
          *v19 = *v27;
LABEL_42:
          *v27 = v19;
          goto LABEL_43;
        }
        *v19 = p_var1->var0.var0;
        p_var1->var0.var0 = v19;
        v26[v4] = p_var1;
        if (*v19)
        {
          v28 = *(_QWORD *)(*v19 + 8);
          if ((var0 & (var0 - 1)) != 0)
          {
            if (v28 >= var0)
              v28 %= var0;
          }
          else
          {
            v28 &= var0 - 1;
          }
          v27 = &retstr->var0.var0.var0.var0[v28];
          goto LABEL_42;
        }
LABEL_43:
        ++retstr->var0.var2.var0;
LABEL_44:
        ;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v7);
  }

  return result;
}

+ (unordered_set<unsigned)loadUInt32ListFromConfigPListResourceName:(std:(std:(id)a2 :(SEL)a3 allocator<unsigned int>> *__return_ptr)retstr :(id)a4 equal_to<unsigned)int>
{
  void *v6;
  void *v7;
  id v8;
  unordered_set<unsigned int, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<unsigned int>> *result;
  id v10;

  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", v10, CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a2, "loadUInt32ListFromPlistURL:", v7);
  }
  else
  {
    v8 = SNLPOSLoggerForCategory(0);
    retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
    retstr->var0.var3.var0 = 1.0;
  }

  return result;
}

@end
