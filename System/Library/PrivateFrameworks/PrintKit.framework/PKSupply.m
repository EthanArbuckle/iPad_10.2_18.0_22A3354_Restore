@implementation PKSupply

+ (BOOL)isValidColorString:(const char *)a3
{
  const char *v3;
  size_t v4;
  BOOL result;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = strlen(a3);
  result = 0;
  if (v4 >= 7 && !(v4 % 7))
  {
    do
    {
      result = _is_valid_color(v3);
      if (!result)
        break;
      v3 += 7;
      v4 -= 7;
    }
    while (v4 >= 7);
  }
  return result;
}

- (PKSupply)initWithName:(const char *)a3 markerType:(const char *)a4 colors:(const char *)a5 level:(int)a6 lowLevel:(int)a7 highLevel:(int)a8
{
  PKSupply *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSString *markerType;
  void *v17;
  size_t v18;
  unint64_t i;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  uint64_t v27;
  NSArray *colors;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  const char **v33;
  int v35;
  char *__s1;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PKSupply;
  v12 = -[PKSupply init](&v39, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
    v13 = objc_claimAutoreleasedReturnValue();
    name = v12->_name;
    v12->_name = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a4);
    v15 = objc_claimAutoreleasedReturnValue();
    markerType = v12->_markerType;
    v12->_markerType = (NSString *)v15;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = a8;
    __s1 = (char *)a4;
    v18 = strlen(a5);
    if (v18 >= 7)
    {
      for (i = v18; i > 6; i -= 7)
      {
        if (_is_valid_color(a5))
        {
          v20 = __maskrune(a5[1], 0xFuLL);
          v21 = __maskrune(a5[2], 0xFuLL);
          v22 = __maskrune(a5[3], 0xFuLL);
          v23 = __maskrune(a5[4], 0xFuLL);
          v24 = __maskrune(a5[5], 0xFuLL);
          v25 = __maskrune(a5[6], 0xFuLL);
          v26 = (void *)objc_msgSend(objc_alloc((Class)getUIColorClass()), "initWithRed:green:blue:alpha:", (double)(v21 | (16 * v20)) / 255.0, (double)(v23 | (16 * v22)) / 255.0, (double)(v25 | (16 * v24)) / 255.0, 1.0);
          objc_msgSend(v17, "addObject:", v26);

        }
        a5 += 7;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v17);
    v27 = objc_claimAutoreleasedReturnValue();

    colors = v12->_colors;
    v12->_colors = (NSArray *)v27;

    v29 = a7;
    if (a7 == -1)
      v29 = 0;
    v12->_level = a6;
    v12->_lowLevel = v29;
    if (v35 == -1)
      v30 = 100;
    else
      v30 = v35;
    v12->_highLevel = v30;
    if (v29 && v30 == 100)
    {
      v31 = 3;
    }
    else if (v29 || v30 == 100)
    {
      v32 = 0;
      v33 = (const char **)&qword_24E6CE5F8;
      while (strcmp(__s1, *(v33 - 1)) && (((0x380404317uLL >> v32) & 1) != 0 || strcmp(__s1, *v33)))
      {
        ++v32;
        v33 += 3;
        if (v32 == 36)
          goto LABEL_25;
      }
      if (v32 < 0x24)
        goto LABEL_26;
LABEL_25:
      LODWORD(v32) = 1;
LABEL_26:
      v31 = *((_QWORD *)&_supply_type_for_type(char const*)::markers + 3 * v32);
    }
    else
    {
      v31 = 4;
    }
    v12->_supplyType = v31;
  }
  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[10];

  v20[9] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PKSupply <%p> {"), self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v19;
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PKSupply name](self, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\tname: %@"), v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v4;
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[PKSupply markerType](self, "markerType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("\tmarkerType: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v7;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\tsupplyType: %lu"), -[PKSupply supplyType](self, "supplyType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\tlevel: %d"), -[PKSupply level](self, "level"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v9;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\tlowLevel: %d"), -[PKSupply lowLevel](self, "lowLevel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\thighLevel: %d"), -[PKSupply highLevel](self, "highLevel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v11;
  v12 = (void *)MEMORY[0x24BDD17C8];
  -[PKSupply colors](self, "colors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("\tcolors: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v14;
  v20[8] = CFSTR("}");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (id)userCodableDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v3 = (void *)objc_opt_new();
  -[PKSupply name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKSupply name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("name"));

  }
  -[PKSupply markerType](self, "markerType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PKSupply markerType](self, "markerType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("markerType"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PKSupply lowLevel](self, "lowLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("lowLevel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PKSupply highLevel](self, "highLevel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("highLevel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PKSupply supplyType](self, "supplyType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("supplyType"));

  -[PKSupply colors](self, "colors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PKSupply colors](self, "colors");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = ___ZL21makeUserCodableColorsP7NSArray_block_invoke;
    v17[3] = &unk_24E6CE950;
    v14 = v13;
    v18 = v14;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("colors"));
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PKSupply level](self, "level"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("level"));

  return v3;
}

- (NSArray)colors
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (int)level
{
  return self->_level;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)markerType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int)lowLevel
{
  return self->_lowLevel;
}

- (int)highLevel
{
  return self->_highLevel;
}

- (int64_t)supplyType
{
  return self->_supplyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
