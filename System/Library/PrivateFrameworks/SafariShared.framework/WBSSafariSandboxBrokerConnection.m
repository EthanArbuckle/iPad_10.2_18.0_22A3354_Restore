@implementation WBSSafariSandboxBrokerConnection

- (void)ensureConnected:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__WBSSafariSandboxBrokerConnection_ensureConnected___block_invoke;
  v6[3] = &unk_1E4B3F310;
  v7 = v4;
  v5 = v4;
  -[WBSSafariSandboxBrokerConnection _connectionWithCompletionHandler:](self, "_connectionWithCompletionHandler:", v6);

}

uint64_t __52__WBSSafariSandboxBrokerConnection_ensureConnected___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
