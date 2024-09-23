@implementation TTKSimpleKeyboardPlane

- (TTKSimpleKeyboardPlane)initWithTIKeyboardLayout:(id)a3
{
  id v4;
  TTKSimpleKeyboardPlane *v5;
  TTKSimpleKeyboardPlane *v6;
  NSArray **p_keys;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *name;
  TTKSimpleKeyboardPlane *v16;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__675;
  v24 = __Block_byref_object_dispose__676;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __51__TTKSimpleKeyboardPlane_initWithTIKeyboardLayout___block_invoke;
  v19[3] = &unk_24FD485A8;
  v19[4] = &v20;
  objc_msgSend(v4, "enumerateKeysUsingBlock:", v19);
  v18.receiver = self;
  v18.super_class = (Class)TTKSimpleKeyboardPlane;
  v5 = -[TTKSimpleKeyboardPlane init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    p_keys = &v5->_keys;
    objc_storeStrong((id *)&v5->_keys, (id)v21[5]);
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[TTKSimpleKeyboardPlane keyboardOrientation](v6, "keyboardOrientation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)objc_opt_class(), "keyplaneWidthForKeys:", *p_keys);
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)objc_opt_class(), "keyplaneHeightForKeys:", *p_keys);
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%@_%@"), v9, v11, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v14;

  }
  v16 = v6;
  _Block_object_dispose(&v20, 8);

  return v16;
}

- (TTKSimpleKeyboardPlane)initWithName:(id)a3 keys:(id)a4
{
  id v7;
  id v8;
  TTKSimpleKeyboardPlane *v9;
  TTKSimpleKeyboardPlane *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTKSimpleKeyboardPlane;
  v9 = -[TTKSimpleKeyboardPlane init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_keys, a4);
  }

  return v10;
}

- (TTKSimpleKeyboardPlane)initWithJsonDictionary:(id)a3
{
  id v4;
  TTKSimpleKeyboardPlane *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TTKSimpleKey *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TTKSimpleKeyboardPlane;
  v5 = -[TTKSimpleKeyboardPlane init](&v20, sel_init);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v7 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v7;

    objc_msgSend(v4, "objectForKey:", CFSTR("keys"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = -[TTKSimpleKey initWithJsonDictionary:]([TTKSimpleKey alloc], "initWithJsonDictionary:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
          objc_msgSend(v6, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v11);
    }
    objc_storeStrong((id *)&v5->_keys, v6);

  }
  return v5;
}

- (id)toJsonDictionary
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_keys;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "toJsonDictionary", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("keys"));
  return v3;
}

- (float)keyboardWidth
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  float result;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)objc_opt_class();
  -[TTKSimpleKeyboardPlane keys](self, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyplaneWidthForKeys:", v4);
  v6 = v5;

  if (v6 > 317.0 && v6 < 323.0)
    return 320.0;
  v8 = 1;
  while (v8 != 12)
  {
    v9 = v8;
    result = flt_22FAC87A0[v8++];
    if ((float)(result + -3.0) < v6 && v6 < (float)(result + 3.0))
    {
      if ((unint64_t)(v9 - 1) < 0xB)
        return result;
      return roundf(v6);
    }
  }
  return roundf(v6);
}

- (id)keyboardOrientation
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  uint64_t v11;
  id result;
  float v13;
  float v14;
  float v15;
  float v17;

  v3 = (void *)objc_opt_class();
  -[TTKSimpleKeyboardPlane keys](self, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyplaneWidthForKeys:", v4);
  v6 = v5;

  v7 = (void *)objc_opt_class();
  -[TTKSimpleKeyboardPlane keys](self, "keys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyplaneHeightForKeys:", v8);
  v10 = v9;

  v11 = 0;
  result = CFSTR("Portrait");
  while (1)
  {
    v13 = flt_22FAC87D0[v11];
    v14 = v13 + -2.0;
    v15 = v13 + 2.0;
    if (v14 < v6 && v6 < v15)
      break;
    if (++v11 == 7)
      return result;
  }
  if (v11 != 4)
    return CFSTR("Landscape");
  v17 = v6 / v10;
  if (v10 <= 0.0)
    v17 = 2.923;
  if (v17 > 3.0)
    return CFSTR("Portrait");
  else
    return CFSTR("Landscape");
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __51__TTKSimpleKeyboardPlane_initWithTIKeyboardLayout___block_invoke(uint64_t a1, uint64_t a2, __int16 a3, double a4, double a5, double a6, double a7)
{
  TTKSimpleKey *v13;
  id v14;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v13 = -[TTKSimpleKey initWithString:frame:keyCode:]([TTKSimpleKey alloc], "initWithString:frame:keyCode:", v14, a3, a4, a5, a6, a7);
    if (v13)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v13);

  }
}

+ (float)keyplaneWidthForKeys:(id)a3
{
  id v3;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "frame");
        v27.origin.x = v12;
        v27.origin.y = v13;
        v27.size.width = v14;
        v27.size.height = v15;
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v25 = CGRectUnion(v24, v27);
        x = v25.origin.x;
        y = v25.origin.y;
        width = v25.size.width;
        height = v25.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v16 = CGRectGetWidth(v26);

  return v16;
}

+ (float)keyplaneHeightForKeys:(id)a3
{
  id v3;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "frame");
        v27.origin.x = v12;
        v27.origin.y = v13;
        v27.size.width = v14;
        v27.size.height = v15;
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v25 = CGRectUnion(v24, v27);
        x = v25.origin.x;
        y = v25.origin.y;
        width = v25.size.width;
        height = v25.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v16 = CGRectGetHeight(v26);

  return v16;
}

@end
