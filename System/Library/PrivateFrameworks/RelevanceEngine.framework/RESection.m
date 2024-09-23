@implementation RESection

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RESection)initWithSectionDescriptor:(id)a3 comparator:(id)a4
{
  id v7;
  id v8;
  RESection *v9;
  RESection *v10;
  uint64_t v11;
  REMLElementComparator *comparator;
  uint64_t v13;
  NSMutableDictionary *elements;
  uint64_t v15;
  NSMutableSet *hiddenElements;
  uint64_t v17;
  NSMutableDictionary *subsections;
  uint64_t v19;
  NSMutableArray *batchBlocks;
  void *v21;
  char v22;
  char *v23;
  uint64_t v24;
  void *v25;
  REElementQueue *v26;
  REElementQueue *queue;
  unint64_t v28;
  uint64_t v29;
  _QWORD v31[4];
  id v32[2];
  char v33;
  id location;
  objc_super v35;

  v7 = a3;
  v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)RESection;
  v9 = -[RESection init](&v35, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    v11 = objc_msgSend(v8, "copy");
    comparator = v10->_comparator;
    v10->_comparator = (REMLElementComparator *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    elements = v10->_elements;
    v10->_elements = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    hiddenElements = v10->_hiddenElements;
    v10->_hiddenElements = (NSMutableSet *)v15;

    v10->_allowsSubsections = objc_msgSend(v7, "allowsSubsections");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    subsections = v10->_subsections;
    v10->_subsections = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    batchBlocks = v10->_batchBlocks;
    v10->_batchBlocks = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "comparisonLevels"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v10);
    v22 = objc_msgSend(v7, "invertRanking");
    v23 = 0;
    v24 = MEMORY[0x24BDAC760];
    while ((unint64_t)v23 < objc_msgSend(v8, "comparisonLevels"))
    {
      v31[0] = v24;
      v31[1] = 3221225472;
      v31[2] = __50__RESection_initWithSectionDescriptor_comparator___block_invoke;
      v31[3] = &unk_24CF8C840;
      objc_copyWeak(v32, &location);
      v33 = v22;
      v32[1] = v23;
      v25 = (void *)MEMORY[0x2199B2434](v31);
      objc_msgSend(v21, "addObject:", v25);

      objc_destroyWeak(v32);
      ++v23;
    }
    v26 = -[REElementQueue initWithMaximumRelevantElementsCount:comparators:]([REElementQueue alloc], "initWithMaximumRelevantElementsCount:comparators:", objc_msgSend(v7, "maxElementCount"), v21);
    queue = v10->_queue;
    v10->_queue = v26;

    v28 = -[_RESectionDescriptor maxElementCount](v10->_descriptor, "maxElementCount");
    if (v28 >= 0x7FFFFFFFFFFFFFFFLL)
      v29 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v29 = v28;
    -[RESection setMaximumElements:](v10, "setMaximumElements:", v29);
    objc_destroyWeak(&location);

  }
  return v10;
}

- (void)setMaximumElements:(int64_t)a3
{
  -[REElementQueue setMaximumRelevantElementsCount:](self->_queue, "setMaximumRelevantElementsCount:", a3);
}

uint64_t __50__RESection_initWithSectionDescriptor_comparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;

  v5 = (id *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = WeakRetained;
  if (*(_BYTE *)(a1 + 48))
  {
    v10 = v6;
    v11 = v7;
  }
  else
  {
    v10 = v7;
    v11 = v6;
  }
  v12 = objc_msgSend(WeakRetained, "_compareElement:toElement:level:", v10, v11, *(_QWORD *)(a1 + 40));

  return v12;
}

- (void)setComparator:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  REMLElementComparator *v12;
  REMLElementComparator *comparator;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];

  if (self->_comparator != a3)
  {
    v4 = a3;
    RELogForDomain(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[RESection setComparator:].cold.2((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);

    v12 = (REMLElementComparator *)objc_msgSend(v4, "copy");
    comparator = self->_comparator;
    self->_comparator = v12;

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __27__RESection_setComparator___block_invoke;
    v21[3] = &unk_24CF8AAF0;
    v21[4] = self;
    -[RESection performBatchUpdates:](self, "performBatchUpdates:", v21);
    RELogForDomain(6);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[RESection setComparator:].cold.1((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);

  }
}

void __27__RESection_setComparator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[5];

  v6 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __27__RESection_setComparator___block_invoke_2;
  v10[3] = &unk_24CF8C868;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __27__RESection_setComparator___block_invoke_3;
  v7[3] = &unk_24CF8C890;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v2;
  v9 = v4;
  v5 = v2;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __27__RESection_setComparator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeElementWithId:", a2);
}

void __27__RESection_setComparator___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 40), "addElement:forceHidden:", v6, objc_msgSend(v5, "containsObject:", a2));

}

