@implementation CLPCReportingClient

- (id)convertSampleList:(uint64_t)a1 error:
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _OWORD *v6;
  char *v7;
  _QWORD *v8;
  __int128 v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t k;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;
  _QWORD v30[2];
  _OWORD v31[4];
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  _BYTE v35[24];
  _BYTE *v36;
  _QWORD *v37[4];
  _BYTE v38[24];
  _BYTE *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v33 = a1;
  if (!a1)
    return 0;
  v1 = 0;
  v32 = 0;
  memset(v31, 0, sizeof(v31));
  do
  {
    v2 = *(_QWORD *)(v33 + 200 + v1);
    if (v2 && objc_msgSend(*(id *)(v2 + 24), "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)((char *)v31 + v1);
      *(_QWORD *)((char *)v31 + v1) = v3;

    }
    v1 += 8;
  }
  while (v1 != 64);
  v30[0] = &v33;
  v30[1] = v31;
  v36 = 0;
  v5 = operator new(0x28uLL);
  *v5 = &off_251440AD8;
  v5[1] = &v33;
  v6 = v5 + 1;
  v5[2] = &v32;
  v5[3] = v30;
  v5[4] = v31;
  v36 = v5;
  v37[0] = (_QWORD *)MEMORY[0x24BDAC760];
  v37[1] = (_QWORD *)3321888768;
  v37[2] = ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke;
  v37[3] = &__block_descriptor_64_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE_e25_i16__0____CFDictionary__8l;
  v7 = (char *)operator new(0x28uLL);
  v8 = v38;
  *(_QWORD *)v7 = &off_251440AD8;
  v9 = v6[1];
  *(_OWORD *)(v7 + 8) = *v6;
  *(_OWORD *)(v7 + 24) = v9;
  v39 = v7;
  IOReportIterate();
  if (v39 == v38)
  {
    v10 = 4;
  }
  else
  {
    if (!v39)
      goto LABEL_12;
    v10 = 5;
    v8 = v39;
  }
  (*(void (**)(_QWORD *))(*v8 + 8 * v10))(v8);
LABEL_12:
  v11 = v36;
  if (v36 == v35)
  {
    v12 = 4;
    v11 = v35;
  }
  else
  {
    if (!v36)
      goto LABEL_17;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_17:
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 8; ++i)
  {
    v16 = *(_QWORD *)(v33 + 200 + 8 * i);
    if (v16 && objc_msgSend(*(id *)(v16 + 24), "count"))
    {
      v29 = 1;
      v37[0] = &v29;
      v17 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(v33 + 272 + 40 * i, &v29, (uint64_t)&std::piecewise_construct, v37)[3];
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v18 = *((id *)v31 + i);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v26 != v20)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "setObject:atIndexedSubscript:", v14, v17);
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        }
        while (v19);
      }

      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setSchema:", *(_QWORD *)(v33 + 200 + 8 * i));
      objc_msgSend(v22, "setRows:", *((_QWORD *)v31 + i));
      -[CLPCReportingReadResult setStatRows:forIndex:]((uint64_t)v13, v22, i);

    }
  }

  for (k = 56; k != -8; k -= 8)
  return v13;
}

- (void)convertSampleList:error:
{
}

