@implementation AFClientLite(SVXAceCommandHandling)

- (void)handleAceCommand:()SVXAceCommandHandling reply:
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BE09258];
  v8 = a3;
  v9 = [v7 alloc];
  v10 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __62__AFClientLite_SVXAceCommandHandling__handleAceCommand_reply___block_invoke;
  v20[3] = &unk_24D24C4A0;
  v21 = v6;
  v11 = v6;
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __62__AFClientLite_SVXAceCommandHandling__handleAceCommand_reply___block_invoke_2;
  v18[3] = &unk_24D24C4C8;
  v12 = (id)objc_msgSend(v9, "initWithBlock:", v20);
  v19 = v12;
  v13 = (void *)MEMORY[0x2199D950C](v18);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __62__AFClientLite_SVXAceCommandHandling__handleAceCommand_reply___block_invoke_3;
  v16[3] = &unk_24D24C4F0;
  v17 = v12;
  v14 = v12;
  v15 = (void *)MEMORY[0x2199D950C](v16);
  objc_msgSend(a1, "handleCommand:afterCurrentRequest:commandHandler:completion:", v8, 0, v13, v15);

}

@end