- (int64_t)_compareElement:(id)a3 toElement:(id)a4 level:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *elements;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_subsections, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_subsections, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!self->_allowsSubsections)
  {
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  if (!v10)
  {
    if (v11)
    {
      if (!objc_msgSend(v11, "visibleCount"))
      {
        v18 = 1;
        goto LABEL_33;
      }
      v19 = 0;
LABEL_19:
      elements = self->_elements;
      objc_msgSend(v12, "elementIdAtIndex:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](elements, "objectForKeyedSubscript:", v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_22;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v13 = objc_msgSend(v10, "visibleCount");
  v14 = v13;
  if (!v12)
  {
    if (!v13)
    {
      v18 = -1;
      goto LABEL_33;
    }
LABEL_18:
    v21 = self->_elements;
    objc_msgSend(v10, "elementIdAtIndex:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_19;
    v20 = 0;
    if (v19)
      goto LABEL_22;
LABEL_10:
    -[NSMutableDictionary objectForKeyedSubscript:](self->_elements, "objectForKeyedSubscript:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
    if (!v20)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_elements, "objectForKeyedSubscript:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25 = -[REMLElementComparator compareElement:toElement:level:](self->_comparator, "compareElement:toElement:level:", v19, v20, a5);
    REStringFromRankingOrder(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    RELogForDomain(6);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v19, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      *(_DWORD *)buf = 138412802;
      v33 = v26;
      v34 = 2112;
      v35 = v31;
      v36 = 2112;
      v37 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v37;
      _os_log_debug_impl(&dword_2132F7000, v27, OS_LOG_TYPE_DEBUG, "Comparator (%@) [%@] to [%@]", buf, 0x20u);

    }
    if (v25 == -1)
      v28 = -1;
    else
      v28 = 0;
    if (v25 == 1)
      v18 = 1;
    else
      v18 = v28;

    goto LABEL_33;
  }
  v15 = objc_msgSend(v12, "visibleCount");
  if (!(v14 | v15))
  {
    objc_msgSend(v10, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "compare:", v17);

    goto LABEL_33;
  }
  if (v14)
    v18 = 1;
  else
    v18 = -1;
  if (v14 && v15)
    goto LABEL_18;
LABEL_33:

  return v18;
}

- (id)_groupForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[RESection delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "section:groupForIdentifier:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_groupIdentifierForElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_allowsSubsections)
  {
    objc_msgSend(a3, "featureMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[REFeature groupFeature](REFeature, "groupFeature");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureValueForFeature:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_subsections, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8
          || (-[RESection _groupForIdentifier:](self, "_groupForIdentifier:", v7),
              v9 = (id)objc_claimAutoreleasedReturnValue(),
              v9,
              v9))
        {
          v9 = v7;
        }
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_createSectionForGroup:(id)a3
{
  RESection *v3;
  id v5;
  RESectionDescriptor *v6;
  void *v7;
  _RESectionDescriptor *v8;
  NSMutableDictionary *subsections;
  void *v10;

  v3 = 0;
  if (a3 && self->_allowsSubsections)
  {
    v5 = a3;
    v6 = objc_alloc_init(RESectionDescriptor);
    -[RESectionDescriptor setMaxElementCount:](v6, "setMaxElementCount:", objc_msgSend(v5, "maxElementCount"));
    objc_msgSend(v5, "groupIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RESectionDescriptor setName:](v6, "setName:", v7);

    v8 = -[_RESectionDescriptor initWithSectionDescriptor:]([_RESectionDescriptor alloc], "initWithSectionDescriptor:", v6);
    v3 = -[RESection initWithSectionDescriptor:comparator:]([RESection alloc], "initWithSectionDescriptor:comparator:", v8, self->_comparator);
    v3->_allowsSubsections = 0;
    -[RESection setDelegate:](v3, "setDelegate:", self);
    subsections = self->_subsections;
    objc_msgSend(v5, "groupIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](subsections, "setObject:forKeyedSubscript:", v3, v10);
  }
  return v3;
}

- (void)_removeSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (self->_allowsSubsections)
  {
    v7 = v4;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_subsections, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "setDelegate:", 0);
      -[NSMutableDictionary removeObjectForKey:](self->_subsections, "removeObjectForKey:", v7);
    }

    v4 = v7;
  }

}

- (NSString)name
{
  return -[_RESectionDescriptor name](self->_descriptor, "name");
}

- (int64_t)count
{
  _BOOL4 allowsSubsections;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  NSMutableDictionary *subsections;
  void *v9;
  void *v10;
  uint64_t v11;

  allowsSubsections = self->_allowsSubsections;
  v4 = -[REElementQueue count](self->_queue, "count");
  v5 = v4;
  if (!allowsSubsections)
    return v4;
  if (!v4)
    return 0;
  v6 = 0;
  v7 = 0;
  do
  {
    subsections = self->_subsections;
    -[REElementQueue elementAtIndex:](self->_queue, "elementAtIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](subsections, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = objc_msgSend(v10, "count");
    else
      v11 = 1;
    v7 += v11;

    ++v6;
  }
  while (v5 != v6);
  return v7;
}

- (int64_t)visibleCount
{
  _BOOL4 allowsSubsections;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  NSMutableDictionary *subsections;
  void *v9;
  void *v10;
  uint64_t v11;

  allowsSubsections = self->_allowsSubsections;
  v4 = -[REElementQueue visibleCount](self->_queue, "visibleCount");
  v5 = v4;
  if (!allowsSubsections)
    return v4;
  if (!v4)
    return 0;
  v6 = 0;
  v7 = 0;
  do
  {
    subsections = self->_subsections;
    -[REElementQueue elementAtIndex:](self->_queue, "elementAtIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](subsections, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = objc_msgSend(v10, "visibleCount");
    else
      v11 = 1;
    v7 += v11;

    ++v6;
  }
  while (v5 != v6);
  return v7;
}

- (int64_t)maximumElements
{
  return -[REElementQueue maximumRelevantElementsCount](self->_queue, "maximumRelevantElementsCount");
}

- (NSArray)allElements
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_elements, "allKeys");
}

- (void)addElement:(id)a3 forceHidden:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__RESection_addElement_forceHidden___block_invoke;
  v8[3] = &unk_24CF8C8B8;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[RESection _performOrEnqueueBlock:](self, "_performOrEnqueueBlock:", v8);

}

uint64_t __36__RESection_addElement_forceHidden___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addElement:forceHidden:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_addElement:(id)a3 forceHidden:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSMutableSet *hiddenElements;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSMutableDictionary *elements;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL8 v21;
  NSMutableDictionary *v22;
  void *v23;
  REElementQueue *queue;
  const __CFString *v25;
  const __CFString *v26;
  _BYTE v27[22];
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    hiddenElements = self->_hiddenElements;
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](hiddenElements, "addObject:", v9);

  }
  -[RESection _groupIdentifierForElement:](self, "_groupIdentifierForElement:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    RELogForDomain(6);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v25 = CFSTR("NO");
      *(_DWORD *)v27 = 138413058;
      *(_QWORD *)&v27[4] = self;
      if (v4)
        v25 = CFSTR("YES");
      *(_WORD *)&v27[12] = 2112;
      *(_QWORD *)&v27[14] = v7;
      v28 = 2112;
      v29 = v25;
      v30 = 2112;
      v31 = v10;
      _os_log_debug_impl(&dword_2132F7000, v11, OS_LOG_TYPE_DEBUG, "%@ add element %@ forceHidden %@ to subsection %@", v27, 0x2Au);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_subsections, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_10;
    -[RESection _groupForIdentifier:](self, "_groupForIdentifier:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RESection _createSectionForGroup:](self, "_createSectionForGroup:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v12 = (void *)v14;
      -[REElementQueue addElement:hidden:](self->_queue, "addElement:hidden:", v10, 1);
      RELogForDomain(6);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[RESection _addElement:forceHidden:].cold.3();

LABEL_10:
      elements = self->_elements;
      objc_msgSend(v7, "identifier", *(_OWORD *)v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setValue:forKey:](elements, "setValue:forKey:", v7, v17);

      objc_msgSend(v12, "addElement:forceHidden:", v7, v4);
      goto LABEL_21;
    }
    RELogForDomain(6);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[RESection _addElement:forceHidden:].cold.2();

    RELogForDomain(6);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[RESection _addElement:forceHidden:].cold.1();

  }
  RELogForDomain(6);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v26 = CFSTR("NO");
    *(_DWORD *)v27 = 138412802;
    *(_QWORD *)&v27[4] = self;
    *(_WORD *)&v27[12] = 2112;
    if (v4)
      v26 = CFSTR("YES");
    *(_QWORD *)&v27[14] = v7;
    v28 = 2112;
    v29 = v26;
    _os_log_debug_impl(&dword_2132F7000, v20, OS_LOG_TYPE_DEBUG, "%@ add element %@ forceHidden %@", v27, 0x20u);
  }

  v21 = v4 || -[REMLElementComparator shouldHideElement:](self->_comparator, "shouldHideElement:", v7);
  v22 = self->_elements;
  objc_msgSend(v7, "identifier", *(_QWORD *)v27, *(_QWORD *)&v27[8]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](v22, "setValue:forKey:", v7, v23);

  queue = self->_queue;
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REElementQueue addElement:hidden:](queue, "addElement:hidden:", v12, v21);
LABEL_21:

}

