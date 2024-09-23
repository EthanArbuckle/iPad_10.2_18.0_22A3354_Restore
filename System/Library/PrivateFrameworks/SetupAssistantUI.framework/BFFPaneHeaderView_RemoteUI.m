@implementation BFFPaneHeaderView_RemoteUI

- (BFFPaneHeaderView_RemoteUI)initWithAttributes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BFFPaneHeaderView_RemoteUI;
  return -[BFFPaneHeaderView initWithFrame:](&v4, sel_initWithFrame_, a3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)setText:(id)a3 attributes:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[BFFPaneHeaderView detailTextLabel](self, "detailTextLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)setSubHeaderText:(id)a3 attributes:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[BFFPaneHeaderView subLabel](self, "subLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)setDetailText:(id)a3 attributes:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_214875000, v4, OS_LOG_TYPE_DEFAULT, "Detail text is not supported with setupAssistant-style title headers", v5, 2u);
  }

}

- (void)setImageAlignment:(int)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214875000, v3, OS_LOG_TYPE_DEFAULT, "Image alignment is not supported with setupAssistant-style title headers", v4, 2u);
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_rui_headerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rui_headerDelegate);
}

@end