- (__n128)convertSampleList:error:
{
  __n128 result;

  *(_QWORD *)a2 = &off_251440AD8;
  result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (id)readDeltaStats:(id *)a3
{
  void *Samples;
  id v6;
  char v7;
  SampleList *p_prev_sample_list;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *SamplesDelta;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  id v17;
  id v18;

  if (!-[CLPCReportingClient ensureStatsEnabled:]((uint64_t)self, a3))
    return 0;
  v18 = 0;
  Samples = (void *)IOReportCreateSamples();
  if (!Samples)
    return 0;
  v6 = Samples;
  v17 = v6;
  v7 = -[CLPCReportingClient buildSchemas:error:]((uint64_t)self, (uint64_t)&v17, a3);

  if ((v7 & 1) != 0)
  {
    p_prev_sample_list = &self->prev_sample_list;
    v9 = self->prev_sample_list.samples;
    if (v9)
    {
      v10 = v9;
      v18 = 0;
      SamplesDelta = (void *)IOReportCreateSamplesDelta();
      if (v18)
        *a3 = v18;

      if (SamplesDelta)
      {
        objc_storeStrong((id *)&self->prev_sample_list.samples, Samples);
        v12 = SamplesDelta;
        -[CLPCReportingClient convertSampleList:error:]((uint64_t)self);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = (NSMutableDictionary *)v6;
        v13 = 0;
        v12 = p_prev_sample_list->samples;
        p_prev_sample_list->samples = v15;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->prev_sample_list.samples, Samples);
      v16 = (NSMutableDictionary *)v6;
      -[CLPCReportingClient convertSampleList:error:]((uint64_t)self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v16;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (uint64_t)ensureStatsEnabled:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    if (*(_QWORD *)(result + 184) == *(_QWORD *)(result + 176))
    {
      if (a2)
      {
        v4 = *MEMORY[0x24BDD0BA0];
        v5[0] = CFSTR("No stats enabled.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), -536870206, v3);
        *a2 = (id)objc_claimAutoreleasedReturnValue();

      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)buildSchemas:(_QWORD *)a3 error:
{
  _BOOL8 v4;
  unint64_t *i;
  unint64_t *v6;
  unint64_t v7;
  _QWORD *v9;
  _OWORD *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t j;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  uint64_t m;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  char *v28;
  _QWORD *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  uint64_t n;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  char v43;
  char v44;
  uint64_t *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  unint64_t v49;
  _BYTE v50[24];
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE v54[24];
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, CFTypeRef);
  void *v59;
  _BYTE v60[24];
  _BYTE *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v46 = a1;
  if (!a1)
    return 0;
  if (!objc_msgSend(*(id *)(a1 + 264), "count"))
  {
    -[CLPCReportingClient clearSchemas]((_QWORD *)a1);
    v45 = &v46;
    v52 = 0;
    v53 = 0;
    v6 = *(unint64_t **)(a1 + 176);
    for (i = *(unint64_t **)(a1 + 184); v6 != i; ++v6)
    {
      v7 = *v6;
      if (*v6 >> 35)
      {
LABEL_39:
        return 0;
      }
      if (!BYTE4(v7))
        continue;
      *((_BYTE *)&v52 + BYTE4(v7)) = 1;
      if (BYTE4(v7) > 7u || ((1 << SBYTE4(v7)) & 0x8E) == 0)
        continue;
      v48 = 0;
      v49 = v7;
      v47 = 0;
      v55 = 0;
      v9 = operator new(0x28uLL);
      *v9 = &off_251440878;
      v9[1] = &v46;
      v10 = v9 + 1;
      v9[2] = &v49;
      v9[3] = &v48;
      v9[4] = &v47;
      v55 = v9;
      v56 = MEMORY[0x24BDAC760];
      v57 = 3321888768;
      v58 = ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke;
      v59 = &__block_descriptor_64_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE_e25_i16__0____CFDictionary__8l;
      v11 = (char *)operator new(0x28uLL);
      *(_QWORD *)v11 = &off_251440878;
      v12 = v10[1];
      *(_OWORD *)(v11 + 8) = *v10;
      *(_OWORD *)(v11 + 24) = v12;
      v61 = v11;
      IOReportIterate();
      v14 = v61;
      if (v61 == v60)
      {
        v14 = v60;
        v15 = 4;
      }
      else
      {
        if (!v61)
          goto LABEL_16;
        v15 = 5;
      }
      (*(void (**)(_QWORD *, uint64_t))(*v14 + 8 * v15))(v14, v13);
LABEL_16:
      v16 = v55;
      if (v55 == v54)
      {
        v16 = v54;
        v17 = 4;
        goto LABEL_20;
      }
      if (v55)
      {
        v17 = 5;
LABEL_20:
        (*(void (**)(_QWORD *, uint64_t))(*v16 + 8 * v17))(v16, v13);
      }
      v19 = v47;
      v18 = v48;
      if ((-[CLPCReportingClient buildSchemas:error:]::$_7::operator()(&v45, BYTE4(v7), 1, v7, 0, v47, v48) & 1) == 0)
      {

        return 0;
      }

    }
    for (j = 0; j != 4; ++j)
    {
      v21 = qword_243AA5B38[j];
      if (*((_BYTE *)&v52 + v21)
        && (-[CLPCReportingClient buildSchemas:error:]::$_7::operator()(&v45, v21, 1, 1uLL, 0, 0, CFSTR("Time")) & 1) == 0)
      {
        goto LABEL_39;
      }
    }
    for (k = 0; k != 3; ++k)
    {
      v23 = qword_243AA5B20[k];
      if (*((_BYTE *)&v52 + v23)
        && (-[CLPCReportingClient buildSchemas:error:]::$_7::operator()(&v45, v23, 2, 0, 1, 0, CFSTR("ID")) & 1) == 0)
      {
        goto LABEL_39;
      }
    }
    for (m = 0; m != 4; ++m)
    {
      v25 = qword_243AA5B38[m];
      if (*((_BYTE *)&v52 + v25))
        -[CLPCReportingSchema finalizeColumns](*(_QWORD *)(v46 + 200 + 8 * v25));
      v54[v25 - 8] = 1;
    }
    v54[0] = 1;
    v26 = operator new(0x40uLL);
    *v26 = &off_251440A58;
    v26[1] = &v46;
    v27 = v26 + 1;
    v26[2] = v54;
    v26[3] = &v53;
    v26[4] = &v52;
    v26[5] = &v44;
    v26[6] = &v45;
    v26[7] = &v43;
    v51 = v26;
    v56 = MEMORY[0x24BDAC760];
    v57 = 3321888768;
    v58 = ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke;
    v59 = &__block_descriptor_64_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE_e25_i16__0____CFDictionary__8l;
    v28 = (char *)operator new(0x40uLL);
    v29 = v60;
    *(_QWORD *)v28 = &off_251440A58;
    v30 = *((_OWORD *)v27 + 1);
    *(_OWORD *)(v28 + 8) = *(_OWORD *)v27;
    *(_OWORD *)(v28 + 24) = v30;
    *(_OWORD *)(v28 + 40) = *((_OWORD *)v27 + 2);
    *((_QWORD *)v28 + 7) = v27[6];
    v61 = v28;
    IOReportIterate();
    if (v61 == v60)
    {
      v32 = 4;
    }
    else
    {
      if (!v61)
        goto LABEL_45;
      v32 = 5;
      v29 = v61;
    }
    (*(void (**)(_QWORD *))(*v29 + 8 * v32))(v29);
LABEL_45:
    v34 = v51;
    if (v51 == v50)
    {
      v35 = 4;
      v34 = v50;
    }
    else
    {
      if (!v51)
        goto LABEL_50;
      v35 = 5;
    }
    (*(void (**)(_QWORD *, uint64_t))(*v34 + 8 * v35))(v34, v31);
LABEL_50:
    v4 = v54[0] != 0;
    if (v54[0])
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 8, a3, a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      for (n = 0; n != 64; n += 8)
      {
        v38 = *(_QWORD *)(v46 + 200 + n);
        if (v38 && objc_msgSend(*(id *)(v38 + 24), "count"))
          objc_msgSend(v36, "addObject:", *(_QWORD *)(v46 + 200 + n));
      }
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v36);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = *(void **)(v46 + 264);
      *(_QWORD *)(v46 + 264) = v39;

    }
    else
    {
    }
    return v4;
  }
  return 1;
}

- (id)init:(id *)a3
{
  io_registry_entry_t *v4;
  io_registry_entry_t *v5;
  const __CFAllocator *v6;
  void *CFProperty;
  uint64_t i;
  __CFString *v9;
  void *v10;
  BOOL v11;
  char *v12;
  unint64_t v13;
  int v14;
  int v15;
  _DWORD *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  _DWORD *v21;
  unint64_t *v22;
  char *v23;
  unsigned int *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t *v28;
  int v29;
  float *v30;
  int ChannelCount;
  unsigned int v32;
  _QWORD *v33;
  uint64_t v34;
  void *v36;
  id *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int *v44;
  char v45;
  unsigned int v46;
  __int128 v47;
  __int128 v48;
  float v49;
  objc_super v50;
  char *v51;
  _QWORD v52[3];
  _QWORD *v53;
  _DWORD *__dst[44];
  _QWORD v55[4];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v50.receiver = self;
  v50.super_class = (Class)CLPCReportingClient;
  v51 = 0;
  v4 = -[CLPCUserClient init:](&v50, sel_init_);
  v5 = v4;
  v51 = (char *)v4;
  if (v4)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v4[4], CFSTR("CFBundleIdentifierKernel"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (!CFProperty || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 0;
LABEL_61:

      return v12;
    }
    objc_msgSend(CFProperty, "dataUsingEncoding:", 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      v12 = 0;
LABEL_60:

      goto LABEL_61;
    }
    v42 = (void *)IORegistryEntryCreateCFProperty(v5[4], CFSTR("#cpu-num-clusters"), v6, 0);
    if (!v42 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 0;
LABEL_59:

      goto LABEL_60;
    }
    v5[10] = objc_msgSend(v42, "unsignedIntValue");
    v40 = (void *)IORegistryEntryCreateCFProperty(v5[4], CFSTR("#cpu-num-cores"), v6, 0);
    if (!v40 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 0;
LABEL_58:

      goto LABEL_59;
    }
    v5[13] = objc_msgSend(v40, "unsignedIntValue");
    clpc::user::iokit::RegistryEntry::createProperty((clpc::user::iokit::RegistryEntry *)(v5 + 2), CFSTR("#ane-num-clusters"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 0;
LABEL_57:

      goto LABEL_58;
    }
    v5[11] = objc_msgSend(v36, "unsignedIntValue");
    for (i = 1; ; i = v5[12] + 1)
    {
      v5[12] = i;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#pkg-power-zone-target-%u"), i);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)IORegistryEntryCreateCFProperty(v5[4], v9, v6, 0);
      v11 = v10 == 0;

      if (v11)
        break;
    }
    memcpy(__dst, "emit", sizeof(__dst));
    std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_unique<std::pair<unsigned int const,CLPCReportingStatID> const*>((_QWORD *)v5 + 7, (uint64_t)__dst, (uint64_t)v55);
    if (v5[10])
    {
      v13 = 0;
      v37 = a3;
      v38 = CFProperty;
      do
      {
        v14 = 48;
        if (v13 > 9)
          v14 = 87;
        v15 = v14 + v13;
        v16 = (_DWORD *)((v14 + v13) | 0x7F0400004C506300);
        __dst[0] = v16;
        LODWORD(__dst[1]) = 2;
        *(_QWORD *)&v47 = __dst;
        std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)(v5 + 14), (unsigned int *)__dst, (uint64_t)&std::piecewise_construct, (_DWORD **)&v47)[3] = 0x400000001;
        v5 = (io_registry_entry_t *)v51;
        v17 = v51 + 96;
        __dst[0] = v16;
        LODWORD(__dst[1]) = 2;
        *(_QWORD *)&v47 = __dst;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)(v51 + 96), (unsigned int *)__dst, (uint64_t)&std::piecewise_construct, (_DWORD **)&v47)+ 5) = v13;
        LODWORD(__dst[0]) = 1128489776;
        WORD2(__dst[0]) = 0;
        BYTE6(__dst[0]) = 6;
        *(_WORD *)((char *)__dst + 7) = 639;
        v18 = v15 & 0xFFFF9CFF;
        *(_QWORD *)&v47 = v18 | 0x6300 | (unint64_t)__dst[0] & 0xFFFFFFFFFFFF0000;
        DWORD2(v47) = __dst[1];
        __dst[0] = &v47;
        std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)(v5 + 14), (unsigned int *)&v47, (uint64_t)&std::piecewise_construct, __dst)[3] = 0x600000000;
        LODWORD(__dst[0]) = 1128489776;
        WORD2(__dst[0]) = 0;
        BYTE6(__dst[0]) = 6;
        *(_WORD *)((char *)__dst + 7) = 639;
        *(_QWORD *)&v47 = v18 | 0x6300 | (unint64_t)__dst[0] & 0xFFFFFFFFFFFF0000;
        DWORD2(v47) = __dst[1];
        __dst[0] = &v47;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v17, (unsigned int *)&v47, (uint64_t)&std::piecewise_construct, __dst)+ 5) = v13++;
        a3 = v37;
        CFProperty = v38;
      }
      while (v13 < v5[10]);
    }
    if (v5[11])
    {
      v19 = 0;
      do
      {
        if (v19 <= 9)
          v20 = 48;
        else
          v20 = 87;
        v21 = (_DWORD *)((v20 + v19) | 0x7F040000414C6300);
        __dst[0] = v21;
        LODWORD(__dst[1]) = 2;
        *(_QWORD *)&v47 = __dst;
        std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)(v5 + 14), (unsigned int *)__dst, (uint64_t)&std::piecewise_construct, (_DWORD **)&v47)[3] = 0x400000003;
        v5 = (io_registry_entry_t *)v51;
        __dst[0] = v21;
        LODWORD(__dst[1]) = 2;
        *(_QWORD *)&v47 = __dst;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)(v51 + 96), (unsigned int *)__dst, (uint64_t)&std::piecewise_construct, (_DWORD **)&v47)+ 5) = v19++;
      }
      while (v19 < v5[11]);
    }
    v39 = CCDigestCreate();
    -[io_registry_entry_t reportingObfuscationData:](v5, "reportingObfuscationData:", a3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39 || !v41 || (unint64_t)objc_msgSend(v41, "length") <= 0x1F)
    {
      v12 = 0;
LABEL_56:

      goto LABEL_57;
    }
    memset(__dst, 0, 32);
    LODWORD(__dst[4]) = 1065353216;
    v47 = 0u;
    v48 = 0u;
    v49 = 1.0;
    v22 = (unint64_t *)v51;
    v23 = v51 + 56;
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>((uint64_t)__dst, (unint64_t)(float)*((unint64_t *)v51 + 10));
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>((uint64_t)&v47, vcvtps_u32_f32((float)v22[15] / v49));
    v24 = (unsigned int *)*((_QWORD *)v23 + 2);
    if (v24)
    {
      do
      {
        v25 = v24[4];
        v46 = 0;
        v26 = v51;
        v46 = -[CLPCReportingClient obfuscate:context:data:bundle:]((uint64_t)v51, v25, v39, v41, v43);
        v27 = *((_QWORD *)v24 + 3);
        v44 = &v46;
        std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)__dst, &v46, (uint64_t)&std::piecewise_construct, &v44)[3] = v27;
        v28 = std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::find<unsigned int>((_QWORD *)v26 + 12, v24 + 4);
        if (v28)
        {
          v29 = *((_DWORD *)v28 + 5);
          v44 = &v46;
          *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)&v47, &v46, (uint64_t)&std::piecewise_construct, &v44)+ 5) = v29;
        }
        v24 = *(unsigned int **)v24;
      }
      while (v24);
      v22 = (unint64_t *)v51;
    }
    if (v22 + 7 != (unint64_t *)__dst)
    {
      *((_DWORD *)v22 + 22) = __dst[4];
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,CLPCReportingStatID>,void *> *>>(v22 + 7, (uint64_t *)__dst[2], 0);
      v22 = (unint64_t *)v51;
    }
    if (v22 + 12 != (unint64_t *)&v47)
    {
      *((float *)v22 + 32) = v49;
      std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,unsigned int>,void *> *>>(v22 + 12, (uint64_t *)v48, 0);
    }
    CCDigestDestroy();
    v30 = (float *)v51;
    clpc::user::ioreport::ChannelList::fromProvider((uint64_t)&v44);
    if (!v45)
    {
      v12 = 0;
LABEL_55:
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v47);
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)__dst);
      goto LABEL_56;
    }
    ChannelCount = IOReportGetChannelCount();
    v32 = ChannelCount & ~(ChannelCount >> 31);
    if (ChannelCount < 0)
      v32 = 2;
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>((uint64_t)(v30 + 34), vcvtps_u32_f32((float)v32 / v30[42]));
    v52[0] = &off_251440938;
    v52[1] = &v51;
    v53 = v52;
    clpc::user::ioreport::ChannelList::iterate((uint64_t)&v44, (uint64_t)v52);
    v33 = v53;
    if (v53 == v52)
    {
      v34 = 4;
      v33 = v52;
    }
    else
    {
      if (!v53)
        goto LABEL_53;
      v34 = 5;
    }
    (*(void (**)(void))(*v33 + 8 * v34))();