- (void)removeElementWithId:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__RESection_removeElementWithId___block_invoke;
  v6[3] = &unk_24CF8AB18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[RESection _performOrEnqueueBlock:](self, "_performOrEnqueueBlock:", v6);

}

uint64_t __33__RESection_removeElementWithId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeElementWithId:", *(_QWORD *)(a1 + 40));
}

- (void)_removeElementWithId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  RESection *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_elements, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RESection _groupIdentifierForElement:](self, "_groupIdentifierForElement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    RELogForDomain(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412802;
      v14 = self;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v6;
      _os_log_debug_impl(&dword_2132F7000, v7, OS_LOG_TYPE_DEBUG, "%@ remove element %@ from subsection %@", (uint8_t *)&v13, 0x20u);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_subsections, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "removeElementWithId:", v4);
      -[NSMutableDictionary removeObjectForKey:](self->_elements, "removeObjectForKey:", v4);
      -[NSMutableSet removeObject:](self->_hiddenElements, "removeObject:", v4);
      if (!objc_msgSend(v9, "count"))
      {
        -[REElementQueue removeElement:](self->_queue, "removeElement:", v6);
        -[NSMutableDictionary removeObjectForKey:](self->_subsections, "removeObjectForKey:", v6);
        RELogForDomain(6);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[RESection _removeElementWithId:].cold.3();

      }
      goto LABEL_16;
    }
    RELogForDomain(6);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[RESection _addElement:forceHidden:].cold.1();

  }
  RELogForDomain(6);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[RESection _removeElementWithId:].cold.1();

  -[REElementQueue removeElement:](self->_queue, "removeElement:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_elements, "removeObjectForKey:", v4);
  -[NSMutableSet removeObject:](self->_hiddenElements, "removeObject:", v4);
LABEL_16:

}

