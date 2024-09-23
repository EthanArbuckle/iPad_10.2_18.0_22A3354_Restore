@implementation PKPrintdRPC_BrowseClient

- (PKPrintdRPC_BrowseClient)initWithInfo:(id)a3 provenance:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  id v9;
  PKPrintdRPC_BrowseClient *v10;
  uint64_t v11;
  NSDictionary *infoDictionary;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPrintdRPC_BrowseClient;
  v10 = -[PKPrinterTool_Client init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    infoDictionary = v10->_infoDictionary;
    v10->_infoDictionary = (NSDictionary *)v11;

    v10->_provenance = a4;
    objc_storeStrong((id *)&v10->_delegate, a5);
  }

  return v10;
}

- (id)ptConn_locked
{
  void *v3;
  void *v4;
  NSObject *v6;
  const char **v7;
  const char *v8;
  NSObject *v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPrintdRPC_BrowseClient;
  -[PKPrinterTool_Client ptConn_locked](&v11, sel_ptConn_locked);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    getPrintdRPCBrowseProtocolInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->super._conn, "setExportedInterface:", v4);

    -[NSXPCConnection setExportedObject:](self->super._conn, "setExportedObject:", self->_delegate);
  }
  else
  {
    _PKLogCategory(PKLogCategoryFramework);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_220F9A000, v6, OS_LOG_TYPE_ERROR, "Cannot connect to PrinterTool", v10, 2u);
    }

    v7 = (const char **)_CFGetProgname();
    if (v7)
    {
      v8 = *v7;
      if (v8)
      {
        if (!strcmp(v8, "grappler"))
        {
          _PKLogCategory(PKLogCategoryFramework);
          v9 = objc_claimAutoreleasedReturnValue();
          -[PKPrintdRPC_BrowseClient ptConn_locked].cold.1(v9);

          abort();
        }
      }
    }
  }
  return v3;
}

- (void)startBrowsing
{
  void *v3;
  id v4;

  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "startBrowsing:provenance:", self->_infoDictionary, self->_provenance);

}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPrintdRPC_BrowseClient;
  -[PKPrinterTool_Client invalidate](&v2, sel_invalidate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
}

- (void)ptConn_locked
{
  uint8_t v2[16];

  if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_220F9A000, a1, OS_LOG_TYPE_ERROR, "XPC Service not found, check for valid installation or use GRAPPLER_IS_PRINTERTOOL", v2, 2u);
  }
  OUTLINED_FUNCTION_0();
}

@end
