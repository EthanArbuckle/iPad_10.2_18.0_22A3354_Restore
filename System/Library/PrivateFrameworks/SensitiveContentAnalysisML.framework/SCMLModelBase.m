@implementation SCMLModelBase

- (SCMLModelBase)initWithOptions:(id)a3
{
  id v4;
  SCMLModelBase *v5;
  SCMLPerformance *v6;
  SCMLPerformance *perfResults;
  uint64_t v8;
  NSDictionary *options;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCMLModelBase;
  v5 = -[SCMLModelBase init](&v11, sel_init);
  if (v5)
  {
    v6 = -[SCMLPerformance initWithOptions:]([SCMLPerformance alloc], "initWithOptions:", v4);
    perfResults = v5->_perfResults;
    v5->_perfResults = v6;

    v8 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (NSDictionary *)v8;

  }
  return v5;
}

- (unint64_t)_blob_size:(id *)a3
{
  return a3->var2[1] * a3->var2[0] * a3->var2[2] * a3->var2[3];
}

- (void)_copy_data_from_blob:(id *)a3 to:(void *)a4
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[10];
  uint64_t v18;
  _OWORD v19[10];
  uint64_t v20;

  v7 = *(_OWORD *)&a3->var12;
  v19[8] = *(_OWORD *)&a3->var10;
  v19[9] = v7;
  v20 = *(_QWORD *)&a3->var14;
  v8 = *(_OWORD *)&a3->var4;
  v19[4] = *(_OWORD *)&a3->var3[2];
  v19[5] = v8;
  v9 = *(_OWORD *)&a3->var8;
  v19[6] = *(_OWORD *)&a3->var6;
  v19[7] = v9;
  v10 = *(_OWORD *)a3->var2;
  v19[0] = *(_OWORD *)&a3->var0;
  v19[1] = v10;
  v11 = *(_OWORD *)a3->var3;
  v19[2] = *(_OWORD *)&a3->var2[2];
  v19[3] = v11;
  std::vector<float>::resize((uint64_t)a4, -[SCMLModelBase _blob_size:](self, "_blob_size:", v19));
  v12 = *(_OWORD *)&a3->var12;
  v17[8] = *(_OWORD *)&a3->var10;
  v17[9] = v12;
  v18 = *(_QWORD *)&a3->var14;
  v13 = *(_OWORD *)&a3->var4;
  v17[4] = *(_OWORD *)&a3->var3[2];
  v17[5] = v13;
  v14 = *(_OWORD *)&a3->var8;
  v17[6] = *(_OWORD *)&a3->var6;
  v17[7] = v14;
  v15 = *(_OWORD *)a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v15;
  v16 = *(_OWORD *)a3->var3;
  v17[2] = *(_OWORD *)&a3->var2[2];
  v17[3] = v16;
  -[SCMLModelBase _copy_data_from_blob:toPtr:](self, "_copy_data_from_blob:toPtr:", v17, *(_QWORD *)a4);
}

- (void)_copy_data_from_blob:(id *)a3 toPtr:(float *)a4
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[10];
  uint64_t v10;

  v4 = *(_OWORD *)&a3->var12;
  v9[8] = *(_OWORD *)&a3->var10;
  v9[9] = v4;
  v10 = *(_QWORD *)&a3->var14;
  v5 = *(_OWORD *)&a3->var4;
  v9[4] = *(_OWORD *)&a3->var3[2];
  v9[5] = v5;
  v6 = *(_OWORD *)&a3->var8;
  v9[6] = *(_OWORD *)&a3->var6;
  v9[7] = v6;
  v7 = *(_OWORD *)a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v7;
  v8 = *(_OWORD *)a3->var3;
  v9[2] = *(_OWORD *)&a3->var2[2];
  v9[3] = v8;
  memcpy(a4, a3->var0, 4 * -[SCMLModelBase _blob_size:](self, "_blob_size:", v9));
}