LABEL_53:
    *((_QWORD *)v51 + 23) = *((_QWORD *)v51 + 22);
    v12 = v51;
    if (v45)

    goto LABEL_55;
  }
  return 0;
}

- (uint64_t)obfuscate:(uint64_t)a3 context:(void *)a4 data:(void *)a5 bundle:
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a4;
  v8 = a5;
  if (a1)
  {
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    CCDigestUpdate();
    v10 = objc_retainAutorelease(v8);
    objc_msgSend(v10, "bytes");
    objc_msgSend(v10, "length");
    CCDigestUpdate();
    CCDigestUpdate();
    objc_msgSend(objc_retainAutorelease(v9), "bytes");
    CCDigestUpdate();
    CCDigestFinal();
    CCDigestReset();
  }

  return 0;
}

- (unint64_t)schemaIDForStatID:(unint64_t)a3 error:(id *)a4
{
  if (!(a3 >> 35))
    return BYTE4(a3);
  return 0;
}

- (id)supportedStats
{
  _BYTE *v3;
  _QWORD *i;
  uint64_t v5;

  v3 = (_BYTE *)objc_opt_new();
  for (i = self->available_stat_ids.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    if (v3)
    {
      v5 = 0;
      {
        if (++v5 == 25)
          goto LABEL_8;
      }
      v3[v5 + 8] = 1;
    }
LABEL_8:
    ;
  }
  return v3;
}

