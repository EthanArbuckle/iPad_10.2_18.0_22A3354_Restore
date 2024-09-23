@implementation REHTMLContainerElement

- (REHTMLContainerElement)initWithElements:(id)a3
{
  id v4;
  REHTMLContainerElement *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *elements;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)REHTMLContainerElement;
  v5 = -[REHTMLElement init](&v30, sel_init);
  if (v5)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v25 = 0u;
            v13 = v6;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v23;
              do
              {
                v17 = 0;
                do
                {
                  if (*(_QWORD *)v23 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v12, "addObjectsFromArray:", *(_QWORD *)(v18 + 16));
                  else
                    objc_msgSend(v12, "addObject:", v18, (_QWORD)v22);
                  ++v17;
                }
                while (v15 != v17);
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
              }
              while (v15);
            }

            v19 = objc_msgSend(v12, "copy");
            elements = v5->_elements;
            v5->_elements = (NSArray *)v19;

            goto LABEL_22;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        if (v8)
          continue;
        break;
      }
    }

    v11 = objc_msgSend(v6, "copy");
    v12 = v5->_elements;
    v5->_elements = (NSArray *)v11;
LABEL_22:

  }
  return v5;
}

- (id)_encodedData
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_elements;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v9, "encodedData", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithData:encoding:", v11, 4);

        objc_msgSend(v12, "length");
        objc_msgSend(v9, "encodedData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendData:", v13);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  objc_msgSend(v14, "length");
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (id)classes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[NSArray firstObject](self->_elements, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "classes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1A8];
  v5 = v3;

  return v5;
}

- (id)elementBySettingClasses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  REHTMLContainerElement *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSArray count](self->_elements, "count"))
  {
    -[NSArray firstObject](self->_elements, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "elementBySettingClasses:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray subarrayWithRange:](self->_elements, "subarrayWithRange:", 1, -[NSArray count](self->_elements, "count") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (REHTMLContainerElement *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElements:", v9);
  }
  else
  {
    v10 = self;
  }

  return v10;
}

- (id)attributes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[NSArray firstObject](self->_elements, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1B8];
  v5 = v3;

  return v5;
}

- (id)elementBySettingAtttibutes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  REHTMLContainerElement *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSArray count](self->_elements, "count"))
  {
    -[NSArray firstObject](self->_elements, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "elementBySettingAtttibutes:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray subarrayWithRange:](self->_elements, "subarrayWithRange:", 1, -[NSArray count](self->_elements, "count") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (REHTMLContainerElement *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElements:", v9);
  }
  else
  {
    v10 = self;
  }

  return v10;
}

- (id)append:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[NSArray arrayByAddingObject:](self->_elements, "arrayByAddingObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithElements:", v6);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REHTMLContainerElement;
  v4 = -[REHTMLElement copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 2, self->_elements);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
