@implementation BRCPCSChainBreadthEnumerator

- (BRCPCSChainBreadthEnumerator)initWithPCSChainInfo:(id)a3 clientZone:(id)a4
{
  id v7;
  id v8;
  BRCPCSChainBreadthEnumerator *v9;
  BRCPCSChainBreadthEnumerator *v10;
  void *v11;
  uint64_t v12;
  PQLEnumeration *enumerator;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BRCPCSChainBreadthEnumerator;
  v9 = -[BRCPCSChainBreadthEnumerator init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_chainInfo, a3);
    -[BRCPCSChainInfo itemID](v10->_chainInfo, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unchainedItemInfoInServerTruthEnumeratorParentedTo:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    enumerator = v10->_enumerator;
    v10->_enumerator = (PQLEnumeration *)v12;

  }
  return v10;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  PQLEnumeration *enumerator;

  -[PQLEnumeration nextObject](self->_enumerator, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "itemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BRCPCSChainBreadthEnumerator nextObject].cold.1();

    }
  }
  else
  {
    enumerator = self->_enumerator;
    self->_enumerator = 0;

  }
  return v4;
}

- (id)chainInfo
{
  return self->_chainInfo;
}

- (void)dealloc
{
  objc_super v3;

  -[PQLEnumeration close](self->_enumerator, "close");
  v3.receiver = self;
  v3.super_class = (Class)BRCPCSChainBreadthEnumerator;
  -[BRCPCSChainBreadthEnumerator dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_chainInfo, 0);
}

- (void)nextObject
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: info.itemID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