- (void)updateElementWithId:(id)a3 withNewFeatureSet:(id)a4 forceHidden:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__RESection_updateElementWithId_withNewFeatureSet_forceHidden___block_invoke;
  v12[3] = &unk_24CF8C8E0;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[RESection _performOrEnqueueBlock:](self, "_performOrEnqueueBlock:", v12);

}

uint64_t __63__RESection_updateElementWithId_withNewFeatureSet_forceHidden___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateElementWithId:withNewFeatureSet:forceHidden:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)_updateElementWithId:(id)a3 withNewFeatureSet:(id)a4 forceHidden:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  __CFString *v14;
  char v15;
  NSObject *v16;
  REMLElement *v17;
  NSMutableSet *hiddenElements;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  _BOOL8 v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  RESection *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  __CFString *v36;
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (__CFString *)a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_elements, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  -[RESection _groupIdentifierForElement:](self, "_groupIdentifierForElement:", v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __64__RESection__updateElementWithId_withNewFeatureSet_forceHidden___block_invoke;
  v25[3] = &unk_24CF8AE28;
  v13 = v11;
  v26 = v13;
  -[__CFString enumerateFeaturesUsingBlock:](v9, "enumerateFeaturesUsingBlock:", v25);
  -[RESection _groupIdentifierForElement:](self, "_groupIdentifierForElement:", v13);
  v14 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v12 == v14)
  {

  }
  else
  {
    v15 = -[__CFString isEqual:](v12, "isEqual:", v14);

    if ((v15 & 1) == 0)
    {
      RELogForDomain(6);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v28 = self;
        v29 = 2112;
        v30 = v8;
        v31 = 2112;
        v32 = v12;
        v33 = 2112;
        v34 = v14;
        _os_log_debug_impl(&dword_2132F7000, v16, OS_LOG_TYPE_DEBUG, "%@ trying to change group of element %@ from %@ to %@", buf, 0x2Au);
      }

      -[RESection removeElementWithId:](self, "removeElementWithId:", v8);
      v17 = -[REMLElement initWithIdentifier:featureMap:]([REMLElement alloc], "initWithIdentifier:featureMap:", v8, v9);
      -[RESection addElement:forceHidden:](self, "addElement:forceHidden:", v17, v5);

      goto LABEL_18;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elements, "setObject:forKeyedSubscript:", v13, v8);
  hiddenElements = self->_hiddenElements;
  if (v5)
    -[NSMutableSet addObject:](hiddenElements, "addObject:", v8);
  else
    -[NSMutableSet removeObject:](hiddenElements, "removeObject:", v8);
  RELogForDomain(6);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    if (v20)
    {
      v23 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v28 = self;
      if (v5)
        v23 = CFSTR("YES");
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v23;
      v35 = 2112;
      v36 = v14;
      _os_log_debug_impl(&dword_2132F7000, v19, OS_LOG_TYPE_DEBUG, "%@ update element %@ with feature set %@ forceHidden %@ to subsection %@", buf, 0x34u);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_subsections, "objectForKeyedSubscript:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateElementWithId:withNewFeatureSet:forceHidden:", v8, v9, v5);

  }
  else
  {
    if (v20)
    {
      v24 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v28 = self;
      if (v5)
        v24 = CFSTR("YES");
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v24;
      _os_log_debug_impl(&dword_2132F7000, v19, OS_LOG_TYPE_DEBUG, "%@ update element %@ with feature set %@ forceHidden %@", buf, 0x2Au);
    }

    v22 = v5 || -[REMLElementComparator shouldHideElement:](self->_comparator, "shouldHideElement:", v13);
    -[REElementQueue updatePositionForElement:hidden:](self->_queue, "updatePositionForElement:hidden:", v8, v22);
  }
