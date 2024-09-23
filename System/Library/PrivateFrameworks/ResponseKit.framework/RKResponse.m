@implementation RKResponse

void __19___RKResponse_type__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[11];
  _QWORD v14[13];

  v14[11] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("Postpone");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v13[1] = CFSTR("YesNo");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v0;
  v13[2] = CFSTR("YesNoRequest");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v1;
  v13[3] = CFSTR("NotSure");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v2;
  v13[4] = CFSTR("GoodBadOk");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v3;
  v13[5] = CFSTR("GoodBadOkState");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v4;
  v13[6] = CFSTR("DontKnow");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v5;
  v13[7] = CFSTR("Acknowledgment");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v6;
  v13[8] = CFSTR("YouAreWelcome");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v7;
  v13[9] = CFSTR("LocationSelf");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v8;
  v13[10] = CFSTR("CloseFar");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)type_sSpeechActResponseType;
  type_sSpeechActResponseType = v10;

}

- (RKResponse)initWithString:(id)a3 attributes:(id)a4 category:(id)a5
{
  id v9;
  id v10;
  id v11;
  RKResponse *v12;
  RKResponse *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RKResponse;
  v12 = -[RKResponse init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_string, a3);
    objc_storeStrong((id *)&v13->_attributes, a4);
    objc_storeStrong((id *)&v13->_category, a5);
  }

  return v13;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