- (id)enabledStats
{
  _BYTE *v3;
  unint64_t *begin;
  unint64_t *i;
  uint64_t v6;

  v3 = (_BYTE *)objc_opt_new();
  begin = self->configured_stat_ids.__begin_;
  for (i = self->configured_stat_ids.__end_; begin != i; ++begin)
  {
    if (v3)
    {
      v6 = 0;
      {
        if (++v6 == 25)
          goto LABEL_8;
      }
      v3[v6 + 8] = 1;
    }
LABEL_8:
    ;
  }
  return v3;
}

- (BOOL)enableStats:(id)a3 error:(id *)a4
{
  _BYTE *v6;
  vector<CLPCReportingStatID, std::allocator<CLPCReportingStatID>> *p_configured_stat_ids;
  NSMutableDictionary *channels;
  NSMutableDictionary *subscribed_channels;
  uint64_t (*i)(uint64_t, CFTypeRef);
  _QWORD *v11;
  unsigned int *next;
  int v13;
  uint64_t v14;
  id *v15;
  void *v16;
  uint64_t (***v17)();
  uint64_t v18;
  BOOL v19;
  uint64_t (***v20)();
  uint64_t v21;
  uint64_t Subscription;
  char v23;
  char *v24;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v27;
  unint64_t *begin;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, CFTypeRef);
  void *v38;
  ChannelList *location;
  NSMutableDictionary **p_subscribed_channels;
  Subscription *p_reporting_subscription;
  _BYTE *v43;
  int v44;
  void *v45;
  char v46;
  __int128 v47;
  __int128 v48;
  int v49;
  __int128 v50;
  __int128 v51;
  int v52;
  void (**v53)(clpc::user::ioreport::Subscription *__hidden);
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t (**v60)();
  __int128 v61;
  uint64_t (***v62)();
  uint64_t v63;
  const __CFString *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, CFTypeRef);
  void *v68;
  uint64_t (**v69)();
  __int128 v70;
  uint64_t (***v71)();
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  p_configured_stat_ids = &self->configured_stat_ids;
  self->configured_stat_ids.__end_ = self->configured_stat_ids.__begin_;
  channels = self->reporting_channels.channels;
  self->reporting_channels.channels = 0;

  v65 = (unint64_t)&off_2514406A0;
  v67 = 0;
  subscribed_channels = self->reporting_subscription.subscribed_channels;
  p_subscribed_channels = &self->reporting_subscription.subscribed_channels;
  p_reporting_subscription = &self->reporting_subscription;
  self->reporting_subscription.subscription = 0;
  self->reporting_subscription.subscribed_channels = 0;

  v66 = 0;
  clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&v65);
  v50 = 0u;
  v51 = 0u;
  v52 = 1065353216;
  v43 = v6;
  -[CLPCReportingStatSelection selectedStats]((uint64_t)v6, (uint64_t)&v65);
  for (i = v67; i; i = *(uint64_t (**)(uint64_t, CFTypeRef))i)
  {
    *(_QWORD *)&v47 = *((_QWORD *)i + 2);
    if (std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>(&self->available_stat_ids.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v47))
    {
      std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__emplace_unique_key_args<CLPCReportingStatID,CLPCReportingStatID const&>((uint64_t)&v50, (unint64_t *)&v47, &v47);
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v65);
  v65 = 1;
  if (std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>(&self->available_stat_ids.__table_.__bucket_list_.__ptr_.__value_, &v65))
  {
    v65 = 1;
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__emplace_unique_key_args<CLPCReportingStatID,CLPCReportingStatID const&>((uint64_t)&v50, &v65, &v65);
  }
  objc_msgSend(v6, "deselectAll");
  location = &self->reporting_channels;
  v47 = 0u;
  v48 = 0u;
  v49 = 1065353216;
  std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>((uint64_t)&v47, (unint64_t)(float)(*((_QWORD *)&v51 + 1) + (unint64_t)(4 * self->num_cpu_clusters)));
  v11 = (_QWORD *)v51;
  if ((_QWORD)v51)
  {
    while (1)
    {
      next = (unsigned int *)self->channel_to_stat_map.__table_.__p1_.__value_.__next_;
      if (!next)
        break;
      v13 = 0;
      v14 = v11[2];
      do
      {
        if (*((_QWORD *)next + 3) == v14)
        {
          std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)&v47, next + 4, next + 4);
          ++v13;
        }
        next = *(unsigned int **)next;
      }
      while (next);
      if (!v13)
        break;
      v11 = (_QWORD *)*v11;
      if (!v11)
        goto LABEL_15;
    }
    goto LABEL_20;
  }
