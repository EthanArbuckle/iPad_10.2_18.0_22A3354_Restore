@implementation TTSNeuralStyle

- (TTSNeuralStyle)initWithName:()basic_string<char vector:()std:(std::allocator<char>> *)var0 :char_traits<char>
{
  uint64_t v3;
  uint64_t v4;
  TTSNeuralStyle *v6;
  NSArray *v7;
  double v8;
  _DWORD *v9;
  _DWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *key;
  void *v15;
  uint64_t v16;
  NSString *name;
  NSArray *styleVector;
  TTSNeuralStyle *v19;
  objc_super v21;

  v4 = v3;
  v21.receiver = self;
  v21.super_class = (Class)TTSNeuralStyle;
  v6 = -[TTSNeuralStyle init](&v21, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = *(_DWORD **)v4;
    v10 = *(_DWORD **)(v4 + 8);
    if (*(_DWORD **)v4 != v10)
    {
      do
      {
        LODWORD(v8) = *v9;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v7, "addObject:", v11);

        ++v9;
      }
      while (v9 != v10);
    }
    if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", var0, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    key = v6->_key;
    v6->_key = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", v6->_key, 0, CFSTR("SiriStyles"));
    v16 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v16;

    if (!v6->_name)
    {

      v19 = 0;
      goto LABEL_10;
    }
    styleVector = v6->_styleVector;
    v6->_styleVector = v7;

  }
  v19 = v6;
LABEL_10:

  return v19;
}

- (vector<float,)getStyleVector
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  int v9;
  float *var0;
  float *var1;
  float *v12;
  float *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  float *v19;
  int v20;
  vector<float, std::allocator<float>> *result;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[TTSNeuralStyle styleVector](self, "styleVector", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "floatValue");
        v9 = v8;
        var1 = retstr->var1;
        var0 = retstr->var2.var0;
        if (var1 >= var0)
        {
          v13 = retstr->var0;
          v14 = var1 - retstr->var0;
          v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v16 = (char *)var0 - (char *)v13;
          if (v16 >> 1 > v15)
            v15 = v16 >> 1;
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
            v17 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v17 = v15;
          if (v17)
          {
            v18 = (char *)std::allocator<float>::allocate_at_least[abi:ne180100]((uint64_t)&retstr->var2, v17);
            v13 = retstr->var0;
            var1 = retstr->var1;
          }
          else
          {
            v18 = 0;
          }
          v19 = (float *)&v18[4 * v14];
          *(_DWORD *)v19 = v9;
          v12 = v19 + 1;
          while (var1 != v13)
          {
            v20 = *((_DWORD *)var1-- - 1);
            *((_DWORD *)v19-- - 1) = v20;
          }
          retstr->var0 = v19;
          retstr->var1 = v12;
          retstr->var2.var0 = (float *)&v18[4 * v17];
          if (v13)
            operator delete(v13);
        }
        else
        {
          *(_DWORD *)var1 = v8;
          v12 = var1 + 1;
        }
        retstr->var1 = v12;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSArray)styleVector
{
  return self->_styleVector;
}

- (void)setStyleVector:(id)a3
{
  objc_storeStrong((id *)&self->_styleVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleVector, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
