@implementation OUBox3dSerialization

- (id)dictionaryFromBox3d:(OUBox3d *)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  _DWORD *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  _BYTE *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _BYTE *v27;
  uint64_t v28;
  void *v29;
  _BYTE *v30;
  uint64_t v31;
  void *__p;
  _BYTE *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", a3[1].var5.var0, CFSTR("type"));
  objc_msgSend(a3[1].var5.var2.var0, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v4, CFSTR("identifier"));

  LODWORD(v5) = a3[1].var5.var1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v6, CFSTR("confidence"));

  v26 = 0;
  v27 = 0;
  v28 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v26, (const void *)a3[1].var6.var1, a3[1].var6.var2.var0, (uint64_t)(a3[1].var6.var2.var0 - a3[1].var6.var1) >> 2);
  v29 = 0;
  v30 = 0;
  v31 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v29, v26, (uint64_t)v27, (v27 - (_BYTE *)v26) >> 2);
  __p = 0;
  v33 = 0;
  v34 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v29, (uint64_t)v30, (v30 - (_BYTE *)v29) >> 2);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (v33 - (_BYTE *)__p) >> 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = __p;
  if (v33 != __p)
  {
    v10 = 0;
    do
    {
      LODWORD(v8) = v9[v10];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      ++v10;
      v9 = __p;
    }
    while (v10 < (v33 - (_BYTE *)__p) >> 2);
  }
  v12 = (void *)objc_msgSend(v7, "copy");

  if (__p)
  {
    v33 = __p;
    operator delete(__p);
  }
  if (v29)
  {
    v30 = v29;
    operator delete(v29);
  }
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v12, CFSTR("logits"));

  if (v26)
  {
    v27 = v26;
    operator delete(v26);
  }
  float3ToNSArray(*(__n128 *)&a3->var1);
  __p = (void *)objc_claimAutoreleasedReturnValue();
  v24 = __p;
  float3ToNSArray(*(__n128 *)&a3->var3);
  v13 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  float3ToNSArray(*(__n128 *)&a3->var5.var0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v14;
  float3ToNSArray(*(__n128 *)&a3->var5.var2.var0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v15;
  float3ToNSArray(*(__n128 *)&a3->var6.var1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v16;
  float3ToNSArray(*(__n128 *)&a3->var7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v17;
  float3ToNSArray(*(__n128 *)&a3[1].var1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v18;
  float3ToNSArray(*(__n128 *)&a3[1].var3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &__p, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, CFSTR("bbox"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", a3[2].var3, CFSTR("group_type"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", SLOWORD(a3[2].var4));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v21, CFSTR("group_id"));

  v22 = (void *)objc_msgSend(v25, "copy");
  return v22;
}

- (id)dictionaryFromBoxes3d:()vector<OUBox3d
{
  void *v5;
  void *v6;
  OUBox3d *begin;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  OUBox3d v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *__p;
  id v20;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  begin = a3->__begin_;
  if (a3->__end_ != a3->__begin_)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      OUBox3d::OUBox3d(&v13, (OUBox3d *)((char *)begin + v8));
      -[OUBox3dSerialization dictionaryFromBox3d:](self, "dictionaryFromBox3d:", &v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (__p)
        operator delete(__p);
      if (v17)
      {
        v18 = v17;
        operator delete(v17);
      }

      objc_msgSend(v6, "addObject:", v10);
      ++v9;
      begin = a3->__begin_;
      v8 += 224;
    }
    while (0x6DB6DB6DB6DB6DB7 * (((char *)a3->__end_ - (char *)a3->__begin_) >> 5) > v9);
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("boxes"));
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
}

- (id)dictionaryFromBoxes3dPointCloud:()vector<OUBox3d pointCloud:(std:(id)a4 :allocator<OUBox3d>> *)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  void **v13;

  v6 = a4;
  memset(v12, 0, sizeof(v12));
  std::vector<OUBox3d>::__init_with_size[abi:ne180100]<OUBox3d*,OUBox3d*>(v12, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->__end_ - (char *)a3->__begin_) >> 5));
  -[OUBox3dSerialization dictionaryFromBoxes3d:](self, "dictionaryFromBoxes3d:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v13 = (void **)v12;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](&v13);
  OUPointCloudToDictionary(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("points"));

  v10 = (void *)objc_msgSend(v8, "copy");
  return v10;
}

- (OUBox3d)box3dFromDictionary:(SEL)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t i;
  void *v12;
  char isKindOfClass;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int128 v20;
  int v21;
  void *v22;
  int v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  float *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  OUBox3d *result;
  std::logic_error *exception;
  id v40;
  id v41;
  int v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  _OWORD v46[9];

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v40 = v6;
  else
    v40 = 0;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bbox"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v41 = v9;
  else
    v41 = 0;

  v10 = v8;
  if (objc_msgSend(v10, "count") == 8)
  {
    for (i = 0; i != 8; ++i)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        break;
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count") != 3)
      {

        goto LABEL_17;
      }
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      *(_QWORD *)&v43 = v16;
      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      v42 = v18;
      objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v20 = v43;
      DWORD1(v20) = v42;
      DWORD2(v20) = v21;
      v46[i] = v20;

    }
  }
  else
  {
LABEL_17:
    isKindOfClass = 0;
  }

  if (!v40 || !v10 || !v41 || (isKindOfClass & 1) == 0)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "[3DOD] input is insufficient to process box3dFromDictionary.");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
    __cxa_throw(exception, (struct type_info *)off_24F242648, (void (*)(void *))MEMORY[0x24BEDAB88]);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "floatValue");
  v24 = v23;
  v25 = v46[5];
  *(_OWORD *)&retstr->var6.var1 = v46[4];
  *(_OWORD *)&retstr->var7 = v25;
  v26 = v46[7];
  *(_OWORD *)&retstr[1].var1 = v46[6];
  *(_OWORD *)&retstr[1].var3 = v26;
  v27 = v46[1];
  *(_OWORD *)&retstr->var1 = v46[0];
  *(_OWORD *)&retstr->var3 = v27;
  v28 = v46[3];
  *(_OWORD *)&retstr->var5.var0 = v46[2];
  *(_OWORD *)&retstr->var5.var2.var0 = v28;
  v29 = v22;
  retstr[1].var5.var0 = v29;
  LODWORD(retstr[1].var5.var1) = v24;
  retstr[1].var5.var2.var0 = 0;
  retstr[1].var6.var0 = (unint64_t *)CFSTR("unknown");
  *(_OWORD *)&retstr[1].var6.var1 = 0u;
  *(_OWORD *)&retstr[1].var7 = 0u;
  *(_OWORD *)&retstr[2].var1 = 0u;
  retstr[2].var3 = 0;
  LOWORD(retstr[2].var4) = -1;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    retstr[1].var5.var2.var0 = (float *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v30);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("logits"));
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v32 = v31;
  else
    v32 = 0;

  if (v32)
  {
    vectorFromNSArray(v32, &v44);
    v33 = v45;
    *(_OWORD *)&retstr[1].var6.var1 = v44;
    retstr[1].var7 = v33;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("group_type"));
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v35 = v34;
  else
    v35 = 0;

  if (v35)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("group_type"));
    retstr[2].var3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("group_id"));
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v37 = v36;
  else
    v37 = 0;

  if (v37)
    LOWORD(retstr[2].var4) = objc_msgSend(v37, "intValue");

  return result;
}

- (id)pointCloudFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  OUPointCloud *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("points")))
        {
          v10 = [OUPointCloud alloc];
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[OUPointCloud initWithDictionary:](v10, "initWithDictionary:", v11);

          v5 = (void *)v12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (vector<OUBox3d,)boxes3dFromDictionary:(OUBox3dSerialization *)self
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  vector<OUBox3d, std::allocator<OUBox3d>> *result;
  id v16;
  uint64_t v17;
  __int128 v18[8];
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *__p;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = v6;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v17 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("boxes")))
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v16, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v27 != v13)
                  objc_enumerationMutation(v11);
                -[OUBox3dSerialization box3dFromDictionary:](self, "box3dFromDictionary:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
                std::vector<OUBox3d>::push_back[abi:ne180100]((uint64_t *)retstr, v18);

                if (__p)
                  operator delete(__p);
                if (v22)
                {
                  v23 = v22;
                  operator delete(v22);
                }

              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v12);
          }

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  return result;
}

@end