LABEL_15:
  clpc::user::ioreport::ChannelList::fromProvider((uint64_t)&v45);
  v15 = a4;
  if (v46)
  {
    v44 = 0;
    v60 = &off_2514409C8;
    *(_QWORD *)&v61 = &v47;
    *((_QWORD *)&v61 + 1) = &v44;
    v62 = &v60;
    v16 = v45;
    v65 = MEMORY[0x24BDAC760];
    v66 = 3321888768;
    v67 = ___ZN4clpc4user8ioreport11ChannelList6filterENSt3__18functionIFbNS1_7ChannelEEEE_block_invoke;
    v68 = &__block_descriptor_64_ea8_32c55_ZTSNSt3__18functionIFbN4clpc4user8ioreport7ChannelEEEE_e25_i16__0____CFDictionary__8l;
    v17 = &v69;
    v71 = &v69;
    v69 = &off_2514409C8;
    v70 = v61;
    IOReportPrune();
    if (v71 == &v69)
    {
      v18 = 4;
    }
    else
    {
      if (!v71)
        goto LABEL_25;
      v18 = 5;
      v17 = v71;
    }
    ((void (*)(uint64_t (***)()))(*v17)[v18])(v17);
LABEL_25:
    v20 = v62;
    if (v62 == &v60)
    {
      v21 = 4;
      v20 = &v60;
    }
    else
    {
      if (!v62)
      {
LABEL_30:
        if (*((_QWORD *)&v48 + 1) == v44)
        {
          v56 = 0;
          v57 = 0;
          CFAllocatorGetDefault();
          Subscription = IOReportCreateSubscription();
          if (v56)
            *v15 = v56;
          v53 = &off_2514406A0;
          v54 = Subscription;
          v55 = v57;
          if (Subscription && v57)
          {
            v65 = (unint64_t)&off_2514406A0;
            v66 = Subscription;
            v67 = (uint64_t (*)(uint64_t, CFTypeRef))v57;
            v54 = 0;
            v23 = 1;
          }
          else
          {
            v23 = 0;
            LOBYTE(v65) = 0;
          }
          LOBYTE(v68) = v23;
          clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&v53);
          v19 = (_BYTE)v68 != 0;
          if ((_BYTE)v68)
          {
            std::vector<CLPCReportingStatID>::reserve((void **)&self->configured_stat_ids.__begin_, *((unint64_t *)&v51 + 1));
            do
            {
              v53 = *(void (***)(clpc::user::ioreport::Subscription *__hidden))v24;
              if (std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>(&v50, (unint64_t *)&v53))
              {
                end = p_configured_stat_ids->__end_;
                value = p_configured_stat_ids->__end_cap_.__value_;
                if (end >= value)
                {
                  begin = p_configured_stat_ids->__begin_;
                  v29 = end - p_configured_stat_ids->__begin_;
                  v30 = v29 + 1;
                  if ((unint64_t)(v29 + 1) >> 61)
                    std::vector<CLPCReportingStatID>::__throw_length_error[abi:ne180100]();
                  v31 = (char *)value - (char *)begin;
                  if (v31 >> 2 > v30)
                    v30 = v31 >> 2;
                  if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8)
                    v32 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v32 = v30;
                  if (v32)
                  {
                    v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLPCReportingStatID>>((uint64_t)&p_configured_stat_ids->__end_cap_, v32);
                    begin = p_configured_stat_ids->__begin_;
                    end = p_configured_stat_ids->__end_;
                  }
                  else
                  {
                    v33 = 0;
                  }
                  v34 = (unint64_t *)&v33[8 * v29];
                  *v34 = (unint64_t)v53;
                  v27 = v34 + 1;
                  while (end != begin)
                  {
                    v35 = *--end;
                    *--v34 = v35;
                  }
                  p_configured_stat_ids->__begin_ = v34;
                  p_configured_stat_ids->__end_ = v27;
                  p_configured_stat_ids->__end_cap_.__value_ = (unint64_t *)&v33[8 * v32];
                  if (begin)
                    operator delete(begin);
                }
                else
                {
                  *end = (unint64_t)v53;
                  v27 = end + 1;
                }
                p_configured_stat_ids->__end_ = v27;
                if (v43)
                {
                  v36 = 0;
                  {
                    if (++v36 == 25)
                      goto LABEL_64;
                  }
                  v43[v36 + 8] = 1;
                }
              }
LABEL_64:
              v24 += 8;
            }
            while (v24 != "emit");
            objc_storeStrong((id *)&location->channels, v16);
            v37 = v67;
            p_reporting_subscription->subscription = (__IOReportSubscriptionCF *)v66;
            objc_storeStrong((id *)p_subscribed_channels, v37);
            v66 = 0;
            goto LABEL_68;
          }
          if (v15)
          {
            v58 = *MEMORY[0x24BDD0BA0];
            v59 = CFSTR("Failed to subscribe to AppleCLPC IOReporting channels.");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), -536870212, v38);
            *v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_68:
            if ((_BYTE)v68)
              clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&v65);
            v16 = v45;
            goto LABEL_71;
          }
        }
        else
        {
        }
        v19 = 0;
