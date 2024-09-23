@implementation REHTMLTagElement

- (REHTMLTagElement)initWithTag:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  REHTMLTagElement *v8;
  uint64_t v9;
  NSString *tag;
  uint64_t v11;
  NSString *content;
  NSArray *classes;
  NSDictionary *attributes;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)REHTMLTagElement;
  v8 = -[REHTMLElement init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    tag = v8->_tag;
    v8->_tag = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    content = v8->_content;
    v8->_content = (NSString *)v11;

    classes = v8->_classes;
    v8->_classes = (NSArray *)MEMORY[0x24BDBD1A8];

    attributes = v8->_attributes;
    v8->_attributes = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v8;
}

- (id)_prefixContentString
{
  void *v2;
  id v3;
  NSString *v4;
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;
  void *v8;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  _QWORD v29[6];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5;
  v43 = __Block_byref_object_dispose__5;
  v44 = 0;
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __40__REHTMLTagElement__prefixContentString__block_invoke;
  v38[3] = &unk_24CF8C1C8;
  v38[4] = self;
  v38[5] = &v39;
  REHTMLElementAccessLock(v38);
  v2 = (void *)v40[5];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v4 = self->_tag;
    v5 = -[NSDictionary count](self->_attributes, "count");
    v6 = 0x24BDD1000;
    if (v5 || (v7 = -[NSArray count](self->_classes, "count"), v6 = 0x24BDD1000uLL, v7))
    {
      objc_msgSend(*(id *)(v6 + 1704), "stringWithString:", self->_tag, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:", CFSTR(" "));
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v9 = self->_attributes;
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v35 != v11)
              objc_enumerationMutation(v9);
            v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "appendString:", v13);
            objc_msgSend(v8, "appendString:", CFSTR("=\"));
            objc_msgSend(v8, "appendString:", v14);
            objc_msgSend(v8, "appendString:", CFSTR("\" "));

          }
          v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        }
        while (v10);
      }

      if (-[NSArray count](self->_classes, "count"))
      {
        objc_msgSend(v8, "appendString:", CFSTR("class=\"));
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v15 = self->_classes;
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v31 != v17)
                objc_enumerationMutation(v15);
              objc_msgSend(v8, "appendString:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
              objc_msgSend(v8, "appendString:", CFSTR(" "));
            }
            v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
          }
          while (v16);
        }

        objc_msgSend(v8, "appendString:", CFSTR("\"));
      }
      v4 = (NSString *)objc_msgSend(v8, "copy");

    }
    v19 = v4;
    v20 = -[NSString length](v19, "length");
    v21 = objc_msgSend(CFSTR("<"), "length");
    v22 = objc_msgSend(CFSTR(">"), "length");
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", v21 + v20 + v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appendString:", CFSTR("<"));
    objc_msgSend(v23, "appendString:", v19);
    objc_msgSend(v23, "appendString:", CFSTR(">"));
    v24 = objc_msgSend(v23, "copy");

    v25 = (void *)v40[5];
    v40[5] = v24;

    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __40__REHTMLTagElement__prefixContentString__block_invoke_2;
    v29[3] = &unk_24CF8C1F0;
    v29[4] = self;
    v29[5] = &v39;
    REHTMLElementAccessLock(v29);
    v3 = (id)v40[5];

  }
  _Block_object_dispose(&v39, 8);

  return v3;
}

void __40__REHTMLTagElement__prefixContentString__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void __40__REHTMLTagElement__prefixContentString__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (id)_contentString
{
  return self->_content;
}

- (id)_suffixContentString
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  v22 = 0;
  v3 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __40__REHTMLTagElement__suffixContentString__block_invoke;
  v16[3] = &unk_24CF8C1C8;
  v16[4] = self;
  v16[5] = &v17;
  REHTMLElementAccessLock(v16);
  v4 = (void *)v18[5];
  if (!v4)
  {
    -[REHTMLTagElement _contentString](self, "_contentString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = self->_tag;
      v7 = -[NSString length](v6, "length");
      v8 = objc_msgSend(CFSTR("</"), "length");
      v9 = objc_msgSend(CFSTR(">"), "length");
      objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", v8 + v7 + v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendString:", CFSTR("</"));
      objc_msgSend(v10, "appendString:", v6);
      objc_msgSend(v10, "appendString:", CFSTR(">"));
      v11 = objc_msgSend(v10, "copy");

      v12 = (void *)v18[5];
      v18[5] = v11;
    }
    else
    {
      v12 = (void *)v18[5];
      v18[5] = (uint64_t)&stru_24CF92178;
    }

    v15[0] = v3;
    v15[1] = 3221225472;
    v15[2] = __40__REHTMLTagElement__suffixContentString__block_invoke_2;
    v15[3] = &unk_24CF8C1F0;
    v15[4] = self;
    v15[5] = &v17;
    REHTMLElementAccessLock(v15);
    v4 = (void *)v18[5];
  }
  v13 = v4;
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __40__REHTMLTagElement__suffixContentString__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __40__REHTMLTagElement__suffixContentString__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (id)classes
{
  return self->_classes;
}

- (id)elementByAddingClass:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[REHTMLTagElement copy](self, "copy");
  -[NSArray arrayByAddingObject:](self->_classes, "arrayByAddingObject:", v4);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (id)elementByAddingClasses:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[REHTMLTagElement copy](self, "copy");
  -[NSArray arrayByAddingObjectsFromArray:](self->_classes, "arrayByAddingObjectsFromArray:", v4);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (id)elementBySettingClasses:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[REHTMLTagElement copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (id)attributes
{
  return self->_attributes;
}

- (id)elementBySettingAtttibutes:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[REHTMLTagElement copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[5];
  v5[5] = v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REHTMLTagElement;
  v4 = -[REHTMLElement copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 2, self->_tag);
  objc_storeStrong(v4 + 3, self->_content);
  objc_storeStrong(v4 + 5, self->_attributes);
  objc_storeStrong(v4 + 4, self->_classes);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_classes, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