LABEL_18:

}

void __64__RESection__updateElementWithId_withNewFeatureSet_forceHidden___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "featureMap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forFeature:", a3, v5);

}

- (void)_performOrEnqueueBlock:(id)a3
{
  NSMutableArray *batchBlocks;
  id v5;

  if (self->_performingBatch)
  {
    batchBlocks = self->_batchBlocks;
    v5 = (id)MEMORY[0x2199B2434](a3, a2);
    -[NSMutableArray addObject:](batchBlocks, "addObject:");
  }
  else
  {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    -[RESection delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sectionDidUpdateContentOrder:", self);
  }

}

- (void)performBatchUpdates:(id)a3
{
  id v4;
  void *v5;
  REElementQueue *queue;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  v5 = v4;
  self->_performingBatch = 1;
  if (v4)
    (*((void (**)(id))v4 + 2))(v4);
  self->_performingBatch = 0;
  if (-[NSMutableArray count](self->_batchBlocks, "count"))
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __33__RESection_performBatchUpdates___block_invoke;
    v8[3] = &unk_24CF8AAF0;
    v8[4] = self;
    -[REElementQueue performBatchUpdates:](queue, "performBatchUpdates:", v8);
    -[NSMutableArray removeAllObjects](self->_batchBlocks, "removeAllObjects");
    -[RESection delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionDidUpdateContentOrder:", self);

  }
}

void __33__RESection_performBatchUpdates___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (BOOL)containsElementWithId:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_elements, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)indexOfElementWithId:(id)a3
{
  id v4;
  void *v5;
  REElementQueue *queue;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_elements, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_11;
  queue = self->_queue;
  if (!self->_subsections)
  {
    v10 = -[REElementQueue indexOfElement:](queue, "indexOfElement:", v4);
    goto LABEL_15;
  }
  v7 = -[REElementQueue visibleCount](queue, "visibleCount");
  if (v7 >= 1)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      -[REElementQueue elementAtIndex:](self->_queue, "elementAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", v4))
        break;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_subsections, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = objc_msgSend(v12, "indexOfElementWithId:", v4);
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 += v14;

          break;
        }
        v15 = objc_msgSend(v13, "visibleCount");
      }
      else
      {
        v15 = 1;
      }
      v10 += v15;

      if (v8 == ++v9)
        goto LABEL_11;
    }

  }
  else
  {
LABEL_11:
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_15:

  return v10;
}

