@implementation UPResultRootNode

- (UPResultRootNode)initWithLabel:(id)a3 intermediateNodes:(id)a4 directLeafNodes:(id)a5
{
  id v9;
  id v10;
  UPResultRootNode *v11;
  UPResultRootNode *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UPResultRootNode;
  v11 = -[UPResultNode initWithLabel:](&v14, sel_initWithLabel_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_intermediateNodes, a4);
    objc_storeStrong((id *)&v12->_directLeafNodes, a5);
  }

  return v12;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[UPResultRootNode directLeafNodes](self, "directLeafNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[UPResultRootNode directLeafNodes](self, "directLeafNodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "initWithArray:copyItems:", v5, 0);

    if (objc_msgSend(v3, "count"))
    {
      v6 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_dictionaryRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v6, v8);

        ++v6;
      }
      while (objc_msgSend(v3, "count") > v6);
    }
  }
  v14[0] = CFSTR("label");
  -[UPResultNode label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = CFSTR("directLeafNodes");
  v15[0] = v10;
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {

    if (v9)
      goto LABEL_11;
LABEL_13:

    goto LABEL_11;
  }
  if (!v9)
    goto LABEL_13;
LABEL_11:

  return v12;
}

- (NSArray)intermediateNodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)directLeafNodes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directLeafNodes, 0);
  objc_storeStrong((id *)&self->_intermediateNodes, 0);
}

@end