LABEL_71:

        goto LABEL_72;
      }
      v21 = 5;
    }
    (*v20)[v21]();
    goto LABEL_30;
  }
  if (a4)
  {
    v63 = *MEMORY[0x24BDD0BA0];
    v64 = CFSTR("Failed to list AppleCLPC IOReporting channels.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), -536870212, v16);
    v19 = 0;
    *v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_71;
  }
LABEL_20:
  v19 = 0;
LABEL_72:
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v47);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v50);

  return v19;
}

- (_QWORD)clearSchemas
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;

  if (result)
  {
    v1 = result;
    v6 = 0;
    std::array<CLPCReportingRows * {__strong},8ul>::fill[abi:ne180100]((uint64_t)(result + 25), &v6);

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v1[33];
    v1[33] = v2;

    v4 = 0;
    v5 = v1 + 34;
    do
    {
      result = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::clear(&v5[v4]);
      v4 += 5;
    }
    while (v4 != 40);
  }
  return result;
}

- (uint64_t)buildSchemas:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (id)readStats:(id *)a3
{
  void *Samples;
  id v6;
  char v7;
  void *v8;
  id v10;
  _QWORD v11[2];

  if (!-[CLPCReportingClient ensureStatsEnabled:]((uint64_t)self, a3))
    return 0;
  v11[1] = 0;
  Samples = (void *)IOReportCreateSamples();
  if (!Samples)
    return 0;
  v6 = Samples;
  v11[0] = v6;
  v7 = -[CLPCReportingClient buildSchemas:error:]((uint64_t)self, (uint64_t)v11, a3);

  if ((v7 & 1) != 0)
  {
    v10 = v6;
    -[CLPCReportingClient convertSampleList:error:]((uint64_t)self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  unint64_t *begin;

  clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&self->reporting_subscription);
  for (i = 280; i != -40; i -= 40)
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->schema_column_maps + i);
  objc_storeStrong((id *)&self->compactedSchemas, 0);
  for (j = 7; j != -1; --j)

  begin = self->configured_stat_ids.__begin_;
  if (begin)
  {
    self->configured_stat_ids.__end_ = begin;
    operator delete(begin);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->available_stat_ids);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->channel_to_cluster_map);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->channel_to_stat_map);
}

