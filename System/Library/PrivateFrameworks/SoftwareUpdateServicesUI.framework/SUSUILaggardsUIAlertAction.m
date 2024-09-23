@implementation SUSUILaggardsUIAlertAction

- (SUSUILaggardsUIAlertAction)initWithDescriptor:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SUSUILaggardsUIAlertAction *v9;
  id v10;
  id v11;
  SUSUILaggardsUIAlertAction *v12;
  objc_super v13;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(_QWORD *, void *);
  void *v18;
  SUSUILaggardsUIAlertAction *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location[2];
  SUSUILaggardsUIAlertAction *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  objc_storeStrong((id *)&v25->_descriptor, location[0]);
  v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  -[SUSUILaggardsUIAlertAction encodeWithCoder:](v25, "encodeWithCoder:", v22);
  v21 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  v6 = v21;
  v7 = (id)objc_msgSend(v22, "encodedData");
  objc_msgSend(v6, "setObject:forSetting:");

  v9 = v25;
  v10 = v21;
  v8 = (void *)MEMORY[0x24BE0BD88];
  v14 = MEMORY[0x24BDAC760];
  v15 = -1073741824;
  v16 = 0;
  v17 = __65__SUSUILaggardsUIAlertAction_initWithDescriptor_completionBlock___block_invoke;
  v18 = &unk_24DA42588;
  v19 = v25;
  v20 = v23;
  v11 = (id)objc_msgSend(v8, "responderWithHandler:");
  v25 = 0;
  v13.receiver = v9;
  v13.super_class = (Class)SUSUILaggardsUIAlertAction;
  v25 = -[SUSUILaggardsUIAlertAction initWithInfo:responder:](&v13, sel_initWithInfo_responder_, v10);
  v12 = v25;

  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v12;
}

void __65__SUSUILaggardsUIAlertAction_initWithDescriptor_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v2;
  const __CFString *v3;
  NSObject *log;
  os_log_type_t type;
  id v7;
  char IsYes;
  id v9;
  os_log_type_t v10;
  id v11;
  char v12;
  _QWORD *v13;
  id location[2];
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13 = a1;
  v7 = (id)objc_msgSend(location[0], "info");
  objc_msgSend(v7, "flagForSetting:", SUSUILaggardsUIAlertActionOutputSuccess);
  IsYes = BSSettingFlagIsYes();

  v12 = IsYes & 1;
  v11 = SUSUILog();
  v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    type = v10;
    v2 = (id)objc_opt_class();
    v9 = v2;
    if ((v12 & 1) != 0)
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v2, (uint64_t)v3);
    _os_log_impl(&dword_218F45000, log, type, "%@ got response: %@", v15, 0x16u);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v11, 0);
  if (a1[5])
    (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
}

- (SUDescriptor)descriptor
{
  -[SUSUILaggardsUIAlertAction loadIfNecessary](self, "loadIfNecessary", a2);
  return self->_descriptor;
}

- (void)loadIfNecessary
{
  id v2;
  id v3;
  id v4;
  id v5[2];
  SUSUILaggardsUIAlertAction *v6;

  v6 = self;
  v5[1] = (id)a2;
  if (!self->_loaded)
  {
    v3 = (id)-[SUSUILaggardsUIAlertAction info](v6, "info");
    v5[0] = (id)objc_msgSend(v3, "objectForSetting:", SUSUILaggardsUIAlertActionInput);

    v2 = objc_alloc(MEMORY[0x24BDD1620]);
    v4 = (id)objc_msgSend(v2, "initForReadingFromData:error:", v5[0]);
    -[SUSUILaggardsUIAlertAction decodeFromCoder:](v6, "decodeFromCoder:", v4);
    objc_msgSend(v4, "finishDecoding");
    v6->_loaded = 1;
    objc_storeStrong(&v4, 0);
    objc_storeStrong(v5, 0);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id location[2];
  SUSUILaggardsUIAlertAction *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_descriptor)
    objc_msgSend(location[0], "encodeObject:forKey:", v4->_descriptor, CFSTR("_susDescriptor"));
  objc_storeStrong(location, 0);
}

- (void)decodeFromCoder:(id)a3
{
  SUDescriptor *v3;
  SUDescriptor *descriptor;
  id location[2];
  SUSUILaggardsUIAlertAction *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (SUDescriptor *)(id)objc_msgSend(location[0], "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_susDescriptor"));
  descriptor = v6->_descriptor;
  v6->_descriptor = v3;

  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
