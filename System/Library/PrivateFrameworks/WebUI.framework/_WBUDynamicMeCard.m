@implementation _WBUDynamicMeCard

- (id)me
{
  return self->_me;
}

- (_WBUDynamicMeCard)init
{
  _WBUDynamicMeCard *v2;
  void *v3;
  id v4;
  _WBUDynamicMeCard *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WBUDynamicMeCard;
  v2 = -[_WBUDynamicMeCard init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__meCardChanged_, *MEMORY[0x24BDBA3D8], 0);

    v4 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    v2->_meCardExists = +[WBUFormDataController contactStoreHasMeCard:](WBUFormDataController, "contactStoreHasMeCard:", v4);

    v5 = v2;
  }

  return v2;
}

- (void)_meCardChanged:(id)a3
{
  CNContact *me;
  id v5;

  me = self->_me;
  self->_me = 0;

  v5 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  self->_meCardExists = +[WBUFormDataController contactStoreHasMeCard:](WBUFormDataController, "contactStoreHasMeCard:", v5);

}

- (id)valueForProperty:(id)a3 contact:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = a4;
  +[WBSFormDataController contactKeyForString:](WBUFormDataController, "contactKeyForString:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "valueForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)performWhenReady:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  NSMutableArray *blocksPendingMeCard;
  void *v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_me)
  {
    v4[2](v4);
    v6 = v5;
  }
  else
  {
    v6 = (void *)objc_msgSend(v4, "copy");

    blocksPendingMeCard = self->_blocksPendingMeCard;
    if (blocksPendingMeCard)
    {
      v8 = (void *)MEMORY[0x212BD7EA4](v6);
      -[NSMutableArray addObject:](blocksPendingMeCard, "addObject:", v8);

    }
    else
    {
      v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v10 = (void *)MEMORY[0x212BD7EA4](v6);
      v11 = (NSMutableArray *)objc_msgSend(v9, "initWithObjects:", v10, 0);
      v12 = self->_blocksPendingMeCard;
      self->_blocksPendingMeCard = v11;

      v13 = MEMORY[0x24BDAC760];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __38___WBUDynamicMeCard_performWhenReady___block_invoke;
      v18[3] = &unk_24CB8D588;
      v18[4] = self;
      v14 = (void *)MEMORY[0x212BD7EA4](v18);
      if (objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0) == 3)
      {
        -[_WBUDynamicMeCard _fetchContactKeysWithHandler:](self, "_fetchContactKeysWithHandler:", v14);
      }
      else
      {
        v15 = objc_alloc_init(MEMORY[0x24BDBACF8]);
        v16[0] = v13;
        v16[1] = 3221225472;
        v16[2] = __38___WBUDynamicMeCard_performWhenReady___block_invoke_3;
        v16[3] = &unk_24CB8D5B0;
        v16[4] = self;
        v17 = v14;
        objc_msgSend(v15, "requestAccessForEntityType:completionHandler:", 0, v16);

      }
    }
  }

}

- (void)_fetchContactKeysWithHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBAD08], "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  dispatch_get_global_queue(25, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50___WBUDynamicMeCard__fetchContactKeysWithHandler___block_invoke;
  block[3] = &unk_24CB8D5D8;
  v14 = v8;
  v15 = v7;
  v16 = v3;
  v10 = v3;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, block);

}

+ (id)_contactObjectComponentForString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[8];
  _QWORD v17[9];

  v17[8] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)_contactObjectComponentForString__map;
  if (!_contactObjectComponentForString__map)
  {
    v5 = *MEMORY[0x24BDBABF8];
    v16[0] = CFSTR("Street");
    v16[1] = CFSTR("City");
    v6 = *MEMORY[0x24BDBABC0];
    v17[0] = v5;
    v17[1] = v6;
    v7 = *MEMORY[0x24BDBABF0];
    v16[2] = CFSTR("State");
    v16[3] = CFSTR("ZIP");
    v8 = *MEMORY[0x24BDBABE0];
    v17[2] = v7;
    v17[3] = v8;
    v9 = *MEMORY[0x24BDBABC8];
    v16[4] = CFSTR("Country");
    v16[5] = CFSTR("ISOCountry");
    v10 = *MEMORY[0x24BDBABD0];
    v17[4] = v9;
    v17[5] = v10;
    v16[6] = CFSTR("Username");
    v16[7] = CFSTR("Service");
    v11 = *MEMORY[0x24BDBA468];
    v17[6] = *MEMORY[0x24BDBA470];
    v17[7] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)_contactObjectComponentForString__map;
    _contactObjectComponentForString__map = v12;

    v4 = (void *)_contactObjectComponentForString__map;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)meCardExists
{
  return self->_meCardExists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_blocksPendingMeCard, 0);
}

@end