- (id).cxx_construct
{
  uint64_t v2;
  char *v3;

  v2 = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 22) = 0;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  do
  {
    v3 = (char *)self + v2 + 272;
    *(_OWORD *)v3 = 0uLL;
    *((_OWORD *)v3 + 1) = 0uLL;
    *((_DWORD *)v3 + 8) = 1065353216;
    v2 += 40;
  }
  while (v2 != 320);
  *((_QWORD *)self + 74) = 0;
  *((_QWORD *)self + 75) = &off_2514406A0;
  *((_QWORD *)self + 76) = 0;
  *((_QWORD *)self + 77) = 0;
  *((_QWORD *)self + 78) = 0;
  return self;
}

- (void)buildSchemas:error:
{
}

- (__n128)buildSchemas:error:
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_QWORD *)a2 = &off_251440A58;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  v4 = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(a2 + 56) = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (void)init:
{
}

- (_QWORD)init:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_251440938;
  result[1] = v3;
  return result;
}

- (uint64_t)init:
{
    return a1 + 8;
  else
    return 0;
}

- (void)enableStats:error:
{
}

- (__n128)enableStats:error:
{
  __n128 result;

  *(_QWORD *)a2 = &off_2514409C8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (BOOL)enableStats:error:
{
  void *v3;
  uint64_t *v4;
  _BOOL8 v5;
  id v7[2];
  unsigned int ChannelID;

  v3 = *(void **)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v7[0] = &unk_251440738;
  v7[1] = v3;
  ChannelID = IOReportChannelGetChannelID();
  v4 = std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::find<unsigned int>(*(_QWORD **)(a1 + 8), &ChannelID);
  if (v4)
    ++**(_DWORD **)(a1 + 16);
  v5 = v4 != 0;
  clpc::user::ioreport::Channel::~Channel(v7);
  return v5;
}

- (uint64_t)enableStats:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (uint64_t)convertSampleList:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end
