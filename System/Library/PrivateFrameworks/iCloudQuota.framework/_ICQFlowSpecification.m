@implementation _ICQFlowSpecification

- (_ICQFlowSpecification)initWithPages:(id)a3
{
  id v4;
  _ICQFlowSpecification *v5;
  uint64_t v6;
  _ICQPageSpecification *startPage;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *pagesByIdentifier;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_ICQFlowSpecification;
  v5 = -[_ICQFlowSpecification init](&v23, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v6 = objc_claimAutoreleasedReturnValue();
      startPage = v5->_startPage;
      v5->_startPage = (_ICQPageSpecification *)v6;
    }
    else
    {
      startPage = v5->_startPage;
      v5->_startPage = 0;
    }

    v8 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "pageIdentifier", (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }

    v16 = objc_msgSend(v8, "copy");
    pagesByIdentifier = v5->_pagesByIdentifier;
    v5->_pagesByIdentifier = (NSDictionary *)v16;

  }
  return v5;
}

- (_ICQPageSpecification)startPage
{
  return self->_startPage;
}

- (NSDictionary)pagesByIdentifier
{
  return self->_pagesByIdentifier;
}

- (_ICQAlertSpecification)startAlert
{
  return self->_startAlert;
}

- (void)setStartAlert:(id)a3
{
  objc_storeStrong((id *)&self->_startAlert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startAlert, 0);
  objc_storeStrong((id *)&self->_pagesByIdentifier, 0);
  objc_storeStrong((id *)&self->_startPage, 0);
}

@end