- (void)_copy_data_to_blob:(float *)a3 to:(id *)a4
{
  void *var0;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[10];
  uint64_t v11;

  var0 = a4->var0;
  v5 = *(_OWORD *)&a4->var12;
  v10[8] = *(_OWORD *)&a4->var10;
  v10[9] = v5;
  v11 = *(_QWORD *)&a4->var14;
  v6 = *(_OWORD *)&a4->var4;
  v10[4] = *(_OWORD *)&a4->var3[2];
  v10[5] = v6;
  v7 = *(_OWORD *)&a4->var8;
  v10[6] = *(_OWORD *)&a4->var6;
  v10[7] = v7;
  v8 = *(_OWORD *)a4->var2;
  v10[0] = *(_OWORD *)&a4->var0;
  v10[1] = v8;
  v9 = *(_OWORD *)a4->var3;
  v10[2] = *(_OWORD *)&a4->var2[2];
  v10[3] = v9;
  memcpy(var0, a3, 4 * -[SCMLModelBase _blob_size:](self, "_blob_size:", v10));
}

- (void)_copy_data_to_blob:(id)a3 toBuffer:(id *)a4
{
  id v6;
  void *var0;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  unint64_t v13;
  id v14;
  _OWORD v15[10];
  uint64_t v16;

  v6 = a3;
  var0 = a4->var0;
  v8 = *(_OWORD *)&a4->var12;
  v15[8] = *(_OWORD *)&a4->var10;
  v15[9] = v8;
  v16 = *(_QWORD *)&a4->var14;
  v9 = *(_OWORD *)&a4->var4;
  v15[4] = *(_OWORD *)&a4->var3[2];
  v15[5] = v9;
  v10 = *(_OWORD *)&a4->var8;
  v15[6] = *(_OWORD *)&a4->var6;
  v15[7] = v10;
  v11 = *(_OWORD *)a4->var2;
  v15[0] = *(_OWORD *)&a4->var0;
  v15[1] = v11;
  v12 = *(_OWORD *)a4->var3;
  v15[2] = *(_OWORD *)&a4->var2[2];
  v15[3] = v12;
  v13 = -[SCMLModelBase _blob_size:](self, "_blob_size:", v15);
  v14 = objc_retainAutorelease(v6);
  memcpy(var0, (const void *)objc_msgSend(v14, "bytes"), 4 * v13);

}

- (void)_copy_data_to_blob_repeated:(id)a3 to:(id *)a4
{
  id v6;
  char *var0;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  unint64_t v13;
  id v14;
  const void *v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _OWORD v19[10];
  uint64_t v20;

  v6 = a3;
  var0 = (char *)a4->var0;
  v8 = *(_OWORD *)&a4->var12;
  v19[8] = *(_OWORD *)&a4->var10;
  v19[9] = v8;
  v20 = *(_QWORD *)&a4->var14;
  v9 = *(_OWORD *)&a4->var4;
  v19[4] = *(_OWORD *)&a4->var3[2];
  v19[5] = v9;
  v10 = *(_OWORD *)&a4->var8;
  v19[6] = *(_OWORD *)&a4->var6;
  v19[7] = v10;
  v11 = *(_OWORD *)a4->var2;
  v19[0] = *(_OWORD *)&a4->var0;
  v19[1] = v11;
  v12 = *(_OWORD *)a4->var3;
  v19[2] = *(_OWORD *)&a4->var2[2];
  v19[3] = v12;
  v13 = -[SCMLModelBase _blob_size:](self, "_blob_size:", v19);
  v14 = objc_retainAutorelease(v6);
  v15 = (const void *)objc_msgSend(v14, "bytes");
  v16 = objc_msgSend(v14, "length");
  if (v16 >> 2 <= v13)
  {
    v17 = v16 & 0xFFFFFFFFFFFFFFFCLL;
    if (v13 / (v16 >> 2) <= 1)
      v18 = 1;
    else
      v18 = v13 / (v16 >> 2);
    do
    {
      memcpy(var0, v15, v17);
      var0 += v17;
      --v18;
    }
    while (v18);
  }

}

- (id)performanceResults
{
  void *v2;
  void *v3;

  -[SCMLModelBase perfResults](self, "perfResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SCMLPerformance)perfResults
{
  return self->_perfResults;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_perfResults, 0);
}

@end