- (id)elementIdAtIndex:(unint64_t)a3
{
  unint64_t v3;
  _BOOL4 allowsSubsections;
  REElementQueue *queue;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  allowsSubsections = self->_allowsSubsections;
  queue = self->_queue;
  if (!allowsSubsections)
  {
    -[REElementQueue elementAtIndex:](queue, "elementAtIndex:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    return v13;
  }
  v7 = -[REElementQueue visibleCount](queue, "visibleCount");
  if (v7 < 1)
  {
LABEL_10:
    v13 = 0;
    return v13;
  }
  v8 = v7;
  v9 = 0;
  while (1)
  {
    -[REElementQueue elementAtIndex:](self->_queue, "elementAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_subsections, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
      break;
    if (objc_msgSend(v11, "visibleCount") > v3)
    {
      objc_msgSend(v12, "elementIdAtIndex:", v3);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v3 -= objc_msgSend(v12, "visibleCount");
LABEL_9:

    if (v8 == ++v9)
      goto LABEL_10;
  }
  if (v3)
  {
    --v3;
    goto LABEL_9;
  }
  v14 = v10;
LABEL_14:
  v13 = v14;

  return v13;
}

- (int64_t)_mappedIndexFromIndex:(int64_t)a3
{
  int64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (!self->_allowsSubsections)
    return a3;
  if (a3 < 1)
    return 0;
  v5 = 0;
  for (i = 0; i != a3; ++i)
  {
    -[REElementQueue elementAtIndex:](self->_queue, "elementAtIndex:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_subsections, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "visibleCount");
    else
      v10 = 1;
    v5 += v10;

  }
  return v5;
}

- (void)sectionDidUpdateContentOrder:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  RELogForDomain(6);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[RESection sectionDidUpdateContentOrder:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__RESection_sectionDidUpdateContentOrder___block_invoke;
  v13[3] = &unk_24CF8AB18;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  -[RESection _performOrEnqueueBlock:](self, "_performOrEnqueueBlock:", v13);

}

void __42__RESection_sectionDidUpdateContentOrder___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatePositionForElement:hidden:", v3, objc_msgSend(*(id *)(a1 + 40), "visibleCount") == 0);

}

- (id)section:(id)a3 groupForIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[RESection delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "section:groupForIdentifier:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)elements
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_elements, "allValues");
}

- (REMLElementComparator)comparator
{
  return self->_comparator;
}

- (RESectionDelegate)delegate
{
  return (RESectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_comparator, 0);
  objc_storeStrong((id *)&self->_batchBlocks, 0);
  objc_storeStrong((id *)&self->_subsections, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_hiddenElements, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)setComparator:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2132F7000, a2, a3, "%@ finish loading new comparator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)setComparator:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2132F7000, a2, a3, "%@ begin loading new comparator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_addElement:forceHidden:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_2132F7000, v0, v1, "%@ no subsections available for element %@");
  OUTLINED_FUNCTION_3();
}

- (void)_addElement:forceHidden:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_2132F7000, v0, v1, "%@ not creating new subsection for identifier %@");
  OUTLINED_FUNCTION_3();
}

- (void)_addElement:forceHidden:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_2132F7000, v0, v1, "%@ creating new subsection %@");
  OUTLINED_FUNCTION_3();
}

- (void)_removeElementWithId:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_2132F7000, v0, v1, "%@ remove element %@");
  OUTLINED_FUNCTION_3();
}

- (void)_removeElementWithId:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_2132F7000, v0, v1, "%@ removing empty subsection %@");
  OUTLINED_FUNCTION_3();
}

- (void)sectionDidUpdateContentOrder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2132F7000, a2, a3, "Section (%@) did update content", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
