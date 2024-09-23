@implementation REExportedArrayValue

- (REExportedArrayValue)initWithArray:(id)a3
{
  id v5;
  REExportedArrayValue *v6;
  REExportedArrayValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REExportedArrayValue;
  v6 = -[REExportedArrayValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_array, a3);

  return v7;
}

- (id)arrayValue
{
  return self->_array;
}

- (unint64_t)type
{
  return 0;
}

- (unint64_t)propertyCount
{
  return -[NSArray count](self->_array, "count");
}

- (void)enumerateValuesUsingBlock:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_array;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (id)exportedValueForKey:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;
  unint64_t v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (objc_msgSend(v5, "scanInteger:", &v11) && (v6 = v11, v6 < -[NSArray count](self->_array, "count")))
  {
    -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)REExportedArrayValue;
    -[REExportedValue exportedValueForKey:](&v10, sel_exportedValueForKey_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
